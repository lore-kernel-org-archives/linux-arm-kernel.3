Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A441CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ErL5bVo2x3f2K2HF24mhghjLaSR58ICwgymuW5068A=; b=1SldzNeKxQMMbYKI9OzcmBH846
	GoN8Qq8UfpbQS0a/8lKoBMGzKQCqv79/j34jCJzmglbUBUV1fPqZCXR+8acQcM9s6qUi7TfDaKOwB
	KB284yLWChR0b9oHbo5cG15XGa4hUqI3tLePzJWgQ7+fy5cetz2zxU98MuYpCzFGcb7aO0I+VmUo+
	EssErqhlbj+XrqPMK+imecLmFy5V8MGq33bAKWKmo07QMP7s7M29zb4K3U1QvlfEpNL4KTsiR86ih
	4tsLRcSPR6CsbRMLQCNKOz8Kpgm7KHL4i90Sagonq1rK1uViVbDmjdQnV1X4o8crQebI9MgMpM6V5
	hgRffb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRim-00000000KW1-3Y62;
	Fri, 05 Sep 2025 08:23:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQhK-0000000HXsH-0BIr;
	Fri, 05 Sep 2025 07:17:27 +0000
X-UUID: 5c75e65c8a2811f09eb0dd999d3936bf-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1ErL5bVo2x3f2K2HF24mhghjLaSR58ICwgymuW5068A=;
	b=YhgA+1QE+EYeQAi6AsS1h2Ug49sTte5kMzkxxGHTNJtrxMBHl2cExVbNhpjNucVragecg/nXkGDU3eooyhBnmJfhqQ2GT78XFyWKBxAnswEFZdVmBgyx5TBV3UmPe2f/DHKRIOWJlKF59E62ZodExzbvDcxbCi2AEoGAP7u9NCA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:86c43ddb-adf0-4f30-baa2-a8e903471372,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:b3eef9f7-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c75e65c8a2811f09eb0dd999d3936bf-20250905
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1628118352; Fri, 05 Sep 2025 00:17:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 15:17:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 15:17:13 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Darren Ye
	<darren.ye@mediatek.com>, Cyril Chao <cyril.chao@mediatek.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v2 00/10] ASoC: mediatek: Add support for MT8189 SoC
Date: Fri, 5 Sep 2025 15:15:45 +0800
Message-ID: <20250905071659.25805-1-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_001726_085268_D64002F9 
X-CRM114-Status: GOOD (  14.70  )
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

Based on tag: next-20250903, linux-next/master

This series of patches adds support for Mediatek AFE of MT8189 SoC.
Patches are based on broonie tree "for-next" branch.

Changes in v2:
This version refines the implementation of the MT8189 audio driver,
leveraging the feedback and comments provided during the review of the 
MT8196 v6 patch series since they have samilar code structure.
  - Refined the I2S DAI implementation based on reviewer comments,
    removed unused widgets.
  - Refined the TDM DAI implementation based on reviewer comments,
    optimized the MUX widget flow.
  - Refined the ADDA DAI implementation based on reviewer comments.
  - Refined the PCM DAI implementation based on reviewer comments.
  - Refined the platform driver based on reviewers comments, optimized
    the Channel Merge(CM) related flow.
  - Moved the pinctrl widget from the machine driver to the platform
    driver based on reviewer comments.
  - Removed unused clock initialization and settings to reduce redundancy.
  - Added a restriction to limit the sample rate to 48kHz.
  - Updated the machine driver’s compatible name as per the reviewer’s suggestions.
  - Modify the patch order of the dt-bindings and driver implementation.

Cyril Chao (10):
  ASoC: mediatek: mt8189: add common header
  ASoC: mediatek: mt8189: support audio clock control
  ASoC: mediatek: mt8189: support ADDA in platform driver
  ASoC: mediatek: mt8189: support I2S in platform driver
  ASoC: mediatek: mt8189: support TDM in platform driver
  ASoC: mediatek: mt8189: support PCM in platform driver
  ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
  ASoC: mediatek: mt8189: add platform driver
  ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825
    document
  ASoC: mediatek: mt8189: add machine driver with nau8825

 .../sound/mediatek,mt8189-afe-pcm.yaml        |   162 +
 .../sound/mediatek,mt8189-nau8825.yaml        |   101 +
 sound/soc/mediatek/Kconfig                    |    28 +
 sound/soc/mediatek/Makefile                   |     1 +
 sound/soc/mediatek/mt8189/Makefile            |    18 +
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c    |   738 ++
 sound/soc/mediatek/mt8189/mt8189-afe-clk.h    |    72 +
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |   238 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    |  2617 ++++
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c   |  1228 ++
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c    |  1463 +++
 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c    |   332 +
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c    |   672 +
 .../mediatek/mt8189/mt8189-interconnection.h  |    97 +
 sound/soc/mediatek/mt8189/mt8189-nau8825.c    |  1041 ++
 sound/soc/mediatek/mt8189/mt8189-reg.h        | 10773 ++++++++++++++++
 16 files changed, 19581 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8189/Makefile
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-reg.h

-- 
2.45.2


