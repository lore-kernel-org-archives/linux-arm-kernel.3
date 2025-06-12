Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F6BC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=; b=5BWqTpyl+sctk1CpOwljrx1M0d
	mLAzAi4Wtml4aL0H00d5+Zm7k7EOLS3oHn/erbZQMhlneKeLTZX9SkdWJ0SB0qzY/RZQBXzKZ3T6G
	PuNVo8h1sb7qASCg8Pqtv4CdY1xeKiVvRxmSlVHbHNtMVoRv6600Ti66eEyX7p0q8hRzLS9rWvt6R
	02XjNJU0GOnj7pzvGZVHsdvcor0l4C6Z7SFDbixYSQSf80envqIWsEvD3oxLyVxsoJKeJqGqZchPF
	DBEcL8Abo748edpsEzmpRviEDIh/JN3/n7FB4HQ/eiQbqWhrihAt4zAD9QL/63Y9IvCv91KnEViua
	oI2i9skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnP-0000000EEJE-1mXW;
	Thu, 12 Jun 2025 19:41:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmN-0000000DLmG-14CS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so11655355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734138; x=1750338938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=hGLEDr3QA5Fq49/YIK5SnYGc8reWkXrzd79dF5YuDa5SaDOBgBN/nfb0hAS+6rn66V
         oLlegqc0lFd22/Klayl5V1p/T310KtGCseMuTVCXr8RiU5hVt7Ec+vjsLVu8oi4LH94Y
         xrGc1T0o0IiPOcWoLXwvcMmEblNjHsksOq801a3hmuYPy0/pCeyhGRhQGsHic+RtBbUV
         2NUv3zoAd1KbXEQQVti/onxx5z3PKr/QDtRkSBUPhmRlehgb2i62wcYoU01mNlT5Psc0
         FPF1BpGCULp6euRNEWOw+0I3nWIMG+TF/LdmeJyf8/BzpnIgFizfr0kI8buehhPO0M2q
         tNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734138; x=1750338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsO/RfPfPYEcGu7pzHlaE+05FqNn0lPn9H16RQ8VcEk=;
        b=jJpMjk7kmE2up+oGZGrzqqZ+ZxhvSFND0HLQNLK5xSoR7Ts6OWqnWnJbF6QyKRSCsa
         ypqXQfDl87QxQwweCjrqLsMWyi51cp5GDEebbcgY7cRwV04VSkUkCCEupBgPXK0V5jM+
         nFt8epaGN68bgeM33gwlkZqhccqUa6+c0iRoWL6OmvSJJ1NdqshKqOKFv9HLkqxD9+Tg
         /jzr9Rq0zS/BE3A6TWMk0dGVxzLBJTt41i2qfBkMUHZvhxbZLQeJq5R3tWJaVAsp9YeO
         epcUy/lGk888JszxF32qxZ+taP/jtYSTsPsnuaNJ7I4Fz1EhkPIVl4DOwepIfVez8GXh
         yLJg==
X-Gm-Message-State: AOJu0Yw5Q0WKlGrXV+2M6TewzLWw02z8UiWhDnQCyH5GkGaAXNJ+0lSU
	XJJMRS/JDG4u5ikR0+OndStUhguHb0dODLpxR+cOks9IdPl4cTC5E+uF/CUNcX8+M30=
X-Gm-Gg: ASbGncukncR/wyHq9H2J7o6XNaRa0ni0F4zPTthT7RpcF5I2Cl5BUIBl7QPOP5KG7cj
	ItdeXSnjOyqlEwqBEg7uqkdeFlS1YbsHetFcDfBmZ2y3Cpmv0C/ptwRVJ8fQVbdTsSdO2j5BJQB
	pMXHk0E4KSX62EVI9QQWVUyknsTWhQ1L8E6asitToemwsIVWB6zbleQnPVfAw5kXVEOUQdhV5Zx
	plknPsDP0/jyEPvaeT2r6xkONWRbuF5Uzh9/EjqkFR/7G2avxibkdvfZrZ14e0UrnjorQ59jc/4
	Xddkg3OxnshIsLDtDZewkPgE1a/UUwd6ZRSIu1lWHcBWQq5HNtihu8k=
