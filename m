Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAD0E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TXZXNw/CVhdjctS/rmk4J5s1TQ/EXWSUdcZULpsQrKY=; b=1txhX2GIFTwfCnEQu/ddKgN5fM
	Tou0eioumFf7m0jDDDssg/byxvGvV4/80vgjkZFwQ7xPDXf6G9i/whX+07FM/2YmxyqsaUpvtgWat
	t3kbRTL3bZ0trHpp5TUG80zHgJakc1djDbSyHfqsta+k9+ZJeUoyzqjzi1n9MKqaUf0646EudZ+Fr
	rZ4st6aZdL+OiddCqZbNrNmqVAG100fCvGPReYu83GdVDGVk+6QDg6mMXYDraAeQYO5cmsFyvMz2h
	VLBv+tAAaGy2wmL3DxK4/ORZQqLLrvbYH1CfQP2hiXbuUWbWTkDqxII2UjFXqg6MxwlWFY4afnDSA
	LQLY9/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNJ1-0000000DWup-2PZ6;
	Wed, 25 Dec 2024 09:03:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNGd-0000000DWRi-0cNH;
	Wed, 25 Dec 2024 09:01:24 +0000
X-UUID: cd86262ec29e11ef9048ed6ed365623b-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TXZXNw/CVhdjctS/rmk4J5s1TQ/EXWSUdcZULpsQrKY=;
	b=gW+ZrIYzz1C1B21vglW9hAd+h/YPYs8TXe0cQaJ14IHw3LN/17VX3ThXmua5W4JqMNZ3mYymYGrWoluPAG6H0Ow7GxgO5RVu04ui0bqIW1J9+Qv3FO7jNnTsBIAliaPTayzz8zOauFUy9i2DwaWzU4/isgEIs+FNyYwsJ4JcpZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9b5ace90-b42a-42b3-bcdf-088d55a95d6b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:fb0ed818-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd86262ec29e11ef9048ed6ed365623b-20241225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486712833; Wed, 25 Dec 2024 02:01:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:14 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/4] Add AIE Driver
Date: Wed, 25 Dec 2024 17:00:19 +0800
Message-ID: <20241225090113.17027-1-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_010123_194451_0DDA05C3 
X-CRM114-Status: UNSURE (   8.74  )
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

AIE(AI Engine) is one of the units in mt8188 ISP which provides
hardware accelerated face detection function.

Bo Kong (4):
  arm64: dts: mt8188: add aie node
  media: dt-bindings: add MT8188 AIE
  media: mediatek: add MT8188 AIE driver
  uapi: linux: add MT8188 AIE

 .../bindings/media/mediatek,mt8188-aie.yaml   |   97 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   41 +
 drivers/media/platform/mediatek/aie/Makefile  |    8 +
 drivers/media/platform/mediatek/aie/mtk_aie.h |  950 +++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 1398 +++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 3545 +++++++++++++++++
 include/uapi/linux/mtk_aie_v4l2_controls.h    |  132 +
 include/uapi/linux/videodev2.h                |    6 +
 11 files changed, 6212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
 create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
2.45.2


