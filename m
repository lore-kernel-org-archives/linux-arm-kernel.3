Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568DD2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pUJkphEStzwJO4O1NIR8Po6mdkROYaBayKSF41nasT0=; b=ScAv9xfZbWRkqy2gJbiCP1gYec
	Iu/61beSdKUQHjeAmSYLhf2sDlohcDbHjvE9MipmZwz5A9V2c8pQNt6CknmkKvsp8aLjtCyKaWNJ3
	ue4bOSJdaFfXqADrEdtws0vKHrmwrN/OFEqTTue7pf13SeFvWMQQmAOcLcCL3WbNateO4hDHxUvma
	wW+m1EH0jBZ4Hqoz+8SuU0oTB9JGDm2xURTsCA4nCBj8MRy4Kkn/04gRMwsEHs3l76oWMjvOf4e9t
	UiaTGBJjhkZByfysRiIiDMy8hFf+nP0iPSRMEN01dzIvdJxBzeIl/utvuKi0WzauDlD6Tw2+OyBzb
	MGywgFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mmb-0000000EfCq-1JdV;
	Tue, 29 Oct 2024 14:01:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mWg-0000000EcA9-0JWG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:44:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43169902057so52596055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730209487; x=1730814287; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUJkphEStzwJO4O1NIR8Po6mdkROYaBayKSF41nasT0=;
        b=eV+qGWK4uHmDBpV6eL9sSSkYzlvo5DO+tEATjZw/ui/lxp5OCEReKC0V+AAljAVhWT
         kABKbjxdnFomo1WTZKLpk1zqtBTvWD1Sr1M7/aIImD75LQlmihgwqRkORdBWAYcjt9I5
         jWGW8s/Bm8ZnSneDNYZOlFOtMN7uCGh7SNxXdDh24kuUvVqNlPbt2X2Gg2TtmFKJaFss
         0oepP9JMH/V5iMtGz7WEbFCExLrLDwD8X1sgXc1LzubBbBcodzO1TrQTF7yX11dnnpa0
         J3kL1ZjLvp8a2OMNnvBqdBW+kQA8bnNoY+hI8lIOZrnuvyUaw7Cij5yoWbdaLrKfb5Rh
         vw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730209487; x=1730814287;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUJkphEStzwJO4O1NIR8Po6mdkROYaBayKSF41nasT0=;
        b=nAA1oT288otWbabzKFXKKOtFvp8gnUwJHUJZzJwsXV7cjrhNZTAhekzyxDPpLX5eDR
         9lfO0VjONQaLJbZPONcBjlq8YZQj0W6PeJ0fFTtYkKxHbuRwttebmLQNvOUhK26v26Wv
         mndqnmeOBGsIQWBhg9nhp6FJlk6ZLudAwZ8N2D0a5YuhnT0Lnp4Zv/m9jxLiq1Qnm8Mk
         5FuzQlpjtVZYioHP1a+ihSbgkI9ea3BUoxzed4cVpCA4D69sErElS+xw1drFFLGCNRRn
         GkV53tH9B7DMUXOEvZhXsbgqLcwSApcxlJkOpMZp1wtT0B983KFujxtGf4wWp4lCMXc7
         AbQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2FGhYs0RXrvbQavoR/A3ul/auDhZOKey0cAJwWkXMquBWcpc14mRTXHu8PewQSKx9+VazC6QYeZbVPE07u4lL@lists.infradead.org
X-Gm-Message-State: AOJu0YzItwe5st8JPMSDtYCHStdVAsoNguMIwFSgHUKJnb+bhUN8LNiq
	wxFKANTuhtR0edeIXNwA8vHkyIPGwaqkByt/3kNI4Xzp5droN0tPDzEOPdoDo4A=
