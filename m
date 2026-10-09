Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8268CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=HtP/aE7qW82Ai53ioKZtTfIBjT
	/KHs78Y65xMLpytW31X1TUNtX80DOZBJecWz5giEdzVdSL/mTU74322ThZYZjhJpVLxd8A5mZX3ri
	maeN1HB4HMx0/V1EBLugFkNzhHKf20b/lk+H61wuy6hznijcXY5OLbWJhX9FZqCxPh16AsXL8i4X7
	FcK8JHAd1fDvZa98XtVrs1qPRVoPUymPmZAHs6fMzmsJVPn94Wc80q1YHNwcsBeB6PwbehxwG2KSQ
	Jqncxk3q0AJK0sliqmum1ARRdAVs0JtaUVCU9tl56NfzxppEnEiINhTNw9TGt6mflTZWf7cYGds/2
	net73vGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBr-00000006cQn-1Bb2;
	Fri, 09 Oct 2026 16:11:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBm-00000006cMs-0C8M
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=HiCi11j5snowk9e4Y3O1he8I+b
	cd6SKx0yXBsLjklQo/rB1uoO3egFSnFwnLcAltlXofZEQNHwI/5IJlm5m9CmmskxF96PRzsOzpfZY
	0O6P0Z0iXadVrhARpp6GHn/JGrvg8oCY26X14DVXGtxYXbTaeyCAUt4NTAAIDjsQPAwAQ9Za+sIrM
	wJ5VUR0Csjh10A7TUBNXJzK8yAqXlyhZRIe2nLNx0oFsttjQ5ArMVC8B1deDuB6j3L6dAOsX+WsTw
	w9eU6cLZQb8W63UjSLKNIrSYQXsoU73VwEOJus9b7AGh7H6CrXm5vzgFxl70MPm1674D7NdUdXJGw
	Fm93hFNw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBj-0000000BOjo-03Au
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso3506396f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562273; x=1792167073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=WOCWo1imHeaV6y7yCHV8TXOg2t42HQLmbd9BqPjA6H3OO69azyLjzPseMlffwIOKKP
         05o+RYVUDxUb2LgwvuwyEXNhb0tiYOYkeG9cr3FJz3cYjnnewdo79kiwnSNhtZj54UL5
         gTNRgeavHvPwPRwddtBDSHSoUZIJCDZeMqsQJKiiFS0vamdXYE4ywUN40fUEBIkBRN1S
         AhX7ZNHYUJfIuCyWZRedCQebDCHLl4OpkCsM/jQ5GDVe9sMSETdoLw/CPRQdivxBk8Qz
         pp4z+Hjfhdy/MChj0C4PNEQUs1NyU7tlMchdjzIsbWYTRiuiWPBywHGHgB4P+RjX7ma+
         DuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562273; x=1792167073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=VGtQMqsEV1w5GXzsFifpWe53sOJoqw8mn5oqhtiJ4R1p0wcQQa5Zyda76jW1r0PwZ9
         /2aj6HFWbWJXfiyhAwTol9UxIBqXFJV/puKhIoFX3Ri3Z85JXMw38SNfoBjpYqHS72Uc
         Sr7imd7P8txjRIDtzsZWOMycZ+bQucQ5a+SlyM4/YJn50UwiHFiTSg+7pjyRwPFQeupi
         NmXHnTCbgiDrWVJd054GGHfOwTpDEbENjR3rJK8NmxUcip1iFsQZJV9YKp/3qlv9UAIm
         SI6uVsVtC9CxqMYdfh+V72ECSrFwKphSSnyC/QlpxWsa1PITQBQA+Boh1h3uOZugsohS
         JzPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVT5ze2t8SIDM0feOYEPPx4Lo+TfxxfnvRIaYJe2KdmlGT1mCng6p9Hz0Vemer24MRRMFSTjsXkZ+S+klhxs36@lists.infradead.org
X-Gm-Message-State: AFq9FYKRjgDEMc6pE9FcC3HVNRvdXpP7H7dHvmAPp6MiOSOqygWa144G
	GQGUILALMB/WVVGJKhMUd6HdRFA2vrDqKN/iLM/22jrJpkdR74LrNxDL
X-Gm-Gg: AYBFou3CvmzMUS+pkTL8fVrWO7GBwW3cXpDFI+rtXi3JwWZ6pMcZJEuQxJ4xg+2gxAl
	l++BZ/hsnWtvkvc5+JmUmAdalRAxvw4riAdsuxxqWxhbVoUhCkoifXyoBv7jWFpFNm82shyhnEC
	qEH4jOXZTd+FuBi4RBgwh9PWtlyT3YiX88PySdOQSq3off2jhyFN25n2U3/dPGx6EMpb20oC53c
	jodUOvoiwph5eSyHyVQn0qSki9ka3pCj1Crzw/Jt7scYTEDwB0VAC6ik91YlrvKeODLFa5gecGk
	qZfT5hxTFXNYPpmIhJMSMVuXzrc3t61S7ISPQdrvWq4t4jGr3FlflRQO+L+wNH1gUNpc2kVmpH3
	e75SZO+VLlLQyJDd9wiHKBRiyfvbevh2bVoPDz6j8sfDaDhG8ZVgW5oBCLhtWd1rbtrtV4h9xCj
	UA2ymKzLOJXXZ2gNmaOOvXmKRLsIrbdeabA33KSlFpLY2KFv8GqzBPeTwvHtJnlmztgxf2q3WR2
	k7NNLkzmqNWn1UITnZbroAbLFwNzD5jpH1zmHOP0zHO51bLwKWp0KI6N7goVKrrRpnvu+tskDm7
	qRdOZEYvWnstw2GotA==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr3915875f8f.3.1791562272816;
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri,  9 Oct 2026 18:10:46 +0200
Message-ID: <20261009161102.38961-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171115_194375_FB03F63B 
X-CRM114-Status: GOOD (  16.37  )
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
2.55.0


