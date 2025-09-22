Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D899CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvzEApNoA6bmgxP5DtdYroJnnc4L1WP2GEVn5ao2R1M=; b=J7m4kLPuX9S+YMssLdRclohJ4R
	uSWWgQGS7rNLHIuZ9FETkWmThJ/eoR5yt6Dk1p9uzTrj0HmCjxVbHCraCJciuGunSqDUz3asDR1MD
	b1va7jjmhJloRZ3e2Z37a8tL/M7mTiRgt4r4VQz1ECxHg9DhlRvfdWkXzoxRl//MkfMT9sKe/aASV
	Gn/h8yaUYvjbcjoDxOh8WLDB+fNt4oBTJ685yydAVxcWWsJPLE7B8S+t8MI9wn/mcHo1womDsRiea
	KU3Z0ndyDBs23foThhbuW4ZWpluoKXDKyKaAmRJSKT46Bwd0rZbB9UOU6PYpJ+MVT4Tdq8APrn44t
	ea9oyr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bug-00000009hgm-1cgv;
	Mon, 22 Sep 2025 08:28:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buf-00000009hfC-1Bzm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD5C6601F8;
	Mon, 22 Sep 2025 08:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523E7C116C6;
	Mon, 22 Sep 2025 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529724;
	bh=NXls5rbHqxDLi0/3KiCGchnqWOEFMs5iQ5o5i5E3JZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=oDU7b41Wz7w32jihd3t9/LYaa0cDmaIj1mVdp43n+Gsc7i/IEb57IXE5iSL60+qSz
	 GT/FXgIlUBZCcARV7J7bC2eddJwGAnRV7/nTiTNFFhC/z9PSlt3VXxGa/3Hxc9jWGg
	 zrGlkNI+MpGNuOmByfa4txFbPZXYeDS8etIDwQnSBaazTzaa84B2wRy0D28smGtpg4
	 xwRJX9FDlkK1XEjtbbeoQOVtCKIb5ZvEAHRjT94mtWAAaw9Tkx3YsfgnB5oxrMvQ8Q
	 DjXOjYQxWRpfGjTTzjLuyH/ZDAFjkY3IVxl8woP9oH6tqGjdjUEncGmEoAn1xQHc2G
	 ggbumsA/W7kdg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0bub-00000008Kds-2Vyj;
	Mon, 22 Sep 2025 08:28:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 00/26] genirq: Add support for percpu_devid IRQ affinity
Date: Mon, 22 Sep 2025 09:28:07 +0100
Message-ID: <20250922082833.2038905-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

This is the third version of this series, originally posted at [1],
which aims at allowing percpu_devid interrupt requests on the basis of
an affinity mask. See the original submission for the details of why
this is a desirable outcome.

From v2, we have some tidying up, thanks to Jonathan's review -- see
changelog for details.

FWIW, I've pushed a branch at [3].

* From v2 [2]:

  - Turned of_node_to_fwnode() usage to of_fwnode_handle() (Jonathan)

  - Added a patch to finally kill of_node_to_fwnode()

  - Tidied-up documentation, comments and formatting (Jonathan)

  - Collected ABs and Rbs, with thanks (Jonathan, Suzuki, Sven)

* From v1 [1]:

  - Fixed NMI handling by getting rid of the NMI-specific flow
    handler, which was pretty useless anyway (Will)

  - As a result, killed a metric buttload worth of GICv3 code

  - Moved irq_fwspec out of irq_fwspec_info, and passed it as a
    parameter to irq_get_fwspec_info(), renamed from irq_get_info(),
    and applied some generous sanitisation of the structure (Thomas)

  - Dropped the rather useless fwspec validity flag (Thomas)

  - Rejigged the PMU per-CPU handling to better deal with the DT/ACPI
    differences, and drop some now useless patches (Will)

  - Plenty of cosmetic rework (Raphael, Thomas)

