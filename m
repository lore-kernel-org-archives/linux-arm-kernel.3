Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F4CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=KMZTXebo0w9aExJtH8FBLBd3vY
	zOLIs0wTqPwgpSYXR/qVHsVzwDmoNhpqbr0CLduim7UPNZ15RxwcCUQgTDVs21q3v2StFI6TSSEKy
	k0QB7FU3eCrd46sDbsiKTSmST3FiFKoA0bdbTHtRN60OF4EvOFCstd5ja6EnSmDZVGYye368SRYCM
	/seK0NQsiLHiYa3b7uqVoPzop32rIEOEBG8BvLqDLARe7x2b7ecWbpwyEdOWgbcXLWmPM6su6LjSk
	fu7NiWsp80dkSiUPW8Cim/ARB1CNQXWxzyPFdYO3DQiHf7tlhfbJmDW1dPZ3Z1ythg28wieEBAUqR
	k8LuVxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaS-00000005eTH-0qQ3;
	Mon, 17 Aug 2026 08:20:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaM-00000005eO8-2SLF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495590dde14so38480315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954845; x=1787559645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=bIn6guHFwUCOnI7y9/G0gm1FIh40vd8ZSFAdNOogQqCF3sdOKgpRFMBYuOF7PfyQyX
         vU5NwTtybhVT3pnHhph6/lhRF111ycQgTUmZupDAnltYzjQul0dNQU0x2cGu/klyNl/K
         FexUTWsCkJBR1wmuAyH3+WQKYSirexH3I3JqcZJx5GxUAvdYoc/Se8o1HLwTRhMuX6ry
         woIHNb06AHfHifyhwdhCUC7LHbhrkhONXjGt6l50z/ANLM3RjVBB3Hm8O3gsPURG2Vm9
         63Ch5cpi35kdcRT4jxyIgJnyt5KPHo3KldfP5IKGNrrA4HTPYjGBV6Se0SBwNReCsdV7
         7YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954845; x=1787559645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=BwV0sngGWuFNdbvg/17mchBZjFYe4MPk48mfh/kHhRoZXVC/YY2j6aUcs+DnRUc0NL
         AV4+28AgvkerXamUMquhJTh3ZdE3/4ZBURe/M7I4KhOJwnqd9KYLmME5nwwHcFTzK9Mv
         faPrXAH2HfUIjzl6U4I1GHazoFKZipXyjueSLv0QZ6mtGCgAR9VsEH8rXOtVL19LHixD
         6q0XnZEs9+nSdUUW7sycxb5g/UYE13cDGnUaLXT9XjP06OAiL2FJys7+8m94n4jFLt4d
         zrSmi+8QvcfPjpomFJCXruyCH2DugF2R+vM6c7WyPp3+ySk3ZNBfsy92nYYv4VzT6XEd
         NlwA==
X-Forwarded-Encrypted: i=1; AHgh+RrTgVYR16NHMcPfGc3Ayn3AiYEcUi64UvzriV70X4DHG0NbUOy70AvyXbcu7uvLB0DW3P3seMJWr7oOEUYmcrkQ@lists.infradead.org
X-Gm-Message-State: AOJu0YytCSqWNgoCqB2+aGpHEQQsdTsbwmBpUraj8IyeB2gf1jgSBK+g
	pwfe9Ik14NHan1+Wr1vptOxYgjxH0lMmPM02gb9gJ+H9aVoGsVOP5fbN
X-Gm-Gg: AR+sD11a8yt+zmsRBW906tc33KjKm/O1HhGTzgJzSxOYrFXSzXTxt6sqptx4V/Y2dhJ
	6Stveu+QhQa7zgxYY23LnKOg4JSHqtT0Ta16gIc/piAs+3UzXxwZkvPjFngRUv7SjXrySAX641b
	KoNjGWohbMaUr/YHMAt2uEVrrX5hkq74X43xe0z0K9u36JLZyJvkJTulqX7N08iafVSdSQQv10P
	tPIv/gpw4Oxo02WpqoLen28Ux7Mbi/ZnVMTwf6GCPA/0yVEKNDks++1/QzZrYANahf6Npf8AhwX
	pcFPIxQ+ZR1fI996UDRXjCynQRTMjmgfaUYeKxWMuV5lmkvRZA8ib/VSEWowq2U+U0Y0kroGsFG
	TIKCWgUw9onXEiOEdtxnKJZOpEtXmVBhF952aVv4LfTV5YwCNBMyBcAb2awlz8L/NB45MWwIFbo
	/N92f+YKL73k1KkZgb5jrRHw2Ug4HnROBlG5VrcOZ5e7FmPB5U4A8cmyciLU9c3foTwC5ym8aCV
	X2r0YbWZwrMHQFBOrabm0coG+sC5AQ/KtTH1/TCuz0ZgbNyWmtkLZV1KToEwiDPl0hV
X-Received: by 2002:a05:600c:8218:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499879357cemr398067875e9.1.1786954844530;
        Mon, 17 Aug 2026 01:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:43 -0700 (PDT)
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
Subject: [PATCH net-next v20 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 17 Aug 2026 10:20:22 +0200
Message-ID: <20260817082034.20326-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012046_644483_2CAEBE0C 
X-CRM114-Status: GOOD (  14.32  )
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


