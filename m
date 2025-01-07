Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cV4oC9+EL8srSyzO8Y7L+t+TVZRrKU1b9fLi0ltBXl4=; b=TaBPfoc4qXMeFO40/hQuXX/fX1
	co9Mc2qv/0qBJuxODHDGxKDeU1kLZF/no/kb2xT/njZ7rd6s4Qy0J6ZFFMBzOW5MbBPeQguQm+rvT
	QguutV6l1MHYFRHdC75YPv6QCjbivtCI/TSIGQ7TdL/SXYBpBdxtnzKrTevmLDGDuvTEu/q+mc63k
	dD6spKr7GYxX2UKUFLA3H716lNhHCc5pYq/PvO7sCBYI5neyYYQ+EhJwo3hbP8crnrD/z1lgQ0yRj
	zQt3xF3Hg6zq2UiEDMsxWYczcDtPrgUBymu+x7mkjjet/SkzRCBSXfJKRyeWRCw82OAoAXSNVtefo
	fi8l4yfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9QY-00000004xoC-2o74;
	Tue, 07 Jan 2025 13:15:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Lr-00000004wXd-2IAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:10:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43658c452f5so22139975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255430; x=1736860230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV4oC9+EL8srSyzO8Y7L+t+TVZRrKU1b9fLi0ltBXl4=;
        b=boU4JIKfYrDYyqMPRM1KpCBAxQAwF9vQ7No92Iru4oHzEE4ZfOPWJmg0qycnkv4cq2
         kRdDy9MZnGmLucXqPzLBVT9g8pQYkAiAEGxGXRoIOTZl1eoYyKJ6fYg51JvIfVmQ1KtD
         zxSnLKIjMX2W2pAGQodHTwFc7Rsjw33HfxliwJc6EQU366DRGoMzowd+ZgiFfZHqH2dY
         iQ999NV8f7Q7mHrAOjW+P1Je/svTDTaqmmwzw44FTMh7X34ql/1/oRQXF9rE53ekTeje
         BIaAK15arKsE/3eIS6KkVOQEr6ea/TjFkXVABZHmaSq7ovXIJchaI7x2+VS0YrxdFQgr
         kYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255430; x=1736860230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV4oC9+EL8srSyzO8Y7L+t+TVZRrKU1b9fLi0ltBXl4=;
        b=HZN8Cgk6AYf2ReVKw2o/8OPwgbEOJnYPHiTo+YdSYmsBg6HCpmrbPWdvhCvLqAANDu
         UiLk3R8gqP5eE+IYao4rbV4RT++5YXpLiAQ/pOKgXbD286lqZxywCKzk8/QKavsK1CFy
         9h1aIHLyWwWdpWIGPoNHwGrXtjUEqEflBa11E5J2LsMnmu78UfWtBo/qX67+QILkjBLw
         wdfTvL5qzpPS4qJsFF9YCG3OTwd9RmNRBaGtrxHA5Uje3CS7NxivXA2MpUD4KJ/0EgwT
         EkSG1wtVJkcoAl5Fiw8lwXv5l9DEsgUFkRENGFgwl44+cUPsgdLPuJi4A9ocblDlvXFu
         SMFg==
X-Forwarded-Encrypted: i=1; AJvYcCUGlwJf2ZSj/dOOZWPB2uoEDsQjEpy+hskoogmMugH6pzGdYOlInJI0Tf1CrnB91TmmFzR/U98CxSBl+hI24yrm@lists.infradead.org
X-Gm-Message-State: AOJu0YzFsEdzXJmVVGF/55r5YaVejhOxrHPunY+ImXl876KFLiIe+Sb4
	3sM/qaCEooOsy/P/rKTNVDt8a6Ztb35/rJ6MmsX77FFcCYcS40sRuIUIPn0Yh4Q=
X-Gm-Gg: ASbGncu0XmWkT9cBpqx1XTJkYwTzRDB1oBNi/R5HzP1vZVa4R27DolVclpy2/UUcuU+
	eIB4UcxrT8yoJYuFO9AV+9VsbmtqL0LOgV0wdaC+V3RZ7H1dxgOvEWTv0PfM6fUdmC9av1bHKBX
	Jb8fcJZPQ78Oz5okrkllw0f5mMWNxboXM8xIxgHJGeqSW9Xyelb5tB0gApdlhxMeP2ViDfy68GM
	ypwIT1dfCMPxpUFcI3HKFS79DKz0IV+FHNmUqPvbPre/9g21FmuAlt6BosW7S5Q2jeNxBA=