X-Google-Smtp-Source: AGHT+IEpQAtL43zFwgfi4A77StpEjcj+SqwLbhpPLDV4ePBgEgPNwUCUrxojCxlDLVwcaj06TFFy4Q==
X-Received: by 2002:a05:600c:3512:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-4319ac9ad1bmr117291015e9.14.1730209487142;
        Tue, 29 Oct 2024 06:44:47 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193594fffsm143668855e9.13.2024.10.29.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:44:46 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 29 Oct 2024 13:44:45 +0000
Subject: [PATCH v3] media: dt-bindings: Remove assigned-clock-* from
 various schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-b4-linux-next-202041004-i2c-media-yaml-fixes-v3-1-f2eb07615f30@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMzmIGcC/5WPSw7CMAxEr1JljVHsJvxW3AOxSFMXLJUWJSVqh
 Xp3UsQClixnrHlPfqrIQTiqQ/FUgZNE6bscylWh/NV1Fwapc1akyaDWFioDrXSPEToeB8i1Xno
 DQh5uXIuDyd1aaGTkCI1vrNceWe9qlZH3wO9DJp7OOV8lDn2Y3vaES/sRIf0nSggaHFUVksPtf
 lMf89aFft2Hi1pMib7o9OcbiQABK2NLi1vjrPuhz/P8AilP6M9HAQAA
X-Change-ID: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_064450_167202_3B131847 
X-CRM114-Status: GOOD (  20.61  )
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

