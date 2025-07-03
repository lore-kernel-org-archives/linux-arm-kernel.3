Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98045C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRziDRiBdwZelEJ0b9FmKe4V6qUgZQHR+wmB4MWZ6DQ=; b=LOGeh4aB8i95JP9aT1l28Tvbfj
	moKpc1fRLeuMv6jKQ5pBPnyRWhPwSXCsDvP1owul0xyT2w8xmKdx7/sSz2jVr7+z80LzhrTgKFa2G
	8sAAmvAU3ogEjRt3DXLcclMp76S1tFzbKyQjMgT11iDVIKiwGWF6V/A7JnCFkrdyEwx29uxROOXqU
	WuKx8FsUuHYcc9OgAuWxgV1O0tDuMWUD3IVP1yfi5Da+sqcokBj4dy5Eag3R3d4hsRnTqzY9qVRmX
	i22F+Ev82FnqNNTn4NihhiIJ3PUc8Y/JrhscCoMkf+Mow5bT7e/HxQTMsz1WfLNPACYnDf8jSFmUE
	5td5GV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJ1m-0000000BKKV-1FEa;
	Thu, 03 Jul 2025 12:26:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHiW-0000000B5wj-0Z9Z;
	Thu, 03 Jul 2025 11:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751540578;
	bh=u2+2AMEHGUVrK+IZA9KYt3nt6AITvzdvalgfe7iOmNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QuRv1H8g2BGdcWOJthHPDbIAsC4RscbIpPqrPmrSVpQsI292vTjYc+nJ4zK0czTgD
	 g5jmxdhTbEPrJV1Y+zImrpzybGvx8F6UGEsqqAo5I4vLJR+dPqZ/n/seK6/4rrXhdn
	 RHpJnJkRxDb7OFMgqSHciS1mjEUHjXNARKVAAPyH0gy5TjeK6F3+w+nfIrunWxMs91
	 cgDsRzypkr+p81S0cuol/N4CJokJ5Pr1fdt3obyliKn0K8UQHKLGV3NbKKo39AFq9u
	 sUaMxmevPLSnS74aw/2qxFSHh1tyFTNvc7wYiMzcRScaLfgTPV5/X4BeJixJSDQyNE
	 zmyMFjCUTNAKQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DA7717E0FA7;
	Thu,  3 Jul 2025 13:02:57 +0200 (CEST)
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
Subject: [PATCH 07/10] pmdomain: mediatek: Add support for modem power sequences
Date: Thu,  3 Jul 2025 13:02:44 +0200
Message-ID: <20250703110247.99927-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
References: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_040300_351452_F724ED1F 
X-CRM114-Status: GOOD (  14.37  )
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


