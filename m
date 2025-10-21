Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C83CCD1AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9adNp0vIB1m6cHMOI8TscYP77iYGGA2dR4MofxfiQU=; b=kwlxu9f+RHGRlTxEIN1zqt1gc7
	tn3PgTpA0I1bnMYRvnxqFspDnnwr3v04QaE9lWWPavXGWpTIwEAmDztqg8UQ/hhLvNTCvE0CakeLv
	uH9eI5pM6sGgyJB2mhM54urSFGkRrf9IZNH3AQmKCp4CaWIXxcjHf9oO3VR92DTYuBiTRjlLo4fUG
	tLOZey2hM2tYajbz6hcS10XuBEGXQXTIfmD3baXU4vYuqKCgXblgtrLDN1wFMRMBTUKQcY0daUKmo
	PGAsfrVEM2+nneudE684ow9PuuIGrJdS9VUrb6fk9Y5uxA2Ix01d/8AofBtw2+tHIN2bFY1XU0ZIL
	A9InX2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECk-0000000HU9c-2vq0;
	Tue, 21 Oct 2025 15:23:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECf-0000000HU1x-3kMb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:15 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b54f55a290cso870082966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060192; x=1761664992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9adNp0vIB1m6cHMOI8TscYP77iYGGA2dR4MofxfiQU=;
        b=RxFlo6mdqmpX/RZILVqCz31VzTpcJBbfFrLlRUSRs4pSby3s6RMOZojoVuuxy+1xxf
         ROUpB+sIP+gtwVaXz4hsUU0aFvbL6I/OVsb+3APN37oy2pJUKIwDY3UGoxoDjZg4T3YB
         VfIRC4nMZA+HZAQfU2fkGKt9trOginJc/HVc4jRQ8UYbcRiiqLLwTS2TZgE6fzX6vW4v
         7uGtWMy4eEnGLjHj9bNH8ZUEzIKPKgNaR2kXfJhoqKAq4m47BCOPWIl3UEY2egm3kufi
         HKVN65HYrx9IeeoIWrSytckTaqtn3GBO1XI3F1u3fJ1PmEe9Ls+FTkwIRtoF3WSQH+xX
         wpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060192; x=1761664992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9adNp0vIB1m6cHMOI8TscYP77iYGGA2dR4MofxfiQU=;
        b=uGNfLnnkBr9GPNZPfMBhGQw/fPZ/enwD5doc0q1HaXmBDzAAfJOYizUvGv5FsSnmvy
         YsGWLGSobq/lv7Ajlv5Tpnj8+wTkTd7+6IrpZzqF5bg+CtOrYrIsdLeBI2eLpLuD8gC0
         f2t+Wav+2/zajqhswYOVKfhhRsd5x7Gs/CzQXJn9PlOs2eBWo3etYnU/XneoJ2EJ6pD/
         6WC4T0e9t/knhmkrYY88RxPs+bd4HYfqOsjDrH55r/g+m/7JwjPyKEiGgA+nQUie6owJ
         ofVIz9j7c8W+M49LYU1rUgI/WVWLcGr4cUDhex7m4/LPLiV1PQuFE4r3lDVtvgv04Png
         pgpg==
X-Forwarded-Encrypted: i=1; AJvYcCWLuJC826cxXQl37Dwh9pATGd7/ccLAitsrQvkdWj9aRq+srdYsaS+o7mCfsAlvEPmQNrs1kH8cSW4Q7O6Z1c4C@lists.infradead.org
X-Gm-Message-State: AOJu0Yyore3luKeNAOBQvNp3j+n8jYy0KTnn08ftSRFh6piuyGVqjJ0u
	UXvqgNPqTlUdfIFP1LIx4Yv/OyjcpQuTwbJQIdLqpUSOGdxzoJPkO6so
X-Gm-Gg: ASbGncvhu6eNm9qPY3HWI72AZAA3RZx7Ov6OQoQi/2CeFtIOXqTq7RXa1oCAmkDnQUW
	ko/1JdnPR3IuBynwDFSaU9sqMUQGeLbSIA9tlV3G6ie8JtFio44rSzHW3ofgjUri/fht9n3+0kZ
	8cVAL4InZTqe0Au31eaIkxU1r8VsiZxzliWqhJ0BdCVNYzbR1brpZUuHslm8VhdIK3xIoukbK/C
	RARp/6fsy7mgqNRlyLA40OiBvClFcjVYtj2SUTneo9XpkybAKaErdWZ9O/QYte/D6/ELPOCuQuZ
	wXsjc5mQc80akut4gp6yaGmZnX1MiAjQDMS3tr+ivAcQesr145FUsx2LHQ1wPK5VW48eS5tVzlg
	lzTj/imLhdQXmOAFHNzGV2ZsMsbmDdPAHFNVUc3b72i98Bbv2D6JbXjdst74bdReC9vTykacnnt
	DyuFAa/uuoW1jgg9dXlmXdWiGkj9c5JBInb8RE2w==
X-Google-Smtp-Source: AGHT+IHurBcs/BvjTvbOQhGO+EbHIilgUbXuYs+sCrM7j/eTqSvavNvGUlTAR8coiGhQ9kPUDFiU+Q==
X-Received: by 2002:a17:907:3daa:b0:b34:985c:a503 with SMTP id a640c23a62f3a-b6474b36a19mr1999860966b.35.1761060191871;
        Tue, 21 Oct 2025 08:23:11 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:11 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Tue, 21 Oct 2025 17:22:44 +0200
Message-ID: <68fbedccd22459c3fb5bff8a41c485075799a111.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <cover.1761059314.git.efectn@protonmail.com>
References: <cover.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082313_947924_18C9A0B8 
X-CRM114-Status: GOOD (  16.57  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
using percentage values from 0 to 100, whereas there are only 3 constant
steps in previous Khadas boards. Therefore, i adjusted max_level and
fan_ctrl_reg when the mcu node is defined with khadas,mcu-edge2 compatible.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/thermal/khadas_mcu_fan.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313bea41..e3ac4fb6d1f82 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -15,10 +15,13 @@
 #include <linux/thermal.h>
 
 #define MAX_LEVEL 3
+#define MAX_LEVEL_EDGE2 100
 
 struct khadas_mcu_fan_ctx {
 	struct khadas_mcu *mcu;
 	unsigned int level;
+	unsigned int max_level;
+	unsigned int fan_ctrl_reg;
 	struct thermal_cooling_device *cdev;
 };
 
@@ -26,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 				    unsigned int level)
 {
 	int ret;
-
-	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	ret = regmap_write(ctx->mcu->regmap, ctx->fan_ctrl_reg,
 			   level);
 	if (ret)
 		return ret;
@@ -40,7 +42,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
 static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
 					unsigned long *state)
 {
-	*state = MAX_LEVEL;
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	*state = ctx->max_level;
 
 	return 0;
 }
@@ -61,7 +65,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
 {
 	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
 
-	if (state > MAX_LEVEL)
+	if (state > ctx->max_level)
 		return -EINVAL;
 
 	if (state == ctx->level)
@@ -88,6 +92,14 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 	ctx->mcu = mcu;
+	ctx->max_level = MAX_LEVEL;
+	ctx->fan_ctrl_reg = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
+
+	if (of_device_is_compatible(mcu->dev->of_node, "khadas,mcu-edge2")) {
+		ctx->fan_ctrl_reg = KHADAS_MCU_EDGE2_FAN_CTRL_REG;
+		ctx->max_level = MAX_LEVEL_EDGE2;
+	}
+
 	platform_set_drvdata(pdev, ctx);
 
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
-- 
2.51.1.dirty


