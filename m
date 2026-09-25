Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763FEC98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=XekfGoLlVlBUmYYExGsJrC0egy
	GLHHaxo2b3MbQB49YiZQDUz3yGbb7LloKHKJiUmwEQPKFUbVfF2JNyekJ7EpXe0E12FUr2cQatVIN
	Sy/97PZTZ/iKnV/qkjb3jTA97EHPDmUHzrP8uJkFKcXqIJmQqrCve9OoKWCdCiEIwAMTsFgBmk8dZ
	FWNCKR3V2YjBs5hmRo/GXy3Ru/CpTya9u2Wa3nNIRWkiiNlsuUCmfSf5ihxQdm9w3seJq+HTBH99B
	CgszOc9KC/7CXvtD3HTdOogB2OFOgTHYZU5p3gjrM1EhEXq75IbJAIRHTvUDvI20HFtmw2kPRBHai
	TCNk/2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbY-0000000E8AN-2sYA;
	Fri, 25 Sep 2026 18:25:04 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbO-0000000E83T-064F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 18:24:56 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48882c1f261so277587f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360692; x=1790965492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=f/esiJG+WFQLiNEm4f5gnHqgKZLhaR1Z+e87JkbbAkrprRoaA/zZb/SVopACSRb3DL
         eEh+Cd2k5r6QMOQ00DXxRHeZsxxr5Kt9IgZuF4RH3gvjQYdsz2ZsO/rxjZkaZCS1h5+2
         Ri3MKT2dlbacbBxL5TYEyfoscdPSX11/EpXv5NtlVnBJhjC7alyEIAPyFixFfZLujaca
         bzLJXPsRd2xfFClAyJG9CtTe+5P+BPIbLrqyIc7Hii/9URWa8FjlfVEPvgwkC09fUSZP
         boMzf2j5I3pb0YiN8oSeKVvjp97qFdQeGpJlixaKo/hJLmnIDvz+Xpt+qOogIzLvuiU8
         kiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360692; x=1790965492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=OT5bL7Rlk0g3mdhb12agI3UYSFNQC17t2Trp5omrNXflauxlakUL77poBoa+4YiImv
         SL03cwLOj/Z6VJBbQBeZ+Bs492CDrryM2L+E6c35o3S3mWX+4o+zAcLX7VEps97GjDk3
         DqtU7pI9SbH7rLb7Dm41Yzi4vOBT+FV8IZFUWixtP4d6gf+pYeW0EVirbOqAkSswBRGT
         T3QUTvd5aErrmY4TL25p5O1RwSrEhllqkl14HrxyK6tLbgCeOK5gBWyVSRCopabWICCd
         LXCNvsdcJYv+bIVZnaY2X51A+2gYvOPQZdWrGQzftT0I1MaezoIMulwRPyCcg8IbVrqE
         MqDg==
X-Forwarded-Encrypted: i=1; AKwUvBxa6cSPOlcTib1WC++dm902hDJG9Se8rZvPcw+XEjPQowQ1uA6N8VIiL2RLY09ERe/pamY3K+GcgnXqAsTmLLvp@lists.infradead.org
X-Gm-Message-State: AFuF++nfPhaDesqmd5F/cLfUKmhNuuqerh+RXUuvOBqYTp+TgujVLtpW
	BquEI8FDLei8x/SzzU2MfbesxxRREi87WZD5cVffI88JWQBaEuANYnCT
X-Gm-Gg: AYBFou0hBYVRNI4nLj0IZ2YAouc2heRusAsTFMDUqaD3xRPTA2Ka+1WQfHZAcG1/v4/
	v+RBkn2C3Rk/yxU6qA/pMLOjbe78IXnLKxYGKAT6OH9HJatd9Pd7HPsBmr3ad3n2LtmJf/fkxW4
	doW9BPxOW5k71s8sf1VJ5Z+XI4UXD4GzI1HWY1gDRnl1CpmfogM7SxSNhfuUQ47WuC/8TyfcXRI
	AjOxmIdy8HlHMp3pzFDzQDKQr4rZL/Qf6N702sSNMQ4DztifYmzGoh/1rcW3SKZv2RvQljD55No
	KvqB83XYI+tR8d8mKbXCVZQzMmmKmtfelr3Xk1vzAkRrkHqpMtkk7mXs0Q4OWZFkSqaR8B19/fS
	WMJhoosvPusFuaiQRQgnahaDJqYzHc51AqKiMJ/BHOeu8h+Kn+naLM0l+yUSDvvC0rt+any9joB
	jXxu4kpELWu8MWzyB2HJwd4K1VBDbYNdw3DyM3RCK0152z5NirgzcVsP1ouUq+I7nFDtY2B2ESm
	A75ULrMDraNbIdcn++jDqmjDQYf8NnDyr3NFRqnczB/q8SKDpwGTyqLnz3B9v4lfA==
X-Received: by 2002:a05:600c:630f:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-49fe6704682mr112960035e9.16.1790360691982;
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
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
Subject: [PATCH net-next v23 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri, 25 Sep 2026 20:24:23 +0200
Message-ID: <20260925182435.21207-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112454_364458_E687BD7A 
X-CRM114-Status: GOOD (  14.87  )
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


