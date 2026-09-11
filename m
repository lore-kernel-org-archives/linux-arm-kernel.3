Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A15C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=SqXW7JZ3Op7BziiVfgxgRCphB5
	5wSC68r7icLdStSYQTQCWc9iWrF3Pu4qQ+Tqj1s5Rjym67t75g0aJaRM+NOL2wXlPWtwKmbYVEP8v
	Sw8/qNCr5LODJ2jCHhxtBzBgMiNkyGADElXDS3MtstfpyMs5i0G36ywq5yz8gywW8lE4pgOwF/9Xu
	SvlFt2ofc561oN6bTsEuW//CZDZBFHJ6p3nGVibKhknNQFTS5yHxXXDk0HR/J5a5bB0yG5+C0zpSL
	o5uAi2kHnUW5+p/9IeHQl5uqZ4cCgXjpr6fJHSb1ABnvIvdm4jQLOx2O5qyHvbceZwET5P015T9E5
	nVaQAxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8l-00000000IuF-1v7m;
	Fri, 11 Sep 2026 22:54:39 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8f-00000000IoK-0lO8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:34 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f89so41689f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167271; x=1789772071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=kVcv7N6pZh9VLymt0+9R5QYmqSCVFj158whNStquL7cTpKGPfKFW5NYOWbY52NfFiH
         vASwEw8tOyEEGwsqxjk8PbBkFQLX/xS47gSip+0HWPgaL6dwgu+baGieo3Itsg3oSaS0
         Td1Xf9bj4BvGlLSebS9+LLmi2qLsjQN35jakXQPRM3SICBLhwchcFgUxfRy8SsTOKB0h
         GslcaUsooQNiZEw2Gj7leaJLESOZhNSLGKonKywkpEs3H7V15i+b+KgTnZEoQvSwYRlL
         Qua3d7zAsgh1t6CB08CKRyWLlXJ0sI/wN0I9375X3h85JVC+y8m9Dxz1f25I5KfShP4l
         4epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167271; x=1789772071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=RB6e+LZkFTnT7grRaMyIpxannJHpqnZRuHxILhKpWwrI8OqgWLrapXG6UMy4jPw+BF
         TpN4HeU6CzA8F566KZuv63pYxS/4dv+9GEsfCU4v+l4cUQIizrbLSSm9u1COKAstRNuB
         OmCtY2xsUx3JcjauSdP5BGCG+0Q0Kvoqozzuj64IsViKNpy8YZzlEKTD6uCxsmnvNbl5
         FRUZ86dWnjtyG6yjygOoOYvmVw1LhOO2Jkr9UrpXjRSUvkgpeCMZD3uk6kKQJbC6pxhG
         zTlvlHBE4zZLJO1dw62NivsqUF9bLcPUjgz6sl2KQpEnABY9LfX+zTCjVUHct5ZJZb8w
         cFcQ==
X-Forwarded-Encrypted: i=1; AKwUvBypMP5B375yZassfUBUQvlOZfIiNdOkSM2e4xswY2BZo7+u3rJlCikdJKgme5koLFDXhmd5RGQXCMmgPHlpR9XC@lists.infradead.org
X-Gm-Message-State: AFuF++nICIr8alXpZbQhgLqscvC7cuIz9Ax0qvJ/3bHM++YE5HP48I8j
	xUidfFNJTqQjiJdr+FEFQkQzS4zBaWNmpUmHTv0tMxspr4g7Ce8CikL4
X-Gm-Gg: AYBFou1XlLMgERz8f1FQ/opoE1yvKlD1fK8bn6G0csOesh0+9z5qI7zgP//Zh2J1GE6
	m14RguYuzOSeDQn7lvHm03e/lzIdxMLsTnQ5X4/GVaAdsIjl08bAjZC83Y5Fq0DTii5aULiyR9u
	pPaf34ZOUjH+E4RlaxYyuz6STDBfD+M8mpkjoEP4XKVk2BxBLK951sQmWQLM4Tql6cZPHBLp/C9
	x732zzoKL+wE3HMdrCOiuI/HteYZVHiFL83/i/jZsArdIUhcm6j9n3byGfYsg2dRJ9OFvD3pNen
	UjijyVfSeux4w3ezqlRl9snnZK+vn382f3Y5l8JT1GO7EUPYJ+v6j91tl97Frvi2oy33fpuhxSl
	PbzdxxdHPNGIycd1vx4OrRgN/nn8V5Un8lgfE0EG2znulPtyeI4vr5HUZvGKxHzlK4hWWUcmZ1x
	NSmwuUjHz8/Y9Hn2Ww4ZLDXi5Alf76Y48qvCBqoV5cTELjMHbYiIgSD0a4uP5wC+Laczol4gVSG
	5qpazYLJJR0f+3B6cZfuGF2SaCccdfUQ+362w4sCss20JrN2MrFecESvCKa4pc=
X-Received: by 2002:a05:600c:3e15:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49e6cbf84abmr1600715e9.27.1789167271202;
        Fri, 11 Sep 2026 15:54:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:30 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sat, 12 Sep 2026 00:53:25 +0200
Message-ID: <20260911225414.225980-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155433_266065_AECBB72E 
X-CRM114-Status: GOOD (  14.85  )
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
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
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
+  can access the Switch register space by configuring the PHY page.
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
2.53.0


