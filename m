Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC24C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=; b=hUEK+WRHU98hVleO6xk6ZtgB2J
	Nk77uRLOlmpxMW6KIG5a5MsyfgPgjqDMhDyosEXIhSjl2pH2fHMA+5orVWsnyFoxYuUuhoU/4TLgm
	iSLZjpbJuIE0hEhtYoDaTpzxARZPTGDK8d6rGJqhuM60yQpNqlF7bM4ijMxtgwGquJIhH8k2R2E4o
	koFdRTH/O+18I0WsqZGP1bx2bRMQS5wWgRONmCFwJBkxdaPu8rgIFGrSbAR+C1ltX8f9XjhphYZT4
	4tnYgWAErYUTzBrFw8+Rp/NZAq8TNcdf6tGrAbMfbvkiXTjzv627ttViJa+KhFa/dkT599WeNYc9r
	scECB+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEzZ-0000000BT8f-1zBV;
	Tue, 06 May 2025 09:53:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBb-0000000BFwJ-35iU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso2469645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522118; x=1747126918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=Dg912QLy/7cZmMUKa8qcL9Et2kuPgYrtpQ838MLdrf9AO+HRO7Eu6bTvFOXcUQqdFF
         WYKtwj0ilWu7FP/hdTuKoh5umJwtD6hu0dC4O1e0cIEJEYHdyEUQ1GxVm/iREIuLTvmv
         InyFy1twcKdb7uQluMyg26dIF/2PHAhU23vSKQ0OrqoH21bSwbC/WW43ff3oDeu9QK8F
         rilqD0gCnd6FJ3laSlpvk5yNbuUdQrlsv6tIjeJnVlPbpQDWrwSfeevbxDskFEJ4qzVI
         woyYKn6zahqi+8DGGj58m79Wvar3+F5UZk1QHQUBG30k+de+wbDpqaom01G5Z4/fApkX
         Eyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522118; x=1747126918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yY34Nsc7/2UlbzCskK3g4iLw+MDnwVImSZrJoLfm7I=;
        b=dJsuUG9POuXbpkBLLVu42pV0M26gtjWf6CGdr3RDaTJS5GoM9wF3fXRDLo0SjJyJlR
         L2oybmg4CVCtQhjvTQYIYT64pHNCKy/sjUPsC/AZ4/0APafV8zP5SGvTbUSr4bz/cugU
         L85gYmVEt6G08Cg/bA1dPFWfnrqg7fJXFT+40zJrp4gUaDKp6KxQf9CIkLrNVzhfRvBY
         cA5jkVSyvPftBCPDQf3FMDX/HEtFsmNW6ka69hmIS/4BCACyqkl8trbkkt9g+7bLpp9y
         yKLQak8k7TQkrrsTZGeCjpygvcnM/HPWZwqlL/OhmV7fTGFWc8fTAs6QSUPL1xrBh9RF
         l+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVmhCgvp+icBSluURNT9FlOahlC2eCDXAsMmbKCayJzzVE2oelo73NDm5e98AUcI2N79Yc/1thTJXvAVJp1v/59@lists.infradead.org
X-Gm-Message-State: AOJu0YzoHvlEuyKlHUFc9xvLmNX744sPlWdfyfFZz2V9XliPaHD9ntKL
	LV9HzdwHa7PIUTZYvfNbYQQlpZ5qRNmmY0JzzXvsHDPwKVosj6pKIg62RJevyxc=
X-Gm-Gg: ASbGncv1/CqMuKnyxdA9pRo6LaA398RK/ybWCm54lD6HZ7KvEKoO+GcBDowJP1Lai7L
	K5goow0N64TW1qxZkys1IoVUylOfTaKY+z6JEbuBk6EEhG27wgDHbPN0KokKYum35wMuAKCZ6pz
	KuhWDKJphp82v/2+vN/0U5VwHkmXdtT3KA7KI740YwkyXe/pEoIesrp2LgOBgL29faYjk8SfCa1
	9INy9hTB0Yp65ATNbYAYJvfMbfAv8GDJGH6eFljzJCrpJSK16hstva3m+1ifc1Ydfb2rSG8O2Pq
	vzMHkRILBQ9R8wobNgGsiXG5d8MZdodM940=
