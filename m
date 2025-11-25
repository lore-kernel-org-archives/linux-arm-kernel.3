Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC91CFD374
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 02:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2x2SEVd0YgaWH8lFeglrw5bdnyBVJSWuckkkNTF4UXA=; b=F5AsQHOSR4W3NuDXJHoQEw7G11
	Ug0IkvxWB24B6+sm217+m7i1tQMXLeOA/1OF448c00chs977zy09foJZWGcZfnm3cLV34xw6BNuGQ
	zHCwaBvqMIGh2nkrJlK8gfx6KxQ4k3sUeDF/kT7u+MC2FU2H3TNlpE8vCG1MJL7KoIWOqTynVgje6
	bYbey3UANPKpTOSHRJoZDsqs1Fy27XJiEqn4toIIJm4KgNP3fdKUgAuIv+oETlN1YeVJI9kBkIvmH
	a5IU+PPDYF4/eFLdrtYvMJ1RJVLzPeOIgrkM4wu7LiVocm3RJwgDxi8aNQeOGuRYnaPINlNqPeZ30
	V+YjTfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivL-0000000Ccnl-0chq;
	Tue, 25 Nov 2025 02:36:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivE-0000000CcjS-1W87;
	Tue, 25 Nov 2025 02:36:53 +0000
X-UUID: 951e7096c9a711f09f706fa2197c6ceb-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2x2SEVd0YgaWH8lFeglrw5bdnyBVJSWuckkkNTF4UXA=;
	b=Z9UQb0QEPpCZtpuIHMvrqo4bkoSuubyiytfAsSWWfVAosUKl1Gmzcqi3r8fcIoktt/JKjFZUUgMyiwUJvILhYiCooa3pGyX0jsh8iSnCJT0oWswMMQtj2QBTWzUGj1pMF4jFudmIobWtAZdkpLIqCY9f+IB/R3llFO9bDWChCAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6fa7d93b-9cc8-45db-87d8-077475ffce30,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:183229bb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 951e7096c9a711f09f706fa2197c6ceb-20251124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 842090007; Mon, 24 Nov 2025 19:36:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:42 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:41 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 0/3] Add pinctrl and GPIO support for MediaTek MT8901
Date: Tue, 25 Nov 2025 10:36:33 +0800
Message-ID: <20251125023639.2416546-1-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_183652_399898_F4FE46BF 
X-CRM114-Status: GOOD (  15.20  )
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

Dear maintainers,

This patch series contains three patches aimed at improving the
Linux kernel support for MediaTek platforms, specifically for
the MT8901 SoC. The details are as follows:

Add GPIO range record in MediaTek pinctrl driver
 - This patch introduces GPIO range recording in the MediaTek
   pinctrl driver, providing a foundation for proper GPIO
   identification and management.

Add ACPI support in MediaTek pinctrl driver
 - This patch adds ACPI support to the MediaTek pinctrl driver,
   enabling the driver to function correctly in ACPI environments
   and enhancing platform compatibility.

Add pinctrl driver for MediaTek MT8901
 - This patch adds a new pinctrl driver for the MT8901 SoC,
   defining the GPIO functions, register mappings, and multiplexing
   relationships to improve pin control capabilities for MT8901.

These patches will help enhance the mainline kernel support for MediaTek MT8901.
Your review and feedback are highly appreciated.

Thank you!


Lei Xue (3):
  pinctrl: mediatek: Add gpio-range record in pinctrl driver
  pinctrl: mediatek: Add acpi support
  pinctrl: mediatek: mt8901: Add pinctrl driver for MT8901

 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c           |    4 +
 drivers/pinctrl/mediatek/mtk-eint.h           |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1460 +++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   24 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2130 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   21 +-
 9 files changed, 3647 insertions(+), 7 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h

-- 
2.45.2


