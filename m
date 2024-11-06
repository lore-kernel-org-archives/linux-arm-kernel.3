Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0FFD44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VNbbyybsVA/llgCiGv5B8aYzpYH2qcy9VUJy2qkKAvI=; b=a7q+FuDLx/N/MSKxcG66iPrtn0
	czfkgY3PPqxGwqiRuMNhvQpr6844WseR0084fU2WpHvTdbqH52VCub+2jUt2mUfnO9cLwlNF6btLU
	Ykdlg/5qLtNwoXPcmEbBeNHk1hZKk/FufLQoJYKquWKBVMtBZlguSmSxhCWsm34FOhwbYGwU7hGQe
	6Lt31WAjXvxkRGr2WTcALbu4D0tGUs7Xxt1iPbcygPvDldGyzXn5CYDnFy7+zJbBWVyUefvNGNAuu
	Ad8jQKWK+I5JbsZUyNgu/Bhk7HovoejprxPWrSaPk1KEMEWrnkME473wzELXh17DL6aTjEFpHMciT
	8eLPz8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g3c-00000003PlI-1aWa;
	Wed, 06 Nov 2024 13:26:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fYE-00000003K9m-30UK;
	Wed, 06 Nov 2024 12:54:23 +0000
X-UUID: 3966e78e9c3e11ef82ff63e91e7eb18c-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VNbbyybsVA/llgCiGv5B8aYzpYH2qcy9VUJy2qkKAvI=;
	b=HrN2wRySArCax9B4WRxPC50Y0jYLn4tFx8FR9eemNVCTzDrsKEdWOaNGaMZOnBIF4BuIMVzXomXGficksnXh5rB1kCCF68MtFXW4C3nSuYckrlkhJdWKbg7bxaiqbEqnSAKGYUhd9r2xZSHwHbSUF7AzmMoADlYzEBccb+2Enpg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:0b68642b-f88d-4a8e-8dd6-c3fda3a43a14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b24eb81b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3966e78e9c3e11ef82ff63e91e7eb18c-20241106
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2031945666; Wed, 06 Nov 2024 05:54:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 20:54:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 20:54:09 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [v2,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Wed, 6 Nov 2024 20:52:11 +0800
Message-ID: <20241106125212.27362-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.028600-8.000000
X-TMASE-MatchedRID: jUWJaIY8sEkfbciQjfRltRC41kTKJMKFYoHH/gi0K9v8rSaNLblw6nWC
	d6QvVzbeE1RLTRi8AtKQYj0iYjwwnf16VZJq9bHXM8XTtgUzttN9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8prJP8FBOIaQDrrEUSMSmZGNW3Yd29bnG18/yTfVZRoc/Od1SdTsJ9Xz+
	9mseNN8R4L76ik4lwFRyQrl51F0DySbb/RKI1CTBxYxYG29kEALeu9/Cix+Fl0BNB20+SxH7f8m
	JY57oZddJaBDYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.028600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0CA8BD2969729531D72666269D686E64A92A1F7F1D4AD7EFAB7583DA1ADD897F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_045422_785176_064B6545 
X-CRM114-Status: UNSURE (   7.41  )
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

This series is based on linux-next, tag: next-20241105

Changes in v2:
- author name modification
- replacement of pm runtime API
- removal of redundant error messages
- return value adjustment
- add runtime pm status check

The delay before runtime_put_autosuspend() actually executes 
mtk_i2c_runtime_suspend() depends on the frequency of I2C usage by the 
devices attached to this bus. A 1000ms delay is a balanced value for 
latency and power metrics based on the MTK platform.

Zoie Lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 12 deletions(-)

-- 
2.45.2


