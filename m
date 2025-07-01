Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BC5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UflXG6Npa1Ex9Xu8xYn0EEdz+Zs6jxI7fYDQRGm4bM4=; b=KPUHJG1xUMdfJa+LXvfPnI5vEk
	6528ZrYBka4XTxKZAJM2v53tcRIg7iMWKGOvLMS2EVIKHTrWOKqBaNSaTJ5llb87XoQ9yNIo92m35
	QbQjW+COvrzeZJsUh2rtLka07qFg05KsRcl66imCphXxrS0a+wiEUQrIR5rpG3DI9mIRkW34L0ik8
	SED0Ir3KkWgoZwG1h8K9EK41dQbMQBH7Z6lmUOmpYH7UORsKywYI/IJ/y7Fp6TZede+ecz74LodCz
	trKy7A6hSYduTFjhWCwcx2NI6mfZDIz2nkC7cOM5BxPySBcwR8FmkH0atsZXqwifyC+rSESzb683G
	oPuMs1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgt6-00000006UlK-2w9z;
	Tue, 01 Jul 2025 19:43:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ9-000000068be-2cp5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0817B5C4D99;
	Tue,  1 Jul 2025 16:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56D4C4AF09;
	Tue,  1 Jul 2025 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389090;
	bh=dAv9swBTXYpTgm3Qv9LPGFYo4DAoeOgGawWIkj4FOhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZbqGJ1mEesj+ZV6HEbQsK0OPAOaoCE53MwQR0juTCpT3NyAnFKm7mlThMpt2g9tN
	 Eh+PE7/z8C5gUHmpMMO5B+O3sDjus0WqmXHwOu+pie5gaFSl0wZ3A+W5H/Jp+fkCzE
	 R9kc/A0eD2nzxgaIYjrwzxLxd0G/Q1N1mhvKbCG8KDc04rLtMQxtbIYBZ+ZUafnRyb
	 XyzQ/FAVMFXn+GbBWwDB0G1C7yzbdaAlXEentmiAsyLUX2LlfHscO7XWB6PcAuFfYr
	 jpULkLxHLUVv+XozwqNoP4+tmkTF7JsIxTy8y/XctzbO2FOHycZnwYBGIao6+/Z4ta
	 hkTO4/mIWk4gw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0C7125FFF8; Wed,  2 Jul 2025 00:58:06 +0800 (CST)
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
Subject: [PATCH RFT net-next 07/10] arm64: dts: allwinner: a527: cubie-a5e: Enable second Ethernet port
Date: Wed,  2 Jul 2025 00:57:53 +0800
Message-Id: <20250701165756.258356-8-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701165756.258356-1-wens@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095811_795602_AE30A0D5 
X-CRM114-Status: GOOD (  12.41  )
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

On the Radxa Cubie A5E board, the second Ethernet controller, aka the
GMAC200, is connected to a second external Maxio MAE0621A PHY. The PHY
uses an external 25MHz crystal, and has the SoC's PJ16 pin connected to
its reset pin.

Enable the second Ethernet port. Also fix up the label for the existing
external PHY connected to the first Ethernet port.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index c57ecc420aed..4b510a460123 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -57,7 +58,7 @@ &ehci1 {
 
 &gmac0 {
 	phy-mode = "rgmii-id";
-	phy-handle = <&ext_rgmii_phy>;
+	phy-handle = <&ext_rgmii0_phy>;
 	phy-supply = <&reg_cldo3>;
 
 	allwinner,tx-delay-ps = <300>;
@@ -66,8 +67,19 @@ &gmac0 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii1_phy>;
+	phy-supply = <&reg_cldo4>;
+
+	allwinner,tx-delay-ps = <300>;
+	allwinner,rx-delay-ps = <400>;
+
+	status = "okay";
+};
+
 &mdio0 {
-	ext_rgmii_phy: ethernet-phy@1 {
+	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
 		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
@@ -76,6 +88,16 @@ ext_rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&mdio1 {
+	ext_rgmii1_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pio 9 16 GPIO_ACTIVE_LOW>; /* PJ16 */
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


