Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04A0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ldhvgDRkqB/DjNxtzDcM9V3rJ5bxO0HpM/uFVjZcw4=; b=3LMrxoIWqyI92/UoXWtRvXK7sB
	nz6RP1es5hnornjwXiushswSKApjoZPPD5ZMS5+v2uoT9K48TWojZTrpmmb85RMSwy65g8u0jvVg5
	bynNRQHrZRoG3BkClb4ZM58zKu3yvmW6mrqE7Cn1aRtCgD9G4OlMtB8krg76wTl40wEFh2pF6mJ7X
	oWb3ZJjbJdj+ERXA7h9CzTPWJoNjW4PVAXFDzoH5AloWLfxJhlbLh5ygLH5O/2j6H80tkcAZ48hWO
	TYn7xAaPjJBPFARznfJwLlCx7UE0niqOPLxdJ02tXoMrJx8rS7GWvjasRBY+9yLnZok+sXl8RlLXE
	wjq2M3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEe-00000008h4p-0GGq;
	Fri, 24 Oct 2025 08:33:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEI-00000008gWS-1CBA;
	Fri, 24 Oct 2025 08:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294776;
	bh=HQopExTfYMMC9PRTxaYPvXto8YHJKniZdYrZgKbDlfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BmI0Ell6qKE6MTMsp8dvWUWGaxTYWTqzWcTPje/I9Td38bP/vt4DyMEp4B3N8VN5D
	 dT8omPRYo/McVvZ3W91uR5pwkCbxw7tCD9uCrsP/fLWuBQJFD2RV4jVBehwnE+twZW
	 MXQWVotBd0D6uYUoY53aJyK7/h1JYCWthQIQZolMF4TuzJsvByQ3YyEIxZK6i63DDn
	 RCEUuHukT/03067QsD1EvpxEnxRyz+IX6BqDCSlnqpfMHVajFGMrZIZ6yQa//jadq7
	 S5PBFqgnDJrKEfze7JShZVU/SWN2kLEpPPbCtyLx1pUTIdhkrnoCVa1VDc3Hs/8TiR
	 N5fDvUAXgDzOg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E98F017E1404;
	Fri, 24 Oct 2025 10:32:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 4/5] spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
Date: Fri, 24 Oct 2025 10:32:46 +0200
Message-ID: <20251024083247.25814-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
References: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013258_499693_61D8DFC8 
X-CRM114-Status: GOOD (  26.09  )
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

Add support for the per-bus RCS interrupt by adding a new linear
irqdomain and its irqchip.

The SPMI controller will raise an interrupt when any of the SPMI
connected devices' irq needs attention (whenever any interrupt
fires on any SID) in one of four registers, where each register
holds four sets of four bits of information about a SID interrupt.

This controller's RCS interrupt status knowledge is limited to the
address of the SID that raised an interrupt, but does not have any
details about the devices irq numbers: as this may change with a
future SPMI controller IP version, the devicetree is meant to hold
three cells, where the first one is the SPMI SID interrupt number,
the second one is a device interrupt number, and the third one is
the irq sense type.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 232 ++++++++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 6 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 9f416b231ab8..624611dd4849 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -5,12 +5,17 @@
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spmi.h>
+#include <linux/irqchip/chained_irq.h>
 
 #define SWINF_IDLE	0x00
 #define SWINF_WFVLDCLR	0x06
@@ -26,6 +31,7 @@
 #define PMIF_TIMEOUT_US (10 * 1000)
 
 #define PMIF_CHAN_OFFSET 0x5
+#define PMIF_RCS_IRQ_MASK	GENMASK(7, 0)
 
 #define PMIF_MAX_BUSES	2
 #define PMIF_MAX_CLKS	3
@@ -44,6 +50,7 @@ struct pmif_data {
 	const u32	*regs;
 	const u32	*spmimst_regs;
 	u32	soc_chan;
+	u8	spmi_ver;
 	u32	num_spmi_buses;
 };
 
@@ -51,8 +58,13 @@ struct pmif_bus {
 	void __iomem	*base;
 	void __iomem	*spmimst_base;
 	struct spmi_controller *ctrl;
+	struct irq_domain *dom;
+	int irq;
 	struct clk_bulk_data clks[PMIF_MAX_CLKS];
 	size_t nclks;
+	u8 irq_min_sid;
+	u8 irq_max_sid;
+	u16 irq_en;
 	raw_spinlock_t	lock;
 };
 
@@ -287,6 +299,11 @@ static void pmif_writel(struct pmif *arb, struct pmif_bus *pbus,
 	writel(val, pbus->base + arb->data->regs[reg]);
 }
 
