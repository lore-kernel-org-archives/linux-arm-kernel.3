Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E17DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+KHULNUGO23fKouFSgH85v42r+d7/wZHkSXeBZEIno=; b=bsojgdb9GnArygsEAg2ZNhh2Mc
	x/GHu3VZIbwvYv589JzDeak+sON/a/nGsAAite8D1r/Z1JDSP7OUlylqmrJqx9kxiktXjBk/BDsjJ
	6YDXs9Y9579wGKjL7g+Kl1uKo2Y44X1H/d/6ZQI6rbuhuyNLbyo+EXmnb3XO4g141KPvmp0IKZC+O
	i/isoc8z1RQwDyoncDBA25aJli1/gCcF7JmuIRuHQgjiI7p59D5dBRRqO61v/A0Lfik1FS+RelaQZ
	FpVfRipYlCZTSqLvMYfOmDStUDD5PXXg5O+YCdbgKKC173CH1WZSNf40D/BErn0vbzPe+qwl4fMgl
	nY65wgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYY-0000000FsNO-3cSd;
	Tue, 07 Jul 2026 20:38:14 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCYU-0000000FsKV-275l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:38:13 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gvtN02F1Nz8v8b;
	Tue, 07 Jul 2026 22:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+KHULNUGO23fKouFSgH85v42r+d7/wZHkSXeBZEIno=;
	b=Kv/4dQd1kRa42MH6ABoVp5Gta9fBtNQ9sonVEZl4HjeOrBOLzVXQ+CTgNZ2ErPn2JEIOVO
	X4NsZF6XG3DVdQ8coTN7zqCdTizNujWbWf7OJgw4qgGKBRUev6gUcwAjhptLx1DmazjBei
	91ACjR4MaKScBtVWY49LJd8WDD8INIPY20WtZc8wK4FN+8+oIZwkAPNV3MYlS7oriliwyR
	QG0mQVc835nyh9m1YGFtTrIdGJwtJYqpLlKyQRFJh7SpDzHfYcAGt4drIogTq9TWGNnTcn
	Tx+uk4ND3AHBFVE9GpB9YCMxC/sVZEJHIoO8aaq+GJssAExulpiGUIiHCRtlMA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MtpujWlS;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783456686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+KHULNUGO23fKouFSgH85v42r+d7/wZHkSXeBZEIno=;
	b=MtpujWlSni6HxH3bWQh6hxG/aOjSfBZJf6MoZ+KNdrpJ6cSLEyhzdlxlgwxB9KyeTLc6il
	9sic+Tl1/YSW9qyAmwULkIJD06A0Rvu8UuSyYD10UGXhcPrqyZZut1k2fMnjlLKnaZVgTn
	QLssvOEB9VGJDTKzkbH3DcGvEeb6aNZqO0N8hYFy7+V/iiHT7Pjm8gFjxfDD9vPQlM9Iyh
	RfY31GN2erNmlXk8cK3PUokCS0sCpJYuQ1pqbSkz8hk3BjwYr/bI63XBDSBiAZHQzg82iu
	KqGz1U+BLpaWrP3iyhALY5MlvqC3KdK00/yoPEorzcWVOiih2eKVwxOpJrhFcQ==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/5] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
Date: Tue,  7 Jul 2026 22:35:40 +0200
Message-ID: <20260707203743.88299-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 325d9fb9c0dbff73c3a
X-MBO-RS-META: wxct99y3u7k5nqxtqbj4samnz8ui7drt
X-Rspamd-Queue-Id: 4gvtN02F1Nz8v8b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133810_706700_A5D0400C 
X-CRM114-Status: GOOD (  21.53  )
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

In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
MSI are handled via GIC ITS. Configure all controller MSI registers
fully.

Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
enable MSI_CTRL_INT bit according to MSI enable state, set both bits
if MSI are enabled, clear both bits if MSI are disabled.

If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
pass through of MSI TLPs onto the AXI bus and then further into
GIC ITS translation registers.

If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
with target address of GIC ITS translation registers, and configure
AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
GIC ITS. This specific configuration allows handling of MSI via the
GIC ITS instead of integrated iMSI-RX.

Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This would not be possible without prior work from Shimoda-san
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Pull GITS_TRANSLATER address from DT, which also fixes missing +0x40
    offset of the GITS_TRANSLATER register
V3: Add Co-developed-by to credit Shimoda-san
V4: Fix INTC_MASK to be GENMASK(11, 3) instead of GENMASK(11, 2)
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 118 +++++++++++++++++++-
 1 file changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 8b03c42f8c84c..5f7211b91ee5b 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -13,8 +13,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/arm-gic-v3.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -31,6 +34,10 @@
 #define DEVICE_TYPE_RC		BIT(4)
 #define BIFUR_MOD_SET_ON	BIT(0)
 
