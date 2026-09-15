Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pooOCh8bpjHTraiGB7vUDnV0wcXPNcvjhRwW0n0EQcM=; b=ZSR25VF99yjH82GGYYnsU3yy2q
	8jfGquQUcBOzesKD6KtEoatsTQj3QUtcmMdHc74taQvEVtGfMcFS4ffUYrMZvNHLK++R6+jB9iaMr
	VdIzZqPUbVl/eeNXchsYYPkRNyldQmQVWjYpDqPTX1a/Ip5ny2xZfucROV5GtPQUdYxYJXtDUQAd3
	ev8uKcfFME/l1URJD22EemFQILeqfHvhxc8D4+okdD66mmL5ZvwK0iZGNudCLhX0e25CATqtbFU2G
	rAkwJpMfOmTq3ccH2ENDMEzbKCoBlXWEt/iB/R7OreiUtyINS7Zm94wqYVmgi+sgMhkowBReGjy32
	yYz27BAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXw-00000006nUB-0QL8;
	Tue, 15 Sep 2026 13:50:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXs-00000006nQi-3f1k;
	Tue, 15 Sep 2026 13:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=NKKg6AEEXoM6tQyFXezz7j5lNyGVhRK42SMauPjhDyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a2p7s/iS9AU11sMMJ4nivDlPw8LPHOBDW+zs2BbohKEuiIuUEZaReKCEJgS21Usvm
	 t+gxMki2EpRFVW/xsW6st7jqJXlGZiW6eDPrCpLw0WgugcGqUpqjcWu3+kbetLP1gD
	 hhDDp/caFySjcPuBC6W7BAQHlAYUyjmqOfsRgyiU1H+Fu7wONoLyS7QFyn78q+Fuie
	 rdJwa7CvidaUCaATMzGp8NpbkKCcVBF5VCywejkxxXpZD45DPM1ofa6fQKW0vV8Zni
	 rAJ6IxSOrB/Oe3M8EqLmwFXmejQrUFZdK98WVaK3MCdieixf4khPHPfK5Zilc7Bjho
	 3LWYNvxAcP4Hg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DCE217E091A;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2B7A948002C; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:49 +0200
Subject: [PATCH v15 02/16] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NKKg6AEEXoM6tQyFXezz7j5lNyGVhRK42SMauPjhDyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQWVvWBfi+HlbBO4onPCersITl/nVV5df
 EvkbFkM7wDTnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qajMgP/13aHIc8MUKY/ambWT080dg1IDxSZSXaw9v86VelIfPm0rQ+/LwOlbxfhH2KMm2qJlv
 NzR6LJxNVGVjhAYbDXAJfq5EnsZh+FG5ebevI0Y7JsXvz04KK2Jza1wBMbXUaWnAanYvcLySrhH
 QjvkkAUIpZ58k0QwJHpYPjG5FEoftxC0FSHg2/g9GJ5m8tXa7VCVnR79rfNMxli2XTwjVXOMYob
 +xBipON5+1IMrhSD7074zS0VphRMLTl5wYr8r7E5qTW8gHQg1fzIMQhXZlU1htJVBEfOsDbnVha
 3b4CpNbE3OfQclKH0108Td7HWVv4jWYNTFl2gAe2mqGj+2w6YSkWCezjpr2O8ebn/51xsrIvyn6
 PY6LMxEP9bXGSYV8fLZOAt77k/Yh4qNCGcRCBxYcCnpuQCxyQ/e1ayggi7SRaQAhQaGhRRAm4U8
 R8uISMGd/I5A4eq4ZQ1yCgfkQChl6PiDq4kQ973R7WcYvR/SIVYy3u1P83ftbx4arLuAiILQyI0
 Ksleutp+NydSqED4BrIgQWwB6LcAuOVR7ip5vf7PcL25/RyjLrhq38UpYdAi1PBoi1BYZ62x86i
 cydkRap606vVZZapQokzXKxIt+pMAkF3OlBD28Dl4NQf6IMjXgw5aWXfsUlaTClVlHxBuqDNhFu
 z0/ugt9fZogXcI/yQ2cM3Kw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065001_078375_0D3A5E92 
X-CRM114-Status: GOOD (  13.24  )
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
index 07a839e41db7..13649b52e99b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -999,15 +999,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
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
@@ -1016,6 +1015,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


