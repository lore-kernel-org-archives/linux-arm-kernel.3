Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46574C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=wxokuK9+9wKBvtQ86LqRSOLP4W
	0HCkY1hKZ4YRi01xyXB9ucZ7vWpkEUmge4rnUn5bGGg1EX+QPAqrd0tu0Tszq5RfKopVrOmdXgzLl
	/Fp7j3AvT7l8TIT21hl0YayTxYWh2hs5kGgbxp+q0L+lWuee3C6ZlxBXJ6TtoBieYMRjv8fLYl2X3
	uogrdF+SWY83AAUKMwDEMIUqJbmvz0DieD69UiS5ZJ5Xlvx+f4GROV8vIbaocZSRqVpNpF/09GBfc
	7i/aIfgwiDwRyjQB0Snuvt1iBYh7C77BDRUMehdPtvzP+06uAQ6ScnizAZ4DDFVnjeYEfxf0FBnOi
	MXjioJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TG-000000039rE-2oCJ;
	Wed, 01 Jul 2026 23:35:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TA-000000039k1-3hbS;
	Wed, 01 Jul 2026 23:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JopCORWts1/zBZAshpM5FlhwVl4pX5v5Db4QkTN6TlZbCkMZ0VLNNIpKzAbcGztV3
	 L51fx3v3suDxc5R86qB4Z4PAx3YG2o965+Q8DAfIYEPNO9aTunF66rie6gDfX1ZRhG
	 I1rmcfNTSNbTOFhy8wRS68dZZhCuFjI2kBQZHOGaX8f0+urJdEI4Qi5iNLdBRdhBpT
	 TIh1gQUBnhlw6XCvzaefimI41p/oAvk+xqDL0+cVQSzeW0IpIoKWDougby73SxnPJr
	 Nvd91IFrWCkaf1zhoC31+wdP5ONRTjAd9ane6S4vTgnzQ+Tb7gq7o790w8GBw3MxiC
	 /+oIM5cGhRv+w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 037AB17E0FAA;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B093C48002F; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:41 +0200
Subject: [PATCH v9 03/38] phy: rockchip: usbdp: Do not lose USB3 PHY status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-3-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPWvCILXhPZhf42ixcVhNrM3hmuvuk7y
 691Ps/bIwJBRIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa50IP/1b2y0pmWi1VxXN5PMzVct1/97+k3BAP6RFtVpo2zuqJpShP8iEj9LwGlUbT4BQUyrg
 lNnydIMFhfER15s5wp/uAf6zRyqGd5vn+nYJIYBM1yHzIyWlxH94aoLoi58Ftuc5VrTfhOexGhd
 DXvkjKS7u9frTNXv5FdPvlNDc10Wsxjv4Grhbwz9dUUUVUqZuVROn5WzcMT42gO1Ix16moJHDp2
 EU0POFjg15qchk3AmKC/kKwzq0b+ISfPKM8/i3OXKHq9i6aaKZhLeT3/CZiEz45iPrTicz2c209
 Bm9PZ0QlFomLNnRUUXtVXmhxA9sI0FpPW2BdEB2u6ZGRCsyaARvug1oTIqSViHhsojvyW8RA2pp
 Whmua5LjFQixIsGft1KTmWwxi4/XcoSsTQ4MzP+nmH62E8qODeVy15M//Og29F67cWxROiC/P+a
 3dx25HIY/B+55YMoTdjcstLJ8Old14xbyregNmR8EmgbTIBQWWT4/DNYRXAoGazCmhEPk/ZwuuB
 7TntmV3ilfhyJMXObweukVWZUFX15sg6vAlDQ1F1kFbnu63XLRa60X0OmoKG6YAj0UOkeI2IBgO
 mCL6EqkEtSYheV74dFsoUhkyKYzQqNJkjJk2C2UCL9Y+9UMWBjzSc6TWxnDdiT7UUEWlxdTZXJ8
 XlrXialq+wJ4Ee1JNLsEsvA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163553_077499_83DD2876 
X-CRM114-Status: GOOD (  12.83  )
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


