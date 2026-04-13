Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA12EF34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBakdcPrrkFOeg8BAdHgZZ69Eqz22VUJ+QoybgiBchY=; b=3/2EIA1jVC9ilJzLyqsfHwZAGO
	LWQdgJ67JRoTTvTjjHHM554TNNRzNDxSrh7nzSdZj7C+xuGNSWB8Se92I6ZX4KXRTunui8JpkwGYz
	NUjzJHfLYBrKnrOUZN5hWJIGPBpycZPZHHtu2l5IG/PSycIXKmL5DkOZp2zODCELPWHNuFhdcvW5j
	e/bgwTS6a+MBo/LZQ6bDl4n+IGhPbtO4RcWvzfAwzVnBlTefukqo0537Sf+oJAA+eIYfrvO3NTVqv
	UKPHdWviekS2zE0X3F7hY4Ord3Cc0UQabfqO8gS6TOgFxRinP0pxJDPEtVIl8udKt0QhMVglV16Vi
	74nr2BrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKCH-0000000G3zU-3cv5;
	Mon, 13 Apr 2026 16:31:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKCF-0000000G3zA-1MMO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:31:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B58A32C3E;
	Mon, 13 Apr 2026 09:31:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0410E3F641;
	Mon, 13 Apr 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776097892; bh=QdS2WhB7D5fppC6/7TCLRPfg8i0c7xcZA6vFB70h7Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkKigAKB075h9OetxZEcL/aicUls84+A27G/OZA6N0qitICpMQa3Cxb3iiXd//cZg
	 PxBhWIn65z/OLf+Ehhghwoxp4W+p5HrNGujAv/J3Q3Jl/KLouhEW3FxSf132VPiw+7
	 5FZpLVj/q21cv147xCrxm3TVwLsTabxBMM0Xyk78=
Date: Mon, 13 Apr 2026 17:31:30 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 00/20] CoreSight: Refactor power management for
 CoreSight path
Message-ID: <20260413163130.GC356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <0dd1c432-884a-46c1-828b-f3b22769d000@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd1c432-884a-46c1-828b-f3b22769d000@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_093135_550441_6060F88F 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, Apr 13, 2026 at 06:30:18PM +0800, Jie Gan wrote:

[...]

> tested on QCOM sa8775-ride:
> 
> === 1. Sysfs mode: basic enable/disable ===
> PASS: Sink tmc_etr0 enabled
> PASS: Source etm0 enabled
> PASS: Source etm0 disabled cleanly
> PASS: Sink tmc_etr0 disabled cleanly
> 
> === 2. Sysfs mode: repeated enable/disable cycles (10x) ===
> PASS: 10 enable/disable cycles completed without error
> 
> === 3. Sysfs mode: enable source with no active sink ===
> PASS: Enable without sink returned error (expected)
> 
> === 4. Sysfs mode: enable/disable all per-CPU sources ===
>     etm0 (cpu0): enabled OK
>     etm1 (cpu1): enabled OK
>     etm2 (cpu2): enabled OK
>     etm3 (cpu3): enabled OK
>     etm4 (cpu4): enabled OK
>     etm5 (cpu5): enabled OK
>     etm6 (cpu6): enabled OK
>     etm7 (cpu7): enabled OK
> PASS: All online per-CPU sources enabled/disabled successfully
> 
> === 5. CPU hotplug: offline CPU while sysfs tracing active ===
>   Using source etm1 on cpu1
>   Tracing active on cpu1, offlining CPU...
> [   82.805359] psci: CPU1 killed (polled 0 ms)
> PASS: Source auto-disabled on CPU offline
> [   83.346033] Detected PIPT I-cache on CPU1
> [   83.346114] GICv3: CPU1: found redistributor 100 region
> 0:0x0000000017a80000
> [   83.346283] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
> PASS: Source re-enabled after CPU re-online
> 
> === 6. Sysfs: enable source on offline CPU (expect ENODEV) ===
> [   84.013788] psci: CPU1 killed (polled 0 ms)
> PASS: Enable on offline cpu1 rejected (enable_source=0)
> [   84.349558] Detected PIPT I-cache on CPU1
> [   84.349640] GICv3: CPU1: found redistributor 100 region
> 0:0x0000000017a80000
> [   84.349811] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
> 
> === 7. CPU PM: trace survives CPU idle entry/exit ===
>   Sleeping 3s to allow CPU idle entry...
>   Idle entries on cpu0 during test: 35
> PASS: Source still enabled after idle (PM save/restore working)
> 
> === 8. Perf mode: basic cs_etm recording ===
> SKIP: perf not found in PATH
> 
> === 11. TRBE: check save/restore sysfs nodes (if present) ===
> SKIP: No TRBE devices found
> 
> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>

Just heads up: since Sashiko [1] pointed out a corner case where an SMP call
may fail when disabling the source device, the per-CPU path pointer
might not be cleared.  If the ETMv4 device is then removed (e.g. if the
user unloads the ETMv4 module), CPU PM notifier might access the stale
path pointer.  Though this is a rare case, we should handle it safely.
This is why the series was not picked for the v7.1 merge window.

Thanks a lot for the testing, Jie! It's very helpful, and I will add
your test tags in the next spin.

Anyway, please expect more iterations.

Thanks,
Leo

[1] https://sashiko.dev/#/patchset/20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be%40arm.com?part=5

