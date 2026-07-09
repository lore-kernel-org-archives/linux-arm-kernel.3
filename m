Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9979BC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=LzRJoFum+6Nij4Fgw2dn3861qG
	tr01ZAXuoX99qIuaUpt8nvaxQIsVm5QT9sm+t+xEA+yfWtcXWnuwbBvDtqCYVpG0F/Qm8ofE1SJFn
	8aKt67dTXWqqFY6zK4sDf0VGeQUYoE1IfoVBxT62ymfGKi2Kgf+YoCQV3IA5rJD+cQT87p7sgitK/
	/I7/vNVp9DHyTFWUNjuzFeHat5ZgUYLur5yk6QsWCB8avySW5HRA2hjrV0ZkHjRNNurjDyzQxboln
	+jfzswPxUanBFXhqkJFoUzoX3xtHYX0czgiyMPzUUPj4FGGEzChkCMRjPXI38RHEMqMnaX8kZr8bU
	vw3PNoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1D-00000003LW8-3PrP;
	Thu, 09 Jul 2026 19:02:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu15-00000003LHe-3nL8;
	Thu, 09 Jul 2026 19:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VqAUVyvmvsl07uGuZ6z0UxoulTmOXoCwkCgEMeGoEw5s8Ps2oDKXbTgzns0Qmvg/a
	 2ZkqOMKiz97doJebIdtxPRoU6stPUSZ/G96twsBntveOqQ74xL/PDVDDhedvl9Qbgv
	 OBEoj2SUN9DJ3yRi95/2NrtHKpmqHAihohpJIaPVv+ie7Q/3Wsbx89ia+TWCr6ubXR
	 EwdTjMjXa0tkcEUoGBoSlrAb7V5dElHuQ+hytu6BSdUHy3PX9qfQEDIOMC3NYcig3k
	 2Nt1Gf3vSviOXi/jfob/AVQoLJsBWSqJQadUrlw27iZnoVqYsThdgSOJPB+ud+ZqGc
	 m0dWT33HC2RXQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49BCC17E0EA6;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A88BE480031; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:28 +0200
Subject: [PATCH v11 05/36] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-5-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ERXD13e+3wWjN5ra/CC2OI2wy2cthVKz
 FW2X8w3iwKnN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaTtYQAJUT7J7thLchtcq5HeZpILbot/OSUFrnz62sIu5FbiWvBSGTzSxdT96b2dM4QMLuMjS
 INMh5FM00F44IOE7kPpq1qWvHGNfIwoXvML1wrAO6MIx86Xd4zROiVULc3HmtjN5lfEx0fd7Ccy
 K8zMyQGAb/5sUYp39wKwI7S6pkw6bVDKRfym55cbeI5UmgHdqkMEtgcF/dJIw6BpIDuVJunBTle
 FvgU9NynJwBULiFTJX+/r5fAuhW63dFI5KARLBGa2E4QXj1W0Xv+aSHJ4DkS3Vsi6fY2+pXsFL+
 p18i/7488vDbieZ24oejfVbPAn33G9hnsS2BsiVp8KtAdoWWAwlOUb75nXrqR06NDBtWFbV9PN7
 lw2ePo8d/A4XKZQApkBSJN8cfPe6D0qmNr4CemXOVptgPv4aT846pqY1Wc9SzGxK3GOjmwrIaL7
 l3fJv0va9SgMumDEWXRgTLDGeFnvybhSZYvN4M+fNvs7rrQAgPChkgwPr4nOUZCYtUpZlBpqBXi
 85TACt7UoQMFo71hq1LhTLIpo1QkqAJbX+TRaEvpvdcXzY7i2Gs5oc2fQ267+wLdsuNNXyu5hx5
 nDSIfWkyBRf3lLEEpgc38zz0A0U+eExfrpM4JyYDj6JapwFSwSeyYB/mN0ZYVEaZ5EAWqNJyKxA
 Vs93FLW6bpKK49ghpVZkuPw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120236_127701_4B14EAF5 
X-CRM114-Status: GOOD (  12.12  )
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

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0


