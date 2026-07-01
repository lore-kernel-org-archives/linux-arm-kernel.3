Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B24C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pm02Pr5PycdMJsMW5SIOdJknO1MgTBpZi+jSk+ApUM=; b=MHl4a9qWmQH7Aohp5FfN0WBCOz
	nXa+3DteUCsaG0PGEM6L51txgOudDKf4Ulq7odwZWeQZmFR409GPfMzVL+S54OFmkwBCoZ/4r6WSB
	AFm6bmq7N80vYVeRlpgHuq84vxla58A85YBUCEoipweF+jAHgI7n7EuTjw+D8jPQ0hlEyqmvxr6oL
	Ql9HSk2tnyDWbhpd2mo4xNv+ysTtith3wmu5OaZqP46hCd9IPZOQiRDLMh37On+q2GWLf1zywW9yY
	mVTbJK4JI2zt4anMMb+9ztaEVa9rbvnehxrVmUcuOtOlTeuY1fHN+vxnYNIFBPL56AOKrmLQP9zYj
	8+dI7REA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuw-00000001pt9-2uVT;
	Wed, 01 Jul 2026 12:19:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetut-00000001pfd-2B5E;
	Wed, 01 Jul 2026 12:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908385;
	bh=WHNLQXstaSvjQdtLEGq0x2xw4W1yDu+40Hx7BUf5Ka0=;
	h=From:To:Cc:Subject:Date:From;
	b=a5Nb6P7HAMAR8J+o5SeNHedbaW/J1cflADtkC3n7wABnLDuZpvWJhV7h5lRvZFXfH
	 RGISveZDwvbLMJS7W/BMQCqKxFFgYiLxvYGpujZp/jRcpg44a/k9xxYho+kHBhYzPP
	 8Wab1UoVZRKZ5Iz0uI1896OFIgv6yyHrJH4JXHp9dG2pAqOHFEe8UYg6MY3lzmYISj
	 N2mzEHmYjiSucS9CcEg1U7lIWsIPpRlg2wFrWbht1RoXYVBxOPv86zXF+40odX8js1
	 2T/nW65OucG5yIvRC1FZcvs09DUrxKdp7mxf37HjHuNEgcZxfViw2x7alXC0ehJQPl
	 GtA6D3P5nvjVQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C840E17E0909;
	Wed,  1 Jul 2026 14:19:44 +0200 (CEST)
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
	kernel@collabora.com
Subject: [PATCH 0/2] PHY: Add support for MT8196 DSI PHY
Date: Wed,  1 Jul 2026 14:19:41 +0200
Message-ID: <20260701121943.19430-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051947_756317_1BC922AB 
X-CRM114-Status: UNSURE (   8.83  )
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

This series adds support for the DSI PHY found in the newer MediaTek
Dimensity 9400 (MT6991), Genio Pro 5100 (MT8894) and Kompanio Ultra
(MT8196) SoCs.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
  phy: mediatek: Add support for MT8196 MIPI DSI PHY

 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 196 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   2 +-
 5 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

-- 
2.54.0


