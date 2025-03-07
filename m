Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6262C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq06ekz4NIYHItIBZAx71Ou5W7/a7zQ5ph6bZ/P8c/U=; b=5A3XMheYfmwRnJ6z66Gs7hUWZ0
	XFSIdrCutPxFCMGi7jA+Jb/KpjMn352euLPKQ/A2TyirXRcDIW4ixMNKjZDdK9dFW5VBwNVojKp/l
	+wqbpGp0B6Qb4ksKpx8pi7zHmmJO5ZRPvHnDArqek3rJ0UC8B34RLGOh0oMN7yeN8DjOttfBY+tww
	8MOoG1YE0HPGrlfld6hpai9Y++JYRUAA0v+EJJnV+cMTrM6NUNLop9scGWnfqtLe81lvGTkE0ceyo
	52NyA0YzGDrA2RRnW/zL57Oqp0Z1JismnIlmOdxPeU4HBUGs/GugUNkXYiSjshjLSB9su4pqE5oA2
	x/V+/KQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMGY-0000000ClKN-3NlV;
	Fri, 07 Mar 2025 01:12:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM1u-0000000ChuS-1tO2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:57:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC97F22BE;
	Thu,  6 Mar 2025 16:57:46 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F5163F5A1;
	Thu,  6 Mar 2025 16:57:32 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/15] irqchip/sunxi-nmi: Support Allwinner A523 NMI controller
Date: Fri,  7 Mar 2025 00:57:03 +0000
Message-ID: <20250307005712.16828-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165734_579177_90E97F38 
X-CRM114-Status: GOOD (  17.80  )
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

The NMI controller in the Allwinner A523 is almost compatible to the
previous versions of this IP, but requires the extra bit 31 to be set in
the enable register to actually report the NMI.

Add a mask to allow such an enable bit to be specified, and add this to
the per-SoC data structure. As this struct was just for different register
offsets so far, it was consequently named "reg_offs", which is now no
longer applicable, so rename this to the more generic "data" on the way,
and move the existing offsets into a struct of its own.

Also add the respective Allwinner A523 compatible string, and set bit 31
in its enable mask, to add support for this SoC.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/irqchip/irq-sunxi-nmi.c | 76 ++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 0b43121520243..b05904a147088 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -48,28 +48,38 @@ enum {
 	SUNXI_SRC_TYPE_EDGE_RISING,
 };
 
