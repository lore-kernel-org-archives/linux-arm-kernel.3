Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D95C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 01:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oegyJYedlbzffGL4cDafdK/VAO0ZgOIByVceTitr8z4=; b=d9oQynSXl2+TOk5gn5B1z870E7
	/TbkBQX2v4eC4ZUwTVRn2786KZRP8W0SrIKIKzT7tZZLyZoiKkg+kq9IPb5+iYMPIfyKbYzsM/lEH
	MsDiVU+z3Op7pD/0lQfv2Y2gPGpiMYXeD2aS1I8E9bvF7UP3W/1DzNSVYDw7yyPhS5Wdkme9REUBh
	jbfC3MLxW6YhgkppgR94D91s6njmHW2JEXkKBA8BWR6tU+dolNN2l11CvVCOH0QjGwNOjwu+y9qGv
	hgzo+cqNJbSqRhW2C0BQ61/IdZSDm1RjLnDdkzZRtrQuNqQOfBL1FpEYJqYF5nnW1j3YERkGsbGr+
	znbbKwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnp54-00000009NdT-27ey;
	Fri, 28 Feb 2025 01:22:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnp1y-00000009Mub-1xqU;
	Fri, 28 Feb 2025 01:19:12 +0000
X-UUID: ffa470a6f57111efa1e849db4cc18d44-20250227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oegyJYedlbzffGL4cDafdK/VAO0ZgOIByVceTitr8z4=;
	b=JHtjn/D8nhQKsfceIgXXm0AgqcBNdqh7tcnOuQbLVgd91lbPEE9XQ/JJ1EKxqxWJDRKAvdpF3tr337cI1N/EQXzGOHRrBFBGfC35wzuG0eE8RFiFJBf7ef55hYuFldb6nKLE3XCIplP7HrJJsC0QQRz4WavW6KjgpNUSuh+w1Zk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:aa1e977f-14f1-49e8-9f55-37a306408dd6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d00f04da-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffa470a6f57111efa1e849db4cc18d44-20250227
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 964449580; Thu, 27 Feb 2025 18:19:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 09:19:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 09:19:00 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>, "Axe
 Yang" <axe.yang@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Lei Xue
	<lei.xue@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v4 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Date: Fri, 28 Feb 2025 09:16:24 +0800
Message-ID: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_171910_513483_BB6337D4 
X-CRM114-Status: UNSURE (   9.81  )
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

Changes in v4:
- Add rsel-resistence-in-si-unit and remove RSEL macro magic
  number in mediatek,mt8196-pinctrl.yaml.
- Add values in SI units option to |struct mtk_pin_soc| in
  pinctrl-mt8196.c.
- Move pinmux macro header file to arch/arm64/boot/dts/mediatek.

Changes in v3:
- Remove drive-strength-microamp & rsel-resistence-in-si-unit
  related description in mediatek,mt8196-pinctrl.yaml.
- Use pm_sleep_ptr() in pinctrl-mt8196.c to fix build error.

Changes in v2:
- Fix driver file's coding style.
- Add pinctrl binding document.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8196
  arm64: dts: mediatek: mt8196: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8196

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  241 ++
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1572 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1857 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 6 files changed, 6472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

-- 
2.45.2


