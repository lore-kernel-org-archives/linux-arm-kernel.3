Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=; b=fY4yJj7GONLBWBbvBBDxiPoNGg
	xtsIUWSIsmMhSdOuYocB7MR4+tmPLaD5IIcEtxLd6CCAhpR/iBsGPPS7XItS/mVTNNyuNO8vtxhZb
	4G1nC75/CTLlSC/zBwKtzaEj2e5tAzjsSlnih8m+AWfySEZopv3dzW5POoY9XtFZn6ay7YYny1vHV
	mBzEXFRdX9Q11ArRJsOMMpjD5gH9tm0/B4SYhpTRzP1uDq23FiYDgFBULvFhgxYP0n4adeC48x55D
	ONmfRJA+iksg9BQtZrvWiTSZDyq0KUh0AGbJ4r71OInUe5uNUxw6opOdHZn2CuGGPPU8XOY0pD9DO
	65oS4zGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9i-0000000CB90-1J5i;
	Mon, 20 Oct 2025 07:18:10 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9c-0000000CB4w-3aL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3637d6e9923so40233231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944683; x=1761549483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=OPlC94mFK8vIf7fOis2hDxBj8fsndvlTi0xtvph+4aVu2jdhSrt9XJoVVG9shroYZx
         Fj3FgUhEIk8ve7FoikDIDf0FYC9O6SwjYfQP6cqw4ZOf28/1QDe+gKfW+vuuEhAvjH+D
         BWVPYW/GkAFcLAzYFHzdQGsDAbtDvlg5EJsvL+/I100GYZs9D0kY1VT2J952r2EmU0ir
         qAaJh7oD/dbhlJp2wdJIkHifK9q64OgH64+tBsPoJQZvgujzVtbFvxRGjbmdwKooccf4
         Ba76rtN55xVKrI8Dmj99FjhM2ZwApLLcZnAHnaHg7vWAHUgf9IsTq/aySfErHCj/JawX
         2GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944683; x=1761549483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=TaYqZDWfgwo96wpUkXOaFUTyWuKKvxKhpHAspbC+odAE6NuMBQcHTcZmsxMhVdFpXF
         Mg8qUSX+VZOgAMAkYD3jCcSSlvCLi43xnZrhMKt1kE5HOnj8FEjKCarrmt9kD7rb5Gap
         OSwUOGqyFlULk9bNuQY4uK+EuuQRpG65PVv+G2nBUgp623/Q7gY7IfNKMPUBsc6CtqYx
         YnAxDHPvnRR6wOLcB7KYrKcVs08jhgakCozTPaJzfYeasiYHofskm8vt59dN1J9x/6HN
         fz4PXszMgTJpM/PBMS2pRe2v+15lqQgHHATRi4Ygzz2JufMvahzHhZZeir5R4PPchtvR
         P1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXCyVSnRw6PnAfusC175MPMy7BQTvW9qowZ05sycxIl4wSUpKnr+5ZU3oK+2GuAPqORv2lJuLjxObRL9QbJD6x6@lists.infradead.org
X-Gm-Message-State: AOJu0YxcmMZfH9+uFSFCbLv9V1HyXbab4BVdbi1Id7jA2QUpXDi7Uuzw
	glBrdNXbMWBDAmwnv74wziPYNpirk7lMmt+VKWaFUSu11+GDMpmdCFZ9
X-Gm-Gg: ASbGncvDzfQ2pYwpUtNym+brW2ANPG641SBFr3AHUvRrVNkZTKWwRQ8S4Ao8tYtRprj
	jUd/Rd36mDR0s32ZX2UOnE2klCVoLmsXxizVD418vKf5+XfdMAw666Qd/K32fsP2i6vwJHYWN6A
	jWCuSEfzEbWljYUOdQnhS/pFkJOokS3njfTi+JWtvxyLPW4lcUQtSKog8La6203U+A9VoZfB+XF
	EJ4RUKhf+o3u9NM36yTBUyHZwGgNCoJR0hEXlykURBZVK3DMevI1iS/v7dtGXwQ7pG7aP+HyqA6
	84u/Zfd1mpRcb70URsdwrUDaDsJUSZYFHdwWkpCIe4dh7FCCnT8wVD61/GMbXSR5he8iZ2WWAtC
	Pf6IMZziyVxiYpvE/0P9cpWWZsnNetk+GfhQG3Mcfhyn7XtP9oScdfjUw5fs19tEvoVbFrcYtNm
	7TEx3l3W0XBYSitERIqysNUZpU9nbFOWn9NIvA8P9ybLnn
X-Google-Smtp-Source: AGHT+IGp1YoHROdSXnH/uYRYyc4xRRnoYn8XBIGIRo9FTNvDdUeBD58r78uBHGeJccaDt+7VPakDHA==
X-Received: by 2002:a2e:a9a1:0:b0:364:e586:963d with SMTP id 38308e7fff4ca-3779779ed24mr36793911fa.19.1760944682677;
        Mon, 20 Oct 2025 00:18:02 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:18:01 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:27 +0200
Subject: [PATCH v3 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-4-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SEKtq8WlaDinzaqN6sbmXex+0jo1iDkPy6Zh0RvgHvU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIZ1Jf69x3LAuim1DypUebtkcRfpVSMEi+DS
 CMACgQmyliJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiGQAKCRCIgE5vWV1S
 MoKdD/968DvG23fzIcVGZGpsOk49d/VnVy7WOHLZ1aymMwSR226Np+PcY3TW95V8f0lrR0BfWfC
 GZoxRRTcYiVCH8SMN2YnKcJFISC5/aTE4pcOwvrIKGMj0qOf8QFuH3wEHjAHOgtPwKhqb0tu/bd
 8FXDShyfUiR8poUbWGZhdw3OhzrjdTApQc++Lydmlb4QiF9eB8p1gu+Hk6LtyOS4AOFr2VeA7tS
 PcltmLnDsNAZPGxFxqBvScGfXpijOnmShj3NDXSVdR25VbpHy04sYPxLfoJc5eW8MM02ef3aBdi
 xuQYjPXvVlDXF893/AG1mcEO68CoSBXN6RHcVCNlDEa4YHl6ztpASahiMpyrOqyt5KI2zwUxE8E
 1TBi9CG22ppH1Mk2qpXY3hX73i+s3h1JWg9cEUH1Fps5nHROoWIsm9Ot+WiDWKo6T8+KcHJY9df
 ehIalq+w09UyIrpC+qHd1h673ADHbnSIVdRuQ/B0lh6RX5so1uqWwt6WbMa4CgC+LhacwwChb0N
 tznonRbF3lm6a2hymMgR0huj6TEWHKoZPt7kfmlAnEOYzMmrUROjZnhqxnHR1LL9K6t4g6gGxPo
 8P7LXYkkC8CaVx8ODOLAxAzNXfvvmsNB5z/Er/9icX/OD9YLfxCM3DZn1veaSZkYlt3RE96d9cf
 R0Tju8jd1zleopg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001804_955113_C5087EE2 
X-CRM114-Status: GOOD (  14.35  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d0ef108c57d13c10004aa25014cbf..fdde573eb59d11a7c6a87141863df1b9b58f64fd 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.50.1


