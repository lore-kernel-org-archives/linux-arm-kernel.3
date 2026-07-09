Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D4EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qKlWX8FzGSFJND8Ia7yOIyQJm+d2FFI59Vi2+W5s9U=; b=KspdSUV3XG+ATwsWtCKrAvYmts
	/7S81FjxB4qEbiLqkiOAV2XN3ZSPzU/+Tn3anoTSvczQlF9NUC7k4KwCaz7J++0xhgP5qOXNFELLX
	H3HlC7Jo9NeKmOdKuK/laJjvdXyv89evI5vgYeLRZuMpgGNPiUiW7jL5ZSqoHPA7i8bo1AU4OKCI9
	DqhqDZHM6c0tIWbYsOdEb+iB1vrTEoLWMSjVtel3i9JJpHFfHKtTEx3VQ21dQsT4NrHf6o2eD68BQ
	pPHqXppFyfd1aBC19ChZv6ygvMaZCxnPOAOJ6QC2DbsdPWRZQvepEk5Ho9rCcIUNkuNWyS085eIvi
	vvhrmmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu3V-00000003PHc-34zG;
	Thu, 09 Jul 2026 19:05:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu37-00000003OYz-1MyJ;
	Thu, 09 Jul 2026 19:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dxx27Iolq3cMsTgCvVA+sU8YHFz+IW8Jar13MKrOIHvxG7CalyS7eM4q8CdvwPa+8
	 2C/p2Zqmh3ZYzLfhReOUZz/x2i/VOatnFL+hpzQWLTtDvnIe676vs1TH7GLuJhjc7c
	 xpHmUUfRsoBjAGYKt7PBerKOuCGLH+0KGqlZbbbv/FsZpvgFQo1C238GYwhTMdeb6N
	 oZ1bHj4q4lh5c3tfjyZzSp1EAfWBPpsBrjOMGcO88KkOBtBwF5jaYqKukn5ncdqhq2
	 bZJ812GjSIOIyoAIzR05MPXXegLJM0jPfObHk4jeelHdq0cYOoS5jdSRSqmOagG8Uj
	 i59gwvC2o4qsg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCFE917E0FAB;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BD190480064; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:41 +0200
Subject: [PATCH v11 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-18-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EScRnyg21rvU0ThOg15HDFKRktnoBPH1
 ERZxXTcc5j8ZYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qa90kQAJPG/RiVvxvDv6FpCXQnbuMEOMQzA/IhDZeKMt3lxvMSTDJmcG7KswbaC5pJkV0jLkw
 Il0JzebJK6wuvfLZBmYUpdJEdcRl+lg5G1BdapIoPteJ/G7sHtTBt64sODn4Co4IIs+QK0XxlIV
 80SvHw+0kc4x8QEUWmaiCDYSrwIKjzasu2VFXIRhvNJTITFqRwE+gN7PkeaIJ9FJ9fPcNWbqePi
 S/j60jmkYdVLhmgJEXvPhkvMnc2wPsGV1T4TwgZQMpxe5KEru9Ph+nG77c89mGHQCtaXfrktxgx
 3hQ1sGsG1pqrw3vYfLPy7Y/XthzWMkuhSK3Dl5+R6hyY5Stv/+oP2CbQYemVmXdNpnLe67U29RI
 t19yeX5X8UV0oo8NTvQZVBisfxBAvT28ugi35m9UMCmhsvF5r21E4gtpqqlRT6EKpcpUGPJKml0
 IwxuraeLHOUFVtz/f7nucYlwrpzQdPlyTs1hqCOqPbKK7QEsFI996V4h53UXJ0FUpJgGf556sN5
 /kqR1kvxBcvrO/DpTyPOjTp10usBBJy2xPJF3dZeW063rygMzQqH1VzZkbJVIt/1aF+XdFyKoPP
 kylSQxYG08vzYCZak8ISItUHXHOCo5te9njOdAvG+zz/iJfXHKE1yGDpKAo0dtDigfBBMG0lOPX
 hpw2QkSdkvAEL6iuKaeQjqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120441_628022_C1022ACA 
X-CRM114-Status: GOOD (  14.94  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


