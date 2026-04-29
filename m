Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28CFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=; b=Q65cC3GR/QALoU4kiRjWrfkONI
	NFtfjOBkQGPB9HCSQYIzpH+cCSuw59R5bFNv/3hN/ASz3Q9mGWQmva0qsNTec4tV756uTSHJB2G+X
	VUqJ/aLfqaHGVMM66c6nZE9OUN6WOXQts5T8QmK+IVXLIKa9xVcIZQ5HNxbk8c+B8A4/1IJNPQnQn
	9xY+tBm2Epd5vZdSzIFGq9FvbbfJlSRdnIpYbNbHtr6Qel69JwL7xH9AWt24GpABfjrmwNPbjwsUJ
	BeTDv1W645i9DG2HvTnFCwGjUJyzx5AuHu4ooFYJesSk2ciG+jZKpuPqpgy+nu4d5XMK8x6ALQ1hZ
	92MObqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9R-000000046va-3ZXk;
	Wed, 29 Apr 2026 19:00:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9B-000000046og-1OsI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:00:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso854905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489232; x=1778094032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=AFbUzI32og9uEvq410RFyVjHpWn58MNKBh/xx2WprpDQidgphnpW7o3UpTk1MdhCyy
         DYPfAiqn1a0H+clExYp0621bVq/GOZb8tcgFb+sFLk5I5w/bghAXPBQd0pxrVukay4hq
         GSrUKzYcz1zUSybtvW1VC8Ulq33MrTqYxTuJ6dGO8EOOyqBLdiqRm8R6+fJvyZxmBCSv
         8DQVIfboB6Z3uOGbxi3pAIdFDgiiMGI2yEVOHMLiG8G6ep7epkKiBk0W45Nqz/tP1ZBi
         lzbDRY+SDEzBxuoa8DjOMZL5ssNWP9cKr6I3xg7POIqr+gcqdPpwIFGNmT+dW2CyIDMm
         BTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489232; x=1778094032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=cj+IEZSeuVhx471ViW0hXT9YMz9djSX7T4leYE7lwwe1R2vKoZg+SE2Jk/6Tc5WVPQ
         r/F04/u7FBtIdDJqoOTszofXvCuB6c0lU0TI6+ewrUt3Ra/QOnY4X7bElZVOivVESFS1
         tC/arlpVm88MP7EbbOX5d21q1AKzfFOTmCPbgF3ndKwCQCXcTIsdLOEL2wJuIF+6Po43
         wq+pWHORNutIsqfacgSPkU/ar1/JF1AX7i2j+lDU/JnuLg1nDWueBhW2yCBsGMpc/s+c
         ZLmdUcxe2H2O2spI7k5qtyKPClPdGPylCta+gvAA86CaaTHLaeTcA4KYZ1r+9VBATNuY
         KhZA==
X-Forwarded-Encrypted: i=1; AFNElJ81KVyIWFpbfyw+ivrH91cbKDAwz+CjbPxJefoDObMgXcRvgE8w6XgWFJXms4ghQhp4vD2OWROgVlz+YlUzL3Q8@lists.infradead.org
X-Gm-Message-State: AOJu0YzDuPfBPGyV2qdLLjG6IiVx4gZAJyTU/1Z+X+rL60Ec+cHOxX/T
	U3yz5WuoyIYwXTYqFYMizRCXUDzcGr+V9F34KiKmEoqqUtoP9ErkjQ7MbsPO1aivMlc=
X-Gm-Gg: AeBDieuXDXSmeWF8rNaGCXW4ERxqFuXmN6zfYq6wvXqCm/7s9tj/r4LwRF6wsTF1YHx
	7rd+iAH7mSzQ0Pd7Q4wC32dyuAujH7vbOAtS7FIHk0XEHd6y2WSGI6tOdDgZ1dLpurURRxnn0Fo
	tNs0oQEsAOVBbeCREUqL7ys+aucyJlQxCU5XSuims7bZTSro1dT0w4uWUSnYbv8Sl16NElJmMo6
	KrUy3+VBLpMFU8Wc9OId6kjTvs+jV8+axwDAz4BGoBjBq3ihUkXf3dkdMlTteasL1IwrsZjbxfn
	LNevT7ELEoWrlJplhgHAGEUPORMY5hqSJa2YrIL/Cs6x7iTL+ujSHNiLnscy1E3USy7kwCCDo3N
	4S0CwM5UwW+Ek71lo825TZh9Eveq/8rUqRaUnqDLRiUpDWb9jOK2tz0bN0na/y95HYsWThg9fhj
	zf2rwS1ZOjcyPpiLAfof93PHiLhFvLUDwO9bKwUFp3omI9zmhrIZNApE9lDmIYmIF8KqvpVUxKI
	E6xSk611S6Magg5FB6Qi3zoszc=
X-Received: by 2002:a05:600c:a409:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48a7b531980mr72931285e9.15.1777489231411;
        Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:25 +0100
Subject: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_120033_406236_103D0C83 
X-CRM114-Status: GOOD (  19.30  )
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
 drivers/mailbox/exynos-mailbox.c | 59 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index d2355b128ba4..11657dd475c0 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,52 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
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
+ */
+struct exynos_mbox_driver_data {
+	u16 intgr;
+	u16 intgr_shift;
+	u16 intmr;
+	u16 intmr_mask;
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
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
@@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
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
@@ -133,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0


