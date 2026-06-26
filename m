Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D892CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjqfeTmWPsggsahVmMy11eovM3auUgn254uYeywRdfU=; b=aPVpSkwoHlJ9sef4DleWzS5hJJ
	tt8C2JfuAlyGHS96fCtSw+DKqi52ggkndI5NzUNBBGr88NEXqHvG+sAihW4GSIQOo5wxKlktHNOev
	o9tLBA18Ds8avTyFbbvVpHIspmT5gcrm1onthocCwz1p3967cuGscxlZRhnHBjZbVV7wAmddTD9Mc
	3KFNc1unCjqVaHoxn4hCe9wFm7WOH+OIJON9+K80hWNuOmdxWGdyP2VtIjoaZfTUMVy5dbbckuO/Q
	2ETJf7ri5x1UlXu+MLGD6XZ2xFek5JI9veDjbtHWIvfkJn1jwqijbH8vJwsmJOL/mIR1Kv8XzH3Cb
	g8zg21hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcveu-0000000ACfJ-0kSj;
	Fri, 26 Jun 2026 01:47:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvcq-0000000A9zl-3vmA;
	Fri, 26 Jun 2026 01:45:03 +0000
X-UUID: 9ff5bc08710011f1afed4741b24580c9-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mjqfeTmWPsggsahVmMy11eovM3auUgn254uYeywRdfU=;
	b=H66mi0AJx/UYpNES5DuEdHhs3CYwOYmQqlPHGSetie+ZVA5pNW7VB6qLiRhW4WAv8aRrvW5O8MNADtojfM1WYbhEzcPU+pMcODPo8kksBakg1fu+EkMc+o7JjgydKU4cD31CsZzabDcuUeJyk85T9BLOARlXmFAT1tltHZhEZhg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:46ebd77a-f71a-4f5c-94ff-45089e320e01,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:4026baf7-0b89-48e7-aff3-7b92a9556644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ff5bc08710011f1afed4741b24580c9-20260625
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 591999654; Thu, 25 Jun 2026 18:44:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:49 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 25/32] pinctrl: mediatek: mt76x8: Enable module build support
Date: Fri, 26 Jun 2026 09:44:24 +0800
Message-ID: <20260626014442.2378513-26-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_184501_021969_AB56D343 
X-CRM114-Status: GOOD (  11.13  )
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

Add MODULE_LICENSE("GPL") macro and change Kconfig option from
bool to tristate to allow building as a loadable kernel module.

This is required for Android GKI + vendor_dlkm deployments where
vendor-specific drivers must be kept separate from the GKI vmlinux.

Fixes: dc6ae2057c9c ("pinctrl: ralink: move to mediatek as mtmips")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 5b762dbc10dc..19593279109d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -62,7 +62,7 @@ config PINCTRL_MT7621
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_MT76X8
-	bool "MediaTek MT76X8 pin control"
+	tristate "MediaTek MT76X8 pin control"
 	depends on SOC_MT7620 || COMPILE_TEST
 	depends on RALINK
 	default SOC_MT7620
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
index 2bc8d4409ca2..d4f8f9a200e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
@@ -247,3 +247,6 @@ static int __init mt76x8_pinctrl_init(void)
 	return platform_driver_register(&mt76x8_pinctrl_driver);
 }
 core_initcall_sync(mt76x8_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek MT76X8 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


