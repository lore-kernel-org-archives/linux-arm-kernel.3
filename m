Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AECCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvl7IGRSO0uo+BOHssp3leKmVgpjzIAZO/denB7xxyw=; b=QGyarNjUlFDnkju8a+8Jsu9Hq6
	HJUuRHt1H4S3/26G3C3+BAUOdxDUqvf+QlphonOU73b23VfWs/H/aUdst1NTOQUu39+iDqBUkWhgU
	UbpTS0hsc8ob+nfEmsREwo+gROE/uK1gWwbfGHBjGpY61zdRu3gfGrUBHgPrCGfi68fn0FvKYJPsO
	VzYkYZJoqTGmSMCKCT/pw7pQqfWhxi4G2Cf32M2cE+DznEKMcWkNBVxytL4P3py+j697FvP8xYPwC
	I2Q/3tRXmjutYmUQrC3PYk79Pb9YLAk3nNXAE5qc0H39M4TK8xn7wH3RksKBL8+Oz8/aFKpCcHDoM
	IMTMc8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdtu-0000000EGVq-1q5b;
	Wed, 03 Jun 2026 05:12:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdtq-0000000EGTP-46KI;
	Wed, 03 Jun 2026 05:12:20 +0000
X-UUID: c57734e65f0a11f1acbe4559397dec65-20260602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xvl7IGRSO0uo+BOHssp3leKmVgpjzIAZO/denB7xxyw=;
	b=ehIDNPriy8IwCfVjYdUIcAzXBT5EAMibeHnqhuGXnxdYS+xf+/UChdSLfUgrXBAmH4JiGl75AJyMl1Zu4DeH8h/NgCqaZ84YJdflEGgIlkLp1071cn5i88nLhDU6S3owb6azRUzd3n6AlcmoilYdVePGywOuMSQ9Jd3bzdbNJsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:363238f0-95ac-4f60-b58d-3e429371e2c0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:e9a17a96-4b61-4e8e-8981-a884a95e9126,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c57734e65f0a11f1acbe4559397dec65-20260602
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1745347544; Tue, 02 Jun 2026 22:12:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH 2/2] pmdomain: mediatek: Add MODULE_DESCRIPTION to mtk-scpsys
Date: Wed, 3 Jun 2026 13:11:51 +0800
Message-ID: <20260603051200.1163226-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260603051200.1163226-1-justin.yeh@mediatek.com>
References: <20260603051200.1163226-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_221219_017974_18F7CD2F 
X-CRM114-Status: GOOD (  12.72  )
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

Kernel modpost in v6.x emits a warning when a module is missing
MODULE_DESCRIPTION():

  WARNING: modpost: missing MODULE_DESCRIPTION() in mtk-scpsys.o

Add MODULE_DESCRIPTION() to mtk-scpsys.c to silence the warning.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index efc8f276ffce..bfaa6c8f88dc 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -1151,4 +1151,7 @@ static struct platform_driver scpsys_drv = {
 		.of_match_table = of_scpsys_match_tbl,
 	},
 };
-builtin_platform_driver(scpsys_drv);
+
+module_platform_driver(scpsys_drv);
+MODULE_DESCRIPTION("MediaTek SCPSYS power domain driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


