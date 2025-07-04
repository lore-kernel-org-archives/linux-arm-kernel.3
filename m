Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D42C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1sqWYxp1if3sBWB2IvCTO0f0/D/OhTWktW9YBAiC54=; b=v7u3aunyOWCMbggpaShVuylvrx
	QksP6gSUY1h0xyKL8DIfV0n3+iqg4Ee61dWKHJK3iwWiNBWO9MAospy+ErtAIP2z0DvGl0IjYc9aX
	2NiQL4pImrtlbUWIlJ8E6cOd/08m6MV9g4YvX03gdiyWZDJj6Qy36HdvagG9AM8+mSCX3c3UPKf+8
	SCSbJqY72FXFG36q1/wvcODf43j/nJahzqToLjdaTmxnYGpkArtlOYOBOCl0kbDdkdca7ekzEOurb
	xXzHmYn1lxeEWanIysy2672l5Ey4CJTLWUrWaBREQryMH7oUqxDsKLgg12I3pAU481e4xEEtoEgCs
	GH8Fgynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkJ5-0000000F6J6-1ZMH;
	Fri, 04 Jul 2025 17:34:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkGi-0000000F61e-2K5H;
	Fri, 04 Jul 2025 17:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751650330;
	bh=3HlCyLBTGav/NM6Og4Z9SyTGsQu3ubUJXpozkmfc/48=;
	h=From:Date:Subject:To:Cc:From;
	b=PEO/zFVrWAoxzRBs6psKovdtDRzsj0OarIT4c5FtOegZtrxhLJX5dT0lMTMdhdzyG
	 3zSZVzniSjvxjWtEHiRiXyaWABfc/3nADclJ0TYGrMNaL+/JafKc/RquBmXKB1jncF
	 x2u6PgS+DrycaGzwn4F61LBT53pftytOVFIdpzeO7XMpkU3OZCz1ZQ7ax8UsLn8h53
	 xZ7WLnfX5WKb5Tw2Wgk5FL0a28DOzg1OIw6f1ohuzdg5E6Zg4B2f9S4ph3BGMmGOB6
	 0Egf8bQKNNiWexkZmcnRO7B/IOIJ9TYGaNzbIeDQDiVUhHsLcPp46JnqHyRfc2/qmP
	 eTWZ9ErkeAkAA==
Received: from jupiter.universe (dyndsl-091-248-191-229.ewe-ip-backbone.de [91.248.191.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8938E17E0497;
	Fri,  4 Jul 2025 19:32:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1F988480039; Fri, 04 Jul 2025 19:32:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 04 Jul 2025 19:31:59 +0200
Subject: [PATCH] arm64: dts: rockchip: fix PHY handling for ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org>
X-B4-Tracking: v=1; b=H4sIAA4QaGgC/x2M0QqDMAwAf0XyvECm7Sr7lbEHaaMGpUoK4ij+u
 2GPxx1XobAKF3g3FZQPKbJlg+ejgTgPeWKUZAwttZ4COdSl8+GFusXFJdznH1qWVskTjnJyQfJ
 uiGFMfXQEttmV/8Iun+913UFlhJ9yAAAA
X-Change-ID: 20250704-rk3576-rock4d-phy-handling-fixes-054ac7fd8c40
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387; i=sre@kernel.org;
 h=from:subject:message-id; bh=3HlCyLBTGav/NM6Og4Z9SyTGsQu3ubUJXpozkmfc/48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGhoEBoTtZ9ECP5S4iU9jzszYGAsDJTKx5UY/
 gpOQl0cD67gjIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoaBAaAAoJENju1/PI
 O/qahLAP/RK1HzGMX9QG9jBQOmeS4LVWCxoMBCCNqX4keR9zSW28xkuujCndnypBIqe8ROJ1vLH
 /IA07FMKqQGsBevdMvltvxBkN37SzdfKo1r5apIvCvoZoyFr2RRm1yghAlXp13DqoLwGQG3KTec
 lRIiXmildR10R7fyDWWgXumasD756UekyM68V5jlgOOnL0vu3bmN+jYWNLrUIcq2RRF6anyITrP
 HTjtqP18pgslFmd6ZAddzH51YRUksK8kAIWhEbVGFgcGE0K97oPLyVZdF72nNVQ4nDPixtw2eDS
 on/kqXYdB8ZByto7LUb1J241dc44SriGL63PTlqAI+STNRzOB2pl6EjDhyGQ3nRyL+vPz0lQS4p
 Gpy4uIhSMTmaHn6oYzvYbqhbnXz+o5afkdXN3bTLfhGL2Gyxdn2WHChKzlBFxGhRCaaCEXSQ2+Z
 bE0c+F9wCu7ZccYCnbSHz+t/xuObCOumn9M4crnhqTHxx9VXpGTu2UIRGscX1CS4Lj33Pv//W3A
 2JS1j5VMKp1qkSunPWz1zuUNXPW33nQDMx2hQrqyliDKPA1Bz8vD5hqO3Pl8qxE0QMp2FaqIx6s
 SmkkBawGqw5vr1NmTPFiCe0OfMxjUdhzP5R/kLpU0Zgbp4iDxVecOUKuwctFoOFpBqbhrBhFqcM
 2pxLQQtpxCJ4M/NpLCjsjVw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103212_783311_5AEE329B 
X-CRM114-Status: GOOD (  15.55  )
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

Old revisions of the ROCK 4D board have a dedicated crystal to
supply the RTL8211F PHY's 25MHz clock input. At least some newer
revisions instead use REFCLKO25M_GMAC0_OUT. The DT already has
this half-prepared, but there are some issues:

1. The DT relies on auto-selecting the right PHY driver, which
   requires that it works good enough to read the ID registers.
   This does not work without the clock, which is handled by
   the PHY driver. By updating the compatible to contain the
   RTL8211F IDs, so that the operating system can choose the
   right PHY driver without relying on a pre-powered PHY.

2. Despite the name REFCLKO25M_GMAC0_OUT could also provide a
   different frequency, so ensure it is explicitly set to 25
   MHz as expected by the PHY.

3. While at it switch from deprecated "enable-gpio" to standard
   "enable-gpios".

Fixes: a0fb7eca9c09 ("arm64: dts: rockchip: Add Radxa ROCK 4D device tree")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Note, that there is one additional problem, that the PHY driver
needs to assert the reset line after enabling the clock. I will
send out a separate patch for this problem.
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 0388d72076bf79ee4f20ac1d3bc04fe1859f857b..02839bb489ec67536678bb6464b04f1658dda53f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -645,14 +645,16 @@ hym8563: rtc@51 {
 
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clock-rates = <25000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rtl8211f_rst>;
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
-		reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 	};
 };
 

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250704-rk3576-rock4d-phy-handling-fixes-054ac7fd8c40

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


