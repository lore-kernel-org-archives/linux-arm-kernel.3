Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DFCDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OvGKmbo6Ls5xAuTXCein36Ccwe4D0wJym5hMrgmoDs=; b=s58wkKJW+Je3D9Tmg1C1idDmLD
	aiAxmbg/X0oRvmNWOTDtGuCWyTUBh4KTfnCtwmk+8Qe/5a1s2JvDq9pvoMxTyhzLp2lxTAUwbQpYy
	uBG9tD416rN3nj3Q56ubyAFJ8Be9atnRxrpRSyQoum3bonC52MjkSA+n/RZTsP5/r8s+k7x3T5zuH
	m7vmX7AgBTIsWS7ddyg/gqlNJqEWbxByNAzeeRnN/VWFHSBFLZ6rrztJYi7iX+uv6FzJ6EUxuuDX8
	tb1YQIM+m/oAlNYUdaaq1iI8K2D5VRu5uM5r3DrfBuljbWRAQs9nPoh3zxXEl4ok1PVjC4JX89o/I
	OCtv2b5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvez-0000000AClc-1h0d;
	Fri, 26 Jun 2026 01:47:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvcr-0000000A9z8-0GXc;
	Fri, 26 Jun 2026 01:45:03 +0000
X-UUID: a220b4b0710011f1afed4741b24580c9-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8OvGKmbo6Ls5xAuTXCein36Ccwe4D0wJym5hMrgmoDs=;
	b=mmnBqK9XblRGam4nQ9TDDzkeI0R5O7ll0YrdknWJl2s6hRJJpkl8wnGYLYAO6aryVGSp0vtnvYMdiBz0e6lflc2WuYEuVxEFg8nOZ91AY/EHj3pWTFT+vbzpyH23sDjT8xmDY3jXSNNVLJg7tz5rCkwPQMO7Wa6NwODXCtD3DIE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:4482532b-810e-428a-ac9d-1da31b440283,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:a799dcfc-4e5b-4880-a751-e09c9abb260d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a220b4b0710011f1afed4741b24580c9-20260625
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641095209; Thu, 25 Jun 2026 18:44:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:50 +0800
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
Subject: [PATCH v3 28/32] pinctrl: mediatek: rt3883: Enable module build support
Date: Fri, 26 Jun 2026 09:44:27 +0800
Message-ID: <20260626014442.2378513-29-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_184501_172601_9415B9E3 
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
 drivers/pinctrl/mediatek/pinctrl-rt3883.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 5b0471b7e920..eb4bb7408f8d 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -83,7 +83,7 @@ config PINCTRL_RT305X
 	select PINCTRL_MTK_MTMIPS
 
 config PINCTRL_RT3883
-	bool "Ralink RT3883 pin control"
+	tristate "Ralink RT3883 pin control"
 	depends on SOC_RT3883 || COMPILE_TEST
 	depends on RALINK
 	default SOC_RT3883
diff --git a/drivers/pinctrl/mediatek/pinctrl-rt3883.c b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
index eeaf344c3647..b968b157817c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-rt3883.c
+++ b/drivers/pinctrl/mediatek/pinctrl-rt3883.c
@@ -106,3 +106,6 @@ static int __init rt3883_pinctrl_init(void)
 	return platform_driver_register(&rt3883_pinctrl_driver);
 }
 core_initcall_sync(rt3883_pinctrl_init);
+
+MODULE_DESCRIPTION("MediaTek RT3883 Pinctrl Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


