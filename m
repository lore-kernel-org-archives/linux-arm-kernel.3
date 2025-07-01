Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEACAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhDdhO3a0WSdBLFIr+QHo4b0k9CNGchB/yw2P4rXDug=; b=SpsnykieC9QiIpojVlY8jJf3To
	UeeWZQWxT7adiVy30/9iPSEhEquWWtM/MRR0ORquLHIAMwj/3kTXwEjprpv+f5SzoNJWZouumxqWV
	NMRKAHzaiyetHmloyaNnKfc/GvroyW2AJlEi/F8VMTEstBLIqUkboPQirfDev41QXE/+BPUt+bIgH
	CODKsJqI5XBhY+uJgOhEhYtOjhISbYEygZL5I1ghiidK2aYyapITbjHzILwHN/da0pax2B3qH382u
	R1iNT04dC6gqXotWwFZ63Krn3pX6s6EwOYHgdB1GJlsT8m/YDt3leE/IAX9aN+1Co6jhKO7i2dwpg
	iR2fCG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgqn-00000006Uch-00H6;
	Tue, 01 Jul 2025 19:41:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ9-000000068bg-2jTV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0900DA53329;
	Tue,  1 Jul 2025 16:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57DBC4AF0C;
	Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389090;
	bh=j7Lagu/ioOP+Y5D/rwX6JgmvfumPp+N8fvcZmVNzTSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6PJlYcF2qBb+/ZYvfG329LCeiaiH6rmhvyQV7WOEJ+4NYO1ZxnXnaxSSO8r59TOL
	 0O0vvYjFEhWkIqVFDNGaFCTbeZKekyvNZfsPCkvLzElCwLHCcfUmzAHDJQRmB8XrB4
	 XeIkPgL7KB/a4HCdY3z82n4YovYPK5AXlq1CcmuY0XO76Akvf9y4J2AH7C747ZieNM
	 JUk2Xc7tGGdDQA9SM7KqORMiozFcoQDoPZKi5QT3SlxXGbNwGj/UW0QIBZqiLt329v
	 OiGiPNIZnkBBJAL5XlnYQljC4PKTznTmz+H0XSSojW/DrJsLU7hFq+I4OM1xKof9Sa
	 Xa1EX00DjtuKA==
Received: by wens.tw (Postfix, from userid 1000)
	id 27BC260157; Wed,  2 Jul 2025 00:58:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH RFT net-next 10/10] arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
Date: Wed,  2 Jul 2025 00:57:56 +0800
Message-Id: <20250701165756.258356-11-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701165756.258356-1-wens@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095811_785201_1991E13A 
X-CRM114-Status: GOOD (  10.35  )
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

From: Chen-Yu Tsai <wens@csie.org>

On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
the PI16 pin for its interrupt pin.

Enable it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec8f9..83bc359029ba 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "xunlong,orangepi-4a", "allwinner,sun55i-t527";
 
 	aliases {
+		ethernet0 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -95,6 +96,28 @@ &ehci1 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo4>;
+
+	allwinner,tx-delay-ps = <0>;
+	allwinner,rx-delay-ps = <300>;
+
+	status = "okay";
+};
+
+&mdio1 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		interrupts-extended = <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /* PI16 */
+		reset-gpios = <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.39.5


