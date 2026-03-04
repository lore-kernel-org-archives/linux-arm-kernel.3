Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFA0EFCE28
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x57XpSXp3o/kkYQ+jUB80BQ9TC/Ya2dRb5of3OePG7Y=; b=EL7q564lKld+Ewvcw1uanGIFu0
	sQ/QkpDpKwk+jm89qSicoSKhe0Au9CnADJCRddxodhImuASXVAGAS/ZltgzAWVYSy5P7RWoatUHov
	DtsASmNrtbDERi8Xb+fSsjZJ5Cc0qy+Hwz6HL98NYZGgf1lO4onjhfp/1qbKFCMmeVZUhy8VNcXks
	z/i7aFyNRMfXZSERbfpAnMLvuJBH67yiD8qnHsW9wvSDQrodYow0jnPr6Et9O7d4uRfIAV+6XmfYk
	hi/yYCVMeBcYUAkY2noiPpG5Z6SoGBM+NhM7mMh+YLJYvTqVyK11A3fUhMfwrPK/dVDznvNwbtAHv
	/T9EKzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvk-00000000Avs-3PCb;
	Wed, 04 Mar 2026 17:22:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvi-00000000Au7-1xTS;
	Wed, 04 Mar 2026 17:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE6114080E;
	Wed,  4 Mar 2026 17:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1C4C2BC9E;
	Wed,  4 Mar 2026 17:22:31 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] iirqchip/gic children: Use GIC_* DT binding definitions
Date: Wed,  4 Mar 2026 18:21:59 +0100
Message-ID: <42b68ef7417c42bd7df4de7853e774aee5b73b5f.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_092238_556589_9A4053F9 
X-CRM114-Status: GOOD (  19.16  )
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

Several interrupt controllers have GICs as their interrupt parents, to
forward SPI interrupts to.  Improve readability by replacing explicit
and implicit magic zeroes by the GIC_SPI constant from the DT binding
definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-alpine-msi.c     | 4 +++-
 drivers/irqchip/irq-bcm2712-mip.c    | 4 +++-
 drivers/irqchip/irq-crossbar.c       | 8 +++++---
 drivers/irqchip/irq-gic-v2m.c        | 4 +++-
 drivers/irqchip/irq-gic-v3-mbi.c     | 6 ++++--
 drivers/irqchip/irq-imx-gpcv2.c      | 4 +++-
 drivers/irqchip/irq-meson-gpio.c     | 4 +++-
 drivers/irqchip/irq-mst-intc.c       | 6 ++++--
 drivers/irqchip/irq-mtk-cirq.c       | 4 +++-
 drivers/irqchip/irq-mtk-sysirq.c     | 6 ++++--
 drivers/irqchip/irq-qcom-mpm.c       | 4 +++-
 drivers/irqchip/irq-tegra.c          | 2 +-
 drivers/irqchip/irq-ti-sci-inta.c    | 4 +++-
 drivers/irqchip/irq-ti-sci-intr.c    | 4 +++-
 drivers/irqchip/irq-uniphier-aidet.c | 4 +++-
 drivers/irqchip/qcom-pdc.c           | 4 +++-
 16 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 6764d64e79500dcb..309b9578ed6de381 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -26,6 +26,8 @@
 #include <asm/irq.h>
 #include <asm/msi.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /* MSIX message address format: local GIC target */
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
 
