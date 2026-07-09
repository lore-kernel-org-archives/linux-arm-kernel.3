Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur6qA6hAP712lEuWCnSpdVtJp7T98n6tWpR4IdaSLTQ=; b=V6UEw8iZztk33fcjPYLw5oLqXh
	UZ9JP0TXXRI0mKFkLcMcE3xjiQlS8uEXNSbgkSyfpNv3wL/1RZPJ8zdXO7ErjymMqA+Z8MsL3O8AX
	KWX2m1J0sz/UUsgXi2atyNfbSV+i3jjyNARV/B5PaA1LYwSG1T7wOM93k/zTI2GcdW1NeEuw0MC49
	RCstlvIljHOP3z6/xkL/YjOUp7FhlL4kN6xxLABCSU496mVvXzmOXmLejsSWYLUaZhTnnVwmcwNJs
	1NF/+MpX4mFkkWUtvkA1ubjaN2U7GCxlvxkOY4LzUjPlJAplBpuTN2ZC3Uo+PzDXL+XcwTNGxWDYj
	8G3ygl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1A-00000003LPC-3BMU;
	Thu, 09 Jul 2026 19:02:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu13-00000003LFl-3UVn;
	Thu, 09 Jul 2026 19:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ei2DKV11XgBN0X64BoDpwf5HmVegaYOxlH4DPJ1x3cw9vS4BvHsTtYx3pbPD9IUHM
	 GfrKBDSYiHhR7QmZv/DQGc7L7prEsPJweSr5PAGJ0yIpI4+CTUUf0WF7dHVUHpcman
	 IdbNJocEV49WXZR232C3yyRwS96nfX3w9/Gs3JFHcEYCEZ/hDVIH8wWp4se8TBarG3
	 p10bNMWblN8oyjMs4Cfdd2bka5GaNz/0uKPp+BPnzfWBMcwIgMxwb/VFX+mOIAvyRV
	 JulODDS1nMZB5x0DT+8Mhwcj7/8AFnEt6eh7Eb5UOtXhrKveXhpKSd1nqGrSJL5s02
	 BW/+xsJRSjxMQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F00A417E0E04;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A7228480030; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:27 +0200
Subject: [PATCH v11 04/36] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-4-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ERiZnFGRgy6HyEObV/nyJ1H5SjNSi8fE
 VmMs/zzQZAb34kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaWLEP/jeqWskhjkjJdmKlWFh4k4sFTU/b6rHKM0Vd3xnNKemPgQhxkDYBrQ/Nel59w7T/Fxh
 /nFBzmr2G78CTxDM4Q9CTh9g1qCSA9TDEiq48Hl5dtKKHhM7Pgmtn8d6eXyrs+lx6IW87/ExgfN
 GMAUjwkjJstUtNjCb1mz4fl3aLDfeNgATIX622QW4qKrZWFPi+KBx6zMdg1PXY5iPw96yEhg+zz
 TLUr39J10iCotlE0Vu+XrlBjFfLihfSanyxnlSHxbHOBpSF5phPscnxtn4aKAldFG5lhUVYDJ6t
 zmIqTEs8llV55h4GAVPhp/oeq8ShL+0v7NytxosiGyNCWyrE5o/J3li6UKNtKgtbk6bqMevCZjr
 ZnExMzuARWn48nRMOpEh9mSZRGJdVyvwjBBNyQww2OJ+pbkZL2M5jJFh0ALCBvjgq8N7K4GYgdA
 YbaFK/n5dRecuGk6so+b6ZidIwJu6wD4DiGJgaQeYgyDhHQYkTQYyMmtEXfW2LtKdGWJrCeZgdp
 veiZEWCvVu7/gY6sEN/Plnt6o+BpsnyrS2y/XaKNsPuUn5dLvlY9Yg1PLEmV3kC5ZRgJuJaD5dE
 wx4lFtXj85xnvavQGYXKMe4oRIhixh/4ZyOMUgwIQwoVFWnfH/DcX75f7Ivds2/q3lSUNhz42VL
 GErpuMWfoXbmB8pjwLGordQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120234_126703_04FC3D5A 
X-CRM114-Status: GOOD (  16.86  )
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

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 12dfdd470a78..2845a012eafc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0


