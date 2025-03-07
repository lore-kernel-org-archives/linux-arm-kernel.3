Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13BAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG/7OP0R5QHKcseOjpNc9pY7M9WOw2SIwXbWVLzcAo4=; b=fwLi/zVrxXOrZ7mFSfctR6ZsQy
	1iiV3BbyOJJtdYHNv7nQ4IO2YZXMsB4Nb2WHbYF9Sp3AUh2E5Sgnw4oQnl538XRDcc+VpTFmO6bfx
	cjG0Un3FDkaKRfzeJHw856FyL3AL1MAPpn7BYVny2QorH5a2FR8fcJ3aohpHpBn/iAp6hvaoMDUAR
	i7LG9Zs07McljcNE0NQ+XumZUJvfu52poqIyvWGFJa5MmYhy8ufE8ARoeZoom35ye6nqEl2MlbkL6
	RYSz3U6TsQUEFEioSn0LewQuw8MgW3TRqbGsyByYJO7Lds3JzKtEeLO4Iwl90mwDQlXF8wQM5HJsP
	x/vn9Xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPNN-0000000D7XV-2yHX;
	Fri, 07 Mar 2025 04:31:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOe7-0000000D25p-2XiG;
	Fri, 07 Mar 2025 03:45:12 +0000
X-UUID: 8fd28458fb0611ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XG/7OP0R5QHKcseOjpNc9pY7M9WOw2SIwXbWVLzcAo4=;
	b=V64XtOSlAZM+7JrysKPX2XptLbdGr46OI8mjIgdq0CXcv88DmltDFYmHGMa2y/GEjpvmafenQBSf4EaHTEbWYbLDGwBaF8IHMJZR6zbKCx9Uj+vBaESjvbBWpye+9llptid4Tfoo/3mXGtsUWqk9i7Wv7jth9yvW0Hh6pxlWptM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:29c08d43-7ef8-4769-89a2-a9318bb2b15d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:7b97108c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8fd28458fb0611ef83f2a1c9db70dae0-20250306
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 728246547; Thu, 06 Mar 2025 20:45:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:45:03 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 09/13] pmdomain: mediatek: Refactor parameters of init_scp
Date: Fri, 7 Mar 2025 11:44:33 +0800
Message-ID: <20250307034454.12243-10-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194511_649571_73F9DDA9 
X-CRM114-Status: GOOD (  13.77  )
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

Refactor parameters of init_scp which will use other fields of soc data.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 28 +++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index f0a5e1653b5f..47d5d5abcaee 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -798,10 +798,7 @@ static int mtk_pd_get_regmap(struct platform_device *pdev, struct regmap **regma
 	return 0;
 }
 
-static struct scp *init_scp(struct platform_device *pdev,
-			const struct scp_domain_data *scp_domain_data, int num,
-			const struct scp_ctrl_reg *scp_ctrl_reg,
-			bool bus_prot_reg_update)
+static struct scp *init_scp(struct platform_device *pdev, const struct scp_soc_data *soc)
 {
 	struct genpd_onecell_data *pd_data;
 	int i, j;
@@ -813,10 +810,10 @@ static struct scp *init_scp(struct platform_device *pdev,
 	if (!scp)
 		return ERR_PTR(-ENOMEM);
 
-	scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
-	scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
+	scp->ctrl_reg.pwr_sta_offs = soc->regs.pwr_sta_offs;
+	scp->ctrl_reg.pwr_sta2nd_offs = soc->regs.pwr_sta2nd_offs;
 
-	scp->bus_prot_reg_update = bus_prot_reg_update;
+	scp->bus_prot_reg_update = soc->bus_prot_reg_update;
 
 	scp->dev = &pdev->dev;
 
@@ -825,14 +822,14 @@ static struct scp *init_scp(struct platform_device *pdev,
 		return ERR_CAST(scp->base);
 
 	scp->domains = devm_kcalloc(&pdev->dev,
-				num, sizeof(*scp->domains), GFP_KERNEL);
+				soc->num_domains, sizeof(*scp->domains), GFP_KERNEL);
 	if (!scp->domains)
 		return ERR_PTR(-ENOMEM);
 
 	pd_data = &scp->pd_data;
 
 	pd_data->domains = devm_kcalloc(&pdev->dev,
-			num, sizeof(*pd_data->domains), GFP_KERNEL);
+			soc->num_domains, sizeof(*pd_data->domains), GFP_KERNEL);
 	if (!pd_data->domains)
 		return ERR_PTR(-ENOMEM);
 
@@ -844,9 +841,9 @@ static struct scp *init_scp(struct platform_device *pdev,
 		return ERR_CAST(scp->infracfg);
 	}
 
-	for (i = 0; i < num; i++) {
+	for (i = 0; i < soc->num_domains; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
-		const struct scp_domain_data *data = &scp_domain_data[i];
+		const struct scp_domain_data *data = &soc->domains[i];
 
 		scpd->supply = devm_regulator_get_optional(&pdev->dev, data->name);
 		if (IS_ERR(scpd->supply)) {
@@ -857,14 +854,14 @@ static struct scp *init_scp(struct platform_device *pdev,
 		}
 	}
 
-	pd_data->num_domains = num;
+	pd_data->num_domains = soc->num_domains;
 
 	init_clks(pdev, clk);
 
-	for (i = 0; i < num; i++) {
+	for (i = 0; i < soc->num_domains; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
 		struct generic_pm_domain *genpd = &scpd->genpd;
-		const struct scp_domain_data *data = &scp_domain_data[i];
+		const struct scp_domain_data *data = &soc->domains[i];
 
 		pd_data->domains[i] = genpd;
 		scpd->scp = scp;
@@ -1511,8 +1508,7 @@ static int scpsys_probe(struct platform_device *pdev)
 
 	soc = of_device_get_match_data(&pdev->dev);
 
-	scp = init_scp(pdev, soc->domains, soc->num_domains, &soc->regs,
-			soc->bus_prot_reg_update);
+	scp = init_scp(pdev, soc);
 	if (IS_ERR(scp))
 		return PTR_ERR(scp);
 
-- 
2.45.2