+/* MSI Capability */
+#define MSICAP0			0x0050
+#define MSICAP0_MSIE		BIT(16)
+
 /* PCIe Interrupt Status 0 */
 #define PCIEINTSTS0		0x0084
 
@@ -55,6 +62,14 @@
 #define APP_HOLD_PHY_RST	BIT(16)
 #define APP_LTSSM_ENABLE	BIT(0)
 
+/* INTC address */
+#define AXIINTCADDR		0x0a00
+
+/* INTC control & mask */
+#define AXIINTCCONT		0x0a04
+#define INTC_EN			BIT(31)
+#define INTC_MASK		GENMASK(11, 3)
+
 /* PCIe Power Management Control */
 #define PCIEPWRMNGCTRL		0x0070
 #define APP_CLK_REQ_N		BIT(11)
@@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	return rcar;
 }
 
+static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct device_node *msi_node = NULL;
+	struct device *dev = dw->dev;
+	struct resource res;
+	u64 addr;
+	int ret;
+
+	/*
+	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
+	 * to obtain the MSI node.
+	 */
+	of_msi_xlate(dev, &msi_node, 0);
+	if (!msi_node)
+		return -ENODEV;
+
+	/* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
+	if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
+		return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
+
+	/* Derive GITS_TRANSLATER address from GICv3 */
+	ret = of_address_to_resource(msi_node, 0, &res);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
+
+	addr = res.start + GITS_TRANSLATER;
+	if (addr >= SZ_4G)
+		return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
+
+	*msi_addr = addr;
+	return 0;
+}
+
+static int rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	u32 val;
+	int ret;
+
+	/* Make sure MSICAP0 MSIE is configured. */
+	val = dw_pcie_readl_dbi(dw, MSICAP0);
+	if (pci_msi_enabled())
+		val |= MSICAP0_MSIE;
+	else
+		val &= ~MSICAP0_MSIE;
+	dw_pcie_writel_dbi(dw, MSICAP0, val);
+
+	if (!pci_msi_enabled() || pp->use_imsi_rx) {
+		/* Clear AXIINTC mapping. */
+		writel(0, rcar->base + AXIINTCADDR);
+		writel(0, rcar->base + AXIINTCCONT);
+	} else {
+		ret = rcar_gen4_pcie_host_msi_addr(pp, &val);
+		if (ret)
+			goto err;
+
+		/* Point AXIINTC to GIC ITS and enable. */
+		writel(val, rcar->base + AXIINTCADDR);
+		writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
+	}
+
+	/* Configure MSI interrupt signal */
+	val = readl(rcar->base + PCIEINTSTS0EN);
+	if (pci_msi_enabled())
+		val |= MSI_CTRL_INT;
+	else
+		val &= ~MSI_CTRL_INT;
+	writel(val, rcar->base + PCIEINTSTS0EN);
+
+	return 0;
+
+err:
+	/* Deconfigure MSICAP0 MSIE. */
+	val = dw_pcie_readl_dbi(dw, MSICAP0);
+	val &= ~MSICAP0_MSIE;
+	dw_pcie_writel_dbi(dw, MSICAP0, val);
+
+	/* Clear AXIINTC mapping. */
+	writel(0, rcar->base + AXIINTCADDR);
+	writel(0, rcar->base + AXIINTCCONT);
+
+	/* Deconfigure MSI interrupt signal */
+	val = readl(rcar->base + PCIEINTSTS0EN);
+	val &= ~MSI_CTRL_INT;
+	writel(val, rcar->base + PCIEINTSTS0EN);
+
+	return ret;
+}
+
 /* Host mode */
 static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
 	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
 	int ret;
-	u32 val;
 
 	gpiod_set_value_cansleep(dw->pe_rst, 1);
 
@@ -328,16 +433,19 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
 	dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
 
-	/* Enable MSI interrupt signal */
-	val = readl(rcar->base + PCIEINTSTS0EN);
-	val |= MSI_CTRL_INT;
-	writel(val, rcar->base + PCIEINTSTS0EN);
+	ret = rcar_gen4_pcie_host_msi_init(pp);
+	if (ret)
+		goto err;
 
 	msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
 
 	gpiod_set_value_cansleep(dw->pe_rst, 0);
 
 	return 0;
+
+err:
+	rcar_gen4_pcie_common_deinit(rcar);
+	return ret;
 }
 
 static void rcar_gen4_pcie_host_deinit(struct dw_pcie_rp *pp)
-- 
2.53.0


