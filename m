Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F25CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRXxXDGna3lguGI+JgbJykzzQWpxET5KAYeVtEY7WCI=; b=2KZZ2nlhFQLFJm6Zb+uW6sgDQm
	uIG4AghT9dSnYo5dQzaky6qhqDUqDyY+aD0l+2503qdjcj39CZbp5rvUAwS4xgQ2nN//UuRiQgwe1
	ksBKM2DsQouu+jHWcS4au16Zr92sqG1n4gIYwbAgCl5PRaLyuF6LZNgIIcoG2ADkCfhpMcJ9tHemc
	mGb1Kt+/Ub9QTWS59cb+aimJiNmWGLB4orN3wLTqCecvcPHRkaHqpaiuEFrzmIT1jp9Iy4UmYyYMQ
	A5WQFDZ0DnuRjtQF7oeBxQOwgRU+UIjUdpTi6XhUQV26Wosl/p0nJufwVrRI1wRmRahi8Qo09Rwb3
	xqakVc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0S-00000004yAs-1p0B;
	Tue, 02 Dec 2025 07:41:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL0L-00000004y1F-2aK7;
	Tue, 02 Dec 2025 07:41:00 +0000
X-UUID: 3b6a2224cf5211f09f706fa2197c6ceb-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nRXxXDGna3lguGI+JgbJykzzQWpxET5KAYeVtEY7WCI=;
	b=igHM0XIWv8U9dXlDNsLOZV7DksgSUJJo30zK42/k7f5QBm5RmsiCl9rCHSe2flGIMY9Pb1hsbwVc3AjbW3eq5jIS3qLi0Vx+BGKETxw9Ook94q40PoBObRZM3dYkJkxDXGZCtvXYMdGo48PSdjN10j1Uxc2kTcP50tcCgkvyVnk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:bb290824-de6e-4902-a9b9-2ef2599ec2e0,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:15d40e28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3b6a2224cf5211f09f706fa2197c6ceb-20251202
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1466464725; Tue, 02 Dec 2025 00:40:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 2 Dec 2025 15:40:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 2 Dec 2025 15:40:49 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v6 07/10] media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
Date: Tue, 2 Dec 2025 15:40:34 +0800
Message-ID: <20251202074038.3173-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251202074038.3173-1-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234057_707643_CC130201 
X-CRM114-Status: GOOD (  13.12  )
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

The DRAM address of the VP9 decoder tile info buffers may require
as much as 36bits for 4096x2176 resolution. Fold the 4 most significant
bits into the lower (padding) four bits of address.

Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 36a87b455d11..eca6280098be 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1134,9 +1134,17 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 					return -EINVAL;
 			}
 			tiles->size[i][j] = size;
+			/*
+			 * If the system supports 64-bit DMA addresses, the upper 4 bits
+			 * of the address are also encoded into the buffer entry.
+			 * The buffer pointer (tb) is incremented after each entry is written.
+			 */
 			if (tiles->mi_rows[i]) {
 				*tb++ = (size << 3) + ((offset << 3) & 0x7f);
-				*tb++ = pa & ~0xf;
+				*tb = pa & GENMASK(31, 4);
+				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
+					*tb |= (pa >> 32) & GENMASK(3, 0);
+				tb++;
 				*tb++ = (pa << 3) & 0x7f;
 				mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
 				mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
-- 
2.45.2


