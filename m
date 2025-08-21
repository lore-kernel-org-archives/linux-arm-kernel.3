Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A29DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=; b=OvH7S1P7A67mHZuKJSawt671ET
	eIqmS4wZlg/Lh2LlyRfrQYXjEvrwSR4w4gQ+SUTOpY2aqXPkE4ZiBiSmTRxd1hPct374xNLM1EF+F
	9/52pHKD+dapGfjdl9tYfCGRRHLNvWLZfAMNhPOmCXHMsm32gHeiwYC2LEKP2tQ+j99CnKyq/rGu1
	/IHaxO0uRnwuhn67Gewaom3EB5NphHoFe5r732tbg6iI0RCHsusC+yUHiVnrFOb1MH1ux4fZcs3qF
	uCadCoB3PlCeskeriffmGrNt1PQFDzkuPoOuQ+PSrF5L6wRfcEHz/iVglUJUyVBo7bJY6FXP8rdnr
	SDFyrOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIlJ-00000001RAe-3Z8U;
	Fri, 22 Aug 2025 03:48:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEmu-00000000waJ-1iy2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 23:33:45 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7e8706df76bso215327285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 16:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755819223; x=1756424023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=aWy+ED+ePTLcS+KxPESAaIqz1QSv0yGRYPbOZK1qJcXOxyJjmEXy+JdUx8yg6vc6DP
         7F6N9KF1FWoEUIrrV3BxCJtlhHuW/ByjqzuwEGCIuZBqnFq0e5ekPdz9UTbML6cdYGC3
         1T+xuOzrnItkJqY4CCJ5tjUebOv9u4FFCfIA/DfZyfdOLqXoB6pI6VvgBEd1Wo57IzWO
         qeBp7EN3ewkZmN6MQHb0mjvP2ykRdTyEikm5XqI0tuKP+rSNCHCGYSk8OGB0VHIJpJf7
         H3UmiCqPzHZoZjurjognf8FFcL1ovKS0bsyo1mAzoDliMVxiZWi2GRM+kUnAgV8NxHTy
         /hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755819223; x=1756424023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=NHyB0TzPErNK/9ZNXiduP9sBSRc5RFlh/g+oX8NjRSEMQtma4nfl/UklFyg3wmGHX3
         FUkTGNplIRKMc93HbhzghJ8ALZwVI27oqLUWglz3TSOkn+Dy9wduWCfRkY5Ogu63tMg/
         VRReSwpuS0UnfkdMEhLK3wbfPaE18qvAj4o4YHZ3yzfZMkFdkBzi9qQLHjPEysiDzjQ+
         9TnvmRgVc9x/aLfH8A8qK8Tyzy1TACyBTVMI4Kjp/5MyR4lO9C06VqjBTSqucnRXsA0i
         bq5JsRfto8z4bqta2hk5BDsfD8iVdhsJ/AB0fv0QzZeElHUeXaQ2gy+lVMc5Qmun09UP
         fGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJNbsdyfZXiT3NDh8A3UoPO4wWmBHVDsz1mW3mpw2KGG6imUsRp+62LO5SKtOwYVl4BgN34tmJrPLaTFnD3I5w@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6VNvZLLRSZW8mRrZGJWxrCu9SR+JAfv8Wn71c57seGUbhbCRB
	3n2J1T2x4z7zY1+JZ+zTSEwIy/fvf3FCzSc3eb5QXklDYJsFL5fUX13DjWlN2An51YT7XLdUINF
	InPnu0g==
X-Gm-Gg: ASbGncscuREfbrbwVDCG7D4VtyyYOGT93sngVgfY/5UJhgEQByWfDf7NXgNrd+VjVMu
	1sbtYUB2VHYlvthd2kKCX0X1NJM6/JzD6L7DsRNDMiZapqU6gW2j8hMixXV7RzWnIc+OKv+YzGb
	Q72gxYtANMGNlkqz3rBYGYDwbAUWjMNsLznnWQhyOEL3PtETX+oR2/VRcNi1z1DAClhsyHlazXe
	akjpZdotYba63FxkeDv/yZQehZMVi3N0KMZwQdrmRu6TDylHp1NJ8rsmOSggaGcrr1MkiRKe8tg
	0UQM6UbIktvt6iEm7Ijc0dsrfCIC6xHhtgnTHLECr0l4WfErBIlnAA/ul7WQr0Q8SktCIl3TNPf
	9S34/zzSp4TmaHHrfkfUHNBekqzUNBA==
X-Google-Smtp-Source: AGHT+IEE8fYgK55NmdoQhhgPInOhivLoo6o9lQD203iWvd3p+5PTTXRIeOG74yZ2ZatbGTKv9Gbgbw==
X-Received: by 2002:a05:620a:4590:b0:7e2:23c2:e55a with SMTP id af79cd13be357-7ea10f73cf5mr175527285a.27.1755819223112;
        Thu, 21 Aug 2025 16:33:43 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e0204ddsm1216833585a.10.2025.08.21.16.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 16:33:42 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
Date: Thu, 21 Aug 2025 19:33:34 -0400
Message-ID: <20250821233335.1707559-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_163344_461829_C77525F6 
X-CRM114-Status: GOOD (  10.20  )
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

Amlogic GXL has 4 I2C attached to gpio-periphs. I2C_D is on GPIOX_10/11.

Add the relevant func 3 pinmux per the datasheet for S805X/S905X/S905D.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 9171de657f97..a75762e4d264 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -187,6 +187,9 @@ static const unsigned int i2c_sda_c_pins[]	= { GPIODV_28 };
 static const unsigned int i2c_sck_c_dv19_pins[] = { GPIODV_19 };
 static const unsigned int i2c_sda_c_dv18_pins[] = { GPIODV_18 };
 
+static const unsigned int i2c_sck_d_pins[]	= { GPIOX_11 };
+static const unsigned int i2c_sda_d_pins[]	= { GPIOX_10 };
+
 static const unsigned int eth_mdio_pins[]	= { GPIOZ_0 };
 static const unsigned int eth_mdc_pins[]	= { GPIOZ_1 };
 static const unsigned int eth_clk_rx_clk_pins[] = { GPIOZ_2 };
@@ -411,6 +414,8 @@ static const struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GPIO_GROUP(GPIO_TEST_N),
 
 	/* Bank X */
+	GROUP(i2c_sda_d,	5,	5),
+	GROUP(i2c_sck_d,	5,	4),
 	GROUP(sdio_d0,		5,	31),
 	GROUP(sdio_d1,		5,	30),
 	GROUP(sdio_d2,		5,	29),
@@ -651,6 +656,10 @@ static const char * const i2c_c_groups[] = {
 	"i2c_sck_c", "i2c_sda_c", "i2c_sda_c_dv18", "i2c_sck_c_dv19",
 };
 
+static const char * const i2c_d_groups[] = {
+	"i2c_sck_d", "i2c_sda_d",
+};
+
 static const char * const eth_groups[] = {
 	"eth_mdio", "eth_mdc", "eth_clk_rx_clk", "eth_rx_dv",
 	"eth_rxd0", "eth_rxd1", "eth_rxd2", "eth_rxd3",
@@ -777,6 +786,7 @@ static const struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(i2c_a),
 	FUNCTION(i2c_b),
 	FUNCTION(i2c_c),
+	FUNCTION(i2c_d),
 	FUNCTION(eth),
 	FUNCTION(pwm_a),
 	FUNCTION(pwm_b),
-- 
2.47.2


