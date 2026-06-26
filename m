Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8A9C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzrbf2ZOlgMSXasgiA813uVorowz+/R7EYhJ3WPjBo=; b=Q1XeSJtxxdgO6IgaYVaa8AzWME
	QbrvdZQhq+N0ywMrF7DO606nvp+xqazEGtZ81tRMhEIaCaoWc+YLiHVpKUdqh3tz6zgg4NCs46j0w
	Ok18tq+zmnRpipDsDGtNo+iQyDLiXuojNQiKir6shU1BhkDB6nj9cns7Quyd00rd1gIhfRNQBlwEJ
	iYQtHQJfqFTqBk8O4MDmIVG1vZqvn2WcUiAjCpxnWdL/Y2nnmE5n3WQs3V3aOZQj4QKOBc3NSKvzq
	/EpeZpgX1g2FaJ7lsfvKy+OVISxDA1BVYZj5NzZ98OG/jkHGODebAA6HT3eJ9QdIlchMMr2+lnkRQ
	EKSEu/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZs-0000000BpaN-1bIc;
	Fri, 26 Jun 2026 20:55:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZq-0000000BpZL-2Fcy;
	Fri, 26 Jun 2026 20:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fjKGfUu/SgCkMFsLGGOpRa09uW4xKO0KPwoxxOsdMrySTXZhGtoLebulEpBMF0+Rb
	 cVRh0i4fF2wUcr4IAoU4TgQS3Y6J9l0RxIMJxecTQ7q1kro9oCaQ4hDEmEWmdu5eA7
	 5vaBfXd47GhALcpISn2u+cZIJHs/Xi7ML/B11aIK5Hq4ijyYenSJhfqUS7rNh8HM5L
	 1rwXFyF0zCUR7GzBOfjWtHppUtUFIP3fa5QIyCqQaRTW8n0/9tLM/NeHLFigJqqOxU
	 P3o1mStnn8nFSLCCBoclKcJFe/8fJdETd7a7EZMOahG3rg4/WqiyhI3QQxpsgUfQCT
	 44QIYbTn82mtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EB2B17E0C88;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0DC37480029; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:55 +0200
Subject: [PATCH v8 02/29] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-2-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yQ0wncuIq0TqEaIQ0cGZ6hiF3QKJvVIq
 ow3WgHj4ebDaIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuckAAoJENju1/PI
 O/qavPQQAKACkti70G1jJsqhNOAQ8DrvY2FbnT7ygWto0Uj+7VpmMQCYn2My4kR3kvyZ4WqXvFM
 Pxju6kJJ7h03GlK9HNx0vF81yIoekaWAN8rju8ffWUN6VZ9fHiAq7VE/jjbPBtqD+Vv5QCyokHl
 LjUmLGVmKGC+fB4ggvpErEePSnIJ5GCt1ZYvKGp9Q2Tz2TdFxXKtmDNMH735v+2GwWdWUOJBqm2
 i8L3qVMjcSXtWaRNIZk2QuJ81OUGT/TEaXAC6zyl3UHt0lB6dc3gl2I4jooCUWZrsgMcE/aSPnL
 WGv8NXIdK+M6z4k8JCIrNUU+KmyJXR1GCAWpNGgPk9+8qSwuC/i8VkHiq83nUWqWW2SuDZeTdWr
 BzpfviTJuR2ZkFhi7db3tfQkAjA0yz0xQRSmggHCIFJqgnqHYKL1jNhvG4e/yyesCAjBzrPQqNM
 qEdRrUpM6xXxMJGU9z2HafAIgwqJUtSJwMccwD1KJKUXvdc143AnnbPzpkqrMl1SUuvYZp6Lc/t
 sKVhzmkWYAeQ609POJAvxmpcnhwjnuCwLegKFdD5o32HrieyC1IgmAIEI/It4D+mdXRv9wsuD7/
 rYKB6hl114jYSPfMO7I9/8QvkKnpXtHztEtAdZmqJavMAakCHj5P9cyrvsVfWcS2M66kMmaLC3O
 9B0dDM+eS8KmdPbWRQwYo8w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135506_736114_9A4DB9CE 
X-CRM114-Status: GOOD (  12.46  )
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


