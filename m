Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E68BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=; b=atFaF8KB/tWktI77B9mn8gBq9O
	bpKW0xOf5b8AanHhDcGFmHYSu4ewHc5fCsxvr2B9V84qK2HoJgku8yf7+CLzLNTwt+rPAXXdVEcpY
	MlqIItQbmzPr7GeHzo6l0rWVW8byBIul66PC+yY2GZhlW9ZJ3qGJk2pAhYCXzpPkwSDSlbBBjNs4/
	3sZ40n1BqPAZY4YFESgMQisHfupC6l/BJaa5ioXhv16UOcdsbS4Tl1LDEEvuf6tgZcJ0ZQWBcw/Gt
	vQoPgnuaWnv0YIeDliAc4juLS1Rtkh2HHv0LQEerJDaq6Jrp3EMgXSmEys+JdRVptWEvHII0VpZaD
	WYJ68i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK57T-00000004c3T-10z3;
	Sun, 08 Dec 2024 00:25:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53V-00000004bAA-42ze;
	Sun, 08 Dec 2024 00:21:51 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862f32a33eso708891f8f.3;
        Sat, 07 Dec 2024 16:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617309; x=1734222109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=;
        b=mlHPjkwtHxiAeabj2EaGWZS4cLDzMW9k5I6y6iWBFswcOJwc0BgUBDFZ7xhIHa5GzD
         W8ItYYMmK0tTyXRJ0ydVApA2dl9tdV+qnNddhhrJ8bIVD5yEC7zp8+N7ouFn7Wg3+1Jz
         1pAt9LRdCqSh3Qfg+tNmDQpQmfvmMLskK3xJb7hs5lmZYddRVkt6DCqWZ7/Bz0+FA5ko
         fmFKWPd+s7OYfB/NeAWn0ILvNpdmiT55gZdBs3//txyDjikHrsKcyapCYxkZd4lFYluJ
         AE1Cbqk/4+9yOmyiZLGLYhPsHYVPE54dFg1tXP7sSQleru+OhHyZYez8Fd1IKAuHKQ1u
         UN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617309; x=1734222109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45VmYJNhcmv3fVrk1l8qJCs1SYN4r1JhUlNDp0LuyYc=;
        b=Bs2pzHZqKknZF3ErBA4aQkR4RvzgRlR4mLA89G/MHr2CAZqP1iPlQa7P78fAcGpInx
         HQqbRjKd49n31O16LpLVYRqzj9edE/eQu8bdVLgDP1zejWl+8SoDaAkQ7u0uZoR7HsR7
         Rg/MO8Srlga76wcNhprqNk7ldYQZqtTioGSBPbr2XKAQ92j4rMyF2L9+r0ohoCqZNSO1
         NHyQkGAJfi8i0emn55Zrqg0eb2XP1f6Zj8FPedgHlBLhcXKGyB9969IPgX2Ay89R6H/4
         O/ZnH7O8qmmMqPMNzdzRYE6o1B0MavK8bklCnEcPU6uxg+3ePGE0DV/3/9AC/PI0Y80m
         NHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZB+Flc/9JdpMe2lVBmVbCL8NnaYNcJoQXiZ5jqfPv8kFh77vbK0uPJLd4zM5XbQfrgvBrTSwgdKBBVP/CO/U=@lists.infradead.org, AJvYcCW5Itd4LNG7Cz1m7x0QlXHzDOKvSauKgb7UDal4+bewC32p+TEZQEFxsWWgdk+GtUTni1E5x8Y1W5NbPtqof9lT@lists.infradead.org
X-Gm-Message-State: AOJu0YxRDCmh6RwbQW7ndiuIKqvkcEO/KTdyOuj+6Ywcg1dBX2Scyccc
	oYwS8zzN5g4zhRtDchuaJJdK+64gSarqwFuIFmjD5GEpY3qxyEtl
X-Gm-Gg: ASbGncsUT/Zr0NOy8qLeGEKpdu0BAaQZi1Rx4CV6sv270xmHBjoLD5RbcKyEWdMtkNk
	B9XRRTGpYWecLmdI8ZMKpVRy6uqzm5x3fVqHCdfMPQXGL8zVpbovPh4/Zjj5cdFbLlDaqCG8Y8T
	M2diaMGUnepXpianxJTr8eLde+un+DyQ4yJlaNhMlce8SySZW77IZ7C7pyCyumQzUCW4whgrj7o
	Pg73Op8z8RxcxFlmnpw9ioGzP9OxYQrTekgU6AgysP2Xq201NxsOQo9RessV7m8QkginRe03Q3W
	ZB/2qJ+3lCofMRk8xHc=
X-Google-Smtp-Source: AGHT+IE+s/gspwYFYg8pezeI9DQmCJfh6aF6rkLll78p+H9HlSs2z60eiD6aoDwEfVvunic3yb6nOg==
X-Received: by 2002:a5d:588b:0:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-3862b37afa8mr6349809f8f.34.1733617308528;
        Sat, 07 Dec 2024 16:21:48 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:47 -0800 (PST)
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
Subject: [net-next PATCH v10 3/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sun,  8 Dec 2024 01:20:38 +0100
Message-ID: <20241208002105.18074-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162150_018368_02FE9F45 
X-CRM114-Status: GOOD (  17.38  )
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


