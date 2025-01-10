Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF7E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sseLgs/xJD94Hg/H9Jxps3q0CuzUq1+1CJxXy1FvDt0=; b=tG6AAEzcrgGBAJZvGiGKseFVRx
	ttF9uVXAGZYrLcNSHfI7Z/7bgOfoVbyb824j2UmDv839vsbdKCDImJ5bkZaiopPAHVx/AqJTzFG+K
	Dr610ICgsixbCycoEqrOzCz43MqFhgKj/jQSRSfZYljiDjBmlE7X7piiY9+lpPmAame0+nMImqvui
	NescapyjrMvTvPZ84wiz6UmQLR3GwdCyRpMZNDFux6AjJoY/9SmRaH7Vke5BiLAjphPAEhhS60UTQ
	WPO80sQbs4T62YIRxkVWhLOksuabT9CpEXcnaI5D/HKGQb4vd26E0F4feMd4SkvZi/TztEvxas1VH
	EtYIKSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3xC-0000000Dlzs-3NdC;
	Fri, 10 Jan 2025 01:36:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3oi-0000000DkIQ-3idQ;
	Fri, 10 Jan 2025 01:28:07 +0000
X-UUID: 213fa98ecef211ef9048ed6ed365623b-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sseLgs/xJD94Hg/H9Jxps3q0CuzUq1+1CJxXy1FvDt0=;
	b=IIlSae2SVRnSP2zrnfj/DER08J93HqMn5KxkCN7qpf2P1T7OpPEJopsmarFT0NaF+WddSivJ1pRQIAlb3BjPXyEo2pypnwRUayjiyRA3PsPA/VroH+WGH58uGA5PAWD6AjYyqxUIc2Vj4a6neaFwsIYlG3oVys6gOkuQdOmwq0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0c9aaa29-fca8-4730-9fda-88140f43ab45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:dbd3a80e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 213fa98ecef211ef9048ed6ed365623b-20250109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1710913933; Thu, 09 Jan 2025 18:28:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 09:27:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 09:27:57 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	kyrie.wu <kyrie.wu@mediatek.com>
Subject: [RESEND,V1,06/12] media: mediatek: jpeg: refactor jpeg buffer payload setting
Date: Fri, 10 Jan 2025 09:27:43 +0800
Message-ID: <20250110012749.30072-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250110012749.30072-1-kyrie.wu@mediatek.com>
References: <20250110012749.30072-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_172804_961528_FB4646C3 
X-CRM114-Status: GOOD (  12.67  )
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

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 4dc6f82d74fa..83f9451fd3ba 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -719,10 +719,18 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
 		if (ctx->enable_exif &&
 		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
+			if (vb->planes[i].length > (plane_fmt.sizeimage +
+			    MTK_JPEG_MAX_EXIF_SIZE))
+				vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
+						      MTK_JPEG_MAX_EXIF_SIZE);
+			else
+				vb2_set_plane_payload(vb, i, vb->planes[i].length);
+
 		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			if (vb->planes[i].length > plane_fmt.sizeimage)
+				vb2_set_plane_payload(vb, i, plane_fmt.sizeimage);
+			else
+				vb2_set_plane_payload(vb, i, vb->planes[i].length);
 	}
 
 	return 0;
-- 
2.46.0


