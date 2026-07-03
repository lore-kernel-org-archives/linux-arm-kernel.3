Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C5BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB1AgcSaGm6xIGd1SzCXsKr01w/8YieE6ZKIcR7OfBs=; b=VGh6Ht5lNyqIso78aSLBA1hTlt
	iXId7Ruug5Ew7PGOsMYODZm/7104TaKFSwgCZe8KOwzkKKHtFXIPtFa0vBFq4SH6OiHSV9k4ClzFi
	7a8VVHaRVcczoxVBhEkZC1BifhO5HEVieXfSkgDGoKaqcZiBhKkPla0jgVLmqEwvAg09SsXIR58R7
	NtD9woPzyb9Pb5gozkzCJihbp/Yilh0ZB9SJF+KeE1Yz+AcfwlDJyEZhx2T0QWS4l5VV8+bUpst5Q
	k+rsefmMCwZKiPEQMS2UcgOW00LZpACrh02yQMp2DuCBxwMQ7VH6QgShEWbauntr6T8JrS1IvtA4a
	uHgcPXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOi-00000007eHo-1tmn;
	Fri, 03 Jul 2026 18:13:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOT-00000007diS-1Stw;
	Fri, 03 Jul 2026 18:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lZ7+Icyy27QEAeV2tXaL7OAt4nR/SVrKFuzGS8XSiFZMBjivU3dG0D4zc4jItvS5w
	 U5lqkiOOlKDZlE9OWtGgVgGsZ/jpr0IiS3cXAqaKRURp2hVTi/TmBWRfMJyfCwEa+4
	 cMH29kIS9R0CfXpxglwnGPYdFqY6mBfteuLrLcfC6+QIgXMrUyfSnKhcQe2ozNovP8
	 3u60cRTFllWq9pI0B1/I6M1oE8ARhaY3wZVGiuc1Ma/85ebaLUqaHbivd2//VEKixy
	 ar0crO0aVNvU6qgzGaHfEZmAJx2Ukc/7ELsvKmNs0Nc4QdGc0v1oPDVwHbqi5ZnlNA
	 fyWC6vIEoAFIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5483A17E14FA;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8B28C48004C; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:28 +0200
Subject: [PATCH v10 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-12-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tang9OFoUOZTiYUvcaD8wtXcSWpdWVn
 cf8CKqVS3294IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaduMQAIg/uOy1vc7hka2v4Ap85+j5xdtMYfY5kF5eeyn/CvaASbkyUSq+HS0wY5ydFCbQ4FB
 hen7ipAB699fQbNZo+9cP2ZuBvA6RTI98zZEkIZF7erWI4JCz7NDOqfe6scSKPB7v3tAqWmbb03
 hQy0m2uVSO+LBEReUsZtotURfYtGcyw7e4vdfWZZmkvo8xxUwW1Ro2xDRJ7nEp+F1aUZ25ekU5C
 IMo+xs2w5vTcWo9ww6xTmJSZzRKkRAZ44idjRkRF7IwJTYXJ4XgXlXb8PKkOlzequ69VE1qqYVH
 ekSaRFCDE8WoEX4FKKzRyKwA4L/Lh+f5hOO7pwakGHoxQqtKbZzNhuSCP2LxWa0K0g8yksdJfr0
 dUJydvciIy37kfIkSuIKZhfLpVyjEQn7Oim/75lKOa4IXVt4fgJVpYyRR+R6VgUBEDIWbkXyOwQ
 iFmY0bob3qG+iifLHA0HPkEip2yyFd13w4uKYqWArnK6D7/nuWmx0RikKRBIleVEMz4v+sc1ajI
 subZs1OcNwO9Z9cmrtDYK54uiehfh0sEEDI9GUOSzbDI19cODBjP2XWe6MkSc6+1g/CMYbU5e0A
 DmcVbwYPpWicwvgQjQmAvHGAoOpR9+68N5b8EeweoutrIY1cXxW04Yghx60l5SYgUhZeq1S6qjY
 cWAPkfuaJmS0l5HpCJkYw6Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111341_560890_429B803B 
X-CRM114-Status: GOOD (  12.09  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


