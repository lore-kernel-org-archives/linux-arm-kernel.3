Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EAC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCn4OXt1rKFxWRXj+H4O8yAzMZpo+ImdOMNPkNdHGXo=; b=DeKDnfjPkeTtimEO9JNHv7ZjVO
	ri4lv9QKe+Nw7szufpPTo2h/XZui6q3wHbu2Ck36sCL67QKa5tF9Oj3XsZ+qwhxC/0AAjbhiAWXEE
	E6U5UMuNV1ho12GFwhOzp4bfRKaQ3TYm/KcTakZvytKB204xvXDQLCv3V/SCzE9j9NtPCGChWbwnS
	E8fOGO82qx6TwetBtfjmzG5eUCeyexEwAhuz08vjCkEgoz2KYce7q54wUTLFcNnnX9Sbx6HXaaGLz
	U1pltwkyHJLacRlJtbJgbEAGpb3EIfKgfGICFBIBEclUbTZaPrvmHlqh3ZW5EDvloT05mT7lBzvuS
	5EOxLeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZka-00000006oXN-2KDI;
	Fri, 21 Feb 2025 20:35:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZhV-00000006nqA-20Mw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:32:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so4350239a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169964; x=1740774764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCn4OXt1rKFxWRXj+H4O8yAzMZpo+ImdOMNPkNdHGXo=;
        b=lAIklagFffU2v6eL/mcvu0t9/9oAI1qThHDErT0g3tfnbU2gKfAs1FBGT+8/IeoIy5
         M1MKCLo11NxzQeqdSEgKwmuxQBxdP2g4pcrNrC69cAO0P6FENIjygsyiJuoyyHOMdDU2
         2pn2fKgNCHxGEEPulFNdum1OWsfVayGrS5SYB0i1JYDMjkdQnRm3TOKnXJE42D4RtQSs
         97G3wzAej1b01r2WQqKhmNAx2qPm/UmGjwFQbp7/mdq+Sss1DsSlDrAA5tNlFQKhZ/dV
         wVsmXmWh7ANXNSCfTaep35huGy6jWfEcMh5G7OkhAMLo7y7QPwBLqnyuUX24koqiZjxW
         MSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169964; x=1740774764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCn4OXt1rKFxWRXj+H4O8yAzMZpo+ImdOMNPkNdHGXo=;
        b=h2zD220E+0Q2twUynBwVaW4HdB2KL+24wJRfQDRBmaKI7YDwtA06NNSos35M8ewk+X
         E3DR49NS2kVGsc3ZuYJOht23OZ+d8oDiHBQ8sP018IEXYhxD8dRwZwHUOBHs8cn+Ijn6
         VcpIsKnUq/qgcQhRy9jxqGAPueq6rbauyrpH5vUvC7vQtnXsX+zGSjL+36dMqgb2Mb+Z
         HxcvBCniB2SmJKioJgEzQhJ/6MPY0Lv3NYKHqGXpm6DQ7Pz/ksvTP7aHUpb7FvHYCbQb
         g6NCeuMnNXyVgjSvLyAKZQ1GE08O8sJrLVHogv4zeYHMfsdHUNK66v3h81pfscLpaWCZ
         naBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYsRgZTXOkWh8kwv/ZsUNAENbcHUMahkID+B7+H+b8L/KR4JCMtGVHaCsNq+SnIRQnmdjlRYhwY/gyqB0I15Cd@lists.infradead.org
X-Gm-Message-State: AOJu0YzfK+70wxGnQwZd174scPXDDlZ31t4cuAcFb6UMyoz5tptBiuyI
	Z5iZQZOe8NFZqy30lwvixA15llUrc7JpDjCOkES5hxHCwudTdmIX
X-Gm-Gg: ASbGncsZHDDm2fV6o949m0UrUhp0Xymu79uYdJcQ9rvIskkf/ewZRRZ9WzktvjlZlTV
	roaBYUm1PMFyZyBuKz95NGNZ45Uic3Wp4Omq6mJminIcoHIEhWWNqKQRFH2eiiadL/audHdJ55V
	BIYMUqcpkIlyFPN1NiIqpwfFOLbsh6b3Emk1wz8VhIlJp2vaoRPi+3Vk2YjBneEVJ9oFeL6PnvU
	1MRZBlTnKNSYxc9RoZyD5zyYGxNq6F6Cm7Gbkwsegt0LoZWfGu/wgl5tEHmMvzmBamUrg9s0dQC
	a3Wy4kpwl/loohM87P7PAB2cnBGUNxlBatA0RYgxqs6jyCWq3DGuyUM4YnfvaUS3v7OKkgCz
X-Google-Smtp-Source: AGHT+IFgnLCCi3RErue61glfb6xjxJDZZ92IhClCzKrH/m+jqwqtiTl7Ly7vqMdOKhmkffKjBQuywQ==
X-Received: by 2002:a05:6402:2347:b0:5d0:e563:4475 with SMTP id 4fb4d7f45d1cf-5e0b722c319mr4363564a12.29.1740169963795;
        Fri, 21 Feb 2025 12:32:43 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:42 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:37 +0100
