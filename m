Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7751CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrJZHKOiBKCtVxeIPXfxHsVOtkQ0i/mxMKjggmAExVM=; b=3Uh0yfS883dHVUXjlqtT1lHNCT
	rDpPZPPkTqhRD8rHE7fAoSxdNraGuJ+jVhNL1V0YK+JcgC/CiekwGbbGo/E/oENxSC7pNZhNjwOAq
	+cIpL0dfkgZve3pvxraummgbxSCMxyM2Q3HQiWZryxmiAFoB0kdVOjGGZhaBQb4yCOyU44j1rzIJv
	WXmXVnCxeR8AumGO7jMq3Vl+iXlII4JWer1Pp8+dVX0f9UuD7jFHrZGlUz1eE4kSC0A+V/S9cc7gJ
	jXIDiYNzks6V8+gSttbBsVnV5f9rxqiLtw6m3U/ReqAwYxQYvshnIosVGqCctQzXdaydVVftpZsiy
	4SoNwvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6ih-00000003kw7-0vot;
	Mon, 15 Sep 2025 10:46:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6id-00000003ktX-2MJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:46:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so25703105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757933158; x=1758537958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrJZHKOiBKCtVxeIPXfxHsVOtkQ0i/mxMKjggmAExVM=;
        b=IzPsY6lWbs34gCaLJwo4BLhQzPMzduK3fGxrS/qBYNhj5dPTZlT6FqLlybE1lje3GY
         kLzA8XGkmRE8b/zOxK3+3/gwB3/RXuOy3NfO9cUKgJ0Jk1xCjW7cxJF9TaZNMtZGku5C
         E3PK8CKVer6UdtoMGr6xgS61h6EZtK8JKR85GD7aX0TqwDqMsPVqcS/0YfpU6H32aX2o
         o/8V4tvzjHc4VgaNL5bFXrof77/N5Xo/jogYcmDjS0EB2gItrnLkQP+uEvgChbaJ7AA+
         yynsnKTKeIicW+MR575wRr2hraASwkg5qy5x3flHezva76+PouCUdfspl3i8f7iY2BKT
         QcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933158; x=1758537958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrJZHKOiBKCtVxeIPXfxHsVOtkQ0i/mxMKjggmAExVM=;
        b=E5Tk5wBl4Jzt6b1NkSo2u/Z48JpBdFl7khQT+worwGniUZeceuSbWIr4D02HDOKd7D
         BH4iNFzX7qkZvkHRjzGrnFCtCzVBXMG5B9YVZU6JXDw0T9zx+XPEuXxZ/Qaa7V5CBZw2
         /luz47Qdd0Fa9wmRoOVxOxqwOVJo1HojfBh9q6Rw9AhOFYILuHCneFSxCU3vPB1ZoKVt
         vu1PNWFcqKLQ1HraUatlDqYmnj6cLQRHHltLBskh5duEMrEJCzH6TGQDBB36sv7pJCs+
         w+m9v72G1VjIei9QQRDItmHgzzGiGmbYKZYtCJuBi4oeQiLo47fy+K70dBp4Bnd0a9sJ
         uXJA==
X-Forwarded-Encrypted: i=1; AJvYcCUuUy+hsn1Vd8Ueu1XkzGfcwoXyKs8afjkq5WBOmBFwTDGd/F2NHyGAX5a8+zyXzB5Q10f6UvRuG2keGB6aFGPI@lists.infradead.org
X-Gm-Message-State: AOJu0YzNnOW0Py0O7D9p2b4DrankTX5IAqc5AlFe98cO5AxjNooScvfh
	57et6DLWSO/ePjnKtOU37NEjz9ugHtFqtyqsQLrQ8vDv80DCzVz89eBj
X-Gm-Gg: ASbGncuXDC4svsYkIPDT5a7w3eXAcIi58q6B5XgoQCwNsindDNToh04fGr5usIgC0al
	KZ2ka5wPO8ZJ48z9XUsnKHXch+jn5HVg37hf5A0OMvalrl6ipr/GEQDfCjDL6H9P6P8jUhLsEm/
	7u6VJksMLtuI+FVsFYcCsU/gqE2WhkjagNMSXWssrot8vCXz91WqmKIq5kGpeMAd/dG95JppVIf
	sgCW/C7P5BxoyAx/pytSFv0b9lIbk7BMTmkDej2zdaLkZgmpvcK9Z4jOrLHUL1kxbKc3Map0hV9
	ldPtzzcKCgJN1cIjdwDbnl81GGbzn5q07wa7Gg42ppaxK29xCTFweGLK+C9j67vAhMDktOUdF93
	sc3rYizEhCglJ5+DVpJGW0lbtQHmNeCEHoRLlF0BvR/p9EicqwXbP6qlPkKMf9uCtPNzU/ttWar
	v8uLHQ+Xwfn/ek5S3t
X-Google-Smtp-Source: AGHT+IHWjPeBWLp7d2NNOzbpMg//aShs3TyKmf//Nm3D/I6epc4y/QQmZeCf4N50wXni+LlhRWk1Qw==
X-Received: by 2002:a05:600c:470e:b0:45f:27de:cd22 with SMTP id 5b1f17b1804b1-45f27decdb1mr84324875e9.17.1757933157764;
        Mon, 15 Sep 2025 03:45:57 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67163365e9.0.2025.09.15.03.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:45:57 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v18 1/8] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 15 Sep 2025 12:45:37 +0200
Message-ID: <20250915104545.1742-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034559_687255_158B7D15 
X-CRM114-Status: GOOD (  15.37  )
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
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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
2.51.0


