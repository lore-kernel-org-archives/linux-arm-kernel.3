Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8869AC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTxU1W+gue/BWMRsVQK9iOH//Nw2cf3wcu3aMwThOM8=; b=EIGPOf3yJKSKWgIzhptlHw9km9
	YMdcT1zYbB55jjFArm0YuqV57VpbqPjCgOw/zV9NkRlgmkPJlaLYzs8SHlXIEr0tzYCHYKH23Irrj
	SOVTIb/Yyl2DhlMWmQEX07IMmN5E+a5H8Kqse1RnLAUPizhiBoZl4a/KwkoRNLFLOwb0Cs+H/knJG
	q1eRFwo+UzkpLeqOc4VAtrA4e2/p30akw2Le+Q6L3sGSFJTP1XAUkTq/cxk9utWoj1v+Q2rFLD1Kf
	3OR4muriWARxz0cXRveQ7Zb9ykLBEomdXaE2qYf/ylYIAIloo76gc7Ub4wlDjGi3aJRAUpKj22zF4
	A5Ki1lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUO0-00000001sjx-09jg;
	Sun, 23 Mar 2025 23:05:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyg-00000001p8C-1XjE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2c663a3daso769282066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769573; x=1743374373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTxU1W+gue/BWMRsVQK9iOH//Nw2cf3wcu3aMwThOM8=;
        b=donyPolaYIBlUTxscVhwo8Jr/nbrhY9DUQr+eefj5eG/hYvSBdehc/lfXvg7ckRGm2
         qiqtudIaYNpspdOxDcVvtWS6hlJAtFGMTEAcyfdGZETue24M532ILDrxrYkB5WsHlNRl
         I+y38N7afDie+FTvM9/f50nh11iLvhiqr01UIAO3NfNXCIZOIOsiKtFI1h+b4uN1He/a
         ryRyhdDYi4dy/9vbOQmLKEQV2g3QXQV2v4rteqqNRvaTEy/yHebzmyVJjmeSnFPk/u4t
         1PsAp2HGEnitgDk2bOd7EkWT3SdalobIxpm2CuNVEV5V0gbpUam+hdK4NeaB9ZxcF6Gy
         a0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769573; x=1743374373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTxU1W+gue/BWMRsVQK9iOH//Nw2cf3wcu3aMwThOM8=;
        b=CzxI9dafAC5M6zDPa5l79HpvB9OMBEM4S3hT6r4AHldqkbSDFfD/vQiVQrlgHZsdZl
         5aFXQ80wMw3gY47yI2cisQwaSr/xqSb+g3iIeQbiT54VfIB2Q4ydxwitpxOY+/ktH9pP
         F6uKsq8HvY980EcMloIitVkGwSy6zW6A3ayQgMW42P1dLJbQ82IqlOIllpOyzqLNG6NA
         7kfUe3JVJUKTO/b5ZWDoleWxYfA+n/WH/SBPGjj4csw6dln+DDvxnxSvdzkKBI3Cc/8P
         4glugETGeIZrCYITLKzLrYQYvOYuGGpOzCAFXm/Idv7hQJYFPhYBNR6NsvN1b8B01ZWM
         8Qlw==
X-Forwarded-Encrypted: i=1; AJvYcCVo5N/GFscxTgNYHRLaD4YvVaq3pwhvp+LSHgtBlRHV/19sfAJ0UaTWN2r9qd2ARzBkFTcVopVWSi4ZKMyePgEC@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxeaC9ger04UKDO/5/8l7wZm/pHBIUmmweU29vsehny/KbKs1
	YDDKcSKqKd+rdCBYgo8XnytfIxfS2C7cg0MW+S2afLJPaT1omyiTbyc3NlaYeuo=
X-Gm-Gg: ASbGncuiRNJBnTyZws0pkAz4D02qA6ZZx3AT8HwQZW5rrHmdpv5lXycuhE4188xmSex
	Se33u/K8fihDeuCMEbaESe8OYynLWrnwsdeFqn6hU6GI09XaSHKyVz1xWAJTTzj9eWIXU0NxdiW
	COA2eQm4HcjXaLz6rrr71Iz5+zQDtY1B6jiUYBYg8EFxuPjmRpK25tarJucNML7mnoVnWSxypiP
	4Mc2jf8V6TstpB5A8CCnnHfpCmdB1EcP5XRlXYmFn4z3ksUj8yX1fUDNDUBw69bz79+ASjyLXPy
	2ROw+E2raXFl6N2S5vquENwuKmA6Rfch8tvAeOtWfn5PhESREGDws3eOCf9WimVpqz7H9mUX+cZ
	LMg0Z9FgOfvxaHZdYr259p1JP1ITC
X-Google-Smtp-Source: AGHT+IFRwsk7g0/V5N71R/aeNk5DfXRJnWzrEBdlGqW+YmGP+K8r15zEhceKjqCGxIHr3ot1FPPH7A==
X-Received: by 2002:a17:907:96a5:b0:ac3:5c8e:d3f5 with SMTP id a640c23a62f3a-ac3f2238ac9mr1051718066b.27.1742769573042;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:32 +0000
Subject: [PATCH 16/34] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-16-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153934_420035_0D4217C4 
X-CRM114-Status: GOOD (  15.75  )
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, so
that we can ultimately remove the generic regmap config.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index ce1e5af9215a305fbb55157ae4e7bfb9aace86b8..3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -66,6 +66,11 @@ static const struct regmap_config sec_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config s2dos05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s2mpa01_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -120,6 +125,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -158,6 +168,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -176,6 +189,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;

-- 
2.49.0.395.g12beb8f557-goog


