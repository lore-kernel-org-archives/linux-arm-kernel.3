Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/M83H4/jN/N0EzWc13PFnwEGauG0PFNjZUcyRXiXXc=; b=weJgfvZAYyuFH7d3XzR+nJHThr
	imx1xTFvlsyXzp9k7yrsrMfA14/h5oGJdPKPG0we4Vr8pNWcXCg64Pv7s6TieP69uw2lDOkFkPSdn
	528sAvZmJx5Nx4aLj01ymyNyjhP4BM5Ffc1PaQLfBKhLc9nXHPzyTWLpqKz4vcQsZZOkx9PDpoOG2
	8yUGF+OLzYSHS36RBmYlikYqH8DTohLf5KyW0UoZxiMZIHK9c4HpC9z1su2NqpvBX6oB7uSqWGpXt
	ojI+PtE9Dc65fzFt0WVHCbwmg6RMi4nnrpIGUcv2MB1WNpzi6vaknEclaAQ3djTEhlMNEz480ibhI
	3cRnSrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOz-00000007f3K-2lBd;
	Fri, 03 Jul 2026 18:14:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOY-00000007drJ-0DM5;
	Fri, 03 Jul 2026 18:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B9w16FZTg3WbrNAd5f5S1CcT57eeYCYIF0JSXN2DQ4+7NyjedR4tEmvn1IumZl7pS
	 5sj0y20fWjmWVDyfK1qjU5X/pSKrTlvbA0ZwyUgFH3nDWOBhXT/DW7homMKv1p/w43
	 f7QIGy4S9HpCGi9uKcsAtDnk03RoJs2NCi0fI0u4v07PF6kE9QA4rBRrjA62Hpc6Sq
	 TXZ+YWq8Jzy5t5McP4oY03oKA1rlSlk8WuHdJzUDb+p5ceFU3wyTL54Qsr6PWbF7so
	 SnnCn8yFTYx/ikf7YMhMm+QH5m1R0T9uA8jj750q74dKZvGpCKSi3RwtIVxyVntKWG
	 uiIVEeSC3kvGw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C94D717E154A;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A0B2C48006D; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:42 +0200
Subject: [PATCH v10 26/36] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-26-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zAIpPhnBqJTD75ki7fc8mqrG+OsdwFQx0MWSBhIwC28=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xNl4sgpRct7VHHy0yBDBcinfU9bx/3i
 OXOfhNY/DHzBIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaxOMP/A6MjQq1mhrhTGIxVXdSytNLw3Hu9TVa8DbsGm5sPYlRUipwu0ZnQOvpGpGJwPvP9v6
 DYoKfu13E/+fTExYEzYrINfgQqvHabl82yv5K/P/RsncRy60AhCuezPfm/YqZNn1eVJOrjmx713
 MgQxY4TqWEbMxr+Yy6KVg2eDuyQbkfcowNyQ9PivXIBavXFtDfTiW6MtCVVGw/D0j0hPP20gNZy
 CXg1KqHzZH8xTYrXv0sB3s6fgpb1Iasa7IQ8mTdBf8Cmrn/Qy/FZrMYFtlfSyIvJw0uqEwy7iYa
 6RzrrjG1Wo6Q9aikRnAhmtkFHhhd9V9V8RqmxT8VWXAXGyJ+5aqDO6aW1ELgYMUFtcu+8kA16yh
 w81Ue4mMejHty8nbkklyLICMELE3M6U1XkOdfda6y4h60FzQ/dgCOHk5Vx2ddJvPIQ95IiTZpmG
 Utrc4rARN/MtAtStxGYNRVyL8Kzm3HwDvvpvy3+BoGh3kzA6DoxvDP3m89vadiWcnaMGxW7Prao
 u6LsZokixcbYYia+Ydy9Ni3YLyZcLvqaqRW8Kg1jY9DjTV/4yrXNJ34s4aw7n4L7VTEA2WK2pX1
 yAn6y3mdoeJ/L3kT0VKE9qTO2z+N91dEumoKRz5cPrr6kmCtQ+RRueGxijW9Xa6zr0+EQNSzvqV
 svHftJ9TvLJNyaGpdQOI3/Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111346_313686_FAF9154A 
X-CRM114-Status: GOOD (  15.68  )
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
index edee27933d89..9e77513643a3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,8 +1000,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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


