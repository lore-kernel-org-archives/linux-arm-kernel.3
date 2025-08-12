Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD622CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr/U6ugFqLAdfs3WKXWnuYGdw0ZboP4jqldLOf5Ia9I=; b=zKegHhcnQ1d/9T0cC6etdF5eOl
	0XLiHyTnexL2ROZ1dcmlo+SKKh9R5K5+mXSVwcvgZfe218S8r5ejWHHuElEQq9b2EQj+qa23trM1E
	RgWHBfO8EQC5e4+OYL4wpwf5d7GLtg+zvinwvTz5GYI+53d0CpnQli33ysd9DIzWWzBe102Q6cIvt
	huwEZOP/6NynpcRByutlBI5qstdVhr1o+FuB5DtdEw1PVQoMFcdphGf04l3Uwhj0f7B2oiQxmLMuZ
	btawKkC2vEixG4FfQtkEj50xIsKnL6gSwJXP/6KFl6ItSDteJW4w5qCuSlwJPDztrCvgffVIBFReO
	mTNJMBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwrw-0000000C5Uk-1oM3;
	Tue, 12 Aug 2025 21:49:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwpN-0000000C5AT-3bS5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 21:46:43 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BDE6E92;
	Tue, 12 Aug 2025 23:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035147;
	bh=sKk/FGxnwZJf4eZPJqhVEBfQ8jRB3RY1TCG/Ftq6hFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TinlylEd/YK1hRK42GpJ3zRVB7Ts2MP19hS46DNGGgQ62qLTOmWuI5PjMs3PChod2
	 PvQMxG+Yoe6y1i3EB1HLl/GWeYnynKwKyr9permxynu/nn4SDCdn4TPRHoWISZkGRl
	 odsRdwA8GabVH9I1HJLW57xUeKVpOAvXBCIjclHM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency property for camera sensors
Date: Wed, 13 Aug 2025 00:45:09 +0300
Message-ID: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_144642_184370_0447DAE1 
X-CRM114-Status: GOOD (  11.99  )
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

Usage of the clock-frequency property for camera sensors is discouraged
in favour of using assigned-clock-rates (and assigned-clock-parents
where needed). Mark the property as deprecated.

Update the examples accordingly. In DT examples where the sensor input
clock appears to come from a programmable clock generator, replace
clock-frequency by the assigned-clocks and assigned-clock-rates
properties. Otherwise, just drop clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:

- Adapt examples in bindings that reference sensors
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
 .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
 .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
 .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
 Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
 11 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..1687b069e032 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -292,7 +292,8 @@ examples:
 
                 clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
                 clock-names = "xvclk";
-                clock-frequency = <19200000>;
+                assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+                assigned-clock-rates = <19200000>;
 
                 dovdd-supply = <&vreg_lvs1a_1p8>;
                 avdd-supply = <&cam0_avdd_2v8>;
@@ -324,7 +325,8 @@ examples:
 
                 clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
                 clock-names = "xclk";
-                clock-frequency = <24000000>;
+                assigned-clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+                assigned-clock-rates = <24000000>;
 
                 vdddo-supply = <&vreg_lvs1a_1p8>;
                 vdda-supply = <&cam3_avdd_2v8>;
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index bc664a016396..217b08c8cbbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -55,6 +55,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the external clock to the sensor in Hz.
+    deprecated: true
 
   reset-gpios:
     description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
@@ -93,7 +94,6 @@ properties:
 required:
   - compatible
   - reg
-  - clock-frequency
   - clocks
 
 additionalProperties: false
@@ -114,8 +114,11 @@ examples:
             reg = <0x10>;
             reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
+
             clocks = <&omap3_isp 0>;
