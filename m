Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5165CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaDr5orf6FTdt89gm/cP6+5HeZgnDgV25g7zZzcZjqk=; b=Yz5RbY13T8m6Ey0Gk4BKMBzVmJ
	QvC1O5LFNWjfPOK6xK6KQxclPHU9B7wZaHhO8bYAQFB5yQdZO4SjMYEHtkr6/U6hhO8S2UvnITfJ0
	Kodoi+qKCli09hensbf60fznvSFSDEKB6JRDc79OszHUV7awuMgWjU/fNsbxDHfa+PVSZN1z8PbKQ
	ZuhuEVKjyB5/htFgCk5E61d5S7ZfdtmE/2+Km6RL4D9Dc1UPfaoURZ3xRUm1eB/SToDeB2Do0ZRRB
	XWtLKd77FMvTmls0TNkocd6wDFqFxRNuj0VXmcPybfwwzYlcteuC8pQODiv2OSXZKjYKwmmmwWoAo
	D9FRhcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrO-0000000Eehe-2uBv;
	Wed, 13 Aug 2025 18:06:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEqu-0000000EVGt-0CiP;
	Wed, 13 Aug 2025 17:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD3A12FC;
	Wed, 13 Aug 2025 10:01:17 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4DF23F738;
	Wed, 13 Aug 2025 10:01:20 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 00/19] perf: Rework event_init checks
Date: Wed, 13 Aug 2025 18:00:52 +0100
Message-Id: <cover.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100128_165970_0F557D5E 
X-CRM114-Status: GOOD (  15.36  )
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

Hi all,

[ Note I'm only CC'ing lists for now to avoid spamming nearly 100 
  individual maintainers/reviewers while we work out the basics ]

Reviving my idea from a few years back, the aim here is to minimise
the amount of event_init boilerplate that most new drivers have to
implement (and so many get wrong), while also trying to establish
some more consistent and easy-to-follow patterns for the things that
drivers should still care about (mostly group validation).

It's ended up somewhat big and ugly, so to start with I've tried to
optimise for ease of review - based on the typical "fixes, cleanup,
new development" order the split of the current patches is like so:

