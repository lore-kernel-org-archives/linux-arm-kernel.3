Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C4DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS8V8ziuaxkBUDx/2DlbKXIeghTQAJCLrGlXNV6o3Rs=; b=G8rQrvUMLMfWWiLlY91oYHQ7VG
	aqkLtGQoMFgF5NKPnheOqJooJ29o36YsvLM433Zqa/8UUWpzFpHyHvA6vyT3jM7XHD+6Zrc6YJhGl
	YO1YByzsxzAOY4zuweFq97TwreE37AtpeoBWlTB4p+eQt51UStW4Piorq6m6VH2khEsyxVh5h0GHO
	sBU/Jh+zwNCsPuU/rPI78SR8lrUapTjtX/dZ6eamRCLNn0BikcofK5poblk75ocKfhQVkEfQQG4Fd
	4bDDbqDXhAdSxPLl8exGKi1B0eUvKNhuDFSC7K/aDFxfswbHQxcYNb6fh+Yl5Qk3pXCrHBNVqLBfv
	IkhO+gBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdts-0000000EGUV-0Sln;
	Wed, 03 Jun 2026 05:12:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdtq-0000000EGTO-23eB;
	Wed, 03 Jun 2026 05:12:19 +0000
X-UUID: c566b6f25f0a11f1acbe4559397dec65-20260602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cS8V8ziuaxkBUDx/2DlbKXIeghTQAJCLrGlXNV6o3Rs=;
	b=tBuDQFBO/gKGko2nULUbnoJ4mH8NUmMM4ClCURfICFG3ixOGb6h/v5j6nehbj0uymU5eFGSEEFF85xpfrG+ySrkDQ0bQaO1vYMf2fem1F8IRNaSR17y0Yx5a2pxmvz21rALKRkE4vrer2sMUXarMnwIGTWoyFaia66QW6nzdTzA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:2c75db20-d79a-4dd5-8a7d-7582445f1647,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:659c103a-e7d9-4151-8ec1-5d8278df2039,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c566b6f25f0a11f1acbe4559397dec65-20260602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246735547; Tue, 02 Jun 2026 22:12:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 13:12:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 13:12:06 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 1/2] pmdomain: mediatek: Convert MTK_SCPSYS to tristate
Date: Wed, 3 Jun 2026 13:11:50 +0800
Message-ID: <20260603051200.1163226-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260603051200.1163226-1-justin.yeh@mediatek.com>
References: <20260603051200.1163226-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_221218_543295_B56EE18A 
X-CRM114-Status: GOOD (  13.97  )
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

Convert CONFIG_MTK_SCPSYS from bool to tristate to support building
as a loadable module for GKI compliance.

This change allows MTK_SCPSYS to be built as:
- CONFIG_MTK_SCPSYS=y: built-in (traditional approach)
- CONFIG_MTK_SCPSYS=m: module (GKI/vendor_dlkm approach)
- CONFIG_MTK_SCPSYS is not set: disabled

The tristate option is the standard kernel pattern for drivers that
need to support both built-in and modular configurations without
requiring separate Kconfig options.

This aligns common/staging with the equivalent change in
private/desktop-google, ensuring consistent configuration across
both kernel trees.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pmdomain/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index 8923e6516441..bf5108ba360a 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -4,7 +4,7 @@ menu "MediaTek PM Domains"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 
 config MTK_SCPSYS
-	bool "MediaTek SCPSYS Support"
+	tristate "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
 	depends on OF
 	select REGMAP
-- 
2.45.2


