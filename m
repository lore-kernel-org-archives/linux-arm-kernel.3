Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C136C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5B6x1f3BmYnfCfyg4xkgd19eSdVOAgCLTbpP7eWHMVo=; b=SWS9/gN5CI4mUA5HCRXWg1gdOY
	iuhpDeevytrq4GoWFgL6UQWaI7/5C1wlXK8y77rLeVY0epKH9wWyvhVAxuXmTrDz1/cPl6SjYDtcT
	KBIjpGK8Z2oG2a6fyE5OZOw28jrySJ9yPvGOZrN3g5IcXcH15lxC6pyR/zNI4VXPqr4JKmNLNW0G0
	ZYPT3BCo8aE1oggr+Ii5UDK5ei0FcSLuTeu9XHOS+nPEZnTInfmHhePu1osSYtg+HkednlrpN3BUM
	VmeGSPkCZlBT29DeZbasCzh9FjG2+p9wD9/XUef1KlrCWvvf223BbvDB4Gf74Yj/m8m+L+el92/A7
	hIDUvsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Ut-0000000EVSY-07sX;
	Wed, 14 May 2025 08:29:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7DS-0000000ES2D-2Dlf;
	Wed, 14 May 2025 08:11:51 +0000
X-UUID: 1350c992309b11f08d385d50fb11b32d-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5B6x1f3BmYnfCfyg4xkgd19eSdVOAgCLTbpP7eWHMVo=;
	b=NngqUrlcsnCRRV0MqG+KmgX2QIFbEwRVv/W4l7CZQLFIKAwicg+nEhvE+tC4hbZ0nDpGWpR5alNI6C1gae0PcvPJc6Rm33qhVnrv339iWeRKNuQSnrt49aAVdZiS9oqXur55nfEO1+iZfYUWl3NZRjrP+Q4y7ArzTDMvR+RQxX0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d5c357ae-773b-4fbe-9b56-9c0df6d18664,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:60c7f8bf-eade-4d5b-9f81-31d7b5452436,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:nil,Content:0|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1350c992309b11f08d385d50fb11b32d-20250514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1380299235; Wed, 14 May 2025 01:11:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 14 May 2025 16:11:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 14 May 2025 16:11:40 +0800
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
Subject: [PATCH v3 00/10] ASoC: mediatek: Add support for MT8196 SoC
Date: Wed, 14 May 2025 16:11:02 +0800
Message-ID: <20250514081125.24475-1-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011150_575092_296CC20A 
X-CRM114-Status: GOOD (  18.48  )
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

Changes since v2:
  - remove the mtk_memif_set_channel interface modify.
  - remove duplicate definitions from the header file.
  - move the afe gate clk to the audio driver for management and registration
    and manage the afe clk gate in each dai driver.
  - delete the useless clk source.
  - the i2s driver adds i2s clk gate management, removes the additional dts
    configuration of i2s4.
  - the afe and i2s dai driver,memif and irq data structs are encapsulated using
    macros to reduce the amount of code.
  - the volatile reg is modified as suggested.
  - mt6681 codec is not supported, the mt6681 keyword is removed.
  - the name of the machine driver is changed from mt8196-mt6681.c to mt8196-nau8825.c
  - remove the i2s4 configuration from mt8196-afe.yaml and make the modifications as suggested.
  - change the mt8196-mt6681.yaml to mt8196-nau8825.yaml and make the modifications as suggested.

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

Darren Ye (10):
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: mediatek: mt8196: add platform driver
  ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE document
  ASoC: mediatek: mt8196: add machine driver with nau8825
  ASoC: dt-bindings: mediatek,mt8196-nau8825: add mt8196-nau8825
    document

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   155 +
 .../sound/mediatek,mt8196-nau8825.yaml        |   115 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    47 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/mt8196/Makefile            |    18 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   723 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |   142 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   206 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  2642 ++++
 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c |   252 +
 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h |    14 +
 .../soc/mediatek/mt8196/mt8196-audsys-clkid.h |    78 +
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   918 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  4052 ++++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   862 ++
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   869 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 20 files changed, 23299 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2


