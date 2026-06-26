Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE377CDE013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mrv3LvXoXyqKr4+lfMCVjqKEXwfKMoyXQWtEboeEayg=; b=awKMRWItUknVt1/LKEmFO8X5j9
	NJ+TOqAPP6lF5zGDFzurQ4lZdAEx+9GVra0cNG5auaflFh0ElEt0pIRQtj4vJgd/LVJ+ysb/MR2RG
	pO4R8GvKkM/QHOokuAr+nYZQJOzAbfiZTwlLMvgnfUtxT9Zf8rt73n63AIn3tbs13FY8oxlfXXuVn
	F3/rmbfVDZd+RPxuYMm3zCapZvUfjSeXcjdmmOylir6Q0n9rbLVGQYxlSuYtBwDbBkaScZqEMVClC
	8g4wOuppkLypodVqqk3FEG+BP7fYvY21iJLlLNaznEdbNH+iJ+CzxEW5VdkwdH/vDUM8fGhKRWV9u
	vAiWtZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvcq-0000000AA9q-0h24;
	Fri, 26 Jun 2026 01:45:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvci-0000000A9z6-1yQm;
	Fri, 26 Jun 2026 01:44:54 +0000
X-UUID: 9ecc20ec710011f1acbe4559397dec65-20260625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Mrv3LvXoXyqKr4+lfMCVjqKEXwfKMoyXQWtEboeEayg=;
	b=PPXqhH652/djNy0vj2h1X+TjBSIw+DtWBYogJhqwK5E1uKDl7Sit4RgdNd/5d4/semQjPqrJB4v+YKnJWcqhsAT1qCsSLj+QvnGkx61rTrZOE8KnEuUXdBFIdsGthN92VUJxGRc0u5u8TrpQk+EtXkt6CYZVzuWMKrDwa9qwB2w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:81668253-f722-4e33-a123-0440d5f8551d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:cfe6a8a3-9384-4ef7-91b2-7b787d9b8841,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ecc20ec710011f1acbe4559397dec65-20260625
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 277742771; Thu, 25 Jun 2026 18:44:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 09:44:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 09:44:47 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v3 12/32] pinctrl: mediatek: mt8188: Enable module build support
Date: Fri, 26 Jun 2026 09:44:11 +0800
Message-ID: <20260626014442.2378513-13-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626014442.2378513-1-justin.yeh@mediatek.com>
References: <20260626014442.2378513-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_184452_518478_F007D2E2 
X-CRM114-Status: GOOD (  11.56  )
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

Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig          | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt8188.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 5290fa55ed68..ccf1690b6092 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -243,7 +243,7 @@ config PINCTRL_MT8186
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8188
-	bool "MediaTek MT8188 pin control"
+	tristate "MediaTek MT8188 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
 	default ARM64 && ARCH_MEDIATEK
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8188.c b/drivers/pinctrl/mediatek/pinctrl-mt8188.c
index 3975e99d9cf4..ff84bba7334c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8188.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8188.c
@@ -1671,3 +1671,4 @@ static int __init mt8188_pinctrl_init(void)
 arch_initcall(mt8188_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8188 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


