Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F118BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDykNvXLA1BKy9kn6LHhkusEVdd4zEA8zctKSoB6T54=; b=IkHVPMqqnXnM2C9iO/O/WiLY3f
	a/fErzY+gwXQVbIgsLkc8rNhHsBXQmdCfpUGCG7x/UJHXyPAoaUhqu60Ri3+31aCd07IZlaT3CQGy
	avm0eaKcE360CKpjOec1XzalMSpTKNazap/lnJ16rWQ1CmeNF8fkjt86U7XKKVSgne1hT1UpgTpuY
	DatCl54BoGxPzt8OQF4yMLm3QAzVhw/0h76HreCkF2n86aipT2lhqim3jv9RvUxDH6MgkhKff8vEu
	TX3Ukr8gp62oB7UMLskr9JZ7AEyyzGX2psLXG9I9wIcKyMPZ9vKHVB41gtap3bojrlTlz/qjdVqVm
	rHWW66Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLp-00000001BV2-2vcJ;
	Thu, 09 Jul 2026 06:35:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLh-00000001BOE-39sV;
	Thu, 09 Jul 2026 06:35:07 +0000
X-UUID: 4f57d2bc7b6011f1acbe4559397dec65-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lDykNvXLA1BKy9kn6LHhkusEVdd4zEA8zctKSoB6T54=;
	b=kSkOMtZAzGPAbUdYixpvmKMlq0IRQl+YoZFBGYTWBLA21b45rGxcgfVuH/NIT9E1WHY7g6ai8af5wuZDkm5UE8OAtB5QBmuPEXUmULllZChzozqtgOn8+00SvaCyED/XIcSJLy8xk6J2tsFa52DEWT8rbYMLECvUJSe3ChS/Uew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:0d8f946e-cd76-4bfb-afe8-bf459507a79e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:4b272f82-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4f57d2bc7b6011f1acbe4559397dec65-20260708
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1991754022; Wed, 08 Jul 2026 23:35:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 3/4] pinctrl: mediatek: mt7986: register both platform drivers from a single initcall
Date: Thu, 9 Jul 2026 14:33:48 +0800
Message-ID: <20260709063450.1615041-4-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233505_800990_837FFA44 
X-CRM114-Status: GOOD (  13.69  )
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

The MT7986 driver registers two separate platform drivers (mt7986a and
mt7986b) and used to call arch_initcall() twice, once for each.

This is fine while the driver is built-in, but a single translation unit
can only provide one module_init(). Since arch_initcall() expands to
module_init() when built as a module, having two of them would break the
module build with a redefinition of init_module()/__inittest().

Fold both platform drivers into a single driver array and register them
from one initcall using platform_register_drivers(), matching the shape of
the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
rolls back the first registration if the second one fails.

No functional change for built-in builds; this is a preparatory cleanup
for enabling module builds.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5dda4b7467fd..8dae91530d9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -997,15 +997,14 @@ static struct platform_driver mt7986b_pinctrl_driver = {
 	.probe = mt7986b_pinctrl_probe,
 };
 
-static int __init mt7986a_pinctrl_init(void)
-{
-	return platform_driver_register(&mt7986a_pinctrl_driver);
-}
+static struct platform_driver * const mt7986_pinctrl_drivers[] = {
+	&mt7986a_pinctrl_driver,
+	&mt7986b_pinctrl_driver,
+};
 
-static int __init mt7986b_pinctrl_init(void)
+static int __init mt7986_pinctrl_init(void)
 {
-	return platform_driver_register(&mt7986b_pinctrl_driver);
+	return platform_register_drivers(mt7986_pinctrl_drivers,
+					 ARRAY_SIZE(mt7986_pinctrl_drivers));
 }
-
-arch_initcall(mt7986a_pinctrl_init);
-arch_initcall(mt7986b_pinctrl_init);
+arch_initcall(mt7986_pinctrl_init);
-- 
2.45.2


