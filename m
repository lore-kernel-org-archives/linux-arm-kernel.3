Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46KRQn8uFxdc/qkGPoqzaYmJF1ejsg1OUrwtO0Oij1o=; b=ZMqS9CtoacIYhbEpYMzXC5+cIs
	WldHpb097GlIZGgi3TRCsdCiF94tSFIhlIOs6BO7QE2lJmsl/FYpFWwkuW59eePan5sE5PdfwADHI
	bplA5ppAj3xYsvd7vpmRalGE0C7K4XLG2XwGHxlBlm+3CWUn2lEm3A6Y2xO+4REvZjDzkC6LSVyyL
	JHexRP+pPsTl6yb8Vr76r3kugl4CxKGg3BF49uivIE6jCQz9XDuHKzA/n9tg01xV5JTRz5f6P82vg
	OvfhjsnL51V35Zu1m5XUVl2jm5x+If2qUe0XPK/wFxIDyORdwd/RUAc4Eo3/vv1m85u2BnvKWv751
	vK+bcDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TYC-00000006nlZ-3lBh;
	Tue, 15 Sep 2026 13:50:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXt-00000006nQl-0MMy;
	Tue, 15 Sep 2026 13:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=UnafG6WVYfNQdZQ6MnttjKf4JKywJdob+S2exj7Gm4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YnWnp6kRXwgoN1xsnCBZQnxPpTkI2j1KOR40duYfzfoIL0umPqeoDXSwznt/ilsEB
	 qK6vtjXS2u3yGtAxoUOXcHD5zaTEO9k+IdmycByMebLKM+DIalkItCWSy/OMzenpKu
	 fbvn3XveFpHTzTrJgUBK6FLz1dtYiKAWJSp7T7Hc6ddzrDOYspza965/iKAAGrmtrt
	 FoQJOBIHmZWx0G5QX+kh2FRPgO7/rUZg2FhmUReZG8yfdD8LgEQUb48qagxyJn0mXX
	 b7v7h7i152XR24+p8BCE810/SsiF2vGZRAEI96p2muQPxzDeuCLqyVVfjwxlL/Rc1N
	 IW+UOW0yyvG4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8040D17E0A32;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2EA7C480031; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:51 +0200
Subject: [PATCH v15 04/16] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UnafG6WVYfNQdZQ6MnttjKf4JKywJdob+S2exj7Gm4w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQUqeqG6Mf1w9I3YCMtzPDXfcQtRFM1xW
 +j6XaWsHLxd5YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa5igQAJ+eNDZzR1H3qV7s7rudtb1vag4zvdXkoiFthFjDLjU9lgTk1xga2L0N5WKiElkAC8v
 i+jGVp9BQprY11oyM9aoEluS6FIt3HTrgxvwsp6FjgkJGpjk+7EQfahjSfsGnt4S97f77PE4AS+
 yM6VUF/SuyATviLe+SKpoJwwG7F/+/QIZHQ2fzCGbuh39SsUBR0DdPOY8OhQPYtPm9qFn4sJvpe
 PcsQemgNR8HS12MF10i07UoqfvM/nv50u5JBFW7c3UJbrMhD3amppoBrkTIMK9A2bzdeNZ66mGB
 1+ekuntcxmspPvE/yMLKkmJECkZCgPEPXqOSFl7FeS489AExm4ssleo1Fob2OyvQ/wGEwlOtQYs
 LRaUUXTnNRWBddX3I8Yep0bIgH/r4CPRpXk04cV9ZgXRIio5gGFKMTHqAhDJWoB9TdW4xO78jCJ
 OQdalD3w5CwRIJHzyYCDUOYWrPltTzyyhAdUs/wOcQrcE2qB9fnwzd1qqBtdPokPf5PXDXX4qrB
 X/ge2axd0Kch/6UzLdYZoMfWZLj7QtWRzyldbjgY0u0it16xRMU0ALx1yKpjupx1kA7JmMuj5Xq
 FMgXhA1vmpS+2qclU2GXHqiqjWQY8BYlMcy23YNCtAj5Ib12N7rlZKKmslxbCmaIDq5a1t+T1kM
 RpWnU0N5ItIcMl0CkwsArGA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065001_286303_4418E838 
X-CRM114-Status: GOOD (  17.03  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index da0fa75fc9f0..c6cda0b80bfa 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -426,8 +426,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
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


