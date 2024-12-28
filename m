Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02654E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGkgSa0SQvLDucqBA9QZhIAOHAKfj9lHxmPDg4KGqrA=; b=DASkVX/GTH+xMOEb9SO2wjuVuj
	AUT6ddqF3Pe8TmEffVtEWw4potwS2kUxS/dyPDwHLEneoy6bBKxnHTaKnwOfITWwgDnrNoyri9pZr
	u/k5M93baHiJHXAw6eKHwDWP1SUxuBcYHNZ1cpLz2v+TL18y3PfZ+hlsmCKixUXP4uNhI0KzE7AiJ
	iAJmMFfLmoA48QUYYcICwbfdUlBIKP3BkaFAN8esNq6D2a2pvndeLWpmTZkECqrbEYkHP2FJHpfDr
	mkMJNPeA56MlmsJb/nvomDEUoyS9dEy+e3B4/bOENwNouB8rQkfCwLQC+hhYysitqs4RY5haaJALF
	sbaxVHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUqO-00000001mOT-3mjb;
	Sat, 28 Dec 2024 11:18:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUmv-00000001m0b-36yK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 11:15:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436345cc17bso57137935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384520; x=1735989320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGkgSa0SQvLDucqBA9QZhIAOHAKfj9lHxmPDg4KGqrA=;
        b=mBO46JhAmpTc6maR2wEs6aWkd2CAXm8+O64+5LEsvLW29dI0iN71F2WGpXnGjNziRt
         KVvQwbZaHto/Cl7MXhFJ9iLqfbwzLrSbNbJsfsOaFnaqCgOV/Wwmoa12yNywvoHVHsT7
         DRPG68jLDA3bty3vK0qwjgOYhR9su7HtwmHlIUbSCxKTRN4SOSaynrPrjnuO+cGTcgyH
         F65V6BgrI+mTvfcM6RsHb7J9lYRkxYCK9jUL6boDS1PjQVxet5l2STMLYmOd+a4ZRiHT
         eUxKIQ9WnFOE0UcX1Iy24iyYzyyXL83vAWIBJIsqHpfLLaWWZMaTY1+6V3B137GVVBGM
         ed2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384520; x=1735989320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGkgSa0SQvLDucqBA9QZhIAOHAKfj9lHxmPDg4KGqrA=;
        b=c3FiJ5fMNGcuRF40NtVx95HXy1GA17IuOgHuMkXrqd4vAL4Ie+OqFZmhVADSIlwWns
         60bHeSWpabMJjgF9k+k5Zj3gCR60qGp9gagXVz0hDJhlyiWtaFh+MLViLz8lqR+eSul5
         NXT8m41gQc1qlF+kH0ttifcDetgGxaW6C2+yTYQTXOOjbmbFSr18liUpi8U8ZSsO/M1t
         oikgyRYdPbvnXUCOb1cB4JwHx5KcTE53oM+0la3rvZPngq0DG9JJz33IkDMFPL20W+iO
         aZ5JA0MIsh+BeKtA9eJriKvr1vw3xuLxKK77ygxDmZi6Gk6LxHEZ1sg0f1a/JkFlcuVs
         qyXg==
X-Forwarded-Encrypted: i=1; AJvYcCVf6Hk/PNQp3B2oIXWkgYL5NpaNbgqTvffUDDcSWdI/mObvWF/gAEJAm9xUko8Uxs/Xp3oaVpjbf2GAju351SIN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx38RG63RvfpzHJsms87xvA3BpXNkUHc9jRkOED4WZ4hFFBLrMq
	fpmzchvZejOM6Z96WwLcF4LVT3Aou7mAErtITZxbm4NIQefxirps
X-Gm-Gg: ASbGncttry9P+EozYMmGPHrZLsqTG2Zz96ScVObz4srzUxShdxRMhALU0dK8ehKnUpI
	MEFwh5bHTwFrdsYWRCtGSYHbRffmNg9MF16jyGdoe42ru/bbgSTgq/1JlBwy8q8tdgsm/KZkZAZ
	Qj8046QpU+L1psfVjDvmfa0r7AEKWOAsAlh0lbrWIqO1QGvGEAllhZDYXKfJEbawjrU9MF/C92z
	sq1CrusqfIinh7H3T9mnUBruKybMb/8y4m0a3thiecFRn+Wcl08/RHWTMf9DvjdBjYdUWr6PXN/
	NnpN5Dyw4cSp+VE+WR93PnIqu3dMsxUN
X-Google-Smtp-Source: AGHT+IGonq6ADsghjW9IBuZqhLVqoiM+c2VPos3/y2X87BVvkguYZeN1qm4TOAKkZwV2Z2DmbfJI8A==
X-Received: by 2002:a05:600c:3b23:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-43668b5e194mr216960055e9.25.1735384519730;
        Sat, 28 Dec 2024 03:15:19 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:19 -0800 (PST)
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
Subject: [PATCH v3 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 28 Dec 2024 13:15:09 +0200
Message-ID: <20241228111509.896502-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_031521_783982_4D5D7504 
X-CRM114-Status: GOOD (  14.13  )
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
and temp calculations are slightly different according to the following
logic:

FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))

temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 35 ++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e33001508..6cdd957ea 100644
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
-	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
-		temp -= t_ftl_cycle;
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
+	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
+		temp = clkin / op_clk - 8 - t_ftl_cycle;
+	else
+		temp = clkin / op_clk - 8 - (t_ftl_cycle * 2);
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


