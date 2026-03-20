Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DED1099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqbbWkZUelJgFW3AcjmoveTN0lUpeuVS4Adcj/4N1VM=; b=Tv99hQkSY8Ugph+K2P6nySUG2T
	ovYWNxs1e+gyC1CJDf7UsmP3M1lD/p5cI1FnLbNTr3Gu7L28cqz6qIQr4j9wLHC4hzxCJwRc9iqEk
	YhpEr4hI334fqej8tPUg24B5VLQm+OBYmzvoN896Q95D6zAnrPWxX5ssZ/bw9hpICk4GfYhnGXfvI
	baIuwO+bOF2h6OV/FonuUmaq4qyBJqyCevQglFKs18ndMRJc3iPf26I0iXiPMVUmprPaYYecriC9d
	aIBtiz1XRe8CJaokYiMe7I1cq8j9UfzNR7ps3gin4ofl0MKh5pLtFnOaifutTXA9MfyRiFl3vWYLT
	6JI6ndrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBq-0000000Db27-2tqt;
	Fri, 20 Mar 2026 21:15:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBk-0000000Db0w-0yUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1564775f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041322; x=1774646122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqbbWkZUelJgFW3AcjmoveTN0lUpeuVS4Adcj/4N1VM=;
        b=ezh4amowWgLTry5guv0RAetA0/FLwOSoYwZQcMC8v9OBcWf05bTNu4KpHIEUvQoaH8
         FTpwf+UN4wfZqGbxBjV0qu0/KGFtoC4BhUTkAyGtI/CFM638W3EHMZZ4kVfXPhqgWo0i
         /7Dz/z8LJG5C9xMEXCaXciKve5UWTjq6OjOFV9der6oRc5I8sjp0FYXKUJKnvgwQlKju
         SqT6vm//DyCpa/sYfDq7N3d0ph/pndphCznnuu4bFKMaS8L2gNMV/Cz+WQ80RQFXsxIM
         owfQp1Hyfxo+Y9EtpS0GsRzMJLBQCgBtMI2gBG1klCEdO2RM8SDiN2+uVtdsIipiE7AJ
         7Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041322; x=1774646122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqbbWkZUelJgFW3AcjmoveTN0lUpeuVS4Adcj/4N1VM=;
        b=RcFo3lW17hpLw14npwIXZnAFbx+aKvGsgMuN6vUhqKN2jKWcfUflwgAqOvIKhYsKqV
         rnuL2BGXR2OdVKzgiOTjpJiK3oj0yxay4solFGw8+SSb1i7A1Bwnm7qp66I7tc5wog0e
         IIRoNVJtyJkKJMsHqfu75gsMaardAayyTndq8dGJZnP/4w35/2T2bAMNjxNE5V44FvK7
         CyHuIfhYTYA49tdHp7J33Dz1vqCfYNadlyKqhgweLmpYlv/WU7XIjsVTaUIdxBoKyhEf
         cZRL4MAcgbZuviVQ/aKn1buaNZgFbi1gSJtpnQK/r+yvHQy8HL4ywvJkgf85Ai/DQFgS
         zAwA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ws7efUbIrcVVMJlUS5q0/pPo99xLgqCc0JInxPTtUrXENw5FJX5ynuu4TlFqP66aYDhKYvJj6pxaV9WAkGQW@lists.infradead.org
X-Gm-Message-State: AOJu0YxkfKbMdKxz30rnOfnI/prOjZ5TJEt2KWN8YlR8HPpiWs/ii4NN
	W0G0X1KoC4IuCNoPh0iBqbpj+JPsw4RZr/mo0egfDcEdJ97t6aKLBGbCBwJZpBjvGl4=
X-Gm-Gg: ATEYQzymSlo5CSe3JVaKmwpM8d9m3TIpVfcd7NbZCvs8p7Wu1DO5s8b+a8ojYzPn8sL
	JS+r1c6fcKf1MjK3ToS2aggkZ9FGFk5pxQ3jnP6f8ofXCqyk60YMVX/TrVE0rXds6Nlxij43xpz
	+s9NC04rQ8WpJJgA5rj1rVb+jGAYCHzAliv59OsvqssclyMk+UYUiIG1rJGhMbfm/AYURhYYI7M
	NQcQn1rwHEbleB8zgocEgBT1Rt8qOL0zivzarCMC5wnX8P7bm2dUL7dnMH97wSYVhZtcLpiNMrQ
	CxPoeBZTePlzyHIv39cguNgr0Eet47vS5kUk4r91eFoWT1cIjcLUBFiKbM4maU9NzA3kBG9zExP
	VSN3CXtzhejN59wPnrUfQxExu/sIjQuTmzSJ740TNdR9HzmcQvLbjRIbK+T8/b6SZe32tbV71j5
	hu9fBRfHS+RK0YeHnB5Ox9AM6j/4Xl+boMx8hegZBLUYZlAJdwpAwnrDoqjHDLTYdtkofnqvvFE
	Rc8Slwi7hVKXsY=
X-Received: by 2002:a05:6000:248a:b0:43b:4921:8744 with SMTP id ffacd0b85a97d-43b64244339mr7400984f8f.22.1774041322360;
        Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:16 +0000
Subject: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_141526_368444_2137AE0A 
X-CRM114-Status: GOOD (  18.42  )
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

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 65 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..3727e1ff0fc2 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,59 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
+#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
+#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
+#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register 0	*/
+#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
+#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register 1	*/
+#define EXYNOS850_MBOX_VERSION		0x70
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @irq_doorbell_offset:	offset to the IRQ generation register, doorbell
+ *				to APM co-processor.
+ * @irq_doorbell_shift:		shift to apply to the value written to IRQ
+ *				generation register.
+ * @irq_mask_offset:		offset to the IRQ mask register.
+ */
+struct exynos_mbox_driver_data {
+	u16 irq_doorbell_offset;
+	u16 irq_doorbell_shift;
+	u16 irq_mask_offset;
+	u16 irq_mask_value;
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
+	.irq_doorbell_offset = EXYNOS850_MBOX_INTGR0,
+	.irq_doorbell_shift = 16,
+	.irq_mask_offset = EXYNOS850_MBOX_INTMR1,
+	.irq_mask_value = EXYNOS850_MBOX_INTMR1_MASK,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.irq_doorbell_offset = EXYNOS_MBOX_INTGR1,
+	.irq_doorbell_shift = 0,
+	.irq_mask_offset = EXYNOS_MBOX_INTMR0,
+	.irq_mask_value = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +102,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
+	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
 
 	return 0;
 }
@@ -87,13 +133,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
@@ -123,6 +177,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	exynos_mbox->data = data;
 	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
 	mbox->chans = chans;
 	mbox->dev = dev;
@@ -137,7 +196,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0


