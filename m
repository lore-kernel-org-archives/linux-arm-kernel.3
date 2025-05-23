Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8DFC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8JFy9P5cfXtLYBdVWIyXjRB3r7z+5ZYiGzT0NsfoK/M=; b=Vdr4iPuYMXWm7KmcM1OdtDn0gh
	HsmLJjzqBK5UOXDtTmmyvNpN5aZ/Rn4vQcwyKOTOzmZTZxe4/cxnIrXfDF89ol+ANDsOl/gk2TGRD
	rg7uAbt70OANHhZT6YrG/mbgSrEDwRsGLnC/kLpLxq8TPLerpStvmn+g+Xe/tk/laDZA1Un4DltJo
	frTSl3q9d7I9edLqpQcoBAcok/k0BoDZ/7kN84OToNKfJTFDgjIO71H8nrAN5lXeiVRYyPzcHnYX0
	WHs8VxKlAMlDwGP/ZubDJnlCtizRw06JG5wtfXxaiL1bNUpRjCq2UEtcO1I6OwBWB+rTi8xJ9BZeH
	Uvi5IV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIP0Y-00000003U2n-40ti;
	Fri, 23 May 2025 09:48:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOwD-00000003TBY-0PaM;
	Fri, 23 May 2025 09:43:38 +0000
X-UUID: 6239a4ae37ba11f08d385d50fb11b32d-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8JFy9P5cfXtLYBdVWIyXjRB3r7z+5ZYiGzT0NsfoK/M=;
	b=n5ufv5+RBkh3X+5bg5bGKKtBj4V64a8OafQdNsYeFVpDc1Y2wM8LTlwfJLjHnpFxUugrl9ioG1JV54oEhc0N6v9TAxBUbU5UGwRlusJ436NV+hxUxQoCO8aP3SVSynxOT/HQmly0hfQvtWiCjOC0Boi4xZpXMH8l2bONuf4/0NM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:18388cbd-a5d7-4a7d-9647-088815683261,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:28a5a647-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6239a4ae37ba11f08d385d50fb11b32d-20250523
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 291699779; Fri, 23 May 2025 02:43:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 17:43:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 17:43:24 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe Yang <Axe.Yang@mediatek.com>, Cathy
 Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Date: Fri, 23 May 2025 17:42:45 +0800
Message-ID: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_024337_141857_2531A84A 
X-CRM114-Status: GOOD (  10.28  )
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

This patch series introduces support for the MT8189 pinctrl driver, include
the driver implementation, new binding document and pinctrl header file.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8189
  arm64: dts: mediatek: mt8189: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8189

 .../pinctrl/mediatek,mt8189-pinctrl.yaml      |  217 ++
 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 ++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     | 1700 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h | 2452 +++++++++++++++++
 6 files changed, 5507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h

-- 
2.45.2


