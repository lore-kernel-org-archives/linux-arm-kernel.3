Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCD9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7B/KAoETvcbg8WkPG1QTVhRm2y4W3lQglMRuOnYMR4=; b=kv2hVOxu2IEPdsgkkWVGgKaSNm
	yJAxSQ5T9Ml/dVaXrQxfBN7yO80qOT3kcCi3Yh+Yx8L/N+w+mAXVD2wU5yk+qHB/ldW5jVjPD0mdm
	wu1zlxkTNmNbhS3Gwv3RFyK/L2ICyB6CPsQ5r9aIxrzqZg5pWtrv7q8CL4E7ttMUFsRM1IFU/bIDC
	3pxLL3MMMQyvZN1opmdZ8JzOmNkpv0qLphTJ+tP5ybTFHx2+x9NqG3+/ICbhg2RlD3NGnLooLhJAj
	rxomq8zO32Bpma0SWBvxO9wgbN7wLYe8FfoJT7OCNCCeycnQbqCjwraY3mDJjj400vFHq4LScjNKP
	Vvt6qK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkD0-00000002IsB-1PEn;
	Mon, 07 Jul 2025 11:40:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjWK-00000002DCR-2dgd;
	Mon, 07 Jul 2025 10:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885783;
	bh=tZzpJ1Lo2cmtrq4MyCjpJiEHM0yEw3fJD2CdCiZOAkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPfH2oXnXKXYljNb9a4X8KmJ3OrIg3Pj5GanNOL+st7z9TiulXYZ4KKi9GdBZzBoL
	 0aEGTe0E2Y8m2lSLO2N2ipJ15gWrNxjJSELslMr9mbvv9fwkZuXUGLbMYlmkdnSPVc
	 J+DRA3Dmfztk7Uh6jIady+Vdojw0W39fWr8h405ocay9b5u4Di0WUtVuVOjj0Ctgy8
	 AsMW0VQ0otldVFBfWT1tPGVrucY2JPHoFMZ5EfY74YIX4jbeL9L90sYZHap5i97tqS
	 ecK3QXELWp6IGHeX5pih5EFFOmC2qW2EQ4bGbEXaiPA03vy9c7uWEoVk4oZuABabE6
	 xsI57Wo7ZPrSA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A68F17E11ED;
	Mon,  7 Jul 2025 12:56:22 +0200 (CEST)
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
Subject: [PATCH v2 07/10] pmdomain: mediatek: Add support for modem power sequences
Date: Mon,  7 Jul 2025 12:56:02 +0200
Message-ID: <20250707105605.98248-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035624_842961_B04D6D90 
X-CRM114-Status: GOOD (  15.11  )
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

Add support for the modem power domains by adding its specific
power sequence in functions scpsys_modem_pwrseq_{on,off}() and
call them if the flag MTK_SCPD_MODEM_PWRSEQ is present.

While at it, since some SoC models need to skip setting/clearing
the PWR_RST_B_BIT, also add a MTK_SCPD_SKIP_RESET_B flag for that.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 41 ++++++++++++++++++++--
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  2 ++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 92a3b523002b..e3a332bda70e 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -279,6 +279,36 @@ static void scpsys_ctl_pwrseq_off(struct scpsys_domain *pd)
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 }
 
+static int scpsys_modem_pwrseq_on(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+	bool tmp;
+	int ret;
+
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SKIP_RESET_B))
+		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+
+	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+
+	/* wait until PWR_ACK = 1 */
+	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, tmp, MTK_POLL_DELAY_US,
+				 MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
+{
+	struct scpsys *scpsys = pd->scpsys;
+
+	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
+
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SKIP_RESET_B))
+		regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
@@ -297,7 +327,11 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
 				  pd->data->ext_buck_iso_mask);
 
-	ret = scpsys_ctl_pwrseq_on(pd);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
+		ret = scpsys_modem_pwrseq_on(pd);
+	else
+		ret = scpsys_ctl_pwrseq_on(pd);
+
 	if (ret)
 		goto err_pwr_ack;
 
@@ -366,7 +400,10 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
 
-	scpsys_ctl_pwrseq_off(pd);
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
+		scpsys_modem_pwrseq_off(pd);
+	else
+		scpsys_ctl_pwrseq_off(pd);
 
 	/* wait until PWR_ACK = 0 */
 	ret = readx_poll_timeout(scpsys_domain_is_on, pd, tmp, !tmp, MTK_POLL_DELAY_US,
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index fbbfb23a8739..931a54f1c5ca 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -14,6 +14,8 @@
 #define MTK_SCPD_HAS_INFRA_NAO		BIT(7)
 #define MTK_SCPD_STRICT_BUS_PROTECTION	BIT(8)
 #define MTK_SCPD_SRAM_PDN_INVERTED	BIT(9)
+#define MTK_SCPD_MODEM_PWRSEQ		BIT(10)
+#define MTK_SCPD_SKIP_RESET_B		BIT(11)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.49.0


