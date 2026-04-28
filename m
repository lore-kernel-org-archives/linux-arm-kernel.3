Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005DBFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8PYNkpTiu3b8bUgR55ExiK+XzqvkEMSU5b3Sy4UQl4=; b=fMleDRTXlJpqp7pYb5WTTolmgy
	08HkRDF+NIN6PGIJKr3y4OykuNHgDJRRs10SYy2vFkwq8XMj8ePlz0vY8a32zGOXXh/lwWlF660cR
	/SWDVgf0obGx5mcNjUNnbFZvmUIALw4SR7FMqssa2x04P/dl+dlsMKm9/ID5RSUF2/+pMaCbQniBp
	AJ0pZ5NKaF/mVR+uPZiSKwY/jJFgV+DTB3ZnEmKNU8+JgVF9pSsGAuNARQzk/mkQY5lhlzl5gxD8J
	PGg4ZdVKhDqCtJTj06gyatpxla6ov6lLuIFBxuiFX4aimjc0RqNeoq70mUpupRzuTAueyoS1rhrzf
	TchmFHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4Z-00000001sgx-2PCK;
	Tue, 28 Apr 2026 16:14:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4X-00000001sfA-1XwL;
	Tue, 28 Apr 2026 16:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=M9YKeB04nDfzPlkO52PaWO1g/F/RekD+6nPgWOS08C0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KWpksf2KZ4SBi2yZ9tImnK8ZI81DHlN51odpi/gb6qzCx+p9EcctztOG2GKYhNx4p
	 P9v+WtsuBboh+SN51GzKJjbnsMjeaypJMk6629BdaNZ5KRHbwKjub2jTZ2qfJjK2Yt
	 8F2mAzSboR1mg5wRGqEVTjq56IZxyMCcjtTr9OJ36LAc9pQB/iSFU5OnRac01ObbDm
	 n01HySNFeh1g08jPzVTMuGChQ3B8fYmlctN5mt0qa/LKMT5DZXrY3PUOmbZuwXNneO
	 og8g/tE05FxO0sgo9MaHxHuFIx+p7TRD2N1dFEnlT3OD206t1tpE8Hcg+j59s2yRol
	 LaTwfYKUEetXA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA71717E1525;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 814FE480030; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:41 +0200
Subject: [PATCH v4 02/16] phy: rockchip: usbdp: Do not loose USB3 PHY
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-2-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M9YKeB04nDfzPlkO52PaWO1g/F/RekD+6nPgWOS08C0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3Mh36ZC3c70C8q8aNKeGsDsvFKC7J2esL
 VRxgnTKfQt7hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qaLcwQAJkg3DjxruwxHG6upEbB+j/DWH3OkQuL3+/Km3QwtdTODAk0db1Sf7lUDc/3ig74TME
 ZmNTQ3hNNQZXLcfjif7G7UBQqST0fV0E4QFjFPiz09xp1sCzrBoMs7evQXIxKuFVZtUyOkt/cip
 EzZWfH50mju4KJhrilD4VafQG6ANohqS4/yJpbQJ+5CSCXBxOb/t4pFRFsWWCQRo2Uq82JJAAPD
 Lu/IGvoFZ66gW1r/KE0Y8vZQkcv5USlUb5rLXShoUGRWJ3D0uR+RTSbdZqXqXVrX7SQLVqeZIru
 YSyyyDbFuRvgyeQEVgrQs8htKw/Hibb62mzhTITZowRXHDbnGsNdWUce8jhn08o/XTXw/xAsUeO
 ebhD+3iEFFgw6bbEaZtdE1W/lqJw0vQFuCLoBj2dAShr1msAaCxVxhXWQb4uPzopeTpl1pvICv8
 /BsKgundALGouGzK323jSWl90s45ATVjkSrQ+zYrTRiCfgWXw+wjCo82SCHA6V1EEy+4bgc+Alo
 q1w1PfMjiJS5C/wZ9vJr8gP05t6eWmKj/hPdSB87vWy+KRMOr2hTmw7VQKcBLOHlbA2q1H5fFeo
 OFRvcfLG21NZ4OmBzIV+orfiUzovIq1GO/dj2qtHV0dWZvmFTGxZYJjDGj8JsjYmYmKAJ7Uktuf
 IY4zyiG3OIIwbHz5VU2Uthw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091405_569267_7FDFF6A3 
X-CRM114-Status: GOOD (  12.51  )
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
been cleared, which means the tracking information for USB3 ist lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..744cc7c642f4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


