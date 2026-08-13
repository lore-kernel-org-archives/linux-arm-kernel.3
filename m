Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgclFQdDsntWvzfssERp/Tkfxigy5/sAbvwMUFabpK0=; b=mUPqWUy3NqCqtF0H6VqszwEcwe
	Wa7xrHKa9iZb25Ru212C8iSZ94oKhpTc334VExQJnhoe9GQtxwD4wR+/B5ubX/tyHGzqWgGIF3YRS
	5wn+kZT9/UdX4LUB4tiYbBTQ5D+8jnte0FjhPW9/3qy31rWUCAec0hy9hCoiUCCdATBeiyMEPT3jd
	F1kXKtwqBhSYRSHM69Vcl7GVTZGzO1i6aNJQ7q1LFAAUjlQWxu60uce7MiJYRtJIdq3NXGbkFX+ID
	Y7zZRqOBN/uiZiFV6a24DX0eqQUmHbFGS5Lw/VFp+GbVuvX3FykLT+/49C7q/iG2FnVsWNHDcShx1
	prMeOVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPI-00000001XRe-1FAE;
	Thu, 13 Aug 2026 20:52:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucP5-00000001XBS-0Zsl;
	Thu, 13 Aug 2026 20:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=g2eUspn6SpAhrvG2oCpesFUQvKlLr9UwfL3mIyZ84IY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lb2UQNtTlLLQ97/trVmi69xVdXrIyDyQZ1AceQMF1M3OXW/1n0+wCJ1o9jcOciUjl
	 auQXIsmmKPwE7RSIjEJ7qDkxoLKjTq+s6DO2SjyyhqpUlxQul+rRXnS80UJ6/9+DAk
	 RWKYE8ptapVYxYXXinZZ1mIo9IEF272IDa5sDP7C4MP9U4RLwy9vnq82ScUHH28L1q
	 qNdeBYyeL1zs3TOkoDqf+YMM7uieIXPbZ0I/OKQLGQX0zupl6dBbjfduphJGGjtemB
	 L0D6/GRV9uiVtoVubFfnGKsVVba/23W6kpymOQPOsK/Qksnusnm5jBFZDnzx6e3vo+
	 7H3kcIOpwuc1w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA11817E0F85;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 996C3480030; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:47 +0200
Subject: [PATCH v14 04/38] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-4-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=g2eUspn6SpAhrvG2oCpesFUQvKlLr9UwfL3mIyZ84IY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQxNzUboEkFepUDK3bfPmtoL3FYp0VrY
 /jTY2+qmYzok4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaTowP/Avk67aTGzGpIyFHaV5g13+gq8pnAWdleaJ+67Q0UWNTU50cD06DQAy+pLvCj3T0mxS
 S7Ku39rrkP6kwM2FTWFQbFzuhlrDe44TqQ5I87D0ea83EkSZ6BjIYfDzWM0KMIMzMYlbtr8meWJ
 k+CsNY2Zkcy/4Wi5mz9EEoOHFhjL9R4VW532yzxuDaauGUFko3cT6t84Jf4ImE+JAlqb1cTBaJN
 OtBgGMfd92a0GjBQogdklD7cvLu/2dphar/ESU289DhmI5yKJoZAT0ElF900CbjOxGwTstyRXRI
 GPFe1AS3+HL8Lh/Pz+g/4935asmizx2dMbmct10LPkhlciyw65gxRVGTRwlc/w3YfzQwvVliC0X
 zwJkGL0hWh5F56sWR6HGYg0a/9fGUZyhhCSXhHDI0Lb+YQhvtG97CBnxc3ifitibsW0cqEkgnV3
 sQWurAu2GrczkIhaveQEjzu1LsRhCS2yQ6Kj5SMI0bRjW3N6+Pf+ZKCnhT/954MTNxnxU27W0dS
 kmPuzOgjhoxQs2WfTZwvunpYteK/VFj6pAoulWfIEhb3qKSOARWkTkjs/nz7wATLbbLqQlOcSNh
 wjI1WU1llGwiX36FjMWHwzhbUw/AwKdx31YcW6TRsZHsjZl5bT4HLVRTMk4Xk3Lw5ZP/dHf41QR
 zlv6va7/j5uPYKjb4LOgmTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135155_338624_03669011 
X-CRM114-Status: GOOD (  16.75  )
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


