Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249A1C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=; b=n25ucP4EwA+hdg4vTQYq6K6pZR
	SU4527/41a7GIGMkaGdKxS4jtWqmgL2dWwVALevnttd7rLsVRvTzrdhLBzX9nqp3ZQi69OOzf76tO
	fvBIfmcTLuMy22E6n3uD6rCfNcmpC3z8nRqzeOiGOt7hpoY5a+c7FsHR4T4lMYj40pOYvPvMpsCgZ
	880IzgByCKHJDXJCEAWJdPaKbUudUSRDDmnMc1QiKvEX+4P+1dk054LMBotOa/A3moZ7PCDu1Kbhd
	tUCe5IXIkEkWNpSvPLC0KxNyvBGreWOXIc0FjhiTPxD27KO/MWgSUs4CorohJT93EoT6mm8va6qJ8
	dEZ4+mKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0Y-00000002osw-3LlT;
	Thu, 09 Jul 2026 14:45:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0V-00000002oqX-1L1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:45:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1834876f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608341; x=1784213141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=c+BwUxe7ZKENA94b13mtR86+w9Ak+d4Ynh5H1vQ2a2txFCoL/96lp3EZUNCh0oRGgu
         T8bnVB/WIWpE+Ao6ozdH5yENP4nNFQ/tRJTHwFvhKNLsgdzmKQfzAQTSXFiLTbkWwB5W
         0bNoGMjjdmRm03NoaPoepjRM9lstv+UpUMaj35PoUJ43FsehR1ExTCOOd1cdflvV05cQ
         2LBZFSwWZahmBHGsG/3DCeSxHI/Diz1+XpNeLeYchooHCc+PwBdFGONwr2G7udpsUmsD
         GFUcbnQ++y93a2MBtQVnJvJjx2V8ixoZeQiCWIRXdpJwkINCeCTgHYxDTlo/gNLhxR0L
         69VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608341; x=1784213141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=XJoEp2nv3GqD8btgxvwijDcT+z98jVmvC6lmQ/fYwhzm7nEvVA/vAUzV8FaK+yLNA4
         jcoStZ4GiyE4S5aD1Qd/DLJrUAncWvXtN5GfEDdpFQjgvSY7LAEeXoyC73cV4bwGBVnX
         ARCUfSazaH9kkbfNHb3Y8SzhLg1Seyi1aau5fI6+kwZmt6Q/G4hV1qy0tYZjGkqhjZ7l
         oP8AjveHhfWWmCjJrcjksR2Pttpk3Y2ICQqIB1yGhqI0TI7FyH+A/ycU/ewgKlOnE1qn
         XXMij+7JicbGb4hRaqLs5y9cIIZ5/VLmodH8UXeuKE2JahPVHIM9pdHlVByVKkRlK2GT
         Zx9w==
X-Forwarded-Encrypted: i=1; AHgh+RoNkNMssC5BWbhxvPn8UFqGkZnWjWCKf7Mt1tLoS+C+qxaxBrh1AWKT2BaliKoq83JORJM5aXWwASvIrJlakrZS@lists.infradead.org
X-Gm-Message-State: AOJu0YyBQ5zYS6x50i7EQQLNSMWqhLqAulmNZB6ttzhiyCoA83fftqvA
	Q9Tm4RVsJf9ERBwycAliZnZr284Cu1PGbBpSi42rT5EzMUbOp2SQFRxTZ1plDHS5AmY=
X-Gm-Gg: AfdE7ckmke+aC4F7g01b0xp5BVwv5pHrBTlWgX5b/7k6HN/SB2VuRfrFIY+7IFDuuhZ
	lYAUSS0WtYLY1bTA1QI47fD0GivH7IJqfw/vai32vDbUIKg5w6W/FABspuZCdCpOVsOpomfoClk
	oP1Y0KZpBFC+/+sbHKbDcF91mHWy/2npShfzaDXtMnBdZNlm5OXZZLLSTaj28NGAUig7DW+PPpu
	4rajGZ9cvLFamFAz4A8Cbh9pZnFUTVo/RDBltp43au3Hu8bBC+h4QOg/qO4tFPDQSPuSRxtAsRC
	YxYW0l+Mkpxi4qXf80bG7aLY2nu66RWqzZAw5EIx+Z63qarL6Oe/3BByQrCyMwKqUAq3OWEWEJt
	HBP2stx/AZOHyC5qWIRjLQ/sWTlTb+PuW/UDRQ4EWCGwR74S/Lexl6XpmsCjtDMavIFbXr0clX6
	YbAU5LywuLzio7Y1TDuAqVbm5awgc5/AqebaMw/l1ISDYr0maUyYE/7clSMtrMUJPd5Gu1UMJAZ
	PbP
