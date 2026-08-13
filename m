Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C1FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epZQOmVKOrllB5NeE/5wnoT8O9q4hZK0iRlao7epaQw=; b=S0+8jNLvADfhTSeyTsL/RKy1L3
	8E/pISpsMBpsKbba2IYqHdRy8VKSkI8q3xoXH487hUfjQ+Sp89z7jtHaX+2/E+iDPN4iMU+4bj7b4
	sAfnSdGN+p8AHoZxHBRIgGeledp5bO3k/2pW3WkXs6l6OZzmAFqZf0/c3PpdOClt4NEHA/L8o0shL
	p6XHWW8nUBosBUH9HOvNKl0P4NFv80bVPcRo0AV1GwuxsGvYK4M229i3072z70RubERHglQAZr4+I
	3j+DnGwCeU2BlMaW1QleYuSro26ZoO6PxGZBWVvRG5frIL6W9xIpvVwii8HmKSyoUoJ6Amxh60rw4
	gOOkj+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPB-00000001XIJ-2KOX;
	Thu, 13 Aug 2026 20:52:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucP5-00000001XBR-0HCQ;
	Thu, 13 Aug 2026 20:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=4f7kNJiMFTnP9e9rkfZdI625/gkPYEgxMISSEZRPNeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HyRaaVQlB0C1M+VcM3jhKD1YB0OfPGJIRaqoxTBnaLwGq7hRIScAF/kJIIce8n1ey
	 TrMfpEukcNTH6oe8ZpwXg5zY4LupYaC+9pbOFkKaZnB7SXyWUBemWQeA1oXWWTEtHX
	 ZJljVnuAndTs5Cwn5UhjoDTqbg/YDw1pZK8nzDASEsHbD3uqj0rDKnDm6tswVG94ZP
	 nl1wsCagfxxOK86oPFskXhGkgcF9FKmeTe1A69p3+05VcuPck1d28gPCPUpV4hJoCZ
	 wD5EpMduL6TFA3Agh1GyEzZDvVcy9egh3SgapKuZ2hj/jnI9oMa/dY5xOjpGsfOHgy
	 FsLiQ6GvqtQRQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6D2417E0EF0;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9645948002C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:45 +0200
Subject: [PATCH v14 02/38] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-2-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4f7kNJiMFTnP9e9rkfZdI625/gkPYEgxMISSEZRPNeA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQtSHGGmamE4dLHmLB/fQ/lnZJgNUyrt
 Ji2TzxuB6+Tn4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qahuMQAIwNoeAEnEa6Fe33wG12W3T7Y4Gvwkz8PlvrlG1cNN2Xg6ibb5jFXQ37bgHtK9SJ7hC
 OPQszbNQHTQHQOyhIQluF7uqyYPqIz4w0drlurX8ttCcFXRgc+R+rTy88ZeaESdGFtUdOSdmwZt
 m5x9pxmgGk0xkPfViQcks/Ufu/bfgzexHFGG7q8VX0W+m4oUpvfxEcV1RsOBVBXoj6X4VffR1Hd
 OsA/jfztg6FiXhs2xQMVDG3y9EabZ60UxhVf3bAVXVpbGGKEzcpQREs5iMUTS/FodGDR4bf2uQF
 ZqFvk80MiEGrSkLhzGGvpyA9d7PJQfQ3xu0sF5bz4+YqpJeB03EmuQsBi9QzE8SRkL3vbVaJnb0
 YWDtN3WzZ1shhWZP3vzElpx7vne4efiiwi9c2nKXXP/J56uTm8vQ5YOJnPaAkbRtqty5A9ab5oC
 YqVqTv6eZQDRQpTYA7vfg8E8dj6hBEmwmnOf13kpUErsUJ/akbSwKmCGwtoI9Zsu+XGSRbKMg4c
 yNKrcWCxzLAwlHg/LZF7nBpvqvIkCGrWstcmPiImTeW2iX6mWhc9ah6lZT6G8o4g4oHSNVjHjbg
 yzNTB5OQoEPEY2sVXbGSukJzzhwsb54pIHOuNlJaz1HBNzw3vVZJ5HTBE5O3t7yuN/u1pbynUnH
 6BBzsCsjjpj/D5mIlE7ErsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135155_284268_B00E87BD 
X-CRM114-Status: GOOD (  12.96  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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


