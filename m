Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0FFC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=; b=i0Nq03biJ8y1MPA6U2ch0Gm2vR
	K0qYLKTCCC32UM3i9jLg9nFY4bPmcjqkmmrK8F+gm6DROTFt4k485MXY6vug7f/GDBN90zMoUTVpV
	fakz6MW4fxI0rIDXC3wqHLb977UV/AfxEw+gqoDxouXP7ppO0o3I4pW6/M5Qhe4Ie4dcLykKnR18o
	AzTDA3HbRo5xOrjVEohxBq6YJ+QMmlCj2WxMlP6bI1NDSA7+aMiep3lDAU8agarfyQYpmnb0JZGQ/
	fArJg96O1QtPNJDyU73HqkxQfZXPuFZGNf71SpansTZzplhtR+4xt2te+P8IqmkXIkGhLX4yTs8gy
	MiIzO0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1V-0000000GKkx-2XsM;
	Mon, 03 Aug 2026 05:15:37 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1R-0000000GKaw-2cr3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:35 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7eb34c17b96so2068795a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734132; x=1786338932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=XKDm1e2l2oLwTWWOXRqmzlrEtbufv8TbghweQ6rY7k+SZHT8gypEjtGflOkh/TVgYU
         vaNCjnLpb/skVua7t/stVvwkXgtJZ0UCxgX2CYo8qmHFaDsFGnhAuPu8JokCC1BePIHa
         3LBd+U4VhwXzZh5n3a8Hv6dgeesRNWvc4Cmi5MrP2BcRBgg0dwn4pizIK4FgLnvWsObU
         2FJulPuf7siopb9BgpQzz4qhlhT1YUAvf6ZCPb05145zsbYR40+k5g2mqY2dzRfr7lcY
         xt+TpPp9TeWNr7Epunm1/sza60UcbbUuZ9fEnDndcL22xVz7K8WcbCSZtsit0+YcTwUh
         spvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734132; x=1786338932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=EJuLOHpKbNAjJZRdp6iOk0foL31SIZOX7O3h8URRIpPyWQNp1uBiJIM+mXfqzrT8Z1
         sDz9TDDsDMxA4TjA1K4UvBf756U+HaN6EtPzeaOv7kWfxUvG7jonClLtt1m9VbY9gdGS
         4pwDOvD/hM/SYR9UYZvio7Gnf8FbhW+6SXY/0pwksuu4+lSRqvkj/P8YfS0CW2sSJX3Z
         Jzyr1x6nNvELK5uUYdFaeYQS509ldKt9T5LtDM0Di3ZFl2Uol7WQJiwi6/Z/CxlZ1Fbj
         d/A8A7JN5tZ697Bo/xWPw6eDw1a1Mv3ipe/FsvASIGpy5z5rTWLETcKt6ikj/O3szAxl
         Ogig==
X-Forwarded-Encrypted: i=1; AHgh+Rpb03YyHWr5jXmu/x/xqKOI0HPlfPR1V77DYsawT+RYRynofQu+NIasY8/nPO/nwU+R39vHfPNGCHiV+Bw3E46u@lists.infradead.org
X-Gm-Message-State: AOJu0YxgRXjgaTE22ExELIUSKwkVttSDIAM8FsPOzbHM2JEPlCwLYQSf
	oz4anAssIyKuhEk1ZvIuAAp4HG2kcPwhSOyhdhtE3xZFITmqFAX5eiCsMSWNNd8p
X-Gm-Gg: AR+sD1249I0rz1iUMNYfJLXnBo8FLNPXzP78qIHRGBX8CNn6b4oyYup6cdpEXDAylJt
	WCeOhCnmn5bRnECZYVxJDcJNY5NY/JnMO2K2tOGhtMNoC9Y8xKMK21ONPhBI4+7YMI1v3oFJmKe
	7j2qbmWiosBhJMGDvx3HeMww1PoynbBP07TPGri+5X8WZErlXqPGQ6vtzIUv+xou1eGIJPm1dp+
	EbYmmKC6ukTrvn2Gr53pXYQ9Xeeeyql8eNf/mVhbehSYh94d7HUecMAXMaV0iZXJKCssqHY+sic
	tBvB1gf2Ak3YmGdTsNeK7wMNV3P6K/rnf1Ab3zyz5ILukoCpiO6V7nehhhesK6zaPt/uRfj+npS
	KaMiy+5jEyYTE0p73QPb+Chp8lYkOT3uzmiiNnIraVdFTM4Rf+14GJ+QvxFhIWTB9bb8Fy1fVY3
	Zl9uUZfZ0sjNRQZ72CbUXy+Fm+y9/CWvCP8FT7kEXCg9fz9RK/7qfShtDwChWxCOEWzFc+yPGv/
	8tuMbiVc8ngNYRNxSlRQ6CWPnqz6FzynpIzKoltG2uozuP5T6qQP/1hkrwzHdAviDAgEQqDpl1d
	xmirYAL43LNPFW1oYyFJZ6gtqdsncoODIIHNIWZuB33Ov349INaAu9ffrX1MulM56n/SGKuIDy5
	lOSzM+R8wvwBL+hBV
X-Received: by 2002:a05:6830:6737:b0:7dc:df37:844b with SMTP id 46e09a7af769-7f196baee6fmr14985696a34.4.1785734132204;
        Sun, 02 Aug 2026 22:15:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:18 -0600
Subject: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221533_731036_6E2B11D6 
X-CRM114-Status: GOOD (  16.74  )
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

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, required function supplies,
the optional SID bandgap calibration cell used by the vendor initialization
sequence, and its optional Ethernet PHY control child. Document the 24 and
27 MHz rates encoded by the public EPHY clock selector.

Also describe the optional open-drain, level-triggered INTB output and the
nested interrupt controller which exposes the TV encoder, Ethernet PHY and
RTC sources. Define the interrupt source numbers for child consumers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 118 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 +++
 2 files changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..017629cca73c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The INTB pin, which is a shared open-drain, level-triggered output for
+      the TV encoder, Ethernet PHY and RTC interrupt sources.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The interrupt number, as defined in
+      include/dt-bindings/mfd/x-powers,ac200.h.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the AC200 bandgap calibration value.
+      The trim is used by the TV encoder; the public AC200 datasheet does not
+      document the corresponding register fields.
+
+  nvmem-cell-names:
+    const: bandgap
+
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+dependencies:
+  interrupts: [ interrupt-controller ]
+  interrupt-controller: [ '#interrupt-cells', interrupts ]
+  '#interrupt-cells': [ interrupt-controller ]
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            nvmem-cells = <&ac200_bandgap>;
+            nvmem-cell-names = "bandgap";
+
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+                phy-mode = "rmii";
+            };
+        };
+    };
+...
diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindings/mfd/x-powers,ac200.h
new file mode 100644
index 000000000000..cc59e2ab4912
--- /dev/null
+++ b/include/dt-bindings/mfd/x-powers,ac200.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Interrupt numbers of the X-Powers AC200 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
+#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
+
+#define AC200_IRQ_TVE			0
+#define AC200_IRQ_EPHY			1
+#define AC200_IRQ_RTC			2
+
+#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */

-- 
2.53.0


