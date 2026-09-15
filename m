Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7899C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=QYN+hUCG9gJa9mNimv71K+iKPI
	uoahT4MC8fHhDxxHceLgrHirTQuI9Auf7LI5cCvgX1AcRMlwN2bLkU95wqwZYLDMansxGfVOyGwkD
	2Bl2QBuVMhrs+E2q5A8wTLKrn6cmIb8epNvu39thlEQPd/1NHzK9oGbl7aBkGJox6OsF6LmF7GnjL
	rYItnXwROSuL9FU1MlbPDtNmbkoYKhwiOZ/mzT4GF9IoElwF/1rSwsnasSRB+C4BKEA77hqNonRgk
	DoqJhkhAZpzya9vGBNFAeH+aYI7x71/y2wRR11trUL4ClK2NcyzX3XRYxc4Rlsvkhy5ilmr7AjYQy
	KeZywb7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQs-00000006Wm5-3njv;
	Tue, 15 Sep 2026 12:38:42 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQe-00000006Wah-0zaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:29 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso22843665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475906; x=1790080706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=Xhyr3sq6+njl9hsi5JKBzmrqTXVaUb6oeUtZFcMGkMQYYQYEjqD7UOi2l++i4u5Psu
         VAObeAUCIukGy4cOqhtHaLbIGXpiG/03aSsgJjNKpTKuEYQqcqsBtibN/HimXZlH53U0
         v9VcoSjkauQMPZYvfVj9eaA/YoxNSUTn+/XmzdtnFav8zhVRhetd/7aVicg24oip20WM
         ZVaSe3e3uIOGrNonpk+vE/tFDepRzshtdG4hTN/Y3cWXGfslAJOoinLOVLPuyAdJ4nfz
         6boqk8ffsGLbCr1GX7ChrB8QdfpXkdR5qrWVayLFufOC0pjUKTvV1LSaposzk6cDSIl9
         ctcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475906; x=1790080706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=kMWys/dTRJonrd4hJqHi6Zo/No8UFJrAQSJG46Wz70HhnrHo1R12U+h5SdtO7DENMt
         w0thhyZKXBAhmfVwfy4FK3qBGuaxrkGidR5KzL9c+a5oLVIh/A8rKcLQyuCgAr/fitDw
         pyHI69MPaoFc+CumFSCgcP3hjnvaFb3tTtJIoOy/HpFm6Njm/to4CIx5m9X477Aa08Mw
         RIPN2EOciiV4XnWwIlFnnbaDxZmxgLzvusIz3oErWJA27t5y/A+bFSiF754FrlMchKer
         n4pFyjLFnKO8DS0Ao0jy5CMLL2uRdRE3mqgeVQdYbxMKe6fQfYKz6V3hwOKDZnsbhv4X
         ZL1w==
X-Forwarded-Encrypted: i=1; AKwUvByO/p3hrEiW0aXHMT1J4ibhRu5dS/uH1Oskpj5mVMhNDdHzD2u0AlCQHGMB3fifU/csvoGGtP/Q8z33yzFAfdIF@lists.infradead.org
X-Gm-Message-State: AFuF++mLVNrgcqCNK5zzrWLy+AOCsnU4N+AFEZXL0rtj4gf2AfP0SQFA
	4WmtYJdSIpcgJm6zWAfnBOBan42qZZMe838qe9F33FpiQlCH8wxyvimO
X-Gm-Gg: AYBFou1GRrD6RMu4RbudeabeU0p3AjE15laoGnSOn07AmX1gmNiU7ZyHmkXjIYa7hGh
	48FkTSUXXOGi1vgr696lfRNzGqjaPb3jeEcuL/gWDn+t/EZ3JgFA9dw2ozTJTGkUrsi3NQKKB3n
	C11PH8hbbQr+XPpyey25qBRvGqSqa9fpSCG/ePxRVl8tzeRWU09uS1LwqcfpqDdKjBo5hxOOXyO
	YT0Ppjuu0y0gXIujk+SgivIE3Rn51iWAZyiITYpW4HUmLpubiWjGAieqbXAPCX0+00KtagO3YZe
	ejG90N+6DnrrBBGxFe9xOo0A/M7ZxHehMLypq3Ozd0PtueZYViYrBF+YWiCNmoaUjBh71UpzLjn
	3j1zBY4vHzUfb3xQkgjM2KxPx7icKySbraS3Q3Wm+2ptYqEk6S/7DggQTzhUDzYmRm7WvtXGhYj
	8xTEvYqH0MHwDGMacrOtfJkSBNwo5ltcO/+OEb2AYpr3sWWm1jze+UDzdF9iHhk7BMUk6aGzpw3
	pWQTPzgZkckWsAxl1gOubPCITDY3o9rXsr2xMoNilV433HDjh/GPXXOMo7v6c7J
X-Received: by 2002:a05:600c:3b89:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49e7a692d5emr106570525e9.24.1789475905719;
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
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
Subject: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 15 Sep 2026 14:37:58 +0200
Message-ID: <20260915123812.14747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053828_313792_435242C0 
X-CRM114-Status: GOOD (  15.33  )
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


