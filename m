Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD5EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 03:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KJPkukya59nfR1aGhl7T2oGpeA9UVjg5hfMTy1E8j0=; b=IGeliJJRVFOfZ0S8b0jATPEm/v
	DW+YOmudsmUOV0X9edjH0s5Cnv9ui3g+B3NyuKQzW0GD3kn9w7hrDAq9cGEJudwf9fupAc7Tf04Ts
	D8gFXgrrJxZH3lXmPV0vXFifMmTWfTDhzJflMrsAVBdGZ+koG+b5gFCibUp2sF1gvrn5YFwLijXz8
	gscxgdMUzhTnopOPuRGCGcdXpM8h742is71w1tvEBnmhNzGwDWCuF3ErMUdI/PZEmcVDLA2LtHYGP
	atspXalAS4lImFcrRuJ8RRlb1rybGeOCbKZBM4jddS1XQZC3wsLnBvavAZtCen7YBNv0SMZ9Zgoed
	RgwynDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDOp-0000000Ddy5-0oSh;
	Wed, 11 Dec 2024 03:28:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDJd-0000000Dcd1-19tJ;
	Wed, 11 Dec 2024 03:23:11 +0000
X-UUID: 39f13582b76f11ef9048ed6ed365623b-20241210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0KJPkukya59nfR1aGhl7T2oGpeA9UVjg5hfMTy1E8j0=;
	b=kApDiNmBd/kpFvYlEry3Htj7EsXzUt92K2V4SVCXWUA55Wl4bT22N9270juSlHuZWT+CGKjVSBBGCxk8sYZF1VsZEMANEprAU4FRRn+DS8pnxQVggfhsFZQrK9eUrtIZFbbrpxsmGahE/gYmefLS9KyzDgukFLm9dTvLJbWl4g0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:990b36eb-937e-4e89-856a-cc2b238278d2,IP:0,U
	RL:0,TC:0,Content:36,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:6
X-CID-META: VersionHash:6493067,CLOUDID:3367c53b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 39f13582b76f11ef9048ed6ed365623b-20241210
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 608441325; Tue, 10 Dec 2024 20:23:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:58 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/8] Add GCE support for MT8196
Date: Wed, 11 Dec 2024 11:22:48 +0800
Message-ID: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_192309_330228_EEB3E677 
X-CRM114-Status: GOOD (  14.18  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and properties, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ API to support non-subsys ID
hardware.

---

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH.Lin (8):
  dt-bindings: mailbox: mediatek: Add GCE header file for MT8196
  dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for unsupported subsys ID
    hardware
  soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
    address
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: mediatek: mdp3: Add programming flow for unsupported subsys ID
    hardware

 .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   34 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  107 +-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |   26 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |   41 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   53 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   16 +-
 drivers/soc/mediatek/mtk-mutex.c              |   12 +-
 .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1439 +++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |    3 +
 include/linux/soc/mediatek/mtk-cmdq.h         |    1 +
 11 files changed, 1701 insertions(+), 35 deletions(-)
 create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h

-- 
2.43.0


