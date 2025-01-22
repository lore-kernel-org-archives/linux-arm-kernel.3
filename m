Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC96C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jv2yDZtHcpSll2NLJ4TWnj6kWytYEK0xigOiSIN3QPQ=; b=gU7thqKYXbaABUDL+IqHvU75hk
	PVfC+KiAHIgBPUDuSW9JA/lYxqMQoLRc4hCkrzBO26K7ZMZI7sZHweHuKYmrsyGi3hD37BCwBAsrs
	CXgXWtQdQKatnalv+moJtXjVKPkn+OCjs5TZvSoSfPOTwp3Au7nCAPKMraXMcetF4iyD0bNSCiW+X
	Yc7BmZWu+p609UN53os3oHNIY7g3fo6sO35o8E9btTNdSeLsuEKEaQzXylEQCG5fAB3jijAaPcSon
	03/RSSfBK4xUAPeX+aTMsR+Ms2mVmWS5ohJ5D+wPK07xyRJe4740YITRgBUsvDjmshdJzYVeQkYsE
	ZpHgriZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabAN-0000000AKrT-34HB;
	Wed, 22 Jan 2025 13:53:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tab95-0000000AKaa-1rFL;
	Wed, 22 Jan 2025 13:51:52 +0000
X-UUID: 0390f958d8c811ef9048ed6ed365623b-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jv2yDZtHcpSll2NLJ4TWnj6kWytYEK0xigOiSIN3QPQ=;
	b=kWFYFfZKJ3WRuGl47YcW5NFG9PImD+uW6f6BBv5qA7WenMBkeKscomph1xKMRy6dlagrITq2geDi6mqFu/+vIAh0xt1qzEqajfuKWJQjqSIsuSTpli7K+wXqi9GpiWmKp9WHqeT3AfuehLhzVfRuGbyd4Avq0uC9HNDaapdZDeI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1055a063-c382-43a8-b647-983014b8cf2b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:31d88e7e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0390f958d8c811ef9048ed6ed365623b-20250122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 623293458; Wed, 22 Jan 2025 06:51:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 21:51:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 21:51:40 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Hao
 Chang" <ot_chhao.chang@mediatek.com>
Subject: [PATCH v2 0/3] pinctrl: mediatek: add support for multi-instance EINT
Date: Wed, 22 Jan 2025 21:51:22 +0800
Message-ID: <20250122135135.15234-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_055151_484945_CAA10A14 
X-CRM114-Status: UNSURE (   9.01  )
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

Change in v2:
1)Remove debug code
2)Remove instance structure
3)Change from providing mapping table by device tree to providing it by
pinctrl
4)Use eint hw structure as the basis for private data
---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver
[v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---
ot_chhao.chang (3):
  pinctrl: mediatek: add support for multi-instance EINT
  pinctrl: mediatek: update EINT base retrieval method
  pinctrl: mediatek: adapt to multi-base design

 drivers/pinctrl/mediatek/mtk-eint.c           | 219 ++++++++++-------
 drivers/pinctrl/mediatek/mtk-eint.h           |  22 +-
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |   1 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  45 ++--
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 232 ++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 7 files changed, 418 insertions(+), 109 deletions(-)

-- 
2.34.1


