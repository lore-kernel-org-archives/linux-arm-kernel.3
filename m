Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226C10ED674
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpgE656MPtmmkK7Bfq7ARKRX8X6igDC84K53JE7z0yM=; b=WdiOH+q9eahghcSgquvv4rdd9M
	/5xJRjkl2BceTe4CIXU5y5cARKpRLpX/m6g+N5QtCoCeOTzv75SI50QnG0EUI8goEsakE0X2dHNOC
	XIm2z14J0Qo9DZ/1F/4qSO0HFVH1J2Nm9n/jV2zlsPPEJT+ilEceGH4sHyXra0wtxgeBGm78szFMQ
	yO1FlG2O8FhXxzLLoF7kFM3soaaaggUmYD4m+KOL1LlRHyeVQQQZDuKDwla1TxQO2IIBCOM+tRCAo
	i1QVNY+a5KZyytZ4ZhEl60lUsJEZMz2M2Fjpvol1poWWTqLyB7wcYMgUxD/QE79nU66q6d9hASoFJ
	sVWKK3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67y7-00000007aB0-20vp;
	Fri, 27 Mar 2026 14:15:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67y5-00000007a9a-2O79
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:15:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a133b686f7so2517284e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1774620919; x=1775225719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpgE656MPtmmkK7Bfq7ARKRX8X6igDC84K53JE7z0yM=;
        b=g3uEt+g1T/nXBXzpSCJjbf2hD+zJpkWlkk3sgz1FbxrEf1hoMXRXFg9rKpbf+tfD3u
         faJdhJHDy0wSyDgOrMk0orowwX604iAxsxoQv1iutiRmxZfLfnpq/rK5VOtQcnfVayO6
         UTDMz8QtSsP1zAZV1t0hU83ZCspLol6HeiI0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620919; x=1775225719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpgE656MPtmmkK7Bfq7ARKRX8X6igDC84K53JE7z0yM=;
        b=U3zDHS87cbHFvX7ghPG7kBh5wBYtF6UNjalFgshexnaLSWzKU7bUE1Gg7HCi2cXX+1
         YHpRf8Ew4DwZfdSYOkQc20hZeVpdWtmikZwHSCbFbPKck7oR/Q+mpIqDuXDfFbJxmO9/
         gctClB0V//e2EGA9pGPwq7En2U2ZY+ysrt3gxMNoQVjeEne0m5Psn755zNICyztL3iWm
         +k+TZJ51UTvMU/wUYkvD7pp625Jmw52NI0A0TEwFfDP+qL7Io3JVc7jj+aGbHofwIN0Y
         1am1rk9raIdoXJC8CZbUueATaU7DWkCytZY2JgVCdo0XSWYL4GD6U7VINKHpc6O+Q+ny
         UaXw==
X-Gm-Message-State: AOJu0Ywt2avT06aCHxtvhlqVxnn5kKP/4gloG3i6k99sgOr651zCK+aG
	VLehUQtoZIbxsOGytaujGXipIV2v8QN5xXXpNkHTjq1YuoI+Q0ef6FPU8PJMx3Z0g8E=
X-Gm-Gg: ATEYQzxa3qsTcF+kUmuPqPjbyR/6rC43rTGYV2bvu5chZPL2AS0HxPQSF9Hlr6jdJne
	lNVoIxzoRXNCtcSevaVwcrHAftGQlEFCwpIvbEdmjEriWBo9pyGFj4S04rA4YJ40aB14loXowly
	ko645I82wZdE7xgYmXPmHyabfjSm/dWYocnV9GhWc2UjcW1YrQ7Ef18dmhjaCL+TIrvUzAT8QqN
	ygGNWWtHBnldK75BvEsCCT/F2pfcB1fSZ9selgn4lQDoodfw8iFOWVW3aJbWqgKYVx+HECjetbt
	07rQFxXTExTkMrUbZlpKW3u4KJjsX5TmkAxhfQC4jjSSFT1S9sMnhWZq49gf0njGLQ0ST96av4i
	vEvzkQ+BLcK2lEgxKFlfk0FpKz2cpj9GyZedxhaKk3JNd+f3Nb+5bp/jJYt1lkTGY1RX9HYPI39
	NE0o2/hw04Smn3o/ksioxOk4qxqwfOvvvfZ8Df
X-Received: by 2002:a05:6512:15a0:b0:59e:1880:2ef7 with SMTP id 2adb3069b0e04-5a2ab7eac3amr855020e87.11.1774620919069;
        Fri, 27 Mar 2026 07:15:19 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064c4a2sm1391746e87.26.2026.03.27.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:15:18 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 1/2] arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
Date: Fri, 27 Mar 2026 15:15:12 +0100
Message-ID: <20260327141513.1250499-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
References: <20260327141513.1250499-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_071521_685752_EA0D3AB2 
X-CRM114-Status: GOOD (  11.73  )
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

Currently, there's a mix of spaces and tabs used for aligning the
bodies of the macros, even within the same block. Use tabs throughout
for consistency.

No functional change; 'git diff -w' produces no output.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 78 ++++++++++++++---------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index dc8e03ae74c8..bdccb153e089 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,15 +8,15 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
-#define WKUP_LVL_EN_SHIFT       (7)
-#define WKUP_LVL_POL_SHIFT      (8)
+#define WKUP_LVL_EN_SHIFT	(7)
+#define WKUP_LVL_POL_SHIFT	(8)
 #define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