[1] https://lore.kernel.org/r/20250908163127.2462948-1-maz@kernel.org
[2] https://lore.kernel.org/r/20250915085702.519996-1-maz@kernel.org
[3] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity

Marc Zyngier (25):
  irqdomain: Add firmware info reporting interface
  ACPI: irq: Add IRQ affinity reporting interface
  of/irq: Add IRQ affinity reporting interface
  platform: Add firmware-agnostic irq and affinity retrieval interface
  irqchip/gic-v3: Add FW info retrieval support
  irqchip/apple-aic: Add FW info retrieval support
  coresight: trbe: Convert to new IRQ affinity retrieval API
  perf: arm_pmu: Convert to new IRQ affinity retrieval API
  perf: arm_spe_pmu: Convert to new IRQ affinity retrieval API
  irqchip/gic-v3: Switch high priority PPIs over to
    handle_percpu_devid_irq()
  genirq: Kill handle_percpu_devid_fasteoi_nmi()
  genirq: Merge irqaction::{dev_id,percpu_dev_id}
  genirq: Factor-in percpu irqaction creation
  genirq: Add affinity to percpu_devid interrupt requests
  genirq: Update request_percpu_nmi() to take an affinity
  genirq: Allow per-cpu interrupt sharing for non-overlapping affinities
  genirq: Add request_percpu_irq_affinity() helper
  perf: arm_spe_pmu: Request specific affinities for percpu IRQ
  coresight: trbe: Request specific affinities for percpu IRQ
  irqchip/gic-v3: Drop support for custom PPI partitions
  irqchip/apple-aic: Drop support for custom PMU irq partitions
  irqchip: Kill irq-partition-percpu
  genirq: Kill irq_{g,s}et_percpu_devid_partition()
  irqdomain: Kill of_node_to_fwnode() helper
  perf: arm_pmu: Kill last use of per-CPU cpu_armpmu pointer

Will Deacon (1):
  perf: arm_pmu: Request specific affinities for percpu NMI/IRQ

 arch/arm64/kernel/smp.c                      |   2 +-
 drivers/acpi/irq.c                           |  19 ++
 drivers/base/platform.c                      |  60 ++++-
 drivers/hwtracing/coresight/coresight-trbe.c |   9 +-
 drivers/irqchip/Kconfig                      |   4 -
 drivers/irqchip/Makefile                     |   1 -
 drivers/irqchip/irq-apple-aic.c              |  56 +++--
 drivers/irqchip/irq-gic-v3.c                 | 224 +++++------------
 drivers/irqchip/irq-partition-percpu.c       | 241 -------------------
 drivers/of/irq.c                             |  20 ++
 drivers/perf/arm_pmu.c                       |  49 ++--
 drivers/perf/arm_pmu_acpi.c                  |   2 +-
 drivers/perf/arm_pmu_platform.c              |  20 +-
 drivers/perf/arm_pmuv3.c                     |   2 +-
 drivers/perf/arm_spe_pmu.c                   |  13 +-
 include/linux/acpi.h                         |   7 +
 include/linux/interrupt.h                    |  24 +-
 include/linux/irq.h                          |   5 -
 include/linux/irqchip/irq-partition-percpu.h |  53 ----
 include/linux/irqdesc.h                      |   1 -
 include/linux/irqdomain.h                    |  33 ++-
 include/linux/of_irq.h                       |   7 +
 include/linux/perf/arm_pmu.h                 |   6 +-
 include/linux/platform_device.h              |   2 +
 kernel/irq/chip.c                            |  35 +--
 kernel/irq/irqdesc.c                         |  24 +-
 kernel/irq/irqdomain.c                       |  32 ++-
 kernel/irq/manage.c                          | 125 +++++++---
 28 files changed, 420 insertions(+), 656 deletions(-)
 delete mode 100644 drivers/irqchip/irq-partition-percpu.c
 delete mode 100644 include/linux/irqchip/irq-partition-percpu.h

-- 
2.47.3


