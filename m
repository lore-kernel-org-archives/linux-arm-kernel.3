Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAA9FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=; b=AaWUhDnNxPL2W/5CuIYWFM4K7I
	Hn+qltD31qLt84hPjFouhOsH+jOeTKlS6mEiLkAB5UayW4ciWAF1KVuugcA58pgc1kOLtsLk6JjH4
	vRAxKoyxzo7WWCN6EqMXvd5/lhOCYk0NrEOfFMhNne1t/1R0WhpWHRkLy3mDx8dIY5Mp98X1sZDw7
	KpMxF9m6phemGcZ7IZQ3JhhWbqDzdc8mvIcUyoR/zFlMWyZQV5RSGloTIjIPNcIQM9CAC3rtNEOy/
	0vBUab0owQPuXLAuOBTcPNeaKb9BWsoNHh8ouowK3P71QYWClHyOV8UimASdTQPUWZ+SWOyXlqhmY
	VoLgTwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUj-0000000HAb7-3Bci;
	Tue, 05 May 2026 18:27:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUg-0000000HAUk-46Fj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso40528885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005661; x=1778610461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=FVhYor44pIjTHYsSleREqyq3UGsOPFP3JaqLCfC6yfH2uU328yCWMdlSWH7kiL+l4V
         ONKAdV0gPQV7aMZhq9PhrqtXCNsIY7LmBfTgpaVYJGpZJGjqXujDSfjWhV474fYubXFv
         +VrLACF+rKiwmYne/iKh0/UMD8OBu/omXepmmREp1NgQRFwkmp4e6XTBcCGyGhkoxqJv
         nwVoutzGmcQPx2wLTsuH95J+nrgYIBXAivXWD8pcgmZUujFfBrr+qTDDI40grMcXo4FX
         IvRZZIS8tNEplkB+OrSgGOpmVWQicejU6H056NVQAsDArUbphRCz1XvNj4aqt4sG0xnR
         rM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005661; x=1778610461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=ZHEYckVfFfDdpcSRbHeFVB+lDarnYcCUViHJYCT9BlJ3pNdfVoBOx9FhaB6zhSRuoI
         EQ75/3D7aBSmw2V0ETIRuqBUs79og0qQx2N5sCju7tBo18gonq/UJgYWnTMyfsWQ9vJB
         Qk5uokDO0yqxknAK+xdB4CUkS3vnD3Qnt9NbCCvqxm+1jfwKHi50z8v1zkYHwzpMUP79
         PtPCKhKdArCBTQS3N8N9CIv8MSbsGsy6IO7AnuyZF80JRpyg/rbWPNRuLrrEtlegzFUh
         soWQtuA4VIOfhfFqVvOPzohXKUVcvxCpojavLD7yqS83c5CGLKTVKuSYs2uGUvOn3u98
         0q9g==
X-Forwarded-Encrypted: i=1; AFNElJ/yDrWYdt56XLvrHNuw0eqrJ4CuLwpk6c0bEXUM+wl0xRmH707Jpaju8BkNmE+ao4eUOeCehk/+rW9at0xDI8iw@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQClg79x3n5km6mwNNinn9PfW37fnX49XA1PhbGWRPLELBTGW
	jOGOEu+NBXrV+oWyDoRFHDk0aXvvACDBw9AQoYUzocbw5uEa8vSNulVO
X-Gm-Gg: AeBDietXhMDbjLS3D/5w9dZuSQH32UVPiBD5+WLXO7CpL8OKxINWuR8ZK+hxTKbH2yj
	++TZpbBQTrIqD+aXXoLsIhFMCZgdgEULzi9utQuz4UsZV83p4slq3O9MKaDpduJnIUoO9oU+A+E
	mrq3ZyAGWXu6W24q7/RNpMSddkQD3p7NgtpmVdFnueZ/e+FjfLHZg9x2QgGSBYXu8BLeA9WIwmm
	K14zIbLtf36h0dEQj+ZfjujwBEf+vqoQ4XbOy4MScKtHKmNFUXxU/4qSMTv70Kv3inhggFlPWlO
	487WPEZRrufg4JvNaD3l1mHunQXU9e43VPEWrAJnPfpX3RDpMULVOs3qL5A3CIWpeMQn6WVnyxt
	QuVK37q8qPMFS+vSiwDKTywVlKk9yyQP1rbSeWJdvwsLMD60yQBJo2GgTSpFDOH999wY61EgSK1
	0z54seVOpCSKNwlR4b84Fl9UwXzPmVXSR8ws8UV+F2VnwZTMDumnfWVSptyS7s0V8x1uIwJsCXP
	N+/Edg64FTKKBn2Qw==
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr5427305e9.29.1778005661133;
        Tue, 05 May 2026 11:27:41 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 08/10] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue,  5 May 2026 20:27:09 +0200
Message-ID: <20260505182713.27644-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112743_033639_A26B59B8 
X-CRM114-Status: GOOD (  14.25  )
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

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..8bcf7757c728
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+
+  reg:
+    items:
+      - description: XFI MAC reg
+      - description: HSGMII AN reg
+      - description: HSGMII PCS reg
+      - description: MULTI SGMII reg
+      - description: USXGMII reg
+      - description: HSGMII rate adaption reg
+      - description: XFI Analog register
+      - description: XFI PMA (Physical Medium Attachment) register
+
+  reg-names:
+    items:
+      - const: xfi_mac
+      - const: hsgmii_an
+      - const: hsgmii_pcs
+      - const: multi_sgmii
+      - const: usxgmii
+      - const: hsgmii_rate_adp
+      - const: xfi_ana
+      - const: xfi_pma
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: mac
+      - const: phy
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcs@1fa08000 {
+        compatible = "airoha,an7581-pcs-pon";
+        reg = <0x1fa08000 0x1000>,
+              <0x1fa80000 0x60>,
+              <0x1fa80a00 0x164>,
+              <0x1fa84000 0x450>,
+              <0x1fa85900 0x338>,
+              <0x1fa86000 0x300>,
+              <0x1fa8a000 0x1000>,
+              <0x1fa8b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XPON_MAC_RST>,
+                 <&scuclk EN7581_XPON_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+        compatible = "airoha,an7581-pcs-eth";
+        reg = <0x1fa09000 0x1000>,
+              <0x1fa70000 0x60>,
+              <0x1fa70a00 0x164>,
+              <0x1fa74000 0x450>,
+              <0x1fa75900 0x338>,
+              <0x1fa76000 0x300>,
+              <0x1fa7a000 0x1000>,
+              <0x1fa7b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XSI_MAC_RST>,
+                 <&scuclk EN7581_XSI_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
-- 
2.53.0


