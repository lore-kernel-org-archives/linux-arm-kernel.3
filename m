Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF80C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Rz3+79bA/mxglTwC84z6bldtGWm18T7TGQOkj8ISPs=; b=dT/iMEGbd0rwpgv8jNs9c0nn+Z
	gOyaQlG4jrvqiP/Th+weJYM1ybM1xdmZaker1ajH4V89rvHCLGKiYN3PEyCb41owAPOSW7oA2/FmZ
	DZyXc1LBp0wu7I3E1GrpwnvOdOw7H9SdMq08kq6FdDmBCe+0TDrMbgaVu6tIWEyvjSNec7oLHBkfR
	Kdv+VSl7m0NQiGrHjBq4yA3p/GDoxt1hIP93nqpsfiVeb9AH1sRvkFWZ+lZbNAGi0/974zqlNuFi/
	c6SveH9k9lu0BgWQ0+rmT0EaHK4k3PJvbM8b2kIYL+riCUmvwMyuYoWjNDEYudyjVwuhuQ+O9EqKm
	cm9gEZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pW-0000000FSdq-0VA1;
	Wed, 12 Aug 2026 05:48:46 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pT-0000000FSWa-0usV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 05:48:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 12 Aug
 2026 13:48:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 12 Aug 2026 13:48:26 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 12 Aug 2026 13:48:29 +0800
Subject: [PATCH 5/7] EDAC/aspeed: Replace regmap with direct register
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260812-edac-v1-5-03992edea297@aspeedtech.com>
References: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
In-Reply-To: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>,
	<linux-rt-devel@lists.linux.dev>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786513706; l=8681;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=Me8mi0NrSdfydNawCYFOI5PqxoSJA8FxxW2gT79Fc4E=;
 b=2PU7W0YGm6//PwLZbta9GqrvS/IUAj0KX1k+Ge63pDjVRmctMKCfK/TyoAstFxKlihE7fwtTf
 FInx/eaBkYGAjxMvKUgrv16OgH5utanqePr0bUFwK99Xu6C5n818RZD
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_224843_282627_E5B638C7 
X-CRM114-Status: GOOD (  21.62  )
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

The driver instantiates its own regmap purely as an MMIO wrapper: it has
no register cache, uses custom reg_read/reg_write callbacks, and is not
shared as a syscon with other drivers. So it brings nothing here beyond
the spinlock that regmap takes around each access when fast_io is set.

Drop the regmap and access the registers directly with readl()/writel()
under an explicit raw spinlock, held across the whole read-modify-write so
the controller is unlocked once around the grouped writes rather than on
every register write. The lock is a raw_spinlock_t because the ECC
interrupt handler runs in hardirq context, where under PREEMPT_RT a
sleeping spinlock could not be acquired.

Annotate the register base with __guarded_by() so that, under
CONFIG_WARN_CONTEXT_ANALYSIS, the compiler checks at build time that every
hardware register access is performed while holding the lock.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 132 +++++++++++++++++----------------------------
 1 file changed, 48 insertions(+), 84 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 8bfeb21d3204..7bd552ee9a61 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -3,6 +3,7 @@
  * Copyright 2018, 2019 Cisco Systems
  */
 
+#include <linux/cleanup.h>
 #include <linux/edac.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -10,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include "edac_module.h"
 
 #define DRV_NAME "aspeed-edac"
@@ -20,7 +21,6 @@
 #define ASPEED_MCR_INTR_CTRL   0x50 /* interrupt control/status register */
 #define ASPEED_MCR_ADDR_UNREC  0x58 /* address of first un-recoverable error */
 #define ASPEED_MCR_ADDR_REC    0x5c /* address of last recoverable error */
-#define ASPEED_MCR_LAST        ASPEED_MCR_ADDR_REC
 
 #define ASPEED_MCR_PROT_PASSWD          0xfc600309
 #define ASPEED_MCR_CONF_DRAM_TYPE       BIT(4)
@@ -30,55 +30,8 @@
 #define ASPEED_MCR_INTR_CTRL_CNT_UNREC  GENMASK(15, 12)
 #define ASPEED_MCR_INTR_CTRL_ENABLE     (BIT(0) | BIT(1))
 
