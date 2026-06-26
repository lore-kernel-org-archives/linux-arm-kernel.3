Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D21CCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 06:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT/gREoI9UWx4EtKfYrsTwzMHMvNzTxiKNGD+ErFAs8=; b=3tokKDG+Y0wwrsR52mo+EUyR7a
	jl+WVjAnpdbqIlFtlHIE4Qm/dud2hqSQnvVzjmrvBYT6RNEHY3+29XXaVQdeDdz/caHgfGj1Exzrq
	yFAT1Fx5/qy1HJ/hPPdgQu267aJWBQmVm3aRBq1h4Gd8sk8EvFTJakAifIhIFB1xg913aywkcq+yX
	jGs7QReYR3bSkBH3L3jz7JuNJZsHK85kaV412/Lo9zg/IJXE5Wvu3MDuDyRJHsL0ZRvODBHFWDtXn
	fw0ylPTAhvl+iNDiYZ25LuYlWZrtGgIEDtFDokqRAI8SPj4jIqIgmDSVjwNQZxWTAjpfcakfkT8p6
	Lqn+Utxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxky-0000000APUh-1hkN;
	Fri, 26 Jun 2026 04:01:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxkp-0000000APHs-322q;
	Fri, 26 Jun 2026 04:01:25 +0000
X-UUID: aecead1c711311f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FT/gREoI9UWx4EtKfYrsTwzMHMvNzTxiKNGD+ErFAs8=;
	b=rJ62figLAPN/Ll2ZEbXxf0x2DyKx3R3w9WEeBFnZQmzDkS916GNdIZ0utFrAa6lmFwDRoETQtF8MR91kUAxhRRcTp5tvapC14VoXaowUWMt6vLvMgV4oC3SN0kRJUk1l4raxnLN8rUsjqLXfNpezEz7yd9qMgGycNEt8hE2Hi+I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:844aa4dc-1763-4f19-8bd7-aa491dd94586,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:5fd8f866-eeb4-4f3b-8eb9-dd434ebf4301,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aecead1c711311f1acbe4559397dec65-20260625
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1201869359; Thu, 25 Jun 2026 21:01:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 01/32] pinctrl: mediatek: mt8189: Enable module build support
Date: Fri, 26 Jun 2026 12:00:30 +0800
Message-ID: <20260626040112.2436185-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_210123_765575_A3D5D2CE 
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

Add MODULE_LICENSE("GPL v2") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 97980cc28b9c..e79139700d72 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -255,7 +255,7 @@ config PINCTRL_MT8188
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8189
-        bool "MediaTek MT8189 pin control"
+        tristate "MediaTek MT8189 pin control"
         depends on OF
         depends on ARM64 || COMPILE_TEST
         default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index cd4cdff309a1..a9c128c514a4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1696,3 +1696,4 @@ static int __init mt8189_pinctrl_init(void)
 arch_initcall(mt8189_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8189 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


