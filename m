Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5019DE8785B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLYXhp5mBG6opXFUw/8QV+CLBA3kr5FcS+VXPq8F2bI=; b=U2HyxK5tXc1HXLcGoLCbCwrNgR
	DzG2qBG6yuvsdI3hwyXTk97CbfXkYWgYMRMAQkqJQxt9/MuyRu52pJSE1JawXi8hvHySw8Sx17kAY
	0Z/KgvxqKyhgnhNb6cG1p8fkFmFPQcrjD54F8M2NZ0rKPZ2Axl5jJ44QisIAw1lnMdgHaJ0kBzBX7
	1nCc34Rb4oc4CuyLS1NXVF9ZpmX+Xn07zg/1C1w8rrB3DEqYMqrAbXqYXbzeepJG4VmZsq2RKMWSw
	HcQu6T3IhV9arsCUQPC1YNbTfQxSioZGn8lPzH4Hc3vU28oZuVVeTCmH9XiyOT8vZOx9k1UKpadaY
	QTCv1j0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLn-00000007Asy-3xNJ;
	Tue, 03 Feb 2026 18:42:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLk-00000007Aqw-3Pb0;
	Tue, 03 Feb 2026 18:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=aNPpmtizUfjCpacYUbzlKBxSJjjfFCObnLLiTwZTN6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NwvtWA2LCqosWqCml+DCgm/ReMmenrZDKuDuxmACzfGBi9e77qnvl3O1KfV21NbWF
	 q1EJYLC4S/wo2jraiktT42lsrSjMRFlC9N2nAQG2n5h9KtMwW1ZMgQ07DajVsD3VBR
	 te0wr42WmF65waN4tXa2JZwYvwyakZz+Cqo79EJ2YxBHJCMK1DQAbYich/GV4D7zIK
	 n25L7g5Wnl92HQlfb6TA3fHlGB9Vfelr723uyGY7HWfJ+KVGga/32Slb3amB7KcBlO
	 aXUeDCknD6jPQRl3Fc3tdXrHcwh4AY4BkAGWbCfm46Tmc1225hJbG1mkmpisNb4vgZ
	 KQB1FlcPsbALA==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8354017E1276;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4CC3B480028; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:29 +0100
Subject: [PATCH 3/7] phy: rockchip: usbdp: Add missing mode_change update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-3-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aNPpmtizUfjCpacYUbzlKBxSJjjfFCObnLLiTwZTN6g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX0AAJVtr1ntwPQSj4vwqW8lHUnFIL9jt
 R+Tyb5HmUFVGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qafBoP/0QWxxxWbY8PGSBabiYxPlGQNLQzvQYqWBZnnOMMDqliYOfYS+rSJKrVceLfpsR7mgI
 RdF0hSxuNuYV9ynyBE0aIavsxHSBnMhgoeMHPEL0sVt+T1qXRmNhQrU2/AWd327tZDACurRwxjV
 QVOk3iVP00V1c1ovfvKq7MCaaxRueyi4lEwWgEYblCY9YWwyiR5UJJqjQ0RD3RxaOAXYu7SOLlc
 FyqWzlnT8SwBewIpIb9AqFSxU7ifNeOfKzJ8NOhmuIL+GdB4yWvxDx3J4k2e2oiSpqENH0dRs7Y
 tyMRpM90PyBnyT2RnminUVRbUZOG9CIvMOcFw6rAG/CS2EYYHsvrf7UkfoDfPW6yr9hisrb1a5l
 psL4O6WR50+PeQYFjy/PigGNQi4nCnLKo6OecMZ05WmQDAq1FnPIAAOtHA8t3R4vEKwJ39MxmTk
 RsQxNh7b0vEmVYl11m7YnuliyXSOlVCS1OOeb2HdWP/VmgL+5RHLh93FYCWCh58U9Tx+CLYO70U
 uQfNrfr0Lu3RrJOUxPWLw+td2g5CVLbvDUPAQ6VwrcwHhjwhGtGj9hsbUm0Uf5HNvRmoaPwnyU8
 /JBVMRkyqNJOAyMNDI7/rPqCE7xCMuTtfUUu10S0USrUbLNLo08SVygMcKNcJ35XFr1giC7Z/wi
 70Ega1KRNvEDNDFHyn98itg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104209_027609_4218EE87 
X-CRM114-Status: GOOD (  11.92  )
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7e4142aef192..5304e2d86d11 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
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
@@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1387,10 +1396,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
2.51.0


