Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA27C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=; b=Z+dToooY/l2ApwS1agmzJkxO5v
	4LuVBZYWhmXrboZkeBG9suWiX3HtmzIRa75SrcOwhh57mgMGysJiHIK+ZN81etfLdWLbUK2wE2jg9
	toKCVQIwde7F+5/PeSEezBS6+0tbYMQQhb9Elxfrkidu++rlw4zQXDgbTv/Akwqvry3zZ3mjtj2Wj
	Lp3qbpagSZio2BY0/7ZEBGEqaDobAacV89/E+RqG1lQO7K8MuYg9B2bgFmyB4Yx3PsUpyEEqpKuQq
	ZWh4oU/gbxUzfz32/tTq4/ASC0PNCIFljXUGPJpSgZ4gsOFynzzWaVXH+/9/0jK4zcOlFs8Dn7Dmq
	VJBIlXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3M-00000005hbe-1wHp;
	Tue, 28 Jul 2026 15:49:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3G-00000005hXo-3n6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47362928f65so12052f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253745; x=1785858545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=DnD5zI9NGtMfBiLzPaqUof5kFtNkoXNseKa57nL8iw0+P2mwnvWFWP2cx38Fx+FziG
         SUnfi8UtQ2r1ypaBE8zaChcL/0lcHcQlAjO/67FcTbS2TJdRVjOFoy4thhWBVFr2DZmP
         TPPMmBFiOdmVEJLiqYYVkCP5SUp2GXxcIqS3hx8/4WmBbmvp5aLR9oCP1IQx2oP1/fk9
         XWkKGRXJKxFHdRrX0FD+FruOt3dF2B1yNMhve24KvVOR986QbHR7xp6g+qWw58qCGsLI
         I6NnJlY+c3VOu4zq/Es3FteDP1cuu47JE+eXdKoOrTHx0E2OQJIC4o+Sht+dOqKa2IaK
         We4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253745; x=1785858545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=MWn59HZT/k+8zRzc/eLYhlQ2ViTAdfuvkL8L2Q017vipZfR3840ho1+moKviBEca44
         MQuvDOMfPfHye19JkLEmUu36Wl4DATwp7zdwPCzoiIZ9z15x2AxhON6wScqZ25ppIaDg
         QqhqF00PXHq4yBtI2V6CWigFr6CER8V24T1dMj8KA2mYjeF3s5RX6BVrvJ04YekDijLM
         MwB/A4Lpym4MRzEevmT5O6u0VCSJxVfGBenerEIuaAWZ8cYnnKq1pVGpdJAS1xnlkA5N
         l34rJPCozHxEcy2zQM209avRr65pRi7bmuOyCi4cprBPuRd9+37IuBZRO5Ruz1wBAW28
         EZVg==
X-Forwarded-Encrypted: i=1; AHgh+RqM57rKCuAKJaFdENqdv9lSA3V4X8YY7ny2zNbq+2Ag7pBJdZ39RgWDgTw5uJCt5C9fQp93+PZqSDmcO/R9MLeK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3cJJaM+JX7hcoMGdBXPu28eE3L4wKxFk4Hb9JLTqnEw/oJ1ZB
	7X9aoH9uGUxtXlgRG5XrDC31MTlWUSzxz/3FsBPkmGYaE/Y/zdVsW/+4
X-Gm-Gg: AR+sD13OMYl/yiv1ETOxnn4D5WMaHdp9GxxyNQPKZNzVjvBDn7dIEnjBvvquag7YD/o
	g2ssIc1Dp8LmFh6VzPOoJNVHaxbyHlO715wkkHdXNl3BdR74PIRVWfy1lOh1bRVe6RSTxaBHYmV
	qTNY0mmoSRvAx4IeunPQ/ZPMkWkwdjRdGSx79Q0itReSTi5YXDyzhaGCGANbzjtaHHZ7InT1O7t
	3bwDZsdoEY8FQLcMGu9uMcLUHiqt76bQPoOAwvW2d+4kPDYelKMNiJccJ2ioOhfXBsyTK7+D/Xj
	wPbIcP0oUPCu0u0pShPEQSSl6sqMXVyXWfZNSqxuHo9YPAo7tOGY82rNEcl/C+XAhkwZuxxHXRL
	OXzhdWVdMmx2AgV/uDRADDd1IvOa3T1CchzCWsSsdWhGO8JTQlrL8bUxC3BAIVXRHqm5y/eRvVt
	GlSkhZqoR7+T2qyKi7Nw==
X-Received: by 2002:a05:600c:3b85:b0:495:6936:120e with SMTP id 5b1f17b1804b1-496c65a5f06mr34662995e9.39.1785253744771;
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
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
Subject: [PATCH net-next v19 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 28 Jul 2026 17:48:28 +0200
Message-ID: <20260728154846.1828945-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084907_089549_C403EE32 
X-CRM114-Status: GOOD (  15.12  )
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
2.53.0


