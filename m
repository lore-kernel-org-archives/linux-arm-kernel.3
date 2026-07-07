Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYRvnY/6VFZnCZSc1Stup4dnuuEa+s/VIE6RlDzSsEw=; b=meq1PfzzLVPvXdxErReQlVjUPd
	OL0T/fvZGzRI+UfGCdKjql0kVPISTwf/4v/Z7xLggO5vKmk+NsRbxJQaVxkmY94TMqiGtNe+aqzML
	1truq945LFKcgXvU4oWEpfBO72yl7VamGIrLOU6AZfJWMj8FkKeg+ecKEy+quhFJcgYxgwW7mW50X
	3pMAB9vIjf2Q+MkX0vdKOg2n40VhJrsUhOKsNO+irhuj1EO22XxVLAQUCd6j0L/i/ld+7qbl3jTnu
	56vhZ1sptkb/X71BBUjKI/nUMzLk/gvVJaU61Mic/ZwJEHQMDX1TEcAlEoiz07bgm0N2mWjNGZFR1
	c69QspQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89H-0000000FP2B-2qmo;
	Tue, 07 Jul 2026 15:55:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89C-0000000FOx3-2qaQ;
	Tue, 07 Jul 2026 15:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439744;
	bh=Y1wf8wYLXtRKCiCh6GvSL6BWrh06Q0lZPjwpjKjisfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iPKZOeTJMUCkgYz+at/blLwrOhhbJn2majGFewfXp5jcL05PLS30o8jdaS8H7RDsC
	 hoT8rXZd4hSi+CFmH3goLiPnpHCroo5+IxKDqW7FrZQtq9Vyo/4M8pfw9ntKd9gC/f
	 +ZtHt+WstL9hfaHP3dLnjaI/Mw02VNpi4FpZAZOROojUskr/w634rn1R3BcSBXDGhK
	 8ZUhfJ6M0e9Ey4CRn9uaHfThfC+yuclZqR9MnQd8W+DRT0YIFsvxg+SiT2ZBGFYCZv
	 JSQvCiNo6jNGipg4seSC3pFzyUez8otsuAkyScDlDE3Hckslc5xkMHvxgUJlHU90Cz
	 79kLOukK7uqyg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BA6E17E0DE6;
	Tue, 07 Jul 2026 17:55:44 +0200 (CEST)
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
Subject: [PATCH v2 3/4] pmdomain: mediatek: Add support for Direct CTL simple power sequence
Date: Tue,  7 Jul 2026 17:55:34 +0200
Message-ID: <20260707155535.199383-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_085546_871491_B1BE6DE1 
X-CRM114-Status: GOOD (  21.11  )
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

Some new SoCs like MT8196, MT6991, and others, have got one
additional power controller (usually in the HFRP Multimedia
block) which needs a simplified power on/off sequence while
using Direct Control strategy.

Domains using the "simple power sequence" are not backed by
the RTFF hardware, have no Bus Protection mechanism, lacks
the ISO, PWR_ON, PWR_ON_2ND bits, and therefore get enabled
automatically after getting out of reset.

This simple power sequence is then a subset of the full one
as only needs the enablement of the specific power domain's
clock input and reset (where, again, after getting out of
reset, the ISO and PWR_ON bits are automatically internally
getting flipped) to enable or disable (power on or off).

Moreover, the simple power sequence power domains guarantee
that they always get enabled/disabled after executing the
relevant power sequence (on/off) so, differently from the
others, there is also no need to poll for a PWR_ACK.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 93 ++++++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index db543d4b1813..feba436279c5 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -549,9 +549,11 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
 	return 0;
 }
 
