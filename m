Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABDD75BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJCFc1OQsen4rsXnmsJum2puZtEe0fBX/9xhASMal3M=; b=XQ8gtQjfi7/UMebNNY0hwIVzmj
	PVhMHAn+aCwQpMjuQvaesMmYutnvOBNt1RrfodN1KEVdWalH2cAGtE/gH6PI1P9JINHEL4Dmoa9Mi
	k3ipv9F52DRIlKmTvDt3eS7QtDUM1jIsUfR+dmGVmmPJZ8Xy2lIj1homTIPzCcvuR3OuPrt9d3f4o
	kNkMEX1H7XOvcSOFCNpVsWkjDi30A+oiNGGmQhebQkSSdujTY/TB5pb36y8AecOlcC9LkE6Q3tb24
	uC7qOQlGI+aBkmlp8bBnzY6SASKKacqlgV/BdGKsUgZxXDYhrCQLynf1fngvxU9Whxwb+NgybCmPA
	z0CMcSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyrD-0000000GnQG-1j6M;
	Thu, 21 Nov 2024 04:31:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDylh-0000000Gm4o-0NPh;
	Thu, 21 Nov 2024 04:26:14 +0000
X-UUID: bb1da60ea7c011ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pJCFc1OQsen4rsXnmsJum2puZtEe0fBX/9xhASMal3M=;
	b=p/Qgp7uAl+6AnJ37E2di2Kj9WIgli9KIxUwQg8skZKDjWSncc79Qq048HXMAqNzcYu5MOqTnKOuwyPz4b/Y8CeA5WaeVdTLGslYKMpeYjC4MpQbmW25ymYcDuUj8+mJAFzh9qVgbDBWQY1shknaNI0SDklHm15AO7m9w72m0p54=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:763c6a27-4637-4d35-9a71-72dfa3717889,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:c035d6fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bb1da60ea7c011ef9048ed6ed365623b-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1380334675; Wed, 20 Nov 2024 21:26:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Moudy
 Ho" <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 6/8] soc: mediatek: Add pa_base due to CMDQ API change
Date: Thu, 21 Nov 2024 12:26:00 +0800
Message-ID: <20241121042602.32730-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.420500-8.000000
X-TMASE-MatchedRID: a5Zc1W+6pasb+BGg6rnrdlPjo7D4SFg4IaLR+2xKRDI1LB46LFAAklO4
	BD7nLMxnThbvLLI8RvNxTDN5srStblaPccVLXikr3fn7n/ZHGqY7r2Gtb9iBYVXdM0K2S6BLo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtriF8GJbJ7jv0js1w2OBfhLxKAgnaA3iZzTfVF1lm48rTfa
	w/tOCbS5e4OF8mjA0lChPZULW94+/Ur16VAwTuWzCcCv3MmaOcwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.420500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 30F0D8B66EC909941A41B3B45EF3B0870FA9D95285365047AEC6AF992A86191E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202613_131628_D9334B0C 
X-CRM114-Status: GOOD (  13.65  )
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

To support non-subsys ID hardware on new SoCs, the CMDQ API has been
changed to include the pa_base parameter. This change accommodates
the new interface requirements.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 drivers/soc/mediatek/mtk-mutex.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..e485d76ec283 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -168,6 +168,7 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
 		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+					  mmsys->cmdq_base.pa_base,
 					  mmsys->cmdq_base.offset + offset, val,
 					  mask);
 		if (ret)
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5250c1d702eb..ad7bd27a6007 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -971,7 +971,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
+	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, mtx->cmdq_reg.pa_base,
 		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
 	return 0;
 }
-- 
2.43.0


