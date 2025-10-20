Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668E4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFMWr2Qbe+Xb/UIm3owsP/tjkP9llxwZ0iyfLuKotAo=; b=xR0roYiB9ZngcunPiIJYvBsBWc
	0nnrnv2x65QGn47vWZjxfT4N+9bR9rYpCTqZtlb2+eRxxghWUMjycXo2wBcVMGLGHsr7VlMWzR62y
	BqxGwnNTvLkm517Xy7QiR/3Ai0EzW6b6HAZ8xBXdE17frIJgTTnEBYyzgEIl5wh9NLI+yqvAaild3
	6ehd0Tzn++g6JmpXvuS62FxTHB50H42OJL+OWf4LEJ3ohGa9tDpu0SJ0soe79Js5cMFswA0lakmqU
	EJ/tV3f4CG4UjhZciC/L8F9+EZ3LPneHWcbr5k/H5CHYm0R8GLuVlzPHMq+XTntIMGXT22SdayERg
	2EGjm2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkXE-0000000CE00-0wRK;
	Mon, 20 Oct 2025 07:42:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkX8-0000000CDwi-452B;
	Mon, 20 Oct 2025 07:42:25 +0000
X-UUID: 4e093028ad8811f09f706fa2197c6ceb-20251020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OFMWr2Qbe+Xb/UIm3owsP/tjkP9llxwZ0iyfLuKotAo=;
	b=obIh9uKRVGZ+CF6N+qPmD3hjIsMvsR2C9rU0EgE1XgrOU9W7ug4042bRGXff8Mg2zDF5fkKfNoEDsc4e9sDJPzNbA2HZi3ygt1pRQVafoxRmy3CCwVJCvEDStepu54aoK7FGPLv+nIUjf363PLc629SHRRHp+hetHlJ5dvH4orU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1d5b0963-cb0f-452e-9e6b-3f6d16245dd1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:039c3e51-c509-4cf3-8dc0-fcdaad49a6d3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e093028ad8811f09f706fa2197c6ceb-20251020
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1172872425; Mon, 20 Oct 2025 00:42:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 20 Oct 2025 15:42:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 20 Oct 2025 15:42:10 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v1 00/13] Add MediaTek SoC DRM support for MT8189
Date: Mon, 20 Oct 2025 15:40:13 +0800
Message-ID: <20251020074211.8942-1-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_004223_019608_805FDCBA 
X-CRM114-Status: UNSURE (   9.44  )
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

base on mt8196 disp driver V4 https://patchwork.kernel.org/project/linux-mediatek/list/?series=996375

Xiandong Wang (13):
  dt-bindings: soc: mediatek: add aal yaml for MT8189
  dt-bindings: soc: mediatek: add ccorr yaml for MT8189
  dt-bindings: soc: mediatek: add color yaml for MT8189
  dt-bindings: soc: mediatek: add dither yaml for MT8189
  dt-bindings: soc: mediatek: add gamma yaml for MT8189
  dt-bindings: arm: mediatek: mmsys: add compatible for MT8189
  dt-bindings: soc: mediatek: add ovl yaml for MT8189
  dt-bindings: soc: mediatek: add rdma yaml for MT8189
  dt-bindings: soc: mediatek: add mutex yaml for MT8189
  dt-bindings: soc: mediatek: add dsi yaml for MT8189
  soc: mediatek: add mmsys support for MT8189
  drm/mediatek: Add support for mt8189 mmsys driver probe
  soc: mediatek: mutex: add mutex support for MT8189

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,dsi.yaml        |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   2 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  40 +++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h       |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  39 +++
 drivers/soc/mediatek/mt8189-mmsys.h           | 300 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  12 +
 drivers/soc/mediatek/mtk-mutex.c              |  88 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |   5 +
 19 files changed, 507 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8189-mmsys.h

-- 
2.46.0


