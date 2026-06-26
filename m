Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B02C43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8QKZFe/C5slIphXJ1TGChpMhshRJUZT1W41IYVtzUA=; b=WhY8kqa2jYMx1ilIUaakePjfOs
	JMzV5KW4dPknIxElzDJeOP1zevV9Qqi90EfTga6dJpCFou25vhxsQyfDnWH90C7YZ6lkm0+SUspdz
	ZlXKFS9zOXfR7jyh9yt9URAkPBbBnSOF5Ao80LRzK9XYKKOOgANDEgjbB+mxZ2nGRioM1r+LsFOOW
	RQ3OXUMv9IT4voL/46aPYfbbXZN3zHXKNmSoXqNCFWqfEG3fDju4VLlugvDAtnokn0p//3BD5AWOf
	S7fncksPVF6nHH+Nu2ldQMcF8fnURlabVaYQ6yA0OuiQryJnRNhyxhSsPedpI1e30Jg79XBZLOoMl
	DmQStbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgv-0000000BsnX-0fNB;
	Fri, 26 Jun 2026 21:02:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgs-0000000Bsld-1LSS;
	Fri, 26 Jun 2026 21:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=w1EzhJbw1+CWxWELSy/0FMh3qpMPSygun3ROkr+XLhU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WKXx7UF84H4mgAwlSbvrjK7opn9VPbscrBUDlfmB5ko4aBhG3pwxGWm1ghwnGphfH
	 jHZkOPc1o3LJiyeRUjJuksgdTrlgSBMrmLdubSXioDaPAh7p8fJbGPMkjpv16jIDmn
	 5Vlx6V9vnosRWLaaHqA2j4OMZBnT7CE1f0cJNOYNQevGBGldQ7kmKl4I1ut593jBjb
	 +2P/Z+yRo8d1zgsVwta+NHXG9tKKChOSNDAjhFJzVjfOSIh0P9fpt+Lb6/1mo8u18n
	 FLKRfTvUwk7jBKev5oTd2LrQpttAZbVI8QgyaPZi14qsrnljGIKSa+BAoCf9PQ4P9H
	 qTpPTMvgWPSMw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0349D17E0CA9;
	Fri, 26 Jun 2026 23:02:20 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 27375480064; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:12 +0200
Subject: [PATCH v8 19/29] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-19-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=w1EzhJbw1+CWxWELSy/0FMh3qpMPSygun3ROkr+XLhU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUrCOcXxbymT1JUV0lC13AlwplY7Pors
 pKXXDEANT8huYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qaS3oP/0PvXXlW8r90mBLY1wQAlxW7TM/hqx5KYsakhMvmK1ipHlhc85TzfYQuOV06LmX2NYi
 dqh8qq+7ZJo9W9zmXQUqDkB21JSKNZ4iUuQXujCiU5NSEC/3nIQz5rVGAhCml/NwL01pO0J7jAi
 /397MAwN8egdMLm/6qxGEhpIJ+l5ZSUw96yvUFKmJe7XNTESyDA/hjOn9yp5z+WrB61rUkG3S4i
 d6HPYPWE6WoaiOTKxxprdtiiaYf3HV5OsKF8YQ1Q3C5XO8pX0ndmF8tzadU7mN9D7NXESYMyty/
 OmQ4G4Icc3G8233Ah+7Jfe2TCQHlAlqG2Fm97vBGd9OGMZMWtn9DnS4iKo8myzH0Q/pnIsCbc+5
 sOiW+X/NVAnf0sdyQl3THgOBkDQVXeK1p4fG1um03C2HAsRLvVasdXc4/7PN9cYuVS9hNbBTPud
 jMQFNW7quaZ/Vq8rv2BxrCN3S5ihk0yQ6L81P+r1wQK82IuswRrCNpMg9QS3Z1tm6aRBs84Q81l
 wvL1c1FfPnRm5WBsC0kz6TeygQFOCO6EijVYcs2paRjpWe5IwatU1BPhP4hJTtp5/pMNgRjRMhm
 +ByPNwsqNB7Fl/vvp0iwnMtwHHYsSsD+kiu3So5YC1GH/XG03v8KaSqQfAPn7sj+Ei1aED1WnZr
 HaWDYTmTMLa2VcWldwI8pRA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_140222_541605_243A8813 
X-CRM114-Status: GOOD (  14.51  )
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
index 731e487db57e..1bb22fc18c9f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -172,7 +172,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -584,7 +584,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -985,15 +985,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
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


