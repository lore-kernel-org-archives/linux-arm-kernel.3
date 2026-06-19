Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BFDCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=NidOdCLcoVQkYOutDhpgxhgPQo
	olZDJWvAWb7COEH5ZTK7OHd0pYx4AcONeCEA0VnBzP/hJZTQGH8XRR1hdsJsIp8h64WVdAgZRd44c
	2QFlzR0xLj5tsDC1OEZdEjTRo1y8OOi97pcMGFvhLETIfGmsTFkqjrMokJ4jBpumXYotyCQJi36V1
	c4F8SHw0uUvGdYzBblWR8zfp/+CYbOfzk88axnVNhZ5MBMpf77eUNq1dEwdWS0p5OK6dRINLWRlgc
	bokGtwUY1os8hVqG8/cJNY53tdH0Me5Tl9iyF6GGGyom0iVrPJwv1UenWnbXJK7BWVPRBq7hPM2sB
	D3qroAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9V-00000002dXS-0Hhd;
	Fri, 19 Jun 2026 15:29:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9S-00000002dVY-09nt;
	Fri, 19 Jun 2026 15:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BRr+SnkqBGLJW6hYfwpcnMe+TB1m1n88sP1rq8CBvXdL7eS6GE4BRsTfXAKMRlyxM
	 AUvvRV4K+Cx8uVBAlE4C724UxQeSjVQqziyAG0CttNXVjPeiabHRI9roeZro6Gw8LO
	 mdw3WPpAaR9ddqpyb0YytZDEyKhYS2PUCHcSszAF7RYGh/GHyPPwpurCIayOjsigo+
	 DtQOHX+HqyPjU8oAiOtO6kQUbCKaaNqssRmt9+ZCtczIlFjZ/LJubjC8wCuD4YmQ3Y
	 jJOHaN1aAZQIL5ta47S+NDxbrK0e8PjxqDdFFs6WlA0El8KHBqPUbtWiBebe63Q12r
	 W3MwMbLdPLudA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D441017E0D87;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8AB2948002C; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:54 +0200
Subject: [PATCH v6 03/23] phy: rockchip: usbdp: Do not lose USB3 PHY status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-3-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDiHiBZOurgSyVap0Spjcv7CGTYU/ttnG
 qZe9rijsWqOlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaWfIP/A344tDpCc7FAdXSiPBYeSCYXkFfnqqdPKPRK3quiT54C+podzOWLnLQQe7aDe2hDKD
 tuFH15CZwc/WbUCGlhEEsoO/us7Xvg/R5SzfuKhe6elRkd4HAPJ9MKj2cfxK1kVDZDxEOtg1xoH
 fiAKGlHujB0eQ36STNSfXwIOBH1V5i7Usn9tjBNJv8gwWLNqD3fB34kRCmvxTIfCvr2vNLlhGbD
 +HT2eBWBNDcfDrbSAkSbXPdl+WMOgGHgBUK5eD76H60/qsH2iW4770QgqgzkatVANQFtiO+qsch
 up56EJSJfcZDb3f42gE/fyXEubP5k20Nom1hGsiIP22HP/xhqGNr53L3lS+5xbZvDzHDGXj97M6
 peIK7OC6L2yDa0wUMymPU+9sEcMt789A8TcrreSufWSi6GmCD+B76MI6jxrZ+BcpuTj/wFaeg1/
 zQs3cibUTFJm2MKEYHVg5Q4o6YXpm9wUerLlpdUVTrIyqxJYK+6rLrry1Kc8EzlRoZIb2haX+oW
 moYH1fjtwn2BSxT1kW78meoQT1lyBL/rzC/PK4B4J7EduiTf+EPt0Og49qW23rlmrq4kAgOGKgM
 G77WB0YyqJardEqkdik3XKoIN60NwKs8TrOPauCPUKU8wMV0wLdjVyzXzTYWEqMMU336jevSeiO
 E0MO91tg8oOvJFlaeFpI1Xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082902_248763_E658259D 
X-CRM114-Status: GOOD (  12.32  )
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


