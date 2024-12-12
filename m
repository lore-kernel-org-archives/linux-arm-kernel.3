Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED27E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeCo6voBzfvsd9B5AKf1XLFT78VWFwo447c6e8aMI7g=; b=mDrWm0SFMkiaxRWUSlRCta+dqj
	yJHJQPSXtq9EVeUnJiTQvU1B5Q12+Kg+sYCuehffb22Sd4kG19UV9fHBec25ncbOLoDzRILf8YzxU
	j8bAWQ++izhi5Sh3LDcKQqNz5Spr25mSCu6EUKlziffwst8x9umm2EClxxQnW6kTLTsagvQqvoS7U
	78MreYnOP5hsUYErw6khWzbTbJM/GfW7bx+EfhAL3Ne5ITRDGE8GWLTj0cGjsY3azFCC0gAn2K/lA
	fAKLj+XiZpVmEY0oA7LGhf5+wQsSCb3mqoPsKXkVHYJIOP/+KKcX8s9zWRmI8Y4+pDUh2Y9Ixbk1A
	wH1prq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjNz-00000000VNK-2dy9;
	Thu, 12 Dec 2024 13:37:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjKw-00000000Uku-3ABc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 13:34:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21654fdd5daso5129795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734010478; x=1734615278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeCo6voBzfvsd9B5AKf1XLFT78VWFwo447c6e8aMI7g=;
        b=bUITe07VhOT6x71uPoofSO+F2NAPcEc+b3RNkbE67SKAYf8uer1AWXiD57EwVP+iPp
         imwoPLI53g0H5rqZDD0k0/pUapjhI/6HoNgMHSMCTjpE8c8LmXZLPpQfF9/4UcsSyiFy
         bcxyY6Xz4EHB0MuV9QX4DkN3F0c4Q9GDNAICliY5e/+UQHION5tbjVLZiMtZzi/vMmLl
         hUubt2+KSP2TeE38ZK4cbRF+oaspdybHmN9V2wyEKs/qdtlIUeNeNSW6uyW1iLblLdL2
         qEhtJzIFHMoKiy6a03imPTtiHJfWmqHloX7FXE1fNhdP7igHgfGuTOXaPe/k0zmgw3/V
         SRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010478; x=1734615278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeCo6voBzfvsd9B5AKf1XLFT78VWFwo447c6e8aMI7g=;
        b=FEgKPjvYxXAvoWEVhj7E6SxsSKd86xzt1vnqZ2TbtxcM2CMvs4K/CLOAMXU2jJDsqE
         Ak5DVxZ+tv1GZ0FjnJlKCqzeEaDdibF/GH27fAqMut2Z42ysMmy7Z5HZqYizXUD03tyL
         qMYBdGIzD20FW9+k71XPKBXYqJizRGH4fLbjcNcoKPChQkqJoN1rVLglm1ghKMTzOTPF
         GelSOimqmn1ndTh4VyLEmBWmsRy3f9UO7INsKkqCUVYlvZB/po4Cr1psb3sgsV7+/bKM
         j7o4+r7RD+IK7weWm1aCZo+KeF92OiSGSYZplmuwzpBRAIXJPCLflxOA2ChpUrSb0zae
         uXKw==
X-Forwarded-Encrypted: i=1; AJvYcCVYozUdhgBaIII2rdL4BAG/00eXBqw6DMS9PrkkdqQ8JfTXDWKvc6gwqzADUVczYV+6bMgI0uFzKFNYo6rASCdj@lists.infradead.org
X-Gm-Message-State: AOJu0YxJgDUypMrw0P+aoYDuJ/Chn6NW6yCf4+IRP4NAInu42j0v+tWr
	djc0XpcVKyWlRDaJT/JnaH8kKKzhOV0V4aBw0n7FJpi6ZGT4npQq