X-Google-Smtp-Source: AGHT+IF/kkUZmqJMzJYib645Bdu8k5BoQYvJm3jm3K7Cxkyey72KYBawXxzfCbRcLK0/hrXvvJy0SA==
X-Received: by 2002:a05:600c:3b94:b0:442:f4d4:546 with SMTP id 5b1f17b1804b1-4532486c513mr66058075e9.1.1749734137693;
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:20 +0200
Subject: [PATCH 11/16] pinctrl: pic32: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-11-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=36c+wupdpQstMiyirn6O+A3D3CWfgG4Pu3KgyyFz9nA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmawJ7WD6umM/5yinajp8MTMUCxK3T/5pvO
 NJPhif2mbeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ctMdEACUmqcuKhVLteNNFsKXjhb0zQLkw4a2Fw9Tyn53Jq2evetPN4alNRZOafrKnN4EQaA2bjC
 rCflz4VMDSQ8DB+ExJ1dZMPiE47azhpnGrP2Ntday7+7iuRXGMWpM8ADbtGgUe/87ZPFa0KidXZ
 DVBXl4M3NXYsc5IWpsJnmoLdg5UyE+mW9JoofY+Mz04Oxd6n9fQ5bZeifkdllln4Q3y5qnNSjb0
 cdW1s1afOJlDtHkPTAbuP2RB+eGem60QlsIWtBpMPpWxv4eitSa3ucXGPDal0PCK9fSTCstU62g
 lrFrlnFbOaL7ZWcHtDDFy2m24jc1lIqxy0Azvs7DQWHF0D7SQDExoX8kLuVPW/sqEt2t8AoFs3v
 jXf+K1tgpr5K9xn8S10zcd7MNFEPWRxFLTb1T+GPZpPJ9kW51o0pp6qBvuDUrgf6N9wwDjtloqU
 knRNbrM431Biml5vy6a26Ze8NeXj9D9txpKR9izG2oM0yUdAS90qQqn8d8Gl4J5gwP28GB5WU7E
 7FYMcPwKodRzc69PaB4Ab4ULl+m160z7TQtvhZhM/bIK067QAAX5rXY8ZTyU/ZMnRRLh9VaBrr/
 V2zPICzcxe2Duc+ES9nlLO+6hTvzZ4Wrzz2cnxnr+exUfjvlrPHT1knIw87EtPiAZVpvG3qC7BA
 oo6HMlDJeALdzbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061539_308784_6F4ABF80 
X-CRM114-Status: GOOD (  12.69  )
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
 drivers/pinctrl/pinctrl-pic32.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index bf827ab081a1d672c440a8b4eccab539fdc215e7..6d64cab97e8116625c2efce29a3e5db8248bcba4 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1828,8 +1828,8 @@ static int pic32_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->reg_base + PORT_REG) & BIT(offset));
 }
 
-static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
-			       int value)
+static int pic32_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
@@ -1838,6 +1838,8 @@ static void pic32_gpio_set(struct gpio_chip *chip, unsigned offset,
 		writel(mask, bank->reg_base + PIC32_SET(PORT_REG));
 	else
 		writel(mask, bank->reg_base + PIC32_CLR(PORT_REG));
+
+	return 0;
 }
 
 static int pic32_gpio_direction_output(struct gpio_chip *chip,
@@ -2118,7 +2120,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 			.direction_input = pic32_gpio_direction_input,	\
 			.direction_output = pic32_gpio_direction_output, \
 			.get = pic32_gpio_get,				\
-			.set = pic32_gpio_set,				\
+			.set_rv = pic32_gpio_set,			\
 			.ngpio = _npins,				\
 			.base = GPIO_BANK_START(_bank),			\
 			.owner = THIS_MODULE,				\

-- 
2.48.1


