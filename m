Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQvBefV5ea23m3tM/+a/o3JweSM477tUzEENUJjykEI=; b=kKMi1iaTt9F8uIuOarLkEjmlOx
	ADcIpWVOgVbYAC6kYHBn6pm1I8gTMl/smfEyW2WcUTsw65EbJKeZHpDOYsO2jlGLPhu/BLNkEQXPf
	iOI2eW3g3YfamvgqTxhnKECdnQkaWg7640pGJXtdjxMqjh4z7369o821zt/pvDrTwe0uKr5f7lE7d
	my8ylZP0imiLFaCBBFXxuVr+ZFNcjDtGvoN7YsYEQSwAscVSCqG79HylHzwm+uV5M9b5NZir0SZUv
	X7cbcU+FjgwcH3W5iCcEeWhpXCC//iahFi3EnUco3fMEDV498hmhXnJ92ppGUBaawvXA3aEIIQo83
	rvKUAw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE3G-00000008uXw-0gFj;
	Mon, 13 Jul 2026 10:38:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE3D-00000008uWc-2iTM;
	Mon, 13 Jul 2026 10:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783939093;
	bh=j5lGbsuNrMuX2/MBNskiphqCbXX2IsyCVQqLudRvkx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ip+OlFxPewx/MeOw5CRAZNfD9gBfEHDjiwiVUpBB3PKns7El48CnNmZxaus4X4+o4
	 PCq3cX9/B2rqMulQCnSO4OCfMKHzS/RmmsyVRrSRPLhyh9B8OTvijFfswPkUagItYU
	 ne/Ua18idlN1Fw0eMM34xzJDEQVhn0dvS8jeK9TNp7cXB+gghStUGyUKRJSUiv6cY0
	 DPj+I+shzwA/iPYwY1i+GSl/EF6HE5IWI4og+XSwz918rzaeQKHAMdo4A3kPzzXGev
	 hy1krySs+UafcBXjN6RSFhPLwmEHb7HxadC8le1YHvL10eoLoG+LT0fAnJaHT5XJoN
	 9OJaZe0gzNH9A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 810B517E0DE6;
	Mon, 13 Jul 2026 12:38:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
Date: Mon, 13 Jul 2026 12:38:04 +0200
Message-ID: <20260713103805.23030-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033815_824299_2DBE20BE 
X-CRM114-Status: UNSURE (   8.44  )
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

Add support for the MediaTek Kompanio Ultra (MT8196) SoC: this
chip features a DSI PHY that is similar to the one found in the
MT8183 SoC, but is a new (incremental) revision with a different
register layout.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index c6d0bbdbe0e2..9df1dbe1253b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
+      - const: mediatek,mt8196-mipi-tx
 
   reg:
     maxItems: 1
-- 
2.54.0


