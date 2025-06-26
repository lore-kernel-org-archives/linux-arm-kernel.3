Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF9FC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=; b=SnsJz1yQYLmJo8SkJe6RTq8jDo
	chDyyAzzNifDqFWDPyYQpOLsCK1iMans/nmwpKp6eZv4ylaTTjUivAricNvwRo75+rYSyo0layfzK
	3Q/3FjVvXFZlDKgb91BJ5d5BEwz0u+gzpOGXj4e6Vcw0ogmX1dAr5lD4RMUh8u6GXqotLuFGlULqC
	wxApgU5j4eAcPX393XTG+hbmDjs9he81PS7T5/dvJIjJ39vM5Xv2MtLM52UcxdB09q/qKSOFqfiE8
	7yszdEbgAi6VHtfxVVrtt7MyiK7eThdTd7yKQHSFApIDkyzCx4HwQJcQsUkgRWR1zPPwGVK4gkhBq
	rPVESTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvxA-0000000D3Ef-0KXv;
	Thu, 26 Jun 2025 23:24:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4d-0000000Cp7i-30SY;
	Thu, 26 Jun 2025 21:24:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45310223677so9019585e9.0;
        Thu, 26 Jun 2025 14:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973038; x=1751577838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=;
        b=jmckUrdyPMLnQalSaIyVskr1d+k+wWsqx3C7b/72YWA7qQAJGU/X/ysCFmgKTeCuAQ
         R8NaMiSkmrU1ZemONEVYkZks4/Hb8Q5ZKhTRW4BVYyPdj5bppw5VWDn8KxB5bquy7x+w
         98XmkyLd3KDVRfKx8WRfe1PgNXi+SGwl2lyZ/EqTzvRTqj+qxkzcfO7R4RL3ZxrPUFn0
         dJtdMEdHB0j6GGh3qbgikV8DjFQsrCveP/KgjrqAHoQM0kvpWzDIxf1agzz43AiI1Cl3
         sjJAuS0kZdpQHpIvndykwgkkVoYtgWTwgoh2gft3FoBZSlmkZJZ2y1yJAwH3+Nwn7XNV
         QnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973038; x=1751577838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=;
        b=XE5MSQDNcVimEzEaFxvpzRrLJ09FCq9uwCwFwabmmXxFwOzugTpo3wdtc6Ukv2/V/J
         qvjiWRuC8/1aQG9PPW2nKqmJ+GUidlT+6YNV/LL9gxLsJznSJV98PlxkTw8qfby2xzZ7
         vAnAMfqD0dDyf/3edhlbIgKSJs9TuxB1KLfBy3fBWjxl9Uc+EctqqrXzIBWGPMupL8Ue
         piIXrousHtH+yBDbzdheQ2xs54yhIiaJS1R81rPgpHzQ5RK58tUDmydZWZ0kC02f73GP
         DGaeZ0NihqZbPe534yVCE9o+2yP6eT+gNLoyELXG1QAjWWTE8vZUwNSOy/L6/ngAIRNP
         7rkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZIP40pp9a9Z2rCRHQgufgtcFzEMR9DJnCW2n3zvVW5fB0zMS/47EtYG8mR45l+kry2QLDjY+N4pJOCW6/7pJ@lists.infradead.org, AJvYcCXz6wOfnb3s4zSFUSM0MM6LkAQbmsSjCu3piH6VDvntBfIy5v63nfMvkrkPT6sbS6E9MuE10O+SwdX+6NpPCdU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/K/b1DVOz889BcJJH8WhLNhPcvNZLQAiOLKGsnXyNslWYw9M4
	NoIuEb+k3B8VwDv+FboAkjTQG936H0qVfcJ6enahT5+CufxHhZJmHnO3
X-Gm-Gg: ASbGncvoX9q4Sj0lugswZCwYdsb3Eaz4QvydVtjtae6h/xTY6XCjnto+wBwMPrjOekz
	lGJMti/QjesO40/K0K9l11S3ywRZxEaypHd+jAAPEuTL1zX1n00TlI4ETi7MSrqeXICmhZuaQLd
	fwljuSxsEhs9cyxyg1ThxNoa1pJX781lFKgQEFLLVZlo4NfJxQndyNwRJFrwOFmdX4PC1SDQEV9
	CaiQYQDiTSX0giXDYwZXIlYjFAJ103KDR1HP7J77rDZeq9HbHe6zgw9kQN+8DuTY4IZVbgE064U
	Ou7PzxzfXhvaIqhiO925oKTtG5P4hISpfwepeYm/t8YwvYlr3Qu1c9jWgZrAEYFActdLQtFixyB
	lHSkpsreynAIBmy6aUqjC1Aghye1zdZg=
X-Google-Smtp-Source: AGHT+IGhiPIiYSVT+g62FYh7vURDOXyt91H1CCIt26M2s6cmJxn56lND29qLfLVxj+JI6H8LgREtuQ==
X-Received: by 2002:a05:600c:5249:b0:450:cfe1:a827 with SMTP id 5b1f17b1804b1-4538ee95284mr10310995e9.31.1750973037935;
        Thu, 26 Jun 2025 14:23:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:23:57 -0700 (PDT)
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
Subject: [net-next PATCH v15 04/12] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Thu, 26 Jun 2025 23:23:03 +0200
Message-ID: <20250626212321.28114-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142359_768937_4C787D31 
X-CRM114-Status: GOOD (  15.87  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.48.1


