Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOLgmMpYR2ryZv6rUHWgYW+TGfr3B2tAoli1w7hdIug=; b=on30Mpm2CQDLDJlWm/jgFSdBnl
	vsmoPe/JO/fm/LS5+KXy5JXncr+cR2TqK1kUYJ2MnvsbcmazUD/kwj2QurKq7tDUFnrSOLgti/SUq
	jODPFsuBzLcEfFYU/KuPtGrKW+8TDUapvL7PjOaZ2AcntM9uka+Prcf5BkA1QuJi6MwiK7CXvwAGn
	lVhjOv0UkCFni4E1eSrIEX0Fd2hrN5fKmlZWof4Z0r0Lx3DQj3pvyWRmjItDwUZFaejMOdbAPIqUx
	MI38avviOaWS9Gv3XGyThyvqgiTxF4tgIVNMzzd/hGQ7mttEVmPVhKEhMqA/Cx7jVpIRuPZ+S2jA4
	XJ2OPrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Nn-00000003QpW-1ah4;
	Mon, 15 Sep 2025 09:20:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Nj-00000003Ql2-1dQX;
	Mon, 15 Sep 2025 09:20:20 +0000
X-UUID: 2ec3e8ea921511f09f706fa2197c6ceb-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GOLgmMpYR2ryZv6rUHWgYW+TGfr3B2tAoli1w7hdIug=;
	b=kuEMWtzIe6gK8Hjh9/3EMx+RU3aq+mmuqACOBoEa+JXbBJ+M00WB1qp3+85rsjf2wJ7TEkgA+7zrh1Af6FKz7vJRfYsAjYD6BDlesw4T7NrBuI80AXnzaVMm40aAgZ0v14sw8u39vgGibg3ErVJIJDqazkMIFA+Wk1KgSf4rWOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:9dc40d1a-0ce4-4cf3-b641-33414ddc600f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:20e1cc84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ec3e8ea921511f09f706fa2197c6ceb-20250915
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1705943626; Mon, 15 Sep 2025 02:20:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 17:20:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 17:20:08 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v3 2/8] media: mediatek: vcodec: add decoder compatible to support MT8189
Date: Mon, 15 Sep 2025 17:19:52 +0800
Message-ID: <20250915091958.31509-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250915091958.31509-1-kyrie.wu@mediatek.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022019_436750_5AE58F94 
X-CRM114-Status: GOOD (  11.68  )
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

MT8189 is pure single core architecture. Support its compatible and
use `mtk_vdec_single_core_pdata` to initialize platform data.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index fabf969bc8a9..e7b6b108f4fb 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -348,6 +348,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 		vdec_dev->chip_name = MTK_VDEC_MT8188;
 	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
 		vdec_dev->chip_name = MTK_VDEC_MT8196;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8189-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8189;
 	else
 		vdec_dev->chip_name = MTK_VDEC_INVAL;
 }
@@ -575,6 +577,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8196-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-vcodec-dec",
+		.data = &mtk_vdec_single_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 6bdde600a167..856d12aa84d8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -25,6 +25,7 @@ enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_MT8183 = 8183,
 	MTK_VDEC_MT8186 = 8186,
 	MTK_VDEC_MT8188 = 8188,
+	MTK_VDEC_MT8189 = 8189,
 	MTK_VDEC_MT8192 = 8192,
 	MTK_VDEC_MT8195 = 8195,
 	MTK_VDEC_MT8196 = 8196,
-- 
2.45.2


