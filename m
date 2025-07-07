Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FE3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhU8O5jhp268GZsw91NCUQcTbNXCN4cp60DNnsLy4/E=; b=0WIwZsmjb1DRWNRAwkxW6b32+P
	+3UNyYpDT3qsMfVnZQRj21d/zxJZJz1sw7SVRvGULJAFl0a7FlwU4RVD59jqeCv6RBDdLBEwLP+Lv
	IQ0yHcVDUcmYsaWadWFVOCbctsrIvM1QiQGETg+qCaj8/1tPYWlLaCC7sMG+3zRN5zyXR8FIXJRx7
	ukYchpT3mC5IIo03ybtJvtMa/DKsjUoPLchrfNkvyKgfMkg+fCXBI0l+l7Cq3gHuQt9o/ZNW9eb1C
	6zkNu9npaOvpZxcOb8uoYWmONW7jFCmRBe2nqe8V4pJgOx1wfNzYLlG6pDR78XiPGoqzD0NwfXM5S
	NZWHGtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkAi-00000002IWB-151b;
	Mon, 07 Jul 2025 11:38:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWJ-00000002DCG-2MtZ;
	Mon, 07 Jul 2025 10:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885781;
	bh=E24fd2LUiWtQTIC0yzAWsk85AKwpl4E7zLlCUOz8BTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJh83awn/4Min+y0Oc+V8OVIxs/FsenObGN84rpvffRiAb/KS+nFquaaH/9SBC4Az
	 44sBhR09/9Tk2OaBxKrBGINqh5qWhr7KdC8TNdkj6RKGFRgUU9dOwaexmjnLINDQUy
	 fWCzCY1Yb1YjT0lfeLnv47F1+1vmODqyPzdQ9Lm68cRnnuz2p1XDsDLly4wI7LVs+u
	 44reRsb4pMOgDDPQ9+vBxEaBCDh9sMvHXwP1smUs3CpDAqmUpsUbORdSAosa4fKFUH
	 elRDKGfJc4E3nIbjEGDjKMsxjuioHQk4s78QEPazoGsoTGN4PbGssyCsSYUEgPN9Fn
	 W5+EE25WlO1Sg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E871C17E11EC;
	Mon,  7 Jul 2025 12:56:20 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 06/10] pmdomain: mediatek: Move ctl sequences out of power_on/off functions
Date: Mon,  7 Jul 2025 12:56:01 +0200
Message-ID: <20250707105605.98248-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035623_744161_F50B87E0 
X-CRM114-Status: GOOD (  13.04  )
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 57 ++++++++++++++--------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index dd7f5f377271..92a3b523002b 100644
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


