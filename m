Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ud+JXHrPKPaq8qIANE1zzBbSdUXRJHEUD6JJ8MZJ6M=; b=JktClfweMoF1FRgG8Md00HdEaL
	Dcfx8gi8OE3+mO29VKi7kxWf0ZpnVmeBWGn1JWWyTsWyrytq95KIeBncLtchk6QpGBXR3FOLMwpX3
	8Y9xcQT5eOAfjXKcrDa1CqAwZL4fV1UPzGhjA9InHOJqR90A7aRlfzwWaoriPeQfsZ0nrueRmycgE
	eKNNIqN4rJWm36WA9S1QSs9//Ccnm3P5Bn7HNg6siqLcqop8/MsWavor1KRKED5yVuCZHXWc/25Dk
	VQb9Qfn160MbzKjzUyMpWLsXZRnOIHZ+mQYPwPIs1NUvt7S0AMJRRIpP0FiaQFbCejjQ6gsS/APD7
	9KYmZJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiko-00000003A5D-1Zdu;
	Mon, 23 Jun 2025 15:06:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfsB-00000002bCp-2Zlw;
	Mon, 23 Jun 2025 12:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680122;
	bh=Jy2EB1cMlsijtNMvI79qnH/ppAJrlFyGTqcN90xczFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJPBje4Y/oh8tcXAZoW56YBHVZFu3VGDXLy1AfplnLW1nOV7EUewmi4jD7PYpNTMQ
	 RKulYByBDNdqKGQxip5chnjDeUTJKYUu2Cc9ZzGP27FY9dpq3V1y29e6ZyFwSxdeQT
	 zZPSnOcU7k3T/kZtecSRbj1x6TVTQb/9ifcHCZO+kJyduJgkSuG/z5ouYWAzxKO2hn
	 gyAuQHY9oqrcTlA45Ry4XGEXknX/X4TEXENgotvOuGTX76+rwrISOoHziTt+58P/He
	 LTrbGRLGgnsyDp7s37p3PaEFGvq8rteWSzYzugLAHFE0NSGHghj1mq6aOdYAvvAhQ3
	 jtul1iJ+UlnSw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73CE817E156D;
	Mon, 23 Jun 2025 14:02:01 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 04/13] pmdomain: mediatek: Move ctl sequences out of power_on/off functions
Date: Mon, 23 Jun 2025 14:01:45 +0200
Message-ID: <20250623120154.109429-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050203_816308_55C903C0 
X-CRM114-Status: GOOD (  12.41  )
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

In preparation to support power domains of new SoCs and the modem
power domains for both new and already supported chips, move the
generic control power sequences out of the scpsys_power_on() and
scpsys_power_off() and put them in new scpsys_ctl_pwrseq_on(),
scpsys_ctl_pewseq_off() functions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 57 ++++++++++++++--------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 2a430e7cd353..331736d55329 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -244,11 +244,45 @@ static int scpsys_regulator_disable(struct regulator *supply)
 	return supply ? regulator_disable(supply) : 0;
 }
 
+static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+	bool tmp;
+	int ret;
+
+	/* subsys power on */
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
+
+	/* wait until PWR_ACK = 1 */
+	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp, MTK_POLL_DELAY_US,
+				 MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	return 0;
+}
+
+static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+
+	/* subsys power off */
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
 	struct scpsys *scpsys = pd->scpsys;
-	bool tmp;
 	int ret;
 
 	ret = scpsys_regulator_enable(pd->supply);
@@ -263,20 +297,10 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
 				  pd->data->ext_buck_iso_mask);
 
-	/* subsys power on */
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
-
-	/* wait until PWR_ACK = 1 */
-	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp, MTK_POLL_DELAY_US,
-				 MTK_POLL_TIMEOUT);
-	if (ret < 0)
+	ret = scpsys_ctl_pwrseq_on(pd);
+	if (ret)
 		goto err_pwr_ack;
 
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
-
 	/*
 	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
 	 * stricter, which leads to bus protect release must be prior to bus
@@ -342,12 +366,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
-	/* subsys power off */
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
-	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
-	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+	scpsys_ctl_pwrseq_off(pd);
 
 	/* wait until PWR_ACK = 0 */
 	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
-- 
2.49.0