-struct sunxi_sc_nmi_reg_offs {
-	u32 ctrl;
-	u32 pend;
-	u32 enable;
+struct sunxi_sc_nmi_data {
+	struct {
+		u32 ctrl;
+		u32 pend;
+		u32 enable;
+	} reg_offs;
+	u32 enable_val;
 };
 
-static const struct sunxi_sc_nmi_reg_offs sun6i_reg_offs __initconst = {
-	.ctrl	= SUN6I_NMI_CTRL,
-	.pend	= SUN6I_NMI_PENDING,
-	.enable	= SUN6I_NMI_ENABLE,
+static const struct sunxi_sc_nmi_data sun6i_data __initconst = {
+	.reg_offs.ctrl		= SUN6I_NMI_CTRL,
+	.reg_offs.pend		= SUN6I_NMI_PENDING,
+	.reg_offs.enable	= SUN6I_NMI_ENABLE,
 };
 
-static const struct sunxi_sc_nmi_reg_offs sun7i_reg_offs __initconst = {
-	.ctrl	= SUN7I_NMI_CTRL,
-	.pend	= SUN7I_NMI_PENDING,
-	.enable	= SUN7I_NMI_ENABLE,
+static const struct sunxi_sc_nmi_data sun7i_data __initconst = {
+	.reg_offs.ctrl		= SUN7I_NMI_CTRL,
+	.reg_offs.pend		= SUN7I_NMI_PENDING,
+	.reg_offs.enable	= SUN7I_NMI_ENABLE,
 };
 
-static const struct sunxi_sc_nmi_reg_offs sun9i_reg_offs __initconst = {
-	.ctrl	= SUN9I_NMI_CTRL,
-	.pend	= SUN9I_NMI_PENDING,
-	.enable	= SUN9I_NMI_ENABLE,
+static const struct sunxi_sc_nmi_data sun9i_data __initconst = {
+	.reg_offs.ctrl		= SUN9I_NMI_CTRL,
+	.reg_offs.pend		= SUN9I_NMI_PENDING,
+	.reg_offs.enable	= SUN9I_NMI_ENABLE,
+};
+
+static const struct sunxi_sc_nmi_data sun55i_a523_data __initconst = {
+	.reg_offs.ctrl		= SUN9I_NMI_CTRL,
+	.reg_offs.pend		= SUN9I_NMI_PENDING,
+	.reg_offs.enable	= SUN9I_NMI_ENABLE,
+	.enable_val		= BIT(31),
 };
 
 static inline void sunxi_sc_nmi_write(struct irq_chip_generic *gc, u32 off,
@@ -143,7 +153,7 @@ static int sunxi_sc_nmi_set_type(struct irq_data *data, unsigned int flow_type)
 }
 
 static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
-					const struct sunxi_sc_nmi_reg_offs *reg_offs)
+					const struct sunxi_sc_nmi_data *data)
 {
 	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
@@ -186,27 +196,28 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED |
+	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED |
+						  IRQCHIP_EOI_IF_HANDLED |
 						  IRQCHIP_SKIP_SET_WAKE;
-	gc->chip_types[0].regs.ack		= reg_offs->pend;
-	gc->chip_types[0].regs.mask		= reg_offs->enable;
-	gc->chip_types[0].regs.type		= reg_offs->ctrl;
+	gc->chip_types[0].regs.ack		= data->reg_offs.pend;
+	gc->chip_types[0].regs.mask		= data->reg_offs.enable;
+	gc->chip_types[0].regs.type		= data->reg_offs.ctrl;
 
 	gc->chip_types[1].type			= IRQ_TYPE_EDGE_BOTH;
 	gc->chip_types[1].chip.irq_ack		= irq_gc_ack_set_bit;
 	gc->chip_types[1].chip.irq_mask		= irq_gc_mask_clr_bit;
 	gc->chip_types[1].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[1].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[1].regs.ack		= reg_offs->pend;
-	gc->chip_types[1].regs.mask		= reg_offs->enable;
-	gc->chip_types[1].regs.type		= reg_offs->ctrl;
+	gc->chip_types[1].regs.ack		= data->reg_offs.pend;
+	gc->chip_types[1].regs.mask		= data->reg_offs.enable;
+	gc->chip_types[1].regs.type		= data->reg_offs.ctrl;
 	gc->chip_types[1].handler		= handle_edge_irq;
 
 	/* Disable any active interrupts */
-	sunxi_sc_nmi_write(gc, reg_offs->enable, 0);
+	sunxi_sc_nmi_write(gc, data->reg_offs.enable, data->enable_val);
 
 	/* Clear any pending NMI interrupts */
-	sunxi_sc_nmi_write(gc, reg_offs->pend, SUNXI_NMI_IRQ_BIT);
+	sunxi_sc_nmi_write(gc, data->reg_offs.pend, SUNXI_NMI_IRQ_BIT);
 
 	irq_set_chained_handler_and_data(irq, sunxi_sc_nmi_handle_irq, domain);
 
@@ -221,20 +232,27 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 static int __init sun6i_sc_nmi_irq_init(struct device_node *node,
 					struct device_node *parent)
 {
-	return sunxi_sc_nmi_irq_init(node, &sun6i_reg_offs);
+	return sunxi_sc_nmi_irq_init(node, &sun6i_data);
 }
 IRQCHIP_DECLARE(sun6i_sc_nmi, "allwinner,sun6i-a31-sc-nmi", sun6i_sc_nmi_irq_init);
 
 static int __init sun7i_sc_nmi_irq_init(struct device_node *node,
 					struct device_node *parent)
 {
-	return sunxi_sc_nmi_irq_init(node, &sun7i_reg_offs);
+	return sunxi_sc_nmi_irq_init(node, &sun7i_data);
 }
 IRQCHIP_DECLARE(sun7i_sc_nmi, "allwinner,sun7i-a20-sc-nmi", sun7i_sc_nmi_irq_init);
 
 static int __init sun9i_nmi_irq_init(struct device_node *node,
 				     struct device_node *parent)
 {
-	return sunxi_sc_nmi_irq_init(node, &sun9i_reg_offs);
+	return sunxi_sc_nmi_irq_init(node, &sun9i_data);
 }
 IRQCHIP_DECLARE(sun9i_nmi, "allwinner,sun9i-a80-nmi", sun9i_nmi_irq_init);
+
+static int __init sun55i_nmi_irq_init(struct device_node *node,
+				      struct device_node *parent)
+{
+	return sunxi_sc_nmi_irq_init(node, &sun55i_a523_data);
+}
+IRQCHIP_DECLARE(sun55i_nmi, "allwinner,sun55i-a523-nmi", sun55i_nmi_irq_init);
-- 
2.46.3


