Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A585C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aFqx7rBqmhAKUDz1EoI12kISFmiMl1zSnR1/LjpxZQ=; b=PhbzsvO1lajcB7Jl3/iA8T0j0C
	K9mUUzuXxFlanbcNKwimryoXQTkSKCrNtwuwuiQBY8sRxgrl8EsjCSzxS9ZCfNvG0El6wsg9fRu+V
	VMKqECucucvfL5KSlKJ2mQTclpXynT3dAo/lqeW68m17QrnUsAwJbHouDt8kxUUVnxrl4vR33j1RB
	Ve1aqwCJHcRHrfLTIr0C0dnoxPh2QNZ4friQRXsjokl2iYwVb7MMzoYdgdrjBtxoR0NbjjzVqn9vl
	0FK6ucWIHBi8nqU/XdrzBVjifViR3PoLu22OLNoF3E6LX2AjcDu535tgn+lazG5Ghbj1zXiR1YWAZ
	UtDKs4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pu7-0000000ADNY-0i9G;
	Thu, 10 Apr 2025 11:17:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oZu-00000009zyF-3FrQ;
	Thu, 10 Apr 2025 09:52:13 +0000
X-UUID: 752df50a15f111f0a1e849db4cc18d44-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8aFqx7rBqmhAKUDz1EoI12kISFmiMl1zSnR1/LjpxZQ=;
	b=qVpx0/9ujT4wejx8Eup3Ts1ZQp7vwDUfTULzpdcRX6x/kAulk45sMSqERcQ7l6TUGGY7qv4QS6lGdTl2FAH2FvOQGWs1PfGEemxfynyJe4nC9TnjgwKkcGuOH3KBfgH3NDxQGzjRq23mkGIyJ/vlURAUqlIEtilDe7D8w4sNYDo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:403a1ad4-d384-4781-82f6-7523bc88a566,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:265c728d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 752df50a15f111f0a1e849db4cc18d44-20250410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 95452777; Thu, 10 Apr 2025 02:52:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 17:52:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 17:52:01 +0800
From: yiru zhang <yiru.zhang@mediatek.com>
To: <yiru.zhang@mediatek.com>
CC: <alexander.shishkin@linux.intel.com>,
	<angelogioacchino.delregno@collabora.com>, <coresight@lists.linaro.org>,
	<james.clark@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <mike.leach@linaro.org>, <suzuki.poulose@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] [Patch v3]Add ETE devarch condition in etm4_init_iomem_access
Date: Thu, 10 Apr 2025 17:51:58 +0800
Message-ID: <20250410095158.8966-1-yiru.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_025210_820291_4303B803 
X-CRM114-Status: UNSURE (   9.96  )
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

Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.

Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/

v1->v2: use switch case way
v2->v3: clean build warning
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..4002a2823fd0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1135,11 +1135,15 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
 	 * with MMIO. But we cannot touch the OSLK until we are
 	 * sure this is an ETM. So rely only on the TRCDEVARCH.
 	 */
-	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
-		pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
+	switch (devarch & ETM_DEVARCH_ID_MASK) {
+	case ETM_DEVARCH_ETMv4x_ARCH:
+	case ETM_DEVARCH_ETE_ARCH:
+		break;
+	default:
+		pr_warn_once("Unknown ETM architecture: 0x%lx\n",
+			     devarch & ETM_DEVARCH_ID_MASK);
 		return false;
 	}
-
 	drvdata->arch = etm_devarch_to_arch(devarch);
 	*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
 	return true;
-- 
2.46.0


