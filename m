Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB5CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9dbBtldMrix2vmwLqkoYfOaGzIlugE4vywk09nOwwE=; b=Lwr9xOi/VGgwXzHFxeFZ1FMkjp
	1Y763ksJPv3nLSQp9ZiMIY386ej9967T9C7800fCFS7IPZD6aO8yGluSvXdw+QCD3EqZ7lNbCU6MY
	tbYHyHUbh5dqp0c9qOBzloJh8n0PUm0CRjzY/nzbDtkDoKWkVHqmIuAPoYuNM4sbDXQ/vYG6C9B+2
	maW0A1/52KslsoPHKUgRv7xH6tvrFW5DRSyupwfQyOLj+SreTvqOOrTqdGQXzXZUW7/HQY4nfNgAd
	BEeyA1yh//dR6IqKnl2QpeJQBSxF+AeVhZ5y0pMusxNG2AVwHXDcl5cfuIA1rFzvOwJ6TL8L2gUXt
	Yi0qwXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBOr-0000000HDiI-2Qnv;
	Tue, 18 Nov 2025 02:24:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBOl-0000000HDeU-3tWm;
	Tue, 18 Nov 2025 02:24:53 +0000
X-UUID: bf2816dac42511f0a52f393f94899d25-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h9dbBtldMrix2vmwLqkoYfOaGzIlugE4vywk09nOwwE=;
	b=FOpXtLMam94oszILgbhkxm3zWDEO0JMe/Cdhlq/DGwbl03nKpD8sBIhDUKvWMWQYNCWNbpmeqaeLpXbY9AFkY5Z5ZObR0HRGRveWUEWWKQP3o02pMsfgtrVljdTyuTUJudW5u0qu12BzjKfMQCiGqvLlVuxP8rjGfik/Yl9slZw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a456122f-f117-426f-a7a9-5b695c1b8397,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f14d8c92-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf2816dac42511f0a52f393f94899d25-20251117
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 236216807; Mon, 17 Nov 2025 19:24:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 18 Nov 2025 10:24:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 18 Nov 2025 10:24:41 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH 1/1] drm/mediatek: Add check framebuffer width and height size before config ovl
Date: Tue, 18 Nov 2025 10:22:49 +0800
Message-ID: <20251118022437.1284-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251118022437.1284-1-xiandong.wang@mediatek.com>
References: <20251118022437.1284-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_182451_970986_ECC27D9D 
X-CRM114-Status: GOOD (  14.97  )
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

During the execution of the IGT test kms_cursor_edge_walk,
the screen experiences glitches and the hardware hangs.
It was discovered that the framebuffer dimensions (width and height)
provided by IGT to the display driver are zero, leading to
abnormal parameters that cause the hardware to freeze.
Therefore, it is necessary to verify the buffer dimensions
before successfully passing the IGT test.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f1fa1f1c3ff0..bb207aee91f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -611,7 +611,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 
-	if (!pending->enable) {
+	if (!pending->enable || !pending->height || !pending->width) {
 		mtk_ovl_layer_off(dev, idx, cmdq_pkt);
 		return;
 	}
-- 
2.46.0


