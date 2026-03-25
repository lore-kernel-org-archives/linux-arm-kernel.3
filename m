Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1671A109E52C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wv2DcvHCHOF/E7EoFtW24rtKQvZLplUlYnPmwDgOOxY=; b=FEK2iuCeKreFwM5oauZABAhZwv
	XOsxzW11bwzIjQ3h0J7LhZiKErL1j2gw3z0aPNeQWPGV/GgSKTV3j6WV6iTwsc4cSWtrh9ef9gMp+
	6Qa/542EX8AE8fObqdbfeXNiycnZu8B+f1Dg07Hy++zlyULN1LFncBXVRkv3kBI/6rlj8hD15SJom
	OHrMms9RFCN3ia9yZ/cOdqd52A0OmhIXqDZEbEcz9DGu1VTYB7EVh7zlhQliIBQ86n3uwJzgluNKy
	rzrXgCBdmy0teUnUw6ijO/v+xbc+KxhARZiUHGCziAxPm+X5JyY3Y1yyECi72bYaOYQe0N2JYxxQK
	sECxrFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X8E-00000004NnI-1vKg;
	Wed, 25 Mar 2026 22:55:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X8A-00000004NmD-3S95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:55:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so323010a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479318; x=1775084118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv2DcvHCHOF/E7EoFtW24rtKQvZLplUlYnPmwDgOOxY=;
        b=mxCMNKZgENl7rcpPjER1Av9jEgqeQQT2zaxGphAC3tE/SpM3XojQxHksDy78vkYnSK
         EeFlKJaAR67uDxoLZry3ljGOnm0LLpX0KLP1LMSkQfV2zgaWMFWfIblD8x8cZw6qqfA9
         Tp5BqaLESCsRzVKY0knRCSe0UaAZAJRW5TPzIBB8z71b1phSvcLGrVm11haY6O5Wj5WH
         kA7AcCHERTOcbddWnh5GGYgaVzz4GjGPQxUygceUFsM2wXt2cypuwoGzrAT9h77viXGV
         MGt4s/IA/QJdw0OrRC5xsptAAOLy3jkQz5+n55eYK2r+DSo1N0GsctaWnWUObdNrVq7o
         WO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479318; x=1775084118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wv2DcvHCHOF/E7EoFtW24rtKQvZLplUlYnPmwDgOOxY=;
        b=T9jMmRuYZH1PntpSwzFzj9tjq8zujtRIKyB+tQMc2knhEQqrfe2N1AyCHSUkFRtc2+
         R18EAO1W6E6NYaU0Q7uBwuATXHUi64lwWIUs+fvixaoYTn7UZkWL6n9GgGZRSRTeCFFC
         arkPs33Sv8yXrxl2Z+1oPphQkwlihQDu51mqlOEszXXGrBbRqrxa3onvSW+Mwg+Gtorb
         mTgfvZBK/vRw40Dp8ienRKlGvb4nCxESXczhcMY36277uKxE/9xO9SvrPLs+/Zs3yvtE
         PjnrD/ZDk7Y97XEf+94cBSub0cpC4Nc9wsy5K0oA+3pT22Wed8p34lLzCmLId6BBXDEp
         +8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW56etjTWfhAglx4870D3hdZcPd4kD9fo8fsSekxaWncNIp35/fA/NyrLP5o5AIb/bdaW6BGubYu/2szNhcMmQb@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHPtVbdnDPujJE9JgYZTfyuSB8y+tipJZCZDF8HdUmtE6kfBR
	r56XlqpmH4VUHTaXs6rc7iZInuRNPNE05Wb4VjvACFgwqnEF52FvwL6M
