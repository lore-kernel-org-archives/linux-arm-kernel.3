Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD01C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eSHmQM8NATK6SZ+a/IRk6MOrqMnMNmxZlWOSIrLuWAw=; b=AZ37/ELLLpuu8jv1nHEwNRgcjc
	9qH5KWL9Upib4gdz/3A1jBGXPI/JLN8H0Bep6uYL9g2wfiJRGR5rqMxWB4p/uxWd7OcuRwqCELgmJ
	TrcNMOfDCI4uzA3IhzMZTbVjwSQXqsZ1CqmZQCbfg8R6gTIuK47aP16AAqM7fT6GrLZru8JAkx7i2
	bqC1PqxDQVo78AXGA8kzHrz4H7+ef00tO0OwPTtKqVya90uah8uJtsUkdkDui0dgYpQN5en+M6yu2
	d31kdoa/BJPwgx08/cj1rS2QOm72wPFNsK0jfTkw9R97DSR1AagWcRFDnHRkzzVfr8H7JMXMsMRnM
	jRgeCEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEbY-0000000DXMX-09Dv;
	Thu, 16 Jan 2025 01:23:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEaH-0000000DXBs-3eLa;
	Thu, 16 Jan 2025 01:22:10 +0000
X-UUID: 4aafc320d3a811ef9048ed6ed365623b-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eSHmQM8NATK6SZ+a/IRk6MOrqMnMNmxZlWOSIrLuWAw=;
	b=TJPeFUJyRE3CSIis570PGm9UUWgBBlSpSYSrpOBnFhsrus2ODSILJ6lxTwN6EZqSSvUqzTIkvsY2d7kpZcEf+LP2adTN3WwxFRD5OguSY7oTZ64uwMs3ecbrr8zdsBK75hkY3+DzwjMaQ8FviR0LT4kWNLnBi4NRlA4PEFYBFfg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f865b730-5703-4b62-870f-8ce41314a508,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:5f90f337-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1|19,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4aafc320d3a811ef9048ed6ed365623b-20250115
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 687432178; Wed, 15 Jan 2025 18:22:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 09:22:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 09:22:00 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Simon
 Horman" <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next 0/3] net: phy: mediatek: Add token-ring ops
Date: Thu, 16 Jan 2025 09:21:55 +0800
Message-ID: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_172209_913581_F17BF605 
X-CRM114-Status: GOOD (  10.37  )
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

This patchset add token-ring ops and moves some macros from mtk-ge.c
into mtk-phy-lib.c. Also, MediaTek's built-in 2.5Gphy driver is added.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
Sky Huang (2):
  net: phy: mediatek: Move some macros to phy-lib for later use
  net: phy: mediatek: add driver for built-in 2.5G ethernet PHY on
    MT7988

SkyLake.Huang (1):
  net: phy: mediatek: Add token ring access helper functions in
    mtk-phy-lib

 MAINTAINERS                            |   1 +
 drivers/net/phy/mediatek/Kconfig       |  11 +
 drivers/net/phy/mediatek/Makefile      |   1 +
 drivers/net/phy/mediatek/mtk-2p5ge.c   | 343 +++++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c  | 297 +++++++++++++--------
 drivers/net/phy/mediatek/mtk-ge.c      |  78 ++++--
 drivers/net/phy/mediatek/mtk-phy-lib.c |  91 +++++++
 drivers/net/phy/mediatek/mtk.h         |  17 ++
 8 files changed, 714 insertions(+), 125 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c

-- 
2.45.2


