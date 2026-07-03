Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988EFC44509
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APOw7S4+4y4l/nf/nDC60mpDDgMQlw+vtgaNOP/SUbI=; b=ReRYa9wz6mYNsqamKB5s331m7+
	2VG8n+PXV5zO+nXaSfg7yGHCLZ9UmF88OuaZIT8N4vXE3/+vODcpiMPZGKmPbZ/bEGrXFr0wNqR/e
	QusQWjiSUx8kUn/W+eHtoT4/6aHTnPnhQ7omET9Bh5qBvo2fyAPV2lf4QrOpO+LSnH1glcdLnhkqc
	wj6iwo6x79QzDXeH4OcaZmSlHWSRk0HZ8FH9rcZvZo6DzScpKqXRNF3CqIEsZ1+gB5ApqEQEhXKUX
	pYdV8+Kx6KJFb+F8Rl9LeVnT5GT5DOb/5XvleCo7z1ktlFfxZ1l59lJ6fcoYsS89BTqEw6hldYpQc
	HHtbBrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOn-00000007eTC-01Si;
	Fri, 03 Jul 2026 18:14:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOT-00000007diW-1LOx;
	Fri, 03 Jul 2026 18:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k+X6E+z78YTS9wovrldPdmtyDr9hSbV8ctHhEux31b7ibjPeFMBA492OvhEDGMNjy
	 31EDicUkZkZVsIfnYBQg0XzSI3TNO/i+ou+fc++LvfR6d1MmJjhS1RWTv+3RB+wN20
	 YpzxHE6TMCOGMJE1nhAnRKZnhAnBiDEKE9+RWWW/sHS4p9iDgKU2RJeywuAYx7mE8Y
	 UBMCLdGh6BoBKZ0drUwneuHyAR0nIiZ2zhdPa50LOJXCWMUyN4cbXEQGGhPZCEN7nY
	 GhdaL+mnOeLcnQWmqQnUvBNtV5SpTzRq1mFuU/aBbMA34jRFoiuv6F4rnsBfailyYn
	 FdWSZebxqr/Ig==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4303317E140E;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 87F5C480047; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:26 +0200
Subject: [PATCH v10 10/36] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-10-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8seaZ+CasmQuW9bW7u5vDsTamEMCBlq1
 UCCn2n3vw9MlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaxdQP/06eMic7F5Msbq2+uzaMo8cPQGafgdgoK/mqmwjB4t7ITwDTrQPqueKx8TZOFUc/3ba
 pEISpEXVPIyuBY9fI9kjugbvj9b/lkOtwXG0mWYGqrCxlN3SlP9gLs7khOkKS/4isJBELTdcBPx
 1zIolzxR5icceg2dmAr54ZawEmyV7gGHG2cU5yJw+Z7ymNleJWAjgEXyIjjv+5fjUKTd/vJ5FsJ
 Eewx0ajSUka0akai36X/WiDqCh6ThLXNXfYCrQVQ3yyDgOMy5+TTzhK6uJePln3UcgiC7mov2yL
 KRGIaccvhYSNY2KjCphU5S4JTU6qqHhiiw9JGfQi8hUV5B+N0iPk0rZl+nxwpULEGSSYea4XcjZ
 M3EII9Siajwhd1xK4bSfWY3VfJgBveor5LsCNTJaSUN4cMlC5YJGIX9+wKd1t71XN+t9/n0Ic9p
 YpyNTBGFna6QyrT326kiTl0WcZ168QJLOKmLyadyPiVmO+8rCWwwAZErPUudVHdaIjpJqPu2CLt
 73eSQTXomhzIm4oyNWWOVBkaN1f92dUM29+1KS0+31wDEbpZ3GPsSZoMaqmjoZxVK+UAkeny4eu
 gKX7BpJ/WXfS6xFgu7Uu7eN0vlvtwRrMjSR2tvcIafyy6xEetQZ2Wd7vGxp6UPlEMUbr85VfQVA
 zw9l+YxZHBIQVuoI6Kmgnew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111341_513404_DC9BC9DA 
X-CRM114-Status: GOOD (  12.51  )
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

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0


