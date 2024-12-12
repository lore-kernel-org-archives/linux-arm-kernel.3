Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255FEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzhAhfkcF6s2mX9ctlRYTFUq0I0eMPNUoVT98Qc7P0g=; b=bE+AJKa0W7BwUXKVSVclFN2v7d
	QWG8BrzkzP96yD1Nms9m4FGNjPeKT5Ni5XwtdUWrFufR4AWGzc8s+jc05p42aaRCPdYAimtnCFzzl
	9FdghuvCpN1L4zAr96kgOOxGo6VVetjdtxD2j5Q3vOFxF95lo3bH1z42p/WSxjznztdB2f8bCNo6O
	/eNwEknL09YMBS7vp/A7mX+ZAieOyXqbLmoivs1giqix/A5exc2w4RVu7Tnjk/uQqL2acYsotjBcS
	aevixaZiQfKsvXL9M4Lk9rVmpO0GDxtj44nZfxy41QuQ2lAXfK6O5zxj/f41jkUuXoD6qMHuGpu8N
	fMPG1Fgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfKz-0000000HSC9-3K8r;
	Thu, 12 Dec 2024 09:18:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfJ9-0000000HRt2-35q1;
	Thu, 12 Dec 2024 09:16:32 +0000
X-UUID: 99c63a54b86711ef82ff63e91e7eb18c-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MzhAhfkcF6s2mX9ctlRYTFUq0I0eMPNUoVT98Qc7P0g=;
	b=ZuoEI5TC3vcnv7alvUPJLQGuJBHAJXDZyrxamh0NHKHNpeBEhc7DY+f/X6qyj+PjPrxitJ+nlSpiZESAynA5G9X9f80WyMn0CMQ2VCblIV2ha2KpgP30meK3yo01LWuYQXlTEDOoV9nI4lcpixY7dlxwhcdUjY22ml4RjqFHmPI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9deb777f-9d4b-4f17-9ec9-ca574a1b7c8f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:dffc0413-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 99c63a54b86711ef82ff63e91e7eb18c-20241212
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 824649250; Thu, 12 Dec 2024 02:00:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 17:00:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 17:00:53 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/2] Add MediaTek DRAMC driver support
Date: Thu, 12 Dec 2024 16:59:46 +0800
Message-ID: <20241212090029.13692-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011631_768323_680209E5 
X-CRM114-Status: GOOD (  10.57  )
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

This series is based on linux-next, tag: next-20241210.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

Crystal Guo (2):
  memory/mediatek: Add an interface to get current DDR data rate
  dt-bindings: memory-controllers: Add mediatek common-dramc dt-bindings

 .../mediatek,common-dramc.yaml                | 129 +++++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  21 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 325 ++++++++++++++++++
 include/linux/soc/mediatek/mtk-dramc.h        |  41 +++
 7 files changed, 520 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c
 create mode 100644 include/linux/soc/mediatek/mtk-dramc.h

-- 
2.18.0


