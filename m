Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2334C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTJjZNFKvxf2X48trQ54aXuiK4jsr/TThTI5VewmT2A=; b=k0qIAJU/6UbCc/QIsS9aHUtAK8
	KlPoTNA0Ycw2//95cTJgir8aBntM0VnsIVzB9af8j6xKfAa8RGpzaOiZIO21sm9tCj0oBr65eRtG4
	hrvlfv2YbfghzJ8kZ/Aw0m0afmbzoU9TSlO/FAdSkL7RZdnATYybN1+ad6cKsVP19UUgMi9D6yT6t
	rZVL8fCljB2eboeZvrGIJzJ2/bJTcAL2Ejdo4rXyxIGbCDEt6GWBQ4yS9b+gJPxO4kR3Kro7ls6Df
	7WQEgiaogicMJMfflrWcSrgNx8hz2Pnqi+SEg0Nyq37H3Im00m8kcO4m5nyLCprI0VEoenIdf4M87
	xxGFO+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDNC-00000002awJ-2acS;
	Tue, 22 Jul 2025 13:49:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCHF-00000002SMZ-45Ui;
	Tue, 22 Jul 2025 12:39:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-456108bf94bso38690665e9.0;
        Tue, 22 Jul 2025 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187964; x=1753792764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTJjZNFKvxf2X48trQ54aXuiK4jsr/TThTI5VewmT2A=;
        b=DXQp8wmNhIude2kcaIMrB5Pgz619PhFWT8CNLrFVGbgRIy7nlqDmEiIiWaivNiyJHh
         /Xmxdjy9zZ0xcu9FK7qLydHKnuthYoN13CnHHAg8LbboxWzvA/QCA/JWd5xM/Vu/3qRF
         vQnbWGl/B4xmzk4tLALxX56aA2/mE/jkKi+/PiMKWlxa7/n4cN5uMcgK62V9z1MKKbvB
         UK2iFsTPenWFTiL6Am24EIsvWLJm27NgEK0z5HhW1c4Gmw+i0BXhWVvBg+/+pWa+DLA+
         9zyum5L/6AzcLseoiA3+5AXA8cjnmRCGvK0FbXMKXR1b6fbAZf7CNN39MtiBpTvlTYHq
         igVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187964; x=1753792764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTJjZNFKvxf2X48trQ54aXuiK4jsr/TThTI5VewmT2A=;
        b=SFxAG0OD6jg8f39w1DyVxJ8IqDC7T7MU/QvChW0QW5DWXHDDAnYiXR+qsq6n44NAWE
         NuDxKx50Y/R2HIJ5Yc7Q0hkvneEolv/FJ4DdZTq0qvxbYMJAUlhnKLLbgXEakMd79W3D
         U953XirYaY45H1v5LSkQ97JZ6M7Z2XvEVascb7BA8gu+SXmxonGFhv3z5G5UqzLOHUFY
         w9bq5bgzpa1ykWOCGXi4l0yGbfM7OnwvAGx7L/bpXS3usZK/84U2Gs42nYnjwXpZEKhY
         lEnpE8R/lnW3l1np45X41aO27oKy1LAR7NvqMhJEOiry8+YVFp2eYCKQ8XeH2rvvXUwk
         yAuA==
X-Forwarded-Encrypted: i=1; AJvYcCWz13jqxxMGDrytUpMKqHZvV/vlz1h6zJGS6egMMsLUZIzQoWmi4MtNlj1pmcR/yxFdAyN+ZtSjHUGhqWmHrG4U@lists.infradead.org
X-Gm-Message-State: AOJu0YzoIs7UNoxMxruarVA2mD6O40ZpzN1iZbGWLnSl9r0iBOWtS+Ve
	LidmjSNM6ej33HiVDQARjYbzbkGdOnl4fVX6Vh/VAlaJAzHSGbzPpzrZqDhbZisB94ByOQ==
X-Gm-Gg: ASbGncvnPZRt9HdI6J4c1xPp8gPhp7NgNc+nYQWSleTC2TrGRoNnK2xKSQfr6FoaHQp
	q4FPLMX4vDUem6rfWi2qRcxSoTpciVoPzY3zYBFQnMM3NwbV1septpVcfZxnq3JHfri9XnXFB98
	wFodr5I1RtbDyrxS4RLY24vesTJFhCDWBdN7rXIP3Heof0ULzV+zwIzitotKT3OEtS5LYwjEuLK
	g4Y8AkEqfF62/4lA4q219XI2EFdOqSFwoPFlR7feONoXp0ULgatiC1GGPMUsUtbxEemOdXaL2wv
	djShfyCWjpT+1gc9m7FpYKdx/ylkeKovPZExrmM9k0G3RnYxoE4nzNxj8GlPELWrxfkC7UwKJJx
	CHHafHd1sYcr9FeHn0WQsTbaPIFU=
X-Google-Smtp-Source: AGHT+IGQh0CMbN3ZaJ0g9274o7uQo2sPknl/TkV2UzwfFzC3+V14RI3D/pdE7k9iDbjUSsi8NmQ+mw==
X-Received: by 2002:a05:600c:64cc:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4562e3548acmr243184075e9.11.1753187964070;
        Tue, 22 Jul 2025 05:39:24 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:39:23 -0700 (PDT)
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
Subject: [PATCH v2 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Tue, 22 Jul 2025 15:38:14 +0300
Message-ID: <8be36960b5c099d31a52699c555674a5e2908fef.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753179491.git.efectn@protonmail.com>
References: <cover.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053926_012916_1226DBE8 
X-CRM114-Status: GOOD (  15.16  )
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
fan_ctrl_reg when the mcu node is defined with khadas-mcu-v2 compatible.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 drivers/thermal/khadas_mcu_fan.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index d35e5313b..f5c58be4f 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -15,10 +15,13 @@
 #include <linux/thermal.h>
 
 #define MAX_LEVEL 3
+#define MAX_LEVEL_V2 100
 
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
+	if (of_device_is_compatible(mcu->dev->of_node, "khadas,mcu-v2")) {
+		ctx->fan_ctrl_reg = KHADAS_MCU_V2_FAN_CTRL_REG;
+		ctx->max_level = MAX_LEVEL_V2;
+	}
+
 	platform_set_drvdata(pdev, ctx);
 
 	cdev = devm_thermal_of_cooling_device_register(dev->parent,
-- 
2.50.1


