Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C34EB596D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W50oqbR0eI6igwOGBiAI8u7uiOJbS1jWeDgipBWJQIA=; b=DVPxTSuTgYixRqhb9ywFBnrGdC
	YBVZFAl5SxKvl4get3MIunRMj8K8y0vgD8+8fl0YqklqoWXzskcet6p+GU/BUkm+X3SnTBlGJrnOP
	EloLxQ1byvtcsIeG33xHKLMk8zSAXuyCL6uih+1T6fjYdNP+Ksr3Oe47R6VaW9XM+a3GKOdU6FDTI
	KZfJg5nZoMHJ0iJjIXhQdpJUPgsXLHPWNjF6LirAc0HrrZEwqcvOGb9BO4U0c6Qyzub5yeQovJJr7
	NU2ZcHuTzqaNDelCiiQBXtMLAHb426APevln8qSovmWYYeeJvKxLmzKokHydfEEsF5X0v354A3fPc
	JzIYYyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zu-00000000F41-2RO6;
	Wed, 11 Feb 2026 05:42:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2zj-00000000Eqq-0mRO;
	Wed, 11 Feb 2026 05:42:36 +0000
X-UUID: 74d04ef2070c11f1ad39f32c34db0b1c-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W50oqbR0eI6igwOGBiAI8u7uiOJbS1jWeDgipBWJQIA=;
	b=X9EHb/ltG7YjyRYDuHF8UoFWKGrVh8WSg1ZJWZCHslXj1Z/JWUCxNkBgA0h3lyFqQ3Tx42qumaf3/ZDyYrDI6iJTZsF6GfAOxMJNABpZ/qYH3SuK3EBDaE6Hif+yYopNlzBYJSHv2mLBmDy19nP7hV9/eR4Bb6yEw2E+FvKI1Jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:821d7d8c-9aae-487e-abfd-19af420cea4b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:33788de9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 74d04ef2070c11f1ad39f32c34db0b1c-20260210
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1539444558; Tue, 10 Feb 2026 22:42:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 13:42:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 13:42:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 08/14] media: mediatek: vcodec: support vcp architecture
Date: Wed, 11 Feb 2026 13:41:35 +0800
Message-ID: <20260211054149.27249-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260211054149.27249-1-yunfei.dong@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_214235_325276_B95B0A11 
X-CRM114-Status: GOOD (  11.92  )
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

Some platforms expose the video codec through the VCP coprocessor.
Use the VCP architecture when the VCP coprocessor is found.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index d9f722698198..3db046a1aeac 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -381,6 +381,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
 					 &rproc_phandle)) {
 		fw_type = SCP;
+	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
+					 &rproc_phandle)) {
+		fw_type = VCP;
 	} else {
 		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
 		return -ENODEV;
-- 
2.45.2


