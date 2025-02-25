Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3980DC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9bPP8SA0wg3WU33l4tSgklIjkOTJBKb71wpMn8Q+TI=; b=lNKjImMIzTk1DEt683YO1Euvph
	Uhn/hW417GBR9SVJhTPi6niKU8PWVo4IVDGBqnJnNBItCMXp5LyzENCIlmZ7SqS9R+fwIX09MXe5n
	g5nLUw3bTEbbZx1aiekP1YyvEtEC0mtbE9Y7UO0TAlWIaD7zjk/eC47LZEKY41uBwlcFvCynDYwoB
	T9CQURCats+k3Wsey6Rf3Mn/HiYGlSfCOpfs59wmRgF0rpRp/5mL8ASASCzckT6Pc3S5igCnX1X6X
	0m8IFrZAbtBdfgZF/TltaMxrwCu9jyVwJV3Q6ASDeAlKRLIMd6JNZsV9P2B/Mh+J42NJjM91Majr8
	2ENuc28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxz-00000000HDv-1PRB;
	Tue, 25 Feb 2025 16:39:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvb8-0000000HTLR-0NUP;
	Tue, 25 Feb 2025 14:07:47 +0000
X-UUID: df308c2af38111ef83f2a1c9db70dae0-20250225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=p9bPP8SA0wg3WU33l4tSgklIjkOTJBKb71wpMn8Q+TI=;
	b=lshnKFxrS9inMaNZw8VDU+C06nH+EPAbcqyWk3ds+wOsYFxBhBnLf1rVmCqJ/rJAnbIYeHjYJRWPakbyIsTZtUshxOMiq+/o8e1n2Xp7bRu0Yj2+lYk7dnYM5dONzORCougco6zydaxIGOcZWy8cpPgx4xQCd/Oko/RbPCHYfkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cac54954-ddf9-4b02-b0c4-05e5a451a101,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:b11ae8d9-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: df308c2af38111ef83f2a1c9db70dae0-20250225
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1100363900; Tue, 25 Feb 2025 07:07:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Feb 2025 22:07:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 25 Feb 2025 22:07:35 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v4 0/3] Add EINT support for multiple addresses
Date: Tue, 25 Feb 2025 22:07:21 +0800
Message-ID: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060746_132678_76CFA73C 
X-CRM114-Status: UNSURE (   8.77  )
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

v4 changes:
1)Add err statement for exception handling
2)Add check for invalid pins
3)Use defined eint pins

v3 changes:
1)Add error judgment

v2 changes:
1)Remove instance structure
2)Modify the way to obtain eint address

---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver
[v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---
Hao Chang (3):
  pinctrl: mediatek: add eint pins
  inctrl: mediatek: modify the method of obtaining eint address
  pinctrl: mediatek: adapt to EINT multi-segment addresses

 drivers/pinctrl/mediatek/mtk-eint.c           | 246 ++++++++++-----
 drivers/pinctrl/mediatek/mtk-eint.h           |  21 +-
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |   1 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  49 ++-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 296 ++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 7 files changed, 518 insertions(+), 103 deletions(-)

-- 
2.46.0


