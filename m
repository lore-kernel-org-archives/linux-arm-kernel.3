Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1126FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru0+sDCh36WRKvnrrh0caFU6O5lGZHzEvbm7T7ASnrE=; b=ijNLbBhv+IIszmELV4w0cRTQkr
	6HiyP12h5XL5fJl4pUA8yXuK1BG42HAVOwS9pMs6C9bicLwtJqBWhjyTlTtAeLdwBKIY1357nY9nx
	gSAelHCka8TWlQ3US8zclIWyeFtYE0HTFJ9rTiZjr8qrTO2j1SxQvU5jVh4fP4pW47wJ48qVSZu8b
	MEwDZ+as6qwLqy8h1iZzdAdr8aFAvrQoo3NK7p80WzKI7C3+Ab1PGlvErgRbdESOc9o6m/NjB7+G0
	1nvaez9W65lzIAYsFMhMhAY104pNC/HbJ0HTdlVfVLMufZDsqYY5rPPtrktWYCAKpPN3MUfdabRJe
	YSdzzJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiuh-0000000D7HE-1jG3;
	Tue, 14 Jul 2026 19:35:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiue-0000000D7Fo-0iWJ;
	Tue, 14 Jul 2026 19:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057725;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ful6Ju9cdFmKNPUEEKH/zFllOJ/MQyVwPbqDMcOdkNyXZTP4rQWKL39A0PVaNWOvK
	 epw1m6Y9yQbK8sckHKTSDYFfsTpTAUBs9+mMUy20sK0lFFQYQkiVktT26ZHTsXLq1x
	 oPujTX/40Az7AQ7o0ieqmWKQdK8LuEwS6x6E9qaHagg6Xj9K6zqLQBRb3f7m7iFwPZ
	 Jzct7j85z0S2NxyfGcuGsoGAxQ1PY2HZnx00/K9QgKZGH09ATfDxQvtNhI/IltS6vC
	 AwkShD0uiu7/TIrDmnrmRYluqG8/pdH70jvThvKyMcQr5gWkX1nxdv95F24hGrQ5US
	 NCE9t82HScvjw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE72C17E0928;
	Tue, 14 Jul 2026 21:35:25 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EDE5F480067; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:22 +0200
Subject: [PATCH v13 21/35] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-21-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDN6PqS920WWW30IhHfv1MR1K7reXu4q
 fxzyU59q3EzWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaNkUP/3SDFSJmB/Jf/Jwr6FxQLjhiRQY5pvNNbpmStQp763owq3dXPJk4fBEoYUC920K8+uk
 /D7iGwuD9s+DAkIaCBnJzKmjuohA/JP3b2pZQkfsSVWPMq+KYpB7ErbFb1UhLqix2tPI5TcKtUe
 hKxo1cZrgKyNIPYEFIBDfU8AKlDUO8tb/Lzi18L2PSqOn8kKY0t7gFkGP9lVVv1QqwAF3Jb4CvK
 8qL1kRr71zqVDpVXHGtd4GS6JlRdkF3dvTSVyuMirBcDQSnRhQUJaKS/aWSt/f43lFIb5XCPR3+
 tVuCteyvbBS1o4DkhzTq/zyOf4HLcXGSBDJfHW/wROoC/ORSP/scMCopbY4INkWe5l09SC4li8W
 WsmV5RW4IkDrrG9XklTTxeRhnShYZbB+N4s6f8fI5Dwnx8RXY1k4tZvJiBkHEvLomYfDQc5ZWVw
 VX746/CT+C2vbfuvfTE1s5w2HsPwWEQKPYjTvRTg6/kKi1oKoZ1N5eYXMZUYhNGM/7i8IJ9oHVZ
 Mhp0H0c7jUxB6e7TufSxNCFY+C0tOPycyWu/gCG8r2/SUCxWq9ixGzkV9j1Qb6DEMOO1l094glq
 yNFfZnYwuwRmfDCS1gkIyhWtu97H01puIOTdukpVlZaYosxo6fK7mbAI7rPvhKGkBbhr+H9C7tN
 Lidg+2WMpL8bLkq9yZfQ4yg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123528_365352_CB4E2B85 
X-CRM114-Status: GOOD (  12.65  )
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

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4e54020d1755..0399cbf96e19 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1293,17 +1293,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0


