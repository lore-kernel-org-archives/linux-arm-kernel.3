Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE4D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpmBZJxArqiaRXTii0FbGSEmORT8TKVJ82E7vS3IVPc=; b=TdgH3YQBuI0Ew7nVxJ73ROP+X0
	6EBaBswsdj1BpnwPvWJOzt09R60dKZ2xwH/vxR4ERErEMZALtS9aEd3t7HKXtWV9B/91jYCn3njoW
	SuBs3F8XCHfhsCS4aM5GdLW7CeHd0JrhJCuyQkWdj13kuJ70C96XaA624JIrbYCIptb+JNVKcLNHL
	6BLM1kgWGoG2hZwcX+MLfPCEIhTEZcTmYNjUiLUwHabKa9pxdiQerUfkk5J7RoEARnUX0Y/gMEmVM
	lAiVSKxfgewUgmatiZAng26n4ooVo0wistWEcpfivoIPgdRPaUaaacISTiQ7njrwxaeBBTGFwAUYK
	XLDe4yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91JR-00000006sFP-02Tl;
	Thu, 07 Nov 2024 12:08:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90zR-00000006nl8-01vj;
	Thu, 07 Nov 2024 11:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FpmBZJxArqiaRXTii0FbGSEmORT8TKVJ82E7vS3IVPc=; b=n45/p8vqMvm1ybdc/RTekrkaMc
	Dp3MeS8HOLWB5+vj/IxKfaf4e5TXbzXgOzIpphtDulTcSbsHdStHnSFDLuvghS45kqYQ1FG7K25kI
	5Ufjqm+MH5feQIezD1EytnxPw7lD4G64o4R6PVhK1g0hxJUW/aJHfQvgbl3/39fPXd5K09+f5/Yl2
	wyYsyhV8qO3l2oNl4GCee6e0lWqrb7dpkbos4urSthPF6tIwz1TmM4zlWzby4JffeECCURpvuiREJ
	dSfb5S2V16PQBdX8WdGozSc8yUThJe3+a41EvkayQp6HQFKJxxGV3fGyax337IiRd5RnqqHLgE3nW
	LEPvRShw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t90z0-0005lF-Dl; Thu, 07 Nov 2024 12:47:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jikos@kernel.org,
	jic23@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	heiko@sntech.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 3/9] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
Date: Thu,  7 Nov 2024 12:47:06 +0100
Message-ID: <20241107114712.538976-4-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107114712.538976-1-heiko@sntech.de>
References: <20241107114712.538976-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_034753_071299_338EA9A5 
X-CRM114-Status: GOOD (  15.43  )
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

These MCUs can be found in network attached storage devices made by QNAP.
They are connected to a serial port of the host device and provide
functionality like LEDs, power-control and temperature monitoring.

LEDs, buttons, etc are all elements of the MCU firmware itself, so don't
need devicetree input, though the fan gets its cooling settings from
a fan-0 subnode.

A binding for the LEDs for setting the linux-default-trigger may come
later, once all the LEDs are understood and ATA controllers actually
can address individual port-LEDs, but are really optional.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/mfd/qnap,ts433-mcu.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
new file mode 100644
index 000000000000..877078ac172f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qnap,ts433-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QNAP NAS on-board Microcontroller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  QNAP embeds a microcontroller on their NAS devices adding system feature
+  as PWM Fan control, additional LEDs, power button status and more.
+
+properties:
+  compatible:
+    enum:
+      - qnap,ts433-mcu
+
+patternProperties:
+  "^fan-[0-9]+$":
+    $ref: /schemas/hwmon/fan-common.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    uart {
+      mcu {
+        compatible = "qnap,ts433-mcu";
+
+        fan-0 {
+          #cooling-cells = <2>;
+          cooling-levels = <0 64 89 128 166 204 221 238>;
+        };
+      };
+    };
-- 
2.45.2


