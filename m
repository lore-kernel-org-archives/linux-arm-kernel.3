Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83826CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/M+gZUFdVQachQlxFfSGPq/1I6HrXBG3slBhmGAHqo=; b=kwXur9r5wXjeGymC6BXGq9iLnM
	9BiYm64dn9T8jRuybqA1lkrfgDqv+Th0l+UOXLRaxHWVJbnv7q3Og49coRQcAlEd4H2XHkygfTnqJ
	HdAJjbF8eTGVx5GkReTv3QdOUmeeup+2uBQeSVFrbNEhkBQ0J3TLCkNKPxytqZHOPqKA8heL8QysV
	y7L7lO+62qhgZGKdVaJg2wVP26iK3VIPh5SmcFxJ3Be7AMyPQmmOFPcrGVQRvlzOAdZKLONRZXzzw
	4MCXiuMow8bGMvTZcB92Dgzxn7cvNqIl88MOO6FjkgemylcQ/usA6H5iDXEQxN0jefDbaiM+bJuzY
	9PxoJHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNDj-0000000AjsU-0hQO;
	Tue, 19 Aug 2025 14:21:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKpC-0000000AKme-2DRk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2e88c6a6so4720661b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604102; x=1756208902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/M+gZUFdVQachQlxFfSGPq/1I6HrXBG3slBhmGAHqo=;
        b=NCP7llIbZO3Cso2lVypZ9pQwf4UydC2ElMMs8Uz57111eI4L+Yx7EjYPN9qAZMAX3M
         uA643umC1ur8tbcZWRIU/q0cqJnX7vdEMb09XqBGXaORQe8HJw7YllBvD1GQf7noezSo
         PSR+tM0b99MObHSGzvAQZLBe+9wTnGHNOyU3XBikBD+r5mXja6NEfK8ghDMPWsh8fh0m
         Sekds58hZ9ad0w7ZuxQCgv/DBuKlyWRG+8YXrtxBAfmVutdOz7As89vshtTe7q2/xhQ6
         qrfiTCT0C5IITbTmaWi9oR5d7aZw/4KCkgnL8RxRErq3jV24SbkOfw+pb7mnYdSvMLzT
         Y7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604102; x=1756208902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/M+gZUFdVQachQlxFfSGPq/1I6HrXBG3slBhmGAHqo=;
        b=sFt9t20qf0OkWAZnUCLbQg5Io92XTsjL+8a3UyiwOJfQIoTJ9EZvozynnHvxJJ9cHh
         3w2ZcwEYby/f7gImyYCDXBCZiLyWgh2DVH4DxDCcM0tqFtrOFGfPzfo8s9I9fx3ylqRU
         BlcgQCMpsSUKT/jRNgDBIqs1E9DcekCK0aLNDj0a7Kvh3ebcstHyHHSRr1LbCOWjZEDg
         AyHQ0/CXJNcIEWAwosMzaIfF6UISfGITwYEgeleIemMcNxmEJqNfCS9O38IOFrykGsFK
         nsuUgP1bzAN4UalSiGi8Qy9C8K3ZZV+Iq/5JZGvQiqLykviYNlVjFnkIKHnEaaoXtbSB
         5GwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyqkG/wzHzlYoPC9QWwW7VHCy28pX6608FO375m7ItNOSMOHqRMvvMweM+v1hgbR5c7CtOh8dpj/YR0SSczMNb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5dvP8ADomrGU7nJRHjTalBd3WWz+pMDCUT/aoUJijorNVk1vE
	gbISiHQv6LfO7fELqFjAIGW8z7364DDO70rmDCB+kEFUemipFAvyoJlS
X-Gm-Gg: ASbGnct0VoEungJfpdWjfmWoRzxQ3dKe5PDDUvQ7Bx3V1I2VKs02jPRR1sYm5p7y5WB
	9P6SkrTM8Gl7mV4jcxgXDnePCpENLmvVYuAw3kLG2vBVgjwoGiVsll9teEKO3XC9FQfAxn23A0X
	K+csIkoXDgHz8siffPxJWLRytOjOrWsLNJ2rH+2qBylW81jUxhcs0BeIfs8wtOTEryT+cv9st7+
	w9wWOw8TAgjdtZiK2NjHW0MsigSjXmriXBoXUljEO9eHr5i52w/ThPz/TdGLea7gFLzdEvUHhDG
	zE5TOOWEXYDIZ5Ron1X2Gy8xFGL3q819ScNa6Rkufr220a/KYcELoymSWyGRLnHpfpS4SGp/TpE
	O/+9qvbB1liCVkuVuLT5S6I0JcazGY31iJj1+qXUa/eyUArC6ZdHotw9mDedI53x3Tob7By6tDu
	E1xGAjoPXyVqsUaY8T07P9AuuUIw==
