Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB96BC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DkG/UtvUD1vBAFGouo8/8ihRmf6ROZf+6eSQ45AQQnA=; b=eZz2U0bmR/guiTsl/pzHWJCXzd
	SUiu+lWHnWDZE8C49vZLFBybvw1DX+q4JVYV08mt5WhgA3mrC+ci2/sL7T8DzP6kiY6NBefVGysxt
	yPNvDpKBFvXQQ1uVmOdFc3LwrYDdlHMGO9QpfH7hBf672sBkAEHCP99SPKGKtZ7LUAIBZGXqcUPUX
	Q22DzEPUYIkAR27VF6VtmFGBffXGIHiJtjMBeBqCcA6d9vwnS9SITZHLtUShDCNawZkTLgNbAvoL4
	fIUp41WHenXLuDiGe6Vwmu+a8ay6ydG3iVRSHXk5wuMPPRsZ3kYqjXmh3EipGS8ppVvNqdstCQj7r
	qd5wNkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0do-0000000H3vw-3t1n;
	Thu, 20 Feb 2025 07:06:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Ym-0000000H2ec-2aYz;
	Thu, 20 Feb 2025 07:01:26 +0000
X-UUID: 7be2b102ef5811efa1e849db4cc18d44-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DkG/UtvUD1vBAFGouo8/8ihRmf6ROZf+6eSQ45AQQnA=;
	b=N3ej72+OLCobJlZYGvkdnZZowyFJwoNEd6q2T6DmNgL/IO6cA2Sim7eW8IXN/H/Y0qQW+P9HU9oHjOsFssyfOBNURGkU2TBOGBSJEyQmfGwY8JNTsaylcnJda+aIswH2QF//LN41YdFTBAq0bpekhNZAWz24d6pgAlIj2q8Zgfk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1fb0a0cd-69d6-4788-96c0-4f5ae8d375d3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:0ba65bb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7be2b102ef5811efa1e849db4cc18d44-20250220
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147063099; Thu, 20 Feb 2025 00:01:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:15 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 0/4] Add MTK AIE Driver For MT8188
Date: Thu, 20 Feb 2025 14:59:49 +0800
Message-ID: <20250220070114.15015-1-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230124_659748_4409EE40 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Bo Kong <Bo.Kong@mediatek.com>

AIE(AI Engine) is one of the units in mt8188 ISP which
provides hardware accelerated face detection function,
it can detect different sizes of faces in a raw image.

Bo Kong (4):
  media: dt-bindings: add MT8188 AIE
  arm64: dts: mt8188: add aie node
  uapi: linux: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver

 .../bindings/media/mediatek,mt8188-aie.yaml   |   90 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   12 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1181 +++++++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 1300 ++++++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 2309 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  134 +
 include/uapi/linux/videodev2.h                |    6 +
 12 files changed, 5075 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


