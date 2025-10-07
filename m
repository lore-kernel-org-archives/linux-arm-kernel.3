Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA2CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=; b=N7kn8BvYHCHr+M/uxVBII2/Dbo
	FjHwj6PWmhr5kU8KsMdNfHyvpwPUIV6EvsipBbV+8Rquz79PM+WAE3zD94m6LkYexgItih1pjdLsk
	SkkRu2oyrZamoRT0K4llEJITZ8CbETyCZZYi7WsmFcjy921ghIPv1PwW7h8Z0wFqmQv2qmtHIZgkC
	vKBMoQfp8lGk9zd6rm4lvktU5Wwl+vpZR4l2WcRLJNeJ76avKUD6+nW+JEoFP1Qkg2UYmFuaFwuO+
	7YPHrcFOYdpRPhdZUJr1mWwjblp8T3kXWkJSg10YLXiCJvq5LrvKGXeX96wss7H9Q2cVZLU9N2w8y
	Xiv2i+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hJ-00000001rEP-1aqQ;
	Tue, 07 Oct 2025 11:17:37 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hH-00000001rCI-0PgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:17:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b553412a19bso4389804a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835854; x=1760440654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=eO5IDW22HR45c8ME9mhdl1Ruo/K27XxT6p9X5rMBqMd5jUB6F4jtpzBbHNfSvUou2g
         RJI21L1ekX2KDQ8P/7euZzxuA5X6xf70G7eOWfYcjD4RC0hVjiV0yBTLeu9gk7Lwb7af
         LRTmdZVZwJK6FQP7oD/mGb8chEjA0dxGWbGU6EgxschazOzGs1HrJ4c9ds2i+PY6Gle6
         R77hLxBFSTRzy8q2cENd2RLX6eHUvkdgqGYovjiil3GnLt+XbXxZ/ucFN/0BbxkO1Cg7
         4LNRmrJLAoF1wRFRy8ubhUVW/IrLMMrFQOUtOY1BrfOjkGtU78ShQtM7h4FlLqz5mlKS
         C7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835854; x=1760440654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=q3uvTj8de6fjm4cLfP0kIhewWe2EzarnObfel6hvYUlG/vpOd/tfpbm3/e+sEi51yV
         UvXFbJxBw+CwNks/E5YOafgXAzJz6/lFnVqKQBV/eZDpAyTlsNLbXHP/zaRDdUsIopMW
         geKez3vfiftL4YCMsWwFS2muWkL5PjpNMFco65H2uWapInFR2U0VfWpFG9cox+qmB+gR
         4LoXiVVVFjjDdmG34EqQTPlk4wD1mNs8J6rHlqWpfBcPp2ZPa+gQY+BcnciXWEcaWRPx
         3jU22tIpX112ncTfMpVvQy/DDkABXHylDC16YBTA5V0PJZXCPlpj+ccfQADqtSq0OK9F
         39AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2itQztw6lag/yIWL3jy7E+iovLpc0jKSsQv56F2jLhML9m3CUcTzX2mM9P26/7grFJsTp6WuXTY3mw13y/paf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6vWCUlawt0+hR88ANZ6596dr91ene9ILoNVAp7wRqmnmYcBLq
	y9GWYO0FAZYFxOxErwkEugiG1ysUEEXsWtnkcSz5oCzMmkApLj87UGUK
X-Gm-Gg: ASbGncvN1CWjnkQmzgWdAfmDHAI+oEmf3EaqsNWh0shp298+tG2U8aML+tQA0aK1wAn
	qG7VepY5ah0IILvI7WMeK0YseqKww4Nc3LOWRYY30JOqtg0dJh22MvT/NmExbW+uNKxpqF6KzaY
	/kX6fjhikWbTWN5RtbKmRCydWgmLrVkNUzzTkDQ8z9hrvlijoVZcGfQkZdP+LC/afzkneIZT7Hm
	sqPCDuIrLfAJNvgLzYrnKQRg6w3sgnc0xrsvWMhzrx4A0Q0IJxEIdIDalmAKG8z0dlvuEMuZeSM
	HbDaZtZaFaOoNuhubrZpvFzHuXrbs7nQTaRSznXkx1xPNfpJ/j6O8+N1rr1UUWU0rhdVMKFeQk9
	6F7sRnhG7HmW/OxzKyBnbT5d3l+6xBjbE7HBhuXeHk4LUVN5R9pb2HaRAYL6BYmdmb4b0FxU/dn
	C5AFe2qGZzp+xss2w6fjx8KRM6XSXh5TgRTnt4e/KZCw==
X-Google-Smtp-Source: AGHT+IEhXXBkgS53UtOPSU9xv9VmoipHjlFpFVZVBxm49fBbGCyRWBRrkT0xdjC0nLzp6fPABCn6yg==
X-Received: by 2002:a17:902:d50e:b0:269:96db:939 with SMTP id d9443c01a7336-28e9a6b0dcdmr219162705ad.58.1759835854077;
        Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:43 +1000
Subject: [PATCH v3 02/13] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6641;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=laVpP74gTzMbo2qrGHUEyEkSlszTpZA5CERei0FVY5s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3lO6Wf/5I7V2qC1Ml9R6Ydsd7NdJ59yXP/soyL+
 24UKrJrd5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRGR0M/xTu2asYrrj+vODf
 srBTN445tcez9GjOXjBtZcEitRPzX9xgZNj0a8/XzrTaNUGh7DKPxFMffmFw4LbqyX7tE/jHczH
 PKhYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041735_151569_02852E28 
X-CRM114-Status: GOOD (  20.26  )
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
index 745d85b66365..10f4c0034b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2418,6 +2418,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0


