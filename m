Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA89C44508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ywWneQPOewpgKZndebLLY5mTtcbALfAJJu5RYI8s/QI=; b=VqIASj5ZuEcEBUEKLq8KF7ySfj
	VieYKv3I/E49Dpu9FN1Zw5230gQptz45K5mBmFz+XM5CP05hp/93kuddHv/+Dnlsql5xO7el/2uTG
	/eGZKrumZt4GPPvHTJi/B4euRVR9LWnI2CSW/EKdOnLxh6IeAJ8DOE5uYIOmz5Yu69Z8tOO44P/s1
	zFaHjEn72Tli2u0peFs56Id38QirpGfCQetUdreOby/qkw6jqq5jnj4DkNSGF+m8Y0CNV/Yg46Rl+
	k+LBk/wDho1q2R2mwYC8WGbf/V8ru/0LQu/UmpPfcyT0B+2yyKgitcFiJFakmqbJdUw5YtPHzJIGx
	Ti99Ci1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE3F-00000008uXj-41G2;
	Mon, 13 Jul 2026 10:38:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE3D-00000008uWb-0nLs;
	Mon, 13 Jul 2026 10:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783939092;
	bh=4E+jdeyxHU72SDz0s7k3Q69ptccQSHWPz/W0Q42mOCY=;
	h=From:To:Cc:Subject:Date:From;
	b=XADnlWxANguGJN7bl+NRzpLu1SRZZIU6um8d4jvJq6Sneksd0SUAmz1YhyvMqRHyQ
	 zdQ1JI1iP8aENu2q1GsS/WT+qfgENxK9OqH6JWjxV1Dt67+K8FZS2NGILxc+achbDr
	 oUjdJPxqi2sSjjGI8b3LuLsaPTt50zTDkMw+bFacMZ+ddJZpKWuPy9VPATLICGk1DU
	 hwR0nRXdzZfAfD4xu9/DaAziNJAiJRfBEG9anUTUZ72k0kFXz5hW2FRSMw6KY5YGpa
	 J8xTL9cjtVX4/v/VKG6FkbHwbatsWOWCE8XB4c2m59OQbrlEA788KXpEWErRRmCq+Q
	 fGByR+Cx9fpVQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A900C17E05D3;
	Mon, 13 Jul 2026 12:38:11 +0200 (CEST)
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
Subject: [PATCH v3 0/2] PHY: Add support for MT8196 DSI PHY
Date: Mon, 13 Jul 2026 12:38:03 +0200
Message-ID: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033815_385228_195610DC 
X-CRM114-Status: GOOD (  10.10  )
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

Changes in v3:
 - Actually sent the correct patch series (sorry, I had messed up v2)
 - Added definitions for minimum and maximum PLL rates

Changes in v2:
 - Added a few comments and fix scheduling while atomic issue in clk
   enable ops by waiting with udelay() instead
 - Removed one unnecessary delay after clk/pwr isolation disablement

This series adds support for the DSI PHY found in the newer MediaTek
Dimensity 9400 (MT6991), Genio Pro 5100 (MT8894) and Kompanio Ultra
(MT8196) SoCs.

AngeloGioacchino Del Regno (2):
  dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
  phy: mediatek: Add support for MT8196 MIPI DSI PHY

 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 201 ++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   2 +-
 5 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

-- 
2.54.0


