Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A14CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWZ4GiBEFujDrd/076IUmJSFK/5E0kNgV5LKOYyEubk=; b=MedXH9w6vv9NUs4KOC1YSvJW76
	VKUTWfJWQmly6kpxSxpldV5nDT78V2N/DHwClD3YCiolXdDfASXCVz3dn1V2q9+0WDOFP2QFfw44n
	wnxnBUGEWSdx28NEPzbAdovDRLaxzha73SSQscEzWc3KSJmXd4999FyHBZ5c4sY2HpjQPsVl+pi/O
	CuZ06Xj7l73iwWijM5Br9mltB+t4s7mchGcP+LC7eyN8+K9PgqBwc1bFkcsNOjd0IOLCapCODYo9r
	IO7Ckq5/uegdd9hbKEZwJE1v1cwooLjf4EqqQp/bbBR9YDiURkl5udyUsjKV0OYquc2Vm7AUBKvow
	Zv8fKTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0v7-0000000AWKy-0yX9;
	Sun, 10 May 2026 09:57:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM0v2-0000000AWHY-0lSU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 09:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778407069; bh=DWZ4GiBEFujDrd/076IUmJSFK/5E0kNgV5LKOYyEubk=;
 b=e90Y/pVao2vvY+WuLwm7FHyikeREQvJLwtAjwmQkCDocx/9wYW8fcQiUOBRIzG1uvd90NNyq1
 SUxLYR1rUGP4wrc/nwj+AW/sI5SXSxiO/BHSnx9Cw7iQ1GiaomRnNwoWNkHUu1c4qTw1pyNLzpO
 ip+CTomwKDStTMyVsh601bX+IPmqa+DDP71tU6GGXMOF0bLgeIHxrcrKxzLLZ2oflk9mLTai7Dt
 OgaNW9BtjCoT02t6rxUcgAnHpVe/+5RIW/I3OiRo2dOPxyPXdcAjL37rckAwD2ll8FCwhzitHkM
 WOehdpcnOZHk06qZG0F4zrsAzov0TJDPKsZ47RAHlEgQ==
X-Forward-Email-ID: 6a00569249521910acdb9441
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/2] phy: rockchip: inno-hdmi: Add configure() and validate() ops
Date: Sun, 10 May 2026 09:57:29 +0000
Message-ID: <20260510095731.1222705-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510095731.1222705-1-jonas@kwiboo.se>
References: <20260510095731.1222705-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_025752_310056_51BAA5B9 
X-CRM114-Status: GOOD (  19.28  )
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

The commit 10ed34d6eaaf ("phy: Add HDMI configuration options")
introduced a way for HDMI PHYs to be configured through the generic
phy_configure() function.

This driver derives the TMDS character rate from the pixel clock and the
PHY bus width setting. However, no in-tree consumer of this PHY has ever
called phy_set_bus_width() to change the TMDS character rate as only
8-bit RGB output is supported by the HDMI display driver.

Add configure() and validate() ops to allow consumers to configure the
TMDS character rate using phy_configure(). Fallback to the deprecated
way of using the PHY bus width to configure the TMDS character rate.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Add validate() ops to validate that the TMDS rate is supported
- Split out parts that remove the old workaround into a separate patch
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 47 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 1483907413fa..9cfe956fefe7 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -245,6 +245,7 @@ struct inno_hdmi_phy {
 	struct clk *phyclk;
 	unsigned long pixclock;
 	unsigned long tmdsclock;
+	struct phy_configure_opts_hdmi hdmi_cfg;
 };
 
 struct pre_pll_config {
@@ -554,7 +555,12 @@ static inline void inno_update_bits(struct inno_hdmi_phy *inno, u8 reg,
 static unsigned long inno_hdmi_phy_get_tmdsclk(struct inno_hdmi_phy *inno,
 					       unsigned long rate)
 {
-	int bus_width = phy_get_bus_width(inno->phy);
+	int bus_width;
+
+	if (inno->hdmi_cfg.tmds_char_rate)
+		return inno->hdmi_cfg.tmds_char_rate;
+
+	bus_width = phy_get_bus_width(inno->phy);
 
 	switch (bus_width) {
 	case 4:
@@ -602,6 +608,42 @@ static irqreturn_t inno_hdmi_phy_rk3328_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int inno_hdmi_phy_validate(struct phy *phy, enum phy_mode mode,
+				  int submode, union phy_configure_opts *opts)
+{
+	const struct pre_pll_config *cfg = pre_pll_cfg_table;
+	unsigned long tmdsclock;
+
+	if (!(mode == PHY_MODE_HDMI && submode == PHY_HDMI_MODE_TMDS))
+		return -EINVAL;
+
+	if (!opts->hdmi.tmds_char_rate || opts->hdmi.tmds_char_rate > 594000000)
+		return -EINVAL;
+
+	tmdsclock = opts->hdmi.tmds_char_rate;
+	for (; cfg->pixclock != 0; cfg++)
+		if (cfg->pixclock == tmdsclock && cfg->tmdsclock == tmdsclock)
+			return 0;
+
+	return -EINVAL;
+}
+
+static int inno_hdmi_phy_configure(struct phy *phy,
+				   union phy_configure_opts *opts)
+{
+	struct inno_hdmi_phy *inno = phy_get_drvdata(phy);
+	int ret;
+
+	ret = inno_hdmi_phy_validate(phy, phy_get_mode(phy),
+				     PHY_HDMI_MODE_TMDS, opts);
+	if (ret)
+		return ret;
+
+	inno->hdmi_cfg = opts->hdmi;
+
+	return 0;
+}
+
 static int inno_hdmi_phy_power_on(struct phy *phy)
 {
 	struct inno_hdmi_phy *inno = phy_get_drvdata(phy);
@@ -670,6 +712,8 @@ static const struct phy_ops inno_hdmi_phy_ops = {
 	.owner = THIS_MODULE,
 	.power_on = inno_hdmi_phy_power_on,
 	.power_off = inno_hdmi_phy_power_off,
+	.configure = inno_hdmi_phy_configure,
+	.validate = inno_hdmi_phy_validate,
 };
 
 static const
@@ -1392,6 +1436,7 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
 	}
 
 	phy_set_drvdata(inno->phy, inno);
+	phy_set_mode_ext(inno->phy, PHY_MODE_HDMI, PHY_HDMI_MODE_TMDS);
 	phy_set_bus_width(inno->phy, 8);
 
 	if (inno->plat_data->ops->init) {
-- 
2.54.0


