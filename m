Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB4FF99363
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIJPWbFcWZJsAmyzUmsb2iTHyaq1lN5uY0Zsbz2f3T0=; b=1uc31lQ8oKa4bMfEYWIQwHQjrB
	oRM/gXlBfJ0ENbFeJLD+GbZqqnsd69g4XK5K9PfegaSiYHRO23TDRZESufrYHuZx9lahA+GGpEzwr
	SNCOYfIuv/15BPKxB4vFTK0dXG5ctpjVX+2++0WhB766A3tgXiRrbTS79pzSGs7bo570aiRJ1MLg/
	dFDNM3zut4AHbnP59ePkci5SB1kXgX4Q12Kzgo6LLXnuio/tReGe6Y6APnBagE9G69gTqe3amctPw
	GO53v4ZbhlXhl1foj2YlZWd33iPRR41LhPPt5/w4eyY6GeTInOQtW2RWF3PJxVT0us7Y5n4JRcyAN
	AzTYzMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqeZ-0000000BQGp-0UUO;
	Thu, 23 Apr 2026 09:47:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqeP-0000000BQ2b-2Toe;
	Thu, 23 Apr 2026 09:47:15 +0000
X-UUID: 65e921fa3ef911f19e7563141e833ce8-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=vIJPWbFcWZJsAmyzUmsb2iTHyaq1lN5uY0Zsbz2f3T0=;
	b=NbQteqeZVli85UgbfI1S6rCdk4FG+KZaK7NPQ3ks/5U91p75D/KBotBmbOZZCv10c1Pc4zG+4+DUSuDUeFUbRqzLW2AoRJZUrg78g4/lNsjNOV+VK7RO/HqrMVvczH4V7A7SRXicayDRMHs/YNfO0ApK6iiBxKoiA+fVwmj0Gqk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e6a87fe2-0f05-42bd-958b-6ddfc1acfb41,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f795cb8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65e921fa3ef911f19e7563141e833ce8-20260423
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1965163198; Thu, 23 Apr 2026 02:47:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 17:47:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 17:47:07 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v14 08/12] media: mediatek: jpeg: fix remove buffer removal timing for multi-core
Date: Thu, 23 Apr 2026 17:46:52 +0800
Message-ID: <20260423094656.32044-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260423094656.32044-1-kyrie.wu@mediatek.com>
References: <20260423094656.32044-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_024713_657337_1A401C9C 
X-CRM114-Status: UNSURE (   9.59  )
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

Move calls to v4l2_m2m_src/dst_buf_remove() inside of the spinlock
protected scope to ensure all necessary operations are performed
before buffers are removed from their queues and ensure proper
synchronization of buffer handling to avoid buffer lost.

Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7e176a91404c..a5b0f7620121 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1652,9 +1652,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto enc_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
@@ -1672,6 +1669,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 			     &src_buf->vb2_buf);
 	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
@@ -1753,9 +1752,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto dec_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1780,6 +1776,8 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				jpeg_src_buf->bs_size,
 				&bs,
 				&fb);
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
-- 
2.45.2


