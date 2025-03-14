Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QB5LQt7bpy+JzNLqAPOMyuAUrCHcw7EYGy1OQwsiSpg=; b=DjbkBgyOXrcCvdIcWE5VLDZ8Hn
	ABl3/KuPoi3k10GepiRF7q6IaU/1HvQKzoKP6x2nEbMAXQ0P9SMsAGRsk4Ma7WPav+lRL8KjDAgLF
	w7OA7ke26zuDk5nVHoOqMKhYm9kJ6otBIW60350gnWb+6EoeOBXrWZ5rNI4AWqxp6KIRLxUCWYfRF
	oc+qym+Kptx40Aprhr63vFR7+8C7HXO4/ShXKOWODjajCjHuiD47NQk4kmzeiELrFX63MsqqFiBJ5
	ZijBMd4N/rZfa20dFdq07P43elCH34d2e2TapTiqbUs2BdmBU3xkGCEsXveT1MdmJlWuGXTL0jro5
	Nr3UOZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszua-0000000DMm7-3fp0;
	Fri, 14 Mar 2025 07:56:56 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszsv-0000000DMUP-0OLi;
	Fri, 14 Mar 2025 07:55:14 +0000
X-UUID: a45c77be00a911f0a1e849db4cc18d44-20250314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QB5LQt7bpy+JzNLqAPOMyuAUrCHcw7EYGy1OQwsiSpg=;
	b=hy20dZ12n6HxyTDC8HNU+Izo+m6Fm3uMa6gjFBmAdBPOgjyXiWR+v/mGLvKcYRrjGMuRKhlzzufy+npPEK/z6ZZ3lGfzjiBPYE6MLBZZOe7rBk6g9yNZ/sw2F8pnHmuTbLMPiHYxpnrmy0qZFQebLukqZcn0Uut0U1f/tQarTiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:12404639-51e8-4888-bed6-1bb9efc3c95c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:d2be55c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a45c77be00a911f0a1e849db4cc18d44-20250314
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <lu.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1155081101; Fri, 14 Mar 2025 00:55:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Mar 2025 15:55:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Mar 2025 15:55:01 +0800
From: Lu.Tang <Lu.Tang@mediatek.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Sen Chu
	<shen.chu@mediatek.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Lu.Tang
	<Lu.Tang@mediatek.com>
Subject: [PATCH 0/5] Add PMIC and SPMI driver for mt8196
Date: Fri, 14 Mar 2025 15:32:26 +0800
Message-ID: <20250314073307.25092-1-Lu.Tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_005513_136848_06035BB1 
X-CRM114-Status: GOOD (  12.02  )
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

This series is based on linux-next.

Changes in v0:
- Modify SPMI driver for mt8196
- Add SPMI PMIC mfd driver
- Add PMIC regulator driver for mt8196

*** BLURB HERE ***

Lu.Tang (5):
  pmic: mediatek: Add pmic auxadc driver
  pmic: mediatek: Add pmic regulator driver
  pmic: mediatek: Add spmi pmic mfd driver
  spmi: mediatek: modify spmi dirver for mt8196
  dt-bindings: pmic: mediatek: Add pmic documents

 .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |   31 +
 .../bindings/input/mediatek,pmic-keys.yaml    |    1 +
 .../bindings/mfd/mediatek,mt6685.yaml         |   50 +
 .../bindings/mfd/mediatek,spmi-pmic.yaml      |  173 +++
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |    1 +
 drivers/iio/adc/Kconfig                       |   10 +
 drivers/iio/adc/Makefile                      |    1 +
 drivers/iio/adc/mtk-spmi-pmic-adc.c           |  576 +++++++++
 drivers/mfd/Kconfig                           |   26 +
 drivers/mfd/Makefile                          |    2 +
 drivers/mfd/mt6685-core.c                     |   83 ++
 drivers/mfd/mtk-spmi-pmic.c                   |  518 ++++++++
 drivers/regulator/Kconfig                     |   34 +
 drivers/regulator/Makefile                    |    3 +
 drivers/regulator/mt6316-regulator.c          |  381 ++++++
 drivers/regulator/mt6363-regulator.c          | 1106 +++++++++++++++++
 drivers/regulator/mt6373-regulator.c          |  826 ++++++++++++
 drivers/spmi/spmi-mtk-pmif.c                  | 1040 +++++++++++++++-
 include/linux/mfd/mt6363/core.h               |  134 ++
 include/linux/mfd/mt6363/registers.h          |  168 +++
 include/linux/mfd/mt6373/core.h               |   94 ++
 include/linux/mfd/mt6373/registers.h          |   53 +
 include/linux/regulator/mt6316-regulator.h    |   48 +
 include/linux/regulator/mt6363-regulator.h    |  424 +++++++
 include/linux/regulator/mt6373-regulator.h    |  318 +++++
 25 files changed, 6037 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
 create mode 100644 drivers/iio/adc/mtk-spmi-pmic-adc.c
 create mode 100644 drivers/mfd/mt6685-core.c
 create mode 100644 drivers/mfd/mtk-spmi-pmic.c
 create mode 100644 drivers/regulator/mt6316-regulator.c
 create mode 100644 drivers/regulator/mt6363-regulator.c
 create mode 100644 drivers/regulator/mt6373-regulator.c
 create mode 100644 include/linux/mfd/mt6363/core.h
 create mode 100644 include/linux/mfd/mt6363/registers.h
 create mode 100644 include/linux/mfd/mt6373/core.h
 create mode 100644 include/linux/mfd/mt6373/registers.h
 create mode 100644 include/linux/regulator/mt6316-regulator.h
 create mode 100644 include/linux/regulator/mt6363-regulator.h
 create mode 100644 include/linux/regulator/mt6373-regulator.h

-- 
2.46.0


