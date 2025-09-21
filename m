Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A45ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 05:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNy9JUEk5SM7ujHcWVu+qwus9vysipdIfL068MRHlUw=; b=L0P4ELQmJ9CaScDI8zXex7bZQC
	FXEaVaf48I6KGkpOxvZGGcOHuzO+prkcrG5Hvl1I1fe5DJO68JtlLI9j11U9KVakZjpFRIhmQ6Il2
	uTjtjZlW37PJN0ZA6wxqlXh/lwJML5X2SgvstpQHURvnh4gX89j3NK3GRuF6oir0b2NiQ0BjkH4gw
	Sf0s/X6taNuKXUcu5aSR4UbKR7y7Z0CwJ9pvU++8HiaF5xwzq+n1tKI+Ym1FJzDOvyQRYm9z8Lvwm
	fTl1l9DcafPHqIZtPWQVf1xTD6xBpdsyyauBjIJBqCuTjmj8n9/L/3PVT9iWRJUt5fjWCWHT6Kb9c
	SgmU5S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0D2C-00000006jEW-2VMT;
	Sun, 21 Sep 2025 05:54:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0D2A-00000006jDP-318Z;
	Sun, 21 Sep 2025 05:54:51 +0000
X-UUID: 7877a56e96af11f0a52f393f94899d25-20250920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BNy9JUEk5SM7ujHcWVu+qwus9vysipdIfL068MRHlUw=;
	b=vC6Da8TvSReux9uhI3O4l9xiuqUyx7CWiajFQbYI9moKnVNZQ6JrdplQx71pIZ0PT3eTNdYsrTfS7bkR+eD5LrIHbdBi4vGywWpQNG91SCK+tD03SMdL8LOKtH853go3OUa+50yBvoTakUOMi9x9vSeovcSOYCFvRrfsNNRr9OQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:d9d01078-3351-4c0a-bc54-c53af8a9b5d3,IP:0,UR
	L:0,TC:0,Content:82,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:107
X-CID-META: VersionHash:1ca6b93,CLOUDID:c73785f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:4|15|5
	0,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7877a56e96af11f0a52f393f94899d25-20250920
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1893007226; Sat, 20 Sep 2025 22:54:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 21 Sep 2025 13:54:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Sun, 21 Sep 2025 13:54:39 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Jay
 Liu <jay.liu@mediatek.com>
Subject: [PATCH v1 0/1]  Support color matrix negative input
Date: Sun, 21 Sep 2025 13:53:04 +0800
Message-ID: <20250921055416.25588-1-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_225450_772416_5A37486E 
X-CRM114-Status: UNSURE (   6.29  )
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

Change in v1:
- replace mtk_ctm_s31_32_to_s1_n with drm_color_ctm_s31_32_to_qm_n.

Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jay Liu (1):
  drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n function issue

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 26 +++--------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

-- 
2.46.0


