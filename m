Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFEEE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=; b=zDUG+RAQ1wlpk/Dw7H+9t3AMdS
	2m7WDp6vBbfR0Y7oGos1HaehIwXlTTUS7IyC9boZQ9PaKbH/6Oo8l+c8jr6htfl5DEoLGMcvvcAhJ
	yJVZWc+TyoC8wuYrSM1f6iGmhaT3DSBWN62IBtHsyFNrwkjIjIQqz/BPthwSeVGCwhBdqX1oR7vWu
	oht/YXWrzbE4oBh0+hMrIdCQEn1NzIaoEBCxcNpjxFb5Iu7SAAVGk8nOpva71+BBmf976OWgfHOwW
	BTEO8iZe/bnBCO2ueFqAWcmfHCkQcY/4NyzI++T/EuG1hwy7wFn1Jui4AatMC6uE6qGiqhJLrz9IT
	bnp9nnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1KP-000000077zl-23Nj;
	Sat, 21 Dec 2024 15:23:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1Gy-000000077Yn-2FWO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 15:20:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361f664af5so31732855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Dec 2024 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794407; x=1735399207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=bZQeV4T/R8JwNokDq4RJV1PQjwk6eYngWN8tiEBpGPgOoMCgvnHTfaEDGuujBx23UP
         ix4EAWp6xTosoOLWUElVLbOVICCaqS5gtgXzDPH4z5aJyWzCW/N2gdu2mevHOF9hiR+m
         +7DR9AxaETUjK6bHw1K7RZiIIyeQ5hnhnAmcYZThJP0j51/3SsGbWVOaaugY97+V7nC8
         0WXpK146F+TL0rFf9d2rFZ64WNJWxREBjnLjryXrNlOEbZQthxrYfjeWTotmz+u2nIGu
         HgkAwUV9zrfYbLjcFm2tLALuIcWZT/A6S7wQhOv/P7XIpM/6ePuj0MIWHh3YW27Is/bY
         TWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794407; x=1735399207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=UbkHPjA6Wm2XGfjboTP2bmEpZz9yWhBNzCDcOdBTuoxjmiGFHpssP1nM5RYhjf0t1H
         uieMu5y7eFOl0r06GBEEv/57uuwwSGvBbAHJuxkQ/VlipLbDgL7Ihdhj0QPHvCoAmin1
         t1h0tzSyOA/Q4seVw4B1+LelpIfkFaLAKW6uUvQWHDE2qnK3v+x3O/01eUexNVHQiOdB
         3T2ZIz2GVHp5vZk/ifGEEWOFQbHAJhnVyksOqR9AUAMAnfEvQJq9HBhQR42QEhQQNAMs
         5w7MRhTNrwlFQl8KIn6iVbwBYnVOUprJtJW1fhFSSOBRsOHLOhX/lCCWtwutL45NH+b0
         5LKA==
X-Forwarded-Encrypted: i=1; AJvYcCWc4M5ZrkupQRiFgIBwtF1NtE6CIsZD+SqTZLFSsCkUGOOjQSdqWddJaQ6QEfbP37bNL3P3hVd+LcUkd3HR16W4@lists.infradead.org
X-Gm-Message-State: AOJu0YztjadZ4slJ/wQbX8zpVI00lSzoPm5mUgUIvYKqs13sQuIiGGfi
	Ucj4TOmZ0TquF/27ch17W3xjVTFJzbQw68VSMwdtN0wocE3wYrHn
X-Gm-Gg: ASbGnctI7RZmTgC9lIpveC3uqLwbwjTyF1nP8kvulTBel4/HrnM7pWGU1qS2T+Z+ctw
	qnpla/sasqGFXH/sCWtFun26Jt21zGyIW9R6YxNBpY4VmDA6MTOPpT+/i9SJOqzphJ4xd5xZDsJ
	4l4d5mXNSsbGK0aJlwoEZ6O3NrnYQCF7Rh73Hv/kLNG3ZhTA5yzUgLbme/0qdAXHLwiYQaIdyrW
	XsV7HNO8TPFwLzYPmP9CwP79wuGNwsfJ2uzCISuS+XQUp+B/PTGtaHsDCUdDwfV8A6gzuT75wsI
	/48aET4kDd3VTLUSO4/qqR/vOeh3lJ2b
