Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AD7D0E6C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNOIyqsndGQOXXdpVgh65LPrGWqk+xJmkNe4l+FKetE=; b=rb9WFdL79xz4APiwmcMa4/tjjB
	maG0+8+gSAxReGTMJO3Abqe/HnlOphy6dkCzE4qh9goOO6P1ka6XXaoz4iIdBcPUEAtZCY9fV5nLW
	6RgLg4Uu3s7Mi+08Zt8TLgqBfnLkuNzKRKUd7s6XU/NWUrSyTSdKrqBQtLN4sYsqn2CINwBXvFMi4
	nUNrN1OLE9nDaIV7ImgodUEMcMaxAOJjWMriqZ9IApCISdP0kiGCSOvzlVL70orE/OC2P9lcXQW0i
	gR1QfwD2mJIJULfXdwop7Fd6Qd5s9TvjjA7JtXA/dmWZDz8rX4piWXufDksQmHDo2SgBqvgZpw/Ag
	3FDSfK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqj7-0000000DA8e-28i8;
	Tue, 25 Nov 2025 10:56:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqiz-0000000DA4d-10Jk;
	Tue, 25 Nov 2025 10:56:46 +0000
X-UUID: 6b717d1ac9ed11f09f706fa2197c6ceb-20251125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gNOIyqsndGQOXXdpVgh65LPrGWqk+xJmkNe4l+FKetE=;
	b=fbBITHrh7PPruvSZW+R2GOSa1nWUZDmhM9H0YXlRXxsK/B0y68vDurjFinFEf0jdcM3fIokzEFZAOkq9gJXOYJpXvIRfrYiCPx/+XJd5HfwaGisrsjAlYcqfDY13dhGHzehUQscfTYlw1GSri7yLxsbQyqm+1+eszATyKP5GkAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:05ac54d7-4ac0-4b0b-acfb-d2d4f42aa63d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d4be0783-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b717d1ac9ed11f09f706fa2197c6ceb-20251125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 299024937; Tue, 25 Nov 2025 03:56:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 18:56:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 18:56:36 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Weiyi Lu <Weiyi.Lu@mediatek.com>, Jian Hui Lee
	<jianhui.lee@canonical.com>, Irving-CH Lin <Irving-CH.Lin@mediatek.com>,
	<conor@kernel.org>, <krzk@kernel.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, Bear Wang <bear.wang@mediatek.com>,
	"Pablo Sun" <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] pmdomains: mtk-pm-domains: improve spinlock recursion fix in probe
Date: Tue, 25 Nov 2025 18:56:17 +0800
Message-ID: <20251125105617.1564725-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_025645_333522_AD80B9F7 
X-CRM114-Status: GOOD (  11.79  )
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

Remove scpsys_get_legacy_regmap() and update usages with
of_find_node_with_property(). Use an explicit of_node_get(np) to ensure
correct node referencing against of_node_put() and ensuring it is called
in a safe context (i.e., not while holding devtree_lock).

If fwnode_count_parents() obtains parent nodes via
fwnode_for_each_parent_node() and this process requires device tree
operations, it may result in repeated acquisition of devtree_lock in
the same thread/context, leading to spinlock recursion errors.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 80561d27f2b2..f64f24d520dd 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -984,18 +984,6 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 	}
 }
 
-static struct device_node *scpsys_get_legacy_regmap(struct device_node *np, const char *pn)
-{
-	struct device_node *local_node;
-
-	for_each_child_of_node(np, local_node) {
-		if (of_property_present(local_node, pn))
-			return local_node;
-	}
-
-	return NULL;
-}
-
 static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *scpsys)
 {
 	const u8 bp_blocks[3] = {
@@ -1017,7 +1005,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 	 * this makes it then possible to allocate the array of bus_prot
 	 * regmaps and convert all to the new style handling.
 	 */
-	node = scpsys_get_legacy_regmap(np, "mediatek,infracfg");
+	of_node_get(np);
+	node = of_find_node_with_property(np, "mediatek,infracfg");
 	if (node) {
 		regmap[0] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
 		of_node_put(node);
@@ -1030,7 +1019,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 		regmap[0] = NULL;
 	}
 
-	node = scpsys_get_legacy_regmap(np, "mediatek,smi");
+	of_node_get(np);
+	node = of_find_node_with_property(np, "mediatek,smi");
 	if (node) {
 		smi_np = of_parse_phandle(node, "mediatek,smi", 0);
 		of_node_put(node);
@@ -1048,7 +1038,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 		regmap[1] = NULL;
 	}
 
-	node = scpsys_get_legacy_regmap(np, "mediatek,infracfg-nao");
+	of_node_get(np);
+	node = of_find_node_with_property(np, "mediatek,infracfg-nao");
 	if (node) {
 		regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		num_regmaps++;
-- 
2.45.2


