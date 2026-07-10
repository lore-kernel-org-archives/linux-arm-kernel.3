Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7193FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzrbf2ZOlgMSXasgiA813uVorowz+/R7EYhJ3WPjBo=; b=vLWwWgWQHmvIZT++dYC/PbfGks
	CB09uXO0eWku/QiE0chu2r2wGENcR5pd1eMWzRoAH7uuWvcC4yrn2/4DAR9FzvLICLELrmVuIUWVB
	y2i48PIY1+3Jm0PgrI/+5zHKvS++KQgPmrvhdHoHqdtlevXjnC91XmwXQHjx0fr+Te5uBetke2UL3
	I84s4LIE0XOK2nED3tfiIObUic5bnhxYljm5hRFTPNPZ01CJg6951CkIm1GMWSYct3V3b1ZHUfevk
	WO6qAJaJ0YCWy7FXg1pIJ2OukjIIZgrSprfNev9EQbt3X+qkH3IAjIDs1uUPhmY6hCkAC+EUKbobP
	snNp46fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMr-00000005JAG-0EF3;
	Fri, 10 Jul 2026 16:46:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMn-00000005J6x-2ijv;
	Fri, 10 Jul 2026 16:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BPBCBbZYENC+Wouw7CU5Sf9hgvmASQLVMZ2nv03HqQZugDCLM3+V901pjI9ZBWJRm
	 arD/MSnoVnnEIMnI0A2WalhIhis7RLO4HqwZaX6SddNxeIMTG8fN3pweWwwnLFgSLZ
	 zIlSZZQ8Rn0gFe4eoOUZgp/w9w6yQubg1NbfaEisqxN/NkoRyF7+lpJZziszzBpL8m
	 BSv0KeRMJhRzQ7Gmx4s1SC22k7jibK48GzoB5BjQVbnNXqvck60KTNtzthIRj37Iou
	 j7yLIbeUqZ9K/Olxuq+zO0jMrbcAmFPzpudLNw8aG3Wko7EFZAVxXSxENxhT1cndF5
	 86DEhM5f3JqQg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2975C17E0DFB;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DDA3048002C; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:40 +0200
Subject: [PATCH v12 02/36] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-2-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdju07IdEp1//rgvPmjXk61w3jGZp4ZUE
 mwdDgvj6wRYrYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaBYsP/ilzIDfF3up8RAeZZbaNhUG3OVibfQYSz7HU89vRhIpYqljoOK1Dy4uGfphsRm+XpL5
 Yv9W6QPu2gFKYSryx6+jH5PwGBSr78RIytaZjLUyp8k0Feri9PXxefcJ/tDZ/xofufXFzzs2xpE
 1ciwQJNQVDbNqfL+GhQdj5UIe0pV5KnlBk7DvISqG2X3N/J5HPqcQ5L31P4BVItE2Vc2flSph3G
 rfFSUVRkSZAfY5qv3dk4Rookd0Gqk9sWiTANWpB/fI62f3VXpT2ItmHwqBPYp6iWZUkVXX50tIq
 G6deBR2UrV7+L5egMLD9OSZAJ6I3vObSw1bOjodxrcDEUOpQZYHnqAUsmLxKPDEnQ0w9Y+slgLI
 8HthkbSQYu9qxoO2YviJeMIFX/ZzuYyU5wdBVfvi66hzHhqmrmCTac+3pbUj+iF4zyjEeeHcTB5
 H6PPoaflhr7vw/Bokz6DJ8hJO9aXzX9rbEzJUBW654+pnD2cqNkg3rOtG2eKWNiV9rS/2FIlsRg
 UvJcsfnAIcTV67t6aQkPAChXbLujRIzKwOJ2fTimvI/nRz/8OzbNWKrhKpzrBPuflw5afGIPR38
 5pJs5ZZfbCgGqYaLBxXAfuSHtw8EprXFZ9f3BpSCmqLZRABtRSck4kc3RYHyXsAwav8Tk7uWspL
 SIWNlIo27EaUdsAzv+2gzzg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_094621_833323_040B8FC1 
X-CRM114-Status: GOOD (  13.28  )
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


