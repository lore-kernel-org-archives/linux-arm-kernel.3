Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0A5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=mDEmJvIRenrWn8FHaCHSvNY9BF
	C4bgtHOXOELLGFsE65kx500Dqg7ZGl4Bf5m7AJFZPkCLlfW4sS9rxjW6rXq/mx2sbtAUALN8zecnI
	bB0tSX32uhp8KjbCA1uwyRCBZnRd1GPFW5XkXPr/8X3b9e4TWLiO4xbppUmaEv71j61xYTTiqI40n
	AQCByrb/awroFMH5KPl+QesbFANjwAm5nR5Td1cfmecYkL+VO2yo6niNN8DRPcKp49Jh9YfCqyCU3
	V8hlRurkLm3PUDJvouoEdFQeTJvsVMqjgR4nLq+8N8zc+YIgnDnEzES3KRTBMbA04ZMUVFKtDH3i4
	piokJhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMq-00000005J9b-38rr;
	Fri, 10 Jul 2026 16:46:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMn-00000005J6r-2V9y;
	Fri, 10 Jul 2026 16:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z9/lgldW1p/torIfO3+0J7K5SE7Px5YDPwEuMuUqbjYAZzc9N7qCZmS8LqapBK2QV
	 WlPAwUMWx6EEZuJmTnnNJdo+eB3Mb29MQtZ1QTZPEAsjFZWm7w90aaCjt6BjNGwAiW
	 BGaNzkDa4AlB6U9LmgjkvBhRNm7PJePBV7A7rKLLmnavF0H9I0rUgOYK6rTU/wMa7E
	 Z4BPFaHRELtG4haE9EuLaQv1Ff9aIRJsy4YZXuR8zgl0SLjBVZzgrs/oI6ZjBLxNE3
	 S5CwAwEc0mlONyWXiamHsZ3PcoL5rTWDd26pELCCNbL+UgKR33Ee04Zb0qPWWkb7sR
	 PVOk3F/knagtg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AA3C17E0EA6;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DF44248002F; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:41 +0200
Subject: [PATCH v12 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-3-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdgT4M5ecjWoo9i4FR9rI2qvhAlHpQ8ej
 pRJGRn/KQ+JrIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaL6IP/3NBH0E5hs6z3K/Y0L4JnphZO8K1ayvhrcKZi9bmum93d+iJwJHKF1+Tp5WTQxHn1ON
 nzZ+WbWi2ZItdAms5R6mE1k1+fkaK6N1VwaLl50KeefC9oHSxxbombhkVOBNmSgYSM00jXJL1N2
 YTDL5421gLW6E5jLXt6/rDLtDbecmGayYRsVKAqz5POE5MKeTKf3asC9lZfND2b7D4VtH/ut/07
 wJgIBBspErHRGub6coWLLz61eurp5Gb5/HzpEM3GIm2+VPrDUVpQzZuCUrxJTNDsN9+HVO/+Agw
 6SBmcQh0ItYcMd4iM8a6NAK+0BkOucayNENTAY3fS7naKMzPt2jGNN6P4dHJlDhiZBvKyuf66ib
 BgySUYlltC92bpz6Qh41a0sWg8D6lA2ckCJOdiM49HFyXWHvUjsfx2J5Gbcnqj7VjAMngQ0jWK9
 XL6XzlS8le4hb2LluTzLtIbYlWCvmPgIv3+UWRYJ+7sxMcRXgiH9DXDVWM6FbxHU0PSMLn+PHLO
 rWtho30nM7FWmzDTYaVQD39leq9N/c2rFPIIRT0CVOvcUmjQ8+2U2A0U0+eGF1VgmpNAu5f5Fdc
 9jYwhTjAmEXmP88+kqxOu3+MP7MzImDKTRTOwr1Iu7I7wbC4ERrVj7tBIUy0e9t79NjrUmPDYZK
 vIDAyuiff8QfNgHtG5Sc0CQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094621_785594_DD82C03A 
X-CRM114-Status: GOOD (  12.68  )
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

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


