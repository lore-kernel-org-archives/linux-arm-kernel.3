Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FAC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wzny4taQLj1D3V6dnzLdhCUE6QI8w+14ASroQ3LbmuQ=; b=0qK3Kx0VrLx3l6nC8uL2EW4mro
	QwLupp1RX6LhBQE1rd3TN/kx7ubDnTlYpE1Ou4c2QZXS0OtSqlaxeAMBMcWGNoq87bVOeWpi+Qa9h
	0RW+hJ/OJdMf98tdyl9thwZxc4kfNhHr5E8LNDqLeP4tUJRMvbtYM/HQSIG8+r/SCM94ucPa7i2e0
	eUPrEPADywB1xaeuvygvYPFIJEtGlfDiZT5zII50O1Fxe2UAc6FkXOp3CjgqHEsaI9KId71EbkEE8
	lVTTpk4gDRPO6xUbc3bOnFRUOqKFBlKardg6mo1sWRUN2Czwtyqc1jyYlRaWiqpuGIRPjpu+FJcM4
	3l+VRqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8RA-00000008Zra-0erJ;
	Wed, 16 Jul 2025 20:09:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7r9-00000008Uur-2SjK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso239200666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694314; x=1753299114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wzny4taQLj1D3V6dnzLdhCUE6QI8w+14ASroQ3LbmuQ=;
        b=fHZFw+DiMuZoFCDfdPtVUuNEAuiWV6h+nyntdvDTRmq3T9oEC/rXValBUJqLnFwPYt
         k7Er7fkZUXRVca9gbtlz53lXs5tfdkEmsRRfUM8iX0V1mgJ9ZFgh01ltyJv1J06wPEdh
         GLrincnkuJrmTLbSP6LtHfkqkUpCLQ6Y7SxcoLjfgJkR7GSAsS5cu6V4c5DQfac9kbIO
         KxG1brLhw73Cy8iU7M7wOBVEfGtrASk8rOglnicut1xSalS6k8dCXoYAekVPAKBB8eL2
         KgfmbW1sn+FrqJZboTscqPFd0HEr2ZvxVmK+rvM6j8KzGxqrPl8QCzO9+k9sxaDF14sE
         ZJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694314; x=1753299114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wzny4taQLj1D3V6dnzLdhCUE6QI8w+14ASroQ3LbmuQ=;
        b=O+LKr1DxqWw/tQJqJo0whmxHDE+YsqxpWBd7MuKmu5/pjqtIMRlTkK8dno+v2oV/79
         4awiIT2uTaCxQfivpaI9jGamoWFjGG9qwyCjYMX3RMcG4MSOYIrv08mLQRuitADB0Kyi
         C8gKE+9ppBzvoh/3/7n/DoPbDX0zYl0TEJVEqB0ZcNNNMpxlJgN5USdRoIxrfHF3Vy2u
         lIKsTap/4KeaYoLo7htqDUlQtHSrFdCryN0O6gTh0VTt9nR/hxsPP1g1sC7E3LJ/CHqg
         MIjOL2/j8PC6g4N2QUwaBUlbrS1hk7NvYWvPmaEXsmxVOVUB7JFLO8jQcB1aW+zQjq38
         hGmg==
X-Forwarded-Encrypted: i=1; AJvYcCUXLdCzxpqOV0yu/68DljOi4ltsC3eUkjPFKObieONbF8m64lQ1w5ezlGjY9Vamu4y3X/OboPc7o2UMSdVa6TZg@lists.infradead.org
X-Gm-Message-State: AOJu0YzN299c4v+BqXnaWKIqrjjCrdDhET8PSWJdTF01T5viFkCFJI11
	9HbjvHVFoYFNmZCZrD/Z2tAqGRb/e8FEUrpHd9dpr8G9+eqFVgdpCuYK
X-Gm-Gg: ASbGncurYHzwwPelcoQUpoYAob4TpM+KRuXcPUkBhxoddGFtFUaE+t8I+8sVp4Xah7P
	GBzMET3UCFWwilNSQweF2Y8f3o3s3D53mbiy9EDZmjc0xxeuEWSinzU5pCyy593Tj7c6xP+CGKG
	tZqHGvz7Fi05ZxoKCA4io69yHhrEeYhEM4RcO2BJRkvYZPVPex6yQ/B4vH3AYM9ueAoEGnzGmtv
	/B9l3hJT+2906dpD3kzwF2ke7mEKXMkOIGhDhgaO4b+SpgdqogCIp4AphtU2P1TLXYzXJux71Lf
	mb8w7TEjan0rxT/HPOX5xLIPH1lgAoGhXHZ+f93HnEmDpy3/aV5cr4mFDgxNcCHQwKJRaSFmIM6
	YBLHCzAiWb1f5LUTUT2yiQsySKn5eeunwewYX4s5QjlfWkw==
