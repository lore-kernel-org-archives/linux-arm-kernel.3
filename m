Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61797C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avXZgQj5Tjru+kYJZ1JPzbL2pjZetIcciKZcE70QlCA=; b=oUAJnUqX20G1j2ZgqiZ/fM57oj
	4T/y4EarLSdMJaGoKGOGzpZw8Gd53F1yBGHm2ucze69FdMZkvQ3OR7xK8Z6K91qrNbGOQDe/FF1SH
	2F6H4D1HUB5RBDGJWmZdqMBizYTK7Q/A6nDNX1ciVS+O4pWnqnAf1Yp7kr3AllZFP1OydrYCom92y
	wKp5ObJ51cPjl1GqAlXczQrsAcBjOwE3k+pHEksaFPNF8q90AkPjNGIOeH2PgniP7Uu9LsQ6VO+hg
	Sj7iXg7NxuLkRvLykTtw+b7ZY4pQ27vjE4phCvuMu/k9xl130hfjii/uRfZkUY+KRh+BBzBMdzxsn
	/Q9WPO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGv-00000005kBo-3hhm;
	Fri, 10 Jul 2026 20:56:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGg-00000005jwA-3dA0;
	Fri, 10 Jul 2026 20:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=qKK4xLVOYKJrCjuBRyBavS/8Om6sF2fxSD6TP3t56mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=egOm9piZ3yzUNFEBP6UkJAlavEK8l5iFkZLeVXVcNWtvcxA4NUh4h0BvTp/RRv99Z
	 zveiXP1OqLYPIvP8qbs7KaVilCuDgeOsZeqyK1pVFdDrNDJx6ORUdM2ig0GyPdY3Er
	 goHiZBivZZn+xVq9fAj6lxWlTs9Q0ViCgPMILYp78p6+jRbz8mTrJ9+MGZO2IMdWuE
	 KeWMh2qPwJIiO+D3lrByiSjsrnygjk8s1Bs4RmFQY1EB5WP5snfsHuJ1P4JKSW9bgf
	 UJIgBvEJiPDbcP+nsjZevzFVzIFhQOYhS6YicLja2peK1rVSNhhCNoCf7qUtT4A8pG
	 wHuEqwF3eOERg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 665F517E0EF3;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 16951480075; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:09 +0200
Subject: [PATCH v12 31/36] phy: rockchip: usbdp: Add phy reset notification
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-31-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qKK4xLVOYKJrCjuBRyBavS/8Om6sF2fxSD6TP3t56mk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdn0G4p8F7npq2LrXsRBeJ6pyk1Tp+BoV
 KhTw/7Q3OtD8IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qabd4QAJYKlcRUkV6RscDzhVSSj1vbL3m1xCpzMuMs4pbpMDDj4nWvv76wzvsPfxU6Z7yYenG
 xh0Xw6nsPRlHyFKiY1HSRKDMwq5xpBMY5MRFC9fjLcrWTFO6/oOh9yqD0WlS1PxBvacXDrUzoki
 0h9B8Cl/DXRYQ9rCCjWdnbNYphx8tBneuMDrVG/cS8BcUP/n8QfGw9nPpWvDu0z8oxTsxvpJfdm
 gq/sXfxib63XnyqVPJQWS+b5ev8GujCt/kQvECo+sHVTsnhBnNhgCfwhRTThGJ8GcmJ0I2DsEYz
 bgVg2vNsQQx5aDVRVo6NAd0wq8N/SWJFJc3b+4QWZeIFFEjbq7zeBjqvq544PhQno5aFcbQa3In
 4rNb9a+kxUYyvxiDkWi6HOj/v1cVub3xDdBDBaQmVAGGaVKEZI8wdy2cCyhqFIPZrpsXz6oc7ay
 DGr5w58uXb+VjAIOWxHwgRkqBNIHDn0pmphzKAL+Okd4c+gsONkErQnOspwIJgZTutbjz6ZR8/S
 AgsrGUs0xyPKir4im6PwsD/c2x/WAZMWwWhDTW/Qtpf8FgIcraOnUZaxhZYqqFxHLrnsiF1xWKh
 NDB1kjg1XCMq0s1MfzODUjPAl+Dzah0K44nK3EuAQI3k2QMWsPOhaQ/8+5Lz6uc4e74RGZIQyOn
 oZ765YVgTujM1YIDQZeQ2RA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_135619_068015_3115DAF8 
X-CRM114-Status: GOOD (  13.08  )
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

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index af915cc37727..0333e846ce34 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


