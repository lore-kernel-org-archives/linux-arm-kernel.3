Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91222C36005
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 03:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AfrfhfiDwEWjqU6NksjAAip06PQ6+L5UfJG10TSad50=; b=xF9F6UFY7cE0jpJgVBadDdTsf0
	oBj+7tkFOAk7O3y46iQUfD0KjEXOHn1zdCDtJ8J70hGgU9rH12qPLcKcIZ9grdpTxN4D0qWZTJMDt
	JyeGn3WSdk/T+cJP3+JjtWs0rdPvqHvsKbo4TbO9CwbmdV1hXC0GiR5bA9ycRpdz1OsTxsoC4zrww
	DceVVpNvxdWUkrtMUEwvZ3LfW2/eI2axuxa1HT/+sErroZvWTNi7I7f+o/j/O4eV2w5CUemI8gE28
	H2Rnlvzax66DLPt1QqudAbqnr/fUzNK0Vp17kJV0I2IjMLODQ+eX7BSq6aC3p+3V77kqBWrLOzWEI
	POqfgKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpx1-0000000GnNv-0Wpl;
	Sat, 22 Mar 2025 03:55:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvpvL-0000000GnD7-0LbB;
	Sat, 22 Mar 2025 03:53:28 +0000
X-UUID: 3336e6ae06d111f083f2a1c9db70dae0-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AfrfhfiDwEWjqU6NksjAAip06PQ6+L5UfJG10TSad50=;
	b=Iys8WmcorP1MYkyCmD07ErnI/UWsfL8Aw03G5g97TlxMb0FEPF843yqIJIIL+/twmIxg3GaY96rhPwVTHPj+Cv61R1c9EVl7NZEHtFT399f+ToL3fQhQEBdKv8UfClJXuG0F0RHKCdby8jqgoB+wdAYOZHAwl6OiPjXLoWYLLKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4168d60d-32b1-471d-92a9-ef2664c61f7a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:41e06b4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3336e6ae06d111f083f2a1c9db70dae0-20250321
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 94866915; Fri, 21 Mar 2025 20:53:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 22 Mar 2025 11:53:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 22 Mar 2025 11:53:19 +0800
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
Subject: [PATCH v5 0/1] Add EINT support for multiple addresses
Date: Sat, 22 Mar 2025 11:52:27 +0800
Message-ID: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_205327_132473_50204DA1 
X-CRM114-Status: UNSURE (   7.34  )
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

v5 changes:
1)Upload common code and remove irrelevant ones
2)Add pin list to find eint number

v4 changes:
1)Add err statement for exception handling
2)Add check for invalid pins
3)Use defined eint pins

v3 changes:
1)Add error judgment

v2 changes:
1)Remove instance structure
2)Modify the way to obtain eint address

Hao Chang (1):
  pinctrl: mediatek: Add EINT support for multiple addresses

 drivers/pinctrl/mediatek/mtk-eint.c           | 313 +++++++++++-------
 drivers/pinctrl/mediatek/mtk-eint.h           |  23 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  37 ++-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 5 files changed, 254 insertions(+), 127 deletions(-)

-- 
2.46.0


