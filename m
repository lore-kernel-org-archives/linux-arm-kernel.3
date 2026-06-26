Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96532C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSRKJoWLsYIRCbK9GnJ4rlflPEJ2yXMz8t4ikPQLeAU=; b=AfemlAMZt5CCgOrxBxi2OeZKA0
	4PjIigzvA0briWTfHKvJrmZRzkaptl4G4yQA1ilwgnH4aGU7KhYsCkVAQ2M5mT1P3VVs0DLDaQSTQ
	LDfUfJLtrc3QMFfWAB03Fvo1JprLgb9vP7jjOO/+wjS9/nnWSi9BrrbgSKF44Y2+zjfpb9R6OeFJC
	n9CsBPYgT5RnA9Xp1LDaanOhHMXjG0upd1yjtLjDEh9Yb/YT48m2RetJiKOPdGM0Jxe9cumXbwvGs
	Occ2HyUd+yCUIHaRaVUtyfKKo7ndLP2Fy+O/VTKtlefH+zLXpw1kT6bSUia9xfLMO3ZWam/316LZ+
	Vrw8DeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgv-0000000Bsnx-1QW0;
	Fri, 26 Jun 2026 21:02:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgs-0000000Bslc-1Jiv;
	Fri, 26 Jun 2026 21:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=ATtRXr12sUyV+sDtMBt9l9EYiWar1IE41ewCHskMi7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tc3p9qidsiXaHhlsAsUGqm3+SQOMTEZRuaqOheQEUPJt6Fvxlulo2+thFAfffSk+H
	 GSPK/1kDftqz7aZupyXhZCSDgV5EWiR5H3Viknmo/tbj2eE3lYmel8s4L4LXGAReqE
	 us0CEuWeN+Qusfv4LluTVtkQFVTFBp8OICMsY0joZOx5UKjLUX6eEKs394Y0pBWXwX
	 xcXNWQ5wjti3u7rPKSRfWTcdTbpxBmGhAkUK7aHyugacFfANIO7GjKgc9aV6Xdchf5
	 LNco3G+l5otRYqc43oeNTHKA8CK7xFWTgB0SLsgzURiBmdRFXkkhK+Lropw9w2660F
	 DWXH18BPD2SHA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F126717E02B5;
	Fri, 26 Jun 2026 23:02:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 34D9248006E; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:21 +0200
Subject: [PATCH v8 28/29] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-28-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ATtRXr12sUyV+sDtMBt9l9EYiWar1IE41ewCHskMi7U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yWvovxnmTaPOJYGGASoYc5MuFqRnbMi1
 fXoFefcK6NKaIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa/gkP+wflq4C3m7xHPGiW803FGCNtuJN95iT1iNpHOyDsmROeouVXCN/zLL4u8amLogJFbe9
 fwkGtA2Rz8gx3YVnckRheqLh4Cc9PnV5xX1Dz6Y9znzi5pv1BrDV1UnkWalKQW0W2a626b6C5N9
 k1gQLltpHpAa+RqP/VrOxOfa3X6ZeVwCU2p8LSOypozO/bgGdiFV95pUY/408kbBbN+9KzTYAhG
 cHpTlI41BMqtXYMFgbM9KoDBTvZ3FKNJtcWhTYYttq4HE7IwRY6P+Gl8TNHnVNkXWXGlJGjqMTV
 kPOzY/9uDKdFfZq4kQLEfbRRrAUFoPFwe90xCK9NZTqhza7j00UoztYrcm4IhH81BBjQeXuxmh6
 LFOUI/JZ5nhDz/nAYuvHoeau2fzo0p/5SpqP3N46ogg0bK0gAYH7D+Zz4P7uWXVzwHaKO+4Vg2J
 lTSlm4PZnpI7fTPwwDYsCEla/OBQa76TDir75nKM0EDJx1Kjej7T1SRMuCbDHKQ6E4RU22VrkOs
 MSQjX8v++Dugm9kPnukj5GSyakh4b/6Fvjrj5mlokpc1iRI1sfoSJ9OWd3STY60vDA+d5b28x1y
 xgRKJZElbZNBClQgzjacHBKmyl3HjvQ2R/AoL0tkgUtZnzaMxW0GoRN1ZGFRkaY3Mr9KxNWDfex
 s9woDzYYVHyYc4g0TVv4tqw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_140222_541719_A9BF2A5F 
X-CRM114-Status: GOOD (  15.20  )
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

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index dc166392ba19..7c8b9eaaf352 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1033,8 +1033,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0


