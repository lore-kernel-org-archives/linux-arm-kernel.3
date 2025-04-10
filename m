Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1xA4iUf9Nf9g0nzG+K3sFTl8XJA4R6QYV4xdfo6Xx0=; b=M99VrzsOptyJ2TCxYuwIcRHWUf
	BwCcp5DI7jxpOR0KS3hEZEDeJ9OYbeDLNxHvrJPnDOx9CymEZs4x5pkIOqiyKhZlKoIpWoDH1qPHs
	hbXeW4cxTDzfFcNz4M8ktBHEDuh326Bc886shnk2t5ZnvxgAa60NGKp1nv9AQBNV49OJQaWV4YSlD
	5GC89UoZN8Ea0S8hZcVcm2XMOvqMiwdxAD8kRkpI+gQ29ehjWgxi0uBHggM4Ghyy5230DFhR7wB6g
	62kLbH5Xf1h8M3C1g7T/1h0kCUjfkl62mLthTXoFhOmE6NGKNqtOC+aS7q+B5Q7hInY7dKOiXARKt
	7S8c5cmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vXx-0000000BLpu-1pRZ;
	Thu, 10 Apr 2025 17:18:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8K-0000000B54A-1RWp;
	Thu, 10 Apr 2025 15:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0839CA4A925;
	Thu, 10 Apr 2025 15:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007AAC4CEDD;
	Thu, 10 Apr 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300083;
	bh=08ZHSMoqcp6muzXlw3I6sj8QXRZ+fQyHgNMZj1SSrdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hvr+MRXWz6zZDqbGyKtarK07qSeX1tVPFXSoarGPEnD0U89TtphwqxdOSRLJUGR8s
	 ijse85CijxUfmz4anXLpHxCZKbQPb/AX1QQ1dN4FedmWWau4+rvqXhgNFDAbFrPvhw
	 YJWwW+1vted2FUTHOwDNhA8UGfbMx+nKhAZ19SWkUTR1SsMURjrv54YmGB6PV9SS9Z
	 1khj6/sx3iSVKSHhelpuYN7tfbIQtVcdGpfcBIKLpQ/MjxraUlaGtpNhleFxFwq1Ku
	 QimonuVOeh0Zwbj5EUUOk5DYIoJ/qmzM2cUcj12IC6hrggz5lNM2kXaBE3kWR3MwXo
	 cL4uCcB7HchBA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:33 -0500
Subject: [PATCH v2 12/17] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-12-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084804_520098_BEB8269B 
X-CRM114-Status: GOOD (  15.66  )
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

Replace the prose for properties dependent on specific "enable-method"
values with schemas defining the same requirements.

Both "qcom,acc" and "qcom,saw" properties appear to be required for any
of the Qualcomm enable-method values, so the schema is a bit simpler
than what the text said. The properties are also needed on some Qualcomm
platforms with other enable-method values. It's limited to Cortex A53
based platforms so use that to disable the properties. The references
to arm/msm/qcom,saw2.txt and arm/msm/qcom,kpss-acc.txt are out of date,
so just drop them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
v2:
 - Only disallow qcom,acc and qcom,saw on !cortex-a53
 - Fix example in qcom,saw2.yaml
---
 Documentation/devicetree/bindings/arm/cpus.yaml    | 91 ++++++++++++++--------
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml    |  3 +-
 2 files changed, 60 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 2e666b2a4dcd..351be2f77581 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -273,8 +273,6 @@ properties:
     description:
       The DT specification defines this as 64-bit always, but some 32-bit Arm
       systems have used a 32-bit value which must be supported.
-      Required for systems that have an "enable-method"
-        property value of "spin-table".
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -333,24 +331,13 @@ properties:
 
   qcom,saw:
     $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      Specifies the SAW* node associated with this CPU.
-
-      Required for systems that have an "enable-method" property
-      value of "qcom,kpss-acc-v1" or "qcom,kpss-acc-v2"
-
-      * arm/msm/qcom,saw2.txt
+    description:
+      Specifies the SAW node associated with this CPU.
 
   qcom,acc:
     $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      Specifies the ACC* node associated with this CPU.
-
-      Required for systems that have an "enable-method" property
-      value of "qcom,kpss-acc-v1", "qcom,kpss-acc-v2", "qcom,msm8226-smp" or
-      "qcom,msm8916-smp".
-
-      * arm/msm/qcom,kpss-acc.txt
+    description:
+      Specifies the ACC node associated with this CPU.
 
   rockchip,pmu:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -378,22 +365,60 @@ properties:
       formed by encoding the target CPU id into the low bits of the
       physical start address it should jump to.
 
-if:
-  # If the enable-method property contains one of those values
-  properties:
-    enable-method:
-      contains:
-        enum:
-          - brcm,bcm11351-cpu-method
-          - brcm,bcm23550
-          - brcm,bcm-nsp-smp
-  # and if enable-method is present
-  required:
-    - enable-method
-
-then:
-  required:
-    - secondary-boot-reg
+allOf:
+  - if:
+      # If the enable-method property contains one of those values
+      properties:
+        enable-method:
+          contains:
+            enum:
+              - brcm,bcm11351-cpu-method
+              - brcm,bcm23550
+              - brcm,bcm-nsp-smp
+      # and if enable-method is present
+      required:
+        - enable-method
+    then:
+      required:
+        - secondary-boot-reg
+  - if:
+      properties:
+        enable-method:
+          enum:
+            - spin-table
+            - renesas,r9a06g032-smp
+      required:
+        - enable-method
+    then:
+      required:
+        - cpu-release-addr
+  - if:
+      properties:
+        enable-method:
+          enum:
+            - qcom,kpss-acc-v1
+            - qcom,kpss-acc-v2
+            - qcom,msm8226-smp
+            - qcom,msm8916-smp
+      required:
+        - enable-method
+    then:
+      required:
+        - qcom,acc
+        - qcom,saw
+  - if:
+      # 2 Qualcomm platforms bootloaders need qcom,acc and qcom,saw yet use
+      # "spin-table" or "psci" enable-methods. Disallowing the properties for
+      # all other CPUs is the best we can do as there's not any way to
+      # distinguish these Qualcomm platforms.
+      not:
+        properties:
+          compatible:
+            const: arm,cortex-a53
+    then:
+      properties:
+        qcom,acc: false
+        qcom,saw: false
 
 required:
   - device_type
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index ca4bce817273..c2f1f5946cfa 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -73,9 +73,10 @@ examples:
         #size-cells = <0>;
 
         cpu@0 {
-            compatible = "qcom,kryo";
+            compatible = "arm,cortex-a53";
             device_type = "cpu";
             enable-method = "qcom,kpss-acc-v2";
+            qcom,acc = <&acc0>;
             qcom,saw = <&saw0>;
             reg = <0x0>;
             operating-points-v2 = <&cpu_opp_table>;

-- 
2.47.2