-static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
+static int scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
 {
 	struct scpsys *scpsys = pd->scpsys;
+	bool tmp;
+	int ret;
 
 	switch (pd->data->rtff_type) {
 	case SCPSYS_RTFF_TYPE_GENERIC:
@@ -583,6 +585,41 @@ static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+
+	/* wait until PWR_ACK = 0 */
+	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
+				 MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int scpsys_simple_pwrseq_on(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+
+	/* Enable subsys clock input and trigger power domain reset state */
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	/* Wait for the hardware to stabilize */
+	udelay(1);
+
+	/* Get out of reset: set power on */
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	return 0;
+}
+
+static int scpsys_simple_pwrseq_off(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+
+	return 0;
 }
 
 static int scpsys_modem_pwrseq_on(struct scpsys_domain *pd)
@@ -605,14 +642,24 @@ static int scpsys_modem_pwrseq_on(struct scpsys_domain *pd)
 	return 0;
 }
 
-static void scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
+static int scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
 {
 	struct scpsys *scpsys = pd->scpsys;
+	bool tmp;
+	int ret;
 
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 
 	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SKIP_RESET_B))
 		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	/* wait until PWR_ACK = 0 */
+	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
+				 MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int scpsys_power_on(struct generic_pm_domain *genpd)
@@ -635,6 +682,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
 		ret = scpsys_modem_pwrseq_on(pd);
+	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		ret = scpsys_simple_pwrseq_on(pd);
 	else
 		ret = scpsys_ctl_pwrseq_on(pd);
 
@@ -662,9 +711,11 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 			goto err_pwr_ack;
 	}
 
-	ret = scpsys_sram_enable(pd);
-	if (ret < 0)
-		goto err_disable_subsys_clks;
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
+		ret = scpsys_sram_enable(pd);
+		if (ret < 0)
+			goto err_disable_subsys_clks;
+	}
 
 	ret = scpsys_bus_protect_disable(pd, 0);
 	if (ret < 0)
@@ -682,7 +733,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 err_enable_bus_protect:
 	scpsys_bus_protect_enable(pd, 0);
 err_disable_sram:
-	scpsys_sram_disable(pd);
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		scpsys_sram_disable(pd);
 err_disable_subsys_clks:
 	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
 		clk_bulk_disable_unprepare(pd->num_subsys_clks,
@@ -698,16 +750,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
 	struct scpsys *scpsys = pd->scpsys;
-	bool tmp;
 	int ret;
 
 	ret = scpsys_bus_protect_enable(pd, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = scpsys_sram_disable(pd);
-	if (ret < 0)
-		return ret;
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
+		ret = scpsys_sram_disable(pd);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (pd->data->ext_buck_iso_offs && MTK_SCPD_CAPS(pd, MTK_SCPD_EXT_BUCK_ISO))
 		regmap_set_bits(scpsys->base, pd->data->ext_buck_iso_offs,
@@ -720,15 +773,17 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
-		scpsys_modem_pwrseq_off(pd);
+		ret = scpsys_modem_pwrseq_off(pd);
+	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		ret = scpsys_simple_pwrseq_off(pd);
 	else
-		scpsys_ctl_pwrseq_off(pd);
+		ret = scpsys_ctl_pwrseq_off(pd);
 
-	/* wait until PWR_ACK = 0 */
-	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
-				 MTK_POLL_TIMEOUT);
-	if (ret < 0)
+	if (ret < 0) {
+		/* Re-enable clocks so that next power off doesn't break the refcount */
+		clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
 		return ret;
+	}
 
 	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
 
@@ -1083,6 +1138,12 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 		regmap[2] = NULL;
 	}
 
+	/* If no access controllers are needed, don't allocate and don't fail */
+	if (num_regmaps == 0) {
+		scpsys->bus_prot = NULL;
+		return 0;
+	}
+
 	scpsys->bus_prot = devm_kmalloc_array(dev, num_regmaps,
 					      sizeof(*scpsys->bus_prot), GFP_KERNEL);
 	if (!scpsys->bus_prot)
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index a5dca24cbc2f..092403de66fa 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -17,6 +17,7 @@
 #define MTK_SCPD_MODEM_PWRSEQ		BIT(10)
 #define MTK_SCPD_SKIP_RESET_B		BIT(11)
 #define MTK_SCPD_INFRA_PWR_CTL		BIT(12)
+#define MTK_SCPD_SIMPLE_PWRSEQ		BIT(13)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data ?		\
 					 (_scpd)->data->caps & (_x) :	\
 					 (_scpd)->hwv_data->caps & (_x))
-- 
2.54.0


