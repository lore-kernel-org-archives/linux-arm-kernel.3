Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94404C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeObeVb4GbBSLqBWiT+K4sV0unWXMqZ1MVc8hYWeG/I=; b=bse00e6KqFfojwo68BD+IMAR5g
	67Fxub+C2LcAipeXhXKJRpBbqpQeoqDbFHp0VIXqhbFdkkOREQT36WWHn1JoP7hWCVfwRqOHQbf9j
	MBQtq8Kga6mhGIO1e1hcfRm40O0edr10XLGtw83XUVJ1bI1BcsfW5Cfx8mme6a0y0NpevrKJkZhfr
	E0xQ4cIguYDPcKyRgAqtVZhU7dRNDRwGavsvOd+LdLHfqRJxBcGcDbqjBSxvljZ/eDLUsXXNkekCY
	RmAWUIoCc4rNtOZXfderL5YzNOosQY1ey89F3NCuKmAoHDkoFGMhMUIgkN32O+cXgosvzd3HEtD2R
	lGKTzwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucVL-00000001bb1-1y3p;
	Thu, 13 Aug 2026 20:58:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUu-00000001b0w-0qtY;
	Thu, 13 Aug 2026 20:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=xcKpKD5O/kkk/DdwRv8U2NfIFv9iJTg5yazZrxLkzIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NKl+WI4RxGulk+AqiNq7YSai2phhHL3CaMARcI9pXX8ORp80Zzd8v+YqwiRAndi0u
	 zJM6VH4Bh2DnJXjJZ/nT/SaZKe36M14gd+EvKpAVrR2btpsTcLNQxCi4y107GYKC5q
	 v8pkvgm0JhAnevzHSzoXPwemnUzjUqmbWT5I/kgy6cZf3rXV+QHSX6GsWtuEAFmYdJ
	 DtEx0/1GIWRhKf6pAzVWnYLRSdmGGvxxl70WigEVAtsSsH5LrF9TGtXtbIxAPEGWQO
	 UBWvj1Y5uLBMzi4swFUbqU2xjQgUdboB63hhoNuz7o8PhP1ddHq9Y7scHDbD6R9R3a
	 rNyy+7TVLPJ4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9BF517E12AE;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B962E48006A; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:07 +0200
Subject: [PATCH v14 24/38] phy: rockchip: usbdp: Add some extra debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-24-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xcKpKD5O/kkk/DdwRv8U2NfIFv9iJTg5yazZrxLkzIk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmU2IO6IVhvmwkL2c+dEjkD2Mb6ivJOn2
 iT6iiNCPnqadokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qadrkP/3goplmXpxq2uEL1kizMtzwPArCpJzxXfdyGd+0d+PwrJYenuGdWduZknsNlGnnAP5m
 ozVcIzVj1KaH+Hc5lU/WZRzw9xsAOgbAEWkEoh8IYlZBTx6H5KQEmBeOq7MrklleUNdn1fIj6KX
 yTRY1nh2PkOtGiKAwx1d7nIKt0sPqTkPiDLHT4xWNQXenbtfeutUB925AM2CZnPxql9OXyAT6/Q
 f7FEp7H784aJmP9Bn55pfmP0EC4PJSqGNrlmXlDlomX+61s1C3mcQRBLrATtol2hF+7drHUjg1W
 VSQ87eClrqez5jy/1SLEtCMPTVbFWinI3qtV+74Q771m6QA6cDI+2cjvokj4zF0mu8Ylcj9stWk
 +PtpcuAyKAGv2xgaGvqnqkTyZnevLeaaXt1Z78igg3OWjf5EBXL9I5pE2hY5MeqR/So611MKLSB
 rIk7/a9UIRB4aKkz4hGJ2zahNY+ejU5I0WxTx7xmm+e0gTrTOK2u23niLRFvKVIawD6WNWWNPK1
 HBIp6FTHtFLua5y6FIUR3ihzLI47xPrSmPzLZhulKm/OEbBYjz5I8Z2z5171nJxHX5YSr4Uq4Hi
 4dOlzCyIvopYM4jLN+RN213HBOonOYTteIWBsSmyh0gMZOZf4KtLGF+tWcBf5ijqm0jIdkjf3mI
 PGMgS3jRAXn+i+VS9HY86eA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135756_404187_56B653EA 
X-CRM114-Status: GOOD (  13.14  )
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

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b40b5d9ce587..e67c1df792ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -24,6 +24,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -462,6 +463,8 @@ static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 			return reset_control_deassert(list[idx].rstc);
 	}
 
+	dev_err(udphy->dev, "failed to de-assert missing reset line: %s\n", name);
+
 	return -EINVAL;
 }
 
@@ -488,6 +491,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -662,8 +667,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		return 0;
 	}
 
-	if (udphy->flip != flipped)
+	if (udphy->flip != flipped) {
+		dev_dbg(udphy->dev, "cable orientation changed, PHY re-init required.\n");
 		udphy->phy_needs_reinit = true;
+	}
 
 	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
@@ -781,6 +788,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
+		str_on_off(udphy->mode & UDPHY_MODE_USB),
+		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		udphy->dp_lanes, str_yes_no(udphy->flip));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -851,6 +863,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -869,6 +883,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }
@@ -1308,8 +1323,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
 	/* Ignore mux events not involving USB or DP */
-	if (!rk_udphy_is_supported_mode(state))
+	if (!rk_udphy_is_supported_mode(state)) {
+		dev_dbg(udphy->dev, "ignore mux event with mode=%lu\n", state->mode);
 		return 0;
+	}
+
+	dev_dbg(udphy->dev, "new mode: %lu\n", state->mode);
 
 	guard(mutex)(&udphy->mutex);
 

-- 
2.53.0


