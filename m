Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98746C44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=IA7nsDg0dhkpr1hrukaBdxJHKJ
	OJv9Y+z3+qZl4olVNvFdyw46G0F8EtLT9liXZ3T5te14Duj1Qyi4r/ZoxZRwH8OYb/RyfHkqUxMQh
	PTC0j99NwRqjnwwVhCZUavAjBOtUPMFbjlI9awfpwNonHT5ypp0cdw5HOXjutq06veoUPmT6KU4NS
	l2CB6cGANXl8QBKPxm0jpDtOf5e9S1pt9xaNg1PlIceY2Ds8yjQo8XIxJ5kNr0w+i5VQ4hXtGi26L
	PfR/SNC0Ji+pwnUpF70e6IfCz8jnm/LSXA9yOOyiifJxEb2fHHAz/Y2BJ8ovW9JRmFa7ea32ZkB7U
	s/9Dgy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu14-00000003LHh-3DC8;
	Thu, 09 Jul 2026 19:02:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu12-00000003LFe-25Zq;
	Thu, 09 Jul 2026 19:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GTHauvKnzd7SFlDljFZd6gtM4inFUMIkL28Lr/Lw7wDnGFrhtbvsurc8DiRUJxfG1
	 PJESMGmm1tsD7L6p90QcuSOnWql1p30gOW2gbz+j48dKUpYcO1ksAkdRLdRTMmGGnx
	 8ge439FgbGh6RNxl7uDcE3HrH7tifUhIzuKvL4Ra4qKi7lyo9Nk8OYg5Rd12NC0b5b
	 0djR2RG91azIfTOGTU8qNc/K4JFgAvDwX5ymvK750+WBTDsXoJ8//V/mCV54akwOXz
	 gPBXGn4GLNgT3kANBB8L0I7kDo/PXcqNTXoOeUiuKISNMV8K8XJPlfg2vUIa/4PI+b
	 Eggm7kcoH2drQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEE6317E0DFB;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A599648002F; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:26 +0200
Subject: [PATCH v11 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-3-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EQjsudxf4/WOIhhtLCpFVjF17WZM+Z1q
 Q8l8C0bfqVZZ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qajRcQAIMA8PmiKyo2R+Km3wV0GQoLW+qUv5C5Ck5lBoBAs0bYjvBRaQhCp5k+gROZsELvW6z
 9VBJeYkoqCnmR7SRSz7T6P5Y9rb35HpUZQgS7NKEa1BtM2J9z9Srb4wKuq4Cb4+ebeTGHuxfZ5o
 V/zRX1UBS+CsU065B+wLJNVNl8Mqknx5R6HjEEmugID1tH+6ZP9t/G6Mn6SQ2TNjt4PYEfCpZQy
 /U+Xi5NdofRyJ987zyc5UTzruaNKWNEWCGIGcWMgoQ3gsatLkc3xKUc2DpVH6PexwTyPv7yoKL9
 5l0K9G7VvqVxflZV22IzO0NIXaWQc9YQXDcf+sqrSIEQ1qYAUJ7XyrpAgWqeeh8VqbHh1KuOJNv
 vDSN7G6tyDuw8sBAVomexoZNaw8EYUrw7Udl/vNj4vLvpO45tg+IoDeAyb8vdYpvGkdtpmrkgpL
 ia7uchn56SkbvYFDsHtEdNoU2360UE79S1eZfyTYN8zpxvv2rzj5Aso+nx1uz0b/h4LBq2awn45
 43ae+t+Cyygn5cqSGCDfbUDM5HxeNm/5cRZzie9uSGleRLLZzF5dDPhna2NtYrAK2e4zZxltF4j
 hPTyPXbpy1xYOqwzrpktp0p4HgIpLsvKVQTwG5mwO6C5j8hOVcmtOLRBHRfm5HdZRx9UZ7+nEsg
 tPG5iFxjETqALmgXwFBUw7g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120232_703660_3F242A13 
X-CRM114-Status: GOOD (  12.47  )
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


