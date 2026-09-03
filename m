Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF5C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GyYjgTttZtjkAr8NAkvK68j3Vbwf6uVP9KCugF+tJnk=; b=ePoyshu/UB0cQYJq56uBN9dnjv
	mSiC9Kbi5YU/C8CnZC1W+4WVKCi0QyLHhXjwLo6zbpFfykYMJWjv5PQKDLVbh859pt6+v2erlWEAN
	bWjkJp4dsQH5EZj3dATdXJLaIBc6F04OVpby9OS/aZLA3gjRHrw2Z42pRrzHnCk9vqTCnqpQlH7BI
	DyeROFgilf2U1CPs6Un644KWpbgqHWyTeS//F20cBTFKiTmy4GrpWjRCtRy6fToMUKFyklP78AHjW
	n8uZZjmHeiAG+tIe7O/cNDmsi88aOi4PsDiWwLkYMu+CAhtko8X5Z5SfPrVeH8Dvg0F9IUBOFjgXO
	6k6k4Wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20pf-0000000GTqI-1c9G;
	Thu, 03 Sep 2026 06:21:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20pc-0000000GTpA-3EwP;
	Thu, 03 Sep 2026 06:21:53 +0000
X-UUID: bd9dc72ea75f11f1afed4741b24580c9-20260902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GyYjgTttZtjkAr8NAkvK68j3Vbwf6uVP9KCugF+tJnk=;
	b=GbUGAfXmU+37mZ4zAZWcMJXvHO/ChkE3eGs5p/rOkhG4TGA4dLZ33ta1Z0Hy7KuQLNu5C2RFQwX/wQl5vxUQxx72ICYbjRrKSm3AiGGEg6eakdWhvmCF1gK6aRozaMH8rinDHqZLHL4vSNIHvcgtd5GhFWu5dJJw4zMDCO7I37M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1cae8596-0564-4207-ba6e-f632967c8785,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ccbe6296-8382-4d0c-b42c-b0965a0d23b4,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bd9dc72ea75f11f1afed4741b24580c9-20260902
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2043446882; Wed, 02 Sep 2026 23:21:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 14:21:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 14:21:44 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
Date: Thu, 3 Sep 2026 14:21:24 +0800
Message-ID: <20260903062142.1025443-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_232152_829949_6100C420 
X-CRM114-Status: UNSURE (   9.81  )
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

MT8189 couples its GPU supply (buck_vgpu) with the GPU SRAM supply
(ldo_sram_gpu), which is exactly the GPU<->SRAM relationship this
coupler already handles for MT8183, MT8186, MT8188 and MT8192.

Register the coupler on MT8189 as well so that both supplies stay
voltage-balanced.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..1109e3d9a319 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -148,6 +148,7 @@ static int mediatek_regulator_coupler_init(void)
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
 	    !of_machine_is_compatible("mediatek,mt8188") &&
+	    !of_machine_is_compatible("mediatek,mt8189") &&
 	    !of_machine_is_compatible("mediatek,mt8192"))
 		return 0;
 
-- 
2.45.2