@@ -89,7 +91,7 @@ static int alpine_msix_gic_domain_alloc(struct irq_domain *domain, unsigned int
 
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 3;
-	fwspec.param[0] = 0;
+	fwspec.param[0] = GIC_SPI;
 	fwspec.param[1] = sgi;
 	fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
 
diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 06a6ab6270ad36bc..816836f6437c1b26 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -13,6 +13,8 @@
 
 #include <linux/irqchip/irq-msi-lib.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define MIP_INT_RAISE		0x00
 #define MIP_INT_CLEAR		0x10
 #define MIP_INT_CFGL_HOST	0x20
@@ -99,7 +101,7 @@ static int mip_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 3;
-	fwspec.param[0] = 0;
+	fwspec.param[0] = GIC_SPI;
 	fwspec.param[1] = hwirq + mip->msi_base;
 	fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
 
diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index cd1134101ace03e3..dc38eed366bf85ea 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -13,6 +13,8 @@
 #include <linux/of_irq.h>
 #include <linux/slab.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define IRQ_FREE	-1
 #define IRQ_RESERVED	-2
 #define IRQ_SKIP	-3
@@ -95,7 +97,7 @@ static int allocate_gic_irq(struct irq_domain *domain, unsigned virq,
 
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 3;
-	fwspec.param[0] = 0;	/* SPI */
+	fwspec.param[0] = GIC_SPI;
 	fwspec.param[1] = i;
 	fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
 
@@ -117,7 +119,7 @@ static int crossbar_domain_alloc(struct irq_domain *d, unsigned int virq,
 
 	if (fwspec->param_count != 3)
 		return -EINVAL;	/* Not GIC compliant */
-	if (fwspec->param[0] != 0)
+	if (fwspec->param[0] != GIC_SPI)
 		return -EINVAL;	/* No PPI should point to this domain */
 
 	hwirq = fwspec->param[1];
@@ -175,7 +177,7 @@ static int crossbar_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index bd85bd344f259e19..17311ad7a494016b 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -28,6 +28,8 @@
 
 #include <linux/irqchip/irq-msi-lib.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /*
 * MSI_TYPER:
 *     [31:26] Reserved
@@ -117,7 +119,7 @@ static int gicv2m_irq_gic_domain_alloc(struct irq_domain *domain,
 	if (is_of_node(domain->parent->fwnode)) {
 		fwspec.fwnode = domain->parent->fwnode;
 		fwspec.param_count = 3;
-		fwspec.param[0] = 0;
+		fwspec.param[0] = GIC_SPI;
 		fwspec.param[1] = hwirq - 32;
 		fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
 	} else if (is_fwnode_irqchip(domain->parent->fwnode)) {
diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
index 62504deb6cd376a4..5a046a92bc52a063 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -17,9 +17,11 @@
 #include <linux/spinlock.h>
 
 #include <linux/irqchip/arm-gic-v3.h>
-
 #include <linux/irqchip/irq-msi-lib.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+
 struct mbi_range {
 	u32			spi_start;
 	u32			nr_spis;
@@ -62,7 +64,7 @@ static int mbi_irq_gic_domain_alloc(struct irq_domain *domain,
 	 */
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 3;
-	fwspec.param[0] = 0;
+	fwspec.param[0] = GIC_SPI;
 	fwspec.param[1] = hwirq - 32;
 	fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
 
diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 6ea10d3356a7ff86..e269ad794c50af96 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -9,6 +9,8 @@
 #include <linux/irqchip.h>
 #include <linux/syscore_ops.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define IMR_NUM			4
 #define GPC_MAX_IRQS            (IMR_NUM * 32)
 
@@ -151,7 +153,7 @@ static int imx_gpcv2_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index f722e9c57e2e40a5..9f5849ef5cbf6c44 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -16,6 +16,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define MAX_NUM_CHANNEL 64
 #define MAX_INPUT_MUX 256
 
@@ -488,7 +490,7 @@ static int meson_gpio_irq_allocate_gic_irq(struct irq_domain *domain,
 
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 3;
-	fwspec.param[0] = 0;	/* SPI */
+	fwspec.param[0] = GIC_SPI;
 	fwspec.param[1] = hwirq;
 	fwspec.param[2] = meson_gpio_irq_type_output(type);
 
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6fd6d6e3f6..ca254b2d8cf0a0b5 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -15,6 +15,8 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define MST_INTC_MAX_IRQS	64
 
 #define INTC_MASK		0x0
@@ -189,7 +191,7 @@ static int mst_intc_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		if (fwspec->param[1] >= cd->nr_irqs)
@@ -216,7 +218,7 @@ static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -EINVAL;
 
 	/* No PPI should point to this domain */
-	if (fwspec->param[0])
+	if (fwspec->param[0] != GIC_SPI)
 		return -EINVAL;
 
 	hwirq = fwspec->param[1];
diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe303b7..00fb50e8ff40fc1f 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -15,6 +15,8 @@
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 enum mtk_cirq_regoffs_index {
 	CIRQ_STA,
 	CIRQ_ACK,
@@ -151,7 +153,7 @@ static int mtk_cirq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		/* cirq support irq number check */
diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 50f88293b4ccf3fe..8259c37710137297 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -14,6 +14,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 struct mtk_sysirq_chip_data {
 	raw_spinlock_t lock;
 	u32 nr_intpol_bases;
@@ -78,7 +80,7 @@ static int mtk_sysirq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
@@ -101,7 +103,7 @@ static int mtk_sysirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -EINVAL;
 
 	/* sysirq doesn't support PPI */
-	if (fwspec->param[0])
+	if (fwspec->param[0] != GIC_SPI)
 		return -EINVAL;
 
 	hwirq = fwspec->param[1];
diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 83f31ea657b74a77..425f7a8914452d12 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -22,6 +22,8 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /*
  * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
  * which is commonly found on Qualcomm SoCs built on the RPM architecture.
@@ -247,7 +249,7 @@ static int qcom_mpm_alloc(struct irq_domain *domain, unsigned int virq,
 
 	parent_fwspec.fwnode = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
-	parent_fwspec.param[0] = 0;
+	parent_fwspec.param[0] = GIC_SPI;
 	parent_fwspec.param[1] = map->hwirq;
 	parent_fwspec.param[2] = type;
 
diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index b449e9cc4034a372..f141f52862796635 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -226,7 +226,7 @@ static int tegra_ictlr_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		/* No PPI should point to this domain */
-		if (fwspec->param[0] != 0)
+		if (fwspec->param[0] != GIC_SPI)
 			return -EINVAL;
 
 		*hwirq = fwspec->param[1];
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index f1eb2f92f0ca10fd..d2135b304c87adf6 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -23,6 +23,8 @@
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <asm-generic/msi.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define TI_SCI_DEV_ID_MASK	0xffff
 #define TI_SCI_DEV_ID_SHIFT	16
 #define TI_SCI_IRQ_ID_MASK	0xffff
@@ -238,7 +240,7 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_parent_irq(struct irq_dom
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
 		parent_fwspec.param_count = 3;
-		parent_fwspec.param[0] = 0;
+		parent_fwspec.param[0] = GIC_SPI;
 		parent_fwspec.param[1] = p_hwirq - 32;
 		parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
 	} else {
diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 0ea17040e934fd0d..8bcc410c3f5aa3ac 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -17,6 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 /**
  * struct ti_sci_intr_irq_domain - Structure representing a TISCI based
  *				   Interrupt Router IRQ domain.
@@ -164,7 +166,7 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain, unsigned int
 	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
 		/* Parent is GIC */
 		fwspec.param_count = 3;
-		fwspec.param[0] = 0;	/* SPI */
+		fwspec.param[0] = GIC_SPI;
 		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
 		fwspec.param[2] = hwirq_type;
 	} else {
diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniphier-aidet.c
index 6005c2d28dd9389a..bef7978c3d7cd76e 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -16,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define UNIPHIER_AIDET_NR_IRQS		256
 
 #define UNIPHIER_AIDET_DETCONF		0x04	/* inverter register base */
@@ -146,7 +148,7 @@ static int uniphier_aidet_domain_alloc(struct irq_domain *domain,
 	/* parent is GIC */
 	parent_fwspec.fwnode = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
-	parent_fwspec.param[0] = 0;		/* SPI */
+	parent_fwspec.param[0] = GIC_SPI;
 	parent_fwspec.param[1] = hwirq;
 	parent_fwspec.param[2] = type;
 
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32b77fa93f730416..5340fc9abaec1622 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -20,6 +20,8 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #define PDC_MAX_GPIO_IRQS	256
 #define PDC_DRV_OFFSET		0x10000
 
@@ -295,7 +297,7 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	parent_fwspec.fwnode      = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
-	parent_fwspec.param[0]    = 0;
+	parent_fwspec.param[0]    = GIC_SPI;
 	parent_fwspec.param[1]    = pin_to_hwirq(region, hwirq);
 	parent_fwspec.param[2]    = type;
 
-- 
2.43.0


