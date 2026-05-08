Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B74CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gsFX0ZU3ljYp65FvMXeVh5Lt5/mIztMP9jVW0au1/0=; b=sRZYncK6HiBwgQIS3ubN0XsVsp
	YVFxpAj0Dvq7+6jXWliIT2O/SNPQuEM9REBdGsdKFauyygEinpIz2aoJgiaieRoHzUGCGB+2OqsYi
	ByKUVCutlh59jrHdTUS/x9LMA+whCcTS3t7EzGkIDJSVeNj4WH0L6Re2RHTplcHFMGQUaFKmDK6If
	Y7ACgjB/KerK3Js2JqMdcnk0lChcJQxfwIUlXEWylZB+MfhkWHc8JwSoxZQHsvFCgKx7aBHc4mLYK
	Xb+PzutiIMbegkiwlpGy8XviWIax1OPmtqBy+p+4wgxGSwwKegYUU6cUq5N7OTqHoT6sWEPyDugrS
	H4S7gJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFkc-00000005r1K-3WH6;
	Fri, 08 May 2026 07:35:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFkZ-00000005qzH-2Snx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778225755; x=1809761755;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=hbSCgbZ3earEZLwKYCheg6AqjRDey4G5iRQfhuiZmME=;
  b=b1pSY0ZsnXUqN+Hz2G10ncRV3i48geazsxexKNr7rnkBocofylYg2zt9
   +1KJFnPVGUEZ5dEZr3AceJJZFoEiwnPbzygK8zeeIi3B2sN+FT7k53c3l
   YucIqx1Dt5ODpUpDsumLIHOLaUxdTSSp8oD7/lG5HH4jHqc4Qf8Kqe2j+
   2tY9x6vKe96YCSgXW2Xxd78sw6msw4FNkYZduAcbyR8I8vxR8sY4qkGQi
   XhxK64bg8ygP8+JRfnOR3OR65oGIQvIaPTrmkFoV2dBkorKVNLNjTNCkz
   +/e3CuXLRNkwvRCdv/Hx02RcrjQ5WOJtjF5SBM/UEgQ3IAmAPbsWcoI5e
   w==;
X-CSE-ConnectionGUID: UbJ3J3pLR1Sqh2zKjxwFfA==
X-CSE-MsgGUID: fqDW5RcQTkCr3h2XwTSAfg==
X-IronPort-AV: E=Sophos;i="6.23,223,1770620400"; 
   d="scan'208";a="56432152"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 May 2026 00:35:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 8 May 2026 00:35:53 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 8 May 2026 00:35:49 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 8 May 2026 09:35:27 +0200
Subject: [PATCH net-next v4 03/13] net: microchip: fdma: add PCIe ATU
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-lan966x-pci-fdma-v4-3-14e0c89d8d63@microchip.com>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
In-Reply-To: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_003555_743248_8C05F13D 
X-CRM114-Status: GOOD (  29.70  )
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

When lan966x or lan969x operates as a PCIe endpoint, the internal FDMA
engine cannot directly access host memory. Instead, DMA addresses must
be translated through the PCIe Address Translation Unit (ATU). The ATU
provides outbound windows that map internal addresses to PCIe bus
addresses.

The ATU outbound address space (0x10000000-0x1fffffff) is divided into
six equally-sized regions (~42MB each). When FDMA buffers are allocated,
a free ATU region is claimed and programmed with the DMA target address.
The FDMA engine then uses the region's base address in its descriptors,
and the ATU translates these to the actual DMA addresses on the PCIe bus.

Add the required functions and helpers that combine the DMA allocation
with the ATU region mapping, effectively adding support for PCIe FDMA.

This implementation will also be used by the lan969x, when PCIe FDMA is
added for that platform in the future.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/fdma/Makefile   |   4 +
 drivers/net/ethernet/microchip/fdma/fdma_api.c |  33 +++++
 drivers/net/ethernet/microchip/fdma/fdma_api.h |  16 +++
 drivers/net/ethernet/microchip/fdma/fdma_pci.c | 182 +++++++++++++++++++++++++
 drivers/net/ethernet/microchip/fdma/fdma_pci.h |  42 ++++++
 5 files changed, 277 insertions(+)

diff --git a/drivers/net/ethernet/microchip/fdma/Makefile b/drivers/net/ethernet/microchip/fdma/Makefile
index cc9a736be357..eed4df6f7158 100644
--- a/drivers/net/ethernet/microchip/fdma/Makefile
+++ b/drivers/net/ethernet/microchip/fdma/Makefile
@@ -5,3 +5,7 @@
 
 obj-$(CONFIG_FDMA) += fdma.o
 fdma-y += fdma_api.o
