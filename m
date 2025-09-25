Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D289CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsVx+kso0OHaTbXUbmDhjHoi3aYUh+EPyRyJVuWF8SA=; b=YXMbRr/8m/Gxl79SXU3XhDoRQN
	m+0g1MpkcwrTFsNKsIy8Z5wPwYZifj5UBolfv7Kpa9Z2G18a+Qk9YBZywX/0rVmWDwoBRQ5VM+t63
	nj6jIy0JL87HGqk0MTtamNuWXFlNgjWl6ozjsWQgVnim/kk5Xw8RvIP9Ah1SENiQidEZCftD4nE1/
	0Phacn2P7EyDkbBa3sixMosImJE86yodgnIh2yeiCkUHuj8nzR1GVjjT5TB9NS8VZ0J6Gmk0IoUSX
	zPiA9IrFI9/jv6SRijF1FCzMM4ruj+Bmls3+nNflLBgWBJ6UnCImXo8vouf+tmQEvkevC/CFLLiOH
	jfw8Yekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n9b-0000000AAth-4AmL;
	Thu, 25 Sep 2025 14:41:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n9U-0000000AAjn-0plv;
	Thu, 25 Sep 2025 14:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758810690;
	bh=ebL8FTWZUNTdcwrQm+9iuytO+mIF/plomFywLzhK17Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IwreccCJdPjZBCHYtFWer/bSQKrh5JAWM6qjvljkPJHwmRjCqUXdmv7kXnhwl3wXT
	 KWfH1CXsu6LDzmZ6uRgWWsTxNQ0ge6HTtP7dkM5zayh9wC97wvxJk68s+n7LWJMZ20
	 rU8dZMEEXZQq/6VfWdrPXUI+wkB3loP2Kk/qHL5mTkFm7Kk5cYh9SuQU23SIBewLNY
	 KBjBBXR+kbQTl+ruWusVXgXFMkn+ujPzEOG+QJm2qmmIKWY0YCd39YG/VpwhFvJeua
	 3OC8rYQeMn6aiPpfI765PXVOSZKdLcSHomck719SJh7wnCl6KK3aQrLoP9W2KmEaEO
	 OX+N6V0hMc0Nw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C33217E13C1;
	Thu, 25 Sep 2025 16:31:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	fshao@chromium.org,
	y.oudjana@protonmail.com,
	wenst@chromium.org,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 2/5] pmdomain: mediatek: Add support for Hardware Voter power domains
Date: Thu, 25 Sep 2025 16:31:13 +0200
Message-ID: <20250925143122.39796-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
References: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_074056_543557_8203580B 
X-CRM114-Status: GOOD (  28.08  )
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

New generation SoCs like MT8196/MT6991 feature a new type of power
domains, managed by a Hardware Voter (HWV) helper (through a SoC
internal fixed-function MCU): this is used to collect votes from
both the AP and the various other remote processors present in the
SoC and transparently power on/off various power domains, avoiding
unpowered access of registers in various internal IPs from all of
the integrated remote processors (or from the AP...!).

Add a new power domain type and differentiate between the old
SCPSYS_MTCMOS_TYPE_DIRECT_CTL - where power domains are controlled
directly by and exclusively from the Application Processor, and
the new SCPSYS_MTCMOS_TYPE_HW_VOTER, where the power domains are
voted through the HWV.

With the two needing different handling, check the power domain
type and assign a different power_{off,on} callback for pm_genpd:
for this specific reason, also move the check for the SCPD cap
MTK_SCPD_KEEP_DEFAULT_OFF after the assignment, and use the
assigned power_on function instead of calling scpsys_power_on()
directly to make that work for both HW_VOTER and DIRECT_CTL.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 247 ++++++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  45 +++-
 2 files changed, 266 insertions(+), 26 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 0ebe7379b94e..36767f740f57 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -31,6 +31,12 @@
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
 
+#define MTK_HWV_POLL_DELAY_US		5
+#define MTK_HWV_POLL_TIMEOUT		(300 * USEC_PER_MSEC)
+
+#define MTK_HWV_PREPARE_DELAY_US	1
+#define MTK_HWV_PREPARE_TIMEOUT		(3 * USEC_PER_MSEC)
+
 #define PWR_RST_B_BIT			BIT(0)
 #define PWR_ISO_BIT			BIT(1)
 #define PWR_ON_BIT			BIT(2)
@@ -48,6 +54,7 @@
 struct scpsys_domain {
 	struct generic_pm_domain genpd;
 	const struct scpsys_domain_data *data;
+	const struct scpsys_hwv_domain_data *hwv_data;
 	struct scpsys *scpsys;
 	int num_clks;
 	struct clk_bulk_data *clks;
@@ -83,6 +90,32 @@ static bool scpsys_domain_is_on(struct scpsys_domain *pd)
 	return status && status2;
 }
 
