Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF96CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWMhP1DF9JlU6IACRYH5DYXfm0imCEwHF1aCiJZS7sI=; b=QiddGucYN+KLVlbZb6MT03Ioiv
	RruNVhQJTF+XmeJKe5N4p+NHyDR/XZngnvWXEzAgIFJlJSVHqg3Yy7E2HDFQqLB5krFAwg/r5dmOc
	U3zeKpIgmP/FWjwo3oXRU8yoroUm4IBwar+DjD7+LC24SpnCdvVQTmyOrMcQsFxOUqtGNEFJJO/gn
	gxNndtX8jvG5GB4uEVhdg/U6K1VgtKBUVTUAQQIOIJTmxfT24j/joKSjH/VeQ9SF36k2nCz3NbJj/
	NURYZb4W7lTVXILyUib4Bk5IRT9Ipph/afP8mT6KHe6oyRWvgck7RXyfnFt7DmQwCW8s8WqYoDULc
	zJrJizNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7W-00000003YSQ-3kVr;
	Sat, 08 Nov 2025 23:13:22 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7T-00000003YQx-3zUx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so23544a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643598; x=1763248398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWMhP1DF9JlU6IACRYH5DYXfm0imCEwHF1aCiJZS7sI=;
        b=EpnNebgSE+NCpHgR6FHherl8m9u9aC1Iw4f1Xb6lOH3hzqCyarsKGWkzgTxZU19XYO
         q73UyduaQ/lm7lSW2Bg6zM/t15qEsWij7I7YbECpNI/wWIXs5KhZe3O68FpI5DpFscr3
         GIsCWcZ7Ej1pXfltPl5keMY4r44zE3zm1jPluDaQ9oMSrisvaK4HsKDbnYyuTgRWtdO9
         fkz46RdkXTKcVxHiaLed4obRRgYAAefZ1clV0jESjIibtau6nTJSYdYXcjJxpt45wjjG
         XtTy2HSqJXPb8cI664JVrtz3NXaaHfsUDrQAyH8Cg5ei1+UtBwjBA7hws05P8v2doOG9
         6GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643598; x=1763248398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWMhP1DF9JlU6IACRYH5DYXfm0imCEwHF1aCiJZS7sI=;
        b=q0h2Q5VOcYPQ80kjD5tpTY1Bu/o+NjcIR8LRi855zJFatOMVYAH8O9qRlI3JrOWe3k
         607nk7UEDMrRT48tVmAkyPlj8Z7BTXh6zQR2nFE62Ri78QamFO5ZLxTzK5ikGW3B8bF6
         7Pb556H28q1YNkARR+87G+CIZmUcqZyNLkMwx449DDXbOdsGL3d7CcTpEH4N9Fg6Grv1
         C7qIL24T5g2zdO0LE6RIQLdQnZ2XY5wtfhFYJ686ie0vqKXov5pk4Uo0J8OIlDHLJHdX
         l74pHa3k9ZpjHg4yZusDkyS9jjlJVNByWijMy6ItAs4jhQ5lv+j77eA84CLMT24xbH62
         5XEA==
X-Gm-Message-State: AOJu0YylMFAexSP4KNxOXN4UCpzrOLMhwHVN4VixDd2wvWf0B9loB1hk
	0FbtvdSREFrAwncivTq8aIbYAJf49V28kdAsz0r0GBO2e6G4PA+pppG4
X-Gm-Gg: ASbGncveFEYm8k7y2fck1wTKRBOScsE246WczZTLbCdMPnejxLi6LzA71YDRefiYPj+
	rftFb3HbErWJIbXSGHS9dPva5QYw15etfoKZlLOIJsd/kryXP1sQM4ZVFxaQ85UH5/2iXCa0B8Y
	rohLM8VnKCA1Aci20rPgSR6U9tYVfwXjCJV/c0tVcBn5tJ/DOOHNi+FC/AARrF+PM9QtEoJbgjD
	SfyVTW8cs8rfLLq79N23Glmcg9WVh+Ar1uc18m9RXFDTdZO93OxhkNuPicCSTOAnIL2lAXiSJwh
	0fbdwbjcxPG8xW7JivdJJ5ROQZJi0CyPAxp3DetaQt0AH6uYMm/pkrpvEcUomPwL268rbYx17+f
	QMsKz6yPXyxVRBopUb+i3leOd7J/UzJrymFTYHpGea3yYHMoI9IDe9r4qCTbrCCTVluTBA0rjym
	D+hQsz5aPOLUIPf+8uLOcnZZTEeeBQ/hezBKuTEhJHcXAL1qvUwbJKlc/RUX07EDW4NEYcuAXtT
	ZnHKdYhEnXh/nIAMxiOcld8NYTuRVydNl/0Vbojank=