X-Gm-Gg: ATEYQzy6xcIzrnr3RsqxIxSSNkFwqjc6A12geUhL+sfrKk/KGNaC00ryb30CYAgq4p2
	17Wj/eEyEMj3RbFjEmNJLGQXLNMBjvx7Uxe2gJphuEhEkbK/obnyTCaav2HDIdeKZJ3DkY0jK78
	V9hLBzZXOL1xBjmd9DRr424WYz1Rdm87ZgiHROLrZgxaI07vaTyoTBcOqak0rha+8wMbq6ANLYL
	7pqNiZjctDdyM795auxeOECP99OUpo+CmU92HW+Ptu/GeHS6PZ01hbwAIiWssAUFY5b3sWDHLR4
	czB6xGe9Z4wxxaifi9isibh7aRTJDt9VLMs9DaM30YS2oapxxCEyH4IZTySDDctu67bvRnTs5Qg
	zbvi3qQWR6rLjHm6faROgPwkKMXifwFozm86FJl1ZRmJLx71CYOxrPDiZ6ffP1pzARcIxTaoO3v
	pobwSkTA1Du3OUF8o17WDgqZV7
X-Received: by 2002:a17:90b:2887:b0:359:7c55:c166 with SMTP id 98e67ed59e1d1-35c0dc626f2mr4849598a91.7.1774479317835;
        Wed, 25 Mar 2026 15:55:17 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e1a64absm84066a91.2.2026.03.25.15.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:55:17 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
Date: Thu, 26 Mar 2026 04:24:38 +0530
Message-ID: <20260325225439.68161-2-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325225439.68161-1-rougueprince47@gmail.com>
References: <20260325225439.68161-1-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_155518_871110_06BFDAE3 
X-CRM114-Status: GOOD (  20.22  )
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

Convert the Hisilicon DesignWare Mobile Storage Host Controller
(dw-mshc) bindings from text format to DT schema.

As part of this conversion, the binding file is renamed from
k3-dw-mshc.txt to hisilicon,hi3660-dw-mshc.yaml to align with compatible
string naming conventions. Examples have been updated to pass schema
validation.

Note: synopsys-dw-mshc binding specifies clock names as "biu" followed
by "ciu". However, this Hisilicon binding reverses the order to 'ciu'
then 'biu' to match both the legacy text binding and in-kernel Hisilicon
DTS board files.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
Changes in v2:
    - Grouped compatible strings into an enum.
    - Replaced raw numbers with proper flags.
    - Fixed property order and removed invalid hex values.
    - Added explanation for clock order change in commit message.
    - Collected Acked-by tag.

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
 2 files changed, 117 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
