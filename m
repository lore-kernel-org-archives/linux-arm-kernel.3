Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54CCD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=; b=noGX+NDs4y799wLzzYf6/uUEr6
	uvZKPgdFfCK0KASYI3CadoM5NoVw4jmdn+xKDHQ7aU8sUikY5k8faS1LrDzm9Xpa77M0cvH2++XAb
	ybOWXTEotlK2mFqzuXU9Y/q96rLwCnUyyqkt4bQqssIz2SsbzObpUNC0TH92zlz+fnyhLCXfKmUsg
	B3CMcMC6u3SpYze7s01ZOkW/dIoTRfHaoAnbRWBAIFrbhzY8zaWqxAEvadeTRhxuaPOGgXRLuefrx
	ranvNcMyA2gMxGNWXsRpa6W+5x3hfpt3gYyVljYzwIOaJaZHXJRcRxXeljHrmA7ZXo3yoP5J/dhJo
	Pc6zjcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52E-00000003NUO-1g1R;
	Mon, 15 Dec 2025 09:38:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52B-00000003NTL-2VGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:38:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a081c163b0so19693615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791507; x=1766396307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=TxMsHM1KopKiYXhamJEg/+3fIUCI26wKmuppHnfVmRxpa82dymdX9xyokmgoGI161G
         ppLtEIL/4+rw3RMtcTD/R+lgUeVJdEsqSAMMo4PH+aG/lN64myjJltmCr8oNlXjg7ZPy
         iUH12DcC+LmsnzO4n2muDkDiuuIxOB3620h5xe4ZpTRMIbd8Lpo44Uy3AUMrax5HuJ8J
         qCVCz/JEVS77JBZtOAr4LMTWRHHa/lP6pNKWlAtFCruNwhrsZ7kO61/WVlywGQG/cuOZ
         1obXAP1Kk8qhMIJpDNtivk5ZtneYeqVHHMZpbRIQp33O2M3KRyyCswyxAFTZhvhWu3nP
         okXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791507; x=1766396307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=fxH0MZIXcWcySwl/9PXUgrikK5mz1uxI46HY2TOBTQyIyffv62LUa0niaVImCnwGVk
         rdWRCGx49tl9ryDUJNrElsVUAG2Bje8cbbtK6Aazco2ixg2N/4M7tGKqoGzNF/7yEQ/B
         IT4LUSBlWlqFk6xpuqdxdWfQtEu1Nmax6liav13LDT89IFliV37lXozZIhF30RIFTdSr
         Nk9FL3TkGpTyyCqT4xu7I5NYRiM4wNBW849dopwxOKDcHecZYAN3DSVmsUEGOSAIV7GW
         xq9ym4rTNtQsqFXTYItcvdpjw3adMQg9qKRfGtAnReDnNfEpbtBW3gxkm7g6XsL/LDsA
         Pu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm8HNi43LHN+JMbvJ6Ii09tT4tZKYdO1Db2p+LXTeFl4ndtdW2LQj17BbWUXNMvuOYuqlCW1/Zd/Kg8kANf9j4@lists.infradead.org
X-Gm-Message-State: AOJu0YxFLLWZqAPJEcDPX/+l9SG0b+TDZF/AUKP159rFbRZNm7bsO6cn
	ynVf8nlccH1UoWcy0PCtC1hxy+Nkgg7t2OpUXZZnbIS48r/zvnini5Jr
X-Gm-Gg: AY/fxX5cMFgqZJ/lEWuOJHnY8+Zb48C/xSiSRqkE0qBhRMzfqaaVmxG3iqkKNfqzrgP
	wagkyJ5+MXRjqWfjxN20VSWRkNguEgZ/B6F5eKQqpwvcAySeDaYIevc+3VmqZsTBakrm60SlaEe
	a1doRNxFl4l8qxFNxXOBf/vNftTQqQ7xvKe/j6BnPXUPAlZ/1WsuWFlkf6UGIIqcgNXJSsR9TpN
	SdnjWnM+8MttJJx6Vbpx8h0rFMF/vYD8wktmBwFYOycnqQEkYWkOF/NcXb0DacttKBnvjoiz1k4
	jv9boolWWTpEbWzNlEL4eYGu8EhNnLbkWrkgt6+b43D47Mj1cdNThLdltMyHM2C7Hkb29tskbAb
	aABUvRXrLV8Y7OgLfTqa/1YKe4Ok+y2YcAAYwqAWXiZNIl0EntSgpAcQBGf6wUt4tO2/x83AAL8
	1bQSz9NK7jl6sjk1me6rQ3wLDr2FFGDnFg85xdW9S0DpFryXGazuJvFfao7BIpxYwPUgcmkDK4f
	2NrTmexfWH/sy5FjsMcLkIs5cHoOV2WxrFo+eGO3wU8NuHDJfHU92Ilqn8w+NzGVq3fOg341nyd
	PFezYgTfuUFFA1TIb6P9PrWB/8jd3MfFjD8s1VgQZtDVlKhASjc=
X-Google-Smtp-Source: AGHT+IHXjaO0kZdI0jvqgos1WrDuGav3uz9uPzrIQ/XBD2ij7oSPEGrTgf+//QBfvWQ0XjlmdCFENg==
X-Received: by 2002:a17:903:8cc:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29f24386514mr104092335ad.52.1765791506920;
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:45 +1000
Subject: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215k3aCQdqL9kFX3Dy31+Ft+WOeXTaqtd8nmEOP86H
 /HtnbWgYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUKNowMk4t+dz4091c+cuxot3MQj18u2+Gtdsd3Xd+n2n6z5fcsTYZfTKHWRS7
 C/1s+CnecWs7h/1z69ebCX589Alx0pI46m9hxAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013827_679843_13454745 
X-CRM114-Status: GOOD (  19.65  )
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

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 000000000000..2eec317bc4b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+$defs:
+  sensor:
+    type: object
+
+    properties:
+      apple,key-id:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: The SMC FourCC key of the desired sensor.
+          Must match the node's suffix.
+
+      label:
+        description: Human-readable name for the sensor
+
+    required:
+      - apple,key-id
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^fan-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+    properties:
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+
+  "^power-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 0410e712c900..34ce048619f5 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -49,6 +49,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -89,5 +92,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..5f160eb6762e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2458,6 +2458,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.52.0


