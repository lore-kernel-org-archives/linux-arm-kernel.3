Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24A0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiYXe9hU4GLjYBlDm3NApTkkTrpbtTK2GE6gR5VILjo=; b=IflHnKZjnIKGXrztXNj1APMgif
	/HFkmbGJLeMDwMKxxVLaeiSHCGJdYfPFi+uL16ljy8ecRhHJ8LcXl1AgTwyXj9l8uaWreV9RQ4pI0
	kgoF1LRc5A7f4hBaakZ1AeuNL68dhQ6jFqRu0G2JeQTUmn/Rqe7XBW/JY3IAL02j4J7EFkWv7pOdh
	mKWLs60GkBZfoIjLl1GnOukBdJ9TUdr8tPdiNlGNtlxnI+VrfB9Ueay/OezUR5H2nUEyZG2uEgK0n
	x39tUPM6y5Cor9qAsJTcc/4/u6J6BiBMKxJ1q4mIF45cjA+ZPpKc0wuV8Iw0VGkTl697+iRMrrg4G
	woMUwazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinZ-0000000D5Ir-1gSX;
	Tue, 14 Jul 2026 19:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimD-0000000D3PI-3GHl;
	Tue, 14 Jul 2026 19:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kiYXe9hU4GLjYBlDm3NApTkkTrpbtTK2GE6gR5VILjo=; b=WBDoOOoAQuKMcFZuMERQySsy3A
	qH7nCUxQOyxaFplaJQ56cjbn08GLT5M6FoXAD0qTcxwuuQKChFrmNsHHHFC+nLKJV4rJLAPAWqjLy
	c8Z2Y39ain2yWbFUvJ9c5rNCK56WO4mXzBomo7kJ3fiLJtxEVupIW5VQKX2jinFFRMy0k6ISAgEXj
	XCLYz8+e1pLiTcGFmNh9Qn/zZoHcHLaWgvEKNhkQn36Tk7vtugdxfaxf0hEDPmAxc2jJAu4qocxMy
	Yi4K4CJGfULaqAeFyoNdjGCgcDJRzkIBlhEI0ESYZkD1eAwKou9PlTjVuqMZUFa9fK26nQiTCnBoy
	ppbz990w==;
Received: from [2a01:4f8:201:9162::2] (helo=bali.collaboradmins.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim1-0000000Co6o-2nIk;
	Tue, 14 Jul 2026 19:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmfHL9TDe2ya6OYv0WXYWqaeCXvtqHk5kX2IttFQD9tvLrufQ4zyijyNCy52a2nDT
	 uH05wNSxMX/MRYIzGOHD84mPPnz2tdM2XFgeNP8TBsxs1VO+3WxlTwcnBBEtGarr9B
	 e5RB+9wGF93IHvIiovoHMsIAdyS6UsqnEMOTwOj321GrhcC1tfWuzlamb8sc+dX3mJ
	 N3G/fYV2fLOB6Xrgh6xVz7P/X1Sn7QorshfJP2Wz2HaeJrxO4rTMwIqMCzPREx80qr
	 qDVarSrlzNdzpJYfT/xTi2pSMxZkm9+E0boyBYtcwP3Sh0CaBF5bGu4Jc1xo+c+U4+
	 oZCLkUtOgQG1A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B57317E0E95;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D6BA7480038; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:08 +0200
Subject: [PATCH v13 07/35] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-7-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU9t/eKOfGMpPkDJwLcJdJ6ye07owdAfl
 aIaLEWAzTKQXYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qardQQAJrFiIYoJse19+fZUHZhl9JCCRgI/43WJsiTCWzDTFDLnw65e13IEGsEpWTEqLqNgQp
 tvlE6J8qWM3HNjGnhkuehdgo08fLiCJNPpsAo5K+GFfUyJAIuIENrbc1j1cO/9le7uZApnOUs7X
 SQbUEtnyIGk6BEajdHmqi5uVGphOJPiSgHj+UHxGDePXLK6ri1e3gAO8V2kWM06PDQXxz0jIJJs
 zbZwZXpLoQwz08fVNB5XQlronDGK+mdkKkCVYYWZieM/L67GCfg7bq7eByO6srmqunwmHOZFAB5
 EJL5cSFzuB9dODpf0sRD80aRfeb+q+dycIUJwruTpYoNqmhZ+3XODw/E/7m/w23GRqZeNOhESoH
 IqeNSmvH7zS8yjGAh2aEApGsb5hDrf2rkLsN3OYMzv9XEPy72megsq0hjAYKbS1RFlFbvJDTeyT
 /kQ+IHrPYpvsrKCBLeiSqElh13taiCF9vqy9frBDo7XYmjeMo/JjFV0a49XvbNjcw56E9rdbfw7
 3K9zdmj7E2DR1eeoswy9FqrFue7xKKf0dlnlNRxyEOL3v+DsAtPbVtQkAHtQOhvq9UuzmjpNL/t
 Ffmfi0PlAAZcbGtr+D1y1SISzN4n0Ln/R8N4PINLi23kTaAHcov0jMQukwlUvEJEjlJGCmC3TcU
 Mj6AxVrhzpbb3IsYbcfw20w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202633_929966_3B61F63C 
X-CRM114-Status: GOOD (  10.59  )
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

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6cb9f6b4dbf6..e3f5a26c876a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0


