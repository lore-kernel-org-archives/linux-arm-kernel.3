Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE63CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebuVbVY+n9bWscwl4TnisOgr39GSoSEyEkacKsPMKjw=; b=pqvREayObmf5Y/pYiX0/mq7dfJ
	RHjf4WzLQIwMyEA6/SlzQF+j2Vj+SsnczzprMYySYVOJq9eJpTwzGS9Zz/ZebLl1tnA+vpgso3yEr
	pEKqmH+lmVanlf/mb2O1TFImj7hqyNuLn2fB0U4EpiA/kPVWXfdJavKIaktaObZhYNmGARpAG183y
	6Afs2S+mQdKQte6NouF2BeT0o1C8aSHhrSddCY7SBaduLlr0DAfWLPlAbjG9wc1ccbWCtHHK5n/+S
	rs9XDaTw68WFWmegFe5uu+DVdcZJ+jUxH0e3YolqtE+w3u7jvtH47vSWYRFVBzkRebaZtjY3KwZry
	qC4kWD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOxY-0000000GzMA-1xQx;
	Fri, 05 Sep 2025 05:26:04 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOnF-0000000GvSq-3YEJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:15:27 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855FMh33636841;
	Fri, 5 Sep 2025 00:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757049322;
	bh=ebuVbVY+n9bWscwl4TnisOgr39GSoSEyEkacKsPMKjw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cBNGS6Nu33Ack1IJNJ4u3DVbbjzrbch7/aKxQVw3PsWOzljs+qfZlT+hq8AZpwJ70
	 K0JYZLSI4Rd88XMqHQgr3rHYCqdhEHb0z8FBAvYVstnwKQyf/yu7ghb58q/qkeXkp0
	 2f4Sfn2cPGr4W6Wkiyq+BWN/KSk/X0HY/jIdq5Aw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855FMF5653392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 00:15:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:15:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:15:21 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855Ep0h4118818;
	Fri, 5 Sep 2025 00:15:17 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <u-kumar1@ti.com>, <sebin.francis@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
Subject: [PATCH v5 3/4] arm64: dts: ti: k3-pinctrl: Add the remaining macros
Date: Fri, 5 Sep 2025 10:44:47 +0530
Message-ID: <20250905051448.2836237-4-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905051448.2836237-1-a-kaur@ti.com>
References: <20250905051448.2836237-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_221525_982119_CEAC491C 
X-CRM114-Status: GOOD (  11.52  )
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

Add the drive strength, schmitt trigger enable macros to pinctrl file.
Add the missing macros for DeepSleep configuration control referenced
from "Table 14-6172. Description Of The Pad Configuration Register Bits"
in AM625 TRM[0].
Add some DeepSleep macros to provide combinations that can be used
directly in device tree files example PIN_DS_OUTPUT_LOW that
configures pin to be output and also sets its value to 0.

[0] https://www.ti.com/lit/pdf/SPRUJ83

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 47 ++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index c0f09be8d3f9..8ce37ace94c9 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -3,15 +3,20 @@
  * This header provides constants for pinctrl bindings for TI's K3 SoC
  * family.
  *
- * Copyright (C) 2018-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define WKUP_LVL_EN_SHIFT       (7)
+#define WKUP_LVL_POL_SHIFT      (8)
 #define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
+#define DRV_STR_SHIFT           (19)
+#define ISO_OVERRIDE_EN_SHIFT   (22)
+#define ISO_BYPASS_EN_SHIFT     (23)
 #define DEBOUNCE_SHIFT		(11)
 #define FORCE_DS_EN_SHIFT	(15)
 #define DS_EN_SHIFT		(24)
@@ -19,6 +24,7 @@
 #define DS_OUT_VAL_SHIFT	(26)
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
+#define WKUP_EN_SHIFT           (29)
 
 /* Schmitt trigger configuration */
 #define ST_DISABLE		(0 << ST_EN_SHIFT)
@@ -33,6 +39,29 @@
 #define INPUT_EN		(1 << RXACTIVE_SHIFT)
 #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
 
+#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
+#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)
+
+#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+#define DS_PULL_DOWN            (0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+
+#define DS_STATE_EN             (1 << DS_EN_SHIFT)
+#define DS_STATE_DISABLE        (0 << DS_EN_SHIFT)
+
+#define DS_INPUT_EN             (1 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
+#define DS_INPUT_DISABLE        (0 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
+
+#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
+#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
+
+/* Configuration to enable wake-up on pin activity */
+#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
+#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
+#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
+#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
+#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
+#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
+
 /* Only these macros are expected be used directly in device tree files */
 #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
 #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
@@ -53,6 +82,10 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
+
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
@@ -65,6 +98,18 @@
 #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
 #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
+#define PIN_DS_ISO_BYPASS               (1 << ISO_BYPASS_EN_SHIFT)
+#define PIN_DS_ISO_BYPASS_DISABLE       (0 << ISO_BYPASS_EN_SHIFT)
+
+#define PIN_DS_OUTPUT_LOW               (DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
+#define PIN_DS_OUTPUT_HIGH              (DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
+#define PIN_DS_INPUT                    (DS_INPUT_EN | DS_PULL_DISABLE)
+#define PIN_DS_INPUT_PULLUP             (DS_INPUT_EN | DS_PULL_UP)
+#define PIN_DS_INPUT_PULLDOWN           (DS_INPUT_EN | DS_PULL_DOWN)
+
+#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
+#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
+#define PIN_WKUP_EN                     (WKUP_ENABLE | WKUP_ON_EDGE)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
-- 
2.34.1


