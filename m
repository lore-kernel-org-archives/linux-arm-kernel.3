Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF44C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypIUcpTMmxipzJmoRvJ9Kc5ul5JMUL8LuTCssF6XagE=; b=Dau0QDHdKjEUftxcp4ZbWrWfE4
	Kwlk/fMy1XXSRjtwiy6g3+7YZ0pnqUnXYRHE4mOdhsUUXOMXFFHn+0hSIB0SX7Pnjao1EI9xu5fwV
	EtnDxnJyrhRwnjMdQ/ay1TEqOVWO7qeRkHIPl6jqdUBpMmqveaA6ZviwhjSn+OnHizeH6VEP3ebdu
	GeCltyjUesAE/Z6fQAe/Tzk8n7XDyU5//omX2uZGMJE4ardKGsFrwMauVD+yuz7IEfjOJDrvaHnPr
	1+dSjFLfNrS2sw3MWRUW5yoI333tRfrWOvuDm2HVqMTPUrcc/xt/jfYWsk3ju3uw6Nb6nMgIAIEcM
	+6JOejvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tj-00000003B60-1jrP;
	Wed, 01 Jul 2026 23:36:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TK-000000039vU-350c;
	Wed, 01 Jul 2026 23:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=pwFDwrpgZY9t8TZsmANZyOlhkd/wcOwKPA161Wos6Nk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QIxb7UakOtZFP5hehJHhwFM1jNiHOnYErV6AID3UPqtcoABIVI3SjjmLK30/y5BZN
	 +ojQSsGolHLa4Qcr7x6KoPuovTuae91y6QQRX3WtZZclSN5bABatA+aCSO+xzsc1rx
	 1JKuSaQmerPfBSihxPnEyvyFKdOQn07CsMhl0uSgYgQKPRGNTy94dm418TXr6uHwmW
	 kDMHuQtv8w4BNNbg47z98TazEqA9BsazmEoHZBwAxtGjaEl+4i3Ei/H9b0s5sAcI+b
	 cqyJFasZdF7Fs3jVHGQi9ndNsILQmugSzlwZc0KPdNYjEfFDoo+5qx/VN6+Z+OY2Fc
	 UvpffkGMKdgoQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEEFD17E35D9;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CD2FE480068; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:00 +0200
Subject: [PATCH v9 22/38] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-22-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pwFDwrpgZY9t8TZsmANZyOlhkd/wcOwKPA161Wos6Nk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFR9w8ULPwm03F3eNYgRjrqpqIpkxwdGl
 Ps7Ti0bRwDFa4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaz4EP/1CYWU0b8Q4ekLkP9CiI5enWTIBand1oo/jwnYcNLT3cEGT3ABrpsLZEaXRetLr0SIx
 5Hox2f5+7n1d0gHIp1PkLzAGDHUbtpvdjv+Cdb6fdtVmzY9iappGusm1V/8Jr+3tAp5YYohTKRu
 EOZqCU6dlkecbFHGlDkVGAyNd+OE4L90zc4GFiLtDN+u2eq91COBhGjT411DDRmfdXWRYVHI/2/
 z92F+HRZmCfMrNQfRn3d+onf4x0fpLDUcoGBpU0GNKKOaq4p8YuQvO006mquR9gOb/WQyqsUDmy
 dZoq4boNzCpS6GLzGGiQyobKKp0ztsyfc9FqpIp5JqRKQOHjsnweVzuuphiY3tr+PebJZevFFqI
 2XZNlJ8BRdY38iR1rHjFQnSUKEIg9xXlRUrMkyFmuRH0Y0y93Pt1XhG5qwD6AcOsHJiwyWWtQhO
 qz8UEzx7t0MqgNwL0UUzMhA1TDAgCTHt9nf+5s5UOGKIfWbS1nFakKXxuAJt1rn66E7GWf6FviN
 ypIxwDjPVdnbyeIZ2J7ZmQ3j6ZDrH5ZVyvlZXn0zi4BMOXflNfWAq+08qmnRmrQ7augK/yxF/uA
 ETRhIrlfu9GjYz6tvbpc7HVtAuYN7KnhmwlWo3aNj0IL1MMuYWlaCMURaVs10JWvYim4lDQoAVO
 sjYju0UKDvwqR1FLINdwsEQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163603_014167_B7D2F2F6 
X-CRM114-Status: GOOD (  13.21  )
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
index 70ef02c4a187..9f0c0127e6d0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1329,17 +1329,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
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


