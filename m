Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D450C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=; b=tIQ9wiptql32uMtoaJDdKbm971
	l9tfu/PGy6hQTjVW4BcWZOkgCOiYGLoKNDbnS/hFPa2/XYzoHXizewZnYalK1cSwj4AsJKmz5R4rS
	xMy3lmyN2ABPJ4uP20+sySaJiuuAVW9PoyQ5Q7HARUxiAyTymLiY+VpE0SRTVOIcrvP4Co9HDewX9
	LJCiGsE3QUQxPI3+7K/GWKzgz/5LrENTbzWIiiBW4ZlSHuTN+HvDjJhcxBHtsJiucBlNlQxBwsfnk
	PIl9nA8DKArsOf+YqMUNffPdd5A4kSVceHu4czC6ovzOLiLhArKtsNJOtd4LgAuzexXl0ZecCN87m
	VWPYmUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUPf-00000001sqz-1puG;
	Sun, 23 Mar 2025 23:07:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyh-00000001p8p-0UfS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so567665466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769574; x=1743374374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=WSRtBtHNUgPlT3q6uf32SaXRbAHg+iI08kWazTo+5hq28fj/2XM2XXxIGfpPkD+F0F
         rXdDjza1QjetO5BJiG+Blq7/jCM+/sNzHie27ZRda0gROVPfgkrtw7X9kEI9snXaMMmW
         ZF+s1LPywx9XGDwSDoESWm2vrdar/HsUmiokvaz7fZrEnLeIFL03WSYCUBwZN6kNH5TO
         Up90ktBI2+4I5jDCml0eubRTpu8f8pJKV7826P1j1HjlhVBn1B19iKWzLdMSO0HgIvQ/
         GvzKO7FL8kcjvdK3SXl04Exchqsa7O6Bv/PYnTpCYP32QNQ1EJESOQv18lZ5OdJptf5A
         Nj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769574; x=1743374374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma2h8YcPyNzHzzZtNTsrMSq+4WFWkERbNAUqbwhG/XE=;
        b=uoRrnm9X/j67T0eXsocE0b5OZYCLo4T1Qri5RXfjZPZTCRpOQeKp/SCBeNWBp/tcOh
         cgRGd94H3ATNkzGNxPz5YP1CnzYlXPWLSCYpfZ9JUx+T8VeqCiqJgTsoImDLDBwQrrQJ
         PSnTMUd0VpGFKhp+Y/Krd5C6bbPpiolaZshs5X2nGfCXRw+5vALtasPYDu+XGrY2uYT4
         IRLuCm022AWesGIxLUGL9jCD4TCwO5e4YAyJGjqeHT5+Ydk8XXyTF/VwHTJ55FpErLhc
         lr4GpDl6kIh5MVtOyziTY+onMLxnvIwj+SHRRmquar5M6+CLWXzvGpkPivzwFzeUb6Z/
         Hsfw==
X-Forwarded-Encrypted: i=1; AJvYcCXH3NqfLIGUBWh9+auCmCM0D+unPA4ea24WOTs6pzW2vDF09JHX7Rkda2LnCLAykra98HV8kZxJ0Vjz6jiaz9Av@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8GPx9my2LaO59UyXaVH0C1YU75+4Fd5OuAhwCDkA0ssQto5WG
	CyCZiCEL7fNIcjTJyNM/6UfeuR5mrXlt1+8yM8F36MyqgvAzVxvlJSC9gZEuTMU=
X-Gm-Gg: ASbGncsaehd45ZBu/XnvoOVx9K7GlTwvb13yYSwm8h8790jT58XJRWYIZcuDyLdQJou
	kuEbxhaGRVTUepxCeiQy3dRz65tDhXU5IGWhxFfoLY+FTURYe3SLo5sj9nvNPJV0+a1p/KGGfmY
	4rb6PkhGEDq87yM/stdwaySXB2cCsLrLJPh+pA1lsyurIHDQxfthYFVJ2m7PpX7zb7GES/MvGR3
	Ww63qULFQTSvlUQ5OB2FQOS/n0tiAqWVVkDxOl+A8aF5gdbSSHKH1JlFM8Kts3/xVCqnuZ1xKOT
	NX1PZDZTrVdknXSNNiX/VarLd2c4UNje+3a6Sx90M3uWBlcz+EILR5E+FPMKuLVBfLt9x4emyyZ
	gATZVGkV1Pxn4nRHEu8MamaUqQHgO
X-Google-Smtp-Source: AGHT+IEAdjv9xEbMYB+Oz8xJ1E35q2wdeD2HNBvV+6r3g5vXOlzMcwWya0yXpD0Ui6X7vYMMVnjHVw==
X-Received: by 2002:a17:907:d91:b0:ac2:a4c2:604f with SMTP id a640c23a62f3a-ac3f24a7838mr974893166b.46.1742769573704;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:33 +0000
Subject: [PATCH 17/34] mfd: sec: drop generic regmap config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-17-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153935_167201_44EB0288 
X-CRM114-Status: GOOD (  13.30  )
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

Subsequently, the accidental new users have been updated, so
sec_regmap_config is an orphan again, and can and should be removed
from the code. Doing so will also ensure future additions to support
new devices in this driver don't forget to add a regmap config.

Drop this fallback regmap config.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d..1bdd6ea36fcd9f56ea5ec1159a87723f4c09a0bd 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -61,11 +61,6 @@ static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config sec_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static const struct regmap_config s2dos05_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -196,8 +191,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 		regmap = &s5m8767_regmap_config;
 		break;
 	default:
-		regmap = &sec_regmap_config;
-		break;
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     device_type);
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);

-- 
2.49.0.395.g12beb8f557-goog