Subject: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=5996;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=LrzKwcuKH+7lMFxFZZvTxrTIVtGnQjlfl1kXpaPq4+8=;
 b=KiP8RteV4d7KyJ/O+JBJXcIu0smkdw/YjWP7kyB9+XWKukjr4V+K0sD4Od+UEIstpKIt1gJ+Z
 qfw1Y0ets6BADhHuoCft0/aZod8vHdFoUefvv+lPlqX9n+Nq//+jI63
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123245_523417_A86CC85E 
X-CRM114-Status: GOOD (  16.43  )
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

Add device tree bindings for the pin controller included in the
BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
both chips use the same driver, but have different pins, and the
BCM21664 has 6 alt modes instead of 4.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Drop "property: true" declarations which had no effect with
  "unevaluatedProperties: false"
- Define property limits for I2C pins only instead of standard pins,
  making the pin-specific "if" condition significantly smaller
---
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..32b7e44e25900b9873790480b04f2feb9e54be02
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm21664-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM21664 pin controller
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm21664-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-grp[0-9]$':
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          pins:
+            description:
+              Specifies the name(s) of one or more pins to be configured by
+              this node.
+            items:
+              enum: [ adcsyn, batrm, bsc1clk, bsc1dat, camcs0, camcs1, clk32k,
+                      clk_cx8, dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk,
+                      dmic0dq, dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
+                      gpio05, gpio06, gpio07, gpio08, gpio09, gpio10, gpio11,
+                      gpio12, gpio13, gpio14, gpio15, gpio16, gpio17, gpio18,
+                      gpio19, gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                      gpio26, gpio27, gpio28, gpio32, gpio33, gpio34, gpio93,
+                      gpio94, gps_calreq, gps_hostreq, gps_pablank, gps_tmark,
+                      icusbdm, icusbdp, lcdcs0, lcdres, lcdscl, lcdsda, lcdte,
+                      mdmgpio00, mdmgpio01, mdmgpio02, mdmgpio03, mdmgpio04,
+                      mdmgpio05, mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck,
+                      mmc0cmd, mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
+                      mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck, mmc1cmd,
+                      mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3, mmc1dat4,
+                      mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst, pc1, pc2, pmbscclk,
+                      pmbscdat, pmuint, resetn, rfst2g_mtsloten3g,
+                      rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
+                      rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1, sddat2,
+                      sddat3, simclk, simdat, simdet, simrst, spi0clk, spi0fss,
+                      spi0rxd, spi0txd, sri_c, sri_d, sri_e, sspck, sspdi,
+                      sspdo, sspsyn, stat1, stat2, swclktck, swdiotms, sysclken,
+                      tdi, tdo, testmode, traceclk, tracedt00, tracedt01,
+                      tracedt02, tracedt03, tracedt04, tracedt05, tracedt06,
+                      tracedt07, tracedt08, tracedt09, tracedt10, tracedt11,
+                      tracedt12, tracedt13, tracedt14, tracedt15, trstb,
+                      txdata3g0, ubctsn, ubrtsn, ubrx, ubtx ]
+
+          function:
+            description:
+              Specifies the pin mux selection.
+            enum: [ alt1, alt2, alt3, alt4, alt5, alt6 ]
+
+          slew-rate:
+            description: |
+              Meaning depends on configured pin mux:
+                bsc*clk/pmbscclk or bsc*dat/pmbscdat:
+                  0: Standard (100 kbps) & Fast (400 kbps) mode
+                  1: Highspeed (3.4 Mbps) mode
+                Otherwise:
+                  0: fast slew rate
+                  1: normal slew rate
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+        required:
+          - pins
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+
+          # Limitations for I2C pins
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum: [ bsc1clk, bsc1dat, gpio16, gpio17, pmbscclk,
+                            pmbscdat ]
+            then:
+              properties:
+                drive-strength: false
+                bias-pull-down: false
+                input-schmitt-enable: false
+                input-schmitt-disable: false
+
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@35004800 {
+      compatible = "brcm,bcm21664-pinctrl";
+      reg = <0x35004800 0x7f0>;
+
+      dev-a-active-pins {
+        /* group node defining 1 standard pin */
+        std-grp0 {
+          pins = "gpio00";
+          function = "alt1";
+          input-schmitt-enable;
+          bias-disable;
+          slew-rate = <1>;
+          drive-strength = <4>;
+        };
+
+        /* group node defining 2 I2C pins */
+        i2c-grp0 {
+          pins = "bsc1clk", "bsc1dat";
+          function = "alt2";
+          bias-pull-up = <720>;
+          input-enable;
+        };
+      };
+    };
+...

-- 
2.48.1


