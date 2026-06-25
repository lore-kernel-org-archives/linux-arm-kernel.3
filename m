Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1BCCDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGKojIBU/4fxi8l7wF9kK2i7op2U6l0lHVVMuJjTZ7o=; b=3O3pNsIDjHWDzicwcyrrQYRyaz
	4ROw1Ib1L8nsiW0a9C+4/NBGdhxOXVMFvADTtT+zWxyI/M0aY4RPruCco1lozzKvPi3HMivdnNC1z
	4CM4WSux1RbnOOM3gYTM51c5gIH+m37J+WXwP4C3bKrJyTsbvTCidXY8YYpTf+kQoBd9fgdOR9rKj
	xTVfvkuJou6Uuo7gk41q5cDcX31EKysH44tWHYjgHqn9K9ejKGGFlccCzpyDuuYp4UQi5iBGGH1IA
	/w9nrnTE72C2Qk8k97DHY4soZxQw3Bn4yYnPyUmaf367PZL+YpliwwnKVYikY8czFwC/pif9sfTlj
	UU1x6LnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4o-00000009bgW-48Os;
	Thu, 25 Jun 2026 17:41:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3M-00000009Za2-0RzS;
	Thu, 25 Jun 2026 17:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=85jWd847vUXet0cssxULpV8YQhdqQ+CsRUr07e6o0oI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilM41HW8hMdegRB0+QY1RFtHRTambF0z4sngK2x9qP2OwTW/EOc+d2yI3Px1OMFdi
	 hWP/xgRs1e/CSkuQ8w1oMx+P4fy2l1FeK8EDjpy8sMrK+Rz46k1f+6i+O/7ZowrXB1
	 B5WizsNzDDYvOhze3K0gZxDv40XLQGUmmLHzkCdOirElY7EuSXssH+RgEQaXfmBs/K
	 +KeFPEtHTH7gc4hBneJ63NXKG3whPzCiMweYNIY/6sH3q3ZU7z1NzPzfX0kGPcqcGL
	 QA/s9iLMrvsQMZwedPUPrWui4Uk8Gy3MfcSmvPvU7Dg7ipLGUieBy8cMwptGbgaU9G
	 MDHqJIx/Xu4TA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3013B17E15A6;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1C002480069; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:51 +0200
Subject: [PATCH v7 24/27] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=85jWd847vUXet0cssxULpV8YQhdqQ+CsRUr07e6o0oI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9v3BrncVEotXp2aGfTRe1jCLndpSu3kA
 X7PwkbPxBzMKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaiiEP/1j8ICJvFmbI6DwXgg73wuTTDZtYxycXO3/QsCwkCyRoprWENgU/yube/O7soQ8ZNNP
 ImicPWt3rG8D2McaL2suuBbF80IDgX/OF5PaXZjRMYNQoU3dTJBQqFjsrhSHHHl3/ucvIuQYS3D
 ERdPwZcBLVzChmCN4+J4B6sQAMWExpoXABft7oQv8h8Wae/BfOioPHZRlk2ozegQ2qfGQpfTnpO
 vONACEYJOP7ZfbSHgYLGRnvfdNAgzZ0xn6dptZj+asaYf9Tw+NTUhF6UZtCkWKORFqPURP5Pp5U
 RgZeHJ3wRzDiTz9+4ExsiCIR878+xxA624cAbuBeD70A8IPwRGI1oZWnP99JxU3+f/YUJBjlpJa
 XTbd365nHmbJthPririv2hs0WomDpRqebhLz7KW9RS6vSGP2Hsna/6Vt4ljojIfs9Sj1EUmtqOD
 GmiMW7+vt1hp9I+JbShfdv+TKwsZ+DJ4XDV0B7iLQ2rCNvH4kg/lwZB+Hu+fE+sC/Od0dUkhApa
 VirJ5VfskDAxbWrtGX8K1M74/7fYvq/OK0ZmQkzcQsrho44vpImEBZJXiy8bXFDmKaFQhWtBZdW
 dqLE47qfNmJ9YhNVREFlk8+89mX6HfDhvabz7vpUxyNGweGYZj/E7Lv7c1ITYKtP6wec1XajQCi
 UlEZlxW7qVP3yvxjHMXkuzQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103952_540001_12A33A65 
X-CRM114-Status: GOOD (  18.13  )
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

When a USB-C adapter, which maps all Superspeed lanes to DP is plugged
in, the USB support is disabled in the PHY. When the adapter is
unplugged and a different adapter with USB functionality is plugged in
afterwards, USB functionality is not restored as the USB controller
keeps the PHY enabled for the entire time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6f3184011e5f..182141837596 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -178,6 +178,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1021,6 +1022,10 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
+
 		udphy->phy_needs_reinit = false;
 	}
 
@@ -1284,6 +1289,7 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
@@ -1293,7 +1299,13 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret)
+		return ret;
+
+	udphy->usb_in_use = true;
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1302,6 +1314,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1321,6 +1335,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 old_mode;
 
 	/*
 	 * Ignore mux events not involving Safe State, USB State or DP AltMode,
@@ -1333,8 +1348,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	guard(mutex)(&udphy->mutex);
 
+	old_mode = udphy->mode;
+
 	rk_udphy_set_typec_state(udphy, state->mode);
 
+	/*
+	 * If the new mode includes USB but the old one didn't (e.g. leaving
+	 * DP-only), and the USB PHY was already initialized by the USB
+	 * controller, we need to power on the USB side now since no
+	 * subsequent phy_init call will come from the controller.
+	 */
+	if ((udphy->mode & UDPHY_MODE_USB) && !(old_mode & UDPHY_MODE_USB) &&
+	    udphy->usb_in_use && !udphy->hs)
+		return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0