X-Gm-Gg: ASbGnctLMsqZh2v1uGWy5uFLPBCzmiKxAUR3g0dyUhZGmVB5phoArjeCjVYuyxwgVA1
	4wQKOLf9OOgXVvwYraKXLImaCr/Dfjp8wZ0NcVSpECu7QRMK2q7Of1vmpNzbvZoUf+zOu0EeW6F
	DQUUG2UjXSYmZ4QItppqMf7Z6BVmV2xJ4HbS656YXRQdOSl1HmMBKuQFk5qGUG2reUwTwLq9z62
	nEGDBtO6TUGvdSJ5Krl7S68CGX5vlsvdup5TVCSV57VbtqWubO/mKdSl3l5mpvkCLZm859s/khm
	cwHFU5dZahQDFY6bX2LxJx+9I6c9wrSz2p86xj8OgZyHTBHd9UXTDSGmQwTbhX2ghvyxAoG19K0
	TYOmt
X-Google-Smtp-Source: AGHT+IEz+JRhCfmuLuRPQjfAY6LvHPw+8lus0bkpzmOra75yYYsCHcZ2q2Oh1JNu4NCSZCdVZ0hghg==
X-Received: by 2002:a17:902:c947:b0:215:b75f:a1cb with SMTP id d9443c01a7336-2178ae4d3c3mr55231155ad.9.1734010476166;
        Thu, 12 Dec 2024 05:34:36 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2163562a838sm83390165ad.29.2024.12.12.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:34:35 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz,
	amithash@meta.com
Cc: Jerry.Lin@quantatw.com,
	yang.chen@quantatw.com
Subject: [PATCH v1 2/4] ARM: dts: aspeed: minerva: add i/o expanders on each FCB
Date: Thu, 12 Dec 2024 21:32:24 +0800
Message-Id: <20241212133226.342937-3-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053438_792856_C3EFB79D 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Add four I/O expanders on each i2c of fan control board (FCB), assign the
GPIO line name to each GPIO in use, and specify the interrupt GPIO number
for each FCB's i/o expander.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 456 ++++++++++++++++++
 1 file changed, 456 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 426e249c3326..9cd225ae96cb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -342,6 +342,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <218 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN1_PWRGD_R", "P48V_FAN2_PWRGD_R",
