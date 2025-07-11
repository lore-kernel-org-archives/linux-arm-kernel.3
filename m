Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898B1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ugswZi9v4nFVpgCGJexfIal8N3se7IPyZh1DkN9RTwQ=; b=FhQe/cMsSOCoUAf+popCxuBoJ+
	hiltWX4R/MVRAHIcIU1nHDNZQEDrwissoWUEPSAbsuaSvZy1X2wenNZphOgACRNLP+jxUsThX50g2
	G7RRhAimnkG6OsrSW52w0HcZskjh6XHBRGuvAyKtrCb4Wr2P6CyaSmGsxb+AiwNJ69D4u0AyL1+05
	Vs6UU4oTPrs7XRQ1dMmwsWgFXncnrLkAIga/qwlUJlruwXzv3NXhK3Qu9dd88rQVxbsY8bGUIYUXG
	1/2pKpy1B+emfInGQ2YEDuQiTwwlT/EMCPBPSi0x5S/P+Ts/hTNjXBGqnWkPgdGw4AetqZ2f+bSXl
	q8qs+FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBEP-0000000EVdv-3Tdi;
	Fri, 11 Jul 2025 10:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAJv-0000000EMTg-1C6n;
	Fri, 11 Jul 2025 09:45:32 +0000
X-UUID: c3e9b4585e3b11f09f706fa2197c6ceb-20250711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ugswZi9v4nFVpgCGJexfIal8N3se7IPyZh1DkN9RTwQ=;
	b=jYYsPlUTyb6XCBAqkoNIkgpHV5ouToWYT814RsExmOFyTbLHq3K/qJKiDwTplqZm1a6FPMPkzuN1eFHgnn8o0zjwV52osIUAwOr+oW8IDTYbWCDavHPCz9ws055+VdqbWIhSrPM1iIvycdEqmMQZstviyJrJqqy1BhTudSCDrQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ec20b67a-8f20-4c0f-ab6a-a15e06939f8d,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b98d0edf-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c3e9b4585e3b11f09f706fa2197c6ceb-20250711
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876195368; Fri, 11 Jul 2025 02:45:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Jul 2025 17:45:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Jul 2025 17:45:18 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe
 Yang <Axe.Yang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Date: Fri, 11 Jul 2025 17:44:56 +0800
Message-ID: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024531_340208_9D501BE0 
X-CRM114-Status: GOOD (  11.01  )
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

This patch series introduces support for the MT8189 pinctrl driver,
include the driver implementation, new binding document and pinctrl header file.

Changes in v2:
- Modify the coding style of dt-binding.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8189
  arm64: dts: mediatek: mt8189: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8189

 .../pinctrl/mediatek,mt8189-pinctrl.yaml      |  213 ++
 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 ++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     | 1700 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h | 2452 +++++++++++++++++
 6 files changed, 5503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h

-- 
2.45.2


