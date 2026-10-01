Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCAFCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFhlXac10taL9GRiPG1OiySDTuQT7u4lUJZQUv9yULA=; b=lCot3CeChc6oEssXzX+h/k5DhE
	3mZqgKlKkStc/96j9VnhXzQ1xAXnTnmMhqzXm7sn0BsvCsllnAM+x37N0wvtauP1egN15DGWVpbUM
	ALJXXlofYUmvcJPh4mUwo5R55IyjoNLVQtYpSSvYQE8jYRuHLYKrP68jPXsfUk+Ub+ueiFijR224a
	7Yxz9QEX+UB3+HwFS7yQV1IlOFSatDIehhTwzWdKS7/+H6Ghu+u2+kpQVVOBR0q9IrRyyMOPiM/X7
	EUgXAuCsuwNz/eO73HWunw3p8tU++T1mKbktB/jumvkZymVYfnU3LliGWZoKOj2Z2yxUSiNWim60v
	K42IxG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWl-00000008HO3-3z84;
	Thu, 01 Oct 2026 08:52:31 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWg-00000008HL0-1BLc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:52:29 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261001085221c4fa9721e20002070d
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 01 Oct 2026 10:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sFhlXac10taL9GRiPG1OiySDTuQT7u4lUJZQUv9yULA=;
 b=T4l8+OdXpWdIgKOEnajlP4ZIqmXamFlekn3vhNnE6ViuL8TJ0ag2r8aa9/Fh0u2APpKyGj
 jbBWyi3AceVAsUpn6nDlgjPtNsFwRIp0/3fHq4UdIIp3xZ/BrPVIwotgskNUhCu8waHTUyGM
 mL4Iaqs34/NiRupOZOnhXqewElqzXE18Kvi7LMs/dfCPyK4jNNlkRYSLVinyutmG1CMsRnUk
 WxQqYjcz/qwb9CVZNoctixH5m3nizkVfMdUGg31f8RF2tdxNO4EVeYrK4D/tAUf2+bmqYX4k
 1GoMMcMpptnY479/kxMTp0fYV/YPTAoAwqA8K9c4v2Tcha89y6VsuZPQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: ti-iodelay: fix memory leaks on consumer re-probe
Date: Thu,  1 Oct 2026 10:52:11 +0200
Message-ID: <20261001085217.1778645-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
References: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_015226_905607_EDD26FE0 
X-CRM114-Status: GOOD (  12.44  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

ti_iodelay_dt_node_to_map() allocates a pinctrl_map, a group, a pin array
and a config array per mapping with devres on the controller, and registers
the group via pinctrl_generic_add_group(). The core deduplicates groups by
name and keeps the first for the controller's lifetime, so on a repeated
mapping of the same node (consumer re-probe) the freshly built group, pins
and configs are dropped and leaked. The pinctrl_map leaked too: the driver
never implemented pinctrl_ops::dt_free_map, so nothing released it.

Reuse the deduplicated group and free the redundant copy (repointing the
map at the retained group), and add dt_free_map() to release the map.

Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 019b302db2b00..9a8865ce0bbab 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -497,6 +497,7 @@ static int ti_iodelay_dt_node_to_map(struct pinctrl_dev *pctldev,
 	struct ti_iodelay_device *iod;
 	struct ti_iodelay_cfg *cfg;
 	struct ti_iodelay_pingroup *g;
+	struct group_desc *grp;
 	const char *name = "pinctrl-pin-array";
 	int rows, *pins, error = -EINVAL, i;
 
@@ -553,6 +554,19 @@ static int ti_iodelay_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (error < 0)
 		goto free_data;
 
+	/*
+	 * The core deduplicates groups by name and keeps the first for the
+	 * controller's lifetime; on a repeated mapping (consumer re-probe)
+	 * reuse it and free our now-redundant copy.
+	 */
+	grp = pinctrl_generic_get_group(iod->pctl, error);
+	if (grp->data != g) {
+		devm_kfree(iod->dev, cfg);
+		devm_kfree(iod->dev, pins);
+		devm_kfree(iod->dev, g);
+		g = grp->data;
+	}
+
 	(*map)->type = PIN_MAP_TYPE_CONFIGS_GROUP;
 	(*map)->data.configs.group_or_pin = np->name;
 	(*map)->data.configs.configs = &g->config;
@@ -722,6 +736,15 @@ static void ti_iodelay_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 }
 #endif
 
+static void ti_iodelay_dt_free_map(struct pinctrl_dev *pctldev,
+				   struct pinctrl_map *map, unsigned int num_maps)
+{
+	struct ti_iodelay_device *iod;
+
+	iod = pinctrl_dev_get_drvdata(pctldev);
+	devm_kfree(iod->dev, map);
+}
+
 static const struct pinctrl_ops ti_iodelay_pinctrl_ops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -730,6 +753,7 @@ static const struct pinctrl_ops ti_iodelay_pinctrl_ops = {
 	.pin_dbg_show = ti_iodelay_pin_dbg_show,
 #endif
 	.dt_node_to_map = ti_iodelay_dt_node_to_map,
+	.dt_free_map = ti_iodelay_dt_free_map,
 };
 
 static const struct pinconf_ops ti_iodelay_pinctrl_pinconf_ops = {
-- 
2.55.0