+				"P48V_FAN3_PWRGD_R", "P48V_FAN4_PWRGD_R",
+				"FCB_1_P48V_ZONE0_PWRGD_R", "FCB_1_P48V_ZONE1_PWRGD_R",
+				"FCB_1_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <218 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN1_ALERT_N", "INA238_FAN2_ALERT_N",
+				"INA238_FAN3_ALERT_N", "INA238_FAN4_ALERT_N",
+				"FCB_1_TMP75_ALERT_N", "",
+				"", "",
+				"FAN1_PRSNT", "FAN2_PRSNT",
+				"FAN3_PRSNT", "FAN4_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <218 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN1_IL_TACH_ALERT", "FAN1_OL_TACH_ALERT",
+				"FAN2_IL_TACH_ALERT", "FAN2_OL_TACH_ALERT",
+				"FAN3_IL_TACH_ALERT", "FAN3_OL_TACH_ALERT",
+				"FAN4_IL_TACH_ALERT", "FAN4_IL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <218 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_1_P1V0_POWER_FAIL", "FCB_1_P1V8_POWER_FAIL",
+				"FCB_1_P48V_ZONE0_POWER_FAIL", "FAN1_POWER_FAIL",
+				"FAN2_POWER_FAIL", "FAN3_POWER_FAIL",
+				"FAN4_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 		// FCB 2
 		imux17: i2c@0 {
@@ -389,6 +465,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <220 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN5_PWRGD_R", "P48V_FAN6_PWRGD_R",
+				"P48V_FAN7_PWRGD_R", "P48V_FAN8_PWRGD_R",
+				"FCB_2_P48V_ZONE0_PWRGD_R", "FCB_2_P48V_ZONE1_PWRGD_R",
+				"FCB_2_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <220 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN5_ALERT_N", "INA238_FAN6_ALERT_N",
+				"INA238_FAN7_ALERT_N", "INA238_FAN8_ALERT_N",
+				"FCB_2_TMP75_ALERT_N", "",
+				"", "",
+				"FAN5_PRSNT", "FAN6_PRSNT",
+				"FAN7_PRSNT", "FAN8_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <220 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN5_IL_TACH_ALERT", "FAN5_OL_TACH_ALERT",
+				"FAN6_IL_TACH_ALERT", "FAN6_OL_TACH_ALERT",
+				"FAN7_IL_TACH_ALERT", "FAN7_OL_TACH_ALERT",
+				"FAN8_IL_TACH_ALERT", "FAN8_IL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <220 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_2_P1V0_POWER_FAIL", "FCB_2_P1V8_POWER_FAIL",
+				"FCB_2_P48V_ZONE0_POWER_FAIL", "FAN5_POWER_FAIL",
+				"FAN6_POWER_FAIL", "FAN7_POWER_FAIL",
+				"FAN8_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 		// FCB 3
 		imux18: i2c@3 {
@@ -436,6 +588,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <230 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN9_PWRGD_R", "P48V_FAN10_PWRGD_R",
+				"P48V_FAN11_PWRGD_R", "P48V_FAN12_PWRGD_R",
+				"FCB_3_P48V_ZONE0_PWRGD_R", "FCB_3_P48V_ZONE1_PWRGD_R",
+				"FCB_3_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <230 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN9_ALERT_N", "INA238_FAN10_ALERT_N",
+				"INA238_FAN11_ALERT_N", "INA238_FAN12_ALERT_N",
+				"FCB_3_TMP75_ALERT_N", "",
+				"", "",
+				"FAN9_PRSNT", "FAN10_PRSNT",
+				"FAN11_PRSNT", "FAN12_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <230 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN9_IL_TACH_ALERT", "FAN9_OL_TACH_ALERT",
+				"FAN10_IL_TACH_ALERT", "FAN10_OL_TACH_ALERT",
+				"FAN11_IL_TACH_ALERT", "FAN11_OL_TACH_ALERT",
+				"FAN12_IL_TACH_ALERT", "FAN12_IL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <230 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_3_P1V0_POWER_FAIL", "FCB_3_P1V8_POWER_FAIL",
+				"FCB_3_P48V_ZONE0_POWER_FAIL", "FAN9_POWER_FAIL",
+				"FAN10_POWER_FAIL", "FAN11_POWER_FAIL",
+				"FAN12_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 		// FCB 4
 		imux19: i2c@2 {
@@ -483,6 +711,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <232 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN13_PWRGD_R", "P48V_FAN14_PWRGD_R",
+				"P48V_FAN15_PWRGD_R", "P48V_FAN16_PWRGD_R",
+				"FCB_4_P48V_ZONE0_PWRGD_R", "FCB_4_P48V_ZONE1_PWRGD_R",
+				"FCB_4_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <232 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN13_ALERT_N", "INA238_FAN14_ALERT_N",
+				"INA238_FAN15_ALERT_N", "INA238_FAN16_ALERT_N",
+				"FCB_4_TMP75_ALERT_N", "",
+				"", "",
+				"FAN13_PRSNT", "FAN14_PRSNT",
+				"FAN15_PRSNT", "FAN16_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <232 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN13_IL_TACH_ALERT", "FAN13_OL_TACH_ALERT",
+				"FAN14_IL_TACH_ALERT", "FAN14_OL_TACH_ALERT",
+				"FAN15_IL_TACH_ALERT", "FAN15_OL_TACH_ALERT",
+				"FAN16_IL_TACH_ALERT", "FAN16_IL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <232 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_4_P1V0_POWER_FAIL", "FCB_4_P1V8_POWER_FAIL",
+				"FCB_4_P48V_ZONE0_POWER_FAIL", "FAN13_POWER_FAIL",
+				"FAN14_POWER_FAIL", "FAN15_POWER_FAIL",
+				"FAN16_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 		// FCB 5
 		imux20: i2c@4 {
@@ -529,6 +833,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <254 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN20_PWRGD_R", "P48V_FAN19_PWRGD_R",
+				"P48V_FAN18_PWRGD_R", "P48V_FAN17_PWRGD_R",
+				"FCB_5_P48V_ZONE0_PWRGD_R", "FCB_5_P48V_ZONE1_PWRGD_R",
+				"FCB_5_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <254 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN20_ALERT_N", "INA238_FAN19_ALERT_N",
+				"INA238_FAN18_ALERT_N", "INA238_FAN17_ALERT_N",
+				"FCB_5_TMP75_ALERT_N", "",
+				"", "",
+				"FAN20_PRSNT", "FAN19_PRSNT",
+				"FAN18_PRSNT", "FAN17_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <254 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN20_IL_TACH_ALERT", "FAN20_OL_TACH_ALERT",
+				"FAN19_IL_TACH_ALERT", "FAN19_OL_TACH_ALERT",
+				"FAN18_IL_TACH_ALERT", "FAN18_OL_TACH_ALERT",
+				"FAN17_IL_TACH_ALERT", "FAN17_OL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <254 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_5_P1V0_POWER_FAIL", "FCB_5_P1V8_POWER_FAIL",
+				"FCB_5_P48V_ZONE0_POWER_FAIL", "FAN20_POWER_FAIL",
+				"FAN19_POWER_FAIL", "FAN18_POWER_FAIL",
+				"FAN17_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 		// FCB 6
 		imux21: i2c@5 {
@@ -575,6 +955,82 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			gpio@11 {
+				compatible = "nxp,pca9555";
+				reg = <0x11>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <252 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"P48V_FAN24_PWRGD_R", "P48V_FAN23_PWRGD_R",
+				"P48V_FAN22_PWRGD_R", "P48V_FAN21_PWRGD_R",
+				"FCB_6_P48V_ZONE0_PWRGD_R", "FCB_6_P48V_ZONE1_PWRGD_R",
+				"FCB_6_PWRGD_P3V3_R", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@12 {
+				compatible = "nxp,pca9555";
+				reg = <0x12>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <252 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"INA238_FAN24_ALERT_N", "INA238_FAN23_ALERT_N",
+				"INA238_FAN22_ALERT_N", "INA238_FAN21_ALERT_N",
+				"FCB_6_TMP75_ALERT_N", "",
+				"", "",
+				"FAN24_PRSNT", "FAN23_PRSNT",
+				"FAN22_PRSNT", "FAN21_PRSNT",
+				"", "",
+				"", "";
+			};
+
+			gpio@13 {
+				compatible = "nxp,pca9555";
+				reg = <0x13>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <252 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FAN24_IL_TACH_ALERT", "FAN24_OL_TACH_ALERT",
+				"FAN23_IL_TACH_ALERT", "FAN23_OL_TACH_ALERT",
+				"FAN22_IL_TACH_ALERT", "FAN22_OL_TACH_ALERT",
+				"FAN21_IL_TACH_ALERT", "FAN21_OL_TACH_ALERT",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
+
+			gpio@17 {
+				compatible = "nxp,pca9555";
+				reg = <0x17>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <252 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+				"FCB_6_P1V0_POWER_FAIL", "FCB_6_P1V8_POWER_FAIL",
+				"FCB_6_P48V_ZONE0_POWER_FAIL", "FAN24_POWER_FAIL",
+				"FAN23_POWER_FAIL", "FAN22_POWER_FAIL",
+				"FAN21_POWER_FAIL", "",
+				"", "",
+				"", "",
+				"", "",
+				"", "";
+			};
 		};
 
 		imux22: i2c@6 {
-- 
2.34.1


