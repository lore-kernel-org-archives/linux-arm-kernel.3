Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D96C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=; b=Wf44UPuvGfTqSfDE3QU39M+F+s
	Ayteu2US/f6xXuNBpv1P+c66qE5ZUgCzWlA1AOXB+7AwPI+bkXek+zwB3/XwF5J7/OE39wfjb1+QJ
	w1HlUoQsqaWrJDEOGxRJ+YAa8Rf8+A2xUIo9WqWtc6Iy8vIiwatBdNZrtz9peMGW6QU2yhM8lLS9i
	Qd0yRf68hXzKaXOipN8/xEFpcAoaGaj/8GZErqM2hwZfCf6Mpp03Js5sS/OaEpFRIdtQLqJvmSUCS
	HMRugB7zjUj/ruJiyCkmDxt7TcTYbWmp3rUaMrkWWBsYIv/AmuEquizMrx4epag5tfBMsT8zoykyQ
	NvKq90bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQy-00000006Wqp-0MLA;
	Tue, 15 Sep 2026 12:38:48 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQf-00000006WbK-2dZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:31 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso25582755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475908; x=1790080708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=EUCxs+UVXpLU8kcKeZQlMOCZcxrO75ucQue1M+5e6MVUC7XKSNDirw5oNZyOwIlEB6
         uPCfpMxRKe4wc4xvw8CjmvazUG9bWCwzRSWcvQcyspaIQ508nr4pBc/OlEymN4DS+luM
         RQFfCGmptfv100ZkFmX8sT9jQaliJ/sHjPcV5eKMN9o4bOw1a3fkUj8xB3u6f8b9Mpgu
         +cU0+H0Xxg1NQ1845ub6mTbkW92C2CO5wQFb7npi0/k9RJAuvIPH5v1UFeje62rugDGj
         QFT4+u0/JKFEjFCQcAUA9E6+YZqktWed2JXqxhkAxUJ+ViestTy5siPBHbGWRM0EqTZz
         3qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475908; x=1790080708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=bioDKO0Dl6PlQKcj7ESIB4OSGr7H0auyv0a1q1NGp0QZHf9k2o2ZdBk4YM6amBA3bH
         Gkg90lPNAreFkX7fteq1i4TgQWnj0KRWUS3ixJAV+HRSUsbWj+67IyoD7x/wff9CXfLA
         wF8gZZrkFIfTkJisgDyovD3Fqn9igdf4pz74wnfsCRAe+tXfqNFtMzjOHFKa2FDmmQdl
         BuFNR204KII56p+slhTOn/52Qe9rwdlF30+kJXMjnWRRxPd82ibzyI6qBDptIVNZW1z3
         Ta3uK+ELCiLvdV3PBA1ECzUbXZ2nNb43NfJSFIUuRr/wOfsnr8RTCg+O+WJ/hBRxbLoZ
         9J3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy677SAqP3ys5LVwRa24wX+MKNrhBLTqJ1FJmHGfxpmMNmXYuGzTwaJVus4e1HWuTr8DCej7FvV3c786DXwZYZ3@lists.infradead.org
X-Gm-Message-State: AFuF++lcQ5s6CuzmAJDC5bF+a36H67DMvopGkMf3kiohyYCbQtx0YCxB
	57jlYor+fEiHpfdRfEBPhEhcFnl8/dESYHmHz9swT9Pl4IQkbomgM7D2
X-Gm-Gg: AYBFou2Gdpe3ETbW2Udn8zJpALWurGjjFvHJB4MBkwYCO3VKn9zP/ZKUUnSeUEn1Aij
	olF60ukJoG4RrhBI7JfKGJDgmi0/WeRYxLSee/JqEFNU2f9S+6J7B3ZmB3bS/F9CdsIsQlb+xhh
	qBxWy+P+7AmtNyobps1ZC6J4UH5kW9jDEsjlAV1Kb4rpdZZVs20pY1gx3D8w6SQbDspnPH6ThWg
	cutIk/koRz7wE0mZP3ZLECniw6rgVlqLOKzDP/PZ6TKRWP+GEZVcgG+ySPW//8dH/vttyWH0ZSg
	akI/34zgc/BpFaubvsP6Vw4BrfxB218I32yikBIEE4MZ6/zwUV7YKdP+DEUk+nRHs/dr/bYQ4S8
	gRARHHIWCmvztM8pKbvesWHHlAgsrbyCcJpQJ4tk7tJOYcOzcN2NBnsPRP+d0sJZ8RXrm7JY/Ae
	pcojoIR2crbT1al6UwyRkpz5bou70Cndp22AEOE8V9g1whqRJOw5G4H+dmRlhr3DvhXYK7XvxKh
	i2iKWnR7F5XEn03Qe/KwiMgSIKl5J5uCx6FQf7y96v+pH9vgMXA8tXNU2eb4BNcL0g+jB3fa7k=
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr68143945e9.25.1789475907626;
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
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
Subject: [PATCH net-next v22 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 15 Sep 2026 14:37:59 +0200
Message-ID: <20260915123812.14747-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053829_941917_46605878 
X-CRM114-Status: GOOD (  17.11  )
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


