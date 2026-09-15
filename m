Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94058C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8fniTZI8XR9FSsZYhrFULCQEmwgEZ5FglcjWYEjjNQ=; b=AOAK0eL7qx3J3+dgExtQwh6dEl
	M2w0HoDOCErDXe5i3H1gT/7hW5NgGpJIeZI+2zifVjGjWqfzXUKY31s2uKMhd6YmaJneTd7VTutG1
	atPzoXs2+rGT6G01aYxHryUNzS1y4NdLsNrH6Jl83/sbRPtZMHoBCuD+zfEk8rkLsa3lD90FGz8y/
	pwjv0F0/XnjWDAV13GKjG4JhP7xFNxmH8MXqRfXD+T6ZTVcQj3HG/qarcIXGhJKJ8yiKtA0C2Ebrw
	5zofipwFIG58V6Pp1NvRG1S3PL3ANwwiGHcN92U0RZ5gztnKHEiWj3QUkbbqeZEJA3y4PaXeEOAKL
	w2YjhWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TYh-00000006o8C-1JWC;
	Tue, 15 Sep 2026 13:50:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXy-00000006nUs-08Ih;
	Tue, 15 Sep 2026 13:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=o0FGCw5J/jf60dEE8q6l56wHTYH0NY6afnOYqwmS3Gw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YE/cqDM4pswPaJbXYBr5Ng9umlCi4Rhb/qeZ0uuHoUwnxqIyki8zO8ZQoiLkoUAEq
	 dYQll/v34yQ4RqZO/pMdA+XlmXnkoYyLv9DwrcIi+vXVzoIPybJULEoiVLDKIocR2u
	 jjxQdMyo2whwQNBoRMgH/T7GKHtSvk+q6z7hOZdefUL0NnYXGXQ6IM1T0NpSJSWOyn
	 zgPmmMjIGkgEgm8eG1n+rhJkTv/h7GjcdLh89cuop6vvQ6qNINlQz+PxmTKCJaNMsc
	 mxyT0jtERyOYTMjwNM1tUrclKhnkjAfcqtSAKiGx9EFpLZhgwljCd/9vzkX7t8S8d4
	 r4nWf3ruvwWwg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E206117E0E3F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 39697480048; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:57 +0200
Subject: [PATCH v15 10/16] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-10-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=o0FGCw5J/jf60dEE8q6l56wHTYH0NY6afnOYqwmS3Gw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQWP+d6kfTCUtfBW4lqyc4f3zJDqcW6iU
 wCAz/LiZ87NeokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaus4P/i+kMUGeBRw5KlnSw4XmgxV6GFK8ya4QCxT5qNMfXRSvhfpAWYua6VPYd7JvBFSUUuz
 1vcYzt53nRMM3xH6JeUn6y74ed4Xpm5+ttFKNcSW3QhEpTkTYYWmB1gxLHMIL4u22iQ2XiWh6sx
 JOIJk7uvqvQvrW6z7VTUFod0qjfglANwxzQIPO/UWshkmxZFnVoj+sehSiCsRpPyxfTdSWGVQLX
 bk9EVTc10/5jtdHJO8+Pu6t1Dn6aesJu1dXWMbDAYx1lPIA3Nm8xPJc68+IsckSiVSmx0XYl8IJ
 Vly9tg6B/Hu0tLLHvmvxp5jqiXUzrraVS/8dNMyxnufdFhEe77hvyYJIZNcjzZMzXX0rB+sWuaC
 q7GjOiYRS4osG58ll0LW1zYhjMvl4Gn7eo2xR23RgXozvi9gGerzAiftU2AjQ52AmtRGKOni5um
 ZSpLv1xJNUkzU03tMYsg69v7zIhYfn2skWjI+nh1CzTiyKqz2ueJH+lRMssDUMV+7xBpevb6jOJ
 9AdgzLgVZGsR5LQs4XErP2YSQlX85dPgOyBi+kiuhFdf8Qn3b5KExgLExfxXg+Xy7Im8LXUvYQD
 HHFWexeeUj10sn5X+I9h2pwn/BKffB5L+HOBj52HzdEv5/xFbpi1+tXUGkJEcdChVqb9QhCic38
 p+wbDvC/e7C4OGH7rihY7Ew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065006_437410_717AF8FD 
X-CRM114-Status: GOOD (  12.64  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 665a4636d9dc..b72daf80af15 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -616,6 +616,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
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
@@ -646,7 +655,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1360,10 +1369,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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


