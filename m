Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE72C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmQRvX1k1SiKuSCh+skMmpVu8Z7eNcE8mftGlIJOuk8=; b=BiWXtp6mhz0Pvmp2dUGofQUk8n
	F55ryZa/FhYqTp/8X3Zr2kAmFsHQXbE6sdRglkd8EypAiTtSEj+3Gk72sDs0RtvG2Y6rjkqoy5W26
	MLVNKWmpDfCFpD6W9v0WdchjHFjbXCheOZMnNHJMf27MAPZaRxGX5sisapoNUKUK7oV3/OuBktAbH
	rZ/PIo3zoQnSI/uxDhD6OVcCQs0RKStzJP9J+gmMVyWgfIB0Qu9rD5Uxvw3ogfQZPaV9FqNCdPq8g
	c9YxPZ3VZtjTS0mVsQQVZMuuaF6Jz9PEtO6XL9jobruLyOVdNFXCq2RIcaIipMmQLRbmBcHSIdbrE
	H79AaLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtReU-0000000C9il-24Fh;
	Mon, 10 Aug 2026 15:10:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtReS-0000000C9iO-1S5t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A44BF60120;
	Mon, 10 Aug 2026 15:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5DF1F000E9;
	Mon, 10 Aug 2026 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786374655;
	bh=jmQRvX1k1SiKuSCh+skMmpVu8Z7eNcE8mftGlIJOuk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jF8fta5j/+/mrM3hVm4vX69fI1bUZxljfWcwWwLlrbTYVwhzgYQLijGA8xol4fxrT
	 ymOxLPxU0YM+Df7HzHy40vOpGPdhA2Y/+Uqrh3eDT+8ydsYYwFyvVaCPUj/58Nw6hc
	 UrUqCb3juBU7LblPWvsqWlwTK7y1eApb69j/im0bYqVnTtHbXCJ/MHwm4aTWz4XHvA
	 Jb+Pyq/9guNk7AV1Q4V+iXY1Scpmt8Sxu/I/+28Y7OfxNNurhcH+7iYAAod+s9++Lf
	 L8LINXKHQre61zJW8Gi4haetO0sHYI40UNG2PWJViSF9UHnCrRbUeEU4/qhuF5vLc/
	 p9+4ZzsbZT38A==
Date: Mon, 10 Aug 2026 16:10:48 +0100
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Michiel van Tol <michiel.vantol@arm.com>,
	Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@kernel.org>,
	Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/2] perf: arm_spe: Prefer large AUX mappings
Message-ID: <annp-BdTviQoH6vy@willie-the-truck>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
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

On Mon, Aug 10, 2026 at 03:44:42PM +0100, Leo Yan wrote:
> Commit 18049c8cff9c ("perf/aux: Allocate non-contiguous AUX pages by
> default") made the AUX allocator use order-0 pages by default unless a
> PMU explicitly asks for contiguous allocations.

But that commit specifically calls out SPE as benefitting from
non-contiguous pages:

  "For instance, ARM SPE and TRBE operate with virtual pages, and
   Coresight ETR allocates a separate buffer. For these PMUs,
   allocating contiguous AUX pages unnecessarily exacerbates memory
   fragmentation. This fragmentation can prevent their use on
   long-running devices."

so why doesn't passing PERF_PMU_CAP_AUX_PREFER_LARGE reintroduce the
problems that 18049c8cff9c was trying to solve?

Will

