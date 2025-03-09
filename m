Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A07DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OO5bhUSug85JnTxop3j0N4R2QYNXLJGDFenf8aqUDuQ=; b=Dl5ICclaZS0o8dyD9Bc/7wez9Z
	GoyAGQgsoV9kbiEu92ZRz3w69sDlDiwIjlQhvx9+Whf3UgyW/U/WU85H+dvy+026cRV6YkFfafbgb
	jPmCuMqPLmt90V2iJx71COU2MeeHgyu9xibY1OlKMhj6MbdCDqibBNbtJFkk0Bwb/Ir37BzKy2ENy
	sQi/52AYQ00TtJ0j4/KyMeD6saD7aBRlEECVusd93cKVglykVvQT2UYrd5WFD+xmNqDBdm8czEu2F
	lgI0n9nPzIcE3nIs3sccbG8IU5KNJVJ4EpvJ1Yr5CToUrFGYNffeSk8yySJXNsn9TdisnMsod57Qr
	xdLq5lug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCdy-00000000Es7-01Kr;
	Sun, 09 Mar 2025 09:08:22 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCLE-00000000CWz-32kE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:49:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab78e6edb99so496311366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510139; x=1742114939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO5bhUSug85JnTxop3j0N4R2QYNXLJGDFenf8aqUDuQ=;
        b=nPZNmdN53IP5yuRcyRG1mZfJ+7/QESbh4USPMVJcd2UEkjj0lAZ+b0TKa7bgEvKpqz
         1HOwMc8622tRDcwguK7GUzIX/6k0DIcHwGZwoESqQnqa5LnJXkcyI+OpRJNat8sGfpAG
         QdGSDPmk0DctfYmFq2Ufha9qvvzJ2k2YQ4pl4Mb3ndHc9uLLbmqQwB1S8s4wGAhTnThx
         +KlwFSAEYMJwDnorLSYX/WeUiRFmKyNBR3M3U0kQNYIGD3/JGcfikg4TfmJPrVJBNXBp
         AIeypPhJXMDLkE0bp5lb0azxNGRWHXtORiKqDv6n5VyqJAOPeyrrfFDnqVBucSKRINqE
         iuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510139; x=1742114939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO5bhUSug85JnTxop3j0N4R2QYNXLJGDFenf8aqUDuQ=;
        b=BlY8Z3xR22xRsX420ACvcPX7C/FPDlzYSwZltxPYeiu4CsAHwzy9rKgChloeympxMB
         5SyHheLf760sIGCgOax5qqk+pg8bReRFT7R8c5ATJzmM6tSyhyTwktRvIzadRZehp6tl
         bbx3Mg8DYKb157CzLAiwHVKIZ97j9snrmqwqKO4sP1HehFDTHAdZBGfnEfqUxzhpZDti
         9XBC6Wqdi5hwcXej8y0zWkrLxlp0HJBdlB2BAFxZSdrjAqV+Pg4en1QT8QGt3AGKZe2q
         e243erY/R+v1PzIZ8DodcOMbmYzLCyBX3XKboBGywTg9r5+iKpwx0Be2Qfqt3sT/ouNe
         zK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1zHmyYLfyYl9EtwknVa8fKnsOvGKQWN+vdyE1V2biVrI1Hb5oHJzZS38Pz+BRbdOw2fMssnV1GI4Vfe8303+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzXYHHtv+Frrw82P9Bng4HyWfUSpDtZ/r5ZtEVrArpAGVHHS7pf
	nby0T6YYYSVWLtlBhGy2HPgdI6XKBCi1TkGLBTS0Ukjll5jt+rn1
X-Gm-Gg: ASbGncu5ZalrVq2B2orv+gHsMfveHohDP1gosLI6XVSoBxKu6EhU40i2M1jCMcsdpyX
	RyM2ykOHpFq+fG8/iU+ALhdFtlNgKs32fihelpqHwp/PnUqT0cfjAKCK3dQtguYcX/wVq+5PplH
	3e2Nm/QHEZb+sgX33nfg9lcdKON7June9tAp7L4/HOr3shgJXsz3Gfc0YSC3YkRsMpxTPedx5Ks
	mzZPO0jjtkA3J6ycCHIwHROAF6yRHDEIASoQZ9WzbYuw/2WWQpOk2vC4d4pjwaCWOvZ4dH4m1wX
	MUUx3fl8jmswxsWNUYy0qTOT1NtaBAuLzDJ3HEGhsvXuk/lHI7t8mNUwKQ==
X-Google-Smtp-Source: AGHT+IHy+LzMc71mwJVmeE3VhZ+U7VNFDB59nt4xluoaJbc4P+gscKNqhjrxEMwyTZ4CTBs88BRRQQ==
X-Received: by 2002:a17:907:3f1e:b0:abf:4d97:9ec3 with SMTP id a640c23a62f3a-ac2526434f1mr1147304166b.13.1741510138833;
        Sun, 09 Mar 2025 00:48:58 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:57 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 11/16] dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
Date: Sun,  9 Mar 2025 10:48:03 +0200
Message-ID: <20250309084814.3114794-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004900_767139_EE755FA1 
X-CRM114-Status: GOOD (  18.55  )
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
---
 .../bindings/media/i2c/maxim,max9296a.yaml    | 281 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
new file mode 100644
index 000000000000..97731549d161
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
@@ -0,0 +1,281 @@
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
+description:
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
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    unevaluatedProperties: false
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
+        unevaluatedProperties: false
+        description: GMSL Input
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            description: Endpoint for GMSL2-Link port.
+
+      '^port@[2-3]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output port
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+              - maxim,max96792a
+    then:
+      not:
+        required: [i2c-mux]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max96716a
+    then:
+      not:
+        required: [i2c-atr]
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
index abf3afc95fc9..c1e01668e81a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14220,6 +14220,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
+MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
 L:	linux-iio@vger.kernel.org
-- 
2.48.1


