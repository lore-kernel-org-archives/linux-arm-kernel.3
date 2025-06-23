Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyw1sYXTVfXSC4N1d31ZyIII9fqPtHKqqBezS31XfjE=; b=I4wsJyngI0nNz00taHPwq6+yX2
	SS0PRbxBIulD9P65BJuKnCxS1hXgLWo7/TzM5xdQogo8ZMG/P30vCSnsJsrCv7TVSDtGt+BM86M9H
	N5tt+roYwdr6psipgANg7saQyH0h2oRWi1bmeJHsOIGYOqFfFf8RmHd88lV3dMIknZpn4ISskK/31
	7SLkvUn0jVHXBA40b/i3Hg2DMVotEs80hVlgTX1HzLWIZk5qOPtEu9hS53qAu8l2ilxymCuwR8R30
	ZWnCxJztLmzppe7BvZ1BXAQxrY4epreXHIex+ioavEecML93pkL70kJXuSi6fBug0YIOdHsBFxz+s
	I1azM69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTin6-00000003AZS-1C9J;
	Mon, 23 Jun 2025 15:09:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfsC-00000002bDa-2srp;
	Mon, 23 Jun 2025 12:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680123;
	bh=/BrBadfVBZBtuYCZKYq9WvAYMEyISTzymr2tI7L36ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItVGlM56jF8hdlUphc+whwO3Baa5KHILBtlyLyq/SsUgeif3K125qOOmDSprfPl0o
	 qI+ZMh0YX4XufYgczaeXshzdvqxT9iHogH6w8P6Xr1OyTWL+2MB/EW77R2WA2880yx
	 NH76uzCO4ef0RfNHKfMPTxwOnmSC4DrRAnPMX6av6OlYLYX141zrUisGliYw7iuvNu
	 D85GMWYa2Pi4KOPzxbu9QOvHWN8y5gXjsJSyd7qc56yGdoYTQLP0dLZ+2Yv6w32IDn
	 dt5SqQ9ts9EGeqH/GnERkAkRbiZ2UDi3gMtzm6YtKeUYsbytbY4XhH3JpRd4ox7K3Y
	 CPZ+/1kq/7Z0w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8087F17E156E;
	Mon, 23 Jun 2025 14:02:02 +0200 (CEST)
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
Subject: [PATCH v1 05/13] pmdomain: mediatek: Add support for modem power sequences
Date: Mon, 23 Jun 2025 14:01:46 +0200
Message-ID: <20250623120154.109429-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050204_871881_AC2C56EF 
X-CRM114-Status: GOOD (  14.44  )
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
index 331736d55329..d14616d4aaab 100644
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
index f7f0a5fb383b..4abdc8de25c8 100644
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


