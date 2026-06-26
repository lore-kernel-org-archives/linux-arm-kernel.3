Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D3ACDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJvULiPc3bcuI0noJC4wmqj0mIvUdFy/Dpx18pXaIEk=; b=k8QKLqZls5KROu1rphzcBRVoEf
	J4EnIEImeiJLX5KJiRBNqQ0x352UJtvw9AQeq4/gcYjx9Xdc6L9DurtUiEFwOKi57Fts1IbegWg/N
	S8M7JsC0srVxHcKwuGTgBUPpJhsGVtFC8FfSMhWj2+f30nYVunyV69P7/C08IjE7dzPkJ3QQZjb0p
	brGn6F3LbRvW3vgSOv5yy3JVpu9kqIvIANnsEXKRjfqWNQ1TEbokdNrjU33uAXB2IzXIAHT59HSLf
	NMk1g29QYdGL5/RDEqZEQ195dZjQQxZeqJfqELCMt7hiKhEDL8+tDoRbGEJt15IOLT4UZnTumveOY
	8js9kVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxlW-0000000AR4g-1AbO;
	Fri, 26 Jun 2026 04:02:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxkw-0000000APOT-2miC;
	Fri, 26 Jun 2026 04:01:34 +0000
X-UUID: b15d1208711311f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iJvULiPc3bcuI0noJC4wmqj0mIvUdFy/Dpx18pXaIEk=;
	b=p7HfXQwZ19nP0usBVHlZNJlUzic/OQvY4WqM1C3tBQLHfM/aX6uHWRBLw8bZWjTS7lLfoq7ToKpMECNtw6Ke4mdozWu7ZHRx/XZhW6htoSA/B2NFpeIvKKls550/kDTRfQk+VoMJBuvePjzVxquvDkF26N6AWHZDBBTTNiv+vRo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:621fffbd-2c61-41ec-83c8-57b8a2a90b4b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:f01b8da5-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b15d1208711311f1acbe4559397dec65-20260625
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 969943862; Thu, 25 Jun 2026 21:01:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 12:01:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 12:01:17 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v4 16/32] pinctrl: mediatek: mt8365: Enable module build support
Date: Fri, 26 Jun 2026 12:00:45 +0800
Message-ID: <20260626040112.2436185-17-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626040112.2436185-1-justin.yeh@mediatek.com>
References: <20260626040112.2436185-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_210130_715819_3A97BCA3 
X-CRM114-Status: GOOD (  11.92  )
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

Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 73916437080e..5cbdb7d8597d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -293,7 +293,7 @@ config PINCTRL_MT8196
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8365
-	bool "MediaTek MT8365 pin control"
+	tristate "MediaTek MT8365 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index c20b9e2e02dd..3777cbac4c1c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -494,4 +494,5 @@ static int __init mtk_pinctrl_init(void)
 arch_initcall(mtk_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8365 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
-- 
2.45.2


