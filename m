Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA83C54754
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FmmGTT7/kkpo68LJtWYV6x4TUVBTBuFVK+exAKFKeg=; b=toMd38T6O1+W73bTkQhCOgMmit
	1AvndSV5dy7QbrNe6ak1YVpfSgWosakX3gk9SGC5x7TBfu1JC3Qn4X8WG8YgzojTVhSUwvmaEU900
	M/u0eCS9AoLKE0nk0JjwdfnW3eJHWxt2rhIW6FJZR1ObgPTBME2yFSr4+3G/T1uebGUP0H6F3gmG/
	jrHgYRW32D49lSTI2QeYcEL8X5LHUYxHu3kiLgHWIfd4fUAoUIJzU7UoMWV0NpMk6JxUXt7IKAbE5
	czZp5hna8ICvMCOVgkJNaDUFlL3inRRM37PsHH9Y9M3IK2CHA5mzHnceVIoJoiZ5eCneVehmk79zd
	ggTVMZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD4u-0000000BNDk-0irC;
	Tue, 20 May 2025 02:51:40 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHD2M-0000000BMiy-3uaV;
	Tue, 20 May 2025 02:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709279;
	bh=0FmmGTT7/kkpo68LJtWYV6x4TUVBTBuFVK+exAKFKeg=;
	h=From:To:Subject:Date:Message-Id;
	b=hZILU21vfhR4lSohELg9hcdh+ySZFFlZfht9yoouDIvJIZEi/FW7eK62x2M3FElTm
	 9pqko348SaHwIgHF++oc4o+BAywLb+YEd7T3RAoGHaLF3jI90kIl4LKpaNFWKkNQDu
	 KuPvxo3g1ou/9w9Ikk9bDyT927mmOQscjEeDQ7Z4=
