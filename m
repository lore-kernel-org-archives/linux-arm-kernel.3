Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A50C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzrbf2ZOlgMSXasgiA813uVorowz+/R7EYhJ3WPjBo=; b=B0tC6JBFn7lgeqWXif0voZenU7
	Ifjn7gD7RpFZuQvuiU1mWsQMdk6R73XvqPAcYJwUniczEpn6D9t9PYzbGq44dOzDASrtZ44IjfiPs
	IjTbyOlzJThkIPYQiCKRxy2JmrHTOglgWxGfutL3gzwp3RgtrLylb2wAZ3D4cuxcnWNhW3fpQqUDd
	7YqSDO5toogYvnqnihrku48j//S5DvbGe+PCEUbSL7DOxgdRvx1VKxH6rtEPA0QVhMbQMUCn4NNLN
	Nh4WRih06BbVKYRQuOgfoO6lftx1lmzd23OQHeE4LAsELTc//1kQg3vU42oEu+99R19ZuQMOxnBFR
	jvqzhLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOV-00000007doz-1pK6;
	Fri, 03 Jul 2026 18:13:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOO-00000007dfb-3jZJ;
	Fri, 03 Jul 2026 18:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a+Tjj1JOhkS1SP06o67qUqW+/N9xo+YsngWvpxc4ANUOI4Y0aCjwH+CL5+mnrQQPD
	 mm2KGD0AKizAc4GO6roGlJJLQp7y5XLB7w99fcZzLjYapAEyrg6b7HvfcWhBBRfLmm
	 y8vbWefjK0EENm0an0RO0Nx2y3wBgUECQhiEfrHBw7xsmr8YsCq352rZ54uwtasV1z
	 Ptrodkgw92g3Bh8Bbb1E5oB3iLqjRSns4VWWqpF7WXbxhbGPPNMb5Mm8+CVBP9+KmE
	 E1k7uQWpXPSVEo2siyo/1jcKpfccRK6R2S7ElUKIp30Ji3wl9QMW+9amtHTcuXggpj
	 nif5877C95OfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6B2317E1064;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7B92748002C; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:18 +0200
Subject: [PATCH v10 02/36] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-2-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8vw8gna8E3Ybk8eZzBWzsUkWoKcXF63v
 2qEjJxK9utrTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaLVIP/17CJZO4XFNTu0cm1TlU8yGR0hfWhC+FnKzJ0eSsOCpMF8k3qEpiB8F3wDlpyUMpi78
 xqv3z/SnUvSAZU57zGP2wVBWdC/XsVZo4Oyr6u/GSFo6FPS/udx+pbKCFwn9NKX0+fyij4rPqRQ
 S2hAIIeWG8TkKXlYNumJn8OtZzXOCIGFUD2cws0XMnPjkb3hUk32M/pqG8OaAMQidWDv3X5ymvU
 5l+XX5zFcLgdOi+dxsjS0bDdJtqJobf7Mw5x1hbeZLuxtYVy8+WV3cu6OS89iUBwhbqEi433/Qb
 kStS4CCJw/WkoQ7BWFOa1mJ2hcbr3jttBHu6nGOwT5IDF30Mc6NS+WD83mtuO521ef/16O7TQq8
 W6EYsM/wTVx90uf/ucbRRJda38d1V+jiz2itavWdXndDhqA75pGetvDk2u1AWU8EZJ+NEdhJlvx
 qFHrngXFFBha0oseEtkGFuOjwAA+hxmVN2bnLz/jFnCrgLhM+CPONiSxPkvXMzsYR8Seiizmx0N
 2TxtJfRukWE5CzRAm6hiBMIhjXxidxg6MuA/H/uPoVlQdQLzcNInnXtzf/oebpYSS03wn9fGwmU
 JnhznApnPRChJtoQ5YTV8V1houkaMmdBVoQEdWUQFRE/Y/I9rR9yFcZI9YhhVJjNg5uvkvv9q7O
 M6yIsYAMLiUwinhtzdtUuVA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111337_919199_4C9F80BF 
X-CRM114-Status: GOOD (  12.95  )
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

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