-#define DRV_STR_SHIFT           (19)
-#define ISO_OVERRIDE_EN_SHIFT   (22)
-#define ISO_BYPASS_EN_SHIFT     (23)
+#define DRV_STR_SHIFT		(19)
+#define ISO_OVERRIDE_EN_SHIFT	(22)
+#define ISO_BYPASS_EN_SHIFT	(23)
 #define DEBOUNCE_SHIFT		(11)
 #define FORCE_DS_EN_SHIFT	(15)
 #define DS_EN_SHIFT		(24)
@@ -24,7 +24,7 @@
 #define DS_OUT_VAL_SHIFT	(26)
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
-#define WKUP_EN_SHIFT           (29)
+#define WKUP_EN_SHIFT		(29)
 
 /* Schmitt trigger configuration */
 #define ST_DISABLE		(0 << ST_EN_SHIFT)
@@ -39,28 +39,28 @@
 #define INPUT_EN		(1 << RXACTIVE_SHIFT)
 #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
 
-#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
-#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)
+#define DS_PULL_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
+#define DS_PULL_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
 
-#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
-#define DS_PULL_DOWN            (0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+#define DS_PULL_UP		(1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+#define DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
 
-#define DS_STATE_EN             (1 << DS_EN_SHIFT)
-#define DS_STATE_DISABLE        (0 << DS_EN_SHIFT)
+#define DS_STATE_EN		(1 << DS_EN_SHIFT)
+#define DS_STATE_DISABLE	(0 << DS_EN_SHIFT)
 
-#define DS_INPUT_EN             (1 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
-#define DS_INPUT_DISABLE        (0 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
+#define DS_INPUT_EN		(1 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
+#define DS_INPUT_DISABLE	(0 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
 
-#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
-#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
+#define DS_OUT_VALUE_ZERO	(0 << DS_OUT_VAL_SHIFT)
+#define DS_OUT_VALUE_ONE	(1 << DS_OUT_VAL_SHIFT)
 
 /* Configuration to enable wake-up on pin activity */
-#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
-#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
-#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
-#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
-#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
-#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
+#define WKUP_ENABLE		(1 << WKUP_EN_SHIFT)
+#define WKUP_DISABLE		(0 << WKUP_EN_SHIFT)
+#define WKUP_ON_LEVEL		(1 << WKUP_LVL_EN_SHIFT)
+#define WKUP_ON_EDGE		(0 << WKUP_LVL_EN_SHIFT)
+#define WKUP_LEVEL_LOW		(0 << WKUP_LVL_POL_SHIFT)
+#define WKUP_LEVEL_HIGH		(1 << WKUP_LVL_POL_SHIFT)
 
 /* Only these macros are expected be used directly in device tree files */
 #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
@@ -82,14 +82,14 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
-#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
-#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)
-#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_NOMINAL	(0 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_SLOW		(1 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_FAST		(2 << DRV_STR_SHIFT)
 
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
-#define PIN_DS_ISO_OVERRIDE_DISABLE     (0 << ISO_OVERRIDE_EN_SHIFT)
-#define PIN_DS_ISO_OVERRIDE_ENABLE      (1 << ISO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_ISO_OVERRIDE_DISABLE	(0 << ISO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_ISO_OVERRIDE_ENABLE	(1 << ISO_OVERRIDE_EN_SHIFT)
 #define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
 #define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
 #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
@@ -98,18 +98,18 @@
 #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
 #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
-#define PIN_DS_ISO_BYPASS               (1 << ISO_BYPASS_EN_SHIFT)
-#define PIN_DS_ISO_BYPASS_DISABLE       (0 << ISO_BYPASS_EN_SHIFT)
-
-#define PIN_DS_OUTPUT_LOW               (DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
-#define PIN_DS_OUTPUT_HIGH              (DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
-#define PIN_DS_INPUT                    (DS_INPUT_EN | DS_PULL_DISABLE)
-#define PIN_DS_INPUT_PULLUP             (DS_INPUT_EN | DS_PULL_UP)
-#define PIN_DS_INPUT_PULLDOWN           (DS_INPUT_EN | DS_PULL_DOWN)
-
-#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
-#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
-#define PIN_WKUP_EN                     (WKUP_ENABLE | WKUP_ON_EDGE)
+#define PIN_DS_ISO_BYPASS		(1 << ISO_BYPASS_EN_SHIFT)
+#define PIN_DS_ISO_BYPASS_DISABLE	(0 << ISO_BYPASS_EN_SHIFT)
+
+#define PIN_DS_OUTPUT_LOW		(DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
+#define PIN_DS_OUTPUT_HIGH		(DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
+#define PIN_DS_INPUT			(DS_INPUT_EN | DS_PULL_DISABLE)
+#define PIN_DS_INPUT_PULLUP		(DS_INPUT_EN | DS_PULL_UP)
+#define PIN_DS_INPUT_PULLDOWN		(DS_INPUT_EN | DS_PULL_DOWN)
+
+#define PIN_WKUP_EN_LEVEL_LOW		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
+#define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
+#define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
-- 
2.53.0


