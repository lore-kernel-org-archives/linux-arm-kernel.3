Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24285C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+k5QpSf7/m1CpBtqnc0T1oblUwlFDKuqZ/ZF6inHpI=; b=h9UX7wF1ccCh1Z+hal6MzTWw/1
	aRry0tgJ5B89YJmu4LMudzs+RP3AygGrkj7n86UtVReJUrmOyrrV8qiXe/Bx+3SL/Xa7qfnWc+KQ6
	FowKPK7eOxcvPVHcAyWu20dV7Q0T2liiBut6lQtFQNisLxBJcb2HgZw5C8YqpUdMR2CfBShSpRluN
	xN+7R94+MgExrnx/b0ufbdSNuX+RKi1aWRHB/EnPwNar7fuN3AszUUVaH/0Cf1z8TtWlpObXbNM9N
	HJzVoj9HZ+Vc/qy2OjC79xfCsd0Hi9M2VTI7PkRQfwUSgV5hm9eHwcYjEn/OitIcOlYdulJGEVyBm
	6naulPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEK7-000000065rv-20HM;
	Sun, 10 Aug 2025 22:15:27 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEF1-000000065W4-2ygS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:10:12 +0000
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f1da6d294so3312762a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863811; x=1755468611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+k5QpSf7/m1CpBtqnc0T1oblUwlFDKuqZ/ZF6inHpI=;
        b=p8pWml7KAhoZExJQMwMmjn1k6Qo90FMt8BX/4No+z6xPEhtvA1zpYe0gLqYdPLZvMX
         /VEx7s+WWeLb2QG7XWT85kjYygQ8ZzrnArHPZSHQLxRcMabP48Nj4nRqMrZuaE8kNIby
         37UkPKoAuMjvEFS0EbbT18NdTwEbNpB6A41sFCt7JV3sxzztNOA68Ysm3r7/XCv0Vgd+
         7QUM4UssqKsorpfJVw6/VBYKNx+NT2j9/RSf+oaZ17hEQN8R7iS7XLLiYUQ7WLrDksHk
         Tw/eTgkK6nqNnHzr9sLVsrhJTYDY5iqiT8fJMrGZ86BBPV6LiTIOlOlkHH3LHXqqIfqJ
         2u4w==
X-Forwarded-Encrypted: i=1; AJvYcCVR/xR1QHZG7yUSP8JSbIXTRDTB8Wnt+S51NpuuvL+ZoSKTZuUAiap5ezJWYr5RGSbYGbBT2PpCJybR6p7IuLWv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp/lE219QDz/f6A07CTJfhefEdREe6HYHqrabjKUthTCahuftd
	4hrgFW+Fi4CrEep6Qudidn/a3LOJDCq1RbIOhujA/arfEmUkE586kvRf
X-Gm-Gg: ASbGnctWD4Av/Dop1un8xQi+QNqOlbImWChQ8xK1XhhNKVvcMQSIuYJipoFAjC1Mqvf
	V7QGp6+PIxuH0HJAY3fcGDhDeMvpievfcSdaa67Qap236diuXzHLjz9/FbMQVMUjob7bJyGdmIn
	mA0427BMENY2YqFN1aLai2R+XY65NgPpsxq1eX6AG1DPyqS+f7sBZN7PJQx2Unit8eG44BSFyjE
	fu6zrEfSMFWRL/0HNtL1EmLBRj2LA4LIA9y4HMeYpXw1IIcGVRzYf8pYi8Q69zSyME+ivuSZPcH
	ug0KX4rqX/4GjBizKV/eJd9knWbvfqFr1IBf4OUTzol/gN2xSeD9zznDPRi4YLMC+ngw1m5cqNp
	+YlSuKDgcZumMH+1yk20Tp8MNw7z92lKUwmNZUZa4NwEKjSnyxDihatUsC7NT/a4txA4=
X-Google-Smtp-Source: AGHT+IGVl8CJiFWkklO6I5zI6wCxzAAtwQhz9tZ2vrCBq6WZrDk7LnhtS7MG6Mvb11mL11vcwI6Hpw==
X-Received: by 2002:a17:90b:2890:b0:321:38e0:d591 with SMTP id 98e67ed59e1d1-32183b3a218mr18565757a91.17.1754863810932;
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
Date: Sun, 10 Aug 2025 23:09:18 +0100
Message-Id: <20250810220921.14307-2-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_151011_753890_230FF32B 
X-CRM114-Status: GOOD (  17.06  )
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

Document the devicetree binding for the Sony IMX585.  The schema
covers the CSI-2 data-lanes, the optional 'mono-mode' flag,
and the internal-sync properties used by the driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../bindings/media/i2c/sony,imx585.yaml       | 116 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
new file mode 100644
index 000000000..020b7cfb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX585 CMOS image sensor
+
+maintainers:
+  - Will Whang <will@willwhang.com>
+
+description:
+  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx585
+      - sony,imx585-mono
+
+  reg:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (3.3V)
+
+  vddl-supply:
+    description: Interface power supply (1.8V)
+
+  vdig-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  sony,sync-mode:
+    description: |
+      Select the synchronisation mode of the sensor
+        0 – internal sync, leader (default)
+        1 – internal sync, follower
+        2 – external sync
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [ 0, 1, 2 ]
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx585@1a {
+            compatible = "sony,imx585";
+            reg = <0x1a>;
+            clocks = <&imx585_clk>;
+
+            assigned-clocks = <&imx585_clk>;
+            assigned-clock-rates = <24000000>;
+
+            vana-supply = <&camera_vadd_3v3>;
+            vdig-supply = <&camera_vdd1_1v8>;
+            vddl-supply = <&camera_vdd2_1v1>;
+
+            port {
+                imx585: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee0..ef04ee4ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23178,6 +23178,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX585 SENSOR DRIVER
+M:	Will Whang <will@willwhang.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.39.5


