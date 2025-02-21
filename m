Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B082C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NPujDCOA2i+sZ1Eo+mp2xCE16CGmm1ZdIPKOowNMtk=; b=wZfIEZls4KZF2nFB4mjhR2U+3w
	h+9vO5OJ9tTbJjeNsww8mUaHrBsMCcayhOIpeVJm92L69CC6jEIzxpLm7Ij11uHajWKPbdSO1yIfD
	3CcEGyGN/Z1+Er1ALcYQhACLgTIrjYU5EQw1rUPNTc7Yy2DkgVEjACxPGCeO8bbaIYBVpSlJdoFQF
	am0VP6MWBE1qAtGMtltEpoVRfrIy6FoAchWVVSG+xxGeBw2z/01SZd904IheHSAlB0xetZJkwyFg5
	RTPaWxw6tjCtN3NG0OoaXA6jW+ubLWqgoqOoyt45Pub4ze4e4pjl6nbDWnzDL4wC/Ek+J5EiRn3su
	XGzw5sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNtF-00000004bAh-2C8I;
	Fri, 21 Feb 2025 07:56:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNoR-00000004a6M-3BVX;
	Fri, 21 Feb 2025 07:51:09 +0000
X-UUID: 99b89e1ef02811ef83f2a1c9db70dae0-20250221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8NPujDCOA2i+sZ1Eo+mp2xCE16CGmm1ZdIPKOowNMtk=;
	b=dTd9H/muFL+Wagj+GFDqM3ZXmia2b/QpBKPhDXD+XkDEgaJoTti9EvEPBryJsFf3pJQiRKB5PoYP4xdLeW8HbOWOosjwUJF3IUjukRjqKMKCAEe1KcxwnjvO5AY7AlrrIUnHb0M7LbFr7sawRhaexhL2aHn4DR4KWrU4F/15XmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:6717c696-13bf-44af-a803-0c6790738b89,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:9a0b63a4-5c06-4e72-8298-91cabc9efadf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 99b89e1ef02811ef83f2a1c9db70dae0-20250221
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 696249027; Fri, 21 Feb 2025 00:51:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 21 Feb 2025 15:51:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 21 Feb 2025 15:51:00 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/2] Add SMI LARBs reset for MediaTek MT8188 SoC
Date: Fri, 21 Feb 2025 15:50:52 +0800
Message-ID: <20250221075058.14180-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_235107_804073_29B459C2 
X-CRM114-Status: UNSURE (   9.55  )
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

Based on tag: next-20250220, linux-next/master

On the MediaTek MT8188 SoC platform, we encountered power-off failures
and SMI bus hang issues during camera stress tests. The issue arises
because bus glitches are sometimes produced when MTCMOS powers on or
off. While this is fairly normal, the software must handle these
glitches to avoid mistaking them for transaction signals. What's
more, this issue emerged only after the initial upstreaming of this
binding.

The software solutions can be summarized as follows:

1. Use CLAMP to disable the SMI sub-common port after turning off the
   LARB CG and before turning off the LARB MTCMOS.
2. Use CLAMP to disable/enable the SMI sub-common port.
3. Implement an AXI reset for SMI LARBs.

This patch primarily provides the implementation of an AXI reset.

Changes v4:
- Modify the commit message

v3:
https://lore.kernel.org/lkml/20250121065045.13514-2
-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20250121065045.13514-3
-friday.yang@mediatek.com/

Friday Yang (2):
  dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
  clk: mediatek: Add SMI LARBs reset for MT8188

 .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-cam.c         | 17 +++++++++++++++
 drivers/clk/mediatek/clk-mt8188-img.c         | 18 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-ipe.c         | 14 +++++++++++++
 4 files changed, 70 insertions(+)

--
2.46.0


