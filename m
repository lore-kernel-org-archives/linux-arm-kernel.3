Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC61DC9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCYmYCUJLMwv/lnifYpQLvM5jtHKwUt6hdm8B2IIUL8=; b=VqQG4su0rFFEHaCVcYHIniDxP9
	fahj6AtBMj2+WosULHOtQ9MOC2NPHpp3FN7UFLq288G18Tp4nQEC0e7ehLuJlS60YdRZ5/8MuIMUd
	GMyS0lMUqQqvmFKW3nvjSbjt0JXTcbEPV2ErBy6krO+KIvtZp79OAvuQQRDm6rdfnDcqu6HbbLg0O
	tex7rI0CtyGycPmndXKg+IsrYVATG9M1EN/MIZzGvy0uwSV4yjqCDe4dZCRA7vQXxrOT6wR7HF4M8
	Z8cB1pvK3XjuQTnlmb5EmVOJ4M15W3XxiL0MJCdhG/BObLeukIIJ3YcLA+HGZm1RkQbVlRqh8Puk4
	/qvGGGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL0-00000005aEU-2TXU;
	Mon, 12 Jan 2026 14:56:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKv-00000005aAD-2EO7;
	Mon, 12 Jan 2026 14:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768229762;
	bh=EJPDZ5Dc0wB9GU9QhHDnXlO4yycbpJpZQSij8Zfro74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PsZEo9vPLa/baVTfh9rInF23112cXEwreoXivkHsmb26OJiZW7Pqom/9SYyn137Yg
	 A9hcrSG2xrPDtyfo3TQHFyenhujg3/CHHFHjwqoQxmtowLFj1Jy6yWhPWIes1+8Dcp
	 WgJGZ/FLCBQhnJqCZWmmUHR7boW/v000gk88GhE8/F03Tt+YDYR2b6Ut0XB811DuSg
	 LWLC0695WrayevzWrg/F8/Xc35N+pstTD6DQv0ctrLISl0cV5weXccs0hKnXV1+hqB
	 IOHgO9ZGdxuKl2YysfDR2eV98mM3jNVbgiOGFVe2xCNpTFRzqp7NrTh62vHaBoQuBu
	 DbNhxRkLeoMUg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207E117E0B8E;
	Mon, 12 Jan 2026 15:56:02 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/4] dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
Date: Mon, 12 Jan 2026 15:55:56 +0100
Message-ID: <20260112145558.54644-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065605_717268_D7F81FB3 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

Not all IP implementations of EIP97 and EIP197 have the EIP and
MEM interrupts hooked up to the SoC, and those are not required
for functionality as status for both can be polled (and anyway
there's even no real need to poll, but that's another story).

As an example of this, the MediaTek MT7986A and MT7986B SoCs do
not have those two interrupts hooked up to their irq controlller.

For this reason, make the EIP and MEM interrupt optional on the
mediatek,mt7986-crypto.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/crypto/inside-secure,safexcel.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 1c8bfd6c958d..3dc6c5f89d32 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -34,9 +34,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
+    minItems: 4
     items:
       - const: ring0
       - const: ring1
@@ -73,6 +75,18 @@ allOf:
           minItems: 2
       required:
         - clock-names
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: mediatek,mt7986-crypto
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
 
 additionalProperties: false
 
-- 
2.52.0


