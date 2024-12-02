Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B292D7831B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/1mPxrL1Y7CTfszE/p7DdZQ6YpQR2r4wgKkulpNFYZ4=; b=Mj0dXto7hEEebDlMb39CtGJh2z
	RVK/kGehpXUr+FwrH6LRwCaJ0ve+LcCgLsiK0I8DgUsWoMQ32u0pwBTD++Djq3Q4vTk2ujeMtifuL
	JOEcCS5RkrzapoC0Z9akxwLsEc5K9fYmbrZiouUAAx1sivXz8ZjLQpJWAMdD3eMhf6owCxGi5/KwJ
	thIdJ1Fpwney4o0ckqZkqvxk9wJIC69vCXyZy6Y95vbsP7G1O7vaAdJky8HtOzPG+H7EE3H9plJFf
	6Z4yGfiZqFY7fbQ25CWQJYL2h0ihngXkj13EO7/Wtet3cVzEbXSSomlEr1sH3QV147XlirH8vVum6
	3i0vK7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Hl-00000006CVd-2cj9;
	Mon, 02 Dec 2024 13:16:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6GA-00000006CGj-3uEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:14:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21572ca3cccso13414775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733145281; x=1733750081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1mPxrL1Y7CTfszE/p7DdZQ6YpQR2r4wgKkulpNFYZ4=;
        b=H5ipbBaoTq3LhY8IlF8z2DT100YssIuAKNR5Kk8P4fJjlbEAQnGyoMPAN5ztXX+SrZ
         SpouHybpNfKZiPrjntr0b4icigr97xYB+ijxycafsdZmscPR713pCySQ1MQJeInQerEs
         S7otADazOlpfalKX7+9z0g6o69tcWQnqOZn7HM0F+6abz0L8LviaTiXkOQXxwh5xiey2
         tHwQTdotTejZ4EO4s6y0Al4vPuS1F4BnD+qYMamEIG0gx1YDkXiI4IzPRtSbbPuFNrrk
         4IVDzT/KZXC7lcIFeX2KrjfTv/nNqD/Dfu5cJp4b6vvbj9VkFKxk2jtiUpc360usZLKZ
         6RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145281; x=1733750081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1mPxrL1Y7CTfszE/p7DdZQ6YpQR2r4wgKkulpNFYZ4=;
        b=SxNXsFsi2BXkio7k195Bke7KQ4LxBTM+Rf/oR22qShChVkRkZbeQtuzulUGTg3z2K0
         4RzwcDGYhBXsOydzMyg+tQpYHousja504UoauuWS78xhtxG2lAn6X1C6WEx5OtasUdkB
         O2p8fu24/e+70AVcoBRxX1TqO1P46ApIBTLhCWLitz0gz6zggm3sQkx73n6OQx/kFzy+
         5TJq+4mwKi4Q6k5BDXkQI4/DtlxtsWFErEz/MwuM/RiI6zEt6/GlljpfSdYE3Orlc+d3
         hBcPRPUOhNj7QmDp92Rb/b96Ayo9FiLCFjJvyubgle4l6+iVcezpaBKkg5PVYIyMKCzw
         fLuA==
X-Forwarded-Encrypted: i=1; AJvYcCUi9K3qq6eESJWe+FAHW4XFAqKEppkQv8NQrmPKw4KQ+LdA/tWxDs6vlgV81RiMxexVAtRKF63/egwnks/dwmEg@lists.infradead.org
X-Gm-Message-State: AOJu0YyaJlBDwbSvCnH0v5+UQpiJlQLG2XJyxzptmWnnGgDf5nrGEo0I
	VNYwWEaeJixxTzBuEN8fk3krQbJTycw7znhYYH93ykf+ANPa1vEw
X-Gm-Gg: ASbGncsJ/R8hyh8d6pmYkul0j988hYzuHFNZyNMFycuzppi66Fqr0pyzsbviqXsVAe9
	XAkE4HyWO2Bm1t+ntYP4ngRDOObv/fdPQ7vyE7tXRkdWGchvtU8YWLTXG/xjEGMNNg8Whwvcl4l
	XIKk177WzZdwK9Don9krCNEVK0Q3TJYBA6yWtHCvW9PHjcLCFzPo84l83DIMvUQFODUETuiMbZF
	H5fiqAo+hMDgOEfFvCjB73Vm6Q6x13jPnOt/b3Kjruov5yljPvc9fskUG8M4A==
X-Google-Smtp-Source: AGHT+IGHvec3b5O/wMNDj0wv/JrLlnI/n0gm1B17WHelsWMiUm7JPRj7siX5XK3LdinbBLvTJUOaPQ==
X-Received: by 2002:a17:902:d50a:b0:215:9642:4d7a with SMTP id d9443c01a7336-21596424f65mr50683835ad.0.1733145281185;
        Mon, 02 Dec 2024 05:14:41 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9b87:b3a5:736:1fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154e5d6965sm50007655ad.71.2024.12.02.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v2] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
Date: Mon,  2 Dec 2024 10:14:23 -0300
Message-Id: <20241202131423.586743-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_051442_967246_A3204D53 
X-CRM114-Status: GOOD (  12.10  )
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

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Update it accordingly to fix several dt-schema warnings:

adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...

imx6qdl-apalis.dtsi is the only in-tree kernel user of this property.

BSD does have a adv7180 driver, so should not be impacted.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
- Resending it as a standalone patch. The dt-bindings and driver
changes have alaready been applied in 6.13-rc1. 
Changes since v1:
- Explained that BSD is not impacted. (Krzysztof)
- Collected Krzysztof' Reviewed-by tag.

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 1c72da417011..dffab5aa8b9c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -691,7 +691,7 @@ &i2c3 {
 
 	adv_7280: adv7280@21 {
 		compatible = "adi,adv7280";
-		adv,force-bt656-4;
+		adi,force-bt656-4;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ipu1_csi0>;
 		reg = <0x21>;
-- 
2.34.1


