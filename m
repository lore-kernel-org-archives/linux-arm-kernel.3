Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992B0C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dfv/tpuuXpETFQPHyFfplcdODu4+Dj7f6JIGb6QXBE=; b=tyYxQ2kAA3ruk47yx0NUFiVS1K
	qFAf+9pOcARBhxNHenrmGqvGIzImgQy/+Et/Oqm6IxsPNBTqUC1ByK2LzwZ/IIOxd5QHXMb/105+q
	1ZQnUrpxeJZO58WqH9ey/G9KAiVbDuebD2gzpKIkOTI3BgkDpI2ZMOFi7pLWiocfND8v9a4azSEfz
	yfyLDhbOPRSSyqs4hQr1Ix+5OpNa+agZE/rq7us+SI8bjnd2UDJrBzQXWxt/EKln32YyYBpYk32Z4
	MWeTIP+2Mgq9ISa8hsB5i49x9qhHTCqaRUXMduxtOyFf/XPDcEOcr1N8KFJ0ZIe0R+JdNB9sb5lYm
	SzQCbrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51V8-00000009QsW-32ai;
	Wed, 16 Apr 2025 12:04:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51TF-00000009QMi-33Bx;
	Wed, 16 Apr 2025 12:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804943;
	bh=sHNaG5FwaoJr2EsT3BMvvyYUM4RyedYboD9i3EOOPtA=;
	h=From:To:Cc:Subject:Date:From;
	b=a+tQiH6QhgNo0Gjgwa5imwKxjwHYMVK9O6E3UtmlP/qQqarWsxbhvjPfedyOAh9Xv
	 FkGo6679ER2B4fxxkxI1rSG0Cx+umoqrTAQ2IUjGgxpFvajDz4kJfpqewHzT4bFScR
	 gv8irIVt3Ga6OtfSwgupYQYLxWxgjxZp9lmMq2hC/sAkFR0qjqwNd+vWNQJIiTIHbm
	 nUSwb9BPor4HcN0dkqiPnxlzUm7pLdH49ZsQnJxDXwXaI/3sFsXMHn5VEAboz/2m1e
	 twEeeaUga5/OIBKEYxcMpn8OEyEdF++hV9Uu2G4P2SNirpyEDTe2Zp9xqIMYJAX8Sg
	 dIPoaqrWhCmRg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6914C17E35EB;
	Wed, 16 Apr 2025 14:02:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT6893
Date: Wed, 16 Apr 2025 14:02:19 +0200
Message-ID: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050225_913954_8130A97C 
X-CRM114-Status: UNSURE (   7.52  )
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

Add support for the MediaTek Dimensity 1200 (MT6893) SoC: the DSI
PHY found in this chip is fully compatible with the one found in
the MT8183 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index f6e494d0d89b..acdbce937b0a 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -30,6 +30,7 @@ properties:
           - const: mediatek,mt8173-mipi-tx
       - items:
           - enum:
+              - mediatek,mt6893-mipi-tx
               - mediatek,mt8188-mipi-tx
               - mediatek,mt8195-mipi-tx
               - mediatek,mt8365-mipi-tx
-- 
2.49.0


