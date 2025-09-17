Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAA7CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jrp3OzWhwlwxOjOtNPYNkhZFHouosvlBb/E7+7PYIJk=; b=gi5lDFEXR6bRqPk5kxfDKKffxG
	whRYfVizxgawnMYTyGvl/HvcwfZAAIJKXTskC++Wr2ieppNGfz3706NgR6Psv2kupE16ja4qc71TJ
	8xbYGXRs1saqYBWiOk2IygyzaSHv4JpP6mhPNEu7Cbr+7Rfu3EUB3Qb8+UvwRHI5mnCA7VVga5fxW
	AYXK2Wnz0XgZnVcsMQO0vDljxAGklEAd2Jv0/BZ/+yDKb8nT96Ja5gWYJnIfS193+jOo4pBchzpkp
	LvC4l7mVS/QquezaLXnBomLrOaf1iXW4y7qg9eJ/Ylz4+UzpZIY/tcMEqsdcT622remKWP1Uq4R+b
	SEjIYZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymzO-0000000AXiJ-21e2;
	Wed, 17 Sep 2025 07:54:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymzL-0000000AXfo-1sgO;
	Wed, 17 Sep 2025 07:54:04 +0000
X-UUID: 76adc806939b11f09f706fa2197c6ceb-20250917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Jrp3OzWhwlwxOjOtNPYNkhZFHouosvlBb/E7+7PYIJk=;
	b=MT2OpI83huhHgpICnQUqhL8iaR114t7b3g8IluJgJxgm70sDV+euFq1mSR7Eq8ou+scFaVUoLCjr9asn7xWplSaQYjgH/8W0dhBwwKzSuE8QuZI1brxCyFb+8ginb6laWvLmiWSlftrVDCHyzr+DMtmSXzeiL4ip6maTVTYvPM4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:0fac84f1-6eff-4537-b5af-96c9c6017cc2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:1b9f69a9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836,TC:-5,Content:0|15|50,EDM:-3
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76adc806939b11f09f706fa2197c6ceb-20250917
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789649081; Wed, 17 Sep 2025 00:53:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 15:53:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 15:53:51 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<hailong.fan@mediatek.com>
Subject: [PATCH v3 0/2] ASoC: mediatek: Add support of SOF on Mediatek mt8196 SoC.
Date: Wed, 17 Sep 2025 15:53:04 +0800
Message-ID: <20250917075336.5985-1-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_005403_494738_CD4C9A90 
X-CRM114-Status: GOOD (  11.44  )
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

From: Hailong Fan <hailong.fan@mediatek.com>

Add support of MediaTek mt8196 SoC DSP to SOF.
This series is based on linux-next, tag: next-20250915.

---
v3:
- Fix comments and commit messages.

v2:
- Rebase onto https://lore.kernel.org/all/20250320115300.137410-1-angelogioacchino.delregno@collabora.com/
- Link to v1: https://lore.kernel.org/lkml/20250320031753.13669-1-hailong.fan@mediatek.com/

This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://lore.kernel.org/all/20250307034454.12243-1-guangjie.song@mediatek.com/ 


Hailong Fan (2):
  dt-bindings: dsp: mediatek: add mt8196 dsp document
  ASoC: SOF: MediaTek: Add mt8196 hardware support

 .../bindings/dsp/mediatek,mt8196-dsp.yaml     |  98 +++
 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/mt8196/Makefile        |   3 +
 sound/soc/sof/mediatek/mt8196/mt8196-clk.c    |  98 +++
 sound/soc/sof/mediatek/mt8196/mt8196-clk.h    |  23 +
 sound/soc/sof/mediatek/mt8196/mt8196-loader.c |  60 ++
 sound/soc/sof/mediatek/mt8196/mt8196.c        | 556 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8196/mt8196.h        | 124 ++++
 9 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.h

-- 
2.45.2


