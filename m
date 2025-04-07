Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H0Ju1JYitew1f7vP2gI0VqL3Y8dqgqZen6iVSaDOPyM=; b=b9y4P3NOaiJNwC9btUdLcB7JXc
	711FOrh9oEw4ak2COQyBfNRucbU51CmT2/RvqQX741Pp4PT3IC0sdpmQzbFBHCLlZ5wHMVeX31m+w
	oT97zsLocZY4+fiQ5becFElX8IWTVPCYAdcDZbeETt+351qsRpCGhejZXoD1PxqZsa0AleaCmkBMe
	cLvsTxPcaZ1jMZviKp1yVezAkvMZgY8R5w3Zk43uGIJmHnrnPKQybL3KsPWvIq4kEZuqOHWszc+17
	YVHQhJcDOiPGj7S75tiieaHXB7hEDBH8NRb7M2koj87p8vyInuONaggU0byBLyD7I4BT27WNaASgO
	kQoQ5otQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kzn-000000005Y2-1B4Q;
	Mon, 07 Apr 2025 11:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kxZ-000000004i4-3Jl0;
	Mon, 07 Apr 2025 11:48:14 +0000
X-UUID: 2d6f899c13a611f0a1e849db4cc18d44-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=H0Ju1JYitew1f7vP2gI0VqL3Y8dqgqZen6iVSaDOPyM=;
	b=Brx5uq38en+xtqbkpLuiY7HR8Ljmmxti4Gfi+eUY3UlxGiO+WLo3GpeVqj7Aqf7yFiJoy3zYhCC5Ipgg4l6KlrbTV1BojXXza+NZPWQG3Ss8HaIEmpmx8CEzViamD4QXDoAXq3ZWZSIXcLNAiG4ivIrRigCjJf9KLYjy2efZ87k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:48fd2b1c-0921-4d28-955f-8f5620d0e1f1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c90b46c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:nil,Content:0|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d6f899c13a611f0a1e849db4cc18d44-20250407
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877572757; Mon, 07 Apr 2025 04:48:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:48:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:48:06 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 00/11] ASoC: mediatek: Add support for MT8196 SoC
Date: Mon, 7 Apr 2025 19:47:12 +0800
Message-ID: <20250407114759.24835-1-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_044813_836463_47D0B68A 
X-CRM114-Status: GOOD (  13.70  )
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

From: Darren Ye <darren.ye@mediatek.com>

This series of patches adds support for Mediatek AFE of MT8196 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  - modify mtk_memif_set_channel and mtk_afe_pcm_pointer interfaces
    are improved to support mt8196.
  - remove duplicate definitions in the mt8196 common header file.
  - cm logic is merge into the afe platform driver.
  - modify afe clk to return judgment logic and remove useless clk sources.
  - refactor the mt8196 adda dai driver.
  - remove the gpio module and use SND_SOC_DAPM_PINCTRL to manage it.
  - removes CONNSYS_I2S related functions that are not supported in i2s dai driver.
  - fixed mt8196-afe.yaml and mt8196-mt6681.yaml syntax issues.
  - modify log printing in all modules.
  - optimize the header file included for machine driver.

Darren Ye (11):
  ASoC: mediatek: common: modify mtk afe common driver for mt8196
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: mediatek: mt8196: add platform driver
  ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE document
  ASoC: mediatek: mt8196: add machine driver with mt6681
  ASoC: dt-bindings: mediatek,mt8196-mt6681: add mt8196-mt6681 document

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   233 +
 .../sound/mediatek,mt8196-mt6681.yaml         |   114 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |    23 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.h    |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    47 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/common/mtk-base-afe.h      |    13 +
 sound/soc/mediatek/mt8196/Makefile            |    16 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   729 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |    78 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   194 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  5070 +++++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   918 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  4080 ++++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   825 ++
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-mt6681.c     |   876 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 20 files changed, 25414 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-mt6681.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2


