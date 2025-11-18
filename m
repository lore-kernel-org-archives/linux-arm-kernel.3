Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380A9CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X7Yo+YYb8oo5DRAUEhwjEzoyI0eBfVeEDwBlVes3T8=; b=oql3WjrbWUTqrnUSc79/EEakla
	rzrGKURYPSMmaSz65+KZ7mTE6nrj7mOCY4Dguqhc1ZNl5KBT/DlhYtA6kBAqt1sQeoByrq9Gy7Qxg
	YtOfR9beRVUO5fAY2tkBTnh//UjYKrL4KiyB5nlrU7oVNnOVaa+oV8HN+1Vy10+zMD46No0oMBOn+
	92glUiQOaSWyUK9Nn4/EQP0FVmVCvNuMFDT0/5Ew9+JCHf4CRQtZqVRgKm4cf9bIaNxS5E+//7G1m
	0G0UAujrTj6PPj6/U3DC05bNlDd7Qww9qeAFDKLTE3dat7J94+VBYUe5L2Z+7G79ebEuVNYys3kZa
	8wpaQ0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAdB-0000000H8nh-2vwW;
	Tue, 18 Nov 2025 01:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAd9-0000000H8nA-1y1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 01:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94C78409D0;
	Tue, 18 Nov 2025 01:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C10AC2BCB1;
	Tue, 18 Nov 2025 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763429738;
	bh=1A3ueFJQdKAL4IrQZDG0qekVv1j8MkNba+taOgIOFJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FZn8Ir2i6TjFXjh+oxmRYRZqmy6Lx4NcK+CyW1lYm3j/+UAteu1nJXJW464om6QT+
	 2o/+e6+FItZPm2UWa596rJPcssqQWJsKEKf9rh/pgEBAffEqNe9hAxfpL0Fejpnvic
	 rKVt03DP/lCluxy5mwI80SswUjeYNcHVcWDxlS9NZ3kOTWgOKJv/5gpfJ+PYimhVKv
	 /rbZZ7jZCdt3smt7FReyk4VbTGtL7kVyFWK0EWHDJWgOspjFs6p4EQ/YFw64H2/chk
	 XR5czoaIc0D4YdJZAQago+7m7a9JgxG//d2Mv3P78JKgt/6/KgyOQUx8bCNzjKmmSh
	 QrldhIuiQzgVQ==
From: Namhyung Kim <namhyung@kernel.org>
To: john.g.garry@oracle.com, liujing <liujing@cmss.chinamobile.com>
Cc: will@kernel.org, james.clark@linaro.org, mike.leach@linaro.org, 
 leo.yan@linux.dev, suzuki.poulose@arm.com, peterz@infradead.org, 
 mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
 adrian.hunter@intel.com, kan.liang@linux.intel.com, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250922095057.3136-1-liujing@cmss.chinamobile.com>
References: <20250922095057.3136-1-liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] perf sample: Fix the wrong format specifier
Message-Id: <176342973594.1348495.12670854655035999916.b4-ty@kernel.org>
Date: Mon, 17 Nov 2025 17:35:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_173539_533555_01C241E6 
X-CRM114-Status: UNSURE (   5.66  )
X-CRM114-Notice: Please train this message.
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

On Mon, 22 Sep 2025 17:50:57 +0800, liujing wrote:
> In the file tools/perf/util/cs-etm.c, queue_nr is of type unsigned
> int and should be printed with %u.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



