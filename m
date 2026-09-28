Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA028CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=TyJHDQrfRMSDecWeWo01pNS6Eo
	AfOLEFtw8XSBdNOwqpMFxKfQnbW3zV+3O68dyKHxST2wmIaCum3guC7HPto2+EOfoDz0ESagmyfKr
	6ZzCSGBeG4VCOH6bmvf1q6yjOXV2hXJOFeOVdjmKg92StzcKwG8OK4siYpbBfkhLAlMT7yejGFY0B
	2W+35yeWSp4VhOyKQHIdGyHmfy/C72rkLWJflYzkgyNOkR9gAqqK/uljpZx92CQK9Vir6CONU51NL
	G5dONgW6Wd1BphdNY49Ml+GM8y9ueWwZrfG0QXytAoILkX7w16ivqDbOQ5CdH4zSq1PuYAi0Eua04
	s+L4tu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIc-00000001UU5-2VrH;
	Mon, 28 Sep 2026 19:46:06 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIT-00000001UMV-0Etb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:45:59 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-486e1a044c5so2905880f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624755; x=1791229555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=fSCWK2qGXdbokPmH+iV+ZKMo0b9KGAMLir4/d63sYgHfuCncSf7Q73FWonXvSK5viI
         /f1Rz2Tyzjy8ZO89FncCEUZUV17i27xJn8xxdQKnOzo05mJn8oXE8b1wGlGZAR+paA7P
         3ULrIa3i/xFwSPb/5NJG2WEdlxTUHAVCVKG4qASHDIZHeC/4etIBeYP/S3Ly2Y9113Cf
         plLQxqkse/tLsMrEXePua98watmlhXam6ynnh1lJEun5OxrqIw1eBLpDSxmKAsSpXRmW
         7Q+d5sSIuv793I7wvIPWzIpZ+xxELXrvmETOCiMdiYp6rPYmTFoWQCyxUasWmxPYcQza
         LxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=jcnp1YfUOelrnS+Chsayhw4JHgFmvJJDq+NhY05zMODltTCIuhrOWxpFiV67QEgyRF
         DasdVZX7MCp8laluQNZxLVuTA4pa4475OaXMyV74/C6sBfKi1G9rpGqzTRWHPReul+I0
         GNxMUm6TSJiYIqw70o89PXSvEL8x1OTJImU61b6yh7vKKpHplDauSmSNxuljJInk+Dpk
         B8uoLcOD3XL8J+x+Jz6Gb9521Is1xHorKn9KSQ8nCYYTgVyUztLJguPeRRplU2RpoAPY
         aoexJaHmx2yJFMYGjawGEzLt+4FSP76jqXFmpD3+HuzO+h8iaK/Z1P0OhVGVZdLy+OpF
         JtlA==
X-Forwarded-Encrypted: i=1; AKwUvBwbi6M902n8CE68lIZ1qZ/I2XhuQiHuxJCFIHy8TT92X9LM7w2s66cTDkr5lkJVHeUQ0ibdYPOzdaQngXEUYs44@lists.infradead.org
X-Gm-Message-State: AFq9FYJrfIguVX7HKt68Zlh5Vp2jYmamF8QGyVARsCL++yG5mtvTldB6
	1Ve4UQmSLFDRQk8cdpjqpWVl5kke2FMOjfokqY1FDYU8ViCGIAL0Qa/P
X-Gm-Gg: AYBFou1OGRNDMch337sedWHG5QT+N/8mtrMCefTI9HqC9392yDfCXfYR2nRyoGymqWR
	xYgoK/+q7s8sgf+LYEMFrJvSaQ6SR9u/ogRFOwjzz0zy3wwZIScUgppcS3pSkNa9sINzbUzfPhr
	znwF/9SXD/ePuEvzd+DTpvfviue//L8b75P/Mow1GTt2hTeEo+zMp7hea0uPVp1uJ1ciaBQ2ep2
	fY4rptgSEhZ/etDZFXCFnPYp4zeVS6J6AOZtoAn72ZrA4lvHxA48vPhZk7d1AYPYe9SQJJe2TQg
	KZny1uqvX58C4Y/KRUougtfkSAEZqMu1lO4q4GmOFdC8NqUOryti/JLbe9mQ5MoISLkhQJ7EN/u
	JO9U9gZiecpX0FZVJWlHhXwAixWKOrd2o6f/YPToA2D++SaZy9qqdMS3gFgNY8dX4kIiHYeDoua
	q7FtYrAeiay9eRu+RDBVwSufKAPEiJP+gPg/ZEtmlrvUsAPEC6L7jx6jcVPweiDqW4VUuNp7VUw
	VnFt52T+L3cYlUA+1vpL5SLOzxqpP+oSvv/UXdLCPp+wCw9Yje5cEkhSkLLqC2I
X-Received: by 2002:a5d:5f49:0:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48af1fbe9demr313504f8f.21.1790624754940;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 28 Sep 2026 21:45:00 +0200
Message-ID: <20260928194511.41878-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124557_134733_8AD4EBA5 
X-CRM114-Status: GOOD (  14.76  )
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


