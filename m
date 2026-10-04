Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A2CCA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPkMV4LDUGNtqaIPInjsEvbPyhBM9s86wkifiwBiN14=; b=kT3vBgjBVgEjAd+BVqaz4d5YNQ
	rpnmNL9VIWzwnmToZ5qAQ3G5lIIvKTpjOTOGb3yOLKS9G+2gtrycAPwPQFZSBaOXBTqnqZ4xEGBRG
	AAb3XRvm45CalOzhAa7odO8pI6B0yMIBIYrLU3lyVL/3a295skmAgRcR59D5G3Vc13fwVqOQERkcN
	SA/5hCq6phd/VE2AqeHqkYTubmSOoJWFfoxMWbAf0fZmEkJt/pRz98uiad7Q7pZHNVkxO39FE4k6B
	Q/vHnOJBXoyHwWbdlzqEXlIjG+ne6pkbh8dLiDGyon2hLGxFqfPaethcxrLwUVggZ2pgavdCgq/6/
	CdPrFK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOZ-0000000EvG3-0UI0;
	Sun, 04 Oct 2026 14:40:55 +0000
Received: from mail-wr2-f33.google.com ([74.125.225.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOU-0000000EvD4-46ba
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:53 +0000
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so481996f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124849; x=1791729649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPkMV4LDUGNtqaIPInjsEvbPyhBM9s86wkifiwBiN14=;
        b=25qGR4g4S+/qwz8z3sOASfMSo1J1sPk57TXtpxJ9cLtroFNxfcHxS8JLC5dKCMQNYz
         TDHszaTfhuHpENsNyzZyne7nGsSnoNhbUKYpoNr7HvHp21ayaWjP41/8LHej1MYS2Whq
         oKcBdAhvYOZOXShhiaTogyTIQ2rQ55nqBBS5gH7vkwu22N7FIgdeQCMRvLJ1qAjBGyF0
         2tbZIWKffhI0xKWuJJv0qdDN7nOjZjualw9ZJQmaLVo0RKbogTfEcJaKgs4zdSD9PwSj
         Wg2zx39mNvt0PRTTt3LcNN7RuYBB1rXroLRQHc120SHpdXjQGaG9hHbhBXF4F6QvRcBl
         Z6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxL57Yg5GFcj6Y3axV6bf16wjGiJJNlI5KSJUO5kPixXozkLR0m1W412kPFcpZXiOPB7OU5CkfzbFTFCMLN1ZEg@lists.infradead.org
X-Gm-Message-State: AFuF++mjzmxbP2zE8izQ3+xvrRDj1P6QJf9x5IUWXb9aqyziUSyhufnZ
	jhXD+q53a2Ga75ohyitI56WKeA7Unp7jw1gJqd1zGqQm6kxdzqM+b7u4
X-Gm-Gg: AYBFou0D5PLj4GETsRa8iJbQ1paeqyK4j896J8fgQsPpJus8HzwmOkrynD03x8n+gzL
	lhx9KWun0r6idHEkTOCT0dxMTeGE+UmtoToz9d+7dHtlG2VPkmpa/Dh3vcQadXsxu2qrS1nb0Nh
	mgDLIJqVcfD5J3dmMxI2Odb8PujgZ+VtmUlNsRZwfBSvDLhr26H04C/vEo4ZdtzNwGE6WYa6Jmh
	ipdV8rJzprH+NRK9sBjC1avvCmBS20YfyiP6r4CPZOcCvldPY2kQNSBAhwNw3zBjiq6nt05JKF4
	QHpiJHPLYJuQX2GosNh8EACb+282m0OE4vSs2cbk6cBIp/tqBlQUjScLWTotADXN/E2PrDn7N8n
	qDQ0yOyB6ti0A+xXZM33WrT0ywu/3TISuJxk/5TQGGzsIBPgth6h/WBns7Xw+nnQJKe/2aoV1q6
	agofhWDYy6+k54waTYc8STJrzxBzLKwHQu9sdJBI7AW0sycnvs9KRXB8q+xV0kJOjtAptUExY+8
	0Sara8cr333GLo7MA3/xVPdHKLuHkIpsg==
X-Received: by 2002:a05:600c:870f:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a0274e9d30mr145830305e9.2.1791124848951;
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:48 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC PATCH 1/6] dt-bindings: net: amlogic,meson-dwmac: spell out the compatible combinations
Date: Sun,  4 Oct 2026 15:40:41 +0100
Message-ID: <20261004144046.391444-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074051_053855_15D70803 
X-CRM114-Status: GOOD (  11.62  )
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0


