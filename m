Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3DFC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZV1Sc87tN2wDyrr8w4U/T//Mq5MgKYTQng7EZoAkc0=; b=KuukAihgZax3G3hCkCym5+WNfG
	0vGhqBF5QLHkOnV2tj6gKO4F5HmMCrntNVRFHeD5t8q7227sr2hlRqBDNWZAxNjDOQ5EAfbrOxRvK
	M+A7u9D+GuHDjuqCmPmRyJdyLtir2Mt4AdtX0J7UW6PxwYD/zmFc4T+FY0UExYNl0G1ESYy9KdQJX
	m0dhL+PzITdE7fvz5UBCaXMzVZ0t7fFIbFUtOjf5uK1aa408T28oJFbvJeNHyqqTxE0Fm7uWw9wwO
	n3/ePXOFRgG1v09c3jLMbcmfhLSGmelX0Fu1rNlk8z8Utbxf7wjV5znaTaTw1GleYgDxzC8EPqKud
	X218OaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCrW-00000002IrJ-47pg;
	Mon, 03 Mar 2025 20:58:06 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCoP-00000002HtE-2FUz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:54:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso5376112a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035292; x=1741640092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZV1Sc87tN2wDyrr8w4U/T//Mq5MgKYTQng7EZoAkc0=;
        b=TSnnSKZORoczVYvAz44KaeFsNnYg45uT07cw58TCw4IYdqDMydhXXshqMvir0nnYWc
         nscONqR9LLglvhhL9NBelSUSAjU6Xv8qw6LQTDCOXMY3+9bToKECKbxX1YhXyLDkgjuu
         zgKEYVSZfP8MEwK1B8HswPbivIPqJIErN+0kFf7Y1oc5F5o6itqhyjf2OHVpdnQxgHFm
         eT+pGhJH9cjVPfGpg3qtjZPhp+taB2ZvXvGyYg8um77VqvM0QUwdbL/ocVadjYh+Wz63
         Nl2EBAvU4khHPmLnOCA1B2OyLiLuI6L2bmgjoFIx1fg7JYHD+McIpMoH3TTSW4qpWa91
         No0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035292; x=1741640092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZV1Sc87tN2wDyrr8w4U/T//Mq5MgKYTQng7EZoAkc0=;
        b=O/u9zhQft4sKSlcdFWD7etOkrwokBGEt7y+SUaLPRVOFOenbitmvYFR6NT7H8GYTYp
         KOEiA5pKpeuLk8FUNYpdZZUXA1jhEUHpJ0NHS9gmVfff55RwCXL1/YWZyPm8X5osaeYo
         AfzYDSTNgxExfPrsBwnwT9X0geD+fpwebWivz2BH4pA7PY8FVk9T14mPO4mJiRBz2z9s
         Pt59vlKvKsh7VPvyTUNfiazBvc33esUhkrYWhpyAlPEKpGrhYLjYaTutD7danf2WB4eQ
         P4zLdfPDmng6EEzxvkL5R/uYFV4qNOpK1wGZ1FpBEawiNPAr8L64TTV5ajwTfISXqJn8
         XSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnqAqLg9HOcJnWzl1JP69kX+yKm+lYECi4dzQhZnG797XkugTGSsvswohY/XRruM1ZzLZp0WfB2XVra4ss68D9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2cfGXfusdrpPPsRp4ROMIjVzVC7HT/aUl3KhW/BP5cn3CppPI
	yEb6zbvr5YKA0TZtJx6OLaxTybbQ5ZxUg1L0l1c60tgIIgEyJ69x
X-Gm-Gg: ASbGncvR3gbKAIHIBdEZ+bfEidedBy8YmwEvu3sGIy1TLPzi8Zvnuz0awT0PqOkeXms
	JmnU63CQYXQVo/fYx00VBXBcrTH2+s86NAtyrtXG6Ic+J2GzPcFUv4XojSzsAZC+MC3hGdFknPj
	gEtZ6oAowhijUE+/PPnZhsam4OdxR3WixBBE9xbdCbi7TquvTCO+TGSMfQ5cItmK6AR0s5qzUxm
	uWDlTRpXBEkAcTO6LcvG04VKQNi75OaCpTCVusiXlGTk326jpYM/lhcD4Da3LAZABnS11mdW/p8
	uzFp3pNH8UFheN2xJPq0NqtloMHGyPMFAtLiTCQqb/lgWteHStabvCxX2il4vLDYLL//MQxcnZ8
	M6C+AQTf03L8FJCA=
X-Google-Smtp-Source: AGHT+IGedzWpJHscXDurL0luKHIRErVaMIRyvQlt37dMb33nm68RFWM49rbp21MYUquB+KF60dDgvQ==
X-Received: by 2002:a17:907:980b:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac1ddaa727dmr411554866b.0.1741035291599;
        Mon, 03 Mar 2025 12:54:51 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:46 +0100
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=6571;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8sKAqg+gUGLkXLgSLhywcAHvI/uGgduy0VUSsfjhpPY=;
 b=imKoJZCCIN7s1kZiwY9VlOY0d9ZlxhC6MACJCLE2gCmKzCX2GXxfgYRnel7ZOuOnhTjcPCCNF
 z1t9uCgq/NzB6H4uKSEdbnRTpaqlkqmFL+/tHohNVoKOqO26WCNCHn0
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125453_582368_A7A0C3E0 
X-CRM114-Status: GOOD (  17.05  )
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
Changes in v3:
- Fix example for I2C pins
- Specify bias-pull-up/bias-pull-down as a boolean
- Add gpio16/gpio17 to list of I2C pins in slew-rate description
- Use additionalProperties: false on pin group and specify valid
  properties for more strict checking

Changes in v2:
- Drop "property: true" declarations which had no effect with
  "unevaluatedProperties: false"
- Define property limits for I2C pins only instead of standard pins,
  making the pin-specific "if" condition significantly smaller
---
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1283a588416d406e6ca5add012cbaa569ef355ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -0,0 +1,152 @@
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
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          slew-rate:
+            description: |
+              Meaning depends on configured pin mux:
+                bsc*clk/pmbscclk or bsc*dat/pmbscdat or gpio16/gpio17:
+                  0: Standard (100 kbps) & Fast (400 kbps) mode
+                  1: Highspeed (3.4 Mbps) mode
+                Otherwise:
+                  0: fast slew rate
+                  1: normal slew rate
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+          input-enable: true
+          input-disable: true
+
+          input-schmitt-enable: true
+          input-schmitt-disable: true
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+        allOf:
+          - $ref: pincfg-node.yaml#
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
+          bias-pull-up;
+          input-enable;
+        };
+      };
+    };
+...

-- 
2.48.1


