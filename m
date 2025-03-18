Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB80C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X18QpL7fnOJJbsLyetroJOeqwUif24s0bvwUtj+lvKU=; b=shx4CbhjnfrpjCCbalvpawLWrG
	HAT6D48TsQw9q7uUAtEzheusy6uiobuYHnUTAEQcJOMBt6h1bj5hhuRdf6Pw1wN3l1T8hm2uNIgZh
	dK3/Zk8KhzsGHI7DSMeDSM42zG6C8YFmf5TPLjmvh34a4eirCfW67eTbtIffniq6IsqO4qG2mRLWY
	70uSNaWpAu2msgra90KCHTagn15c2xk5Z6c3IW3nJ+OZsQJqMhqBCA1dhd8lejxllcsegxuKJW+AG
	4gAfJBXaj6U+LgIJlfP+mrcCQnzejuDBnZTg3FPa1F6HrNAuENb9ccp7Z9NRGvCznqH2hzCxakJ1a
	iXkueZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubzz-00000006q9M-1n0c;
	Tue, 18 Mar 2025 18:49:11 +0000
Received: from algol.kleine-koenig.org ([2a01:4f8:c010:8611::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tubwx-00000006ppH-39MS;
	Tue, 18 Mar 2025 18:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1742323559;
	bh=SIYP7xVZV3lmgBMVLByXJICeBe4GP9DuYdjQ55XLqPA=;
	h=From:To:Cc:Subject:Date:From;
	b=gBD6wl8/L9k6WBaLBrJWyZ2squ8iBYPKQP0Ygpy6l3Hs9Ym+RHZtG9CpVzHQ97FhN
	 cdq+jLr5gb8oVdsUDCm9/Lqv7lvXuzu5tZ/byw/tT8u22TJZPnmaAKLibhnOHDl9OL
	 zbgs8kTxww7PPQKwPgKEnXWefFIsns4nKu4o0pe2Odh+qgjnbXKthHm+TWo1xhOEXh
	 noxSgxxBrMmuCQ4E2GJh41/fISWYyYFq9YvemE+IS3DcNI4gDBSA7Pg/nl2mF15vin
	 eRKRC1F2cgeTlG+5n6WmBjjcEuIoPT1P6suHQQHWFds8Py9G3TMMLuhs77tf14Z4KZ
	 sKnL0wRIPb+pQ==
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id C1A50FC57DD; Tue, 18 Mar 2025 19:45:59 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: Improve gmac phy setup for QNAP-TS433
Date: Tue, 18 Mar 2025 19:45:49 +0100
Message-ID: <20250318184550.47642-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=uwe@kleine-koenig.org; h=from:subject; bh=SIYP7xVZV3lmgBMVLByXJICeBe4GP9DuYdjQ55XLqPA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn2b9eGjQYxA360+FfA+V4SDGvIdwQVyFQYDmUI RlbkAY3wP+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ9m/XgAKCRCPgPtYfRL+ TgMfB/9UMa+vPPygl9iWkXvL5g8ULT0onyQk+mJ7inIUeSMhJs8sORjSJfzePW7viN/txkh8wkH uM7C+sR83bIUdoDdkUQTEMlS2+4eAoL6V2wMADbcrQFqUzE4iLzlJzj0EKd7CVYCp/XOBvWYqww IHLrAlQl4/xWW709iHH1QSGrOalcMZ4DaubVangBfQyVqVSE0zmeYU3ktKaMd1lsjy3WFHkdhl9 f35FUGov7FTWh2rogn/E6/EGXLwIucCM7N/ZFnhqP89OSESnd3HSoCE3hQpYQSNMUzs9Jpqklt4 3ijdgyKUpUxRa2F9OrxTYC7Qi1NlTzZfe8VHd65VnlxqA/vM
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_114603_933826_9A99BF5B 
X-CRM114-Status: UNSURE (   9.98  )
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

Instead of relying on the MDIO broadcast address (0) talk to the phy on
its configured address. Also add the phy reset gpio which was found by
Heiko inspecting the U-Boot vendor source code. He is still trying to
recover.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 .../arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 7bd32d230ad2..411f8ac7994b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -481,9 +481,14 @@ eeprom@56 {
 };
 
 &mdio0 {
-	rgmii_phy0: ethernet-phy@0 {
+	rgmii_phy0: ethernet-phy@3 {
+		/* Motorcomm YT8521 phy */
 		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x0>;
+		reg = <0x3>;
+		pinctrl-0 = <&eth_phy0_reset_pin>;
+		pinctrl-names = "default";
+		reset-assert-us = <10000>;
+		reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -556,6 +561,12 @@ &pcie3x2 {
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

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1


