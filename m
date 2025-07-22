Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8EFC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mv3/47QmIvP+O988l7nlJQz03ztom8RMCbLpNZqHgOE=; b=D55eeq38vhm0mV+WsPisLhhci8
	WMzQfANygfXd5wK4w6c5C9McZWldOrAUEtQd4hfy0mB689MFsb/xmwpWG/AX0h9LRmQoKKym80hk/
	hId0SNHrPxWNVNiv2UANeka4HzTQEocUCsoV1R7Bo4VS5GS3Kmpkd/HIpogKZclSflj/poWr//+09
	RQ0ZRIm1xaRtTxTm9YZuRkcTrqi9A/lhjcoQyQAetbLYcddxzJHmkFx5oATXK0inijeoh6ekzFJqH
	29XJ6s+jpRq64ykEgFwq/o7cTupwHkdfzohXK3rC1k53aaQj17Z2cHWQNW+8cJEEAwuSDgNMDe4A4
	TlS3oHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8v2-00000001wHz-47ID;
	Tue, 22 Jul 2025 09:04:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8om-00000001v57-1OWT;
	Tue, 22 Jul 2025 08:57:49 +0000
X-UUID: ebd4e99666d911f09f706fa2197c6ceb-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mv3/47QmIvP+O988l7nlJQz03ztom8RMCbLpNZqHgOE=;
	b=ZZGs140n+rhhmGs5TWpdM1Hx0S1C7srNSxYXtTNe5BxkJrmT7HGGBXduIVv2moaX1tBaO5phdtUxGpJIYZhhS86uHZQIPuIQrRFrWDPoJGlc36zESI6gSRyLjlpGvQdBkf+aZE9EL2S4w9ADVCHU/+eHse4+4bpWzKF7RZg1Xy4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:34202503-e8ff-40f3-9b2f-fbeb122bdf60,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:a2a3249a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebd4e99666d911f09f706fa2197c6ceb-20250722
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 127271362; Tue, 22 Jul 2025 01:57:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:57:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:57:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Peter Wang
	<peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James E . J
 . Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/4] scsi: ufs: ufs-mediatek: Add UFS host support for MT8195 SoC
Date: Tue, 22 Jul 2025 16:57:17 +0800
Message-ID: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_015748_372521_A5147A47 
X-CRM114-Status: GOOD (  10.83  )
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

Add "mediatek,mt8195-ufshci" to the of_device_id table to enable
support for MediaTek MT8195/MT8395 UFS host controller. This matches the
device node entry in the MT8195/MT8395 device tree and allows proper driver
binding.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

Changes vor f2:
 - No change.

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 182f58d0c9db..e1dbf0231c5e 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -50,6 +50,7 @@ static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 
 static const struct of_device_id ufs_mtk_of_match[] = {
 	{ .compatible = "mediatek,mt8183-ufshci" },
+	{ .compatible = "mediatek,mt8195-ufshci" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
-- 
2.45.2


