Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D62CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5FwAlhgzpaBSsYllt86ZWKKewn7PYpMdyJ+DlZuLc0=; b=EdG5VuK379DzN6JJ6fTg56BwAR
	f0KMx4aLZ8SrZjQvaAe4tzy6RkuPh1TU2S7JSIgkp9OZ89lC4vt4SEpq/fd/GKw5Dw3EfAip3Tpbt
	0O3K5Xm3euUbObu84Kg2OneFcBbIMD+Lg2ThXj8EIydWLsM3E1/COqboXwToE8vFDF1bGVbL+88fu
	vH9XQ1ujXzw0lqJPNa5bAyXxKeDXXG+jHwTYqhDPh0LPtQczbOu+mbWjkwLVLNfOXzuM4GVTYfsGN
	4wlviI39BMygHD69W617+8Tw8vzerSZnY+nNUwWglmY+ckCNjdEk0/tlNZqrsP+ViP88pGQoiDywm
	U6TRTpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzpA-0000000G8qT-0IKn;
	Mon, 18 May 2026 15:24:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzp6-0000000G8pP-32ab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:24:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E621756;
	Mon, 18 May 2026 08:23:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 910D03F85F;
	Mon, 18 May 2026 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779117843; bh=HUh7OUQHd40zB/UJtVm6xYp8OBDyCCY4+4FgcMoHom0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbJbftJBhQIkBZwo0HRW5A1tX4MAAwrlagir0iZ3jZHqgqqTnZaGCrdEQG3f0Okvo
	 VJGPqut7KyMdwPwA4ZIIZ8wvj4Fqy5kvY3a63yhyfDkVzmaKmR4wJrIgD5j51WOLKN
	 h543MSdtLC9fmKDTGrUA528Iwg5yho5qEMvmkjYw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>,
	Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v14 00/28] CoreSight: Refactor power management for CoreSight path
Date: Mon, 18 May 2026 16:23:47 +0100
Message-ID: <177911781163.221272.5834610199324773140.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_082404_934327_7C81707E 
X-CRM114-Status: GOOD (  12.73  )
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


On Fri, 15 May 2026 21:08:07 +0100, Leo Yan wrote:
> This series focuses on CoreSight path power management.  The changes can
> be divided into four parts for review:
> 
>   Patches 01 - 10: Preparison for CPU PM:
>                    Fix source disabling on idr_alloc failure.
>                    Fix helper enable failure handling.
>                    Refactor CPU ID stored in csdev.
>                    Move CPU lock to sysfs layer.
> 		   Move per-CPU source pointer from etm-perf to core layer.
> 		   Refactor etm-perf to retrieve source via per-CPU's event
> 		   data for lockless and get source reference during AUX
> 		   setup.
>   Patches 11 - 13: Refactor CPU idle flow managed in the CoreSight core
>                    layer.
>   Patches 14 - 23: Refactor path enable / disable with range, control path
>                    during CPU idle.
>   Patches 24 - 25: Support the sink (TRBE) control during CPU idle.
>   Patches 26 - 28: Move CPU hotplug into the core layer, and fix sysfs
>                    mode for hotplug.
> 
> [...]

Applied, thanks!

[01/28] coresight: Fix source not disabled on idr_alloc_u32 failure
        https://git.kernel.org/coresight/c/ea2c2b9e2a66
[02/28] coresight: Handle helper enable failure properly
        https://git.kernel.org/coresight/c/864754d0a084
[03/28] coresight: Extract device init into coresight_init_device()
        https://git.kernel.org/coresight/c/10be00dd7375
[04/28] coresight: Populate CPU ID into coresight_device
        https://git.kernel.org/coresight/c/da2bfe3377b5
[05/28] coresight: Remove .cpu_id() callback from source ops
        https://git.kernel.org/coresight/c/9d5eb760e304
[06/28] coresight: Take hotplug lock in enable_source_store() for Sysfs mode
        https://git.kernel.org/coresight/c/2c7f786928c4
[07/28] coresight: perf: Retrieve path and source from event data
        https://git.kernel.org/coresight/c/f37bc31447c0
[08/28] coresight: Take a reference on csdev
        https://git.kernel.org/coresight/c/6317302ae252
[09/28] coresight: Move per-CPU source pointer to core layer
        https://git.kernel.org/coresight/c/3a4a1c4dd977
[10/28] coresight: Take per-CPU source reference during AUX setup
        https://git.kernel.org/coresight/c/d79125cc3622
[11/28] coresight: Register CPU PM notifier in core layer
        https://git.kernel.org/coresight/c/4d8dd98ee5bf
[12/28] coresight: etm4x: Hook CPU PM callbacks
        https://git.kernel.org/coresight/c/0f5e588c70a8
[13/28] coresight: etm4x: Remove redundant checks in PM save and restore
        https://git.kernel.org/coresight/c/81bf1c33f6a7
[14/28] coresight: syscfg: Use IRQ-safe spinlock to protect active variables
        https://git.kernel.org/coresight/c/3b6e3e04659a
[15/28] coresight: Disable source helpers in coresight_disable_path()
        https://git.kernel.org/coresight/c/5cae71994339
[16/28] coresight: Control path with range
        https://git.kernel.org/coresight/c/3d3289c0d850
[17/28] coresight: Use helpers to fetch first and last nodes
        https://git.kernel.org/coresight/c/0724585ace19
[18/28] coresight: Introduce coresight_enable_source() helper
        https://git.kernel.org/coresight/c/a18e877b0491
[19/28] coresight: Save active path for system tracers
        https://git.kernel.org/coresight/c/ac8eac9062ee
[20/28] coresight: etm4x: Set active path on target CPU
        https://git.kernel.org/coresight/c/b6d54a94dcf4
[21/28] coresight: etm3x: Set active path on target CPU
        https://git.kernel.org/coresight/c/bc9907750718
[22/28] coresight: sysfs: Use source's path pointer for path control
        https://git.kernel.org/coresight/c/a2e91258e864
[23/28] coresight: Control path during CPU idle
        https://git.kernel.org/coresight/c/39c40892f1a4
[24/28] coresight: Add PM callbacks for sink device
        https://git.kernel.org/coresight/c/7bbe5a172376
[25/28] coresight: trbe: Save and restore state across CPU low power state
        https://git.kernel.org/coresight/c/da06d6eb523b
[26/28] coresight: sysfs: Increment refcount only for software source
        https://git.kernel.org/coresight/c/bf64b06ede93
[27/28] coresight: Move CPU hotplug callbacks to core layer
        https://git.kernel.org/coresight/c/7105d2aa76d8
[28/28] coresight: sysfs: Validate CPU online status for per-CPU sources
        https://git.kernel.org/coresight/c/a5dd853fb777

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

