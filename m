Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FECD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m45lmngnneFEFrRyGJR4mUwoMKqxtY0RUEN+/lvw4/4=; b=PdUK5zy6+91P1MYgqoJpaylPTi
	N7XZFoFBMdtlugPRR1uk6zmz6lVqoHIUi5tIx6Qb/mELiTxnMJ290sbFW9QLNks+B/FAh/25Na7+Z
	PfGaDNIty0ZanE1gD9YgGISG1dAJB6h+1kOADL6ZHNKHtzb1UrxmUYDYuwlU5hHNdRfF3IJw/veLt
	JHndVUH5WbZMmXm4tWZxk4w85KyhnQNIRyVjjIE9s/28fx5+5dou1o8IWu5qqC8gIAI8LMcJc3jGB
	ryJck72yUDosEFC041UW8IpznJCpkjw7Mudt4jywIXJryLfTEkLsFPN1nkEkkXQocyttrL91cAim2
	iMamqwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sd-00000003HLN-1DmP;
	Tue, 20 Jan 2026 06:43:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Sa-00000003HKE-3lwi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:43:30 +0000
Received: from mrdev.corp.microsoft.com (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3BA9720B716A;
	Mon, 19 Jan 2026 22:43:27 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3BA9720B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768891408;
	bh=m45lmngnneFEFrRyGJR4mUwoMKqxtY0RUEN+/lvw4/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGdtXVc2BXgm92n5ocikgwapcrs0HLEgrr6+dxRy3TgP+wqnISmLINE6igxoPsAeS
	 8r68DlGdoTXyTpQ6RkFDSB8egv/wuwQ58Vk4Hwoa5+iO6ykl7h6FsRiDhqXdYbN7qB
	 ejPq68EVm2n6fmepTibXWl9+2yJi+M/QsFhPfD/Q=
From: Mukesh R <mrathor@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joro@8bytes.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	nunodasneves@linux.microsoft.com,
	mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: [PATCH v0 01/15] iommu/hyperv: rename hyperv-iommu.c to hyperv-irq.c
Date: Mon, 19 Jan 2026 22:42:16 -0800
Message-ID: <20260120064230.3602565-2-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.51.2.vfs.0.1
In-Reply-To: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_224328_965785_A55BEEDB 
X-CRM114-Status: GOOD (  11.81  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

This file actually implements irq remapping, so rename to more appropriate
hyperv-irq.c. A new file named hyperv-iommu.c will be introduced later.
Also, move CONFIG_IRQ_REMAP out of the file and add to Makefile.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 MAINTAINERS                                    | 2 +-
 drivers/iommu/Kconfig                          | 1 +
 drivers/iommu/Makefile                         | 2 +-
 drivers/iommu/{hyperv-iommu.c => hyperv-irq.c} | 4 ----
 4 files changed, 3 insertions(+), 6 deletions(-)
 rename drivers/iommu/{hyperv-iommu.c => hyperv-irq.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..381a0e086382 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11741,7 +11741,7 @@ F:	drivers/hid/hid-hyperv.c
 F:	drivers/hv/
 F:	drivers/infiniband/hw/mana/
 F:	drivers/input/serio/hyperv-keyboard.c
-F:	drivers/iommu/hyperv-iommu.c
+F:	drivers/iommu/hyperv-irq.c
 F:	drivers/net/ethernet/microsoft/
 F:	drivers/net/hyperv/
 F:	drivers/pci/controller/pci-hyperv-intf.c
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 99095645134f..b4cc2b42b338 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -355,6 +355,7 @@ config HYPERV_IOMMU
 	bool "Hyper-V IRQ Handling"
 	depends on HYPERV && X86
 	select IOMMU_API
+	select IRQ_REMAP
 	default HYPERV
 	help
 	  Stub IOMMU driver to handle IRQs to support Hyper-V Linux
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 8e8843316c4b..598c39558e7d 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -30,7 +30,7 @@ obj-$(CONFIG_TEGRA_IOMMU_SMMU) += tegra-smmu.o
 obj-$(CONFIG_EXYNOS_IOMMU) += exynos-iommu.o
 obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
 obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
-obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
+obj-$(CONFIG_HYPERV_IOMMU) += hyperv-irq.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
 obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
 obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-irq.c
similarity index 99%
rename from drivers/iommu/hyperv-iommu.c
rename to drivers/iommu/hyperv-irq.c
index 0961ac805944..1944440a5004 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-irq.c
@@ -24,8 +24,6 @@
 
 #include "irq_remapping.h"
 
-#ifdef CONFIG_IRQ_REMAP
-
 /*
  * According 82093AA IO-APIC spec , IO APIC has a 24-entry Interrupt
  * Redirection Table. Hyper-V exposes one single IO-APIC and so define
@@ -330,5 +328,3 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 	.alloc = hyperv_root_irq_remapping_alloc,
 	.free = hyperv_root_irq_remapping_free,
 };
-
-#endif
-- 
2.51.2.vfs.0.1