X-QQ-mid: zesmtpgz1t1747709277t3ccaccd6
X-QQ-Originating-IP: WX5ZmZyYWICN6Vqork4Xt6+hfJpYFO7s+3xRsU6gpoA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15235635931531597864
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Tue, 20 May 2025 10:47:18 +0800
Message-Id: <20250520024718.142-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250520024718.142-1-kernel@airkyi.com>
References: <20250520024718.142-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MB5+LsFw85NozL2HVEmoswXUY6YRhBzAM6fZxWee0X7zsCwlLOjQuetM
	g+j+fQaWABw8/+vpJsUDBaS1nq8XGKsUFBG0EDPS8hBlrmRAt3bUxgXQ+w79uM2kTd+EIt3
	mzSxyOBsgfxdUAQxt+/nvd+w4RdFd+LiRVnFamQVuCTAJ6bUAZZItC87EkVXgvlfeuYqrPv
	dKKfCutKWuwcylLOr1rrk++rhne2nol54iiKp78RPtKhKLD5pGKNclv8dH3V/fqZ4cQrZob
	9qpuhfAMkQi3Md7y7QF3KVxpYDUd0ulV+O1Z4zO2XFVCyjr19wtdlx3rbEHYFjOdwFDO2vJ
	rJ47AXo8GB1v4jJrg9Bf9PBYe9FqjY7EIOwGKEW3fjlXxTpKr9Fns+UqTUon/n3+5aRoUYa
	Z/DXM7YJA91qDRp0OP48gUwdqBoqoP5ul+GHYdO/egqhZzgmW4ncuHqVPU87C3rZEAf7+VR
	TUtNnrEL1YBE/6bO7Gg2+0gE4xqDsbY3XEuFT8jTc1j6iodrgnT6Dqqa1ox9cBB7ntG8uxh
	ySbi2EYTwsKDL1ne7z59GLRofxbrFsGN3hDexM/SuIEuT4cPGVYiUCPVCpKQanUqRqvjub+
	v3qkT7eitKyZHM7nVZp0XchhntJA+7Ayb2nEVLPPxHpav8u8pK5PfpMY1kxWTA8JBmNNHMP
	82VZo1q8WA0r/XJRWbil/9VTpLtLZfNBH6Me+WdfaXOZ70OiXioWbWPkxRkRniNQ10oHpAV
	qEmbEHT/E2zPUlDrUgWN+EJSnXtE35d7wS9YoprMdDX55RDoqDWYzqj754R268YECkLQVGA
	vPnvajd+cutcVpjbqvsbZMrTB7lkPZLgQirWbaj6No2kWnv4EqoEvj3e5K25J6u5hXRYQpp
	osaDAIldXpqDSUCkk7rgMI2al9YBEMTGiuvLjqMvojEfKvJJcTazRgg+9x9AZtxCvvKN4H4
	+ZcBVHOSWjgxBWQIr4tlV0T3TNCzbx2RedSmZGqS+Y7h+gaY3sslUTllbihSHIF7LE2FILw
	/FxHhaLckJixyD3n26
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_194903_354623_830A9FAC 
X-CRM114-Status: GOOD (  24.00  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Add new "port@1" property which represents the CDN DP output to keep
the same style as the other display interfaces.

This patch also changes the constraints for "phys" and "extcon". For
the original binding, only one phy and the corresponding extcon can
be specified. In the new binding, one or two phys can be specified.
Since the RK3399 has two DP-USB PHYs, specifying one allows output
via the corresponding PHY, while specifying two lets the driver
choose one PHY for output. This rule also applies to extcon, which
provides the cable state for the corresponding PHY.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v5:
- Fix constraints on extcon and phys
- Add commit about changes to extcon and phys
- Add "#sound-dai-cells" to required properties

Changes in v4:
- Add commit about port@1 node

Changes in v3:
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 168 ++++++++++++++++++
 2 files changed, 168 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
deleted file mode 100644
index 8df7d2e393d6..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Rockchip RK3399 specific extensions to the cdn Display Port
-================================
-
-Required properties:
-- compatible: must be "rockchip,rk3399-cdn-dp"
-
-- reg: physical base address of the controller and length
-
-- clocks: from common clock binding: handle to dp clock.
-
-- clock-names: from common clock binding:
-	       Required elements: "core-clk" "pclk" "spdif" "grf"
-
-- resets : a list of phandle + reset specifier pairs
-- reset-names : string of reset names
-		Required elements: "apb", "core", "dptx", "spdif"
-- power-domains : power-domain property defined with a phandle
-		  to respective power domain.
-- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
-- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
-
-- rockchip,grf: this soc should set GRF regs, so need get grf here.
-
-- ports: contain a port nodes with endpoint definitions as defined in
-	 Documentation/devicetree/bindings/media/video-interfaces.txt.
-	 contained 2 endpoints, connecting to the output of vop.
-
-- phys: from general PHY binding: the phandle for the PHY device.
-
-- extcon: extcon specifier for the Power Delivery
-
-- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
-
--------------------------------------------------------------------------------
-
-Example:
-	cdn_dp: dp@fec00000 {
-		compatible = "rockchip,rk3399-cdn-dp";
-		reg = <0x0 0xfec00000 0x0 0x100000>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
-			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
-		clock-names = "core-clk", "pclk", "spdif", "grf";
-		assigned-clocks = <&cru SCLK_DP_CORE>;
-		assigned-clock-rates = <100000000>;
-		power-domains = <&power RK3399_PD_HDCP>;
-		phys = <&tcphy0_dp>, <&tcphy1_dp>;
-		resets = <&cru SRST_DPTX_SPDIF_REC>;
-		reset-names = "spdif";
-		extcon = <&fusb0>, <&fusb1>;
-		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#sound-dai-cells = <1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			dp_in: port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				dp_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_dp>;
-				};
-
-				dp_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_dp>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
new file mode 100644
index 000000000000..5649e008f14a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3399 specific extensions to the CDN Display Port
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chip.com>
+  - Heiko Stuebner <heiko@sntech.de>
+  - Sandy Huang <hjc@rock-chips.com>
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DP core work clock
+      - description: APB clock
+      - description: SPDIF interface clock
+      - description: GRF clock
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    items:
+      - description: Extcon device providing the cable state for DP PHY device 0
+      - description: Extcon device providing the cable state for DP PHY device 1
+    description:
+      List of phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    items:
+      - description: DP output to the DP PHY device 0
+      - description: DP output to the DP PHY deivce 1
+    description: |
+      List of phandle to the PHY device for DP output.
+      RK3399 have two DP-USB PHY, specifying one PHY which want to use,
+      or specify two PHYs here to let the driver determine which PHY to use.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input of the CDN DP
+        properties:
+          endpoint@0:
+            description: Connection to the VOPB
+          endpoint@1:
+            description: Connection to the VOPL
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: spdif
+      - const: dptx
+      - const: apb
+      - const: core
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF register to control HPD.
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - ports
+  - resets
+  - reset-names
+  - rockchip,grf
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dp@fec00000 {
+            compatible = "rockchip,rk3399-cdn-dp";
+            reg = <0x0 0xfec00000 0x0 0x100000>;
+            assigned-clocks = <&cru SCLK_DP_CORE>;
+            assigned-clock-rates = <100000000>;
+            interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                    <&cru PCLK_VIO_GRF>;
+            clock-names = "core-clk", "pclk", "spdif", "grf";
+            power-domains = <&power RK3399_PD_HDCP>;
+            phys = <&tcphy0_dp>, <&tcphy1_dp>;
+            resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                    <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+            reset-names = "spdif", "dptx", "apb", "core";
+            rockchip,grf = <&grf>;
+            #sound-dai-cells = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in: port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    dp_in_vopb: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&vopb_out_dp>;
+                    };
+
+                    dp_in_vopl: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&vopl_out_dp>;
+                    };
+                };
+
+                dp_out: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+    };
--
2.49.0