X-Google-Smtp-Source: AGHT+IHlrqVIs5Aw286+uquukoDPpnOG8CuGZuW/5Q7O+V4/Xk4pBW6x/ZhR+RATXx4lWatFtAIZYQ==
X-Received: by 2002:a05:600c:3c9b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-441d0fcd574mr18810665e9.14.1746522118135;
        Tue, 06 May 2025 02:01:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:48 +0200
Subject: [PATCH 05/12] gpio: madera: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-5-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VRF/3N1EVGTtM6WG9zf061j9Cu7jjnguKsupmm1lpOk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/9HAJpDoBjHPguAUrkQ2bywcX0IE4BkH72+
 gedeertAESJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/QAKCRARpy6gFHHX
 cmW4D/wN/rp+VApidRjxuIIZZuw5p6GCIcK7pifUdrQJgNqrwknypL7yMfOuZhfzvGJtf7Pt0aZ
 ANnCXCR6wj0ZptCeqhSAN4cR+cB3sqy/D7AiVjPwEF/dHzLauvNZviX4DqjpkfpZ/cHVp61q5cP
 pS5dluslaLUqUlJhpN47WpCdZAfy0LEyMgGPjyjWJvB7+m3kTf6il/Pt22y7Y5QJkqbLp2rvsIl
 kYltmOq2+ZDnlt+FTSrM0zpOBmnLsOe9lmXeeSlIlb8wJdbOtzLM6aAKDcNj1UrOUKW/6yNnxrT
 HKbqSA3kIr3QGEE29jBCD8sdNysAsSYvXIr0BSmDJmVL5GZihzsPl+v4ghss5DB5yj7HJ+P6Bv8
 bThnZPd+f4niokXgcKGD87GalnGPCESS63IjePPCIQ//CLa9cgZMWIw3drkFkYZIROYxscxwf1B
 lPIwm9ptXGE6IDQeAYZckd2EwXftyWs9WBoC9bHaQ+oxeOxLdqmEqqHqofitTxT2r3iBGEDEXba
 tFcGhWZyg5Aac7bGW37Qs9QkLEO9Q7pf7drBBnXLqux2qfVqCU+HY+oebMQc7MmO2DSAqGvPQPV
 a7HASDWQuejDmEfxkjjye+/Aj4H3A2M9Xhvc0BqfgUB2pXj2FvhWMKiRqisY+FrAzGjcASUDc05
 p3o05soZ+uWZTXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020159_783627_568C4D23 
X-CRM114-Status: GOOD (  14.37  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-madera.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 8f38303fcbc4a..e73e72d62bc8d 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -87,23 +87,17 @@ static int madera_gpio_direction_out(struct gpio_chip *chip,
 				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
-static void madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int madera_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct madera_gpio *madera_gpio = gpiochip_get_data(chip);
 	struct madera *madera = madera_gpio->madera;
 	unsigned int reg_offset = 2 * offset;
 	unsigned int reg_val = value ? MADERA_GP1_LVL : 0;
-	int ret;
 
-	ret = regmap_update_bits(madera->regmap,
-				 MADERA_GPIO1_CTRL_1 + reg_offset,
-				 MADERA_GP1_LVL_MASK, reg_val);
-
-	/* set() doesn't return an error so log a warning */
-	if (ret)
-		dev_warn(madera->dev, "Failed to write to 0x%x (%d)\n",
-			 MADERA_GPIO1_CTRL_1 + reg_offset, ret);
+	return regmap_update_bits(madera->regmap,
+				  MADERA_GPIO1_CTRL_1 + reg_offset,
+				  MADERA_GP1_LVL_MASK, reg_val);
 }
 
 static const struct gpio_chip madera_gpio_chip = {
@@ -115,7 +109,7 @@ static const struct gpio_chip madera_gpio_chip = {
 	.direction_input	= madera_gpio_direction_in,
 	.get			= madera_gpio_get,
 	.direction_output	= madera_gpio_direction_out,
-	.set			= madera_gpio_set,
+	.set_rv			= madera_gpio_set,
 	.set_config		= gpiochip_generic_config,
 	.can_sleep		= true,
 };

-- 
2.45.2


