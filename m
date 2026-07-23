Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CB0C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAdnFvyfBKPaRzVFOl9q5U0tA2qKj/ZNso5TYX/8hMQ=; b=dMQ/JfUtBYqj36jOvIYWBCO0k8
	pYSDp7Sk6V1kyL0cooyp+K3TIfNh3xebMi3R/Bq3wi4kgboEkCx8dZGPAANWMaSpfbF4yCjVplLz6
	wdsNOM1E8jQinP6zX1ezJT+e8GzRMEhLM5AHJBGjEGGMMoeYT/b1M03ff5Z+QdyNtItnCsyHqSigO
	cdvp6Sl7AigC4FKf9QvOnCXRvyFV3Hij1/In9huQ2yba7HLrgyeS1OSleuVNBI70L5qiBkbzdKwsi
	hvg08KKnu6c6RlNr2C2cSVg8y6TRqL5FkFyalPNZGf7lgrXeG2dD6S/vwz6+4L5kgDfOeMeSDPDxF
	+DlEZ9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkZu-0000000DM9F-3aM9;
	Thu, 23 Jul 2026 03:58:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkZs-0000000DM7h-0HWl;
	Thu, 23 Jul 2026 03:58:33 +0000
X-UUID: c317930a864a11f1afed4741b24580c9-20260722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sAdnFvyfBKPaRzVFOl9q5U0tA2qKj/ZNso5TYX/8hMQ=;
	b=Cx4g5DSHDR6B9AD4a9FqOmnRzUeuefmBZCfP/mr2vupM5PrUiqhNebJrNyaZN5ogD/sQVMS3TNLhPc1d2QtElmCqleTLzRYciI9W1wCzt8d7dREuvnvpyS2fQAw4jgTTKiCt/7v9l55l4q8rD6YvV+A5NPE3yy1cI1vy0Sz0+P8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:591d9f83-929b-4a8b-b0a4-f325c4a37ca8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:399b0931-c234-4105-b2c8-ac1d356c64f7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c317930a864a11f1afed4741b24580c9-20260722
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 192141457; Wed, 22 Jul 2026 20:58:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Jul 2026 11:58:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Jul 2026 11:58:25 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v7 3/5] pinctrl: mediatek: allow common drivers to be built as modules
Date: Thu, 23 Jul 2026 11:58:14 +0800
Message-ID: <20260723035823.2041832-4-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260723035823.2041832-1-justin.yeh@mediatek.com>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_205832_126406_80EA6781 
X-CRM114-Status: GOOD (  17.67  )
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

The MediaTek SoC pinctrl drivers link against the shared implementations
in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
were built-in only: their Kconfig symbols were bool, they did not export
their entry points and they carried no MODULE_LICENSE().

To let the individual SoC drivers be built as loadable modules (required
for Android GKI + vendor_dlkm, where vendor drivers must live outside the
GKI vmlinux), the shared code they depend on has to be modular too.
Otherwise selecting a SoC driver as =m forces the common symbol to =y and
the resulting module fails to link against the unexported common entry
points.

Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
tristate, export the entry points used by the SoC drivers, and add
MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.

The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
never exported. It is called directly by SoC drivers such as mt7623, so
export it as well to keep those drivers linking once they are modular.

Rather than exporting these shared symbols into the global namespace,
export them in the "MTK_PINCTRL" symbol namespace with
EXPORT_SYMBOL_NS_GPL() so they are only visible to drivers that opt in.
Each SoC driver that uses them therefore declares
MODULE_IMPORT_NS("MTK_PINCTRL").

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig                 | 6 +++---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 5 +++++
 drivers/pinctrl/mediatek/pinctrl-mt2701.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7620.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7621.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt76x8.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mt8365.c        | 1 +
 drivers/pinctrl/mediatek/pinctrl-mt8516.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c    | 8 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtmips.c        | 4 ++++
 drivers/pinctrl/mediatek/pinctrl-rt2880.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-rt305x.c        | 2 ++
 drivers/pinctrl/mediatek/pinctrl-rt3883.c        | 2 ++
 26 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 97980cc28b9c..864e7ffc6044 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -11,7 +11,7 @@ config EINT_MTK
 	default PINCTRL_MTK_PARIS
 
 config PINCTRL_MTK
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -22,13 +22,13 @@ config PINCTRL_MTK_V2
 	tristate
 
 config PINCTRL_MTK_MTMIPS
-	bool
+	tristate
 	depends on RALINK
 	select PINMUX
 	select GENERIC_PINCONF
 
 config PINCTRL_MTK_MOORE
-	bool
+	tristate
 	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 38f15dbe9a28..fdfbe007b84f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 
 #include <linux/pinctrl/consumer.h>
 
@@ -743,3 +744,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(mtk_moore_pinctrl_probe, "MTK_PINCTRL");
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Moore");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
index 6b1c7122b0fb..d262f810e40b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
@@ -542,3 +542,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
index bb7394ae252b..aa8f9650c157 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
@@ -591,3 +591,5 @@ static int __init mtk_pinctrl_init(void)
 }
 
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 03d0f65d7bcc..be691edf3e65 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -59,3 +59,5 @@ static struct platform_driver mtk_pinctrl_driver = {
 };
 
 builtin_platform_driver(mtk_pinctrl_driver);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7620.c b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