+static bool scpsys_hwv_domain_is_disable_done(struct scpsys_domain *pd)
+{
+	const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
+	u32 regs[2] = { hwv->done, hwv->clr_sta };
+	u32 val[2];
+	u32 mask = BIT(hwv->setclr_bit);
+
+	regmap_multi_reg_read(pd->scpsys->base, regs, val, 2);
+
+	/* Disable is done when the bit is set in DONE, cleared in CLR_STA */
+	return (val[0] & mask) && !(val[1] & mask);
+}
+
+static bool scpsys_hwv_domain_is_enable_done(struct scpsys_domain *pd)
+{
+	const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
+	u32 regs[3] = { hwv->done, hwv->en, hwv->set_sta };
+	u32 val[3];
+	u32 mask = BIT(hwv->setclr_bit);
+
+	regmap_multi_reg_read(pd->scpsys->base, regs, val, 3);
+
+	/* Enable is done when the bit is set in DONE and EN, cleared in SET_STA */
+	return (val[0] & mask) && (val[1] & mask) && !(val[2] & mask);
+}
+
 static int scpsys_sram_enable(struct scpsys_domain *pd)
 {
 	u32 expected_ack, pdn_ack = pd->data->sram_pdn_ack_bits;
@@ -250,6 +283,137 @@ static int scpsys_regulator_disable(struct regulator *supply)
 	return supply ? regulator_disable(supply) : 0;
 }
 
