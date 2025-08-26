Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8E9CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRMAhIvtwjCp1ECCw6f9h5i9YwLoIQo9z4NoCYc2WXQ=; b=tMC+/6sUg6GohoBuOb/UrurwtF
	lD/lDUQ2zp3i9eXZFBTSFx2howlFQCoGqDTD4Y+/STFdTvCu5WtODZHvBGte2xyXTG1UQR+DZifAy
	DnjR/6k+JHwDcyvaDo/h0aPQRgA2VOXU2Myr9um1kIh2Xwg/KzsB9HEbZUjz7wfJAkYTb3XBUvLDy
	0FOvHqpm178OZtBZKnFBGoHBcJuA66Qbu+RksNLFz+86IHT24FwMRdrdkG9Sb7UH+86yznM2RSdqm
	oa+wW9Mz+zHFavIQ/KQu8lk23AhqQfvTkN0ttHfFpFKLD+HMVfmSbup1JYNtpIat0P4/72Oxi2byv
	vaTVGM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtqv-0000000C7fP-3KZ6;
	Tue, 26 Aug 2025 13:36:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtST-0000000C3K1-30un;
	Tue, 26 Aug 2025 13:11:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D75BE1A25;
	Tue, 26 Aug 2025 06:11:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A733F63F;
	Tue, 26 Aug 2025 06:11:26 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:11:24 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
Message-ID: <20250826131124.GB745921@e132581.arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_061129_843114_2257BD99 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
> Sampling is inherently a feature for CPU PMUs, given that the thing
> to be sampled is a CPU context. These days, we have many more
> uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
> assume sampling support by default and force the ever-growing majority
> of drivers to opt out of it (or erroneously fail to). Instead, let's
> introduce a positive opt-in capability that's more obvious and easier to
> maintain.

[...]

> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 369e77ad5f13..dbd52851f5c6 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -955,7 +955,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
>  	spe_pmu->pmu = (struct pmu) {
>  		.module = THIS_MODULE,
>  		.parent		= &spe_pmu->pdev->dev,
> -		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
> +		.capabilities	= PERF_PMU_CAP_SAMPLING |
> +				  PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
>  		.attr_groups	= arm_spe_pmu_attr_groups,
>  		/*
>  		 * We hitch a ride on the software context here, so that

The change in Arm SPE driver looks good to me.

I noticed you did not set the flag for other AUX events, like Arm
CoreSight, Intel PT and bts. The drivers locate in:

  drivers/hwtracing/coresight/coresight-etm-perf.c
  arch/x86/events/intel/bts.c
  arch/x86/events/intel/pt.c

Genearlly, AUX events generate interrupts based on AUX ring buffer
watermark but not the period. Seems to me, it is correct to set the
PERF_PMU_CAP_SAMPLING flag for them.

A special case is Arm CoreSight legacy sinks (like ETR/ETB, etc)
don't has interrupt. We might need set or clear the flag on the fly
based on sink type:

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb2..404edc94c198 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -433,6 +433,11 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
        if (!sink)
                goto err;
 
+       if (coresight_is_percpu_sink(sink))
+               event->pmu.capabilities = PERF_PMU_CAP_SAMPLING;
+       else
+               event->pmu.capabilities &= ~PERF_PMU_CAP_SAMPLING;
+

Thanks,
Leo

