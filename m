Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA6C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpH39SBux/FnTvU2Mj/izFWlhWacqOVNUYyzk61rexs=; b=ASBSh0FxC9v757kLEXixTAeWaP
	M0QNeo/L8kGf+jH85QaXAVXsiSx/w/MmkF/Fr/8b2GUT14Z6Gh2870Orh9gF3lbYcHbEbqkyzSiAc
	4OI82RykmT+NNCQ+RIUoVEXSU/2pyL4plKdhw65G05j/vFi8CkCZyQDLSAxLFGLrLM2yOkH4WAHmz
	zWFnaaXZaWjl9K+2fjkW2P+KjcgTZOOtnjImdajrYQh0fwT7VqrtB2u9fOZyzoMUiSoTuAgpVVYu1
	8mpzZJ0NC5mA0NkOwbaJdL/jt83Q12/hUZNzo7UnndfKogIG1emRf7Xzpxn7XtxOTwSnsVJ3eAXkJ
	D76PzM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRfO-00000003p2h-0XWZ;
	Fri, 23 May 2025 12:38:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQh8-00000003imt-3Afg;
	Fri, 23 May 2025 11:36:11 +0000
X-UUID: 1cef268e37ca11f0bed96b30c12bc3d6-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bpH39SBux/FnTvU2Mj/izFWlhWacqOVNUYyzk61rexs=;
	b=a7fis9FRrkmHg6cxiVXIDFOphGPXDIcxhvHWITARDHzV/QOkHFIHTOu29gvhD8o6vA2WE+utiCO7b/XQpLfiDgnUW6/L9ENMZeV23ZNJJ7iNQx2YYWHTFRyr+nb+wer9PEuLrMbzIobRFLLaf6xJMnLUP8GeaSQ3qkGBgU4u+/w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7f3e36b7-1c48-4273-9c58-e1ccf403c737,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:065a0a59-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1cef268e37ca11f0bed96b30c12bc3d6-20250523
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1949595820; Fri, 23 May 2025 04:36:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 19:36:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 19:36:01 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Sky Huang <skylake.huang@mediatek.com>
Subject: [PATCH net-next 0/2] Add LED support/fix to MediaTek 2.5Gphy & Gphy
Date: Fri, 23 May 2025 19:35:59 +0800
Message-ID: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_043610_812986_54EA85AF 
X-CRM114-Status: UNSURE (   9.08  )
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

From: Sky Huang <skylake.huang@mediatek.com>

This patchset adds LED support to MediaTek's built-in 2.5G phy, which
basically hooks the same helper function with built-in Gphy. Also, fix
LED behavior when blinking(delay_on & delay_off are both zero) is not set.

Sky Huang (2):
  net: phy: mtk-2p5ge: Add LED support for MT7988
  net: phy: mtk-ge-soc: Fix LED behavior if blinking is not set.

 drivers/net/phy/mediatek/mtk-2p5ge.c  | 104 ++++++++++++++++++++++++--
 drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
 2 files changed, 103 insertions(+), 8 deletions(-)

-- 
2.45.2


