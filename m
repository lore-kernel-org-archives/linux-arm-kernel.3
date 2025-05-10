Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F250C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cwoa6YEoLumzQE8cS+ad1dIlqWJKYevB3c6NtJXNM8U=; b=Ve74C0rq49ReJvSydkq7zIzWpx
	GCGTyg3g5JUegO4rP/lsJP7KdeHIOAuQpyPPFIu7Vm2fhj19LeA5aY5RKc05gyJr3ie/fVAbVb1F/
	FWNs+AaIYTZIFXteQi/dac7RzbkPbNGFzwQ2/e9YvNs/q65aXQTJRI0R8WL5RNJIaNUCBn8a+eddg
	EYXRr52GIcx/cUHAZ7qnr3OpEqUcHRhrKjxkbaoJBqyVwUCw11E9PyVblD/jJXOgn3671wW5QwB2q
	LNCdzQYAW1P6vorxhehlPYPEDZieN4YvOeo5fcWVY7c8MGaVHUFU8tulEYmYjahI+scslFz6JCVc0
	xuVZ1KTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhi3-00000005q8S-37RC;
	Sat, 10 May 2025 10:45:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNp-00000005nkc-0SS6;
	Sat, 10 May 2025 10:24:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0618746bso22038875e9.2;
        Sat, 10 May 2025 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872679; x=1747477479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cwoa6YEoLumzQE8cS+ad1dIlqWJKYevB3c6NtJXNM8U=;
        b=bymDbs60DKQPHxVpNNFCLUtUpL2BeWo1s/dG2Ep43laz4rZpQYipikg2dEPj+juC2B
         d9l9VabRJ1q6GsU/T1t3Tj39hFyowwmuCaI3PRuwbxNCEajANYg126mD7wh+YBz5W8D+
         eZc+Y1ZuGUy4lPJ+Lgy360NOHy+oNUBoTck8a+y1I/Ph20whR+JXBUmGpeknQjolbt71
         yGu2wabzgOEtVT9toJvHh5+RBE3M+VfHggr9NqfDSGr4LeUwDK4Jvm2NdwM4lfgAx120
         tpcnYxJagiBcr1sIGT5RZwacSTm2blj4YRuuz1XJD+xcTi1z59exu2nYF+V5HRQH8hsK
         BJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872679; x=1747477479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cwoa6YEoLumzQE8cS+ad1dIlqWJKYevB3c6NtJXNM8U=;
        b=WzjS2lMVDN8zJMz/ng4PXsqQY32RrYj6Oz+feptDOtHb4uIyDR7pTYAw+4wVB28eeI
         VhIfozB6AhmVFv01PI+BPYn/vd4o9iMZ4opDo5ZYbUHhptR3rjb+wzGu0Aly8cz9L0dC
         6JueVmHQyT2u+3KNnbS9a1oUEKnSxhF9UTH+bTPT51b8QnMpcNWBMCumpu0pwS6N4pKs
         27FfSTc7HxiESrSXtJweFNT3PNzX5XwA317i7Xym2TnquEU2fYbsGUIkwtBqfdrwB0XE
         DB4cFrn1kyRmqXargev/njY3yIEtR9JMH+WncJ3OuKu752g8JRnT6jqzE+SbDnoYAPM+
         JLXA==
X-Forwarded-Encrypted: i=1; AJvYcCW2aHlT8rKB1R9ta9di6YJ+JO6ygEnaB1aRzJIVdHMsOvGRkpKXI/vCcIKE2/iZCA8JE3DN0PKiQrCeCNGKr/g=@lists.infradead.org, AJvYcCX0p39oLib61iqPC1Hz8s/L4w6iQhgl0LyKGd0VdZJZ+R+vmpNFvvztN7qo58t+cBghYBAx2l7JYADVr2ZZxYXD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5t01QrHjlFuTOK4Be5f7iekrV9cvPl3anBPGS6Nm2wYLcV8hZ
	20jcFdDMFCBNtMBHG7eWBkXEY+VxK6ywcFEnMXiDIkIeeP4Dikll
X-Gm-Gg: ASbGnctMgli5FWzf8ajqcvh+nZvGk9YhrOS69kYl+W00DLOSmc4c4SlHDe4TOZ0l4Ph
	Bj8OXk/3W/vdWaR66DJRg6cMHftP8lXhEewFknjJ8N5HnWrkov2hVMcG9exKB6Zz4+7UAanpbaC
	7nPugYu6yHrCH2hLyDrY4t3xm6LjGbtk63YPVUYnH44AmipnmcJh91UbBDRNfBhxlawQVTe667s
	mtu7aziunxoL5ejfohheqFmlqsyHJsd8G1TNvmqAwhPZtjVxB30to+D9O1bL3GPP2PIWYrXMdGj
	XoHxTlnqTFas68BTedJrAmf0gbYwuoPC5L6H02I4vjjnbApwe0OWXW4zME9D1BlB+PJMn+TG6AD
	DfOWy1OspmyCck1rv0Uog
X-Google-Smtp-Source: AGHT+IGCyd8ucVTH0Y5FJNtbVJ+m0AnBb3mLqX8BFfgIUed7kPLxXPVGj0x6GaLAbeJ2w658n+z87Q==
X-Received: by 2002:a05:600c:8708:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-442d6ddeb99mr64817685e9.31.1746872679266;
        Sat, 10 May 2025 03:24:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:38 -0700 (PDT)
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 10/11] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Sat, 10 May 2025 12:23:30 +0200
Message-ID: <20250510102348.14134-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032441_148702_6302ADF7 
X-CRM114-Status: GOOD (  13.89  )
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
2.48.1