+static int scpsys_hwv_power_on(struct generic_pm_domain *genpd)
+{
+	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
+	const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
+	struct scpsys *scpsys = pd->scpsys;
+	u32 val;
+	int ret;
+
+	ret = scpsys_regulator_enable(pd->supply);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
+	if (ret)
+		goto err_reg;
+
+	/* For HWV the subsys clocks refer to the HWV low power subsystem */
+	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
+	if (ret)
+		goto err_disable_clks;
+
+	/* Make sure the HW Voter is idle and able to accept commands */
+	ret = regmap_read_poll_timeout_atomic(scpsys->base, hwv->done, val,
+					      val & BIT(hwv->setclr_bit),
+					      MTK_HWV_POLL_DELAY_US,
+					      MTK_HWV_POLL_TIMEOUT);
+	if (ret) {
+		dev_err(scpsys->dev, "Failed to power on: HW Voter busy.\n");
+		goto err_disable_subsys_clks;
+	}
+
+	/*
+	 * Instruct the HWV to power on the MTCMOS (power domain): after that,
+	 * the same bit will be unset immediately by the hardware.
+	 */
+	regmap_write(scpsys->base, hwv->set, BIT(hwv->setclr_bit));
+
+	/*
+	 * Wait until the HWV sets the bit again, signalling that its internal
+	 * state machine was started and it now processing the vote command.
+	 */
+	ret = regmap_read_poll_timeout_atomic(scpsys->base, hwv->set, val,
+					      val & BIT(hwv->setclr_bit),
+					      MTK_HWV_PREPARE_DELAY_US,
+					      MTK_HWV_PREPARE_TIMEOUT);
+	if (ret) {
+		dev_err(scpsys->dev, "Failed to power on: HW Voter not starting.\n");
+		goto err_disable_subsys_clks;
+	}
+
+	/* Wait for ACK, signalling that the MTCMOS was enabled */
+	ret = readx_poll_timeout_atomic(scpsys_hwv_domain_is_enable_done, pd, val, val,
+					MTK_HWV_POLL_DELAY_US, MTK_HWV_POLL_TIMEOUT);
+	if (ret) {
+		dev_err(scpsys->dev, "Failed to power on: HW Voter ACK timeout.\n");
+		goto err_disable_subsys_clks;
+	}
+
+	/* It's done! Disable the HWV low power subsystem clocks */
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+
+	return 0;
+
+err_disable_subsys_clks:
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+err_disable_clks:
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+err_reg:
+	scpsys_regulator_disable(pd->supply);
+	return ret;
+};
+
+static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
+{
+	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
+	const struct scpsys_hwv_domain_data *hwv = pd->hwv_data;
+	struct scpsys *scpsys = pd->scpsys;
+	u32 val;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
+	if (ret)
+		return ret;
+
+	/* Make sure the HW Voter is idle and able to accept commands */
+	ret = regmap_read_poll_timeout_atomic(scpsys->base, hwv->done, val,
+					      val & BIT(hwv->setclr_bit),
+					      MTK_HWV_POLL_DELAY_US,
+					      MTK_HWV_POLL_TIMEOUT);
+	if (ret)
+		goto err_disable_subsys_clks;
+
+
+	/*
+	 * Instruct the HWV to power off the MTCMOS (power domain): differently
+	 * from poweron, the bit will be kept set.
+	 */
+	regmap_write(scpsys->base, hwv->clr, BIT(hwv->setclr_bit));
+
+	/*
+	 * Wait until the HWV clears the bit, signalling that its internal
+	 * state machine was started and it now processing the clear command.
+	 */
+	ret = regmap_read_poll_timeout_atomic(scpsys->base, hwv->clr, val,
+					      !(val & BIT(hwv->setclr_bit)),
+					      MTK_HWV_PREPARE_DELAY_US,
+					      MTK_HWV_PREPARE_TIMEOUT);
+	if (ret)
+		goto err_disable_subsys_clks;
+
+	/* Poweroff needs 100us for the HW to stabilize */
+	udelay(100);
+
+	/* Wait for ACK, signalling that the MTCMOS was disabled */
+	ret = readx_poll_timeout_atomic(scpsys_hwv_domain_is_disable_done, pd, val, val,
+					MTK_HWV_POLL_DELAY_US, MTK_HWV_POLL_TIMEOUT);
+	if (ret)
+		goto err_disable_subsys_clks;
+
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
+
+	scpsys_regulator_disable(pd->supply);
+
+	return 0;
+
+err_disable_subsys_clks:
+	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
+	return ret;
+};
+
 static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
 {
 	struct scpsys *scpsys = pd->scpsys;
@@ -514,6 +678,7 @@ static struct
 generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
 {
 	const struct scpsys_domain_data *domain_data;
+	const struct scpsys_hwv_domain_data *hwv_domain_data;
 	struct scpsys_domain *pd;
 	struct property *prop;
 	const char *clk_name;
@@ -529,14 +694,33 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (id >= scpsys->soc_data->num_domains) {
-		dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
-		return ERR_PTR(-EINVAL);
-	}
+	switch (scpsys->soc_data->type) {
+	case SCPSYS_MTCMOS_TYPE_DIRECT_CTL:
+		if (id >= scpsys->soc_data->num_domains) {
+			dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
+			return ERR_PTR(-EINVAL);
+		}
+
+		domain_data = &scpsys->soc_data->domains_data[id];
+		hwv_domain_data = NULL;
 
-	domain_data = &scpsys->soc_data->domains_data[id];
-	if (domain_data->sta_mask == 0) {
-		dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
+		if (domain_data->sta_mask == 0) {
+			dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
+			return ERR_PTR(-EINVAL);
+		}
+
+		break;
+	case SCPSYS_MTCMOS_TYPE_HW_VOTER:
+		if (id >= scpsys->soc_data->num_hwv_domains) {
+			dev_err(scpsys->dev, "%pOF: invalid HWV domain id %d\n", node, id);
+			return ERR_PTR(-EINVAL);
+		}
+
+		domain_data = NULL;
+		hwv_domain_data = &scpsys->soc_data->hwv_domains_data[id];
+
+		break;
+	default:
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -545,6 +729,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		return ERR_PTR(-ENOMEM);
 
 	pd->data = domain_data;
+	pd->hwv_data = hwv_domain_data;
 	pd->scpsys = scpsys;
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
@@ -604,6 +789,31 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		pd->subsys_clks[i].clk = clk;
 	}
 
+	if (scpsys->domains[id]) {
+		ret = -EINVAL;
+		dev_err(scpsys->dev,
+			"power domain with id %d already exists, check your device-tree\n", id);
+		goto err_put_subsys_clocks;
+	}
+
+	if (pd->data && pd->data->name)
+		pd->genpd.name = pd->data->name;
+	else if (pd->hwv_data && pd->hwv_data->name)
+		pd->genpd.name = pd->hwv_data->name;
+	else
+		pd->genpd.name = node->name;
+
+	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_DIRECT_CTL) {
+		pd->genpd.power_off = scpsys_power_off;
+		pd->genpd.power_on = scpsys_power_on;
+	} else {
+		pd->genpd.power_off = scpsys_hwv_power_off;
+		pd->genpd.power_on = scpsys_hwv_power_on;
+
+		/* HW-Voter code can be invoked in atomic context */
+		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
+	}
+
 	/*
 	 * Initially turn on all domains to make the domains usable
 	 * with !CONFIG_PM and to get the hardware in sync with the
@@ -615,7 +825,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 			dev_warn(scpsys->dev,
 				 "%pOF: A default off power domain has been ON\n", node);
 	} else {
-		ret = scpsys_power_on(&pd->genpd);
+		ret = pd->genpd.power_on(&pd->genpd);
 		if (ret < 0) {
 			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
 			goto err_put_subsys_clocks;
@@ -625,21 +835,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
-	if (scpsys->domains[id]) {
-		ret = -EINVAL;
-		dev_err(scpsys->dev,
-			"power domain with id %d already exists, check your device-tree\n", id);
-		goto err_put_subsys_clocks;
-	}
-
-	if (!pd->data->name)
-		pd->genpd.name = node->name;
-	else
-		pd->genpd.name = pd->data->name;
-
-	pd->genpd.power_off = scpsys_power_off;
-	pd->genpd.power_on = scpsys_power_on;
-
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
 		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
 
@@ -934,7 +1129,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct device *parent;
 	struct scpsys *scpsys;
-	int ret;
+	int num_domains, ret;
 
 	soc = of_device_get_match_data(&pdev->dev);
 	if (!soc) {
@@ -942,7 +1137,9 @@ static int scpsys_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	scpsys = devm_kzalloc(dev, struct_size(scpsys, domains, soc->num_domains), GFP_KERNEL);
+	num_domains = soc->num_domains + soc->num_hwv_domains;
+
+	scpsys = devm_kzalloc(dev, struct_size(scpsys, domains, num_domains), GFP_KERNEL);
 	if (!scpsys)
 		return -ENOMEM;
 
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index b2e3dee03831..df4bf013709b 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -16,7 +16,9 @@
 #define MTK_SCPD_SRAM_PDN_INVERTED	BIT(9)
 #define MTK_SCPD_MODEM_PWRSEQ		BIT(10)
 #define MTK_SCPD_SKIP_RESET_B		BIT(11)
-#define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
+#define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data ?		\
+					 (_scpd)->data->caps & (_x) :	\
+					 (_scpd)->hwv_data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
 #define SPM_MFG_PWR_CON			0x0214
@@ -124,6 +126,18 @@ enum scpsys_rtff_type {
 	SCPSYS_RTFF_TYPE_MAX
 };
 
+/**
+ * enum scpsys_mtcmos_type - Type of power domain controller
+ * @SCPSYS_MTCMOS_TYPE_DIRECT_CTL: Power domains are controlled with direct access
+ * @SCPSYS_MTCMOS_TYPE_HW_VOTER:   Hardware-assisted voted power domain control
+ * @SCPSYS_MTCMOS_TYPE_MAX:        Number of supported power domain types
+ */
+enum scpsys_mtcmos_type {
+	SCPSYS_MTCMOS_TYPE_DIRECT_CTL = 0,
+	SCPSYS_MTCMOS_TYPE_HW_VOTER,
+	SCPSYS_MTCMOS_TYPE_MAX
+};
+
 /**
  * struct scpsys_domain_data - scp domain data for power on/off flow
  * @name: The name of the power domain.
@@ -152,11 +166,40 @@ struct scpsys_domain_data {
 	int pwr_sta2nd_offs;
 };
 
+/**
+ * struct scpsys_hwv_domain_data - Hardware Voter power domain data
+ * @name:       Name of the power domain
+ * @set:        Offset of the HWV SET register
+ * @clr:        Offset of the HWV CLEAR register
+ * @done:       Offset of the HWV DONE register
+ * @en:         Offset of the HWV ENABLE register
+ * @set_sta:    Offset of the HWV SET STATUS register
+ * @clr_sta:    Offset of the HWV CLEAR STATUS register
+ * @setclr_bit: The SET/CLR bit to enable/disable the power domain
+ * @sta_bit:    The SET/CLR STA bit to check for on/off ACK
+ * @caps:       The flag for active wake-up action
+ */
+struct scpsys_hwv_domain_data {
+	const char *name;
+	u16 set;
+	u16 clr;
+	u16 done;
+	u16 en;
+	u16 set_sta;
+	u16 clr_sta;
+	u8 setclr_bit;
+	u8 sta_bit;
+	u16 caps;
+};
+
 struct scpsys_soc_data {
 	const struct scpsys_domain_data *domains_data;
 	int num_domains;
+	const struct scpsys_hwv_domain_data *hwv_domains_data;
+	int num_hwv_domains;
 	enum scpsys_bus_prot_block *bus_prot_blocks;
 	int num_bus_prot_blocks;
+	enum scpsys_mtcmos_type type;
 };
 
 #endif /* __SOC_MEDIATEK_MTK_PM_DOMAINS_H */
-- 
2.51.0


