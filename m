Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8381E107BCDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWlCr6ne6Jqd5mw5sOCE3B9gfDaovM9HmT2Hp2MCpBo=; b=T8VX7MVT+R/h2+cAi3BlNKJnUA
	TYwIDVdNZaXPZl7m6GyW/U39w5UWS5GxmOFCdxZWW5n3JamFQCpwp4T98HzSZ5fk57QNTHTPeuSGi
	AcOGx618FxTjFnHmjHBgN1bfz333vyXL7EtHRmpm471+WskOnbKa11MLcupXCJcHEYUXsFyKDaADt
	1zv7Kc8j1Z1L+l/AYyXgoBvnhsiD6gCpx/tHVfBifq5JdYLZdt7BT+CCLWt+mIUVYgL474o5iEFNU
	FD3ePU6tD+9rM7rTRDotfMYDMNlcvwWuSnbWcG6BOuZDx1VKptTI8v+oEsyTtWwPaY+hiaeM3BE7F
	3KuvN2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lQ-00000000ntL-2Ejh;
	Fri, 13 Mar 2026 17:57:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lJ-00000000nlm-2I4G;
	Fri, 13 Mar 2026 17:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773424641;
	bh=oqVjDoZa94zSu90rk9b/ENEd4dpixcUZCizM4KN3zCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oFXyBgYP+FDS7aaLeugsmGtsCiW/HnTWTBrRXpjnA0LIz0gt+3JCRV9UITtHJ0Gmk
	 rmHIOE9gAyBrdyayEAXQ6MPzGJl7wrhbXHhId2YqZcpvXDrEO3oAKixqUC0FPazig0
	 uQyFrgl2WRL7xEXbIZ9oMRzupjn7IeRyfLLpULu8ZO4D42DmDU/MPKGqG2QyDym4oE
	 OoQTEsjwjzg0XhUB8JFNAEatilTEcDbmo+JIk5lxLt8XN5EfWxI5WAu1JJCJJfdT4y
	 E3SDMZoXErJs8H1Pq2xiXSUzwAt0SL4wst1cOFGCLbJhd/xtzrzxpxgsIwUySzpuaZ
	 JnA/ezk5+O4FQ==
Received: from jupiter.universe (dyndsl-091-248-210-078.ewe-ip-backbone.de [91.248.210.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C6FF17E05B5;
	Fri, 13 Mar 2026 18:57:21 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 26E1B480029; Fri, 13 Mar 2026 18:57:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Mar 2026 18:57:12 +0100
Subject: [PATCH v3 03/12] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-rockchip-usbdp-cleanup-v3-3-3e8fe89a35b5@collabora.com>
References: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
In-Reply-To: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=oqVjDoZa94zSu90rk9b/ENEd4dpixcUZCizM4KN3zCI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm0UAD6PHbw0tG/5ourLt9uGtRk64mEIdSNT
 oHKRnmp+NJHTokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJptFAAAAoJENju1/PI
 O/qaT8AQAJ6JK+6GTTvQWH+aIc3Z5FvcsOPP9AAjPLiMh5GjwajeigQVwogeZCgqpuGqHe069QW
 cHzxFeiB1yLA0pncuhpdBsr9ak+u8sug+1UX1sM6sxn5Tlv7RLCgK3PJacOWLFUzmDIK3oFkASW
 jpAdsro421VCoRuyxiimoLTDMcB8+ysJDDlrRa4rQ3F8frr2jRGzmQmjVdAldBEbPPcFhuE2EO/
 DWbiYhffPYarDscNRTZ7VL0LtARdykH7BrCikSXMxc0pN9SHU8ixQXaMZ51bW8GW5ONtoeCFqAV
 HIzmOJ9dSEW8VkzK6M75Le3W2eaZvf3YAmiude8MzEPc3/cbHJr3/jkswbi4D25qHekOfPmVP8E
 8M+ZcURDQ/EVojnkAK1b/lrWR0z7hTfUGuGdKctbQCUOUJuvRkMmVdRIma8q7O05NdEhKYKDuXH
 z5hdLhXMVz2ZJLdpEJsHtpBmYdB6fHTiTswgbr1qOv1ZNT7HQanPTXbXf4j+YxkB5JLBxt0RI1l
 2nxw22xh4lVO1xUXyXtaIS1rrLDILA+RPwyXIn8bBokW4wfv/JWNcIWwFYK3xstVR82X7rnmJHN
 0/05/uLvWnSxzJI0Ym0tabG6fVabGGid10fzNYz1NCFxZQYajXbUs3DU7W/6xS/cYiR6e4SjXBj
 EYkgYvJcxrdD4SEzEJV0vXA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_105725_766071_70D6AE08 
X-CRM114-Status: GOOD (  10.14  )
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

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 744cc7c642f4..98562a888b42 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1012,8 +1012,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 	}

-- 
2.51.0


