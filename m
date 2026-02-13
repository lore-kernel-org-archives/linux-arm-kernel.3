Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30204EDF171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYdVx3k0xKUB+DTVivqvHy6ayjWnBVPMT5P/7O6J6PQ=; b=1c8sDC1lm7T3pmVwHwbr+rQjqe
	l7BTA1phDpjTVngfk6D92GOXtEokMHJU8B1J6GJNfacKYw1yLqWzdBJ+UUJ//S0jNT7KdMDhUWDnE
	4bo0+K3gD6IkcUq96Bfrpp6rBB835V2cC5+su8puRF5Thtqyzll1VeYkLGmes5CdWLjlvddKvD8Zz
	NkavFneJBJEof6O79yd0a8FASlwv7k0iMMX77qGWoDcx89ZhVcXAn4frLdIHJtSE39BOQjv16hUmd
	AsFCAvBOY1wsKxprrT9xj7vQZ3+OAmB01F6qRhg2ZVYhlhAObgIeOGvHdt3/bkiNgWv/jhh8xKbYn
	4r/xoUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKW-00000003YNT-3P3o;
	Fri, 13 Feb 2026 14:39:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKU-00000003YLV-1of6;
	Fri, 13 Feb 2026 14:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=eMQSoA3yBQNOiKbh6HTmD8tTsyMPezXp/4Ipf/FEVXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UG1st0WRv3msU4i2ml9gRkoKmwYXfwHDdcvOnZTHV2r86/S0Wiq24S8M2avYUL7xw
	 odigbnosHtxYz4LRDcH5rT/6/+HpiKiQq5HuYMohc1XKOLCbHtr9pLqemijK3B4ORC
	 OPkRBbSJPj1mDwvt25Dyo/TUBXucmZkLSiJLtrlDRyiCoD4aGLKmD6eF5VCR8te8yt
	 O8S82mlaWcb65uybpxpHCFnS6eoY6f+dYSf8YJFWvhBlYz25ql2C8uU0sDfjjUytzL
	 tRP7sqIAtF3Gz9RO8gchSWZ18PeRSUlU+8gCszZaf/xq1meJ5MEfIgVzAtdq2J+92q
	 w6EpVHcEqsAzg==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F266317E151C;
	Fri, 13 Feb 2026 15:39:30 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A325B480023; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:24 +0100
Subject: [PATCH v2 1/9] phy: rockchip: usbdp: Do not loose USB3 PHY status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-1-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=eMQSoA3yBQNOiKbh6HTmD8tTsyMPezXp/4Ipf/FEVXQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6JwlQ5sVLw+EsxuN6XzwX40cw5FSQpxW
 zefZ9/KuguLU4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qaW+0QAIdSqpWu+mTVk0DJBfUoKmS+bJbm2OSRrX12DmzA0bM651LYlcILZ4rJI6goLbXW4Tq
 CKlx6yTBYBpuDS325Oovnp/fAabAaNjOp2Pb/BNpCCVe7ycIP1TJjnA5q7XWsJxbeR/uO5g6mMn
 N89ZNW2px7L7QxwQ+pbD6cOTPXM4YkfbfudCDIrLgaXXzBx/3dEv0naKJYwy+iGGKR/6zJd9NUS
 2AZFY7Qsxzh1uwrt24L+QE8funtctJ8v5TKZurj0X+WEamez5LGsTZ9Mn3MzIGwfdRDeKZiDURe
 Pog/DXpZDzhkIhoN61phxozQwOUSdzwluueuq2OhFAyoGZVVYco6eIOKp82vq1blQrLj7L1mU1v
 ZnL2GUEcUzW8wXWCLX6Ve0uLF1G2xkZFhrCZujmTyCdZg1hshqJMy5GgD3Wm66RGmp7+tqM/9Lm
 dSEi2joWeBC6TxSr85slTQt2ael1uejp7kQ/lglE+IEz+aHg9GqnErlxDvNgdL/0Cwfww5+Bi4q
 vKdrGpHKJxtVyut5FXHMSL07clmhhd4HDTTqvHVZ16Y9cAS2rDVb13irm1pOl/C2thqS4uRk1kx
 SRBPGIGyQHvjoUJl8wvyK3njGRKopZvHXpzggsdVH8y9ilHVAkWDXJj8hnKupYHPlVt4lFI4iI4
 cfkYae96aJRIZvObfb5YxUA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063934_627018_3E1BB336 
X-CRM114-Status: GOOD (  12.12  )
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
been cleared, which means the tracking information for USB3 ist lost.

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
index fba35510d88c..744cc7c642f4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.51.0


