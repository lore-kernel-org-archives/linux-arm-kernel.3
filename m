Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA262C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=95+TfsQFbAqrLKW6vRoc95bSZAIrkYHN/gPsou0GUZU=; b=e5LIZyv6vhAMbjkoyLR09Zn+CQ
	lhHIQR44gGyxNpLf6AL38//sV24fo7UAWT418VMuT0dwfpctO2oDZB5BpB1Gu2cT4QNNMrNiXYNVU
	63R427oyjE5WLNLcS9wk6bRSXUaqWTY9XwPRjKoSU0ICIePo2d6vHP2/LCP5lxXvaC6erukzGx4Oa
	2I7BBhzJTeM+/OnbQ84qsJbJqBbAY/bvYQ07QSmx+xxdhdbU7HhqWql3eljdWcPt2xrBiJLAOlgpd
	709pCX/SAdiZMORJOKwNuWFaGAD/47odS0sPeGJfQ9RyFfdXbG0cJBPxFChpTTokOmZxCZaFlyBun
	3YuZqseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mp4-00000000amH-1BZs;
	Mon, 07 Apr 2025 13:47:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mZr-00000000WxL-0ZKA;
	Mon, 07 Apr 2025 13:31:52 +0000
X-UUID: a5af42f413b411f083f2a1c9db70dae0-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=95+TfsQFbAqrLKW6vRoc95bSZAIrkYHN/gPsou0GUZU=;
	b=iN5Z/BmNwcIR5RzvVal91yo1dSx1Q7r71MKGKSAn/hd+7SjyFJU5/5/2fZ2/aNo4qBPLhEUBViscHC1mjU7bGbz/CWB+LUaZ5TIIiww44G6vVOx8TTQEOzR8bUxdfURj2CUjrLdsCn/e6M4UhaikKOGESbKnNppZjVQYTUPUqkc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3231fa81-c950-4f9e-aa5c-62c7cb1d8bee,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ea98c7a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5af42f413b411f083f2a1c9db70dae0-20250407
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <bincai.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1293531308; Mon, 07 Apr 2025 06:31:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 21:31:41 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 21:31:40 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 0/4] Add dsi support for mt8196
Date: Mon, 7 Apr 2025 21:31:21 +0800
Message-ID: <20250407133138.22449-1-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_063151_178572_34A29359 
X-CRM114-Status: UNSURE (   8.33  )
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

Bincai Liu (4):
  dt-bindings: soc: mediatek: add mipi yaml for MT8196
  dt-bindings: soc: mediatek: add dsi yaml for MT8196
  drm/mediatek: Add mipi dsi driver for mt8196
  drm/mediatek: dsi: Enable runtime PM

 .../display/mediatek/mediatek,dsi.yaml        |   1 +
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 253 +++++++++++-------
 drivers/phy/mediatek/Makefile                 |   1 +
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8196.c    | 201 ++++++++++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       |   1 +
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |   1 +
 8 files changed, 363 insertions(+), 98 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.c

-- 
2.45.2


