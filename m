Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C7CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yKNAcdX6TywFmdUqMcSYE/MnIpQrKp1CpCYZyHWpak=; b=RzRi9gLM0eE1uAGTX3fp//M0ce
	93YqABhkA4y1eeJNhn4AVbM0FSpAU43L0mZgQC7nVubKoxTEg/BUCC6e4CBwhO7FcQXFnoaigKtZD
	oCuhyTMVUeYix2ffwZD7Dj1S/2p2RJiwW6ePq0EJmBvPBbWICwQ6BTEbPgseB9/cpa5jOR3o9WM4C
	sFI3p5mGGA+7GIMca1GtciUwijNhjAdh/1fanS5ycUET4HN+UVcZNbxjZ0qIvssdm9gSr5NcAVFCo
	7UUHE+yEuB0tJDDd0gspvK5+YTNbiFmclzfJ5KUHg24mOJG1HP0pfq6aPBbecLDHlyucoqhtZ7uwx
	qRxoNiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1g-0000000DQtu-1Lka;
	Mon, 20 Oct 2025 12:30:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp1e-0000000DQqC-24Hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B288B61EC0;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB9FC113D0;
	Mon, 20 Oct 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963409;
	bh=xb/lnXZ7cyeI2Kiq/oDJcO0yuGXr40YVwbGy347cEi0=;
	h=From:To:Cc:Subject:Date:From;
	b=VOYeQEiHx1SU+kMdzV43TDLpRb/1X2OAi6PQIFcfwGAIFzadoDTyFta0UEI4rXH4B
	 hgYtCS6UuWatHtdKWWUu7+S4kkQiJqELiJ2w0+yM2qQ+EL2j96Vu7x8hjZL286TyRD
	 oupHx1nr1ArXNaWDVYP96bm8K8/p7xgEJ3vy2h5Sumy0YYnz5MnKiXS+dtb4Ke/ML/
	 Z/T303aL37zQp64TDGGeTQCM/8nU5Y62V85iuTKZeDgy0V2SIupCOjH0FzJgXBEUUf
	 Lee3TSVSAcnNkPXozbjR20EDn5K1Xk1bE6AUn3m1G5hgbGffesvFS0yr9qvac2kOx2
	 zkra8w+VY7joQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1b-0000000FUu2-0E4m;
	Mon, 20 Oct 2025 12:30:07 +0000
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 00/26] genirq: Add support for percpu_devid IRQ affinity
Date: Mon, 20 Oct 2025 13:29:17 +0100
Message-ID: <20251020122944.3074811-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
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

This is the fourth version of this series, originally posted at [1],
which aims at allowing percpu_devid interrupt requests on the basis of
an affinity mask. See the original submission for the details of why
this is a desirable outcome.

From v3, we have some additional tidying up, thanks to Jonathan's
review, and a bunch of tags -- see changelog for details.

FWIW, I've pushed a branch at [0].

* From v3 [3]:

  - Additional cleanups in of_irq_get_affinity() (Jonathan)

  - Rebased on 6.18-rc2

  - Collected Abs, Rbs and Tbs, with thanks (Raphael, Jonathan,
    Jinjie, Suzuki, Sven, Will)

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

[0] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity
[1] https://lore.kernel.org/r/20250908163127.2462948-1-maz@kernel.org
[2] https://lore.kernel.org/r/20250915085702.519996-1-maz@kernel.org
[3] https://lore.kernel.org/r/20250922082833.2038905-1-maz@kernel.org

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
 kernel/irq/chip.c                            |  33 +--
 kernel/irq/irqdesc.c                         |  24 +-
 kernel/irq/irqdomain.c                       |  32 ++-
 kernel/irq/manage.c                          | 125 +++++++---
 28 files changed, 419 insertions(+), 655 deletions(-)
 delete mode 100644 drivers/irqchip/irq-partition-percpu.c
 delete mode 100644 include/linux/irqchip/irq-partition-percpu.h

-- 
2.47.3


