Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F659CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZEJotIi6X1X57GlWDm1GZsxsrWfEjOJIpgi5qJCU44=; b=Uk0uFz1LIYQtx3JDRVq6tszZAI
	hPCz26Ecf8hgrWaijIzWtQU4pidL7Ofuxf050NKX1SqzRXxH9ZaS9ux3NrxtNC4Miyacf3MgAPQAN
	j1XSBk0uAA3y4CExlbT+kxx81a6bRuORjzmYxasSFJiztwzXM4wFxPxEalLMx0/IdDFv2KSx8AZfQ
	nhkyCTZKn5Fd/gtaEiS7PwbQ/JOPuBovuwkgUJkHGQwSaULYMZieYtFQ7iw+ph0pwRxzogj82OR8y
	F9JVBX6ab5LVoCxBBfszxaiQLInCIhMEUj/T2EzqW3aCbVtHuTaveZmA3iayv5cGT2TRWYbkL0ie4
	B4ZVBQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51Q-00000003Ixm-0PiL;
	Mon, 15 Sep 2025 08:57:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51O-00000003Iw3-2dRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D447660195;
	Mon, 15 Sep 2025 08:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740FCC4CEF1;
	Mon, 15 Sep 2025 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926633;
	bh=5E+Yes9XOWiH81I9dVAZpfFciGGWYGCSQDF6XHckgR8=;
	h=From:To:Cc:Subject:Date:From;
	b=sH7y4IrFh198drJ40DUGs8+te89u3vEmFcBK6a7wiHEzlKVJh2DxGIw7k+xjcnvGR
	 wpylXBu851ownBXwOlOcixK9YBSteVCnfS8D/YskqXZ1ULAiGUR5CsF0bMVshodFnI
	 1+r73Rk9HgTm5c+wWQeJrG0aro9VrNZwonqb/QDrG3qvISyiMFDRZ4TyRAV1HgRAs3
	 mtSeChf8Ps6dRrI58ikYtNMGt0048WpExcaqI1yTFhkBwrAW2PQPptH1l9rd9w5YMu
	 pYSMqpX5xQkKJh2WxpaHZOfDSdWIg/zS6RAm8i7XXfT6wxnRoR0WNnEd0BB5sp/K81
	 EFhTuz+6osXig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51L-00000006IHP-0QON;
	Mon, 15 Sep 2025 08:57:11 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/25] genirq: Add support for percpu_devid IRQ affinity
Date: Mon, 15 Sep 2025 09:56:37 +0100
Message-Id: <20250915085702.519996-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
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

This is the second version of this series, originally posted at [1],
which aims at allowing percpu_devid interrupt requests on the basis of
an affinity mask. See the original submission for the details of why
this is a desirable outcome.

From v1, we have a number of changes, both functional and cosmetic,
but the fundamentals are pretty much the same (change log below), with
an even more appealing diffstat.

Thanks to Will, Thomas and Raphael for their constructive review
comments.

FWIW, I've pushed a branch at [2].

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
[2] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity

Marc Zyngier (24):
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
 drivers/perf/arm_pmu.c                       |  50 ++--
 drivers/perf/arm_pmu_acpi.c                  |   2 +-
 drivers/perf/arm_pmu_platform.c              |  20 +-
 drivers/perf/arm_pmuv3.c                     |   2 +-
 drivers/perf/arm_spe_pmu.c                   |  13 +-
 include/linux/acpi.h                         |   7 +
 include/linux/interrupt.h                    |  24 +-
 include/linux/irq.h                          |   5 -
 include/linux/irqchip/irq-partition-percpu.h |  53 ----
 include/linux/irqdesc.h                      |   1 -
 include/linux/irqdomain.h                    |  28 +++
 include/linux/of_irq.h                       |   7 +
 include/linux/perf/arm_pmu.h                 |   6 +-
 include/linux/platform_device.h              |   2 +
 kernel/irq/chip.c                            |  36 +--
 kernel/irq/irqdesc.c                         |  24 +-
 kernel/irq/irqdomain.c                       |  32 ++-
 kernel/irq/manage.c                          | 124 +++++++---
 28 files changed, 423 insertions(+), 649 deletions(-)
 delete mode 100644 drivers/irqchip/irq-partition-percpu.c
 delete mode 100644 include/linux/irqchip/irq-partition-percpu.h

-- 
2.39.2