X-Received: by 2002:a05:6000:41f7:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47df079051fmr8084209f8f.39.1783608341484;
        Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:37 +0100
Subject: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074543_394627_3C708EF0 
X-CRM114-Status: GOOD (  19.71  )
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

Exynos850-based platforms support ACPM and has similar workflow
of communicating with ACPM via mailbox, however mailbox controller
registers are located at different offsets and writes/reads could be
different. To distinguish between such different behaviours,
the registers offsets for Exynos850 and the platform-specific data
structs are introduced and configuration is described in such structs
for gs101 and exynos850 based SoCs. Probe routine now selects the
corresponding platform-specific data via device_get_match_data().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 72 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index fa02f18948cf..ff75c1c7633c 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -24,14 +24,60 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+#define EXYNOS850_MBOX_INTGR0_MASK	GENMASK(31, 16)
+
+#define EXYNOS850_MBOX_CHAN_COUNT	HWEIGHT32(EXYNOS850_MBOX_INTGR0_MASK)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @intgr:		offset to the IRQ generation register, doorbell
+ *			to APM co-processor.
+ * @intgr_shift:	shift to apply to the value written to IRQ generation
+ *			register.
+ * @intmr:		offset to the IRQ mask register.
+ * @intmr_mask:		value to write to the mask register to mask out all
+ *			interrupts.
+ * @num_chans:		number of channels the mailbox can support (hardware
+ *			capability).
+ */
+struct exynos_mbox_driver_data {
+	u32 intgr;
+	u32 intgr_shift;
+	u32 intmr;
+	u32 intmr_mask;
+	int num_chans;
+};
+
 /**
  * struct exynos_mbox - driver's private data.
  * @regs:	mailbox registers base address.
  * @mbox:	pointer to the mailbox controller.
+ * @data:	pointer to driver platform-specific data.
  */
 struct exynos_mbox {
 	void __iomem *regs;
 	struct mbox_controller *mbox;
+	const struct exynos_mbox_driver_data *data;
+};
+
+static const struct exynos_mbox_driver_data exynos850_mbox_data = {
+	.intgr = EXYNOS850_MBOX_INTGR0,
+	.intgr_shift = 16,
+	.intmr = EXYNOS850_MBOX_INTMR1,
+	.intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
+	.num_chans = EXYNOS850_MBOX_CHAN_COUNT,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
+	.num_chans = EXYNOS_MBOX_CHAN_COUNT,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -50,7 +96,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -80,19 +128,31 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
 }
 
 static const struct of_device_id exynos_mbox_match[] = {
-	{ .compatible = "google,gs101-mbox" },
+	{
+		.compatible = "google,gs101-mbox",
+		.data = &exynos_gs101_mbox_data
+	},
+	{
+		.compatible = "samsung,exynos850-mbox",
+		.data = &exynos850_mbox_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, exynos_mbox_match);
 
 static int exynos_mbox_probe(struct platform_device *pdev)
 {
+	const struct exynos_mbox_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct exynos_mbox *exynos_mbox;
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
 	struct clk *pclk;
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
 		return -ENOMEM;
@@ -101,8 +161,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
-			     GFP_KERNEL);
+	chans = devm_kcalloc(dev, data->num_chans, sizeof(*chans), GFP_KERNEL);
 	if (!chans)
 		return -ENOMEM;
 
@@ -115,7 +174,8 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
-	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
+	exynos_mbox->data = data;
+	mbox->num_chans = data->num_chans;
 	mbox->chans = chans;
 	mbox->dev = dev;
 	mbox->ops = &exynos_mbox_chan_ops;
@@ -126,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0


