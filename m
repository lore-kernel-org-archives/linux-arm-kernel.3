Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32248E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+lD2AGoQOHJQMuemO8ngx0dfjm8w9IA4HJonYCdc9Yw=; b=ANMe0q8NDEfNlxEM94x7mQ4X4I
	s+MO5JFPjZOLQIGckG7LvArgq6rfOsF/GHsiaIrtMydj0Y1Iis92lyzhc5B7xceeRZjIiLp+zfEdI
	Cj9BIvla5vCDsyMAdJEi7GtyqVLXWX1VbzLxM/FVy1IpY/Z5VCqeE4pGDr59v+jz3hI6GttEseXi/
	HHphRJzD8cof8Pm714frmhvbD4qejEGocJwArS4KvJWcOj+Q6/+3c6mHOiqcsMUJj7BxFg5cBDDC7
	lHA4DMeLO2w2f4ljjIkZTLa2tr/hsK3FW918l8g2cmQWeD5m1hrufM4JpJQ3GfEYiIfCadMyq+Ws8
	CkERS4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTikr-0000000D7fk-1cdP;
	Fri, 03 Jan 2025 14:34:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTije-0000000D7WN-1WD1;
	Fri, 03 Jan 2025 14:33:11 +0000
X-UUID: a319cf38c9df11ef82ff63e91e7eb18c-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+lD2AGoQOHJQMuemO8ngx0dfjm8w9IA4HJonYCdc9Yw=;
	b=mLBMOF9UcTNKb6FYPHk5+X8ic1FLWUjd4OGPBRVF3FdQmDbeCi+sBAHq9JMzVgGSB3oN0iztnYOxH4lgY95mM/ScRlAB5j6aNCsTzwz6HSG6gQmv0JSIXac/iOKVLdzXiksiOkxBhzNZ6p3uwY336e3KgalBeZTMXUcQwInL0VY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:18c0042e-8d93-4dd2-9e6b-1bc2a8ac1364,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1b045237-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a319cf38c9df11ef82ff63e91e7eb18c-20250103
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 452498161; Fri, 03 Jan 2025 07:33:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 22:32:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 22:32:59 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<teddy.chen@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [v3,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 3 Jan 2025 22:32:33 +0800
Message-ID: <20250103143250.1521287-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_063310_407504_0003E504 
X-CRM114-Status: UNSURE (   7.55  )
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

This series is based on linux-next, tag: next-20241220

Changes in v3:

This patch removes the autosuspend functionality from the runtime 
PM operations in the I2C driver. These changes have been tested on 
the target platform and confirmed to work correctly without the 
autosuspend functionality.

Additionally, the patch resumes the I2C bus in mtk_i2c_resume_noirq() 
to fix the unbalanced disable issue.


Zoie Lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 75 +++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

-- 
2.45.2


