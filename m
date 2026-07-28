Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECC4C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=GJPkVtlqX17Ss5w5K813s0aQ8p
	T1i/PDbtVZfkJmsAfotiEClnVzjBfNJ8iO+ZgJqMmLGnGQaM+z4nWNduqY4NO0r0/FJWY3iFbv3nS
	xvlkl0gfa4qOfc/CXP2Gb9CR6jswl0M7YoWTiFQZNexVro0iPyBiF1RoBurS4FtRd1uUynzfQs0hd
	AUoBgV/hk01g8inCWSeZLgr6hVnekLQinZ2io3YdpZHCaQ080d4/lLfaNmx2guqVJubbgSM7/Uk7X
	p29aioez1tf1gWs0ldgb558ew0gwY2Wr/6mchzVEbAClbEBinC84kXCdFm4G+a1+sGqk9yIn0N0ve
	C16mME1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3c-00000005hoI-2Oxj;
	Tue, 28 Jul 2026 15:49:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3K-00000005hZ7-0j6t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so25135685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253748; x=1785858548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=DREr1m3oIYUAlo33sMHA7X7N4OgB92FqA65GuKB32tyJXYuTgTUE5X1zTMHCYjvj63
         x0d0jqnP59GWN/VMIgXIzK5kOXUXTrBUHx7WeAEfrjXyMyHRP68uLJXK/2YtSGDXuTxb
         zhCaCoWb/pwVRrpNXHzNaLUJKZqCNGRiIde7XtfodzZnMf1LkYqUeblUK3yoGMDsEuPL
         Wk0ZDl3o/HD7DHF5W8y0wLesHQrPav9MaPnQ+J4VAlUEIIfqf6QAzBllUpoVQkFGCEEm
         6AxtNjqXH+Y2wVokYzrYSEt5sepEOsrzL+DT/4NKszYHuyyaJ32E1XK/vNJcgTj2/v9z
         Zsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253748; x=1785858548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=ePXzkp4SwNY6PXVNHFb3yQ+SupUWeRvi8fkoKmVku34yoYwObKiuXs9ivN+l6oD2cJ
         Vaj+sSu2hljp+XsxRyCtqbuKeBostOxWd4wIkLb9xDwsr/qeqHc318hk/KpX8BxUDNms
         hqxzK52vAIVKNXTVuhISr4JvSFu5r9KbnmsgzME1C9eIxkyDpSWsM0NCXbFIsziqHhg5
         xi5CeRj77oUkj15FKMEyGmY8Ym2MWq3SsOfUH1PlTncAEYd/lOLlWDGvyUqNc6jG5e12
         ZcnNLnflGsrdxW6/QCTl/TXHwFxNeYigxSHPU5XmlWd8xumcJNeXscUbFGANS0aeoCCY
         C7UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdZt96BbMmK0u4w9JPsoFJb/IidS5zQ+QD5UAcl7kde1mTVM1f00bNrkcEZNwOYEwcjz8hPpMtrdlWrvu1Ba/d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3zIxNyZs4gIQBFMShYDXGTitEC8iqbglRsZYqXbzsK/aYgRST
	VhJnvjS6NNYX4oE9CSJC1YFx7U7iWfYZiUXeYw5tO23U0eVxuzlfDM3Q
X-Gm-Gg: AR+sD13Yzjkb5EfU6K7i4l3ewLRA0wnbWZZHyG4bYEsrpib6YyVEwMrOsHz6gPzM60z
	X7t6GvU1vkho4kgAXc+RstkJO8etVHx2e53GqAQMSyEa8kz+0DPtEayqSlpI7sBk5Ah3YCOug2f
	tnhxUKscNeEl9fQwmSQhm0SCXE/6wSdV0Oe52a8ZYIVAM1JxJ95qgqacY51X/v+83F8rIeCXpuM
	g8obbA6IK/d9Rama0Z5RIy+7jVKwU23NFOfGUvmeYAuc166bRe1rmEKj54LtM/nxVZYwVLlApfP
	UK90KO2J0G/R17vaeFkoju/XJthsp58MI25iggmc/0Hi8Vlroi4qyq2dmqw2Apvbm2vhnaKKkn2
	06xPppplZ5bdyzCtMgol8uSF41huNJ4PSvir1FDdFZWxx7mRbhd5X2Via3DlG9T2dchd77okeZb
	9xLkm0abxLGo2IDT8wJQ==
X-Received: by 2002:a05:600c:3e18:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c6569058mr33783105e9.25.1785253747906;
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
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
Subject: [PATCH net-next v19 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 28 Jul 2026 17:48:29 +0200
Message-ID: <20260728154846.1828945-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084910_255524_FDD080BE 
X-CRM114-Status: GOOD (  16.66  )
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
2.53.0


