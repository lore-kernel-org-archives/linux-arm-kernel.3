Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FAEC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVB2PVIxoX5y0VwNAUTU6UTUCxBZyuk9nnudYr7DJnI=; b=PxTgpGmHz0kJOd9t5O6F0wJLZs
	qI81+a0TRcMMPZ1TZu6WJUxOoI+xqqykGC942wi0TC6rvxcospNzmkH1xxpPjkv0gENh9nPqHjXYy
	/VMxkXH+nlhLzc2k2qZoA/cW4qsDtCu7f2l8s6R22v0eD1BFc8fPcv8z4sr9ROhoYHLjIsPwwQEWT
	mCUM5Qn0KVun+/CfEpMZQYqhVVPZt8Hg8Pf9hWezAq/ON8Yd5m9ET4+wsJIAMhuqCHaQGOrwH6Yrj
	slVjuOwjrGv51/AoUujrRQen4V5DpCmSZCFMRdn7IkwxsuD7pG2LVKlg47y6Nrm+AY7bQzEcgDE/l
	teRjqbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504P-00000009BX3-0QBx;
	Wed, 16 Apr 2025 10:32:41 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTI-0000000934L-34aW;
	Wed, 16 Apr 2025 09:54:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 9FA1F60F58;
	Wed, 16 Apr 2025 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rVB2PVIxoX5y0VwNAUTU6UTUCxBZyuk9nnudYr7DJnI=;
	b=RJEb1CmgobI1aJLc6mB14rwQZcd0xdKnCoexAjengZud24wB39P5LmWApsdemzxEZHloq3
	M22aysxnjBCbDzaV4NwnppmVYB/Cr3bxtPzLPc4FxKrDHBsi8qAzNxuAvtse8YinD90a9M
	J3hIyX8PBYCkra+vLlSpTSBmtVM6H7w=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 6C124360084;
	Wed, 16 Apr 2025 09:54:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 0/8] Add Bananapi R4 variants and add xsphy
Date: Wed, 16 Apr 2025 11:53:52 +0200
Message-ID: <20250416095402.90543-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e76a1c3f-a271-4636-9d6e-a4f44f5271a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025421_080035_71C253EE 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Frank Wunderlich <frank-w@public-files.de>

With this series i continue the mt7988/bananapi-r4 dts upstream work

https://patchwork.kernel.org/project/linux-mediatek/list/?series=952704
https://patchwork.kernel.org/project/linux-mediatek/list/?series=952805

- Adding new Hardware Variant for bananapi R4 (1 SFP replaced by RJ45 port with internal phy)
- Adding XS-phy for pcie2

because of new compatible for 2g5 variant now requires also a series i merged both into one.

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (7):
  dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
  arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: mfd: syscon: Add mt7988-topmisc
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
  arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/phy/mediatek,xsphy.yaml          |  17 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |  11 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 400 +----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  36 ++
 drivers/phy/mediatek/phy-mtk-xsphy.c          |  85 +++-
 9 files changed, 564 insertions(+), 396 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

-- 
2.43.0


