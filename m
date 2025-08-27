Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4591CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=; b=bXl8dG95V1cf7zskGhfMTKHtNS
	iQnOhF0/cfY0A+UooqIb43dwvGr2pLS7lAQ76dIqGOktN4ZCrHukAbhuLsnMQThspilYoUROwuR+X
	ivvGxbZPwgggAsmetsLu74FOqB3nbTX0dkv95iKxuSIDMCXuWEMk6Q2UWL7CWi/FIhv8VuXyQYDPp
	7MIC81G3ZZbYhvLsCgF8NZf3jNjanefYX7ySMyHDdJfSXVdP/gTVaktf8M5Exs3WqSZ3YnTT8M1Sf
	Dc6p5yxKAquZfor2bvK9IGNCQDWCZoRYGtFqbam5Jd+/FE2EoTVFiJGKPi32U4hSHVCBy4WuusCLr
	adE9DvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOT-0000000Fy0t-0k4d;
	Wed, 27 Aug 2025 15:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFC-0000000FFS1-3KB4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 11:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=; b=FKYLMonIYytujuLy1Etm8LLDs/
	RJOfiHvv55CG6XcR+QLvFgv/UcnxMVY3zr1eIsIdofdd9kPJ9UJ1Q8bzOx62E1ERBzgADR6iuahBp
	WdTm4367qoneEL3XAmmcGbEr1fO/4zV78XHrbkLvt4a6FAfTY4rJSSiXRASVJqFv6ByQ9ZtetqlXy
	dWasx6BOrboISQsP8flBAOOdnEZscZNzHl1Na9wptTpOkhsPr+v2kQXhfCZYPNI/yFNjSCKGD3XX4
	PF9oFV5zKGNfItWJRRhcQWO8aNhtIn60sWWVsLQAnrRdjt1463R2o7uXUfVVqz2LWv2Dz/PzUmyXn
	Ulq7i5oQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEF9-00000002QIs-2eSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24884d9e54bso11946515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293785; x=1756898585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=;
        b=gHfOaaLXos0wIEGvbhdGggUBA7q6MszC0sB74lh+XW7FPLWcL9KYuP2i4QsU29Q7cs
         xBz+SJoJ3gcYiXAnU5Swmvwri70N4DLQscroM/KbxkeWzhc/Ws8QVuvW5Xke7ObiP2je
         Uc0MVupmG3mFsTajO01LgJ6My79N5/3Pf11JKqA+5THfc94Qq5wkwl2gLK2k3y3PID28
         J/Ar29zC7WYGYQi2GkXF7UbXfBdF9iMRLTuqhGlaxgKhwM2tiJsElZJA4jm5CbLfgFmz
         8DFySnwKwmK3rpTOXpty2RNW4Lx/rTvOTCWnV8ATAf/RaBh0/wqmh3/HUYOeUc5DwDMH
         mHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293785; x=1756898585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMx7ge5RX0V+OLlOISVXfqktk6COWSxJMAbdSdyPV+w=;
        b=l/Y7h2AyIhuS++RkyOAvViAWGkhLCAolNWqX/22NYKR2IVu/TUuHtYU6557vkQ9LEn
         33P/U2PO4pm1uV7ymTN6BHGFllJwGt6k2wVAj0PZ5IBEMB92q8FKY2BTlSuQpjsFa+zq
         tU1AH2duwsDdGPBqPfFKlb8JHspiyCFQBJEdyrNtnv+eYLUPO1cMv5yXF9xujh5a2hRX
         c2ke+1weG923QtnYeMrV5FC5F9YyiOlfE5zqt6k9YZU2QcNdyxfzlk5mhZQsUZVtW2Jv
         6AwjGuqR0eGcm8c3KyLW6U4arpeyxcdKC5+5KjnACZMBbH1aIJVVZmuEBjWGR2PyLqjF
         1QQw==
X-Forwarded-Encrypted: i=1; AJvYcCX6PTyUIh/6zUl0Z1rEofoAF0VKMn/9GBQkrSpa62JUh4cDjycFRSCYTdKzGKQx6p1q6Vzd24TE2havkAZIAl8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxrloXy4ZOPqTCCTlM7aU/WeFcaHnUtu7IetXbN/Y/pBbBW7ZQt
	5reJzum3CgxvYUVGsMtx+WXzteadrcCCCEtg8jEfI3vS2XwssYZ+LWmi
X-Gm-Gg: ASbGncvRdaa0CRxZEuJaarAaF5eSf8N385egHeNHYDNhZLU/xJZzoNDR3nsI3Au08ZQ
	6MKmPmhFLwEvm2GQeDTrOqpUpaWu/8FnuT6YpDtE5kpXEL5SuibVTeMamVHCWwNR/41ToGKolPg
	q6WqlsRdh84/oyeJqD7tXW65kfSByarf2bH0P4thZu5KTuxT6jYLmYKh9YJJ1PfL+hX/5TgdoUx
	LKyQhFeuG0hn9zTsl7pXGG9GLwqKb9EfiVBiFTL/WxPrN7VtGK9WGNpCQTk96MMdKfEn07kyack
	yozVubDRcFyY7+8TyOsSPklVy2mKtDkGjO06R3eeKGQqt4roNhGPte6iuIN4G7Ew+zlXCTLcZ3o
	gZoXfDk93hXoNA6RXLSRU15UVZ5QPgx3ETmcOpHymXnkcyk/77g+79lHPWO1SV212OITl7sXf+t
	JvQjkOeecUa/Xa6gv9
X-Google-Smtp-Source: AGHT+IF96nOBV89XAjJ4kjuERk9/bHO1FA/Ey9YMo6wYm4uiasLB6ej7p9n24uxKX3zXTXWR9yC0Sg==
X-Received: by 2002:a17:903:943:b0:242:fbc6:6a83 with SMTP id d9443c01a7336-2462eb56b82mr242150185ad.0.1756293785286;
        Wed, 27 Aug 2025 04:23:05 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:36 +1000
Subject: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7585;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=pxcU2aOREOtRRxzuCcs3ZxRurRuImy+zjNoj2CEiGZs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUZue70sF8b25USLiK50JO1tt/Q0n7atllVx7s/v
 T3Yrh3QUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQ8ghn+V3EcFdQ3q5f7I/Zd
 /jeTzeK3CfIHP5y9/bXQ/601n92GCwz/bEKOW5/oyp48Iehb/S+Hbx/eOO1unsWgb2i71S9ie+9
 mLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_122307_827304_BF145BF2 
X-CRM114-Status: GOOD (  19.48  )
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

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          |  36 +++++++
 MAINTAINERS                              |   1 +
 3 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b428088f96240266fa42e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,132 @@
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
+definitions:
+  apple,key-id:
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-Za-z0-9]{4}$"
+    description: The SMC FourCC key of the desired sensor.
+      Must match the node's suffix.
+
+  label:
+    description: Human-readable name for the sensor
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^fan-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
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
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^power-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      apple,key-id:
+        $ref: "#/definitions/apple,key-id"
+
+      label:
+        $ref: "#/definitions/label"
+
+    required:
+      - apple,key-id
+      - label
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 38f077867bdeedba8a486a63e366e9c943a75681..3fc4aa39292395f27b5694550858c6b34d18308d 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -44,6 +44,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -84,5 +87,38 @@ examples:
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
index aaef8634985b35f54de1123ebb4176602066d177..56aabfbc2520749beb9dba235f8e86c15e17b7b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2380,6 +2380,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0


