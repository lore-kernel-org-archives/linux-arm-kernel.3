Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3453C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n//DIo26kTWHyp4QnE/oMY3z5Va3Gw4pBY0FjQJiX5A=; b=NcgwwAEdQ4yPNw+8Q20bzamW88
	EQKYhlgwk4ved9vtZdL7aYP+KvX64nEH1mkgP4o+Kfo6klL9mqrHZb+N2HQ7g2wa6U360vL2vpBem
	MRV5esMXpKq7jas3k6R04H2r3QZldLOHmWiF0729IqHDZvW+s0yOsMbSYuDmgQ/U8HXPP0q0Mor+y
	n+a8Hui+1ILayxX1Q9Ut3tJhsVXAEUDnCLZePYICL7ADn6YTLWSK93pAbqpY0JfjIOKdmJyxZOoRc
	H1G90Yj9xcg/CRx6b6VY4ppE5jdoag2ghBXVCQ7AD3rjcihx+RfGF7h5RbwBu9P9nZnhBeaOYVd2+
	Z/1uAIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQS-00000000tZJ-1M7F;
	Thu, 09 Jul 2026 03:27:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfQN-00000000tVH-1Iel;
	Thu, 09 Jul 2026 03:27:44 +0000
X-UUID: 2102e2fe7b4611f1acbe4559397dec65-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=n//DIo26kTWHyp4QnE/oMY3z5Va3Gw4pBY0FjQJiX5A=;
	b=qo12LQG41ikVVI+ki7lY/Uxd5HnFmjxWSPl/897DtlfOvRcuZTCW2nzGCpguP0Ld8dgBYFJwX0ddeO+y3sNazMTqdUD0KrmUEQRn0ouq0gtxihplqA9L8cvGh6+Sln6lcj+nibJ0rkhSEdcIFdjVPB6LuzqtJ411j65BXzxTzEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:9c8e6f15-9b15-4cd8-b2cd-02954957a052,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:170506cf-4db6-49e6-af1b-870aa8b6eff7,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2102e2fe7b4611f1acbe4559397dec65-20260708
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 419006726; Wed, 08 Jul 2026 20:27:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 11:27:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 11:27:32 +0800
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
Subject: [PATCH v9 0/3] Mediatek MT8189 JPEG support
Date: Thu, 9 Jul 2026 11:26:53 +0800
Message-ID: <20260709032657.25730-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_202743_353498_DEED847E 
X-CRM114-Status: GOOD (  13.23  )
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

This series is based on linux-next tag next-20260707.

This series depends on commit 7560349ee0d9 ("media: mediatek: jpeg:
support 34bits"), which introduced the `support_34bit` field in struct
mtk_jpeg_variant. That commit has already been merged via the media
tree and is present in linux-next as of next-20260707.

Changes compared with v8:
- Patches 1/3 & 2/3 (dt-bindings: decoder & encoder):
  - Expand the description of the `mediatek,larb` property to explicitly
    explain its necessity for accurately describing the hardware topology
    (SMI LARB connection for memory bandwidth arbitration), independent
    of the IOMMU driver's implicit handling.

Changes compared with v7:
- Patches 1/3 (dt-bindings: decoder):
  - In the allOf constraints, only keep maxItems: 1 in the then 
    branch and minItems: 2 in the else branch; remove duplicated
    constraints already defined at the top level

Changes compared with v6:
- Patches 1/3 (dt-bindings: decoder):
  update the existing `allOf` condition for mediatek,mt8189-jpgdec to
  make the 'mediatek,larb' property strictly required for MT8189 SoC.
- Patches 2/3 (dt-bindings: encoder):
  Add an `allOf` condition to enforce that the `mediatek,larb` property
  is strictly required when the compatible string contains
  mediatek,mt8189-jpgenc.

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

 .../bindings/media/mediatek-jpeg-decoder.yaml | 49 ++++++++++++++++---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 35 ++++++++++---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++
 3 files changed, 114 insertions(+), 14 deletions(-)

-- 
2.45.2


