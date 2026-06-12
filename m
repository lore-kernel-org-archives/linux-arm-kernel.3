Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A455BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZMmddUDyRzvM9y30wS1NvLqmXkBd7n88O00GTIagZA=; b=fdCeV/QEGRPZE2AjWaY+PMWg47
	ywHvPFEUoQTUXWoOPH+RE/WGwKBMPPDbzEoioLfdcuoIvOPYJjjPKlWeC3zHL810qke/w8mZxeYwj
	i6rula0Mde7fgnIX1+OyP0N8FA0//83pkJoJiZPSCCgPDcuODBMHmKax+Q8TgN1JBNllrHDkTRFWe
	YKC98YPjuxSV0z2llU9qBvaVGdgUqz5M6LxM12JQ/VpIWeGgtjpCMiUxpEX9lnPcA1tsWt0aVSQOV
	MZHenECrvps9rcmJ6Q0HT0BcuipyHY1rmspNbuZlyUskZsZsKJ4NOXG6Z2owE3mr/bpzxrDviLYA0
	l2xZz46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4eF-0000000BEy4-0BQn;
	Fri, 12 Jun 2026 16:22:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dw-0000000BE8D-0ZZU;
	Fri, 12 Jun 2026 16:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281315;
	bh=92Mv1yzhLSYbLsOgazamE7Q+5BG1RVIB3041BamknIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O2DZU3f1GfH+AewhvXI3KWqZmeXVSDCJSgCtFyCfLxp4dRNq5htKgBA0BT5qYnlIQ
	 CKoMaZSadt6fHeZkMG9EVhRop4RKaKvxDIbyiif6ygqunOvJuKY6SU10GPM++qghX5
	 S1lDDZ67BD1LnPT+P8yye2+j7gY+jpRiHmIba62abpbTZRz4dAPCPFkVC6aYGHKeT2
	 ZOKGXDqJXISSRjx8+cuJ+8sqSqU2/1waziZHi2S3DkjuIcHbcbovp3Bpl6izM6KFC3
	 ywl/97qO7f+knKF0eSOnCmwCysC6eGe5fw3nuJ9Alx3dfKTUfSREDsALe2aYv24x+V
	 jBTqSn+Qpp7rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD93617E155B;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DDD6C480061; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:55 +0200
Subject: [PATCH v5 17/18] phy: rockchip: usbdp: Support going from DP-only
 mode to USB mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-17-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=92Mv1yzhLSYbLsOgazamE7Q+5BG1RVIB3041BamknIc=;
 b=kA0DAAoB2O7X88g7+poByyZiAGosMiGhZvmXEexMKc3rOFXaq1BtAo1pqrNEeadLsShg0Qpom
 okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PIO/qazVAP/07U
 KfAWJu7NyAgqrgqhUobGRlP8b2rGX8s6E1RYF7kpeJ1XF5SzdMRn+kas7cB3GYvOMnTriSZhHCr
 qOTTAx/flGjjTYYvV+w+oK0U6fQij8UHqhJq4Mw4BDVzRWHu98rAKCV21v+ctxqAgNg4fzHM3Zy
 GsxGgtylnizK+D5c3T8evyFwxNNq8MZ2dJtgqFHWqT7QEaXt9/hFkeX2bQwenHynghRmwo5+OZf
 hgcPmAl71j2SB9ZKann64SWSyi4QV5PyNkHoPNPeY3aUTkH0f9Z1CtlY5TJry7K5fN1Fk3zrTeU
 O37w8EYIQC+/RE8sBADmkJAe/ZCTw0LrEQU8qozaUVM+Eav76h1RHoYckzeykjoem4s7vyUAguv
 F2HzdAwDcz5tI4UT8WJSRqEmFaXkNTg46iqkSjwjWZGZa5fSQkI9HoDINfpxfGYSkIItC4KjwoH
 GcWtaR7J1JDGOZCRSrFj/WnYAcK+DvUPqU1SvOZDVPwjsT/BTEe3HaLf7QBfGt1PpV/rXqDQt4D
 bpElkG2Qqk9WZy8wczsxS77todBPm2dt50pWNqDgBGe9/lWmYdO6EEX3zWrHDzJaJKbHobk8MyX
 KTO3DBGcQVZG0EdJS+Qmz77nL44IAlJcsknU40VO96tfOdxyZaC3GwdceDWH0m9UfiwqURXjsyK
 72IOU
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092204_525429_3D1E2A73 
X-CRM114-Status: GOOD (  16.15  )
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index f673c5481d24..236331cc0d13 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -178,6 +178,7 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	bool usb_in_use;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -1015,6 +1016,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 	}
 
 	udphy->status |= mode;
@@ -1278,6 +1282,8 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = true;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
@@ -1295,6 +1301,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->usb_in_use = false;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
@@ -1314,6 +1322,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
+	u8 old_mode;
 
 	/*
 	 * Ignore mux events not involving DP AltMode, because
@@ -1325,8 +1334,20 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
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
+		rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+
 	return 0;
 }
 

-- 
2.53.0


