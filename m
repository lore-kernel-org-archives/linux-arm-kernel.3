Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D98106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUnAL/HDMFp5BhdQcFLL0KxkT1Hbv3v6h13dMnx62Js=; b=PCz/qFffSOR5bv9xwaxeYojh1y
	BVEeRD3s2AQWMQH4Y3IVSOedo3eFoI3pr+Dih9hkXj3qNcjqJMShNb7UtzQQ/KpgphpT3m5+VDDt3
	CC5jVW5WVzGAPhc79JRcw3FGYEG8C2jzgAlS7YOvF6EpFcxr0Ua33ahb6QnclkIXeHzhywHHwgYwh
	PGKGyc04+qvajnsspZMstfCajmO9Q/3rJ6HqogdCTDIu5oW8Q+SV6/R+6169POQ1wr22iweECis6j
	7KvY8rLyneacFlI1Jx3C7JwtKt/Dz6HhMZt0ME0mR/H4nTYl+EtcUno+Cbr6J8nGs/4N8LLxRA8UO
	mPV5sjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h1u-0000000EDCp-2MP2;
	Thu, 12 Mar 2026 14:28:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h1t-0000000EDCM-2Xbv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83D0561335;
	Thu, 12 Mar 2026 14:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0C1C19424;
	Thu, 12 Mar 2026 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773325728;
	bh=0ml+Q98EptT34egOhj01zpNadcyKErIvcXbVRXe78rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/R2MqkxRaFGdDrypldqAySx0xX7uGfp8X8A7zHUS7U85/Cx368kUAYo/jEGxsO3s
	 4xDzMTHXsUB764cDYP2Px27NmK7zmVOFF4hci1QSAX7cVgxhQUa8uIi4ZP1YduRsLJ
	 R6FnsuUQDBONV0meUbOY1pV1okHzQK5HO225St/TSAOXKm/IHqkX6TeY99MG+ECU6t
	 lz0F0dEh59g/fFpWOBzeyeRIxEnR+VeRnq+iAfzggGeTxVJSo2QrE7RdwfCxtgHBrl
	 pkwhtEE0SbG6GNreY8KwNbFKA/o6AfDippUvoDhEKyURQ8exW+YcSVDgbvMGiO+4u5
	 2u5CqUd9/0Uiw==
Date: Thu, 12 Mar 2026 14:28:43 +0000
From: Will Deacon <will@kernel.org>
To: "feng.zhou" <realsummitzhou@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, robin.murphy@arm.com
Subject: Re: [QUESTION] ARM DSU PMU: 32-bit counter assumption and handling
 of 64-bit event counters
Message-ID: <abLNm2gs8qszYVWK@willie-the-truck>
References: <20260206035138.1377-1-realsummitzhou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206035138.1377-1-realsummitzhou@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

[+Robin and Suzuki]

On Fri, Feb 06, 2026 at 11:51:38AM +0800, feng.zhou wrote:
> Hi Will and Mark,
> 
> I have a question regarding the ARM DSU PMU driver implementation in
> drivers/perf/arm_dsu_pmu.c, specifically about the counter width
> assumptions.
> 
> Current Implementation:
> ======================
> The driver currently assumes all event counters are 32-bit wide, with
> only the cycle counter being 64-bit (lines 69-71):
> 
> /* All event counters are 32bit, with a 64bit Cycle counter */
> #define DSU_PMU_COUNTER_WIDTH(idx)	\
> 	(((idx) == DSU_PMU_IDX_CYCLE_COUNTER) ? 64 : 32)
> 
> This assumption is used throughout the code for handling counter
> overflow and calculating deltas (e.g., line 344 in dsu_pmu_event_update).
> 
> Issue Observed:
> ===============
> I've encountered overflow issues when using perf tools on newer ARM CPUs
> where the event counters appear to be 64-bit rather than 32-bit. The
> current implementation causes incorrect event counting and potential data
> loss due to premature overflow handling based on the 32-bit mask.

I suspect either the hardware or the architecture have evolved since the
driver was initially written, possibly in a non-backwards-compatible way
which is why you see problems.

> Questions:
> ==========
> 1. Is the 32-bit event counter assumption based on the ARMv8 PMU
>    specification or DSU-specific hardware documentation?
> 
> 2. Are there known ARM CPU implementations where DSU event counters
>    exceed 32 bits? If so, how should the driver handle this variation?
> 
> 3. Would it be appropriate to detect the actual counter width at runtime
>    (similar to how num_counters is probed in dsu_pmu_probe_pmu), or
>    should this be handled through device tree / ACPI properties?
> 
> 4. Should there be a mechanism to query the hardware for the actual
>    counter width to ensure compatibility with future implementations?
> 
> Thank you for your time and any insights you can provide.

Suzuki and Robin should be able to help with these...

Will

