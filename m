Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159D60A380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CWEYltqA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lidLQDv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tjpx55+rYmQrZee75S99QU/G6ELfE3KEh3K+C+Cq1KE=; b=CWEYltqA2/FBlt
	V1onNm0pzSrHEEb1n3LnLRYkKDONS4C6nWKPW8KyptJy7pT8QiS+ywVhiKSh1/kq2r3+zh+W/IfM3
	04Tc1ymrdePxEBlj2+85tpv4M2IJfhk56rs+z3B0Tz7dF4GNuiMbjKq8GPOnetkuOXJZYHGpRTILj
	s0Y5jB0Z7/zatzy+eHXxEO2xYzbJllPDzOXs97BmOBOEbi7GlV/mCkLjgWtIZSfUrWp9ffGLDH52C
	LPloegN/SXSPntSwgnfYQ/YDatWahymCT7dmc2zUJA3/AK4Cbpkh7pFIbk8bpRHmgteH+P99TIaJf
	Sxfcgk4ebBjYlyd26c/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEk-00000005C0x-2tAp;
	Tue, 27 Oct 2026 15:37:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEW-00000005BkB-3xn9;
	Tue, 27 Oct 2026 15:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF3A43F72;
	Tue, 27 Oct 2026 15:37:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115424;
	b=vx2/hKZbWoPVNlg0/wDtmlgNvECPOxEpux9kU4NwQ1BT9l0UErCzrm9v9BJxNBzWcCU1
	 EBX2BTgNIU1d/lKn2oXgrudMC3T7Dqm2/hNhlk2O4FoKiNWg2ASO+8pzIr+kPjxhi/SOB
	 IF0LEZm33rwYfG95ZpzDy9SvUAaturKZ3EsjNEzJjwKNovB02F3D/kkLamOkQtp+M1gym
	 P7DlQX2KaqIDj9+tNPLVC6uTOD8tZkv6tkx2NxnjPclqEllkPmUBSdEJLXlEt84Kj6IAY
	 NriVXgH4OWc1goJKV1a2rDtMItRo6Lxku+u7R1/Jvn6hwf0Rifri7TwXBYEW8zz6x8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115424;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Tjpx55+rYmQrZee75S99QU/G6ELfE3KEh3K+C+Cq1KE=;
	b=bChtuN3GnI6FdibYjoAatL9UZo+Q6/xG7FiL9Eds9lH62wM7c8sbceh+P8y4+b8PbcL+
	 1FBu3vCfx4hKuCvbkCz/YM8xSW5eBNKvR2DqWMalPTiKH1o0RBK/MOkpjDHRwO/G/iQLW
	 cP27iIpk0MEopBgkY89sEylUlaz/ubvSBJqPrX0iPW8L777oIkrwJB1MSs7xq3LDp/mXE
	 Kc1I6M+Us3pjmg9jkOA5DHgTquc5ynGGTfmYIO4YpjEjLqTVMU6aVu+K/IgxX3iHQqx7e
	 EeBbPxctkL7N8IeLycvs/WS1wlVLxjCkwOMgN9S95397TsXLfFU9oLKWvA8AAo9FfUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EA801F031E3;
	Tue, 27 Oct 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115424;
	bh=Tjpx55+rYmQrZee75S99QU/G6ELfE3KEh3K+C+Cq1KE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lidLQDv6ZMvWdWJWVZBDpOL45P+lc5XFnYhpB1r6zG2ru+AzMd4J5+hR9l+r9WpCZ
	 apQC8dWctuozrCqczs+Ns146rG25QN1oYlSIePQj68vo7V3OkhKrrvelSvpPNRTNsi
	 I02xT/3uhR7sNry902JSlToN+n+luCjow9lkLY3uQkHKW2SYgxut3BCUoZuYjDSQ0R
	 +Z7wXFP4yJjvFpslj+29cE5OkmElzJ52pHmcLrdMIk2E+NIMVMjrEsGlEbaFAM8HxS
	 4MLU6agTQuHPBNV/OqhVw28aV3PnGV3gaZzMOAb3KqngWOoQCseJ5gIN6+v9Tt5GP+
	 eEkEKsFzqCUBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E2B54514F;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:36:57 +0800