Remove extraneous assigned-clock* from media/i2c/* schemas.

assigned-clock and assigned-clock-parent assume that there is a clock that
can be assigned and/or a clock parent that similarly can be assigned by
firmware which may not always be the case.

The sensor properties themselves should not mandate assigned-clock* as a
result.

Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Changes in v3:
- Updates commit log with more description of why we are removing
  assigned-clock from the properties - Laurent
- Drops assigned-clocks from the examples too.
  assigned-clock in examples has the example quality as status="okay" - Laurent
- Link to v2: https://lore.kernel.org/r/20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org

v2:

- Changes series name was: media: i2c: Cleanup assigned-clocks and endpoint: properties: unevaluatedProperties: false
  Dropping the second patch in the series means the title changes too - bod
- Drops unevaluatedProperties -> additionalProperties change
  There is no clear consensus on this right now.
- Adds Reviewed-by and Acked-by as indicated to patch #1 Laurent, Krzysztof 
- Link to v1: https://lore.kernel.org/r/20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org

v1:

On a recent schema submission I did what most well adjusted schema writers
do and tried to find a base file to work from to copy/paste and forget.

Confusingly/predictably I received feedback to remove or alter several of
the properties included in my devious copy/paste plan.

The first bit of feedback was that assigned-clock-* was to be dropped.
Removing assigned-clock-* as assigned-clock-* is a core property which
doesn't need to be listed in a schema.

The second bit of feedback landed on use of additionalProperties:false
along with enumeration of all required endpoint properties instead of an
implied list of valid properties from unevaluatedProperties:false.

Link: https://lore.kernel.org/linux-media/20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org

This series removes the assigned-clock-* from upstream sensor property
schemas and applies additionalProperities:false to properties: endpoint:.

A few missing properties: or required: are added to the schemas based on
output of DT checkers.

The one new DT complaint I didn't fix with the move to
additionalProperties: false is:

/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/x1e80100-crd_qlt_integration/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: imx219@10: port:endpoint: 'remote-endpoint' is a required property

Since this appears to be some sort of temporary/commented thing upstream
which I don't know the provenance of.
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 10 ----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 11 -----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 10 ----------
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml |  7 -------
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml |  8 --------
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml |  8 --------
 8 files changed, 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..1a57f2aa198228dff784aad25c2c0e39b6c32a9a 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -28,12 +28,6 @@ properties:
     items:
       - description: Reference to the mclk clock.
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   reset-gpios:
     description: Reference to the GPIO connected to the RESETB pin. Active low.
     maxItems: 1
@@ -82,8 +76,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - vddio-supply
   - vdda-supply
   - vddd-supply
@@ -105,8 +97,6 @@ examples:
             pinctrl-names = "default";
             pinctrl-0 = <&pinctrl_csi1>;
             clocks = <&clk 0>;
-            assigned-clocks = <&clk 0>;
-            assigned-clock-rates = <25000000>;
             vdda-supply = <&reg_camera_vdda>;
             vddd-supply = <&reg_camera_vddd>;
             vddio-supply = <&reg_camera_vddio>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 1f497679168c8395a94b3867beb49b251ef621fc..8028c8b107c46cc69ebadac637904f9917fb0f0a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: XVCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - dovdd-supply
   - port
@@ -93,9 +85,6 @@ examples:
             avdd-supply = <&ov5648_avdd>;
             dovdd-supply = <&ov5648_dovdd>;
             clocks = <&ov5648_xvclk 0>;
-            assigned-clocks = <&ov5648_xvclk 0>;
-            assigned-clock-rates = <24000000>;
-
 
             ov5648_out: port {
                 ov5648_out_mipi_csi2: endpoint {
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..320b9aacbb8bf08e6d06c927ee198c468def4642 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: EXTCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - avdd-supply
   - dovdd-supply
@@ -94,8 +86,6 @@ examples:
             pinctrl-0 = <&csi_mclk_pin>;
 
             clocks = <&ccu CLK_CSI_MCLK>;
-            assigned-clocks = <&ccu CLK_CSI_MCLK>;
-            assigned-clock-rates = <24000000>;
 
             avdd-supply = <&reg_ov8865_avdd>;
             dovdd-supply = <&reg_ov8865_dovdd>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..401c8613f84038451b90d244021a1388f32c91da 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -27,10 +27,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27MHz
     maxItems: 1
@@ -87,10 +83,6 @@ examples:
             reg = <0x60>;
             clocks = <&ov9282_clk>;
 
-            assigned-clocks = <&ov9282_clk>;
-            assigned-clock-parents = <&ov9282_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 ov9282: endpoint {
                     remote-endpoint = <&cam>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb35cfe2b85069946cf1be435a58cb8..975c1d77c8e5d24179e9cb8d92fe7b6798c4d2ec 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -24,10 +24,6 @@ properties:
       - sony,imx258
       - sony,imx258-pdaf
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description:
       Clock frequency from 6 to 27 MHz.
@@ -125,9 +121,6 @@ examples:
             reg = <0x6c>;
             clocks = <&imx258_clk>;
 
-            assigned-clocks = <&imx258_clk>;
-            assigned-clock-rates = <19200000>;
-
             port {
                 endpoint {
                     remote-endpoint = <&csi1_ep>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..3842e5130463491e833cbadcdc3a07c55f766c27 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
@@ -74,10 +70,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx334_clk>;
 
-            assigned-clocks = <&imx334_clk>;
-            assigned-clock-parents = <&imx334_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 imx334: endpoint {
                     remote-endpoint = <&cam>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..80f879b6bd01bf6ce81eb9b6c1451448509ca74e 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
@@ -86,10 +82,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx335_clk>;
 
-            assigned-clocks = <&imx335_clk>;
-            assigned-clock-parents = <&imx335_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             avdd-supply = <&camera_vdda_2v9>;
             ovdd-supply = <&camera_vddo_1v8>;
             dvdd-supply = <&camera_vddd_1v2>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index d9b7815650fdb890418fc96c828acc9147dfb6e8..5447ab0768a66afaf665f155d1f5bf90210eacc6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -26,10 +26,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
@@ -86,10 +82,6 @@ examples:
             reg = <0x1a>;
             clocks = <&imx412_clk>;
 
-            assigned-clocks = <&imx412_clk>;
-            assigned-clock-parents = <&imx412_clk_parent>;
-            assigned-clock-rates = <24000000>;
-
             port {
                 imx412: endpoint {
                     remote-endpoint = <&cam>;

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


