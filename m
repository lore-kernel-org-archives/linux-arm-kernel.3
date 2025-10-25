Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C138BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwfidYGuKHgshH134+IxmWFS70+GCQaswxiZDtAJyWU=; b=X+HECiolh7Ifzb5BI6gCodt23y
	9pelt2ueSBH0arbYMJQOBZikjMDPK2dcmwoctGWgRItKrL6lfbtNq6YqtPz40bAtlU97Lr4b/Az1K
	2LluFgMNv+s6gb7brVt7zLQfrpSZx9AeLQlS7xisN8zZzUBIvGv1QdUxF8tDGFJNf3OrgcWVfRHjV
	QhQHajQvudDweyjy2bqh+ec9J9pt3KDwVTLC4kuLg4N36dR2atYN2PoAcdceUznYpowUqoeHi3l94
	0Vq8/IJWkE6OIIsQA24PkMQDE8ihf1fMQU/8wM03jxPFi0swUHOUrmvjJ59Gi9PZj1LTmbk8Yr54m
	9rWSTLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS5o-0000000AiWy-38pW;
	Sat, 25 Oct 2025 00:25:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS5m-0000000AiVV-2eA2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b6ce806af3eso2370269a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351910; x=1761956710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwfidYGuKHgshH134+IxmWFS70+GCQaswxiZDtAJyWU=;
        b=IxFwacNlMIxFCcbyUBtxps4OzKySIJ11UBi9vJsebbGqMiXZ50LDx33ryyudK7NgUq
         8TSRhMq+Eob2jtfVVQtbsZFra25NDwqgRB1rP1XBacfCvGpXEcT8yJ1UyzyonsVGG6Lk
         reGwgcJM7+SgYfgmxMNWYhr1REn1c0TZfu7HL4Mb5pkVeJP2H1Pike7peyopOLzZeE3i
         ieQ/HAXSdIC6G/wKELC6XW3x93DTg457RPdLiSwQ8s9ESd5Z+pqyYTsP6IZQaIWt8ebe
         a+ggs1ypCbfBk9J9DVutHcyouj907xVDXasW6PX6UEKHqRU0D+0+tSfHpPYV3RGVL08L
         Z8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351910; x=1761956710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwfidYGuKHgshH134+IxmWFS70+GCQaswxiZDtAJyWU=;
        b=SQeuG9Ko/TV+Wd9G2WL4TNqedac/c2T6p6iAHxdiECMXjaxZfd33PUGNlGM2KaJxSF
         qD8iNHH9kkk6YlQLrShvCpSnWtplqBg/IUjNliXIvO92ct3rHtRfo3lRujLeik6w8cc9
         X63RjoQEZvvuuZd8UQ3B9oMEDo9Y3o/0t+bZc3Rg5YuUAZH5fxbzhLSC8+J12SIyo8Aw
         hrD+wwmbgj5GI2ThqFXqfxYa7xgBYKu/CLfxjnIkOHcjHcHGH0a7Fq4N7HFYHvJonWAC
         ZS5s4TiJbZOZHA7WURijN7VJR3USLyRtVXzgCFCz1h4znEp5rOsoDsJN7c5iu70LVU2L
         fK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7VcmCv5rDQeqsHAX2jBA0HfXg5fH5of+uq1X/0dz/wwW/OCbwSUBCCbotbhyknZKSix/F/4SKQzlUC0ip1cdf@lists.infradead.org
X-Gm-Message-State: AOJu0YzqcyS5BMEhY953HOAuP7/vjEpGItnY7Ebs+A1gdvGa6BMJhm8c
	tMxEyEQgYkOdgnnw2AchyL1wt7rY6qRHvkIHp906VCZcp85kg+ortHo3
X-Gm-Gg: ASbGnctdy+s0fiWfSxMADx7NBPDakplu5wr7yPBEBzSPqvvcUn64lbr0Pps3oTPa7xh
	GXS6ROJZSaqKCjHTScuLxRpWGOIT6TbKAwDLTGUl5d6zJzGdPd/t1OLyZjRaSdynZV5yirD2GE4
	T5VVEL4NYyCH7coqh0ie/scstC0TG3GcwpjKRpptv2OWv/Rdwn8W401NXJfBRV6ypv4KEAAZiRA
	o5Mg7DT2yAb1aplCb7mQRzgZlXn/cHVTJBs8RH3lNHDAiJyHdIzotnw5+1UVGl3fnjglmd/0bfY
	C1CTkwaI361HPooK7QWY8Gl9Nw+EskE9f2veDPOfmAJgcTXWeWdLAmcwhmW/Eq5nJ7+/qNEi0Ux
	AJo006YH+3JXYX5aF3pMlZlkzpZ0xyY2wCoDipRbNtOpHyqc5IgfILKLT0n+v+0OjkWFRdzVq1X
	ANY0Q+1pIlw9r75/xvRXMPZd4gb5LwHLo3A4XMnrmms70ViAXHwQlO1y7GgXRgMG8UWSP+ml45J
	ElbHsWCaw1rQrfQFsDG34FRJ+pZCl6O9fTdPdXN3SkjX7K/wkHdpKL6de5z1avWOl3SVDR9mA8=
X-Google-Smtp-Source: AGHT+IHw9sGrmw3gIagphERDqgFYOOfKGYJBT/zaK0hILzkn0QI5qiwyyeZwL/Ik3dMeZqMZWF0mQw==
X-Received: by 2002:a17:903:38c8:b0:270:4964:ad7c with SMTP id d9443c01a7336-2948b95c6e4mr49579925ad.2.1761351909745;
        Fri, 24 Oct 2025 17:25:09 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:33 +1000
Subject: [PATCH v4 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-2-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 bh=QLglMo5Tzt3fMQq9JyCYlBLgJC3+XwEd/tCVV3EfeJY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4q+J7ufcBmuzj98x6LMhmZc/P4XtedWXA2xiB7v
 u3yNvb6joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSrbWP4wzWnQJ3/LdfVrP3vRf/NUVHi6vxwNqziYOEpzwzFzKSpfxj+hz/xWWa
 aG1zR/LLciSfa2dRHrmafmfw3ueVLOi3ckz6yAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172510_688428_8182E6FA 
X-CRM114-Status: GOOD (  19.45  )
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


