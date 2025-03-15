Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C5C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKzguv5FZbUbvmSzUVMgTGlbeTysJjbKI0MLUuKQXJY=; b=XphEEKvcdacXUqCBvEPvJz40dO
	Jy2JuRdIR7C8lB4mGpG3cA4eQuwg3sx7oUsBYkgH6UFJ9pVAqgvDA4fCUUe16ASPrH7PJMq9tkeZf
	5RB9DgaByvk8jTtYlJ+n5cKIgwy38nHXf8K2ZfV9mf9r80ccxgcRxWjmZgheXdCJShn+zZpdfAphR
	m0rVQlgJoEfzpXIHEjS1AwhwpAilb4F44VnGbpLU7onV4QYmo2Xz2KB0KiMxi9QKr0zNnfVMq3qAU
	y8QJDIW8icIyJwBdsiddHUZa5bfrZXSEOYPvHe4N2v363hAPRYloqbE3uknq7dTOQquNkMUf9/oMz
	3YEpns/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTnZ-0000000GYLB-300b;
	Sat, 15 Mar 2025 15:51:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgr-0000000GX0x-3cA2;
	Sat, 15 Mar 2025 15:44:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2422125f8f.0;
        Sat, 15 Mar 2025 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053484; x=1742658284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKzguv5FZbUbvmSzUVMgTGlbeTysJjbKI0MLUuKQXJY=;
        b=GvyAbAHGO+n2OCTMD136TfD4rO+ELbM25fxszZZdhvzxRYgarc73NpgkY1eDSGoLtw
         SfTxdTw8BJWsr+JqnO+N0V7MCtf7b+tSjlSC7Pek0lYa+Dbyodew44nAZxe3CZWpkEpJ
         JQT95miGsTXaBxBscWGfvdrQ/2Xv20w+o1KexF6I6Z/X7WTY43gW3ziOZjb9NSm/Ygst
         sJDg1RKQtAm1ON9W1cCV0LT9K9pg5cvUEZ4Yp5oE7cFu3o+3Ztubni6SJb5SQk6F5yOM
         bcOD4ur4WYzqnxDByP3fNyOOyq1DvWQJK8zaxSqOCRFvhXmemFaToi/sjBwYBjS6Dji9
         W+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053484; x=1742658284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKzguv5FZbUbvmSzUVMgTGlbeTysJjbKI0MLUuKQXJY=;
        b=uYCC6XkfD4D8dLDGtZRJMMfOjpwj8OluuVfMUEp+aJEBMeo/5E5Tx+xw9bvzYRMdcY
         Cv4Vifq6oqRENTi8+Qu11sTanvISF2pCYTHD3OLA+Ka8KeizGRyn+j3AN2qrieC4nOxA
         ihr9/WY7vi//luM/kcPVY+kxPJPwQeO9EGvmLzCAHKpLyUvlggxvIBiDvvVVsFrJKE1R
         1dHsEVFfsaJHpw+9CrF4KvztVtdiUoK9O5OSNeU1sw+DXG0No3u+6dn433xZaQp0dmfJ
         fbEYQK3SxElDMTsF/SRmGlrvLbqILVePxnLwkfmONjGwY1HehMOHnaNumyh7LIYmY4Ge
         JVZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkZp+p1kXFQxuj3P6f8nFc+3FemW8fLgtMXYEg1BkoYqgoaVRunNgF4qZqESNPAm4vLB6z5i78ZprhnsMUsNbD@lists.infradead.org, AJvYcCXKK6DM6dSZS/HAWiCWRjj18QfzAceNSnkMwO3ednq+/KFO5nPHwZN3WlCe9jA+oErOwJT65fxrTBQs8SzbLzU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gJbvW0fEnbT/b4FwbD0Ooz3CfhaHfKwBJmT4pEgBbms4WNi8
	CA0hPDBdWgppi35KsNWMwowzLFvOxUc3m6nUIrYL9ffgLIF64vnp
X-Gm-Gg: ASbGncu0B/oGTPXuSkbhndh1vadTTWb7eq00TCrSw6IrHqJR55pvRbArnTzxMwPuiF9
	dYosr2q6o2JFrjCR84TiWtpasLR01UCI/ueVgghL2FOpRU2i5DHTvYdm2DJmofPbEdS96hxJIG7
	Up4+azaTNfDSjk6bEG7Gd4kxLgQYOi/LDbmdYj2KEDyZA1823to0wvHhjSUa4/iQWUFK5Va0pm5
	ehq+GiCks5huad/NpkfXY4xpceJyS4VEirpK1yNmsj9jQ+KNciK/2svR6dWNFKSnU61aMGvC7pZ
	xK2jTNiZ8o+AXi2YEV8GvVjGiE6gBudRxXmcgbBsOiaky2gKSQpKTjePDI+oVUX0wYTlSisP4/f
	gZMLCC0wKXZEuHzpjSxVS87f6
X-Google-Smtp-Source: AGHT+IE49+rfPRWkhQnonyxaadm1sq1c5PFRzPYaCltbYtN0FqVKUN0uyr5WSerVe16ioqfKocwosw==
X-Received: by 2002:a05:6000:1869:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-395b4231bacmr12639946f8f.0.1742053483995;
        Sat, 15 Mar 2025 08:44:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:43 -0700 (PDT)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 03/14] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sat, 15 Mar 2025 16:43:43 +0100
Message-ID: <20250315154407.26304-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084445_899777_9AA34110 
X-CRM114-Status: GOOD (  16.04  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..fbb9219fadae
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
+  can access the Switch register space by configurting the PHY page.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e8055b5e162..696ad8465ea8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,6 +726,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.48.1


