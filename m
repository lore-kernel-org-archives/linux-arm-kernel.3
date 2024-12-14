Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3432E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=; b=oHMw9Wk1C34rMJE523mOjOQQs2
	YliYirqa+uTYv1plgeuaPqqVE1yj0qOnHnWlg39X7Dt0keLESGWGHbylNEJeJydgcBcHc83/kPxdl
	Yj/cMoEP9NLnqghbG64MK5iNy3kh+kZBQQp7HYGmzMgXq0BdTv2ZzHbDHEMtWlXnOt8ui8ciNW24T
	LjlQgkwQZ/n2uUOyDUz5DzMrt3ZAHFI8ByzMQ1XTDITItfI4tCC7Ga8FTUpaAbZC9Cdtw0QJKycz1
	xq0F4tAdFh1uddeLxeW+zbywllVxpvKtJrkuDRXmmR2mUquiZgVaCNZ3f0loiT8O/ooMAcD82eqRN
	SyBgQECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaJ3-000000071oJ-1gZP;
	Sat, 14 Dec 2024 22:08:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaFr-000000071Mh-35s2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:04:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43624b2d453so33259655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213894; x=1734818694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=kMJQ1j7dLkPCvIUOMLk2bwamkQomX0kkDeF4l4uHWndj4QfprSpCtPV14FVKnx4vdS
         DLqsb4ZD+qCsYRA6aCMYAOStCL3ENLh4utD2YXmSnPkpnV/pXnDw3EdYxo7xBhsm8bOI
         BHf4/8W8skq2G8mSFi0+6nEQHOVB0JLCHH96xzYG9ZAPjNrsyP/yChZu74uqqYuS+l1c
         /5EWoXqVjlut0mR6I3gv/YumZA7o8a3+Ti7nvBpD1RN2/dU54Hva7pCgWEMmifN1UQN8
         scy7pltVRH98AfifZbsuB0rg8Ruyep3g/9w086Fb/xkO+TvhBK7UEziNYYHMrO6Nzrun
         s3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213894; x=1734818694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=GvlvTtV6oQ3n7LpqTl5nbQWfVFZawaBWaAVZ+4MTAb+BCt0x1etxCKQysdAsaOQNAc
         yowx/9WVvkzSDoogXYCgstcqPcGCOtVCZKvoqsgTQkmJBBcAhrASrcb/6HJbE43QNYMI
         hqm782uEUNcn1fQQtZuKPWRVC+aV5jjX0YcUxUhtS3lMa9HEW1St4hAA26xTQ+YuAbFo
         Jxvu3O+uVZBMGxHOMVZfQRxsCjkj4xM3Sd4+WuPk0DrLjOkpxx4Q6/0FKfewhKqAtg02
         4gdCpZWHczsE3QkL203QC3s1MzfdmlP811tTFOeIcO6YP/g1PNhgCUXHy7VgyDg1aXgg
         5DTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQn6pUlNGQiv09f5K7cRKDUYtbx3o2kcS6UoQYl4rlQU8i1UbGGyDZuUyQKrEtzau+YbpRKwe8ATTyXBbojxnD@lists.infradead.org
X-Gm-Message-State: AOJu0YwC6lJ6qvP0pjlI8tAMhovaMU4Cj/mpD/ulKyhkuc4h5Jo7D2NP
	GIdBMhwiIJT+a78tXX8JA3v08LT7zDKpkoe1dkMiPf9qxkj37CO1
X-Gm-Gg: ASbGncuUM0oCHMoav9mZiHu7sn+L1jR9u2OEVdEW4VqWnq9ZrKVCNtXbw5MJ7UfEB3d
	Ylx0nbu0Ln9zgGgtYF0IuwEUh0jNjmgWdXSS1CnLZ1FLCIr+2FPkNNVLQZeefGo6iiRPGSHzSp7
	sN2SQFtTHTfw+BnkzEGZfZHOy6Ik/tlWNGnF30o/4tIbviL1gQR/1PVrOr8eF6E9/0OWRr0JDgM
	IUvpgs4uqJWANQfJLyZ1DxXgEtdjxpB6jNIDDI4rQfLEaE1rAfhKACpC8Bje3+bKzekead0G2Zi
	x5Q7RuWyPGScq5VRXnUEiSHTnUpV4b6G
X-Google-Smtp-Source: AGHT+IEJf/jNx97cvTTMZFhhseIjKNYBkj9n/qe14LMzuQtZhbLL0XfC66ydjc5C+zTjGUfOFA4Xbg==
X-Received: by 2002:a05:600c:1da4:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-4362aa509abmr72449325e9.17.1734213893779;
        Sat, 14 Dec 2024 14:04:53 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:53 -0800 (PST)
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
Subject: [PATCH v1 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sun, 15 Dec 2024 00:04:19 +0200
Message-ID: <20241214220419.723100-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_140455_793947_7AA96088 
X-CRM114-Status: GOOD (  13.88  )
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


