Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62924CDE00B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU9EDwtysvUbHDPXdbcgIU7SqfLkn5gQbGF2GbXa7pY=; b=S3ZaY5Wf1OAwAJHT20UfZbwKqf
	DQNtVTtbb/DFcoHtTERN5i08KDTFMEPEvXWyH+9kJO6DvYBF5RIfH1Tu6UlZwaqhffWmPBHe/vHSX
	VtJoo2F65rX75M/bvL3YzvlXGmCp+4zDBgMDvQgfoRVKi4P/qrZXMcUqEtkO4UWwzRjCWFB2xXfiY
	5A9btrtadE02nKUxWPhjdabimDYvXeERU0nxKPvHydcPHghCVvT4QpdHIDAYi/B1SWvps0aFy+x9O
	UClYFjSCJGbVskTygGL8MUSnQk8eWjDOIe5/a4uKT4D1j3Jl+GAmvhhmw8zMzfgJ504wPO5NTKlA9
	+xXiDIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3F-00000009ZUU-24Rc;
	Thu, 25 Jun 2026 17:39:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3D-00000009ZSt-1OTX;
	Thu, 25 Jun 2026 17:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pXR7lT/hFYt16m3GnXjOMs9157UtZW6Yiw8zvfD6KDYDhbmyAgs04v8Fp/j8dD9Bj
	 nAUIT85ONxc/XOnE2qgouPYfsBbC45C10jgn5/3Qa8J6o0X5YZDx7+rLiS9U8oU90v
	 u727aDflEa8QBGKPPi6/BbNKl64oYFbvMAgCOP3mME9qMH14e/WTrXKdrgCAJdFu/J
	 92DRjdBfRxlk5xxbUoZ0psqnMG5bsojOV8uhaQgkRMmME+suFNXHk4yC69IIu4jHxS
	 XZtBTVOjpehzqAhmf+3MuwbkgDf15Irluhr9Bp9ZnnKYVCBlYPvaJqda2O+/Rnz2+k
	 2HCp7dgGJTHdg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 481F717E01B6;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F15F848002C; Thu, 25 Jun 2026 19:39:39 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:30 +0200
Subject: [PATCH v7 03/27] phy: rockchip: usbdp: Do not lose USB3 PHY status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-3-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9p7TPIoFtTyV9h61QR6ZBG1Al1Ow1n7l
 eCPLZk3eyRdN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfaAAoJENju1/PI
 O/qa65QP/1Im65t9iCW4RvyZoakLzaCaUnzdWEpGzLNbfjC1bL1pfFRJTqxIzJRiCrI5WgLMR8p
 Z3yJKafSbLNscJJ7zxH96rYYO1qOBnpV20bJTJPKlicUvHctwGpWvAX0MAesePTq0m/EEeOg3fQ
 jNIuS6MEfWNGrZYxqqOEkzFq94XXTiNVrtu0WOvKd7bgVCpd+NxO9orjb4kibblevTO5Jz1nWoE
 JQ8+Zpua5E9t7qYNtzA3K2gU6aZXAOEWjZ5SqmfQ/UtvQPYI06AL7N/R4edjAC6sQZ0QObv5XCr
 FDV9zQiGf7sGUi030elTqC7knTMiq9fFNQMPzCJvsH/MPY3FCayrRyuYrfQY65xM98Iw4n11VSZ
 Bw7xsCZY9XInbuivbNiox2hF8+tObtIwdCL9OS8t+AcEGxpC1tC7mx5FMTEBqD9WKsXSGKc74SH
 UShKLNsufx8gomvvcK5OCemZykl+pYrFVmTKCaN8zAo2stA8P3XL0Oms0N3IrSEw30p3XKY5lyF
 Y4SZ2/q/ahI5NPXG785sgJnRO7kkJMOfKNnBuN/itVN7BKwRCZdvE186DQOVsx6G4XtB1ufFTwj
 0igVUvUouPDIqSOD7fYrD2EfHzxNZA0/wzLHIaa30VJ23Wi6Z/hEkHlV7SNcv3qdkfOONr+VMY1
 6coT9jY3Ys8Odk6IVOPIucA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103943_562256_26FD868F 
X-CRM114-Status: GOOD (  12.21  )
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


