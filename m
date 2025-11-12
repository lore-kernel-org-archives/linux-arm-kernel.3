Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcQKV8dklg9rY1tNFTyIjTMJUni5UotcTYsuT0Sfofc=; b=WjuXlM+/8I1BlzJDjuOvM85B7N
	w5tD4tTZHVm9yVo1BTd+SoskYarRnfMw8S92Ut5obiMWZxyQehb1YrclPjdy8niwMlWjUvccCvUwE
	dAQqZwUAoS4ELKP6XaN4nEI3kffI87QAUlLiyWRyc8ScBKP5lYtuQs75rVAsvUEXm4bpzLaE6KZLz
	2kpPkz7gYwVDj2RYATPm7hoSlJZ2VpZDAWKnebMln/sXx65MfWWY+7UiSKia3NIMaUNaTtTyAueIp
	mbqy3PEmdaCU1ZQC0dK7xVWUxQd1pnznvWp76kmpAMoCes7htHy05rM976BRHu41KMDOygcu4+LaX
	t3m/Qc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rI-00000008f5X-375l;
	Wed, 12 Nov 2025 11:17:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rG-00000008f4D-2mqa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:17:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29808a9a96aso6867345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946270; x=1763551070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcQKV8dklg9rY1tNFTyIjTMJUni5UotcTYsuT0Sfofc=;
        b=PLHc+uAQ5c13F2tcF6Sd+DwqAzAChGWoG5VAfKr95qYstTE9wSaIjvDRXSFQpvx7Xq
         SblwSd/oCbee3JeJt5fJ8fPOIWmHoIekNPGZkP1PMXM/zxh8pWwoqv/Sv598h46M5TU0
         QK7+Hvf1oKCkPBDXxKkWe7cj7k4qnXEG7793o+DXAfSYYc1rlOgTE5d+i1NO7j28Br0Y
         QDUv05KLj7OU6AgA/ezXgoJ8ifxQ4aWEtQcD0Hrtw+anJGYQQgyO23dLbcjV6nMHu+LM
         Ln2WoyC3dZLim3PQRk5Y9ejYy6jj1qw/7QleVrlu92Gjf70frXSZZQjgEfAM7vs+GHEZ
         mORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946270; x=1763551070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EcQKV8dklg9rY1tNFTyIjTMJUni5UotcTYsuT0Sfofc=;
        b=v0YjszPA6tn8UxvMYS7SS9gqfeBBzN7pYL9h7xuKYWek4P1N0gqrBVr4wPo2JBtf3Q
         kV8hLeAJw5xI+pqtEOLDnosXfhO2DmYBd63ozPeOZP29Gtl3IvWLSzWGe2W7DWtejdSJ
         0zKj1KEpD8xrCewEYeMv12xruBkaBRyyQOALw4XN/pIcXOhPfJCtwH7kmSpTf9dkWyH6
         8IFWEcB776SL4bpamiVDln0ZQINcItqflZgfgX/Xv59MRQISHW3PCxC4SnMXAZ4oOL9V
         H4P+DpqCMTvY/BuNe554/UMXxXrePNwc/ktLCjqo0aoVSKTp0W7V7mvMJXxQ5QcvWs4f
         pGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUxyLw479gVzX/cygDRSihPPHFloCQzQ4lh0MscL/ZxvAwn3IYySMxUWne+uXmzbwPVlLuWdACRBVvvjO2sBld@lists.infradead.org
X-Gm-Message-State: AOJu0YwU0QGnRCXFOOSxzdQ9TEqriL41OPUDm5crXNfx4jARKPLCAhmP
	w73YwY1QopnII90n2vqe5ahG+6K+ivVy29bEvI2sYxvSiorczXt/Yn12
X-Gm-Gg: ASbGncuW4d9t4RNR+5fc01ZReMMBYD4ggymU0fe5AySX8ph3TZNdNroCWRa2fyttpf0
	ZIah+O5H0y+FiBip+DKT/dDlRoWglytYFUtsXkqjGfXHnOqM46zWS3mqj47+LjtcGQE76igo6rS
	ZMlz5jmK5a7Po60Cf2ncQtRoEkNI5sKD+6gP0xsbi+wU5UjnHyzA+NAo5kvxcuidHGp3HCtsINl
	+1X+TOEaaR93rOZDYdoPu6jG47BqjSwS8DGIEibTU1Zgq5ip+ce3BZetHVyvNJijOfk55JGeJ6K
	6TDgD+MQ/2nmv+cRWnprGisZnr2biQm8rY6Hf/CkVOkaZniQjqZU6fZy6X4pywX5dRu9grsrupM
	9aXz+uqgBUObjP9MVjfa/OXOt6/UBR0LwtAa91yOB3DYkv9NIY2IJG7szhIQBSBNl0XSg8v3iP9
	rOHnrnv5AwvUfwM1+r3QGK54dpviVNwqL2nELkmvsvzl76raiBFtiU/A1X0hQbKZHtn5F1tn1qr
	WapY+WbYpMauadgNiCQvl9iWvSmRzI/OOd/s3GjaMTXtNF8KiwQ40s=
X-Google-Smtp-Source: AGHT+IEXmYK5Jd6abgmEKislEs51qPiJZZI8VNvYAfzYqeue6GeNd3Jr4Tt22dAg51SwyR7UXd8g9A==
X-Received: by 2002:a17:903:988:b0:298:5599:3ab0 with SMTP id d9443c01a7336-29855993c04mr5637195ad.16.1762946269736;
        Wed, 12 Nov 2025 03:17:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:48 +1000
Subject: [PATCH v5 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 bh=Og+R248Mw+N/x4bdlpMygoz9hBtddXEvmLkGHdBckw8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUcq327e6qDKYjd1f5/N1//5M2TPPpi34eCd1B3BV
 SGMRz7ZdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKb6LxfDX7l3yuf5LWtbv7z78sJzr0akisWWxSfNO5dVvL/M+3r3JC5GhilGl9c
 5XGyQ/uax+qzWq8Yb2Z7/JGfM2vOz6WD94l33ihkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031750_720040_84396AFB 
X-CRM114-Status: GOOD (  19.62  )
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
index 51942a9a9b43..6e5e219c5fe6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2422,6 +2422,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.2


