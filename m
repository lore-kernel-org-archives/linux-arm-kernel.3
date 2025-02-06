Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F090C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GGW6iInM2fXnbOa6e7rwuDhnJObhpRoaaocsvZJX4w=; b=K9mGEyiXleYxIglmEa1yBOUFTT
	DwexTgPcGI1ddozMlIoyOke6kI4j8besN9qwjxt2l79KHUNv/vZ9kmlIZXVmdmW73YIavjvHBImsz
	ve/7Cier3Dj7UhTdXVPWJOJDSywD43SqpcJ/q4u3Vo+q5bgPhCGyEFeaoTzHDCGAwy72ufWsQxNFu
	efG7u84h5Zzd3MXwvfrP1mj4yQrKQ0dlkJKMcqSLCZgYkPMxjOSZeruPjp94XFIpjR6XiLDKMRww5
	UXkriB108Am4XOdDefbd1sP1Xp5487/AqbCa/D3UxsebPZT7QC8IcXTv8Iw7jxiryAXrDBBrrqXfY
	Ikz3M3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0t0-00000006GBx-2mkS;
	Thu, 06 Feb 2025 12:21:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0oE-00000006FGn-1bNB;
	Thu, 06 Feb 2025 12:16:43 +0000
X-UUID: 35175662e48411ef82ff63e91e7eb18c-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4GGW6iInM2fXnbOa6e7rwuDhnJObhpRoaaocsvZJX4w=;
	b=S2QZBAuZHpoiA6hBUFAOcWRc62ATxW1+QGZZwneoA7i9aua/pIwAYk77N9Nxg/L5RB5SqbLYZ36FsgGs6G7SMECWMQwT5zNkt6g/qhifdVZvpSHloRpKn2S6L/BnbOmAwFQ9xtKuJX5mLZKZ/LBVYSwY3XnGKAksZY5dvP7BVHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:87f820e7-d614-42b7-8949-083dbaf7e89a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:d1a2243e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 35175662e48411ef82ff63e91e7eb18c-20250206
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2037694014; Thu, 06 Feb 2025 05:16:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Feb 2025 20:16:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Feb 2025 20:16:31 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2,0/2] Add an interface to get current DDR data rate
Date: Thu, 6 Feb 2025 20:16:07 +0800
Message-ID: <20250206121629.12186-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_041642_426003_D9A6E870 
X-CRM114-Status: UNSURE (   9.53  )
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

*** BLURB HERE ***
This series is based on linux-next, tag: next-20250206.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v2:
- Remove pr_info and pr_err, use dev_err or dev_err_probe to print
  error message;
- Replace module_init by module_platform_driver;
- Remove unnecessary global variables;
- Change fmeter-verison to platform data;
- Remove mtk-dramc.h;
- Refine compatible to "mediatek,mt8196-dramc";
- Refine CONFIG name to MEDIATEK_MC;
- Fix yaml build errors, remove unnecessary properties on yaml file.

Link to v1:
https://patchwork.kernel.org/patch/13904862

Crystal Guo (2):
  memory/mediatek: Add an interface to get current DDR data rate
  dt-bindings: memory-controllers: Add MediaTek DRAM controller
    interface

 .../mediatek,common-dramc.yaml                | 129 ------
 .../memory-controllers/mediatek,dramc.yaml    |  44 ++
 drivers/memory/Makefile                       |   2 +-
 drivers/memory/mediatek/Kconfig               |   6 +-
 drivers/memory/mediatek/mtk-dramc.c           | 415 ++++++------------
 include/linux/soc/mediatek/mtk-dramc.h        |  41 --
 6 files changed, 191 insertions(+), 446 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 delete mode 100644 include/linux/soc/mediatek/mtk-dramc.h

-- 
2.18.0


