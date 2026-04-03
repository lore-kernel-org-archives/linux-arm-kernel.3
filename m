Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5819D730A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVDiR/387rcc5iosgK3Eo/Y5G2Be4ywKMU1i0407va4=; b=eEa4AzTh37pL1bpUP59+Xg4N25
	ig1OMpAu7/qIgbpOQLRul1iBvtlox+5gy724sHE1TxXZhysGmJF0ht504PnSEmGkB5XmlPXPzJoz9
	tkGPXYpUPs5qNvpSI3s12be+4V07D0Gx0Q3+gH0gpVtxgEL7SuS5rM9zVYm9ss0h+4wpTUK3J8zCp
	2/X/MTIhUGyKcRlh37rZAxNXoKA4AgL335NEmWYwJtig5EkxQHy5zV63lVJPRm8lWcNq8LFjHBScL
	YU9QwIM2MMNYoZq+sjMUnEKcg+yYdJlDl+Uw0pBUT1r+20p9F0Xg0hGVwYcdJg7FmrTxn8evDMpld
	IkKvpeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YLn-00000001PDS-32TR;
	Fri, 03 Apr 2026 06:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YLl-00000001PBH-1XBE;
	Fri, 03 Apr 2026 06:49:50 +0000
X-UUID: 4bf533fe2f2911f19e7563141e833ce8-20260402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UVDiR/387rcc5iosgK3Eo/Y5G2Be4ywKMU1i0407va4=;
	b=XAeAKNFwVmjr7qkkuMAo4ETf2pIeNHvpVlDLzlaMkQTSHOXQiwMqif/oQe8vOLIEkjECYPKHBHyosVsM+DHgwwB9u7xisvhDSw4U72KjBeQRxR8eDtYmUsGzMw8DIvlCwesMOC6q44q8XSDtERfi+18vEfInVSuJiebqkFJkEgQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ceebc0e7-8d2e-49d6-bb16-2033dd18ab95,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:63e174d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4bf533fe2f2911f19e7563141e833ce8-20260402
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 699569643; Thu, 02 Apr 2026 23:49:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 3 Apr 2026 14:49:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 3 Apr 2026 14:49:40 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v6 0/3] Mediatek MT8189 JPEG support
Date: Fri, 3 Apr 2026 14:49:09 +0800
Message-ID: <20260403064912.17259-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_234949_425447_68309AA1 
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

This series is based on tag: next-20260327, linux-next/master

Changes compared with v5:
- Patches 1/3 (dt-bindings: decoder):
  - Drop top-level minItems/maxItems for clock-names per Krzysztof's
    review.
  - Refine allOf block to strictly enforce clock constraints.

Changes compared with v4:
- Refines the device tree bindings for JPEG decoder and encoder.
  - Patches 1/3 (dt-bindings: decoder):
    Moved the standalone compatible string mediatek,mt8189-jpgdec
    into the first oneOf entry along with mt2701 and mt8173, as
    suggested by Rob Herring. This correctly groups all independent
    ICs and removes the redundant items wrapper.
  - Patches 2/3 (dt-bindings: encoder):
    Applied the same logic suggested by Rob Herring to the encoder
    binding. Restructured the compatible property to clearly
    distinguish between the standalone IC (mediatek,mt8189-jpgenc)
    and the ICs that must fallback to mediatek,mtk-jpgenc.

Changes compared with v3:
- The v4 is resending the cover-letter, because the v3 cover-letter was
  not sent successfully.

Changes compared with v2:
- Dropped the dts patch (arm64: dts: mt8188: update JPEG encoder/decoder
  compatible) as it belongs to a different tree/series.
- Patches 1/3 (dt-bindings: decoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum`.
  - Added an `allOf` block with conditional checks to enforce the single
    clock ("jpgdec") requirement for MT8189, while preserving the
    two-clock requirement for older SoCs.
  - Updated commit message to reflect the schema structure changes and
    hardware differences.
- Patches 2/3 (dt-bindings: encoder):
  - Changed the MT8189 compatible to be a standalone `const` instead of
    an `enum` inside the `items` list, as it does not fallback to
    "mediatek,mtk-jpgenc" due to 34-bit IOVA requirements.
  - Updated commit message to explain the standalone compatible design.
- Patches 3/3 (media: mediatek: jpeg):
  - Refined commit message for better clarity regarding 34-bit IOVA and
    single clock configuration.

Changes compared with v1:
- Patches 1/4:
  - Updating commit message
- Patches 2/4, 3/4: 
  - Updating commit message
  - Adjusted property descriptions acorrding to hardware requirements
  - Improved formatting for better readability and consistency
- Patches 4/4:
  - Updating commit message

Jianhua Lin (3):
  dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
    string
  media: mediatek: jpeg: add compatible for MT8189 SoC

 .../bindings/media/mediatek-jpeg-decoder.yaml | 46 +++++++++++++++----
 .../bindings/media/mediatek-jpeg-encoder.yaml | 19 +++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++++
 3 files changed, 95 insertions(+), 14 deletions(-)

-- 
2.45.2


