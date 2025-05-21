Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD82C54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MafHlrK67o/d3FGCy1u+Y7qasnBcS5mIW6WlhV/wvWA=; b=JtVBlTLiIoFBpXqMZfZfaAvrA2
	L1uMUDXCDpUWPNIlOmLGfiXWv3gyS1CguJ1NoBGd1CkyznVJSF03gEKSB546sgGHrLBFIlzINcwcA
	DEaQRhXSWaNyEbOE9WxbLJ/UD4jTaecQ56mpRNby04WYCkgpuJNnEH3HTdd36C9UEi7Jf8C0hjKWT
	XXD57CafG44MUueb8ZuBHgIF/YNnBnrrVHfEUpkT1VrF7nuw4b5hNN1wOlu7cg+C29wSjic/ZVn+m
	ECHNcBknZl36T6UN3ChpsiaPwBqKL0C8kbaUvxkECtCXaU0iAx7O2JUimCLhHEghSyoTFHWJidiVt
	lZyjLoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZLT-0000000EbZl-0mMF;
	Wed, 21 May 2025 02:38:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZ7I-0000000EZya-0X2E;
	Wed, 21 May 2025 02:23:37 +0000
X-UUID: 97e1950235ea11f08d385d50fb11b32d-20250520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=MafHlrK67o/d3FGCy1u+Y7qasnBcS5mIW6WlhV/wvWA=;
	b=kUk9Wa5l26iTVZ6RIBVx6T8BDLK+IM+soOE/A8FL0wNl3jKlGHdqbunb5eIaYFW2rFZz9ifadvxhVz57iu+MtOFpOz2fZsxb0Rtsty0PLNNHB8/SNex18PwYOig3PIvNazOHh1sc7nFzNZwu5LwQVZNuIAIt0vwO7/1wGWcr9nc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:393dea21-5cbb-432b-bbee-00dc79d000da,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b810187e-6a4e-4d30-99aa-46e5d32b8a87,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 97e1950235ea11f08d385d50fb11b32d-20250520
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1187093325; Tue, 20 May 2025 19:23:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 21 May 2025 10:23:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 21 May 2025 10:23:29 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 06/12] media: mediatek: jpeg: refactor jpeg buffer payload setting
Date: Wed, 21 May 2025 10:23:16 +0800
Message-ID: <20250521022322.27576-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250521022322.27576-1-kyrie.wu@mediatek.com>
References: <20250521022322.27576-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_192336_170493_6DC2F3B9 
X-CRM114-Status: GOOD (  13.40  )
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

1. for multi-core jpegdec:
   core0: |<-------- decoding buffer0 and resolution changed to smaller
   core1:  |<-------- decoding buffer1
   core0:   |<- handling resolution changing
   core0:    |<- vb2_set_plane_payload
2. the payload size is changed on the step of set format. Because core1
is running and streaming has not been stopped, the format cannot be
set again, resulting in no change in the payload size.
3. at this time, the payload size is bigger than buffer length,
it will print a warnning call trace
4. set payload size must less than buffer length

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c     | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0074d1edb534..52d59bb5c9ad 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -720,10 +720,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
 		if (ctx->enable_exif &&
 		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
+			if (vb->planes[i].length > (plane_fmt.sizeimage +
+			    MTK_JPEG_MAX_EXIF_SIZE))
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage +
+						      MTK_JPEG_MAX_EXIF_SIZE);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
+
 		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			if (vb->planes[i].length > plane_fmt.sizeimage)
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
 	}
 
 	return 0;
-- 
2.46.0