index d2624b9b5bc4..e5d368530247 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7620.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7620.c
@@ -135,3 +135,5 @@ static int __init mt7620_pinctrl_init(void)
 	return platform_driver_register(&mt7620_pinctrl_driver);
 }
 core_initcall_sync(mt7620_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7621.c b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
index b18c1a47bbeb..b337936e5c18 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7621.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7621.c
@@ -115,3 +115,5 @@ static int __init mt7621_pinctrl_init(void)
 	return platform_driver_register(&mt7621_pinctrl_driver);
 }
 core_initcall_sync(mt7621_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index d5777889448a..38830f6dc5fd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -893,3 +893,5 @@ static int __init mt7622_pinctrl_init(void)
 	return platform_driver_register(&mt7622_pinctrl_driver);
 }
 arch_initcall(mt7622_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 69c06c2c0e21..a36124036daa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1440,3 +1440,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index cc0694881ac9..57868f73fce2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -449,3 +449,5 @@ static int __init mt7629_pinctrl_init(void)
 	return platform_driver_register(&mt7629_pinctrl_driver);
 }
 arch_initcall(mt7629_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
index 2bc8d4409ca2..9c064bf94935 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt76x8.c
@@ -247,3 +247,5 @@ static int __init mt76x8_pinctrl_init(void)
 	return platform_driver_register(&mt76x8_pinctrl_driver);
 }
 core_initcall_sync(mt76x8_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 22c8f2480346..69b16b01b4b3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -1058,3 +1058,5 @@ static int __init mt7981_pinctrl_init(void)
 	return platform_driver_register(&mt7981_pinctrl_driver);
 }
 arch_initcall(mt7981_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5dda4b7467fd..ca468115765b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -1009,3 +1009,5 @@ static int __init mt7986b_pinctrl_init(void)
 
 arch_initcall(mt7986a_pinctrl_init);
 arch_initcall(mt7986b_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index fd3a7ff0a04d..d90456c55c0b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1544,3 +1544,5 @@ static int __init mt7988_pinctrl_init(void)
 	return platform_driver_register(&mt7988_pinctrl_driver);
 }
 arch_initcall(mt7988_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index f5030a9ea40b..34d840c1cc6a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -307,3 +307,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 77c6ac464e86..635048f9d1f2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -336,3 +336,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index c812d614e9d4..3bd8288795e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -343,3 +343,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index b214deeafbf1..20dd324eb152 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -356,3 +356,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index c20b9e2e02dd..73849ae569c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -495,3 +495,4 @@ arch_initcall(mtk_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8365 Pinctrl Driver");
 MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index 68d6638e7f4b..62084d0cc4c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -343,3 +343,5 @@ static int __init mtk_pinctrl_init(void)
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
 arch_initcall(mtk_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..802f780120bf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -69,6 +69,7 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 
 	spin_unlock_irqrestore(&pctl->lock, flags);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_rmw, "MTK_PINCTRL");
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 				   const struct mtk_pin_desc *desc,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 791eddd7a2c6..1a977acd6883 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -7,6 +7,7 @@
 
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
@@ -190,6 +191,7 @@ int mtk_pconf_spec_set_ies_smt_range(struct regmap *regmap,
 	regmap_write(regmap, reg_addr, bit);
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(mtk_pconf_spec_set_ies_smt_range, "MTK_PINCTRL");
 
 static const struct mtk_pin_drv_grp *mtk_find_pin_drv_grp_by_pin(
 		struct mtk_pinctrl *pctl,  unsigned long pin) {
@@ -297,6 +299,7 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(mtk_pctrl_spec_pull_set_samereg, "MTK_PINCTRL");
 
 static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		unsigned int pin, bool enable, bool isup, unsigned int arg)
@@ -1149,6 +1152,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(mtk_pctrl_init, "MTK_PINCTRL");
 
 int mtk_pctrl_common_probe(struct platform_device *pdev)
 {
@@ -1160,3 +1164,7 @@ int mtk_pctrl_common_probe(struct platform_device *pdev)
 
 	return mtk_pctrl_init(pdev, data, NULL);
 }
+EXPORT_SYMBOL_NS_GPL(mtk_pctrl_common_probe, "MTK_PINCTRL");
+
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
index efd77b6c56a1..b2d7a79ff9cc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -349,3 +349,7 @@ int mtmips_pinctrl_init(struct platform_device *pdev,
 
 	return PTR_ERR_OR_ZERO(dev);
 }
+EXPORT_SYMBOL_NS_GPL(mtmips_pinctrl_init, "MTK_PINCTRL");
+
+MODULE_DESCRIPTION("MediaTek MIPS Pinctrl Common Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt2880.c b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
index e0366721a515..a9c4acdc6766 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt2880.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt2880.c
@@ -59,3 +59,5 @@ static int __init rt2880_pinctrl_init(void)
 	return platform_driver_register(&rt2880_pinctrl_driver);
 }
 core_initcall_sync(rt2880_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt305x.c b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
index 77bd4d1f6122..93788ec49ed0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt305x.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt305x.c
@@ -138,3 +138,5 @@ static int __init rt305x_pinctrl_init(void)
 	return platform_driver_register(&rt305x_pinctrl_driver);
 }
 core_initcall_sync(rt305x_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt3883.c b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
index eeaf344c3647..afe705a0ddf6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt3883.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
@@ -106,3 +106,5 @@ static int __init rt3883_pinctrl_init(void)
 	return platform_driver_register(&rt3883_pinctrl_driver);
 }
 core_initcall_sync(rt3883_pinctrl_init);
+
+MODULE_IMPORT_NS("MTK_PINCTRL");
-- 
2.45.2


