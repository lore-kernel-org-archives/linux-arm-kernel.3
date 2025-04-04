Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFA3C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaCxv3C/86+LVw1iSWNlJ4iMe/7CQFWlYPN2UJ/NoWo=; b=3xzxkAEDJOQyWZqjb0iqN/xwPE
	WVA0K0hLXF8WXUp84fWfXD3rWKIfSwnLWra3jqrhqcp54aptrnImRRJUzVYGrLpRkdM/Gha7UCwS4
	koKwo8KIcqeoqwvzZNc67VBuKWaUPJe6UMuSdqUsyWNLuKI0f7jDPALyOiCdQpcdyDyOvTHwT0QeY
	zsPOS/1LmZHjCaY6/fbt/Z472yaW1kBB81UNF4rU/oXWd3gNLfBiP3WsWjx9w6W3qH8ScBysHU3zZ
	LJHj9kPd5idYrFbgdoinHQxDvFql86L7cSOx7mP/rDMQd0Y9eivX0UxRNSdH5iWRNECvZobJayD6J
	f/rbeQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XiD-0000000AgtM-1z5M;
	Fri, 04 Apr 2025 03:27:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHm-0000000Ad2r-2bHG;
	Fri, 04 Apr 2025 03:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FF4A614BA;
	Fri,  4 Apr 2025 02:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4003C4CEE3;
	Fri,  4 Apr 2025 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735600;
	bh=jooiBRiLZ5KXTeX7sTZYMvh719V+Qu5vq1GtZM6CWWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g/nOEnzC90yU3P0Hon/50j7bjUU/KNblbpYe76syN5W2QOwwzzoNvatmCdI8LKjVB
	 GXztCu4IL/A0IORZ4wEe5qoYTPu5Pg2qdTI/GADX2IpCtl7Qlq3BQHZO/zX+1p8D+1
	 WWVmMPsdLpyQouxJvuQnVlL4t01jBhIea2T09Usomwxj5PZfFpxRCGDgrurnsztTdB
	 LvDckdMjWvj4seYBkbJOQVVX3OvNQDV+Z/f9IycDIz/I8RnpgnpRFLLS+VkO+vHJ7g
	 W15YUZMzei1FJHwfHbyfxPUCyc1xy9tvhheao1yd31ibmMsHDhN8tRCzytLaIxuI+5
	 QtnT/Tce6b/3w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:35 -0500
Subject: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
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
than what the text said. The references to arm/msm/qcom,saw2.txt and
arm/msm/qcom,kpss-acc.txt are out of date, so just drop them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 82 +++++++++++++++----------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 2e666b2a4dcd..963a9320cba8 100644
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
@@ -378,22 +365,51 @@ properties:
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
+    else:
+      properties:
+        qcom,acc: false
+        qcom,saw: false
 
 required:
   - device_type

-- 
2.47.2


