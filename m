Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB106109317A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBlD+LTLjMbbuxhHQKf8hno1vgaxv2RIawlYnknAmJ0=; b=p+DdZQFfS15IydPeVJu/6h0XOs
	NH+vCp8qWbWLW6SBZZvCMafyN1WOC23LjsBILPGFWnL9Lz9hrLKYKsfNW16h/EZ2J9QavUoBrYMts
	pczBCF0xWoPcmRGK6NRbsY8AwV7FFMLWj8FGwAORCKH27wCkTv1NfuH+viGMt2F1O/3OZE2m1wkl/
	c4jmrPHbTcjEiFCe0I51qwgwkZsHJK541wf+2GFW3q8S8qk0+/wzyTbQuRS23KZtgYvxTIHmtjZbT
	rmG5dskRcyIJDc+47sTI2++6KhHMCgHA+sLKiXG23YzVzY/IrEXYWcYYcbfFBGTu9BW6E6hnsdtsA
	R74VcsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stt-0000000C7mz-2VKS;
	Fri, 20 Mar 2026 06:00:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stl-0000000C7gZ-3JE6;
	Fri, 20 Mar 2026 05:59:55 +0000
X-UUID: ffc25974242111f19e7563141e833ce8-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yBlD+LTLjMbbuxhHQKf8hno1vgaxv2RIawlYnknAmJ0=;
	b=sRdVv8lUGALmXR9Ma0TNyisfHh4Mf2boPpCqGByU60OjIEm/TGUTd/BZSOpMEBe/vW0t5RnCR9WzIJWuMmYw/hIYioH7kGVMIuQyAxRfkbBp5kINjloVJi5AFVUoJx7a6K1Q+jfnefCe31jeH73zmqELMXvil1Fd5a2lgZKpnUg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d474144f-0af4-4664-8337-7844dbebeb55,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0005eb16-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ffc25974242111f19e7563141e833ce8-20260319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2074433734; Thu, 19 Mar 2026 22:59:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 13:59:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 13:59:43 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v8 0/9] Enable video decoder & encoder for MT8189
Date: Fri, 20 Mar 2026 13:59:31 +0800
Message-ID: <20260320055940.15961-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_225953_854782_38169BC7 
X-CRM114-Status: GOOD (  10.57  )
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

Patches 1 Add decoder compatible.
Patches 1 fix decoder chip model.
Patches 3-4 Add profile, level and probability size supporting.
Patches 6 add decoder platform data to support MT8189.
Patches 5 & 7 fix some bugs.
Patches 8-9 Adds encoder compatible.

---
H264 test results:
./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j2 -t 90
    JVT-AVC_V1	Ran 96/135 tests successfully

VP9 test results:
./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j2 -t 90
	VP9-TEST-VECTORS	Ran 276/305 tests successfully

v4l2-compliance test results:
Compliance test for mtk-vcodec-enc device /dev/video2:
Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1, Warnings: 0
Compliance test for mtk-vcodec-dec device /dev/video3:
Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0

scp upstream link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.32680-1-huayu.zong@mediatek.com/
dtsi upstream link:
https://lore.kernel.org/linux-mediatek/20251030134541.784011-12-jh.hsu@mediatek.com/T/#m847e35de0a5b18fac0ca0624a8559d84964ad5c7

Changes compared with v7:
--relocate the patches set
--refactor decoder platform data patch
--fix commit message errors

Changes compared with v6:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes compared with v5:
--refactor the patches of set compatible data, profile and level
--add reviewer to commit messages
--fix commit message errors

Changes compared with v4:
--update H264 & vp9 fluster test results
--update vp9 single core decoder prob size setting and commit messages

Changes compared with v3:
--add reviewer to commit messages
--Rebased on top of the latest media tree

Changes compared with v2:
--add H264 fluster test results
--reorder compatible string for dt-bindings

Changes compared with v1:
--add v4l2-compliance test results
--add scp upstream link
--add HW difference discriptions for dt-bindings commit messages

This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/patch/20260211054149.27249-2-yunfei.dong@mediatek.com/
[2]
https://patchwork.linuxtv.org/project/linux-media/patch/20260302035244.8994-2-irui.wang@mediatek.com/

Kyrie Wu (9):
  dt-bindings: media: mediatek: decoder: Add MT8189
    mediatek,vcodec-decoder
  media: mediatek: decoder: Add a new platform data member
  media: mediatek: vcodec: Refactor Decoder profile & level Handling
  media: mediatek: vcodec: Add VP9 Probability Size Configuration
  media: mediatek: vcodec: Fix vp9 4096x2176 fail for profile2
  media: mediatek: vcodec: add decoder compatible to support MT8189
  media: mediatek: vcodec: Fix media device node number
  dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
  media: mediatek: encoder: Add MT8189 encoder compatible data

 .../media/mediatek,vcodec-encoder.yaml        |   2 +
 .../media/mediatek,vcodec-subdev-decoder.yaml |   5 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   6 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  46 ++--
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  35 ++-
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  14 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 239 ++++++++++++------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  14 +-
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  14 +
 11 files changed, 253 insertions(+), 126 deletions(-)

-- 
2.45.2