+
+ifdef CONFIG_MCHP_LAN966X_PCI
+fdma-y += fdma_pci.o
+endif
diff --git a/drivers/net/ethernet/microchip/fdma/fdma_api.c b/drivers/net/ethernet/microchip/fdma/fdma_api.c
index e78c3590da9e..e0c2b137afef 100644
--- a/drivers/net/ethernet/microchip/fdma/fdma_api.c
+++ b/drivers/net/ethernet/microchip/fdma/fdma_api.c
@@ -127,6 +127,39 @@ void fdma_free_phys(struct fdma *fdma)
 }
 EXPORT_SYMBOL_GPL(fdma_free_phys);
 
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+/* Allocate coherent DMA memory and map it in the ATU. */
+int fdma_alloc_coherent_and_map(struct device *dev, struct fdma *fdma,
+				struct fdma_pci_atu *atu)
+{
+	struct fdma_pci_atu_region *region;
+	int err;
+
+	err = fdma_alloc_coherent(dev, fdma);
+	if (err)
+		return err;
+
+	region = fdma_pci_atu_region_map(atu, fdma->dma, fdma->size);
+	if (IS_ERR(region)) {
+		fdma_free_coherent(dev, fdma);
+		return PTR_ERR(region);
+	}
+
+	fdma->atu_region = region;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fdma_alloc_coherent_and_map);
+
+/* Free coherent DMA memory and unmap the memory in the ATU. */
+void fdma_free_coherent_and_unmap(struct device *dev, struct fdma *fdma)
+{
+	fdma_pci_atu_region_unmap(fdma->atu_region);
+	fdma_free_coherent(dev, fdma);
+}
+EXPORT_SYMBOL_GPL(fdma_free_coherent_and_unmap);
+#endif
+
 /* Get the size of the FDMA memory */
 u32 fdma_get_size(struct fdma *fdma)
 {
diff --git a/drivers/net/ethernet/microchip/fdma/fdma_api.h b/drivers/net/ethernet/microchip/fdma/fdma_api.h
index 94f1a6596097..0e0f8af7463f 100644
--- a/drivers/net/ethernet/microchip/fdma/fdma_api.h
+++ b/drivers/net/ethernet/microchip/fdma/fdma_api.h
@@ -7,6 +7,10 @@
 #include <linux/etherdevice.h>
 #include <linux/types.h>
 
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+#include "fdma_pci.h"
+#endif
+
 /* This provides a common set of functions and data structures for interacting
  * with the Frame DMA engine on multiple Microchip switchcores.
  *
@@ -109,6 +113,11 @@ struct fdma {
 	u32 channel_id;
 
 	struct fdma_ops ops;
+
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+	/* PCI ATU region for this FDMA instance. */
+	struct fdma_pci_atu_region *atu_region;
+#endif
 };
 
 /* Advance the DCB index and wrap if required. */
