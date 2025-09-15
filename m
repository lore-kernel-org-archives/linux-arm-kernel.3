Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D7BCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1le3np0jp2M0puYyEjMNuuOO7xrsTjp7HZKSsbnNKHk=; b=KTKsRbckkx/Xl2Wt5f2yy5b7ht
	1I7c90B7G2hz3RO6ACiPV6x1EEKQkX5CHF6pdUYGpjIQ7S142BNjtvpdJMfkDNsDkYO7ObEFlZC7r
	Vu8Vq2yTsybWPVI8m5+GG4vyXxsI9Zis23WrR0pEpfDIzHT1yu3LCsoKl4M6dDt3N47B+UHg6cQuD
	ZVb/XFfXeoNGWy8KEIrYpDEz6gS5f33sM/oO6+rPOQPOch42GrLWBThYbZWNm+0oee0dQ3Vh0ZKox
	8lLJzhrFfgWJR8/d9L1vwLyH4TZGumqUinzPjpyh1wBDqxE6SLShbhQz315lLS6+ql4bTab4fWI0u
	IdO0b6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Ni-00000003QjO-1a5N;
	Mon, 15 Sep 2025 09:20:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5Nf-00000003QhB-2oIC;
	Mon, 15 Sep 2025 09:20:16 +0000
X-UUID: 2d5cab36921511f09eb0dd999d3936bf-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1le3np0jp2M0puYyEjMNuuOO7xrsTjp7HZKSsbnNKHk=;
	b=IrVxG8fhruEPK1AT5HnCr4srmmx1UkvZpCuc/xgSJ2wntMHdTOJio9+G/jTnzp/2NVI22qXw32aGH3CVFHLigqJjY2hDiYYhf5jaqdaPK2FChUDTMPEsaX0chiaiYDSsRJ94cxFslhxkE0DwTONULJAXJAoaDXDzvXoxtbUkO/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:2d778009-bdc7-4c71-bc2d-517dc3582862,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:ece0cc84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2d5cab36921511f09eb0dd999d3936bf-20250915
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1625276092; Mon, 15 Sep 2025 02:20:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 17:20:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 17:20:05 +0800
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
Subject: [PATCH v3 0/8] Enable video decoder & encoder for MT8189
Date: Mon, 15 Sep 2025 17:19:50 +0800
Message-ID: <20250915091958.31509-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_022015_711224_09C8DFDA 
X-CRM114-Status: UNSURE (   9.57  )
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

This series have the follow changing:
Firstly add mt8189 video decoder compatible, profile and level to support
MT8189 kernel driver.
Secondly fix some bugs, including vp 4K profile2 and media device node
number bug.
Lastly, add mt8189 video encoder compatible.

This series has been tested with MT8189 tast test.
Encoding and decoding worked for this chip.

Patches 1-2 Add decoder compatible.
Patches 3 Add profile and level supporting.
Patches 4 Add core-only VP9 decoding supporting.
Patches 5-6 fix some bugs.
Patches 7-8 Adds encoder compatible.

---
H264 test results:
./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
     JVT-AVC_V1       94/135

v4l2-compliance test results:
Compliance test for mtk-vcodec-enc device /dev/video2:
Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0
Compliance test for mtk-vcodec-dec device /dev/video3:
Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0

scp upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/

Changes compared with v1:
--add H264 fluster test results
--reorder compatible string for dt-bindings

Changes compared with v1:
--add v4l2-compliance test results
--add scp upstream link
--add HW difference discriptions for dt-bindings commit messages

This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/cover/20250510075357.11761-1-yunfei.dong@mediatek.com/
[2]
https://patchwork.linuxtv.org/project/linux-media/cover/20250528063633.14054-1-irui.wang@mediatek.com/

Kyrie Wu (8):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: add profile and level supporting for MT8189
  media: mediatek: vcodec: Add core-only VP9 decoding support for MT8189
  media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |  2 ++
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  9 +++++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  4 +++
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 32 ++++++++++++-------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       | 14 ++++++++
 7 files changed, 50 insertions(+), 13 deletions(-)

-- 
2.45.2


