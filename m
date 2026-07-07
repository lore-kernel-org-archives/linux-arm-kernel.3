Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2454C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb5eeZiukQcKjagLRaLy3kvLTwD4bulrTFUVmjWiij8=; b=325Q5yqAAae1979JLUfACAMigS
	pLNHfIep19R6urMbg6TIMXnpTFj87ouJiQGwQywBwHpiTB7ZR7tGQ3gqQQwv5DrFZ2BSuZxV4ffUR
	9lUGnlzR/oahB3qS4J3kelXJhGXtSKW7/OJ9vDRp/tJpglmVUBMBHTgDbFoikc9RreKkd0myfJF50
	uyvFpvvrBRg9XdFaGTky+ZF2HTgpNUiguiwnxXhIdf4+VRxJYakPzbQ1Bpbgt10UfhL1Qm4770AHf
	0/uN5IQA+tYvHtrVDPRZGRJ4So/wJln1sGicbyLsOKQNJSHXtUbuEtIPFDc5O+A57SyjiPi6SABpf
	HMwxcMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89H-0000000FP1i-26Uw;
	Tue, 07 Jul 2026 15:55:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89B-0000000FOwd-3Dtg;
	Tue, 07 Jul 2026 15:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439744;
	bh=nrj4ZgHhO4zoQTHtwr0fWL/c94bBJDjmR8CUNivzA+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pezlbPyB4R6ez8ZbcS4Yffy/ZxlkaSCj5p2TmdV35/aCahRxKkjdZVilMqaaCU+FS
	 rVXzez9C/lTsBe+EBeGhM0IWK7UnOI44Jqg2yAhZm4Lv+/FGQNuF+6OJyZqJWRrQyR
	 +aQn5WVABGzhbc99UBTnlpm73YwI97j4zxR5l4gT/GGw+9nk94jcXT3Hm7Q7diia8q
	 MBPqgZFOENP2Y4jmQTDMCa0vLdfMyG4X/BzlZoNqlQQTSowzOsbyShw24ZaMKuOwDg
	 R6ETlbg1H8PeNfsj0ZEwMtbrldrywnntX7V1LM/iiG6e5G/WI8VxT6svSlz/JLF1AI
	 61HGAyaviJwgQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54ABF17E0CDE;
	Tue, 07 Jul 2026 17:55:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 2/4] pmdomain: mediatek: Respect PD relationships during error cleanup
Date: Tue,  7 Jul 2026 17:55:33 +0200
Message-ID: <20260707155535.199383-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_085546_503727_81929EC3 
X-CRM114-Status: GOOD (  19.75  )
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

In case any probe error occurs (usually, a probe deferral) the
power domains shall be cleaned up while respecting their child
to parent relationship, or the system may freeze.

In order to do that without any memory footprint impacts after
the fact, allocate a temporary array in the probe function and
use it to store the indices of the added power domains in the
correct order.

This will be used in the error cleanup path and will be freed
at the end regardless of the probe status as, when the probing
succeeds, the genpd API takes care of unregistering all PDs in
the correct order anyway.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 43 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e1cfd4223473..db543d4b1813 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -738,7 +738,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 }
 
 static struct
-generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
+generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node,
+					 u8 *domains_idx, u8 *num_domains)
 {
 	const struct scpsys_domain_data *domain_data;
 	const struct scpsys_hwv_domain_data *hwv_domain_data;
@@ -906,6 +907,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	else
 		pm_genpd_init(&pd->genpd, NULL, false);
 
+	domains_idx[(*num_domains)++] = (u8) id;
 	scpsys->domains[id] = &pd->genpd;
 
 	return scpsys->pd_data.domains[id];
@@ -917,7 +919,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	return ERR_PTR(ret);
 }
 
-static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *parent)
+static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *parent,
+				u8 *domains_idx, u8 *num_domains)
 {
 	struct generic_pm_domain *child_pd, *parent_pd;
 	struct device_node *child;
@@ -940,7 +943,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 
 		parent_pd = scpsys->pd_data.domains[id];
 
-		child_pd = scpsys_add_one_domain(scpsys, child);
+		child_pd = scpsys_add_one_domain(scpsys, child, domains_idx, num_domains);
 		if (IS_ERR(child_pd)) {
 			ret = PTR_ERR(child_pd);
 			dev_err_probe(scpsys->dev, ret, "%pOF: failed to get child domain id\n",
@@ -949,7 +952,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 		}
 
 		/* recursive call to add all subdomains */
-		ret = scpsys_add_subdomain(scpsys, child);
+		ret = scpsys_add_subdomain(scpsys, child, domains_idx, num_domains);
 		if (ret)
 			goto err_put_node;
 
@@ -991,14 +994,16 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-static void scpsys_domain_cleanup(struct scpsys *scpsys)
+static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num_probed)
 {
 	struct generic_pm_domain *genpd;
 	struct scpsys_domain *pd;
 	int i;
 
-	for (i = scpsys->pd_data.num_domains - 1; i >= 0; i--) {
-		genpd = scpsys->pd_data.domains[i];
+	for (i = num_probed - 1; i >= 0; i--) {
+		u8 pd_idx = domains_idx[i];
+
+		genpd = scpsys->pd_data.domains[pd_idx];
 		if (genpd) {
 			pd = to_scpsys_domain(genpd);
 			scpsys_remove_one_domain(pd);
@@ -1215,6 +1220,8 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct device *parent;
 	struct scpsys *scpsys;
 	int num_domains, ret;
+	u8 num_added_pds = 0;
+	u8 *added_pds_idx;
 
 	soc = of_device_get_match_data(&pdev->dev);
 	if (!soc) {
@@ -1228,6 +1235,19 @@ static int scpsys_probe(struct platform_device *pdev)
 	if (!scpsys)
 		return -ENOMEM;
 
+	/*
+	 * Temporarily store the IDs of the power domains that are added as in
+	 * case of a probe deferral this can be used to correctly cleanup all
+	 * of what was added before.
+	 *
+	 * Note that this array is used only in the probe function and must be
+	 * freed at the end, regardless of whether all of the power domains were
+	 * probed successfully or any failure happened.
+	 */
+	added_pds_idx = devm_kmalloc_array(dev, num_domains, sizeof(*added_pds_idx), GFP_KERNEL);
+	if (!added_pds_idx)
+		return -ENOMEM;
+
 	scpsys->dev = dev;
 	scpsys->soc_data = soc;
 
@@ -1258,13 +1278,15 @@ static int scpsys_probe(struct platform_device *pdev)
 	for_each_available_child_of_node_scoped(np, node) {
 		struct generic_pm_domain *domain;
 
-		domain = scpsys_add_one_domain(scpsys, node);
+		domain = scpsys_add_one_domain(scpsys, node,
+					       added_pds_idx, &num_added_pds);
 		if (IS_ERR(domain)) {
 			ret = PTR_ERR(domain);
 			goto err_cleanup_domains;
 		}
 
-		ret = scpsys_add_subdomain(scpsys, node);
+		ret = scpsys_add_subdomain(scpsys, node,
+					   added_pds_idx, &num_added_pds);
 		if (ret)
 			goto err_cleanup_domains;
 	}
@@ -1280,10 +1302,11 @@ static int scpsys_probe(struct platform_device *pdev)
 		goto err_cleanup_domains;
 	}
 
+	devm_kfree(dev, added_pds_idx);
 	return 0;
 
 err_cleanup_domains:
-	scpsys_domain_cleanup(scpsys);
+	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
 	return ret;
 }
 
-- 
2.54.0