X-Google-Smtp-Source: AGHT+IH59Jx/aoQ0zsOYKfIm8cr4n+ymlaW8F/b0YB09smct8JEhsygHq1XYVtPngtMYuVhz/99i7Q==
X-Received: by 2002:a17:907:b816:b0:ad8:e448:6c64 with SMTP id a640c23a62f3a-aec4d7ec638mr49736766b.24.1752694313829;
        Wed, 16 Jul 2025 12:31:53 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:53 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 14/24] dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
Date: Wed, 16 Jul 2025 22:30:59 +0300
Message-ID: <20250716193111.942217-15-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123155_627682_DA725D99 
X-CRM114-Status: GOOD (  17.31  )
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

The MAX9296A deserializer converts single or dual serial inputs to MIPI
CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
in the forward direction and 187.5Mbps in the reverse direction.
In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
GMSL1 links. The serial inputs operate independently, allowing videos
with different timings and resolutions to be received on each input.

MAX96716A supports both tunnel and pixel mode.
MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
new file mode 100644
index 0000000000000..c0a8916353f6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Collabora Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
+
+maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
+
+description: >
+  The MAX9296A deserializer converts single or dual serial inputs to
+  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
+  or 6Gbps in the forward direction and 187.5Mbps in the reverse
+  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
+  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
+  serializers with GMSL1 backward compatibility. The MAX9296A supports
+  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
+  allowing videos with different timings and resolutions to be received
+  on each input.
+
+  MAX96716A supports both tunnel and pixel mode.
+
+  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
+
+properties:
+  compatible:
+    enum:
+      - maxim,max9296a
+      - maxim,max96716a
+      - maxim,max96792a
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Specifier for the GPIO connected to the PWDNB pin.
+
+  port0-poc-supply:
+    description: Regulator providing Power over Coax for GMSL port 0
+
+  port1-poc-supply:
+    description: Regulator providing Power over Coax for GMSL port 1
+
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-1]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[0-1]$':
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input ports 0-1
+
+      '^port@[2-3]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output ports 0-1
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+
+              link-frequencies:
+                maxItems: 1
+
+            required:
+              - data-lanes
+
+    anyOf:
+      - required:
+          - port@2
+      - required:
+          - port@3
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        deserializer@28 {
+            compatible = "maxim,max9296a";
+            reg = <0x28>;
+            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
+
+            i2c-alias-pool = <0x40 0x41>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    des_gmsl_in_0: endpoint {
+                        remote-endpoint = <&ser_0_gmsl_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    des_gmsl_in_1: endpoint {
+                        remote-endpoint = <&ser_1_gmsl_out>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    des_csi_out: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        link-frequencies = /bits/ 64 <400000000>;
+                        remote-endpoint = <&csi_in>;
+                    };
+                };
+            };
+
+            i2c-atr {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+
+                    serializer@40 {
+                        compatible = "maxim,max96717";
+                        reg = <0x40>;
+                        gpio-controller;
+                        #gpio-cells = <2>;
+                        #clock-cells = <0>;
+
+                        ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                reg = <0>;
+                                ser_0_csi_in: endpoint {
+                                    data-lanes = <1 2>;
+                                    remote-endpoint = <&sensor_0_out>;
+                                };
+                            };
+
+                            port@1 {
+                                reg = <1>;
+                                ser_0_gmsl_out: endpoint {
+                                    remote-endpoint = <&des_gmsl_in_0>;
+                                };
+                            };
+                        };
+                    };
+                };
+
+                i2c@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+
+                    serializer@40 {
+                        compatible = "maxim,max96717";
+                        reg = <0x40>;
+                        gpio-controller;
+                        #gpio-cells = <2>;
+                        #clock-cells = <0>;
+
+                        ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                reg = <0>;
+                                ser_1_csi_in: endpoint {
+                                    data-lanes = <1 2>;
+                                    remote-endpoint = <&sensor_1_out>;
+                                };
+                            };
+
+                            port@1 {
+                                reg = <1>;
+                                ser_1_gmsl_out: endpoint {
+                                    remote-endpoint = <&des_gmsl_in_1>;
+                                };
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 93e22dfd61c17..0eb1729ae1647 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14783,6 +14783,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
+MAXIM GMSL2/3 SERIALIZERS AND DESERIALIZERS
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
 L:	linux-iio@vger.kernel.org
-- 
2.50.1