-static struct regmap *aspeed_regmap;
-
-static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
-{
-	void __iomem *regs = (void __iomem *)context;
-
-	/* enable write to MCR register set */
-	writel(ASPEED_MCR_PROT_PASSWD, regs + ASPEED_MCR_PROT);
-
-	writel(val, regs + reg);
-
-	/* disable write to MCR register set */
-	writel(~ASPEED_MCR_PROT_PASSWD, regs + ASPEED_MCR_PROT);
-
-	return 0;
-}
-
-static int regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
-{
-	void __iomem *regs = (void __iomem *)context;
-
-	*val = readl(regs + reg);
-
-	return 0;
-}
-
-static bool regmap_is_volatile(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case ASPEED_MCR_PROT:
-	case ASPEED_MCR_INTR_CTRL:
-	case ASPEED_MCR_ADDR_UNREC:
-	case ASPEED_MCR_ADDR_REC:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static const struct regmap_config aspeed_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = ASPEED_MCR_LAST,
-	.reg_write = regmap_reg_write,
-	.reg_read = regmap_reg_read,
-	.volatile_reg = regmap_is_volatile,
-	.fast_io = true,
-};
+static DEFINE_RAW_SPINLOCK(aspeed_lock);
+static void __iomem *aspeed_regs __guarded_by(&aspeed_lock);
 
 static void count_rec(struct mem_ctl_info *mci, u8 rec_cnt, u32 rec_addr)
 {
@@ -147,12 +100,24 @@ static irqreturn_t mcr_isr(int irq, void *arg)
 {
 	struct mem_ctl_info *mci = arg;
 	u32 rec_addr, un_rec_addr;
-	u32 reg50, reg5c, reg58;
-	u8  rec_cnt, un_rec_cnt;
-
-	regmap_read(aspeed_regmap, ASPEED_MCR_INTR_CTRL, &reg50);
-	dev_dbg(mci->pdev, "received edac interrupt w/ mcr register 50: 0x%x\n",
-		reg50);
+	u8 rec_cnt, un_rec_cnt;
+	u32 reg50;
+
+	scoped_guard(raw_spinlock, &aspeed_lock) {
+		reg50 = readl(aspeed_regs + ASPEED_MCR_INTR_CTRL);
+		dev_dbg(mci->pdev, "received edac interrupt w/ mcr register 50: 0x%x\n",
+			reg50);
+		un_rec_addr = readl(aspeed_regs + ASPEED_MCR_ADDR_UNREC);
+		rec_addr = readl(aspeed_regs + ASPEED_MCR_ADDR_REC);
+
+		/* clearing the counters needs a set-then-clear of CLEAR */
+		writel(ASPEED_MCR_PROT_PASSWD, aspeed_regs + ASPEED_MCR_PROT);
+		writel(reg50 | ASPEED_MCR_INTR_CTRL_CLEAR,
+		       aspeed_regs + ASPEED_MCR_INTR_CTRL);
+		writel(reg50 & ~ASPEED_MCR_INTR_CTRL_CLEAR,
+		       aspeed_regs + ASPEED_MCR_INTR_CTRL);
+		writel(~ASPEED_MCR_PROT_PASSWD, aspeed_regs + ASPEED_MCR_PROT);
+	}
 
 	/* collect data about recoverable and unrecoverable errors */
 	rec_cnt = (reg50 & ASPEED_MCR_INTR_CTRL_CNT_REC) >> 16;
@@ -161,20 +126,6 @@ static irqreturn_t mcr_isr(int irq, void *arg)
 	dev_dbg(mci->pdev, "%d recoverable interrupts and %d unrecoverable interrupts\n",
 		rec_cnt, un_rec_cnt);
 
-	regmap_read(aspeed_regmap, ASPEED_MCR_ADDR_UNREC, &reg58);
-	un_rec_addr = reg58;
-
-	regmap_read(aspeed_regmap, ASPEED_MCR_ADDR_REC, &reg5c);
-	rec_addr = reg5c;
-
-	/* clear interrupt flags and error counters: */
-	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
-			   ASPEED_MCR_INTR_CTRL_CLEAR,
-			   ASPEED_MCR_INTR_CTRL_CLEAR);
-
-	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
-			   ASPEED_MCR_INTR_CTRL_CLEAR, 0);
-
 	/* process recoverable and unrecoverable errors */
 	count_rec(mci, rec_cnt, rec_addr);
 	count_un_rec(mci, un_rec_cnt, un_rec_addr);
