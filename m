Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21033F483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRRIBaQ3cZUqzx3gb0MYjn+zdBeG7CtGKHxi5Gkpn4Y=; b=jyK4X4mkGppUy4yEgyBdE7Kjws
	b3rd+JV1E/emkOWel9WLDdiLnf3loIkai4kgtvZ5xUBo53ernY36BiEtrqxn9yO3+qLH0hBizVSNi
	Kb+FuGFD20GTyNfvF+LpLH3bJhkeG+CdGBlh/96XEd4Ex1i1C0MRrgNRz9qv3I76aboS0cWA9/5Qe
	BT6zuqEUXQgXMeSN9MqsIUgxlGwz8KWtRfN3iqWzNeSBctnnibpCQrW2gkAWQ2CGGtGDHc/3NTzJu
	p+QAgBkM9hTwKA0zSzIerKbz01BZxCcr2GuagKZvez7QXQLSH2Mk5Zd0g4sG89ALvfO2yDomQjY0u
	7j7zWqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCb-0000000HUWi-1jnZ;
	Mon, 23 Mar 2026 19:44:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCY-0000000HUVi-3Vpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:44:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2aaf43014d0so30716865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295078; x=1774899878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRRIBaQ3cZUqzx3gb0MYjn+zdBeG7CtGKHxi5Gkpn4Y=;
        b=mvsGLTZaZwO4B6IeqqLfMinjShAaeK9P8Lh4df0AY0uhBaLM1RBp7/JSKVidI/rCwT
         N24/D1CHQ/4mRn84FGueIqowSDCChVXi32x8rP4sAqqeAK4YCw95LjCyLxa2BW1mU4C3
         7FitfhdJnPAQl7cRI4/27huhzbHlgWnprQ5xFX5JEzh/ghZ/uCeugfmojZzK0duZq6r3
         0fmhdSQ8BkySETg11PxxiWygEb25VXjxJdeq8jc8SvD18xmIV6ueMqr3vAmGHQg3lRj9
         h2bhWvoUODcTtkz5I2/iYJ2jmpUI5B9YsPUYh7KxlPscoRbFZ/M9gdl0aHYf9EOI7FVn
         S4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295078; x=1774899878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRRIBaQ3cZUqzx3gb0MYjn+zdBeG7CtGKHxi5Gkpn4Y=;
        b=JqJX1FawpSXA1D7Uaul8YkT8kn3TX/8w8DAoPqX7GyiWHsN+IfX0pjesbw3DjkJRBD
         R4GsidDG3NNoNhp6JKZLxQJJLhN8L9D3hJ7ov/uOHnz8WJg07SztQqfsmJRml4ocK/51
         ebTR58QHDBjFgV2jUQndzCbCUugLk40BhT3IOKhjvuaFrWUR18pHC7UPq1mAumDkpCX4
         wtPR3fiuY3hdCNQmFDcj6hRa2QZ2muq45RjEwLdOl0XILXLA5x4BcXNAVMUv27I6kxhv
         7OPRTouUKIvjBKPk7a6Ddzw11dhLwEMuOtueo9sq7jcknBqNJ89Z3bndNHm1aHuq+IlF
         1RsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/J0/oXoyKanHWJ8Rw0F6JZXc9pVGsoW4xeig7XX9HIZybg2yuz8w32LJbFX3CZB8Y+ZJmfph4skZD1/j+qZJY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6OLNIUKV0RzqGTCr+htHiOPgYfHAOh/ktBD4b+ytZOIS78Cei
	2xdr1uA5aN+kdkMgygOMJPZaHF/dysCVrfuox4/aUpmpPoCF8DFt4gA9
X-Gm-Gg: ATEYQzyDUzK3ELzXxEe3Yuj4Vai1bE5gSXYKs5P41NHjMaVktDv4hJ54f0ITg56vuCp
	k396rB/WRquPIBCjWSKLrGPGh+fCE98C6wf+TrmqBAOA2JQssflrnDhKKVgUDBIIkTa/7muc+2G
	TOTxb54JkVbZx6WYhg599L32iRidrwcHGN1DUJ9DYhc0shQUKb5YTqDchptggIvgpuFy2fkw9dl
	JMavFRXpE4KMYj15F7apQPGK0QhyzlH+MqSaoP3+9+W3Ipd8OlduOG/mOQVm9WwI5g8TYsBqfmW
	mwv65JjvQ02PLqEdTuY7gBtEXJ45ZpfXbHWg0KrVnZxdQBPrngZvRiFJAyGMlCtVZjqUlnVoQPJ
	bMWs1PJXUaKRPlxa3xkyaFlXf/JdSvjVfugTTi9GsxBX+AmTRqIdbhIaLX/Cv1p7JCk8a6xM9Pf
	oPiue6KaXiw+MUkAQu4pfp8og=
X-Received: by 2002:a17:903:2449:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b082724c4fmr144083465ad.23.1774295077790;
        Mon, 23 Mar 2026 12:44:37 -0700 (PDT)
Received: from arch ([2409:40c2:5005:bea7:1ec:aaa7:ee5b:2371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm152080805ad.60.2026.03.23.12.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:44:37 -0700 (PDT)
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
	rougueprince47@gmail.com
Subject: [PATCH 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
Date: Tue, 24 Mar 2026 01:13:59 +0530
Message-ID: <20260323194400.22886-2-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323194400.22886-1-rougueprince47@gmail.com>
References: <20260323194400.22886-1-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124438_879464_9FD9F5A1 
X-CRM114-Status: GOOD (  18.31  )
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
string naming conventions.

Examples have been updated to pass schema validation.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 111 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 ------------
 2 files changed, 111 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
new file mode 100644
index 000000000000..6ba1a42a27ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
@@ -0,0 +1,111 @@
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
+      - const: hisilicon,hi3660-dw-mshc
+      - items:
+          - const: hisilicon,hi3670-dw-mshc
+          - const: hisilicon,hi3660-dw-mshc
+      - const: hisilicon,hi4511-dw-mshc
+      - const: hisilicon,hi6220-dw-mshc
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
+
+    mmc@fcd03000 {
+        compatible = "hisilicon,hi4511-dw-mshc";
+        reg = <0xfcd03000 0x1000>;
+        interrupts = <0 16 4>;
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
+        cd-gpios = <&gpio10 3 0>;
+        cap-mmc-highspeed;
+        cap-sd-highspeed;
+    };
+
+  - |
+    #include <dt-bindings/clock/hi6220-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mmc@f723e000 {
+          compatible = "hisilicon,hi6220-dw-mshc";
+          bus-width = <0x4>;
+          disable-wp;
+          cap-sd-highspeed;
+          sd-uhs-sdr12;
+          sd-uhs-sdr25;
+          card-detect-delay = <200>;
+          hisilicon,peripheral-syscon = <&ao_ctrl>;
+          reg = <0x0 0xf723e000 0x0 0x1000>;
+          interrupts = <0x0 0x49 0x4>;
+          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
+                   <&clock_sys HI6220_MMC1_CLK>;
+          clock-names = "ciu", "biu";
+          cd-gpios = <&gpio1 0 1>;
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