@@ -234,9 +243,16 @@ int __fdma_dcb_add(struct fdma *fdma, int dcb_idx, u64 info, u64 status,
 
 int fdma_alloc_coherent(struct device *dev, struct fdma *fdma);
 int fdma_alloc_phys(struct fdma *fdma);
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+int fdma_alloc_coherent_and_map(struct device *dev, struct fdma *fdma,
+				struct fdma_pci_atu *atu);
+#endif
 
 void fdma_free_coherent(struct device *dev, struct fdma *fdma);
 void fdma_free_phys(struct fdma *fdma);
+#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
+void fdma_free_coherent_and_unmap(struct device *dev, struct fdma *fdma);
+#endif
 
 u32 fdma_get_size(struct fdma *fdma);
 u32 fdma_get_size_contiguous(struct fdma *fdma);
diff --git a/drivers/net/ethernet/microchip/fdma/fdma_pci.c b/drivers/net/ethernet/microchip/fdma/fdma_pci.c
new file mode 100644
index 000000000000..1bd41eaa58a4
--- /dev/null
+++ b/drivers/net/ethernet/microchip/fdma/fdma_pci.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include "fdma_pci.h"
+
+/* When the switch operates as a PCIe endpoint, the FDMA engine needs to
+ * DMA to/from host memory. The FDMA writes to addresses within the endpoint's
+ * internal Outbound (OB) address space, and the PCIe ATU translates these to
+ * DMA addresses on the PCIe bus, targeting host memory.
+ *
+ * The ATU supports up to six outbound regions. This implementation divides
+ * the OB address space into six equally sized chunks.
+ *
+ * +-------------+------------+------------+-----+------------+
+ * | Index       | Region 0   | Region 1   | ... | Region 5   |
+ * +-------------+------------+------------+-----+------------+
+ * | Base addr   | 0x10000000 | 0x12aa0000 | ... | 0x1d500000 |
+ * | Limit addr  | 0x12a9ffff | 0x1553ffff | ... | 0x1ff9ffff |
+ * | Target addr | host dma   | host dma   | ... | host dma   |
+ * +-------------+------------+------------+-----+------------+
+ *
+ * Base addr is the start address of the region within the OB address space.
+ * Limit addr is the end address of the region within the OB address space.
+ * Target addr is the host DMA address that the base addr translates to.
+ */
+
+#define FDMA_PCI_ATU_REGION_ALIGN    BIT(16) /* 64KB */
+#define FDMA_PCI_ATU_OB_START        0x10000000
+#define FDMA_PCI_ATU_OB_END          0x1fffffff
+
+#define FDMA_PCI_ATU_ADDR            0x300000
+#define FDMA_PCI_ATU_IDX_SIZE        0x200
+#define FDMA_PCI_ATU_ENA_REG         0x4
+#define FDMA_PCI_ATU_ENA_BIT         BIT(31)
+#define FDMA_PCI_ATU_LWR_BASE_ADDR   0x8
+#define FDMA_PCI_ATU_UPP_BASE_ADDR   0xc
+#define FDMA_PCI_ATU_LIMIT_ADDR      0x10
+#define FDMA_PCI_ATU_LWR_TARGET_ADDR 0x14
+#define FDMA_PCI_ATU_UPP_TARGET_ADDR 0x18
+
+static u32 fdma_pci_atu_region_size(void)
+{
+	return round_down((FDMA_PCI_ATU_OB_END - FDMA_PCI_ATU_OB_START) /
+			  FDMA_PCI_ATU_REGION_MAX, FDMA_PCI_ATU_REGION_ALIGN);
+}
+
+static void __iomem *fdma_pci_atu_addr_get(void __iomem *addr, int offset,
+					   int idx)
+{
+	return addr + FDMA_PCI_ATU_ADDR + FDMA_PCI_ATU_IDX_SIZE * idx + offset;
+}
+
+static void fdma_pci_atu_region_enable(struct fdma_pci_atu_region *region)
+{
+	writel(FDMA_PCI_ATU_ENA_BIT,
+	       fdma_pci_atu_addr_get(region->atu->addr, FDMA_PCI_ATU_ENA_REG,
+				     region->idx));
+}
+
+static void fdma_pci_atu_region_disable(struct fdma_pci_atu_region *region)
+{
+	writel(0, fdma_pci_atu_addr_get(region->atu->addr, FDMA_PCI_ATU_ENA_REG,
+					region->idx));
+}
+
+/* Configure the address translation in the ATU. */
+static void
+fdma_pci_atu_configure_translation(struct fdma_pci_atu_region *region)
+{
+	struct fdma_pci_atu *atu = region->atu;
+	int idx = region->idx;
+
+	writel(lower_32_bits(region->base_addr),
+	       fdma_pci_atu_addr_get(atu->addr,
+				     FDMA_PCI_ATU_LWR_BASE_ADDR, idx));
+
+	writel(upper_32_bits(region->base_addr),
+	       fdma_pci_atu_addr_get(atu->addr,
+				     FDMA_PCI_ATU_UPP_BASE_ADDR, idx));
+
+	/* Upper limit register only needed with REGION_SIZE > 4GB. */
+	writel(region->limit_addr,
+	       fdma_pci_atu_addr_get(atu->addr, FDMA_PCI_ATU_LIMIT_ADDR, idx));
+
+	writel(lower_32_bits(region->target_addr),
+	       fdma_pci_atu_addr_get(atu->addr,
+				     FDMA_PCI_ATU_LWR_TARGET_ADDR, idx));
+
+	writel(upper_32_bits(region->target_addr),
+	       fdma_pci_atu_addr_get(atu->addr,
+				     FDMA_PCI_ATU_UPP_TARGET_ADDR, idx));
+}
+
+/* Find an unused ATU region. */
+static struct fdma_pci_atu_region *
+fdma_pci_atu_region_get_free(struct fdma_pci_atu *atu)
+{
+	struct fdma_pci_atu_region *regions = atu->regions;
+
+	for (int i = 0; i < FDMA_PCI_ATU_REGION_MAX; i++) {
+		if (regions[i].in_use)
+			continue;
+
+		return &regions[i];
+	}
+
+	return ERR_PTR(-ENOSPC);
+}
+
+/* Unmap an ATU region, clearing its translation and disabling it. */
+void fdma_pci_atu_region_unmap(struct fdma_pci_atu_region *region)
+{
+	if (IS_ERR_OR_NULL(region))
+		return;
+
+	region->target_addr = 0;
+	region->in_use = false;
+
+	fdma_pci_atu_region_disable(region);
+	fdma_pci_atu_configure_translation(region);
+}
+EXPORT_SYMBOL_GPL(fdma_pci_atu_region_unmap);
+
+/* Map a host DMA address into a free outbound region. */
+struct fdma_pci_atu_region *
+fdma_pci_atu_region_map(struct fdma_pci_atu *atu, u64 target_addr, int size)
+{
+	struct fdma_pci_atu_region *region;
+
+	if (!atu)
+		return ERR_PTR(-EINVAL);
+
+	if (size <= 0)
+		return ERR_PTR(-EINVAL);
+
+	if (size > fdma_pci_atu_region_size())
+		return ERR_PTR(-E2BIG);
+
+	region = fdma_pci_atu_region_get_free(atu);
+	if (IS_ERR(region))
+		return region;
+
+	region->target_addr = target_addr;
+	region->in_use = true;
+
+	/* Enable first, according to datasheet section 3.24.7.4.1 */
+	fdma_pci_atu_region_enable(region);
+	fdma_pci_atu_configure_translation(region);
+
+	return region;
+}
+EXPORT_SYMBOL_GPL(fdma_pci_atu_region_map);
+
+/* Translate a host DMA address to the corresponding OB address. */
+u64 fdma_pci_atu_translate_addr(struct fdma_pci_atu_region *region, u64 addr)
+{
+	return region->base_addr + (addr - region->target_addr);
+}
+EXPORT_SYMBOL_GPL(fdma_pci_atu_translate_addr);
+
+/* Initialize ATU, dividing the OB space into equally sized regions. */
+void fdma_pci_atu_init(struct fdma_pci_atu *atu, void __iomem *addr)
+{
+	struct fdma_pci_atu_region *regions = atu->regions;
+	u32 region_size = fdma_pci_atu_region_size();
+
+	atu->addr = addr;
+
+	for (int i = 0; i < FDMA_PCI_ATU_REGION_MAX; i++) {
+		regions[i].base_addr =
+			FDMA_PCI_ATU_OB_START + (i * region_size);
+		regions[i].limit_addr =
+			regions[i].base_addr + region_size - 1;
+		regions[i].idx = i;
+		regions[i].atu = atu;
+	}
+}
+EXPORT_SYMBOL_GPL(fdma_pci_atu_init);
diff --git a/drivers/net/ethernet/microchip/fdma/fdma_pci.h b/drivers/net/ethernet/microchip/fdma/fdma_pci.h
new file mode 100644
index 000000000000..eccfe5dc25e7
--- /dev/null
+++ b/drivers/net/ethernet/microchip/fdma/fdma_pci.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _FDMA_PCI_H_
+#define _FDMA_PCI_H_
+
+#include <linux/types.h>
+
+#define FDMA_PCI_ATU_REGION_MAX 6
+#define FDMA_PCI_DB_ALIGN 128
+#define FDMA_PCI_DB_SIZE(mtu) ALIGN(mtu, FDMA_PCI_DB_ALIGN)
+
+struct fdma_pci_atu;
+
+struct fdma_pci_atu_region {
+	struct fdma_pci_atu *atu;
+	u64 base_addr; /* Base addr of the OB window */
+	u64 limit_addr; /* Limit addr of the OB window */
+	u64 target_addr; /* Host DMA address this region maps to */
+	int idx;
+	bool in_use;
+};
+
+struct fdma_pci_atu {
+	void __iomem *addr;
+	struct fdma_pci_atu_region regions[FDMA_PCI_ATU_REGION_MAX];
+};
+
+/* Initialize ATU, dividing OB space into regions. */
+void fdma_pci_atu_init(struct fdma_pci_atu *atu, void __iomem *addr);
+
+/* Unmap an ATU region, clearing its translation and disabling it. */
+void fdma_pci_atu_region_unmap(struct fdma_pci_atu_region *region);
+
+/* Map a host DMA address into a free ATU region. */
+struct fdma_pci_atu_region *fdma_pci_atu_region_map(struct fdma_pci_atu *atu,
+						    u64 target_addr,
+						    int size);
+
+/* Translate a host DMA address to the OB address space. */
+u64 fdma_pci_atu_translate_addr(struct fdma_pci_atu_region *region, u64 addr);
+
+#endif

-- 
2.34.1