X-Google-Smtp-Source: AGHT+IGNwhXnpLzY7G6aLzH7VonJ1EWLqph7nLjWaYiYNpFDS/pCs74uzWF5/Mdp1b2iNa2DcyRi+A==
X-Received: by 2002:a05:6a20:9150:b0:240:489:be9a with SMTP id adf61e73a8af0-2430d3792f6mr3408076637.23.1755604101545;
        Tue, 19 Aug 2025 04:48:21 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:21 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:54 +1000
Subject: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9287;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mWy0xB+bKrtovuPUjduB4hi+a8nic/uPZscLfs9cSFk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvLmfFgwfZ3CwRNyj5Y1i6Ws51gas4qh9Nzt3d/Pt
 q9KluC70VHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBErB8xMjyKfTSrIdNo44ll
 WfGvP3zZUX//VMgn+aXHWb/nsBulfc1n+Cv34IeTp5CJnr9AyOpjTLdddXqfnD1eMEettp/vig3
 TE14A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044822_577024_3184BD30 
X-CRM114-Status: GOOD (  21.18  )
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
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          |  45 ++++++++
 2 files changed, 193 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ebc0463be4e1ce54005418feaa87ec7254dab6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,148 @@
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
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+  current:
+    description: SMC current sense endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^current-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired current sensor.
+              Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  fan:
+    description: SMC fan control endpoints. A fan is made up of five
+      SMC keys - the fan's current speed, its minimum speed, its maximum
+      speed, a writeable target speed, and a writeable mode. The SMC will
+      automatically manage system fans unless a 1 is written to the fan's
+      mode key.
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^fan-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired fan. This is the
+              main key, which reports the fan's current speed. Sould match
+              the node's suffix, but doesn't have to.
+          apple,fan-minimum:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The minimum speed the current fan can run at
+          apple,fan-maximum:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The maximum speed the current fan can run at
+          apple,fan-target:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: Writeable endpoint for setting desired fan speed
+          apple,fan-mode:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: Writeable endpoint to enable/disable manual fan
+              control
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  power:
+    description: SMC power meter endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^power-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired power meter.
+              Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  temperature:
+    description: SMC temperature sensor endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^temperature-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired temperature
+              sensor. Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+  voltage:
+    description: SMC voltage sensor endpoints
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^voltage-[A-Za-z0-9]{4}":
+        type: object
+        additionalProperties: false
+        required:
+          - apple,key-id
+        properties:
+          apple,key-id:
+            $ref: /schemas/types.yaml#/definitions/string
+            pattern: "^[A-Za-z0-9]{4}"
+            description: The SMC FourCC key of the desired voltage
+              sensor. Should match the node's suffix, but doesn't have to.
+          label:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Human-readable name for the sensor
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 38f077867bdeedba8a486a63e366e9c943a75681..370928bb42010edca17839faf0bda4630611a7a2 100644
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
@@ -84,5 +87,47 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+          current {
+            current-ID0R {
+              apple,key-id = "ID0R";
+              label = "AC Input Current";
+            };
+          };
+
+          fan {
+            fan-F0Ac {
+              apple,key-id = "F0Ac";
+              apple,fan-minimum = "F0Mn";
+              apple,fan-maximum = "F0Mx";
+              apple,fan-target = "F0Tg";
+              apple,fan-mode = "F0Md";
+              label = "Fan 1";
+            };
+          };
+
+          power {
+            power-PSTR {
+              apple,key-id = "PSTR";
+              label = "Total System Power";
+            };
+          };
+
+          temperature {
+            temperature-TW0P {
+              apple,key-id = "TW0P";
+              label = "WiFi/BT Module Temperature";
+            };
+          };
+
+          voltage {
+            voltage-VD0R {
+              apple,key-id = "VD0R";
+              label = "AC Input Voltage";
+            };
+          };
+        };
       };
     };

-- 
2.50.1