+static u32 mtk_spmi_readl(struct pmif *arb, struct pmif_bus *pbus, enum spmi_regs reg)
+{
+	return readl(pbus->spmimst_base + arb->data->spmimst_regs[reg]);
+}
+
 static void mtk_spmi_writel(struct pmif *arb, struct pmif_bus *pbus,
 			    u32 val, enum spmi_regs reg)
 {
@@ -343,7 +360,6 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	if (len > 4) {
 		dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
-
 		return -EINVAL;
 	}
 
@@ -455,6 +471,159 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	return 0;
 }
 
+static void mtk_spmi_handle_chained_irq(struct irq_desc *desc)
+{
+	struct pmif_bus *pbus = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	u8 regidx_min, regidx_max;
+	bool irq_handled = false;
+	unsigned int i;
+
+	regidx_min = pbus->irq_min_sid / 4;
+	regidx_min += SPMI_SLV_3_0_EINT;
+
+	regidx_max = pbus->irq_max_sid / 4;
+	regidx_max += SPMI_SLV_3_0_EINT;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = regidx_min; i <= regidx_max; i++) {
+		u32 val = mtk_spmi_readl(arb, pbus, i);
+
+		while (val) {
+			u8 bit = __ffs(val);
+			u8 bank = bit / 7;
+			u8 sid = ((i - SPMI_SLV_3_0_EINT) * 4) + bank;
+
+			val &= ~(PMIF_RCS_IRQ_MASK << (8 * bank));
+
+			/* Check if IRQs for this SID are enabled */
+			if (!(pbus->irq_en & BIT(sid)))
+				continue;
+
+			generic_handle_domain_irq_safe(pbus->dom, sid);
+			irq_handled = true;
+		}
+	}
+
+	if (!irq_handled)
+		handle_bad_irq(desc);
+
+	chained_irq_exit(chip, desc);
+}
+
+static void mtk_spmi_rcs_irq_eoi(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+	unsigned int reg, shift;
+
+	/* There are four interrupts (8 bits each) per register */
+	reg = SPMI_SLV_3_0_EINT + d->hwirq / 4;
+	shift = (irq % 4) * 8;
+
+	mtk_spmi_writel(arb, pbus, PMIF_RCS_IRQ_MASK << shift, reg);
+}
+
+static void mtk_spmi_rcs_irq_enable(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+
+	pbus->irq_en |= BIT(irq);
+}
+
+static void mtk_spmi_rcs_irq_disable(struct irq_data *d)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t irq = irqd_to_hwirq(d);
+
+	pbus->irq_en &= ~BIT(irq);
+}
+
+static int mtk_spmi_rcs_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct pmif_bus *pbus = irq_data_get_irq_chip_data(d);
+
+	return irq_set_irq_wake(pbus->irq, on);
+}
+
+static const struct irq_chip mtk_spmi_rcs_irq_chip = {
+	.name			= "spmi_rcs",
+	.irq_eoi		= mtk_spmi_rcs_irq_eoi,
+	.irq_enable		= mtk_spmi_rcs_irq_enable,
+	.irq_disable		= mtk_spmi_rcs_irq_disable,
+	.irq_set_wake		= mtk_spmi_rcs_irq_set_wake,
+};
+
+static int mtk_spmi_rcs_irq_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct pmif_bus *pbus = d->host_data;
+	struct device *dev = &pbus->ctrl->dev;
+	u32 *intspec = fwspec->param;
+
+	if (intspec[0] > SPMI_MAX_SLAVE_ID)
+		return -EINVAL;
+
+	/*
+	 * The IRQ number in intspec[1] is ignored on purpose here!
+	 *
+	 * The controller only has knowledge of which SID raised an interrupt
+	 * and the type of irq, but doesn't know about any device irq number,
+	 * hence that must be read from the SPMI device's registers.
+	 */
+	*out_hwirq = intspec[0];
+	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
+
+	if (pbus->irq_min_sid > intspec[0])
+		pbus->irq_min_sid = intspec[0];
+
+	if (pbus->irq_max_sid < intspec[0])
+		pbus->irq_max_sid = intspec[0];
+
+	dev_dbg(dev, "Found SPMI IRQ %u (map: 0x%lx)\n", intspec[0], *out_hwirq);
+
+	return 0;
+}
+
+static struct lock_class_key mtk_spmi_rcs_irqlock_class, mtk_spmi_rcs_irqreq_class;
+
+static int mtk_spmi_rcs_irq_alloc(struct irq_domain *d, unsigned int virq,
+				  unsigned int nr_irqs, void *data)
+{
+	struct pmif_bus *pbus = d->host_data;
+	struct device *dev = &pbus->ctrl->dev;
+	struct irq_fwspec *fwspec = data;
+	irq_hw_number_t hwirq;
+	unsigned int irqtype;
+	int i, ret;
+
+	ret = mtk_spmi_rcs_irq_translate(d, fwspec, &hwirq, &irqtype);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		dev_dbg(dev, "Mapping IRQ%u (hwirq %lu) with type %u\n",
+			virq, hwirq, irqtype);
+
+		irq_set_lockdep_class(virq, &mtk_spmi_rcs_irqlock_class,
+				      &mtk_spmi_rcs_irqreq_class);
+		irq_domain_set_info(d, virq, hwirq, &mtk_spmi_rcs_irq_chip,
+				    pbus, handle_level_irq, NULL, NULL);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops mtk_spmi_rcs_irq_domain_ops = {
+	.alloc = mtk_spmi_rcs_irq_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = mtk_spmi_rcs_irq_translate,
+};
+
 static const struct pmif_data mt6873_pmif_arb = {
 	.regs = mt6873_regs,
 	.spmimst_regs = mt6873_spmi_regs,
@@ -467,6 +636,44 @@ static const struct pmif_data mt8195_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static int mtk_spmi_irq_init(struct device_node *node,
+			     const struct pmif_data *pdata,
+			     struct pmif_bus *pbus)
+{
+	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
+	unsigned int i;
+
+	/* No interrupts required for SPMI 1.x controller */
+	if (pdata->spmi_ver < 2) {
+		pbus->dom = NULL;
+		return 0;
+	}
+
+	pbus->irq = of_irq_get_byname(node, "rcs");
+	if (pbus->irq <= 0)
+		return pbus->irq ? : -ENXIO;
+
+	pbus->dom = irq_domain_create_tree(of_fwnode_handle(node),
+					   &mtk_spmi_rcs_irq_domain_ops, pbus);
+	if (!pbus->dom)
+		return -ENOMEM;
+
+	/* Clear possible unhandled interrupts coming from bootloader SPMI init */
+	for (i = SPMI_SLV_3_0_EINT; i <= SPMI_SLV_F_C_EINT; i++)
+		mtk_spmi_writel(arb, pbus, GENMASK(31, 0), i);
+
+	return 0;
+}
+
+static void mtk_spmi_irq_remove(struct pmif_bus *pbus)
+{
+	if (!pbus->dom)
+		return;
+
+	irq_set_chained_handler_and_data(pbus->irq, NULL, NULL);
+	irq_domain_remove(pbus->dom);
+}
+
 static int mtk_spmi_bus_probe(struct platform_device *pdev,
 			      struct device_node *node,
 			      const struct pmif_data *pdata,
@@ -512,12 +719,21 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 		pbus->clks[i].id = pmif_clock_names[i];
 		pbus->clks[i].clk = of_clk_get_by_name(node, pbus->clks[i].id);
 		if (IS_ERR(pbus->clks[i].clk))
-			return PTR_ERR(pbus->clks[i].clk);
+			return dev_err_probe(&pdev->dev, PTR_ERR(pbus->clks[i].clk),
+					     "Failed to get clocks\n");
 	}
 
 	err = clk_bulk_prepare_enable(pbus->nclks, pbus->clks);
-	if (err)
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Failed to enable clocks\n");
 		goto err_put_clks;
+	}
+
+	err = mtk_spmi_irq_init(node, pdata, pbus);
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Cannot initialize SPMI IRQs\n");
+		goto err_disable_clks;
+	}
 
 	ctrl->cmd = pmif_arb_cmd;
 	ctrl->read_cmd = pmif_spmi_read_cmd;
@@ -529,13 +745,16 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 
 	err = spmi_controller_add(ctrl);
 	if (err)
-		goto err_domain_remove;
+		goto err_remove_irq;
 
-	pbus->ctrl = ctrl;
+	if (pbus->dom)
+		irq_set_chained_handler_and_data(pbus->irq, mtk_spmi_handle_chained_irq, pbus);
 
 	return 0;
 
-err_domain_remove:
+err_remove_irq:
+	mtk_spmi_irq_remove(pbus);
+err_disable_clks:
 	clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);
 err_put_clks:
 	clk_bulk_put(pbus->nclks, pbus->clks);
@@ -600,6 +819,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 		if (!pbus->ctrl)
 			continue;
 
+		mtk_spmi_irq_remove(pbus);
 		spmi_controller_remove(pbus->ctrl);
 		clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);
 		clk_bulk_put(pbus->nclks, pbus->clks);
-- 
2.51.1