new file mode 100644
index 000000000000..296bd776488e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/hisilicon,hi3660-dw-mshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon specific extensions to the Synopsys Designware Mobile Storage Host Controller
+
+maintainers:
+  - Zhangfei Gao <zhangfei.gao@linaro.org>
+
+description:
+  The Synopsys designware mobile storage host controller is used to interface
+  a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
+  differences between the core Synopsys dw mshc controller properties described
+  by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
+  extensions to the Synopsys Designware Mobile Storage Host Controller.
+
+allOf:
+  - $ref: /schemas/mmc/synopsys-dw-mshc-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - hisilicon,hi3660-dw-mshc
+          - hisilicon,hi4511-dw-mshc
+          - hisilicon,hi6220-dw-mshc
+      - items:
+          - const: hisilicon,hi3670-dw-mshc
+          - const: hisilicon,hi3660-dw-mshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: card interface unit clock
+      - description: bus interface unit clock
+
+  clock-names:
+    items:
+      - const: ciu
+      - const: biu
+
+  hisilicon,peripheral-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of syscon used to control peripheral.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/hi3620-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@fcd03000 {
+        compatible = "hisilicon,hi4511-dw-mshc";
+        reg = <0xfcd03000 0x1000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
+        clock-names = "ciu", "biu";
+        vmmc-supply = <&ldo12>;
+        fifo-depth = <0x100>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
+        bus-width = <4>;
+        disable-wp;
+        cd-gpios = <&gpio10 3 GPIO_ACTIVE_HIGH>;
+        cap-mmc-highspeed;
+        cap-sd-highspeed;
+    };
+
+  - |
+    #include <dt-bindings/clock/hi6220-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mmc@f723e000 {
+          compatible = "hisilicon,hi6220-dw-mshc";
+          reg = <0x0 0xf723e000 0x0 0x1000>;
+          interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
+                   <&clock_sys HI6220_MMC1_CLK>;
+          clock-names = "ciu", "biu";
+          bus-width = <4>;
+          disable-wp;
+          cap-sd-highspeed;
+          sd-uhs-sdr12;
+          sd-uhs-sdr25;
+          card-detect-delay = <200>;
+          hisilicon,peripheral-syscon = <&ao_ctrl>;
+          cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+          pinctrl-names = "default", "idle";
+          pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
+          pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
+          vqmmc-supply = <&ldo7>;
+          vmmc-supply = <&ldo10>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
deleted file mode 100644
index 36c4bea675d5..000000000000
--- a/Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Hisilicon specific extensions to the Synopsys Designware Mobile
-  Storage Host Controller
-
-Read synopsys-dw-mshc.txt for more details
-
-The Synopsys designware mobile storage host controller is used to interface
-a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
-differences between the core Synopsys dw mshc controller properties described
-by synopsys-dw-mshc.txt and the properties used by the Hisilicon specific
-extensions to the Synopsys Designware Mobile Storage Host Controller.
-
-Required Properties:
-
-* compatible: should be one of the following.
-  - "hisilicon,hi3660-dw-mshc": for controllers with hi3660 specific extensions.
-  - "hisilicon,hi3670-dw-mshc", "hisilicon,hi3660-dw-mshc": for controllers
-     with hi3670 specific extensions.
-  - "hisilicon,hi4511-dw-mshc": for controllers with hi4511 specific extensions.
-  - "hisilicon,hi6220-dw-mshc": for controllers with hi6220 specific extensions.
-
-Optional Properties:
-- hisilicon,peripheral-syscon: phandle of syscon used to control peripheral.
-
-Example:
-
-	/* for Hi3620 */
-
-	/* SoC portion */
-	dwmmc_0: dwmmc0@fcd03000 {
-		compatible = "hisilicon,hi4511-dw-mshc";
-		reg = <0xfcd03000 0x1000>;
-		interrupts = <0 16 4>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&mmc_clock HI3620_SD_CIUCLK>, <&clock HI3620_DDRC_PER_CLK>;
-		clock-names = "ciu", "biu";
-	};
-
-	/* Board portion */
-	dwmmc0@fcd03000 {
-		vmmc-supply = <&ldo12>;
-		fifo-depth = <0x100>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&sd_pmx_pins &sd_cfg_func1 &sd_cfg_func2>;
-		bus-width = <4>;
-		disable-wp;
-		cd-gpios = <&gpio10 3 0>;
-		cap-mmc-highspeed;
-		cap-sd-highspeed;
-	};
-
-	/* for Hi6220 */
-
-	dwmmc_1: dwmmc1@f723e000 {
-		compatible = "hisilicon,hi6220-dw-mshc";
-		bus-width = <0x4>;
-		disable-wp;
-		cap-sd-highspeed;
-		sd-uhs-sdr12;
-		sd-uhs-sdr25;
-		card-detect-delay = <200>;
-		hisilicon,peripheral-syscon = <&ao_ctrl>;
-		reg = <0x0 0xf723e000 0x0 0x1000>;
-		interrupts = <0x0 0x49 0x4>;
-		clocks = <&clock_sys HI6220_MMC1_CIUCLK>, <&clock_sys HI6220_MMC1_CLK>;
-		clock-names = "ciu", "biu";
-		cd-gpios = <&gpio1 0 1>;
-		pinctrl-names = "default", "idle";
-		pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
-		pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
-		vqmmc-supply = <&ldo7>;
-		vmmc-supply = <&ldo10>;
-	};
-- 
2.53.0