X-Google-Smtp-Source: AGHT+IFGoyUr3fFUDtjdAJDaQ9diGHZMiMCjyMWKaOhYx4Nyqo8YNV94OzI3uycOIQUa86kK/iszdg==
X-Received: by 2002:a05:6402:354b:b0:640:9b11:5d65 with SMTP id 4fb4d7f45d1cf-6415e822920mr2630715a12.24.1762643597799;
        Sat, 08 Nov 2025 15:13:17 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:16 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/7] mmc: meson-mx-sdio: Switch to regmap for register access
Date: Sun,  9 Nov 2025 00:12:47 +0100
Message-ID: <20251108231253.1641927-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151320_056539_6155527F 
X-CRM114-Status: GOOD (  22.29  )
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

Switch the driver over to use regmap to access the registers. This makes
it consistent with the other Amlogic MMC drivers. No functional changes
intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/Kconfig         |   1 +
 drivers/mmc/host/meson-mx-sdio.c | 125 ++++++++++++++++---------------
 2 files changed, 64 insertions(+), 62 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 2c963cb6724b..027ef2540913 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -504,6 +504,7 @@ config MMC_MESON_MX_SDIO
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on OF_ADDRESS
+	select REGMAP_MMIO
 	help
 	  This selects support for the SD/MMC Host Controller on
 	  Amlogic Meson6, Meson8 and Meson8b SoCs.
diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 8a49c32fd3f9..2448f21bd683 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -19,6 +19,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
+#include <linux/regmap.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 
@@ -108,7 +109,7 @@ struct meson_mx_mmc_host {
 	struct clk_fixed_factor		fixed_factor;
 	struct clk			*fixed_factor_clk;
 
-	void __iomem			*base;
+	struct regmap			*regmap;
 	int				irq;
 	spinlock_t			irq_lock;
 
@@ -122,22 +123,10 @@ struct meson_mx_mmc_host {
 	int				error;
 };
 
-static void meson_mx_mmc_mask_bits(struct mmc_host *mmc, char reg, u32 mask,
-				   u32 val)
-{
-	struct meson_mx_mmc_host *host = mmc_priv(mmc);
-	u32 regval;
-
-	regval = readl(host->base + reg);
-	regval &= ~mask;
-	regval |= (val & mask);
-
-	writel(regval, host->base + reg);
-}
-
 static void meson_mx_mmc_soft_reset(struct meson_mx_mmc_host *host)
 {
-	writel(MESON_MX_SDIO_IRQC_SOFT_RESET, host->base + MESON_MX_SDIO_IRQC);
+	regmap_write(host->regmap, MESON_MX_SDIO_IRQC,
+		     MESON_MX_SDIO_IRQC_SOFT_RESET);
 	udelay(2);
 }
 
@@ -158,7 +147,7 @@ static void meson_mx_mmc_start_cmd(struct mmc_host *mmc,
 	struct meson_mx_mmc_host *host = mmc_priv(mmc);
 	unsigned int pack_size;
 	unsigned long irqflags, timeout;
-	u32 mult, send = 0, ext = 0;
+	u32 send = 0, ext = 0;
 
 	host->cmd = cmd;
 
@@ -215,25 +204,22 @@ static void meson_mx_mmc_start_cmd(struct mmc_host *mmc,
 
 	spin_lock_irqsave(&host->irq_lock, irqflags);
 
-	mult = readl(host->base + MESON_MX_SDIO_MULT);
-	mult &= ~MESON_MX_SDIO_MULT_PORT_SEL_MASK;
-	mult |= FIELD_PREP(MESON_MX_SDIO_MULT_PORT_SEL_MASK, host->slot_id);
-	mult |= BIT(31);
-	writel(mult, host->base + MESON_MX_SDIO_MULT);
+	regmap_update_bits(host->regmap, MESON_MX_SDIO_MULT,
+			   MESON_MX_SDIO_MULT_PORT_SEL_MASK | BIT(31),
+			   FIELD_PREP(MESON_MX_SDIO_MULT_PORT_SEL_MASK,
+				      host->slot_id) | BIT(31));
 
 	/* enable the CMD done interrupt */
-	meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_IRQC,
-			       MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN,
-			       MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
+	regmap_set_bits(host->regmap, MESON_MX_SDIO_IRQC,
+			MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
 
 	/* clear pending interrupts */
-	meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_IRQS,
-			       MESON_MX_SDIO_IRQS_CMD_INT,
-			       MESON_MX_SDIO_IRQS_CMD_INT);
+	regmap_set_bits(host->regmap, MESON_MX_SDIO_IRQS,
+			MESON_MX_SDIO_IRQS_CMD_INT);
 
-	writel(cmd->arg, host->base + MESON_MX_SDIO_ARGU);
-	writel(ext, host->base + MESON_MX_SDIO_EXT);
-	writel(send, host->base + MESON_MX_SDIO_SEND);
+	regmap_write(host->regmap, MESON_MX_SDIO_ARGU, cmd->arg);
+	regmap_write(host->regmap, MESON_MX_SDIO_EXT, ext);
+	regmap_write(host->regmap, MESON_MX_SDIO_SEND, send);
 
 	spin_unlock_irqrestore(&host->irq_lock, irqflags);
 
@@ -263,14 +249,13 @@ static void meson_mx_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 	switch (ios->bus_width) {
 	case MMC_BUS_WIDTH_1:
-		meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_CONF,
-				       MESON_MX_SDIO_CONF_BUS_WIDTH, 0);
+		regmap_clear_bits(host->regmap, MESON_MX_SDIO_CONF,
+				  MESON_MX_SDIO_CONF_BUS_WIDTH);
 		break;
 
 	case MMC_BUS_WIDTH_4:
-		meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_CONF,
-				       MESON_MX_SDIO_CONF_BUS_WIDTH,
-				       MESON_MX_SDIO_CONF_BUS_WIDTH);
+		regmap_set_bits(host->regmap, MESON_MX_SDIO_CONF,
+				MESON_MX_SDIO_CONF_BUS_WIDTH);
 		break;
 
 	case MMC_BUS_WIDTH_8:
@@ -351,8 +336,8 @@ static void meson_mx_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	host->mrq = mrq;
 
 	if (mrq->data)
-		writel(sg_dma_address(mrq->data->sg),
-		       host->base + MESON_MX_SDIO_ADDR);
+		regmap_write(host->regmap, MESON_MX_SDIO_ADDR,
+			     sg_dma_address(mrq->data->sg));
 
 	if (mrq->sbc)
 		meson_mx_mmc_start_cmd(mmc, mrq->sbc);
@@ -364,24 +349,26 @@ static void meson_mx_mmc_read_response(struct mmc_host *mmc,
 				       struct mmc_command *cmd)
 {
 	struct meson_mx_mmc_host *host = mmc_priv(mmc);
-	u32 mult;
-	int i, resp[4];
+	unsigned int i, resp[4];
 
-	mult = readl(host->base + MESON_MX_SDIO_MULT);
-	mult |= MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX;
-	mult &= ~MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK;
-	mult |= FIELD_PREP(MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK, 0);
-	writel(mult, host->base + MESON_MX_SDIO_MULT);
+	regmap_update_bits(host->regmap, MESON_MX_SDIO_MULT,
+			   MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX |
+			   MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK,
+			   MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX |
+			   FIELD_PREP(MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK,
+				      0));
 
 	if (cmd->flags & MMC_RSP_136) {
 		for (i = 0; i <= 3; i++)
-			resp[3 - i] = readl(host->base + MESON_MX_SDIO_ARGU);
+			regmap_read(host->regmap, MESON_MX_SDIO_ARGU,
+				    &resp[3 - i]);
+
 		cmd->resp[0] = (resp[0] << 8) | ((resp[1] >> 24) & 0xff);
 		cmd->resp[1] = (resp[1] << 8) | ((resp[2] >> 24) & 0xff);
 		cmd->resp[2] = (resp[2] << 8) | ((resp[3] >> 24) & 0xff);
 		cmd->resp[3] = (resp[3] << 8);
 	} else if (cmd->flags & MMC_RSP_PRESENT) {
-		cmd->resp[0] = readl(host->base + MESON_MX_SDIO_ARGU);
+		regmap_read(host->regmap, MESON_MX_SDIO_ARGU, &cmd->resp[0]);
 	}
 }
 
@@ -422,8 +409,8 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
 
 	spin_lock(&host->irq_lock);
 
-	irqs = readl(host->base + MESON_MX_SDIO_IRQS);
-	send = readl(host->base + MESON_MX_SDIO_SEND);
+	regmap_read(host->regmap, MESON_MX_SDIO_IRQS, &irqs);
+	regmap_read(host->regmap, MESON_MX_SDIO_SEND, &send);
 
 	if (irqs & MESON_MX_SDIO_IRQS_CMD_INT)
 		ret = meson_mx_mmc_process_cmd_irq(host, irqs, send);
@@ -431,7 +418,7 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
 		ret = IRQ_HANDLED;
 
 	/* finally ACK all pending interrupts */
-	writel(irqs, host->base + MESON_MX_SDIO_IRQS);
+	regmap_write(host->regmap, MESON_MX_SDIO_IRQS, irqs);
 
 	spin_unlock(&host->irq_lock);
 
@@ -470,14 +457,13 @@ static void meson_mx_mmc_timeout(struct timer_list *t)
 	struct meson_mx_mmc_host *host = timer_container_of(host, t,
 							    cmd_timeout);
 	unsigned long irqflags;
-	u32 irqc;
+	u32 irqs, argu;
 
 	spin_lock_irqsave(&host->irq_lock, irqflags);
 
 	/* disable the CMD interrupt */
-	irqc = readl(host->base + MESON_MX_SDIO_IRQC);
-	irqc &= ~MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN;
-	writel(irqc, host->base + MESON_MX_SDIO_IRQC);
+	regmap_clear_bits(host->regmap, MESON_MX_SDIO_IRQC,
+			  MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
 
 	spin_unlock_irqrestore(&host->irq_lock, irqflags);
 
@@ -488,10 +474,12 @@ static void meson_mx_mmc_timeout(struct timer_list *t)
 	if (!host->cmd)
 		return;
 
+	regmap_read(host->regmap, MESON_MX_SDIO_IRQS, &irqs);
+	regmap_read(host->regmap, MESON_MX_SDIO_ARGU, &argu);
+
 	dev_dbg(mmc_dev(host->mmc),
 		"Timeout on CMD%u (IRQS = 0x%08x, ARGU = 0x%08x)\n",
-		host->cmd->opcode, readl(host->base + MESON_MX_SDIO_IRQS),
-		readl(host->base + MESON_MX_SDIO_ARGU));
+		host->cmd->opcode, irqs, argu);
 
 	host->cmd->error = -ETIMEDOUT;
 
@@ -578,7 +566,8 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	return 0;
 }
 
-static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
+static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host,
+				      void __iomem *base)
 {
 	struct clk_init_data init;
 	const char *clk_div_parent, *clk_fixed_factor_parent;
@@ -613,7 +602,7 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &clk_div_parent;
 	init.num_parents = 1;
-	host->cfg_div.reg = host->base + MESON_MX_SDIO_CONF;
+	host->cfg_div.reg = base + MESON_MX_SDIO_CONF;
 	host->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
 	host->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
 	host->cfg_div.hw.init = &init;
@@ -629,12 +618,23 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
 
 static int meson_mx_mmc_probe(struct platform_device *pdev)
 {
+	const struct regmap_config meson_mx_sdio_regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = MESON_MX_SDIO_EXT,
+	};
 	struct platform_device *slot_pdev;
 	struct mmc_host *mmc;
 	struct meson_mx_mmc_host *host;
+	void __iomem *base;
 	int ret, irq;
 	u32 conf;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	slot_pdev = meson_mx_mmc_slot_pdev(&pdev->dev);
 	if (!slot_pdev)
 		return -ENODEV;
@@ -656,9 +656,10 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, host);
 
-	host->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(host->base)) {
-		ret = PTR_ERR(host->base);
+	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					     &meson_mx_sdio_regmap_config);
+	if (IS_ERR(host->regmap)) {
+		ret = PTR_ERR(host->regmap);
 		goto error_free_mmc;
 	}
 
@@ -687,7 +688,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 		goto error_free_mmc;
 	}
 
-	ret = meson_mx_mmc_register_clks(host);
+	ret = meson_mx_mmc_register_clks(host, base);
 	if (ret)
 		goto error_free_mmc;
 
@@ -708,7 +709,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_M_ENDIAN_MASK, 0x3);
 	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_WRITE_NWR_MASK, 0x2);
 	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_WRITE_CRC_OK_STATUS_MASK, 0x2);
-	writel(conf, host->base + MESON_MX_SDIO_CONF);
+	regmap_write(host->regmap, MESON_MX_SDIO_CONF, conf);
 
 	meson_mx_mmc_soft_reset(host);
 
-- 
2.51.2


