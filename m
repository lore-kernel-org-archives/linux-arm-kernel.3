Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A7BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3GEbJiWXV9b1fuX8u/LXLdwA8q1DhCUgWs2zybLksA=; b=L/R3FBZfxIlodRzfaV7hWaLLAf
	Fii0FD2Tn6xB/KkrgBfllLA9VbKf6nXv+HyXgno/Iy7SVXbk1NftTBcklbGp+WPIIJHUahAyS1Yeh
	SKv+Vk5GjUqShLemroAJfACyIt1gQ48z6LsiYAxLU5gZ0v02nM1lfsjep4Jxv359NyGzzEkLipg79
	xXHuVk6ck6eVZlr8m5tGu4w/XcC42hjtwsc/yNFo8SE47bECtqbeUA1ahEjnMjgvkzuLYxZmCq8AG
	IB0k0alHR+1aV/2cYUz940buGgpuQ8NbegLly8+X8DL1K5kPENy7ix1HrpURqjejkDDp5bAHxNdO8
	UKAbSzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K8D-0000000HS7L-1JyM;
	Fri, 25 Apr 2025 14:34:21 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6u-0000000HHQS-0Y5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-301e05b90caso2335623a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587735; x=1746192535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3GEbJiWXV9b1fuX8u/LXLdwA8q1DhCUgWs2zybLksA=;
        b=TMl04DMrPBWYyEKcDaA80199pswwfPuzaVinBCC1PInPGpLXokUY9Rw1+BwoL2BX6l
         okztJbKsw++cBIeInMrDHgJOEV+sMa1n9/mAcT0NsI9Fx1wK3O9QXgwVNdfGnNxCqc5T
         R6JgIkuqMHv7s8Aj3hxqhVSRTnM4SCP85z5P2NE1/CA8gaBQl5p02z4fuPCzAgUUWHUR
         f8DRLUzcdN8cpGVLAUyYa2ArKRU3OnAA44YaFxMDIy9fiezhfKNDRc0groCbjKnoaJ35
         s1N1Vju0CYo9Q7E4o7N5Nd0ynGZlyZNg9TxJzVbzOA+3xwYt15roJ4kWkssjL7O5NxQV
         mcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587735; x=1746192535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3GEbJiWXV9b1fuX8u/LXLdwA8q1DhCUgWs2zybLksA=;
        b=ken7PmjEHAjvg5Ls5YWuh/VB472VGZDpdacDDa9ZyA9JWN6oXE7bVGNOGkWhh4S0El
         sJ7DURnn0aveI7BdyJKAGDglDMzlMOHXu8X5bBRfN1Hb7LPBHpFky8oL37Dl/PrygHUy
         L/QV56eivYZodPdLRqeWnqW30/SmNC/OV1Z6v8uHWquYmlfyJBvztERX2uugRAsg2ONu
         +piEUYwkoW1RNOJAQrIXtdg60jqH8v3lfbff8TdXsxjmqdyvRU1bcdwUFKkE4hkf3sRG
         fv+FrHnKNuoR2A+WVJQI11kgmKEm31BVERP6C6fkD2Wm+TrbLBWGz8SAQNe6frZ8rXjW
         IBaA==
X-Forwarded-Encrypted: i=1; AJvYcCXKsfhtyD7ldQGWTkL8uYQib+2iVT7GWhD02jh34t0s+kbXARQXoWjkTIjFufWy7xr2bdaDJhtat1LblnuOEo/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyusFI4al8EA5uYyxnF72hrz/Vbzq6WnYNxx2VjOEtEE81DZMjF
	7nV+WNR3wmLGEWnWfWe8AqQsoDXXZ+gVLwMuwXCelLdJPw3NubTq
X-Gm-Gg: ASbGnctDSPf9rVzmBg1LyaIwUI93Ob5Un3N/nAEzCsLHxNVugg/qLUgEjSLnkVSSD89
	Az/3XA0RSVFbjpw8Ldt4KsLrYVJFGP8NmGab3uDiErW4vkv0QEAb/tV4NXpmll0bD2KpqvRxmO7
	tQRr3FbepSUjtja+a8mEZmzFbVMkvk0dmkAkbCOWUXSbbsxt2K9G0mCM5naiCJvyow81m8cfKyG
	92MdBJdFyMJPQhWqCz6U5W9e7nP6gFDZFthQzgOtUffR+nYIOgjroevzr2WVXtMVhIoG/e23/db
	IDXZeDQh40y9bzD6ei9TcrX0d05VSHy9Exofwk5NyiMI1WGmTfeKlA==
X-Google-Smtp-Source: AGHT+IHVqQyL9yHnD5wGAhRJP0fI3BxEExGHqelTRbyUpRiHzjzSj3ubBlLL93k+wof+NtwrNid62g==
X-Received: by 2002:a17:90b:57eb:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-309f7da5af5mr3905732a91.6.1745587734998;
        Fri, 25 Apr 2025 06:28:54 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:54 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 08/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exyno5250 smdk5250
Date: Fri, 25 Apr 2025 18:56:28 +0530
Message-ID: <20250425132727.5160-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062856_168584_F7CF1ABD 
X-CRM114-Status: GOOD (  15.42  )
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

The MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Add suspend-to-mem node to regulator core to be enabled or disabled
during system suspend and also support changing the regulator operating
mode during runtime and when the system enter sleep mode (stand by mode).

Regulators which can be turned off during system suspend:
	-LDOn   :       2, 6-8, 10-12, 14-16,
        -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/samsung/exynos5250-smdk5250.dts  | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index d41409019671..866e56915a2a 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -165,6 +165,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -191,6 +195,10 @@ ldo6_reg: LDO6 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
@@ -198,12 +206,20 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
 				regulator-name = "P1.0V_LDO_OUT8";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
@@ -211,18 +227,30 @@ ldo10_reg: LDO10 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo11_reg: LDO11 {
 				regulator-name = "P1.8V_LDO_OUT11";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
 				regulator-name = "P3.0V_LDO_OUT12";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo13_reg: LDO13 {
@@ -235,18 +263,30 @@ ldo14_reg: LDO14 {
 				regulator-name = "P1.8V_LDO_OUT14";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
 				regulator-name = "P1.0V_LDO_OUT15";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
 				regulator-name = "P1.8V_LDO_OUT16";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck1_reg: BUCK1 {
@@ -255,6 +295,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -263,6 +307,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -271,6 +319,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -279,6 +331,10 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
-- 
2.49.0