* Group validation rework (patches #1-#15)
  - Specific drivers with functional issues by inspection (#1-#7)
  - Specific drivers where cleanup changes were non-trivial (#8-#11)
  - Common patterns across remaining drivers (#12-#15)
* Capabilities rework (patches #16-#18)
* Giant bonfire of remaining boilerplate! (patch #19)

If the overall idea is acceptable then a more relaxed merge strategy
might be to look at landing the common parts first (#16-#18 and maybe
#13), then rearrange the rest into per-driver patches, but I'm sure
nobody wants a ~70-patch series out of the gate :)

Thanks,
Robin.


Robin Murphy (19):
  perf/arm-cmn: Fix event validation
  perf/hisilicon: Fix group validation
  perf/imx8_ddr: Fix group validation
  perf/starfive: Fix group validation
  iommu/vt-d: Fix perfmon group validation
  ARM: l2x0: Fix group validation
  ARM: imx: Fix MMDC PMU group validation
  perf/arm_smmu_v3: Improve group validation
  perf/qcom: Improve group validation
  perf/arm-ni: Improve event validation
  perf/arm-cci: Tidy up event validation
  perf: Ignore event state for group validation
  perf: Add helper for checking grouped events
  perf: Clean up redundant group validation
  perf: Simplify group validation
  perf: Introduce positive capability for sampling
  perf: Retire PERF_PMU_CAP_NO_INTERRUPT
  perf: Introduce positive capability for raw events
  perf: Garbage-collect event_init checks

 arch/alpha/kernel/perf_event.c                |  5 +-
 arch/arc/kernel/perf_event.c                  |  4 +-
 arch/arm/mach-imx/mmdc.c                      | 29 ++----
 arch/arm/mm/cache-l2x0-pmu.c                  | 19 +---
 arch/csky/kernel/perf_event.c                 |  3 +-
 arch/loongarch/kernel/perf_event.c            |  1 +
 arch/mips/kernel/perf_event_mipsxx.c          |  1 +
 arch/powerpc/perf/8xx-pmu.c                   |  3 +-
 arch/powerpc/perf/core-book3s.c               |  4 +-
 arch/powerpc/perf/core-fsl-emb.c              |  4 +-
 arch/powerpc/perf/hv-24x7.c                   | 11 ---
 arch/powerpc/perf/hv-gpci.c                   | 11 ---
 arch/powerpc/perf/imc-pmu.c                   | 31 +-----
 arch/powerpc/perf/kvm-hv-pmu.c                |  5 +-
 arch/powerpc/perf/vpa-pmu.c                   | 13 +--
 arch/powerpc/platforms/pseries/papr_scm.c     | 18 +---
 arch/s390/kernel/perf_cpum_cf.c               |  8 +-
 arch/s390/kernel/perf_cpum_sf.c               |  2 +
 arch/s390/kernel/perf_pai_crypto.c            |  1 +
 arch/s390/kernel/perf_pai_ext.c               |  1 +
 arch/sh/kernel/perf_event.c                   |  1 -
 arch/sparc/kernel/perf_event.c                |  4 +-
 arch/x86/events/amd/ibs.c                     | 32 ++-----
 arch/x86/events/amd/iommu.c                   | 15 ---
 arch/x86/events/amd/power.c                   |  7 --
 arch/x86/events/amd/uncore.c                  | 12 +--
 arch/x86/events/core.c                        |  7 +-
 arch/x86/events/intel/bts.c                   |  3 -
 arch/x86/events/intel/cstate.c                | 16 +---
 arch/x86/events/intel/pt.c                    |  3 -
 arch/x86/events/intel/uncore.c                | 16 +---
 arch/x86/events/intel/uncore_snb.c            | 18 ----
 arch/x86/events/msr.c                         |  8 +-
 arch/x86/events/rapl.c                        | 11 ---
 arch/xtensa/kernel/perf_event.c               |  1 +
 drivers/devfreq/event/rockchip-dfi.c          | 13 +--
 drivers/dma/idxd/perfmon.c                    | 17 +---
 drivers/fpga/dfl-fme-perf.c                   | 18 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c       |  4 -
 drivers/gpu/drm/i915/i915_pmu.c               | 13 ---
 drivers/gpu/drm/xe/xe_pmu.c                   | 13 ---
 .../hwtracing/coresight/coresight-etm-perf.c  |  5 -
 drivers/hwtracing/ptt/hisi_ptt.c              |  8 --
 drivers/iommu/intel/perfmon.c                 | 28 +++---
 drivers/perf/alibaba_uncore_drw_pmu.c         | 28 +-----
 drivers/perf/amlogic/meson_ddr_pmu_core.c     |  9 --
 drivers/perf/arm-cci.c                        | 56 +++--------
 drivers/perf/arm-ccn.c                        | 34 -------
 drivers/perf/arm-cmn.c                        | 15 +--
 drivers/perf/arm-ni.c                         | 35 +++----
 drivers/perf/arm_cspmu/arm_cspmu.c            | 34 +------
 drivers/perf/arm_dmc620_pmu.c                 | 28 +-----
 drivers/perf/arm_dsu_pmu.c                    | 26 +----
 drivers/perf/arm_pmu.c                        | 19 +---
 drivers/perf/arm_pmu_platform.c               |  2 +-
 drivers/perf/arm_smmuv3_pmu.c                 | 35 ++-----
 drivers/perf/arm_spe_pmu.c                    |  7 +-
 drivers/perf/cxl_pmu.c                        |  6 --
 drivers/perf/dwc_pcie_pmu.c                   | 21 +---
 drivers/perf/fsl_imx8_ddr_perf.c              | 32 +------
 drivers/perf/fsl_imx9_ddr_perf.c              | 27 ------
 drivers/perf/hisilicon/hisi_pcie_pmu.c        | 25 ++---
 drivers/perf/hisilicon/hisi_uncore_pmu.c      | 41 ++------
 drivers/perf/hisilicon/hns3_pmu.c             | 24 ++---
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 18 ----
 drivers/perf/marvell_cn10k_tad_pmu.c          | 12 +--
 drivers/perf/marvell_pem_pmu.c                | 22 +----
 drivers/perf/qcom_l2_pmu.c                    | 96 ++++++-------------
 drivers/perf/qcom_l3_pmu.c                    | 33 ++-----
 drivers/perf/riscv_pmu_legacy.c               |  1 -
 drivers/perf/riscv_pmu_sbi.c                  |  3 +-
 drivers/perf/starfive_starlink_pmu.c          | 32 ++-----
 drivers/perf/thunderx2_pmu.c                  | 45 ++-------
 drivers/perf/xgene_pmu.c                      | 29 ------
 drivers/powercap/intel_rapl_common.c          |  9 +-
 include/linux/perf_event.h                    | 10 +-
 kernel/events/core.c                          | 35 +++++--
 kernel/events/hw_breakpoint.c                 |  1 +
 78 files changed, 244 insertions(+), 1053 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


