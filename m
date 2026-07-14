Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF50C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur6qA6hAP712lEuWCnSpdVtJp7T98n6tWpR4IdaSLTQ=; b=EaIubTs6Xc+TrnPl1wE88IpIx7
	VlFGbhbMuebZ0EOtTEmahkojaWnyZAG3fWB30V5xYhvwAxAJ4C4F+fOOz+pLmS6+A1wiLozC3gPFu
	3H534za9fU16TFG7ImVAFQpw7jd5sfOxBmjI2qyrX41dIonLfBXR3lG5303+7Ex0kUJNFHNMapHlw
	uZ74yfbGxVquavF3RYhwTyC1UZDaES51mRQvURUrlZ0wiO32G1EuY0nkupJQMWZttLs7acE+BvP1t
	8mt3CbjmXYZw0fpokxJtW3Gg6gtIRLCgPdqZenkb+B75XT0Q3wUKzXnbhIklAmAmol7l8Y/dDJgzA
	i9dBRx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilt-0000000D2yO-2Gyb;
	Tue, 14 Jul 2026 19:26:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilj-0000000D2ib-48RP;
	Tue, 14 Jul 2026 19:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TB7AELg6676iA3gmrpI+nv1duxzz5v1WNeIMI8Od/Sa4hjB8AebGXFdwK3aKmG8lY
	 fyjYVEeIE64vPCUj716ijP04E0xBwwnp3P0eLBwJjLe1lOahhcR+ZGLHx4eYIbB0I1
	 yGzIQL5lRSTHFMZPJ+vrIGw3FDNf+SskmiLvEdm/lxIq78P6IqgzCvu/tiQs+e9WX6
	 rfzcBtjBaTiw9tiz/JTh7KKDP4XWrFGf6MPV5uqX06/it5pH77ZXFcK+EqmSAIoI/d
	 2g9TrvJ1k/PqxImXFL4sd6+EhFgi3t3XlPS5vOIsbDFliyGQ7QNZL0yfTrIbW/QeFX
	 4xuaIY6+d+kLw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2684117E0DE9;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D1997480030; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:05 +0200
Subject: [PATCH v13 04/35] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-4-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1p3WFYm3nPwFyjx+ldeJOnj6dqBA+X1XeNTC11p7Zk4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU/7vatY19R8oGegDNZ8GU+Xw9rpXWtf9
 PsNYVYE3V2LJ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaUysP/3Ghko6nshJ62ESXJ6z1w4zG2FsNGKeug8lWbalQzCFSMO4qeiqFOhUYdOiA1BB60L7
 bI3xiu4zgN9tbKQg1LGOTLizulDE3aOQZQbQjJ1MSM8IemyEkYODsyyWk6S1gsomiXbUU4iTBhx
 +6g8YE1QMEqz1ETyyCTf1ZEq+d9I2Cg9eTldXGM5Bl5MQRbwqxEMRjW+5hr8s5hookXD32oft6Z
 YYuyrAXrpuZu3iPcxJMIiC87OvoUV9x+IHEIrp6J60tOoFiILiOtYjaGEEp8/4y4ECIaiJAQQ43
 DCvUkaQ9QVdLk98p/IHmGtBCWBGfUzNSPTNfjYil2DzstMLb1vpWQek6Ll/1fd0av83+p2dUh8t
 q4lCL7Y+KtxlcuoWc162L6brwxVQk2HsN39lEnD7RscWaqJCEquo66SjcHy2bq1nno3UZD+T5Qw
 mLVB4RDAj+i0TfJV0QfOlwJEwbyYzWSiBrugNA3QCRSp0dFdTRUbdxfjDsbw7BrIP0Sv79jm1SL
 RN+6dYzw3Rs/GZCbOtzEwY0JUbT1qJ2JCBsOP5qcktdEjICFs/VyYKFXJW4yywzFxNPzkZR4/UC
 PVL7Rl8OHoXZrlGDtEuSZljvmuSrGCZutKKRZyvlmfhb1gpzxg33/oo1Xeyr2xPYr93bB3YW1ZZ
 7Z6n7lSiwtCPdgb4V+hgq4g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122616_222865_A3121AA9 
X-CRM114-Status: GOOD (  16.84  )
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


