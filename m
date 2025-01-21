Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5DBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nv0nlySpmHEDQFS9UhiHgOMyua1HM2zv947aKDDgC2E=; b=j91imACIrtXlSV23hYsjNO0jNf
	oIPfJSEjQy2zT6UeXUIERnlwwk+AOVpLYL3yyfX4lBksWG93wHIoS+a1IMqBQY63BNROnYgO0iNMj
	uJ++wyeG+fFLXONS2fPl7YLSV+l+JW9LmSJQ9RoIaRb/dR/mVrBE6VNSqcHGiyGI7uowoSquboh1G
	9siadgSWVRz40lPccAvHEY2nRoBrG0GGBZ68UcdIJU+sPxnf0BB2c4mCNH8eH+9uwuwMDyfTRwdRx
	qcbHXOTBXj0UhtKZhpxQPhPvqfQM4AXjUYs3bAxCwb+oNAayBg6W586p6fG5ySTRm/sn6cMbAOJh0
	OElIffzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta86K-000000071v5-26Yr;
	Tue, 21 Jan 2025 06:51:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta853-000000071kW-1Jm3;
	Tue, 21 Jan 2025 06:49:46 +0000
X-UUID: e30b5318d7c311ef82ff63e91e7eb18c-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Nv0nlySpmHEDQFS9UhiHgOMyua1HM2zv947aKDDgC2E=;
	b=BbZCrBMvcxCS8ptn2Rz5usqBeTVeAZteKTgeh1zIZ37weKr1d03Ys0twrCsxembRJCWyAMW9GWFW3axvfJ0Wr6Qt1cvetQs8SyHWiszcAfELa+46JjhHDRcfzfojs8N7sUmFWD3s5+faF4uOub40LFh21YwULh2du3JtfYqJjW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:54cf98eb-c78f-40cd-b4ff-01fcf1a28205,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:26895d85-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e30b5318d7c311ef82ff63e91e7eb18c-20250120
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525744686; Mon, 20 Jan 2025 23:49:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:49:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:49:36 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Friday Yang
	<friday.yang@mediatek.com>
Subject: [PATCH v3 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Date: Tue, 21 Jan 2025 14:49:25 +0800
Message-ID: <20250121064934.13482-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_224945_360022_B949165D 
X-CRM114-Status: GOOD (  11.87  )
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

Based on tag: next-20250120, linux-next/master

When we enable/disable power domain, the SMI LARBs linked to this power
domain could be affected by the bus glitch. To avoid this issue, SMI
need to apply clamp and reset opereations.

This patch mainly add these functions:
1) Register genpd callback for SMI LARBs and handle this power domain
   status change in SMI driver.
2) Add bindings to support SMI Sub Common for MT8188.
3) Add bindings to support SMI larbs reset opearation.

Changes v3:
- Remove redundant descriptions for 'resets' and 'reset-names'
- Modify the requirements for 'resets' and 'reset-names'
- Rename 'mtk_smi_larb_parse_clamp' to 'mtk_smi_larb_parse_clamp_optional'
- Rename 'mtk_smi_larb_parse_reset' to 'mtk_smi_larb_parse_reset_optional'
- Merge 'mtk_smi_larb_clamp_protect_enable' and
  'mtk_smi_larb_clamp_protect_disble' into one function
- Modify the definition for mtk_smi_larb_clamp_port_mt8188,
  use 'larbid' as the index of the array
- Use 'syscon_regmap_lookup_by_phandle' instead of 'device_node_to_regmap'
- Do Not parse 'resets', just check the return value of
  'devm_reset_control_get'
- Add 'has_gals' flag for 'mtk_smi_sub_common_mt8188'

v2:
https://lore.kernel.org/lkml/20241120063701.8194-2-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20241120063701.8194-3-friday.yang@mediatek.com/

friday.yang (2):
  dt-bindings: memory: mediatek: Add support for SMI reset and clamp
  memory: mtk-smi: mt8188: Add support for SMI reset and clamp

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  20 +++
 drivers/memory/mtk-smi.c                      | 141 +++++++++++++++++-
 3 files changed, 159 insertions(+), 4 deletions(-)

--
2.46.0


