Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE46C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RuyjJTkS/rjYI9TGsC4pvcmFFvays7Lr8kUHUlZ7ORA=; b=MOj3QVABqJx+PhADYmBZ7HLQYT
	SHEWzN8puZ20otZmMr794hSBCAcXU/NvM8dxZJVnxsPXADy2+gvCHOzVK1P3B+QZHCxsfIP7I68V9
	DuAyU3tNlE/tSOvWCdmu8CLZwAIyEa/Tki0MLw3/9O3TtnknikrvTP/rCnUhO30uiXLMr8wJ8sfnI
	YPmCw1AFjffoWEL+uWXHsUKSKFrnsv7/xtaGnRGeUmecjsVcWk+R+xK0BFpVvWwgq76/wlgZ0cKio
	f9/WMqM8S6MzFKlTzlbZgPhIUvYriq7c+ikrFIJAy6N+7mkKTM1jsQou0lKd7agqhsQKFc1BR074a
	CkcsaMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxPV-000000008rJ-1MoM;
	Thu, 07 Aug 2025 09:59:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujxMw-0000000088I-42YS;
	Thu, 07 Aug 2025 09:57:08 +0000
X-UUID: dd0f3a40737411f09eb0dd999d3936bf-20250807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RuyjJTkS/rjYI9TGsC4pvcmFFvays7Lr8kUHUlZ7ORA=;
	b=CSsq/AFKqGkven0I+W5xcM89EeRv0Szc+PgqWFI42PaPoiE9LYJh7pILjsXk/UhLUY17ivAg2w78F/VlBTBozXihEr/E3CNXDvdaLCjBL+X2g6sfZNyvnbMmF0N0wLr9MgqcaPQfoq7stEnYITBvUAJtBAXtw53IDSARZRU/qp4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:3c8493e7-038d-4a52-b155-efbb8b0cc576,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:b3942a51-d89a-4c27-9e37-f7ccfcbebd5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd0f3a40737411f09eb0dd999d3936bf-20250807
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1285590075; Thu, 07 Aug 2025 02:57:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 7 Aug 2025 17:56:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 7 Aug 2025 17:56:56 +0800
From: zhengnan chen <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhengnan.chen@mediatek.com>
Subject: [PATCH 0/3] MT8189 IOMMU SUPPORT
Date: Thu, 7 Aug 2025 17:55:52 +0800
Message-ID: <20250807095609.11785-1-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_025707_011941_1752A757 
X-CRM114-Status: GOOD (  10.39  )
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

Based on tag: next-20250806, linux-next/master

This patchset adds MT8189 iommu support.

MT8189 have 3 IOMMU HWs. 1 IOMMU HW is for multimedia,
1 IOMMU HW is for apu(AI processer unit),
and 2 IOMMU HW is for infra-master, like PCIe/USB.

About the INFRA IOMMU, it don't have larbs, the master connects the
iommu directly. It use a independent pgtable, and these two
INFRA IOMMU HW share a pgtable.

In mt8189, the display connect with larb1 and larb2 at the same time.
Thus, we should add link between disp-dev with these two larbs.

The software solutions can be summarized as follows:
1. Add iommu support for mt8189
2. Add a flag DL_WITH_MULTI_LARB to support the HW which connect with
   multiple larbs.


zhengnan.chen (3):
  dt-bindings: mediatek: mt8189: Add bindings for MM & APU & INFRA IOMMU
  iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
  iommu/mediatek: Add support for mt8189

 .../bindings/iommu/mediatek,iommu.yaml        |   7 +
 drivers/iommu/mtk_iommu.c                     | 132 +++++++-
 .../memory/mediatek,mt8189-memory-port.h      | 283 ++++++++++++++++++
 3 files changed, 409 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt8189-memory-port.h

-- 
2.46.0