X-Google-Smtp-Source: AGHT+IFojlvlfBDLwc4jTLHA9St8h6hsy3yqCuHX8QBdkRJhEHjq4U9E5nYclZkRpdSwtLeTTkzBFQ==
X-Received: by 2002:a05:600c:1da0:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-43668b7a8b8mr201416125e9.7.1736255430084;
        Tue, 07 Jan 2025 05:10:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm603189915e9.6.2025.01.07.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: thermal: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:26 +0100
Message-ID: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051031_583561_300E3A14 
X-CRM114-Status: GOOD (  11.38  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 48 +++++++++----------
 .../bindings/thermal/imx-thermal.yaml         | 36 +++++++-------
 .../bindings/thermal/imx8mm-thermal.yaml      |  8 ++--
 3 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index dad8de900495..3e61689f6dd4 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -142,38 +142,38 @@ unevaluatedProperties: false
 examples:
   - |
     thermal-sensor@1f04000 {
-         compatible = "allwinner,sun8i-a83t-ths";
-         reg = <0x01f04000 0x100>;
-         interrupts = <0 31 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <1>;
+        compatible = "allwinner,sun8i-a83t-ths";
+        reg = <0x01f04000 0x100>;
+        interrupts = <0 31 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <1>;
     };
 
   - |
     thermal-sensor@1c25000 {
-         compatible = "allwinner,sun8i-h3-ths";
-         reg = <0x01c25000 0x400>;
-         clocks = <&ccu 0>, <&ccu 1>;
-         clock-names = "bus", "mod";
-         resets = <&ccu 2>;
-         interrupts = <0 31 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <0>;
+        compatible = "allwinner,sun8i-h3-ths";
+        reg = <0x01c25000 0x400>;
+        clocks = <&ccu 0>, <&ccu 1>;
+        clock-names = "bus", "mod";
+        resets = <&ccu 2>;
+        interrupts = <0 31 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <0>;
     };
 
   - |
     thermal-sensor@5070400 {
-         compatible = "allwinner,sun50i-h6-ths";
-         reg = <0x05070400 0x100>;
-         clocks = <&ccu 0>;
-         clock-names = "bus";
-         resets = <&ccu 2>;
-         interrupts = <0 15 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <1>;
+        compatible = "allwinner,sun50i-h6-ths";
+        reg = <0x05070400 0x100>;
+        clocks = <&ccu 0>;
+        clock-names = "bus";
+        resets = <&ccu 2>;
+        interrupts = <0 15 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 337560562337..949b154856c5 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -80,19 +80,19 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     efuse@21bc000 {
-         #address-cells = <1>;
-         #size-cells = <1>;
-         compatible = "fsl,imx6sx-ocotp", "syscon";
-         reg = <0x021bc000 0x4000>;
-         clocks = <&clks IMX6SX_CLK_OCOTP>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "fsl,imx6sx-ocotp", "syscon";
+        reg = <0x021bc000 0x4000>;
+        clocks = <&clks IMX6SX_CLK_OCOTP>;
 
-         tempmon_calib: calib@38 {
-             reg = <0x38 4>;
-         };
+        tempmon_calib: calib@38 {
+            reg = <0x38 4>;
+        };
 
-         tempmon_temp_grade: temp-grade@20 {
-             reg = <0x20 4>;
-         };
+        tempmon_temp_grade: temp-grade@20 {
+            reg = <0x20 4>;
+        };
     };
 
     anatop@20c8000 {
@@ -103,12 +103,12 @@ examples:
                      <0 127 IRQ_TYPE_LEVEL_HIGH>;
 
         tempmon {
-             compatible = "fsl,imx6sx-tempmon";
-             interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-             fsl,tempmon = <&anatop>;
-             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
-             nvmem-cell-names = "calib", "temp_grade";
-             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
-             #thermal-sensor-cells = <0>;
+            compatible = "fsl,imx6sx-tempmon";
+            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,tempmon = <&anatop>;
+            nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
+            nvmem-cell-names = "calib", "temp_grade";
+            clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            #thermal-sensor-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index bef0e95e7416..df6c7c5d519f 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -63,10 +63,10 @@ examples:
     #include <dt-bindings/clock/imx8mm-clock.h>
 
     thermal-sensor@30260000 {
-         compatible = "fsl,imx8mm-tmu";
-         reg = <0x30260000 0x10000>;
-         clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
-         #thermal-sensor-cells = <0>;
+        compatible = "fsl,imx8mm-tmu";
+        reg = <0x30260000 0x10000>;
+        clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
+        #thermal-sensor-cells = <0>;
     };
 
 ...
-- 
2.43.0


