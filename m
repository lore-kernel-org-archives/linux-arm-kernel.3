Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB14CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=; b=SV4p7qgWkagz0kFGnw2cqaV9dW
	UHLILAbL586y+3lfVaw0zw4G59tPEQ3Sf2bb/mWCzM2xOahZ+X1W6lAviPA1FsGJ1u2zkKqgLMK51
	YJq0/bZ4GK8UeQgaw23Tgxai6mULF43aQnYPAVDJMXkhrDsxvYBqI+6xMROoFnAm6D5vQBv75KfUr
	WZ2KKjpUJNTvW232cWaxxezaKm7yBK5RWmJuq4F6+KBkbm/y8Pxcq2SGePtNVYtghXbE0FhCUn9l9
	1oYQsJS+QvQQoBOCAza7Irvd0n+QyZyFaLySulUM7h4zkePUnohGZHpn5KQswz05OGUNMx9HmCt1t
	hWsYih+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4r-0000000Csmb-3MW6;
	Tue, 13 Oct 2026 12:57:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4j-0000000Csib-46Z0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:57:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2e6df2742cso445105766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896268; x=1792501068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=lVSwNbSQgTSU+qLDavbs41xxJLQOieShljGQbpTGKfhN7DvKVMDtlvu0klEVfmC6op
         eECIEBJ9oL99DcM0vEiQk68kPbaPnCc4CgXSbXIz6E4eL9qrOlybZlC5EO9APTM6oXQl
         HKFQOaqHO+TB7Ds9UBndYe5X4ICKkOMY2WXEyUW8kbXTKDyTD9wNMXQqD7Umd49jur5x
         ajR+hkTQnOPm0mer36xAX8jNlCHouIo8Ebd6AJzKO9WGD5lpKXxgb6TUd9951oUgOqjs
         S+A4rX+cX7jSZVDXlf+/aBF4P4WzPlsEbWWCGPczdYhVriJa9zG5ddEgLUhcwJQyy/3M
         gASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896268; x=1792501068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhznKuYnN5ZlVlaqPy/qLcJWMqnPhwIquwlakdmcYyI=;
        b=ASe2xgRZ9LQH20NcpxoPAPwqwf47nIcmE/20NDwcD3podzSO9PuxGlv0lGBzMvfLGY
         V3kmZGOU5MwtH2VAPv6zV12D+ADWC2hfK6CO7fWcbgtxz0E/BhT+wy+vV4u9/yp0AXAA
         z+Mc/eBgar+6QPdkKN7Jw4MuhjcAMXwQtkKd3MUmM8YM4RYTABgpRr9gG5Fey5E3+FrP
         eCvlllRUTRpfFnxbX01Ikib5MEWi15ls1sa7118fdoN6ilboEyHMYu5a3i5BXXqhLIbZ
         rD1i6qXpiWRfdgyXbsIMWK2LtKeZt0hX3CUwVQppkYREvK2ty5T9Jos4IyrILLd80lub
         mzhA==
X-Forwarded-Encrypted: i=1; AKwUvBwuAiNbBYpwFkR3QTcVJu1H2j3YI12UnzTO/HEj40WU521Trb4kabQz/NgZvvCF98gGqAXNoxF9wTMyVakP6c3C@lists.infradead.org
X-Gm-Message-State: AFq9FYKD+Sf2c1cMPzJem5BINa8Efp52okI3O0P9tRi5lM8pCgRKy63/
	bOMcAHfJbUAZpymkoRDs9hB7FofEUXbpQo3uUT1x6J7IahxqLjdbNpisyEdsdrYKSYg=
X-Gm-Gg: AYBFou097lql+pIQmiqiLLVqKZ4rAnc6I1ELIZtrafFxNhy3CFpRUaf7bO02V2OiMnT
	p6Gj+S4i6Sci9J0ECvO89EnmFp1pYzYjVphu0PrGxFCUFqUfUnQzNRX58DvpVpFP3Pg1rY/kB8I
	dd4lmuxsKpAEmbFzSqXQv9EPGCWqK8SgCEnwzvmtfthN+VILbqtW4QmYFcLFKBcLA/y9g8QAMp1
	AuQWowpMIYbL8s06uT45MwMsSEdQ1GZhPYwPr7HwZsEoG07sEymAHPIMVrMTUle0bQdnfShkU+8
	yM3fmsdYT7x/oYD8iUFaWzzE2vYCSiNncM5tCx8ZtBS5fXWxHftUcGsHjZGPvwScuc64JV6qjjK
	urVMuyos+HMxqGmDa/FEzVtvHpauuR4FEevBMpbveULAdlRe99a2E3CQQhG5MaJv+Qro/OaEnLh
	IdX7MoOlijZ/44jetMPSr5OMArFPbQVM27cS0scndQxZkhs/a2Dd/aMBRQR8vxU/EaCmybtiHNI
	ilQCbAQDVCoYVbcl+gZWR8/J2X44xm5M/dEc/Nqb9MvSBqGfHYfSjkTyuuMFYS/ME5VsqZBlHus
	8z8w/uQk3HXrs0l9Wg54vbWcBhnSY3I=
X-Received: by 2002:a17:906:e114:20b0:c33:62c0:d8cf with SMTP id a640c23a62f3a-c3362c15642mr504101666b.13.1791896268023;
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
Date: Tue, 13 Oct 2026 14:56:25 +0200
Message-ID: <20261013125735.1542349-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055750_852902_C105B44F 
X-CRM114-Status: GOOD (  11.77  )
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

LAN969x integrates a PWM fan controller with a tachometer input in
addition to the Sparx5-compatible temperature sensor. Add a LAN969x
hardware-monitor compatible and describe the second register region.

Describe the fan as a child node using a two-cell PWM specifier for the
period and standard polarity flags. The child also carries the optional
tachometer pulses-per-revolution and thermal cooling properties.

Keep the existing microchip,lan9691-temp compatible for device tree ABI
compatibility.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 611fcadb1e771..e91c2a3ccd3c9 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -4,13 +4,15 @@
 $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip Sparx5 Temperature Monitor
+title: Microchip Sparx5 Hardware Monitor
 
 maintainers:
   - Lars Povlsen <lars.povlsen@microchip.com>
 
 description: |
-  Microchip Sparx5 embedded temperature monitor
+  Microchip Sparx5 temperature monitor with a fan controller on LAN969x.
+  The fan child's pwms property references this node to specify the
+  PWM period and polarity.
 
 properties:
   compatible:
@@ -18,11 +20,19 @@ properties:
       - const: microchip,sparx5-temp
       - items:
           - enum:
+              - microchip,lan9691-hwmon
               - microchip,lan9691-temp
           - const: microchip,sparx5-temp
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: temp
+      - const: fan
 
   clocks:
     items:
@@ -31,11 +41,67 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
 required:
   - compatible
   - reg
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,lan9691-hwmon
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+      required:
+        - '#pwm-cells'
+        - reg-names
+    else:
+      properties:
+        '#pwm-cells': false
+        fan: false
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
@@ -46,3 +112,21 @@ examples:
         #thermal-sensor-cells = <0>;
         clocks = <&sys_clk>;
     };
+
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    hwmon: hwmon@e2020100 {
+        compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+        reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+        reg-names = "temp", "fan";
+        #pwm-cells = <2>;
+        #thermal-sensor-cells = <0>;
+        clocks = <&sys_clk>;
+
+        fan {
+            pwms = <&hwmon 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0


