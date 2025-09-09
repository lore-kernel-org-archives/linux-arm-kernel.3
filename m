Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC1ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBMh6U7IINZK0L3FC9uf7py/PwEZtlMrxhEeK3aMbd8=; b=hCFGB0GdoLIIs3AtVcLIoCZy6W
	r+i1+kh8CdcHAnmD/CAM9M0xeK/j0L7F7vIiCb1LWdwD3XZUx6XbNZW9zPvlwbdGAR1LZ3oZcDzB+
	SjKQQ8M8YJxEyO2Mx6ErCWbrtNNtgLp6m2UAdxY+GE8Zi/tIDs9XJdoH5gJyT8O05eRAUOiLGztWT
	RZlf5MQc503xy2j9S8fdokyXIIdGKp1aaOMLNzOGZ5uF/R/d/crIW3/5i8VB7Ep0Chv0TOSwVcfua
	J5uYQAvbaNbWSXhUhZ8+QCEuzikS6+dY5smGgJDS5gMIRNFBBm+F+C3oOdBsqnX4skJ2FAeOmjpkE
	fJvSUidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFK-00000004tqm-49K0;
	Tue, 09 Sep 2025 06:54:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSj-00000003I0n-2sSb;
	Tue, 09 Sep 2025 00:43:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e537dc30f7so1541871f8f.2;
        Mon, 08 Sep 2025 17:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378636; x=1757983436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBMh6U7IINZK0L3FC9uf7py/PwEZtlMrxhEeK3aMbd8=;
        b=jI7S4cGHdtRMTSyfEgZMDxx8Up1NmuOCwjtpewIVO85Hk7wLZNgWyaQQMy0/umKcLx
         8QdX5Vb0p3G5mcktAw68CBZjUkQ1+4qllq/6/lAGzpw58db/rJ9F9Jzc6afKuTIyVUTx
         H1GKp7gu2+m3+90mIXEJH717oah787ngDtr3bY7H4s9XKwyhwV3hH1RmRg7x237eZlwi
         n1NcHkIQzQU3MZxqQragID2TmHVqQvwrr2SfYnyv+yja4ooO+cAAypmdIyv2ykJ2k2kg
         APubrV2N2/ySSGb/Yqukw6KG+MHVhr6Pcp5rjIKeBPi9uJpfZ009ueT37WNNFVtMq+qx
         g1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378636; x=1757983436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBMh6U7IINZK0L3FC9uf7py/PwEZtlMrxhEeK3aMbd8=;
        b=cqLMzlVcn3w/yj5txJLBCWuCBm9tRTWbZczQFLDWZ8/YGAAP/mJhezAzreJXEjL4qb
         meBoVHl9e469kA56ZtyxIzW6YMfNKuHwgyIz7ieiOEH4jMeALbUf59AuyHToWKyapcuT
         1RV77Zyj8Id9u6APglmegc8fXpjRObG4Qu2HvPXof0Nfhx5p1pfz9P7EMiPw2eRi/nSK
         AfCrWLfLKrhs6V8U6X08Gga87EZYOBzwLyerSG5620H8QVcSvThZum0SFUAZxnnTh555
         Se2v7faauuKXZ6QEs1BXXcNgEhyF2B/+EsaB7B9BginG5IkrmMwUi29RxExCBbvKKaij
         cZnw==
X-Forwarded-Encrypted: i=1; AJvYcCVKek8V5qxqhrzz3AvlmrlguUeyqhOcBElZ6RWzM85p306uqAWV2i8tFvbKlViXjpsk/qUrwQ6xCrHTUz2TWYM=@lists.infradead.org, AJvYcCVyq9iNtBIowf7JVXqIkCPZ1regZv4OnmZhHBWn3VG7LlA9W2RNrGJwk+y9+833rjPqNZUDSHpkCLzvU/t6vQAn@lists.infradead.org
X-Gm-Message-State: AOJu0YzSHVoNZI4Vin3mZ1nc943sHndhoD12gNi9GzpNo01jg4Yo2uuU
	rIgYRf39W4Dig1Y8OIUjVMu9f1qOJNj/C3Ed0jYZiDk4wLpimQwQAZDs7zwwoQ==
X-Gm-Gg: ASbGncuqb58u6trY1JS6rKMUP4+hDhtS5MqvXuonE5FaTItCSsWoVqhJIShaOxDtCwR
	KnT/Ognqtnv/NzxxtAe88spaCnXQ0+YTRhA6E8I2wn7Kf7kuxRhu7wAn7kiqMIszCBisZ/RElgT
	s9LKCI2OC7PDIvYScxxtiu2WHdh5i4sZL7MT45JgdZHp+2w0AJ+qu67TxyLX1jCYD9fRP4K7vTL
	D9/BQPM4i/sEQ9/l3C/rGuwsKsrLMAetbtCZjHIPARaicbr9plN0bCatNhLZbGSaoArAa4qqNVs
	Y7xl/Z866Pnp6G4IzmEOYr6L1rd41seE9Uv5QBbtF1v8RNdQkTNrJVs+D7xQKGUCrZ1/pZKiJqJ
	yQ0yjp+sceswRhD5yElZYLNna8GigSlqNklCd2IQY++pPUKDWXIICZzWjZH36GD3hwNS/s4g=
X-Google-Smtp-Source: AGHT+IEe96rQnJG/KyahmEcxLBJAxrwyA1aQw4dCdJG3eGjrRHrabggE4KXYCT2knLVEDci25hiPVg==
X-Received: by 2002:a05:6000:3109:b0:3dc:f2f:d43f with SMTP id ffacd0b85a97d-3e641a60681mr8139409f8f.15.1757378636062;
        Mon, 08 Sep 2025 17:43:56 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:43:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 02/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue,  9 Sep 2025 02:43:33 +0200
Message-ID: <20250909004343.18790-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174357_723435_E3D7E27D 
X-CRM114-Status: GOOD (  14.46  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configurting the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..fbb9219fadae
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configurting the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.51.0


