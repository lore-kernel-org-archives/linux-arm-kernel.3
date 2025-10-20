Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB78CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj6MA66tzVBn+KRYXc/UT/sYW9ZjhkSRMZ8pqWy1J7g=; b=pAjcyj/bgJVZ5511H2fEmqFPRM
	awSB1dlLvzmegbUgDGevKLbaCMzhUC9pcXy3gj9Q44jt2YvF3tXfv2f5f3saPqWrlWwR2byg6sEby
	KoGinDZ1Kufwhe2aiWmEGmKDtlY+a7hqB7rH3xasjjfS3gAs6hv03Rn4n7y07UcFR5TptUh+qUIKj
	BpWsMdOg61HPChJ/fQ0Ctjv0QNIKItrcsDW0Ffo8/LYfmtEGhsi15hAnHh5J9z/9D5QTCgPI/IEZb
	FtmWIn8ctLQvCfh7Kr4Wmp87wneDnR7zgzcI1YUvbE0I1tzFCUC8uRyMZ4K1qOYcXwlN52nAApt45
	opisrKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDP-0000000CN3t-2VXu;
	Mon, 20 Oct 2025 08:26:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDH-0000000CMqf-3gIY;
	Mon, 20 Oct 2025 08:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=Yj6MA66tzVBn+KRYXc/UT/sYW9ZjhkSRMZ8pqWy1J7g=; b=v2x/H7jjQM2bM50tAt6guxmne9
	3RK9T2Rp+ZjfBlQNhgis87jMVhX25x4gHOUTVHfePIjXqEfsS4SRzYGz3kYSzYzeSWbeGsPHmsbFE
	QQX60MsGnpDvBcgDf3SVjv8d1d5yQ2FCwsolFl5yNqZN6jgAbnJHJWJoeTdMmyLbUGWJMVaFd3u+A
	jG2bwh9VpTt3EMzFxgNOJgvXD08GuCM4wp64KueWM90+7WNMSQBOfeVXww+e+Rv676rupj8g+Y5jb
	fY8z6sE5jVmTwHDMIxRw/+5d7+kmZq1Kjfhgeciai5BRqCraZrA8yhQ1qAyfhC31+jLkbZ3AmAZ0z
	wJ1BOxAg==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlCy-00078O-Ha; Mon, 20 Oct 2025 10:25:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/9] drm/rockchip: hdmi: add RK3368 controller variant
Date: Mon, 20 Oct 2025 10:25:01 +0200
Message-ID: <20251020082508.3636511-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012555_923237_6E224D94 
X-CRM114-Status: GOOD (  11.78  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The RK3368 has only one VOP, so there is no source selection happening
and the controller uses an internal phy for the HDMI output.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7b613997bb50..95ff3fce97a3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -467,6 +467,19 @@ static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
 	.use_drm_infoframe = true,
 };
 
+static struct rockchip_hdmi_chip_data rk3368_chip_data = {
+	.lcdsel_grf_reg = -1,
+};
+
+static const struct dw_hdmi_plat_data rk3368_hdmi_drv_data = {
+	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mpll_cfg   = rockchip_mpll_cfg,
+	.cur_ctr    = rockchip_cur_ctr,
+	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3368_chip_data,
+	.use_drm_infoframe = true,
+};
+
 static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
 	.lcdsel_big = FIELD_PREP_WM16_CONST(RK3399_HDMI_LCDC_SEL, 0),
@@ -507,6 +520,9 @@ static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3328-dw-hdmi",
 	  .data = &rk3328_hdmi_drv_data
 	},
+	{ .compatible = "rockchip,rk3368-dw-hdmi",
+	 .data = &rk3368_hdmi_drv_data
+	},
 	{ .compatible = "rockchip,rk3399-dw-hdmi",
 	  .data = &rk3399_hdmi_drv_data
 	},
-- 
2.47.2


