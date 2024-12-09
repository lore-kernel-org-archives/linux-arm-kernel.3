Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49875E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=; b=FGsyS1RYVX7cADNwof7p0aL9Vl
	kQjrr1VTOUrnOdKbL5l8sBzryGqxgu2q6eUyBBzVbSoA3uXB+xoY01Qtd2dart3+0xETlYNzbOSki
	KyfVwNotxM46teOvCMPAAzy08Fswxo9M0Q9FI+GL1OTjIMZj5tK87joPwJV9ASx0l9sU3u3Kxs6OF
	2h6y0qkF+SNDNKvYiKIDHtQLyiJlJRJaK0YpAYna1IcjlW3BQZUnzxMoWjlnYCuz1v1elbWR7vuyX
	/8PfBnk0kPyVoPTHSeijVv6f2J1HpaeTkIoyRKoM4vb//M5eUrhK18zHsTizjE2HriS7NZhaK3opK
	jbMaOmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe96-000000084lT-2tNR;
	Mon, 09 Dec 2024 13:49:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe53-000000083YK-21B1;
	Mon, 09 Dec 2024 13:45:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so31376035e9.1;
        Mon, 09 Dec 2024 05:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751944; x=1734356744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=;
        b=bYhqKjR0kibq6wePZ7bBl0obx9b3dQj0Sed7uwW3KZ1XBHk3L6ogbLwgtU44BDEjiB
         AhG8Yy42R2r6f5h7ML4VDDcNrGFMEcGOGTV6EnN+sNficME9pFIQkMZvxLLdwTroi4+J
         MLVY/sypzKF6xxzbWMsq1swS3nxqKd3l1S1Hx0/+EnfcFPIsQDD9bKlPDENaozJNe8sB
         UOz3FWQIX5ITm4XYAzIZG/Dk+xsFwfC6UORNihEdN5buL1QhPkxKcCF9FMSgBWGrQ/DI
         mN4oG6mlt8nGlIFYE4C4GDbXw4uZb84Kxrc4XW+3YZBhPjGx5Rg/xRTq1zWcwGsxj3yU
         qmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751944; x=1734356744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=;
        b=fpFoa7e9IRP9DrOdieRipyO1IYJ7Obh58XbcwWEedl7ugZ4L/VryuXuByGpnQGFiW1
         Z8Eda7N9+lm+zti6LKe63czQwFnawbMXIoxKvoosm9tjVwU4uee5gNEVuAlVvu1CPW4l
         Q4umohzKx+DAub407qTtbyAW2osvvhzVp8tvyrFg2Z/Dhx3c/Lv+8R6gZiQJ/On6ruxp
         b+Y4iMgwHqmUcwZUAinLbZoi3f1/gzWF2Vf+fB0jQAtW3/WOvfKoMLFDVZPsF/OpoGhY
         c7rYatFGlyDaBEJakshmTDuPoQGlzuc1FsiELHYuIv8Kh/rNcZJ5Fv8LPG44aZNuPkS0
         obsA==
X-Forwarded-Encrypted: i=1; AJvYcCVNSa3sdmTppG8z2eeeCIaa+MDZNVINMY9jRyMvBAScjgy2GdSLgsEaPyD3w/92ACZlZmgIAMLwMNo4OMmTpkc=@lists.infradead.org, AJvYcCVYNFAhwDv0Z2sSics+p8wJi8u2NJOj4H86LSZF2R87gP1/+43IvY1HTWm/5In1oKi9DFU2kbXPX03RF2OhPmMr@lists.infradead.org
X-Gm-Message-State: AOJu0YzU+mxJJu7piA8hqIsQkULq6TriA5TRVQhlN6YYbLSm8sXi90pY
	YobM5NMivYalgrWUM0qGOO/rXbrrtVr5LYSDxwlcdGe/upGc1a4R
X-Gm-Gg: ASbGnctp3CxcNE9JVqCpowLrgBhDqYJFpnUHddaIZYiW0mNiqDb5SsvxlDAAwlKyLXK
	W2qNXSU1MorDOZPoJL4YtSmxpVOJDiW7MQFmRNcT9Gleq9H4W5pWw6NuR8bJazUJ36M99OTt4Z6
	sHvMkXhxALdgLUYIZUDnZvShDsqQTZznCeAYTJK8Pv/dlxZBQga/Z1u82jx9+JgIv+1tpnQF8gm
	cVLhbcZSPMhLD4vBiaX2CxZnVw6AQXSDixm7W920mSEYwotP/cXgow0LG9hv2DJ41gygelY2tny
	bvSkZOkNEzfYCp7//7g=
X-Google-Smtp-Source: AGHT+IGr7K2BOLK5syBzNCV2a6l3Cis+RkNWHpzBtkhEyPVhCmLeJOwSZmq5GG5YBIgwWxlygHngzA==
X-Received: by 2002:a05:6000:4007:b0:385:df17:2148 with SMTP id ffacd0b85a97d-3861bf7374emr13321092f8f.20.1733751943847;
        Mon, 09 Dec 2024 05:45:43 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f30bceadsm62705135e9.41.2024.12.09.05.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:45:43 -0800 (PST)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v11 3/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon,  9 Dec 2024 14:44:20 +0100
Message-ID: <20241209134459.27110-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_054545_518496_EA04781C 
X-CRM114-Status: GOOD (  17.88  )
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

Each internal PHY might require calibration with the fused EFUSE on
the switch exposed by the Airoha AN8855 SoC NVMEM.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..63bcbebd6a29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,105 @@
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
+  Each internal PHY might require calibration with the fused EFUSE on
+  the switch exposed by the Airoha AN8855 SoC NVMEM.
+
+$ref: dsa.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+  reset-gpios:
+    description:
+      GPIO to be used to reset the whole device
+    maxItems: 1
+
+  airoha,ext-surge:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Calibrate the internal PHY with the calibration values stored in EFUSE
+      for the r50Ohm values.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+        reset-gpios = <&pio 39 0>;
+
+        airoha,ext-surge;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index e3569fe5f3de..fd37e829fab5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -718,6 +718,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.45.2