@@ -182,13 +133,31 @@ static irqreturn_t mcr_isr(int irq, void *arg)
 	if (!rec_cnt && !un_rec_cnt)
 		dev_dbg(mci->pdev, "received edac interrupt, but did not find any ECC counters\n");
 
-	regmap_read(aspeed_regmap, ASPEED_MCR_INTR_CTRL, &reg50);
+	scoped_guard(raw_spinlock, &aspeed_lock)
+		reg50 = readl(aspeed_regs + ASPEED_MCR_INTR_CTRL);
 	dev_dbg(mci->pdev, "edac interrupt handled. mcr reg 50 is now: 0x%x\n",
 		reg50);
 
 	return IRQ_HANDLED;
 }
 
+static void aspeed_set_irq(bool enable)
+{
+	u32 val;
+
+	guard(raw_spinlock_irqsave)(&aspeed_lock);
+
+	val = readl(aspeed_regs + ASPEED_MCR_INTR_CTRL);
+	if (enable)
+		val |= ASPEED_MCR_INTR_CTRL_ENABLE;
+	else
+		val &= ~ASPEED_MCR_INTR_CTRL_ENABLE;
+
+	writel(ASPEED_MCR_PROT_PASSWD, aspeed_regs + ASPEED_MCR_PROT);
+	writel(val, aspeed_regs + ASPEED_MCR_INTR_CTRL);
+	writel(~ASPEED_MCR_PROT_PASSWD, aspeed_regs + ASPEED_MCR_PROT);
+}
+
 static int config_irq(void *ctx, struct platform_device *pdev)
 {
 	int irq;
@@ -206,9 +175,7 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 		return rc;
 
 	/* enable interrupts */
-	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
-			   ASPEED_MCR_INTR_CTRL_ENABLE,
-			   ASPEED_MCR_INTR_CTRL_ENABLE);
+	aspeed_set_irq(true);
 
 	return 0;
 }
@@ -246,7 +213,8 @@ static int init_csrows(struct mem_ctl_info *mci)
 	nr_pages = resource_size(&r) >> PAGE_SHIFT;
 	csrow->last_page = csrow->first_page + nr_pages - 1;
 
-	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
+	scoped_guard(raw_spinlock, &aspeed_lock)
+		reg04 = readl(aspeed_regs + ASPEED_MCR_CONF);
 	dram_type = (reg04 & ASPEED_MCR_CONF_DRAM_TYPE) ? MEM_DDR4 : MEM_DDR3;
 
 	dimm = csrow->channels[0]->dimm;
@@ -263,7 +231,6 @@ static int init_csrows(struct mem_ctl_info *mci)
 
 static int aspeed_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
 	void __iomem *regs;
@@ -274,13 +241,11 @@ static int aspeed_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	aspeed_regmap = devm_regmap_init(dev, NULL, (__force void *)regs,
-					 &aspeed_regmap_config);
-	if (IS_ERR(aspeed_regmap))
-		return PTR_ERR(aspeed_regmap);
+	scoped_guard(raw_spinlock, &aspeed_lock)
+		aspeed_regs = regs;
 
 	/* bail out if ECC mode is not configured */
-	regmap_read(aspeed_regmap, ASPEED_MCR_CONF, &reg04);
+	reg04 = readl(regs + ASPEED_MCR_CONF);
 	if (!(reg04 & ASPEED_MCR_CONF_ECC)) {
 		dev_err(&pdev->dev, "ECC mode is not configured in u-boot\n");
 		return -EPERM;
@@ -346,8 +311,7 @@ static void aspeed_remove(struct platform_device *pdev)
 	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
 
 	/* disable interrupts */
-	regmap_update_bits(aspeed_regmap, ASPEED_MCR_INTR_CTRL,
-			   ASPEED_MCR_INTR_CTRL_ENABLE, 0);
+	aspeed_set_irq(false);
 
 	/* free resources */
 	edac_mc_del_mc(&pdev->dev);

-- 
2.34.1


