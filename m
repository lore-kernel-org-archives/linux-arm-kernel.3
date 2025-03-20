Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FEC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 03:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O8wO0y0Uf9L6XQSvVRb4n8ULZarLdb4tWNcXs+FmIgs=; b=MDTQVnSlvC5cTrb2PgVh1WKzkn
	fYJyIfqDhHJGGhLj2olB7TSfzYt798oV4r0hr5z3beJ9xxBpWeE7CSSzVFyJkNncF04UFsDA2jbN2
	VcZHN20F78Iem+ota0jmeF3ywZxS2wbt3DuHFB6XCjsPoxfa1z3yK/hHUnMnZsPlCTBilZM9xxwDK
	qTrnEGsqr52IGU+c4lWE2JmiDCNlLHDyE7CLUfIGPS+vUqYU9Dd8H1rNhyVprA/XOFbw97i2gQygI
	w/Y59l5hzMyrjMfBDvw/itVzBUxylZtpYNAjIOaAW8gDzsaS7CSI1YkLiZnqi/pz0UlF2WH2uXqVr
	XgHUCbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6S7-0000000AyIu-1XVi;
	Thu, 20 Mar 2025 03:20:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6QP-0000000Ay91-2HiB;
	Thu, 20 Mar 2025 03:18:30 +0000
X-UUID: fa6e861c053911f0a1e849db4cc18d44-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=O8wO0y0Uf9L6XQSvVRb4n8ULZarLdb4tWNcXs+FmIgs=;
	b=RtTO/oh6oU+QhyXnTgE4Q6fpVfEbJgYebv9FwbCNorTSq44EQApBAohsd5IZeVnTb7ZUYk8cJJbGjEmKBlqsl/S7WXuqvqSpAglIEnObS6Aq9kbuhtWB7FVXdL/c4sr8XrqT8dASA3/K0puRc2zbD3ikQZ5EJOPA2vAj4nKvuJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f72c745a-288d-417d-9368-6dc12992bfc8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fed7c741-b9d5-4efb-8cbd-6eb0b75d20c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: fa6e861c053911f0a1e849db4cc18d44-20250319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1144917005; Wed, 19 Mar 2025 20:18:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 11:18:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 11:18:17 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Jjian.Zhou@mediatek.com>, <Xiangzhi.Tang@mediatek.com>, hailong.fan
	<hailong.fan@mediatek.com>
Subject: [PATCH 0/2] ASoC: mediatek: Add support of SOF on Mediatek mt8196 SoC.
Date: Thu, 20 Mar 2025 11:17:23 +0800
Message-ID: <20250320031753.13669-1-hailong.fan@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_201829_591502_6525AF1F 
X-CRM114-Status: GOOD (  10.40  )
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

Add support of MediaTek mt8196 SoC DSP to SOF.
This series is based on linux-next, tag: next-20250319.

---
This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://lore.kernel.org/all/20250307034454.12243-1-guangjie.song@mediatek.com/

hailong.fan (2):
  ASoC: SOF: MediaTek: Add mt8196 hardware support
  dt-bindings: dsp: mediatek: add mt8196 dsp document

 .../bindings/dsp/mediatek,mt8196-dsp.yaml     |  96 +++
 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/mt8196/Makefile        |   4 +
 sound/soc/sof/mediatek/mt8196/mt8196-clk.c    | 100 +++
 sound/soc/sof/mediatek/mt8196/mt8196-clk.h    |  23 +
 sound/soc/sof/mediatek/mt8196/mt8196-loader.c |  61 ++
 sound/soc/sof/mediatek/mt8196/mt8196.c        | 650 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8196/mt8196.h        | 109 +++
 9 files changed, 1053 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.h

-- 
2.45.2