-            clock-frequency = <9600000>;
+            assigned-clocks = <&omap3_isp 0>;
+            assigned-clock-rates = <9600000>;
+
             port {
                 ccs_ep: endpoint {
                     data-lanes = <1 2>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 67c1c291327b..0e1d9c390180 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -39,6 +39,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the eclk clock in Hz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -127,7 +127,6 @@ examples:
 
             clocks = <&ov02a10_clk>;
             clock-names = "eclk";
-            clock-frequency = <24000000>;
 
             rotation = <180>;
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
index bc9b27afe3ea..a583714b1ac7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
@@ -21,6 +21,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -83,8 +84,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov5645";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov5645_vdddo_1v8>;
             vdda-supply = <&ov5645_vdda_2v8>;
             vddd-supply = <&ov5645_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 2e5187acbbb8..922996da59b2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -29,6 +29,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -89,8 +90,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov7251";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov7251_vdddo_1v8>;
             vdda-supply = <&ov7251_vdda_2v8>;
             vddd-supply = <&ov7251_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index 3f6f72c35485..fa71f24823f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
@@ -37,6 +37,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the xvclk clock in Hertz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -87,7 +88,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -114,7 +114,6 @@ examples:
 
             clocks = <&cam_osc>;
             clock-names = "xvclk";
-            clock-frequency = <19200000>;
 
             avdd-supply = <&mt6358_vcama2_reg>;
             dvdd-supply = <&mt6358_vcamd_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
index c8f2955e0825..ebd95a8d9b2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
@@ -26,6 +26,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: mclk clock frequency
+    deprecated: true
 
   rstn-gpios:
     maxItems: 1
@@ -82,9 +83,12 @@ examples:
         sensor@2d {
             compatible = "samsung,s5k5baf";
             reg = <0x2d>;
+
             clocks = <&camera 0>;
+            assigned-clocks = <&camera 0>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "mclk";
-            clock-frequency = <24000000>;
             rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
             stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
             vdda-supply = <&cam_io_en_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
index 7e83a94124b5..e563e35920c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
@@ -30,6 +30,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: extclk clock frequency
+    deprecated: true
 
   gpios:
     maxItems: 1
@@ -80,8 +81,11 @@ examples:
         sensor@10 {
             compatible = "samsung,s5k6a3";
             reg = <0x10>;
-            clock-frequency = <24000000>;
+
             clocks = <&camera 1>;
+            assigned-clocks = <&camera 1>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "extclk";
             gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
             afvdd-supply = <&ldo19_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 990acf89af8f..484039671cd1 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -51,6 +51,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz
+    deprecated: true
 
   vdda-supply:
     description: Analog power supply (2.9V)
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - vdda-supply
   - vddd-supply
   - vdddo-supply
@@ -125,7 +125,8 @@ examples:
 
             clocks = <&gcc 90>;
             clock-names = "xclk";
-            clock-frequency = <37125000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <37125000>;
 
             vdddo-supply = <&camera_vdddo_1v8>;
             vdda-supply = <&camera_vdda_2v8>;
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
index 3a5ff3f47060..151290de6e87 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
@@ -209,9 +209,9 @@ examples:
                 svdda-supply = <&cam_io_reg>;
                 svddio-supply = <&ldo19_reg>;
                 afvdd-supply = <&ldo19_reg>;
-                clock-frequency = <24000000>;
-                clocks = <&camera 1>;
                 clock-names = "extclk";
+                assigned-clocks = <&camera 1>;
+                assigned-clock-rates = <24000000>;
                 gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
                 port {
diff --git a/Documentation/devicetree/bindings/media/samsung,fimc.yaml b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
index 7808d61f1fa3..2a54379d9509 100644
--- a/Documentation/devicetree/bindings/media/samsung,fimc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
@@ -259,10 +259,11 @@ examples:
                     svdda-supply = <&cam_io_reg>;
                     svddio-supply = <&ldo19_reg>;
                     afvdd-supply = <&ldo19_reg>;
-                    clock-frequency = <24000000>;
                     /* CAM_B_CLKOUT */
                     clocks = <&camera 1>;
                     clock-names = "extclk";
+                    assigned-clocks = <&camera 1>;
+                    assigned-clock-rates = <24000000>;
                     gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
                     port {
-- 
Regards,

Laurent Pinchart


