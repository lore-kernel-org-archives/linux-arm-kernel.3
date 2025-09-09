Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0CBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=; b=qrykyKQM0rDbqzQonvepJEQ6De
	oW4+A1r4XYclNQbtkJFLDYfv00Do4dPC3q1ldzgcvIRXmpJNjir8m0F7EqSWNSdReasbOlxaMlfK1
	oZGoXADTy8rLkeDGuccUH//8DusoU1lE+022rys/trcxQ0y/W5xVNtUTcOSb/vqN0NFTffJSZzxo8
	RifhbUSQ9Sgeu+GJosSwORKD+RsbKc7JW516sA4VLoFGDn+mNRwGkt50/TQyCT0zNxfFZfoyS7uz5
	KA8F96L7q1PVnSgkJNtcA96CkpUZ0ZxrN0SKGZSnKkJJb//NIf6vkq0RXYMjb86y/UppXtUG8PUmR
	l9w1Yn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwl9-00000006pID-2WWf;
	Tue, 09 Sep 2025 11:43:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSP-00000005stM-1M2v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso26886115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409368; x=1758014168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=XsQ+TKL8dVTTzpSus38WrKQZWPjtFGJISESbV7L6OXap09xixaOboAlMwQ5lKQ62Ao
         Yv75cnVsKQWsWs/ncYM48KoV1KCMXxnOMgpd8XCGO7G9iRemiT4SLlfVi2/URUkkCsTC
         2qbEitcRFD2kTOuCY2icYWzEgwvBltwkFEiDIk/mI0o2tUV2VIqce5AH28t+aVzUb1sK
         IAAP2B2YzWCGdAbz52xCVpB1iJTvYgQw8yjMqmtFxuYJEabvwTR1uL5DmVLXziYLfBno
         SMTJPBuQLSSDMlBjiW1aLSsv1fCm6VPhCRVpLwzKLPfjS55sZNgpxCC+KbVz9NGuo0H6
         R0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409368; x=1758014168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMmaVn+LZJgn5b7c1rWtdZrF0XHWPwWhtZTr2dtFlt4=;
        b=RBKKa9cDHew3QFJDFY52GpDZ9e+5QB/qw3xylFgGRqZpevCjymgsUsVFeZPrC5byiK
         1h2DIY3F2HzZ9prHOgT70vFEAazoNwoCY7E2MQQeEF9p++o4Ex/ahTJXL9DtP7T1cDtW
         fRoqgE67zUAUjaS1JCO44wnh6VUknaqk5WaT2QuaEfQY5/YwT6h/+QuuTwt7iGVWy051
         ebjARq050Gx5c7AUfrvaUYT1wHxbmtKnTmm6dDb1GweU7QNbBMHICpy0yeQwWvXe8SUr
         rk++yGcvO2Zuvhhiq2gi+93tx1fvHUllc2WuvWOdp+Z9C9eeWGpbhWWhlNHX+OkxQZdt
         4D2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYcCDjarEvWi6aAuZIuM3REjpRmbyj+I64/X6dFeomv4eBxo6khTw5m74tMaFy31AshcIHiTY7Zc8aQYgWrGE+@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8Bbv1jky1+ikuPKyU0yCMC3eVe8o5/gifiqCaIV/JRZigSqv
	qmBn1v+rUVrYLWL2VxIFaLdol+2oje/4ZVr+xdVcH07+/XeDjNCzt+EVfqOyJqzBsRM=
X-Gm-Gg: ASbGncu+PGYDz3ULL4dKC90S1V4bdrrpHdUm+Tg+IQ4yakUcgUNmw35DuejnsB99rbT
	b0C4giKZtb4UhZ6UaIPEdXnvD/DcscYvhsOB0D7vq27+Dhb4NkbjAFAx+WavG5e5YTvELf+YTWR
	W8+dEpaPN0kXxogO+eB/ROEg+p11ZUd6WszaGeELMb9zMjbKh8Uu1Epx8X8Wp3ZSyRcybvZDBRF
	zaHn0ccUwPwabjAAnk0qnWBT/aNfd2sqJM17039yWvYhopj09dm6GcArTJHULKXCAhK5JDT+v/b
	+P9F7hJcEUx6ddmtTLOk8UuTPQE7Z/HYnGQcilxGWDtG1s9+7vKH4vnzn7jT74RGdPfobk2pUAx
	BpuH8ZBa5kY5ptqH3Lw==
X-Google-Smtp-Source: AGHT+IFmO6VqhZ9BkxEjJhWWUjTF6UtWEURBON8fvebih0GzMhUphDe9TftqByslO0IRvxtisIwrOw==
X-Received: by 2002:a05:600c:19ce:b0:45b:b05a:aeeb with SMTP id 5b1f17b1804b1-45dddec8ff1mr97136895e9.28.1757409367901;
        Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:40 +0200
Subject: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2177;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OpZH1E4uX1rbCcdgDBOgsBrK0sLVF3+FQJb0MPT9Hmc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6p94D+S/c4LzuEPR6IThg0j1mZ/5T2G686
 meGifKdh+SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cvcmEADOfAiuC1Ep9RvIkJ+mqoo9WSMNXkDcTeYwBaiwwjIz0muCH85jNMqW9b3ZFhtBFSJuNtX
 arXg6eVDNEk4OcNWPJoc69s1QTJ9+jgvdXEqIvD/bmYCRDMpo+jQnl8UeLBhd7CBBEa45+1a68E
 M+d7xx0SBcN6nLNJqgO912DPu80/cw/gjXeHHbHoFmaCoklpIroAj2MEnMLoRluFVHoFaQ9d+8K
 Bu4Pzdqqu0HRLMJ1LAFhIF3VYoI+tpwPNIgT3E8/+5gmTzkcVW9Z+k/HLDTuKTyzC8lur0Ery/Y
 kT014qHXyE5TGEawY/IxfimrrtPXPu+wV2svkqUHpN3Pv7Qgph9GzQ8xluK3HnRV1tt1HUK/IMe
 f7j/0tewxNFyFeAGBlEua07W3bCnMCARotAno704aWDtPSIuP314GWm3T8z+l44QTe1F7vVVj/2
 8Q8vQYPB7OxkgxJv93dnJymPuJ1f4r/osq1nj6J8nngFzM2/Kc+UleQrCg+vmNpBSv4PTsApf16
 usJOj6hIKzfx05g/FzdSTDCqDptEEALnloKNJqBv1h8Y/qzjzei+M2XQmue1W5e8k7FqFuoP0zo
 AKlT5n8Ntxzdvl3e7GrObrqLBzaR9CTUOYcDGkDl1ixM/qLuQAJZWWxzTQZWfNeu0QrOndJIM/o
 3Bex3gwvCoubkBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021609_384714_5CA1829B 
X-CRM114-Status: GOOD (  16.08  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..6bc224d3a561077bf3438a70591e1f313ac834f3 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1


