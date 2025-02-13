Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17511C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmAkLzA0ppT9ciqOn3hKY6nSAB9ytOhlS9TDTri4luo=; b=Q6h58QMiU1KGey1kd19vI0iEAo
	VEbQyov11IECvWnBgXiR1/W9R3LZW8LB1F0e3HNYBR3mAVXsOhSeQF8ryueQAe4cjloS3nrtvWnxa
	Dwb8tbruyyfhtmT6Qq8goPzcDyRih3lTZaFXQMvFHd80PWTzPLQFBPJNKfWG+b81I/9SXQ9tD4qvF
	UQV+upVbLu/7PM3p4xGXFaDPX5JCYanpjzv8RIbD4b47sjzZhJOBXVMs3cr+Zve3uUxccTz/x3BGn
	L6TJswzEA74hzEO8HqVdsVgDSm4wF25U5ZWMPlFJE3WVqg2m6IxXNqArY0AKm7wUIHkbJx6cLzaLZ
	qqRk815g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUPP-0000000AFDd-2p8H;
	Thu, 13 Feb 2025 08:17:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUEV-0000000ADIe-2IoO;
	Thu, 13 Feb 2025 08:06:04 +0000
X-UUID: 5bb6babce9e111ef82ff63e91e7eb18c-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZmAkLzA0ppT9ciqOn3hKY6nSAB9ytOhlS9TDTri4luo=;
	b=q7v9Q4TRLKWsP3E1FIi0jxskqwJFgAYiqbyZt9H0nj9mW/RJEWnDrIutIBQNOwSBWxIKUNXf30GN95enk/m0s79EPCzw4IDBugFLhsG08Fy8ETqGUhM7WAYXorpNay/VwLgDBz2YkIcdUwRgQPUTH44kSRf7M7o8lEoXRe6dzvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e495b519-5cee-49d2-bfd3-18dd57355d4e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6a2c8227-6332-4494-ac76-ecdca2a41930,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5bb6babce9e111ef82ff63e91e7eb18c-20250213
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1526880657; Thu, 13 Feb 2025 01:05:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 16:05:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 16:05:55 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 0/5] net: phy: mediatek: Add token-ring helper functions
Date: Thu, 13 Feb 2025 16:05:48 +0800
Message-ID: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_000603_647415_B8C5A42C 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Sky Huang <skylake.huang@mediatek.com>

This patchset add token-ring helper functions and moves some macros from
mtk-ge.c into mtk-phy-lib.c.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
Change in v2:
- Split the patch:
https://patchwork.kernel.org/project/linux-mediatek/patch/
20250116012159.3816135-2-SkyLake.Huang@mediatek.com/
into 4 patches
- Get rid of mtk-2p5ge.c patch temporarily so that this patchset can be
reviewed individually.
---
Sky Huang (5):
  net: phy: mediatek: Change to more meaningful macros
  net: phy: mediatek: Add token ring access helper functions in
    mtk-phy-lib
  net: phy: mediatek: Add token ring set bit operation support
  net: phy: mediatek: Add token ring clear bit operation support
  net: phy: mediatek: Move some macros to phy-lib for later use

 drivers/net/phy/mediatek/mtk-ge-soc.c  | 296 ++++++++++++++++---------
 drivers/net/phy/mediatek/mtk-ge.c      |  78 +++++--
 drivers/net/phy/mediatek/mtk-phy-lib.c |  77 +++++++
 drivers/net/phy/mediatek/mtk.h         |  15 ++
 4 files changed, 341 insertions(+), 125 deletions(-)

-- 
2.18.0


