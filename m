Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC3FCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=; b=g2oAz6NZD8Vvq3phCsrBH6bMHf
	oo5BCNMDNvL74co3L9buNJByQ/6/D1tyPREl2k7hi5TPJ+GPkalwRkDdi7/LWx/lmcmfWFTbbFThc
	qODRDl+M+fsIGD/gk3ORqxe4jYpX3+a1oi/7Y/qNKi/0fXRnZxukc538RC3qf8VKAg9mubsoixjZR
	BcyFt9i1L5783FFUBnqLPtqOethWFf8CRz4JM/eg1uu0K9PgM9eBsGEzcBQpv1ozBlBw9z/C4HXPP
	pYzX2ABG2TJUyv7TNoHiA9gfFWCvmMUCXgRDK3ITMt2BVBxzblg3XMAXnnsCQuU4DV6iVld3ImBCl
	H2yuXpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKf-0000000EjYw-2hWp;
	Wed, 14 Oct 2026 07:23:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKP-0000000EjIE-1CZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a02718da81so29705455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962587; x=1792567387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=X2EfZoKmJxzpHov+frpOEikSXrPMq5Qe/4osg2wnQU6XAXJEtOonl/Kj+oLpw9VeAj
         HWdme1t1W36WeRTBTr+H05qU9YFpZoh03n28/d8aZdRZyjtcSKVPy9OgNJEzvCb4dAI1
         12zHAMq/1UWihg/5gOFmUrMGQmdoiC6/KJNHL48qvfgbCfYavwyNVl9sS31ftjcuK8km
         wXHLRcrBIIKGMcEuduzzEy25H/eBoHE7bLENUrCy3eY61nB3SHd4CLdNz2QHDvv5qPKJ
         RilP20O9GHGoISwp9ivwxydhhfTRw727mnXGMko1BsrahZOHVNp6IFb++86zVu5V2ULJ
         /mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962587; x=1792567387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=aEJ2lFizCtxYT+r89Lhf6wKfp3Y3Pt9sT2Ko1Fx69cr1BsDsQwV8WsC+0uPXJOoLl7
         BOyrHgX/KJdfClxYIjL8+lplpgotFcMfBRN8F1qXLQsIaBeaas1k3J5iOWY6+aslPUdL
         1v7EDhXHJYYs/Ra69DBSCgZP0nXOt0q9JRKUYFBXB4PwB8yL62wgiV0bCeKCy/pQjF8g
         HgM9rVTECdyyyRR9n0SR6m8IRhp35VCf7yYezkRy8SCNOPpMXgllEKT1iU1/1nemogGw
         cBmYsQBo4XKw/6Z5+IG2FD8UDnwdkuvnT4bwrkkSEr0R7kz8ut2udWtyzorzVwKirYAG
         ZXJA==
X-Gm-Message-State: AFq9FYKe0exk/v38xLzKhJaSLjoG8iAvzMrWwBCrMZIP/tlZTC7uwY1v
	+CuLMW8n5xtsFikTJPJpUR/mzgPUz1fBJ9VDEwKRv65Hgn3OkPEZVYQTByoHWtPP6fFvuA==
X-Gm-Gg: AYBFou3J13ap+kYqcPQJTOnD8GF3PyPa0dHC2TYKJlFuZFjHXz06ct8THOx+PHgdRiF
	TriXB/1sXvP6KMzwySxe6qlFDEDHJ3OI3Z7z/rBnwNgvLcYugwynU9huCeE6LfOuoKQg6PwkXak
	T/0gfmVDIlhEr5onHLn/jbatdcAdX/fwdIoVh6FGCPSgfSkeGMYrKsZjSxKYYSV52gB3eb70oMr
	ODoTgEqAELpjaetyytbNrJGIFuiE5vSlpNZ/Z87qCY+2SO815BJOYbz1iYj2pinQ4kF0y2HEkbs
	egYRTDOYxU2XMIY2ev+RBJlZGUwUSIgnNEwo1UDiBK+AfmjI9vW/JbUtAqBk8N8Q2mvOPEHCqIY
	ADfnct6chwQTOnCxuwYPAqBicKdwMLYpfX1NxuDRKfLqmOjTw9EgJlvFTNd3qr8MmKNw+uDK1B6
	XtQhfhVbktbpsGgB5QdgiziNBpoo3vO3qmFRCG0Ab2+zfvUpt+n7X6cgLLoAAD6fd3X7/497dWv
	eYWKOgZ+YBOgxKYYSP1meu0buW1SGb/NTeoQJ9qpvMcier1YhdVxzTxiA2N5aK8Ptw0g4dQZp2s
	Sy/oxcX1TXCP+Phyp1pWWkPGHzdTt2bglHyHhctv0vgOvoNrzOZYRrsOvQBERbsCkaYj+/y4
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr79484415e9.28.1791962587425;
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Wed, 14 Oct 2026 08:20:54 +0100
Message-ID: <20261014072109.1759502-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002309_346519_986C4C7B 
X-CRM114-Status: GOOD (  15.25  )
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

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..fb12414ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@a {
+            reg = <10>;
+        };
+    };
-- 
2.55.0


