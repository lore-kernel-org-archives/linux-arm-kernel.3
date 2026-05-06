Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05ADCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi4I9RDEhhW2sV61ya/ZTAooYeZp/uzKnNWonLOhsoY=; b=Usen4xR2ktDN7C4RBxafsDb4zy
	+wIAOFX6u4v4Gj9B6bBDEhKUnIPqJH/3AvdifreEK28Y4LWv3nRkIl/WiPH88JqwlwNRkSjfYCsdv
	yKpZ6QTLtQhcaLhI/2Fkf8uQS7QiKZA5d3JDbiy1buR5DaZCBhKgGAAekRRv5rgO/BRlsqPj9Ls/h
	WA7dp2mh2HMPrvLC157apD67qYyFF2C2hXGJcYDylNyOLm9im6fIzSrpQQTq1QwDsplY3/rEhxwM8
	cGpBm6In7CayzpaolRASUmwexsplEJKQsiaBZS2Wv1qDr/hPtXlP92Dh2WXi4nggMPhqxbG4VgvLw
	C4viCo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYi3-00000000NC5-2WRe;
	Wed, 06 May 2026 09:38:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYi3-00000000NBV-0W53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:38:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFD521A9A;
	Wed,  6 May 2026 02:38:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909763F7B4;
	Wed,  6 May 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778060306; bh=7xBa9AB7f0Oy2obwUQCehMyzYnphPJtKHa5wIIMrCrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSBwxsccPAuSyiCDgFX3l8lAMaKablIH39enCXolN+28IghmJEPvEi7uprZHsDalY
	 LjuyF9Ki7LGjHHw2LTKBsLUlf0U0acQ12+i3OgUUapsPeSiNCC2IHbu+lkHrGLKwpU
	 LxbQ0Ba5SblvovTaKT6VOmWMOYzINK1dGH69LmmM=
Date: Wed, 6 May 2026 10:38:23 +0100
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
Subject: Re: [PATCH v11 00/27] CoreSight: Refactor power management for
 CoreSight path
Message-ID: <20260506093823.GE3778514@e132581.arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <e0fa7079-6f57-4b5d-8b5d-ff10264caf1a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0fa7079-6f57-4b5d-8b5d-ff10264caf1a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023827_242614_0997F64B 
X-CRM114-Status: GOOD (  11.31  )
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

On Wed, May 06, 2026 at 03:33:38PM +0800, Jie Gan wrote:

[...]

> Tested on QCOM sa8775p-ride platform with sysfs mode:

Hi Jie, very appreciate for the testing!

> === 1. Prerequisites ===
> PASS: Running as root
> PASS: CoreSight bus present
> PASS: Sink: tmc_etr0
>   Sink is TRBE: 0
> PASS: Source: etm0
>   Source CPU: 0
>   Online CPUs: 8
>   All CoreSight devices:
>     ctcu0
>     cti_sys0
>     etm0
>     etm1
>     etm2
>     etm3
>     etm4
>     etm5
>     etm6
>     etm7
>     funnel0
>     funnel1
>     funnel2
>     funnel3
>     funnel4
>     funnel5
>     funnel6
>     funnel7
>     replicator0
>     replicator1
>     replicator2
>     stm0
>     tmc_etf0
>     tmc_etr0
>     tmc_etr1
>     tpdm0
>     tpdm1
>     tpdm10
>     tpdm11
>     tpdm2
>     tpdm3
>     tpdm4
>     tpdm5
>     tpdm6
>     tpdm7
>     tpdm8
>     tpdm9
> 
> === 2. Sysfs mode: basic enable/disable ===
> PASS: Sink tmc_etr0 enabled
> PASS: Source etm0 enabled
> PASS: Source etm0 disabled cleanly
> PASS: Sink tmc_etr0 disabled cleanly
> 
> === 3. Sysfs mode: repeated enable/disable cycles (10x) ===
> PASS: 10 enable/disable cycles completed without error
> 
> === 4. Sysfs: enable source with no active sink ===
> PASS: Enable without sink returned error (expected)
> 
> === 5. Sysfs: enable/disable all online per-CPU sources ===
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
> === 6. csdev->cpu sysfs attribute (Patch 3: CPU ID in coresight_device) ===
>     etm0: cpu = 0 (OK)
>     etm1: cpu = 1 (OK)
>     etm2: cpu = 2 (OK)
>     etm3: cpu = 3 (OK)
>     etm4: cpu = 4 (OK)
>     etm5: cpu = 5 (OK)
>     etm6: cpu = 6 (OK)
>     etm7: cpu = 7 (OK)
> PASS: All 8 per-CPU sources have valid 'cpu' attribute
> 
> === 7. CPU online validation before path build (Patch 27) ===
>   Offlining cpu1 (source: etm1)
> [  146.339051] psci: CPU1 killed (polled 0 ms)
> PASS: P27: Enable on offline cpu1 rejected before path build
> (enable_source=0)
> [  146.689573] Detected PIPT I-cache on CPU1
> [  146.689635] GICv3: CPU1: found redistributor 100 region
> 0:0x0000000017a80000
> [  146.689801] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
>   cpu1 back online
> 
> === 8. CPU hotplug: core layer disables full sysfs path on CPU offline
> (Patch 26) ===
>   Starting sysfs trace on cpu1 (source: etm1)
>   Offlining cpu1 while tracing active...
> [  147.498731] psci: CPU1 killed (polled 0 ms)
> PASS: P26: Source auto-disabled by core coresight_dying_cpu() on CPU offline
>     Sink state after hotplug: 1
> PASS: No kernel errors in dmesg during hotplug
> [  148.365194] Detected PIPT I-cache on CPU1
> [  148.365249] GICv3: CPU1: found redistributor 100 region
> 0:0x0000000017a80000
> [  148.365393] CPU1: Booted secondary processor 0x0000000100 [0x410fd4b2]
> PASS: cpu1 re-onlined
> 
> === 9. CPU hotplug: re-enable sysfs tracing after CPU re-online ===
> PASS: Tracing re-enabled on cpu1 after hotplug cycle
> 
> === 10. CPU PM: path control during CPU idle (Patch 22) ===
>   Sleeping 4s to allow CPU idle entry (source: etm0, cpu: 0)...
>   Idle entries on cpu0 during test: 49
> PASS: P22: Source still enabled after idle — path save/restore working
> 
> Thanks,
> Jie