X-Google-Smtp-Source: AGHT+IEJc3gycBif+Ud/uhe0S2l+nbHHM3pQ0iNSMQUHkFYUO0h+l+iqpE18cSyQPOqhAA7Ey7zSUw==
X-Received: by 2002:a05:6000:4024:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a223f5d8cmr5927073f8f.45.1734794406720;
        Sat, 21 Dec 2024 07:20:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 21 Dec 2024 17:19:37 +0200
Message-ID: <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_072008_576759_042121A1 
X-CRM114-Status: GOOD (  14.07  )
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

Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
and temp calculations are slightly changed according to the following
logic:

FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))

temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e33001508..8d8ee42ba 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -168,6 +168,7 @@ enum i2c_type_exynos {
 	I2C_TYPE_EXYNOS5,
 	I2C_TYPE_EXYNOS7,
 	I2C_TYPE_EXYNOSAUTOV9,
+	I2C_TYPE_EXYNOS8895,
 };
 
 struct exynos5_i2c {
@@ -240,6 +241,11 @@ static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
 	.hw		= I2C_TYPE_EXYNOSAUTOV9,
 };
 
+static const struct exynos_hsi2c_variant exynos8895_hsi2c_data = {
+	.fifo_depth	= 64,
+	.hw		= I2C_TYPE_EXYNOS8895,
+};
+
 static const struct of_device_id exynos5_i2c_match[] = {
 	{
 		.compatible = "samsung,exynos5-hsi2c",
@@ -256,6 +262,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-hsi2c",
 		.data = &exynosautov9_hsi2c_data
+	}, {
+		.compatible = "samsung,exynos8895-hsi2c",
+		.data = &exynos8895_hsi2c_data
 	}, {},
 };
 MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
@@ -331,6 +340,14 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	 * clk_cycle := TSCLK_L + TSCLK_H
 	 * temp := (CLK_DIV + 1) * (clk_cycle + 2)
 	 *
+	 * In case of HSI2C controllers in Exynos8895
+	 * FPCLK / FI2C =
+	 * (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) +
+	 * 2 * ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
+	 *
+	 * clk_cycle := TSCLK_L + TSCLK_H
+	 * temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
+	 *
 	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
 	 *
 	 * To split SCL clock into low, high periods appropriately, one
@@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	 *
 	 */
 	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
-	temp = clkin / op_clk - 8 - t_ftl_cycle;
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
+	else
+		temp = clkin / op_clk - 8 - t_ftl_cycle;
 	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
 		temp -= t_ftl_cycle;
 	div = temp / 512;
-	clk_cycle = temp / (div + 1) - 2;
+
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		clk_cycle = (temp + ((t_ftl_cycle + 3) % (div + 1)) * 2) /
+			    (div + 1) - 2;
+	else
+		clk_cycle = temp / (div + 1) - 2;
 	if (temp < 4 || div >= 256 || clk_cycle < 2) {
 		dev_err(i2c->dev, "%s clock set-up failed\n",
 			hs_timings ? "HS" : "FS");
@@ -491,6 +516,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 	switch (i2c->variant->hw) {
 	case I2C_TYPE_EXYNOSAUTOV9:
 		fallthrough;
+	case I2C_TYPE_EXYNOS8895:
+		fallthrough;
 	case I2C_TYPE_EXYNOS7:
 		if (int_status & HSI2C_INT_TRANS_DONE) {
 			i2c->trans_done = 1;
-- 
2.43.0


