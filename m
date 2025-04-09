Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DAAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 03:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ldIfw+IopvBD+8WtZqHSYb8hrJIJMbhoye5hb+79cI=; b=HKogcNNEsz3L/W1Px2nhDqGJyz
	iytiTXKMTg+aHxTG5+XDg2pszp92VyAjkgmx0v+gGhWOAroIZ6904IfBoXfeSY2nubfcQAgeJEU+x
	b4kL2q4FnMmUb/3SaAsedc4qZVcQuP9snJ6xtP0p7fRc8gzBiPpB6G+yWwdyfvldvMnIAEHFMqNwA
	PwzCg/AQtDy6x5wkTxfVl4z8DUY7boiUt1DIzE/6nD3do/0bXMBsON8KRU/8HDkLEwC7Bk82Xz75H
	lMSkWH1P83rDOGzQWa3v8xGSuk540JS+B1siT8r+8/MRj+QRsoiejU9LWf55yJQIXZ7D5Jfjjx3bX
	5yVo0TZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2M9j-000000061bX-2UDw;
	Wed, 09 Apr 2025 03:31:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2M7x-000000061Rg-0BKd;
	Wed, 09 Apr 2025 03:29:26 +0000
X-UUID: d460181414f211f0a1e849db4cc18d44-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/ldIfw+IopvBD+8WtZqHSYb8hrJIJMbhoye5hb+79cI=;
	b=J0/TFlWoPiF7AcKLYkuJgpkA7U0DRzQd+w/yx3GdBK2A9QeeKJfz6ptT07OHix7+DwxatVwqvpmjlfHk8KkUClIIDsI+f7tUrj19eFVGjpWYI3ck/oIRWFt/2jnPBn4/WMin4U6BjboEe0hJ6TYNFupbSPicpDtk8Ma5aqOLj1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:97d5e442-f3dd-482d-8860-fbf53b9d449c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:651d59c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d460181414f211f0a1e849db4cc18d44-20250408
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 794477129; Tue, 08 Apr 2025 20:29:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 11:29:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 11:29:19 +0800
From: yiru zhang <yiru.zhang@mediatek.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, yiru
 zhang <yiru.zhang@mediatek.com>
Subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
Date: Wed, 9 Apr 2025 11:29:12 +0800
Message-ID: <20250409032917.7580-1-yiru.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_202925_094444_139C3869 
X-CRM114-Status: GOOD (  10.55  )
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

v1->v2: use switch case way
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..366d11e038de 100644
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
+		pr_warn_once("Unknown ETM architecture: %x\n",
+			     devarch & ETM_DEVARCH_ID_MASK);
 		return false;
 	}
-
 	drvdata->arch = etm_devarch_to_arch(devarch);
 	*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
 	return true;
-- 
2.46.0


