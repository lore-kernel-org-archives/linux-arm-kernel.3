Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BC0CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUNEBOxFD6xbKWIsX6dDsySLLQp/Ba+RMkl0Vl7CkHI=; b=c8j6aevmz9T6ZS+tF9o2n3glrz
	z24sk+vXzgkkl9kRKQPmM8IZlw0HzjQfyDIF7/+WSzy9jH9O14de+rQHWFEsYLSYoxOMAs01BZJpG
	I+FEQufnajdZPYUE9PR2+9e1225sJkn1BRkLx/Vy1N+rS+IlP1N2ZrLa5t0sc5M4EAMiMYhcZJBwh
	w9MD5ppI102GeHyZv6Zzgi9bSgu3K009RDg0cm8+w4DSrtbsS2qMOvHuayWdCGpn8pXGOlHpIT1i1
	JEvmjy49+fi2tiwTy2XoPahdNbo2Yaze2+xNZ2xEPyZa2jlh0W+nd9RcgAFePCFiAMLNXaTQ21ioR
	0dgfm7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjck-00000005XSM-0lQ0;
	Fri, 31 Oct 2025 07:32:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjch-00000005XRM-1zwF;
	Fri, 31 Oct 2025 07:32:36 +0000
X-UUID: c2854986b62b11f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IUNEBOxFD6xbKWIsX6dDsySLLQp/Ba+RMkl0Vl7CkHI=;
	b=IlwmoIaIJ/N8TtHiCn49/wJDuFn+txgqfijlhAu6P2ocQ/Ba/rUhKh9wwo9qD5UDO2cBkC3MDjr3DNSLvKTgsl9ipO+vmY+3CgE35WHX6xU9EtTvx5WCKSAW4Q56M6HBfow/l8ynwRFHueRia6opyWJGoL8TXx90bm1xWW0DdTE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d5e57115-8e06-4d6a-b7bc-c4ebce9c88ec,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:396fe36a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2854986b62b11f09f706fa2197c6ceb-20251031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 346750036; Fri, 31 Oct 2025 00:32:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 15:32:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 15:32:27 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v3 00/10] ASoC: mediatek: Add support for MT8189 SoC
Date: Fri, 31 Oct 2025 15:31:54 +0800
Message-ID: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_003235_721316_9CD92333 
X-CRM114-Status: GOOD (  12.53  )
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

Based on tag: next-20251031, linux-next/master

This series of patches adds support for Mediatek AFE of MT8189 SoC.
Patches are based on broonie tree "for-next" branch.

Changes in v3:
  - Added support for CS35L codec in the machine driver.
  - Added I2SOUT0/I2SOUT1 MCLK configuration and enabled the clocks.
  - Added dpcm_merged_format flag to the dai-link to ensure codec
    format constraints are applied.
  - Added support for ES8326 codec in the machine driver.
  - Updated the dt-bindings description based on reviewer comments.

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

 .../sound/mediatek,mt8189-afe-pcm.yaml        |   178 +
 .../sound/mediatek,mt8189-nau8825.yaml        |   101 +
 sound/soc/mediatek/Kconfig                    |    31 +
 sound/soc/mediatek/Makefile                   |     1 +
 sound/soc/mediatek/mt8189/Makefile            |    18 +
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c    |   750 ++
 sound/soc/mediatek/mt8189/mt8189-afe-clk.h    |    76 +
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |   240 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    |  2617 ++++
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c   |  1228 ++
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c    |  1463 +++
 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c    |   332 +
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c    |   672 +
 .../mediatek/mt8189/mt8189-interconnection.h  |    97 +
 sound/soc/mediatek/mt8189/mt8189-nau8825.c    |  1178 ++
 sound/soc/mediatek/mt8189/mt8189-reg.h        | 10773 ++++++++++++++++
 16 files changed, 19755 insertions(+)
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


