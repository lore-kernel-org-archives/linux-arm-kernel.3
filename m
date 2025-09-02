Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70109CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t+V3rIC4kUf8NGXC8DKjChwyGbywQXM1PSJFpDs4Zs=; b=1WLlsgX+FdsgmDnBnC1UCpm13D
	njTvsQl5m4gjWhdFClEJEuh4ZVE8qxRPaXS//tF+fd7pagcqY7GuFVcxJCRkavMHV9hF6FCV5yPRw
	omWC7NdfvKZHcKFMifcp7dy5FpC5fJNvUHjpP7HnPJ6GwPISMFTmj3h/uQaFCKQTrjbjJc42l+aI8
	ptp+jDvR2P9PBLT53Z/bKYROxqOGA8PPdgNHrcVcaHahz2XfCf/X0OoqNz+YzWeP0o34hQHa++8W2
	Q4zJplsHmUm6DQFaoVs3639z0B+Ik9Bwk3i+ebo27IseQT4olPXQ/E7sqccXT9Ouh1rve2odOhxO8
	MVOdm3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLTY-0000000Fl72-1MDR;
	Tue, 02 Sep 2025 07:30:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLIv-0000000FiIN-0Lj7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:19:47 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5827Jg4J2532686;
	Tue, 2 Sep 2025 02:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756797582;
	bh=7t+V3rIC4kUf8NGXC8DKjChwyGbywQXM1PSJFpDs4Zs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a2vQx0uVqx1UXgu4bbYmLW+wQ/7XS5W5Tm/uxJ6kHnjHhBzzLn+GQd92QRuIMqd+b
	 xHK4829cjcLT67sR7AR32+D10Qgbify2FdUpjUV39cbZac+xNwTSqRyni9nztARkOf
	 jFo3IYzX8aAQUMPgE+/uKhljj/GL9aBL4SANNI2k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5827JgoF2661415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 02:19:42 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 02:19:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 02:19:42 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5827JJgc3689199;
	Tue, 2 Sep 2025 02:19:38 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>
Subject: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining macros
Date: Tue, 2 Sep 2025 12:49:17 +0530
Message-ID: <20250902071917.1616729-4-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902071917.1616729-1-a-kaur@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_001945_228727_E24CFB2B 
X-CRM114-Status: GOOD (  12.44  )
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

Add the drive stregth, schmitt trigger enable macros to pinctrl file.
Add the missing macros for DeepSleep configuration control referenced
from "Table 14-6172. Description Of The Pad Configuration Register Bits"
in AM625 TRM[0].
Add some DeepSleep macros to provide combinations that can be used
directly in device tree files example PIN_DS_OUTPUT_LOW that
configures pin to be output and also sets its value to 0.

[0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 55 +++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index c0f09be8d3f9..39aad59075d1 100644
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
+#define DS_ISO_OVERRIDE_SHIFT   (22)
+#define DS_ISO_BYPASS_EN_SHIFT  (23)
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
@@ -33,6 +39,26 @@
 #define INPUT_EN		(1 << RXACTIVE_SHIFT)
 #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
 
+#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
+#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)
+
+#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+#define DS_PULL_DOWN            (0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
+
+#define DS_INPUT_EN             (1 << DS_OUT_DIS_SHIFT)
+#define DS_INPUT_DISABLE        (0 << DS_OUT_DIS_SHIFT)
+
+#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
+#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
+
+#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
+#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
+#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
+#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
+#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
+
+#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
+
 /* Only these macros are expected be used directly in device tree files */
 #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
 #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
@@ -53,18 +79,41 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)
+#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
+
+#define PIN_SCHMITT_TRIGGER_DISABLE	(0 << ST_EN_SHIFT)
+#define PIN_SCHMITT_TRIGGER_ENABLE	(1 << ST_EN_SHIFT)
+
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
 #define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
-#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
-#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
+#define PIN_DS_OUT_ENABLE		DS_INPUT_DISABLE
+#define PIN_DS_OUT_DISABLE		DS_INPUT_EN
 #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
 #define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
 #define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
 #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
+#define PIN_DS_ISO_BYPASS               (1 << DS_ISO_BYPASS_EN_SHIFT)
+#define PIN_DS_ISO_BYPASS_DISABLE       (0 << DS_ISO_BYPASS_EN_SHIFT)
+
+#define DS_STATE_VAL                    (1 << DS_EN_SHIFT)
+#define ACTIVE_STATE_VAL                (0 << DS_EN_SHIFT)
+
+#define PIN_DS_OUTPUT_LOW               (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
+#define PIN_DS_OUTPUT_HIGH              (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
+#define PIN_DS_INPUT                    (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DISABLE)
+#define PIN_DS_INPUT_PULLUP             (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_UP)
+#define PIN_DS_INPUT_PULLDOWN           (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DOWN)
+
+#define PIN_WKUP_EN_EDGE                (WKUP_ENABLE | WKUP_ON_EDGE)
+#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
+#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
+#define PIN_WKUP_EN                     WKUP_EN_EDGE
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
-- 
2.34.1