Subject: [PATCH RFC 06/18] dt-bindings: pinctrl: add Zhihe A210 pin
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-a210-scmi-v1-6-74d58ce85bd8@iscas.ac.cn>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=7071;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=+HQ9Gyt17/JR/JkuvvwD1AdF5rq35H+h461T0R5mLzk=;
 b=w5SsvrC+wEa3S4CrWDrRgWzw9IwDQJKmbK5lHXD6twnCMCnTWbL8YuJOgLuovxp2x9O3Y24CB
 5dr9FFpXz05CcLOdrwqJQLBCaKdCE38oZKvNwaXCYS7yFivGPsSH0n8
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add bindings for the four A210 pad controllers. Describe the shared
PERI3 SDIO mux, the per-pad bias controls and the optional pad
controller reset.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       | 211 +++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
new file mode 100644
index 000000000000..ae8eebbb0be2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/zhihe,a210-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZhiHe A210 pin controller
+
+maintainers:
+  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+
+description: |
+  Pinmux and pinconf controller of the ZhiHe A210 RISC-V SoC.
+
+  The pads of the A210 are split into four groups, each managed by its
+  own pad controller with a separate register range:
+
+    AON pad controller     -> zhihe,a210-aon-pinctrl
+    PADCTRL0 (peripheral1) -> zhihe,a210-peri1-pinctrl
+    PADCTRL1 (peripheral2) -> zhihe,a210-peri2-pinctrl
+    PADCTRL2 (peripheral3) -> zhihe,a210-peri3-pinctrl
+
+  Each pad can be muxed individually to up to 8 different functions,
+  though for most pads only a few of those configurations are valid.
+  A few pads in the AON group do not support muxing or configuration
+  at all.
+
+  AON, PERI1 and PERI2 pads support configurable drive strength, bias,
+  input enable, Schmitt trigger and slew rate. PERI3 has a separate pad
+  layout: its six dedicated SDIO pads, named SDIO_CLK, SDIO_CMD and
+  SDIO_DAT0..3 in the SoC pin list, share one mux bit that selects SDIO or
+  GPIO4 for all of them. Select their function with the "sdio" group.
+  Per-pad bias can be configured independently.
+
+properties:
+  compatible:
+    enum:
+      - zhihe,a210-aon-pinctrl
+      - zhihe,a210-peri1-pinctrl
+      - zhihe,a210-peri2-pinctrl
+      - zhihe,a210-peri3-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+
+    description:
+      A pinmux group referenced by a consumer's pinctrl phandle. It
+      contains one subnode per set of pads sharing the same pinmux and
+      pinconf settings.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        description:
+          A pinctrl node describing the pinmux and pinconf settings of
+          one or more pads.
+
+        properties:
+          pins:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
+            description: List of pads that properties in the node apply to.
+
+          groups:
+            items:
+              - const: sdio
+
+          function:
+            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/function
+            enum: [ aouart, aouart_ir, aogpio0, aogpio1, aoi2c0, aoi2c1,
+                    aospi, jtag, reset, por, pmic, dvs, uart0, uart1,
+                    uart2, uart3, uart4, uart5, uart6, uart7, uart8,
+                    uart9, uart0_ir, uart1_ir, uart2_ir, uart3_ir,
+                    uart4_ir, uart5_ir, uart6_ir, uart7_ir, uart8_ir,
+                    uart9_ir, gpio0, gpio1, gpio2, gpio3, gpio4, gmac0,
+                    gmac1, spi0, spi1, qspi0, qspi1, pwm0, pwm1, pwm2,
+                    can0, can1, can2, i2s0, i2s1, i2s2, i2s3, i2c0, i2c1,
+                    i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c7_smb, sdio,
+                    isp0, dptx, usb31, sata_p0, sata_p1, hdmi, zmac,
+                    bsel, dbgm, cdbg, pdm, tdm, pcie_x1, pcie_x4,
+                    sen_vclk ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23,
+                    25 ]
+            description: Drive strength in mA.
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+        oneOf:
+          - required: [pins]
+          - required: [groups]
+
+        additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: zhihe,a210-peri3-pinctrl
+    then:
+      patternProperties:
+        '-[0-9]+$':
+          patternProperties:
+            '-pins$':
+              properties:
+                pins:
+                  items:
+                    enum: [SDIO_CLK, SDIO_CMD, SDIO_DAT0, SDIO_DAT1,
+                           SDIO_DAT2, SDIO_DAT3]
+                function:
+                  enum: [sdio, gpio4]
+                drive-strength: false
+                input-enable: false
+                input-disable: false
+                input-schmitt-enable: false
+                input-schmitt-disable: false
+                slew-rate: false
+              if:
+                required: [function]
+              then:
+                required: [groups]
+    else:
+      patternProperties:
+        '-[0-9]+$':
+          patternProperties:
+            '-pins$':
+              properties:
+                groups: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@2026000 {
+        compatible = "zhihe,a210-peri1-pinctrl";
+        reg = <0x2026000 0x1000>;
+        clocks = <&clk 0>;
+        clock-names = "pclk";
+
+        gmac0-0 {
+            gmac0-pins {
+                pins = "GPIO0_0", "GPIO0_12";
+                function = "gmac0";
+                bias-disable;
+                drive-strength = <13>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+  - |
+    pinctrl@542000 {
+        compatible = "zhihe,a210-peri3-pinctrl";
+        reg = <0x542000 0x1000>;
+        clocks = <&clk 0>;
+        clock-names = "pclk";
+
+        sdio-0 {
+            cmd-data-pins {
+                pins = "SDIO_CMD", "SDIO_DAT0", "SDIO_DAT1",
+                       "SDIO_DAT2", "SDIO_DAT3";
+                bias-pull-up;
+            };
+
+            sdio-pins {
+                groups = "sdio";
+                function = "sdio";
+            };
+        };
+    };

-- 
2.55.0



