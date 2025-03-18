Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F36DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faYW7sYeCs8jvBiI/rxhQ44ivTyKNc+tdSqSdFkYCfc=; b=Y1/PVhKrcLxlieTlK3f2asEcoX
	BNW+ImHarEAAoCQsKw4ZkNFqMX+oV+dKsYc5/0/v3KlnO6wqrcEYCCbKWc0rjh9AvV/9DJ2Bd9og1
	Jlf63rWyFSkeSfFWLZBQIgfsCY0rf1HEA2tNxlTS2a0QjHvUVXpZ6SjUvaD+wXl7i49vKtk4h5mF6
	qWeFPN4BqFsYqxpRApizgt8Z9FnWRNpQDDa3lsi4JhjmfhKiKSk53aXOd9Wpm4ZG4tnRQLlFMa1eW
	2EM42arKtS6eQ8qBGy9pF9r1OlGSuGt6Bx7Trrf9GO1dD6fjkGKv8faAk6IOfQHjdmtkAqe2wrlM/
	kbSZazvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueD1-0000000761I-3VQF;
	Tue, 18 Mar 2025 21:10:47 +0000
Received: from algol.kleine-koenig.org ([162.55.41.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tueBK-000000075sf-2tJf;
	Tue, 18 Mar 2025 21:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1742332141;
	bh=F4648vkOLnU4pJA2jQ7juGAADHW7vjTnKVeqoZ+opAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UQ44t6LT6NqErEzEJGn7sag8JnW83bV9MayxheM5NZxgkGLATxhP6m/MR/2vp+XMT
	 WufQGYCH8ob9CuqH7CViiMbkj5ILhq/ZPt8PR6kJS4713a0/ZO9Fq5LpTC7K7bJA4/
	 raxeRIxDwSXDV1zAUsezZ6JkKM7yl+U97G2liLpkm9v9pkBzld9gG8BSDDWQrzHsjB
	 BSBRnQucLStGo7xdRdh3IwXJ157BO4BB0TNqlV4pC3n1Mrg1yEoIumrHwRD5KVvJpr
	 aVkTyt44PJiWujDb24xT7UhqaCzd11nNke0KZir5M6isZWwMqgM94lmYc7c6QLuRmL
	 cea2mh8x21eFw==
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id 4FF1FFC59B5; Tue, 18 Mar 2025 22:09:01 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add gmac phy reset GPIO
Date: Tue, 18 Mar 2025 22:08:46 +0100
Message-ID: <49f66206fccc714a8745b9ac35247615ad5cc369.1742331667.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1742331667.git.ukleinek@kernel.org>
References: <cover.1742331667.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=uwe@kleine-koenig.org; h=from:subject:message-id; bh=F4648vkOLnU4pJA2jQ7juGAADHW7vjTnKVeqoZ+opAU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn2eDjzSXuxpZ3lfvuA3S8ps3JGWjzXDDllYuJm J5M21at3BuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ9ng4wAKCRCPgPtYfRL+ TswmB/4hiprY5BOxwZ0bWC6FZz7ZhAyy7ZHjQxXFdJ/yOTGiEZXG89731nSmlImqO3Axd+dy+tt ZFFRPBVnkt+YSoIsSgkfEIUQBLgioj8kby/jTG1x6E53Cheqd/sc2VR98m0M/oo5Ri2fGHC2Gnp 5yuAQiRs8pFSRS6hPhEYOTnpYp54oeFNECIGGeqDvGyCcJwquuYSMpdXHDDmmbQYTwm98EGFUgY +QwgkmQ3g24109qwJlUWXwS7oq4fy2YTV4D4sk5MiWm+OsuceZXxY9NUXQwTMubA4EcQzEX6hA9 UehLBs8bukPyT651UURA+AbSYocLZ3HZQsE7j6pPrTBTpY5R
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_140902_867088_A61408B6 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

While looking through the vendor U-Boot code Heiko spotted that a SoC
GPIO is connected to the ethernet phy's reset pin. Add the respective
reset-gpios property with pinmuxing for the GPIO to the phy node.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 70e88769e21c..411f8ac7994b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -485,6 +485,10 @@ rgmii_phy0: ethernet-phy@3 {
 		/* Motorcomm YT8521 phy */
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x3>;
+		pinctrl-0 = <&eth_phy0_reset_pin>;
+		pinctrl-names = "default";
+		reset-assert-us = <10000>;
+		reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -557,6 +561,12 @@ &pcie3x2 {
 };
 
 &pinctrl {
+	gmac0 {
+		eth_phy0_reset_pin: eth-phy0-reset-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	keys {
 		copy_button_pin: copy-button-pin {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.47.1


