Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7F61112276
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbF9xEzoPSgu59LUq/lUmgY7AyJO2/QP6FYhaZepCm4=; b=2kbalV7woNJ5xgP1kQVL1CswkJ
	oX8QuPFiIbvDAMVmBT5UH/HYzFi8qYTicTIEmWr/JehSMvSbCee1gQjsEYpRieDfnt3m4OmG5esrM
	gZBTAXEPRy46TbxcG8STlTtWNnoGk+obUMoKIhQJSUM4ybhBgf1XgpI81Db7HgPgAMcHg2TEwTg9M
	6l0isiQsU2X+LZkmnrsZq7LtfI7DBX/+WKeCxuTpf3sWEUWZvAF0GhcU9hKNcq8zDLnngtrnxwk3F
	0NUGrVf+0L0qqGwC7cLDi1lJeR6zMw8j3oJHpoIIkYhqxDkRGSUNol7U7X15PyTXOBtl4EAPaNYRp
	t/WF63CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fe-0000000Gb5y-1ICs;
	Thu, 02 Apr 2026 02:20:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fa-0000000Gb3o-2CWC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:20:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so3199355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096428; x=1775701228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbF9xEzoPSgu59LUq/lUmgY7AyJO2/QP6FYhaZepCm4=;
        b=KUUoHQzPiSn+YuGYu9sK5l2g/n1CgO2vEGK6DVU4k+gqiMlf9neJTsZfZe3s2Z2u0d
         i9nKlbHxE4PqHQSZ5t1N8ZIaEQiofyaH6qeIFHPloX66VsBDl7G5aYrutz8i8xKXtVKZ
         RZY4uzXvn2tOC4yrc/kMTnnvZQNVTQVLlcFYH9vqdy5bOrwJhJP+0HloJd766nfkVrmS
         gX9G/k6zCGUuSJ543gAN7nxzu2LN11JOCmgToKExs/VprBra3oqlhoBVkYseAJeeRtiP
         O6SZ40ln2ACuqs8yo0kz6XMFs/9jbh3jlIDnkZjVZyKI6oBS749QvDywIavEgkdIyNps
         1VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096428; x=1775701228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbF9xEzoPSgu59LUq/lUmgY7AyJO2/QP6FYhaZepCm4=;
        b=RaUrFvsUfTkJjeOOIkLUfBYwHTfZcQXzLJiz4o5O4lop9y9E0IXgBuY3i4O1mo6OvR
         +0mSYqqKHzHFa5qsdmyb7D1W9YVfsKvJk1ghT73qcFo8qy1dGHkRZqthYmIIqr05iOwT
         wY5LWHv0F9XPzj84WeQKe53Fqas4HE0OpKSIzCnXkv6mdNapXjvbJphPBMIvKv+a/2g5
         dy4lWaRdBOiBzGwWQaPm9gDUZezqqhPWcNaaHnOhwmLnVW625p3EhdKRvWX8y2BYo5kR
         ycX15JbqsC7XU+FJRhfyXM45/jvOJ/PZ5ZtzpTrZP3xKI6q0emfrFV18P8sYiGJLMTjj
         chuA==
X-Forwarded-Encrypted: i=1; AJvYcCVt/jgJBba9LMg8P/Yi55J0FlMgT5BiZPp9k5AYLqYV4klbwZGAQF4RonLuQo0V552ZftVCxbl+4NKkrwev1Yyl@lists.infradead.org
X-Gm-Message-State: AOJu0YzFUTCU4H5WpnWj004kpkAw8N9mPQil7OAMQIIQ4lMQPyjNHLxD
	dxiwApvwkpxAzUC/BKM3PYkrh1nLcifCju1/H6qPXR6Uf16eqaFmOoXrg7ZlnFisezwL0QpizaZ
	2Xl68+ds=
X-Gm-Gg: ATEYQzxMb1snc4dPlrhObVoZJdO2juh65OKiYP3xbLkANmXpwOT250ymmlZgof/W3l7
	5hGnRnNPAVlwVcOtUsgP3zTAG5s1mPgov6zTmbH9Sqi1OKrIQrMLg98XnDKlvcf/TOhzVvd6Ge0
	Gjfk4UGqvWxuhj3UJMl3WhwypKdUoc8BdH2q0EGiDI/6B9t70YXEpET6IBwZLKWa/H4FsnGbjqU
	uXyUYF/u1ShuV60KzP6zM1W7/w1YG7R3za0uPVe4P9qeaSUNJZZJaKkBbYLaI7GWJDvjaVUvI90
	3FYS3ma2OHldKiSXasgGrOayy4itkQHj5r+EAZ19/jFnDvnthuHTbV8aSlNN1+pY2gre/vRRFgP
	m0UU9CywotdGjzH39jKAQOhsIshFFp+VfmSZfkDJIJRmKjTKaIlPQ8FZG3MmXY7riYEDIb/0Sn4
	7AaxP6uNCTXoyYRl/OTt8wle+L5QDwZZh/TaH7NynKO7ZNDXQ1hPGg8sFPTbEN8NFBERof/s/eJ
	hBDT/QZgTeGFsOZ
X-Received: by 2002:a05:600c:890c:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4888e0990c5mr6473235e9.9.1775096428010;
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:26 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:15 +0100
Subject: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
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
X-CRM114-CacheID: sfid-20260401_192030_728769_89AC746A 
X-CRM114-Status: GOOD (  19.43  )
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
 drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index d2355b128ba4..f9c59c07558a 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,61 @@
 
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
+ * @irq_mask_value:		value to right to the mask register to mask out
+ *				all interrupts.
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
@@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
+	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
 
 	return 0;
 }
@@ -87,13 +135,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
@@ -122,6 +178,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
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
@@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0


