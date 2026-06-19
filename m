Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766A4CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUZ4Byi4it3IBxk9CRw0eOC70UkSyVqltsUqNY3aYO0=; b=B7xgEhdQE0FAoZ4L9CrRsu9mM/
	t1C6XkWSGJC/Ws/rK84D0kvb4gmB4VqEffmBUIxXuM6IHikgvauMHzsZpdXjbQ3KGOn/Y87ywcT5c
	3tK3mDU4J0svHNFixiI80YVVbIM5uaFcbYiJpLTVZobxY0cOFHHu/lQdpgYWbaeyoWsNuC89F9PmB
	xhJj0zUiz8N5pc06Uf9nzFO9SLCqDmVz1GD0k/5Gh5DVR0MsNlib3THmJNvlu7E9yxrlZtf5zR+yN
	vR7mH7gWBx/gkx8Y+jf1uK/ktvNeCfT8WqWoyyMjnzgPiTNryqy69ksj7K797EWFUVq/HkEbx/28d
	GvH1dHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAJ-00000002ej6-1Ytp;
	Fri, 19 Jun 2026 15:29:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9Z-00000002dcJ-48m9;
	Fri, 19 Jun 2026 15:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=gn3ayTGnT+JU8UaQ6hkWMrrwAtC7Qql931Hfq6sCpw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kd2EZxqJyg5hgL+GpmEdVFvZsAPJS2e3hWa8C7qUzSlTyZfGHwcYKajbbDUgwDoO0
	 FIvNjOqf42OxtLBq6japqLtJss3AU1MnUoZF5qnFchfiOddKFYgoFU3aVftuYeYhmm
	 HpK1WKV4ReLsBl9tRtlceiU8GNe/XUCtjlJ3JfqPAQqkp8gDjJgOvuuRwO+sr79xsM
	 FckK94AXznAKn/PcQUdegZdUhl8v5b7h5YyUA/hTFpOFVkIr3lF/JpHp7Av8ea9GHS
	 sCR3mKv6K6vuXkOvKtt++Hky6A4D+Z4wSEhZrVf/kJHXt/pEmsexnKILIWSjkZPohb
	 bMMsPP0PgxhhA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87F2817E15A6;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A1267480061; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:08 +0200
Subject: [PATCH v6 17/23] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-17-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gn3ayTGnT+JU8UaQ6hkWMrrwAtC7Qql931Hfq6sCpw4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDmF9N3nCAV9kSDLwDmfmxrx2wdXWdCbc
 G1bWi+GIhpMsokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qaSKUP/0h9Ewjlsm4obFqkI/shoQzwmAvYncuBNljV6jG2L/QtNihfLcTz33UEqnWn6VyQgu7
 kRJD1FI2siFFZKniVDirE6JcudbwsT/9KT+NBZ857HECbIkTSrmd1IaH80GnRphtUXydW5Zqbyq
 6YGnA4vSpXWsd47+bHNKQL1+IGUmjwJiAlKDryJ6I+3/oAlYO/NVTjslfZ5yZAbLsXIC6iBiJsS
 1iibriF0kYWtATJaMRYCCZUFKE1WMpG2/PgLMxeaewg/xVubvXXuI4QIhPAMCQLlZcMQQ8ArQ52
 RcWRHjSRpIiLLOsVojjGZjxLEutAViNxoMzqd4TeUyORDWZAfiVkesOQBq6HVmDl/e/WtLROS7J
 y6Ddc6pQIeVnstyEPPMcUlIJ/EiHpjrHVPZk0qgw2n6aws5qwk4yc42JGpvTDqq6B9Fs/26lZzM
 b+rVbqzkUI/ozanLhXchKO8R+KMiIknX+PzGanTOsf8JEGqI9L+8EzDIUJo19FGgAh0XC2rqfps
 +LdiP7WTRQHAq+kOeHLfaMMc+/Z4+Va694urojpYWKDeGx9mAkJm5nKwpmKWY/wEwLfqhcMNhUk
 yGGyrHSK+DGCjpo0v7pi5C4wdmX9fFwKpnC5XRKRBPx7U32ckl29548ZHmXT0RiNAh5tgE5XPOw
 sLX+yJ2IvtsLPSW+g8XAmSA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082910_218524_A4F863A4 
X-CRM114-Status: GOOD (  15.05  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 383e68b24506..c210aaeb283a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -580,7 +580,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -975,15 +975,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


