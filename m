Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1612AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuJuN5e8INaAlM6qxY9WAob6GPx4Mq94a1xQWHzf+1M=; b=vb6niovUVSoujByG0Go6KmKmIG
	qCKOch/z2gsclBzb+j6dF4unEBKbsHFdDrT3ZyTPVPJyeuVFmUyMXJ+4OBlMl8nQ9altE2AN5jbT/
	OMHBGBMyTLPj6Mtd6pQQWtjFb2IzKiE/0Q8f1jlJqZiP/0ohEBM/4P7qf9rWMgKNpU35K7vPynZDu
	V70nydNiE92+elakoWOaw5S7JqGM4HK6p3VHB1P6clzF3IyomDHXePQFM/FzlndBuLKv0j1Dtj/X0
	zOC57upAF47+KY7t2NA9YRexaZbVPmtR2RcWsk/c6LjQ3xO+6EW0z5igoo4v+x+m/rYBORlPYm/zF
	4bf0tkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGzv-00000000cer-1LD0;
	Sun, 09 Mar 2025 13:47:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk2-00000000aUz-47Z2;
	Sun, 09 Mar 2025 13:30:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so28805695e9.3;
        Sun, 09 Mar 2025 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527053; x=1742131853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuJuN5e8INaAlM6qxY9WAob6GPx4Mq94a1xQWHzf+1M=;
        b=LqBXLfDKk315DqvHlh/rHlP/Whae3AGer7zi15JPz4TpcXObM8ZerT0SDCBUavDwJD
         GTv2HI4oF8QW1ObgQWRDiUjZcMEgOX8aMazK7NQPn6g6GRcPOe+mttGzvmjJjlE6XLAk
         uTegxbV1mpp9cw0uEBZW9j4cvHaJ3q7T0POnWPeceqELqpoODB1ZNVC2DIZ/8gns+tH6
         C5A3OPO+AaGRl5NgRZ2Tp01NtMjyru3f1ba2o8+A8VU4c6SfDEKDmvz+ASD4JFk+41TO
         QwfZpCNjRmqVIRUYaeVPBtR8qisH9dEkJPlyv4y5ZExz0y9A5ZdLtBjwaeUaNYW6KPlg
         a6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527053; x=1742131853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuJuN5e8INaAlM6qxY9WAob6GPx4Mq94a1xQWHzf+1M=;
        b=oxgJQztRekNfPhqBpoMpr5SDEt/qfYHmbfh+IlTNkpW/yQy3DPJnaSU77sWnpHMWgW
         gR9Za/cI6q4JA5A9UdhThvhYfvegM/wNJbvP90h+ZZ+vLs9gsIet5TI/uTC2TDntrm6G
         yHvDLCjMl2inhAz9/nX46xwlGsAcmmNOs84+9XVMsVfTB6f27TiTB23AIf6eGjoxcPrx
         gQUXiezpiNH1Hh/IYyJpw5Kg3zRbjrrC7VihN0hbvVMRK2gchG7mSmfOqT8xVSdlRSot
         ZJVQGZuqOsWEWh0rN+zCxJ8MjYqUOvpVPTZVFJn921kGE9IOEuwinScqMm7aNiZ0XL/I
         BXxg==
X-Forwarded-Encrypted: i=1; AJvYcCV7OAlLurAi9De2m9E+K7dUt1IjM3+iKikmqo1kJDL3y46cB0XChNuvpde+h+byZq69aokI3TUpKKiEtqMIo8Zn@lists.infradead.org, AJvYcCVTYgS61eyPmtLf9GBvpk/cJb9RGPWIB/sb8aH4zyhRYmooRyOipcdSj29dgLN3xRYH8ud6ViRA5glWNO2w0UU=@lists.infradead.org, AJvYcCVjP6e4JnRb5tTljpzyrDHe++t3y5q2MnngOF8r9koCZvTYklf75ZbXlbhe7vVznmurHTCFKLhb4y2P@lists.infradead.org
X-Gm-Message-State: AOJu0YyWFJ47fRgjFcIaFJ2SpY/eyvAYPxKwwknzcdiYQw7Xj5iiiqtV
	1HAXVPrzqf/ZCQpidk0ZwAWai5tsNWo/iqaEM0b7/J02K346/Dj9
X-Gm-Gg: ASbGnctRJ4iSCbWJHXOIdHoNG8XzbfHjHQGqZ/u6hgZDXDvdWKDf7871ZEM/+TKi/oZ
	GT5SJwncEljB9JrO3X68tZq13H54KyzVqO+g0TJsR2Fq8BEGCWWZH5dkuhdPy32B/9f3eNCRIAV
	SKBfLix/OrKXLPQgU1ErGv99i+H7nRximMXeVYg0zYqNTxHuPklJusjmoo8yVsbxkythPCkXWTQ
	B2qN/SL8iMv1/uk+We8EcotZNFW7ELJiTJ29pi1ytczZYPGo8jyL6fruJUGlBljYYIU6eWJ+wTH
	Z+oENIldO/R4GvZfg4NPxrvfaVRukigdYEQ76lV3JGsdUI5yC0J4BKiugMHMDfVGi+88AwLwsf/
	V/jwxvzqdSqxLDA==
X-Google-Smtp-Source: AGHT+IFGo9ofFT7kEEvkQR0bhsGyGhheZZrnScLSJMBE5tOsiIR0FkCqZHSoqIPzYPa4wsJvnG0KVA==
X-Received: by 2002:a05:600c:1553:b0:43c:eacc:9d8c with SMTP id 5b1f17b1804b1-43ceacca0f7mr22400025e9.24.1741527052936;
        Sun, 09 Mar 2025 06:30:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 09/13] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Sun,  9 Mar 2025 14:29:40 +0100
Message-ID: <20250309132959.19045-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063055_022315_F947A70A 
X-CRM114-Status: GOOD (  19.37  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the USB port. If USB 3.0 node
is defined, then airoha,scu-ssr property is required for Serdes mode
validation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 106 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..39127cfb63a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the USB port. If USB 3.0 node
+  is defined, then airoha,scu-ssr property is required for Serdes mode
+  validation.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,port-id:
+    description: Describe the physical port this USB PHY refer to. A dedicated
+      osciallator is used for each port for the USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  airoha,scu-ssr:
+    description: Phandle to the SCU SSR node for USB 3.0 Serdes mode validation.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  usb2-phy:
+    type: object
+
+    properties:
+      '#phy-cells':
+        const: 1
+
+    required:
+      - '#phy-cells'
+
+    additionalProperties: false
+
+  usb3-phy:
+    type: object
+
+    properties:
+      '#phy-cells':
+        const: 1
+
+    required:
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - airoha,port-id
+  - usb2-phy
+
+if:
+  required:
+    - usb3-phy
+then:
+  required:
+    - airoha,scu-ssr
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,port-id = <0>;
+        airoha,scu-ssr = <&scu_ssr>;
+
+        usb0_u2: usb2-phy {
+            #phy-cells = <1>;
+        };
+
+        usb0_u3: usb3-phy {
+            #phy-cells = <1>;
+        };
+    };
+
+  - |
+    phy@1fae0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fae0000 0x10000>;
+
+        airoha,port-id = <1>;
+
+        usb1_u2: usb2-phy {
+            #phy-cells = <1>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index fe34c80b8d52..c2dd385e9165 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -753,6 +753,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yam
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.48.1


