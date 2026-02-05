Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BDBEC1E98
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xySJEGujkFZ5SXwhZvO8uWauZklpO37yk1SL78e8tXg=; b=m1OxO0j8ggKaW9zRpI70H4ga5i
	xtUFXn6juQLZVjbt9stO+Vtg5B1voJqeG/K3KBt8xfVk06sZLMDRUFerbvyG6pMMvMIHOOPOeYuod
	PuYxsiTOjUxPWdiG5j0yJ/S3b6AwFmqNm2/gNf7+c6fq5Na9kAZeHvUTqbN8piZxdl6hTzOXSFvLO
	AzzBZo998wUtWgggueOjhL+nfXJW56lbsL+wRMj6H7Kepsqp+gYX4ZfdCzt3NlUZGegsYnGAFd+3d
	pNqpDAbFbGFVILdF6MumoTWJ+bZ4rD5ZEmZxdt8Ual5gNyKZsptCLlijePI5KvB2foPVnYO0C3GyX
	gjkUqGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwUB-00000009lin-35aW;
	Thu, 05 Feb 2026 10:21:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwU8-00000009lgh-1dnx;
	Thu, 05 Feb 2026 10:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=xySJEGujkFZ5SXwhZvO8uWauZklpO37yk1SL78e8tXg=; b=liyafqLL6Ss89F6mVD5XkguWuC
	GERgLbswu++vGijR1UVRX2VmxV+RrAlvzFDRrBFO/c4LEPmzXtVAZ685xyLLTTWAEE3PjVwDvWxid
	Yf5AjFHXfBvnRjAdl13ZGZYBv/eENpTZaOjS9l710D15ar0ioF7NjpR9++QZMRU1KK6sb5gOPu/IK
	m75rjpJ/9xc27Wt+XXGr/suzI3lJirQ04md2vPmU3DjiJFOEXoAGvf0HGxKmHehC0y/X/lt8zemgC
	pFhny2J5bA0wm+PCAq8srSHrR1DR2MWk1KSzVYQoVHu/5Q7AiyMLa9QWgIOb7MRsSpfl0TebSvd+Y
	klBRrCTw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnwU5-0075El-Rr; Thu, 05 Feb 2026 11:21:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/3] arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3588-tiger
Date: Thu,  5 Feb 2026 11:21:03 +0100
Message-ID: <20260205102104.394991-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205102104.394991-1-heiko@sntech.de>
References: <20260205102104.394991-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_022116_733691_388F1B24 
X-CRM114-Status: GOOD (  14.15  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Using a combination of fixed clock and gpio-gate clock works but does
not describe the actual hardware. Use the gated-fixed-clock binding
to describe this in a nicer way.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 27269b7b08aa..259fb125e13f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -51,19 +51,14 @@ led-1 {
 	 * 100MHz reference clock for PCIe peripherals from PI6C557-05BLE
 	 * clock generator.
 	 * The clock output is gated via the OE pin on the clock generator.
-	 * This is modeled as a fixed-clock plus a gpio-gate-clock.
 	 */
-	pcie_refclk_gen: pcie-refclk-gen-clock {
-		compatible = "fixed-clock";
+	pcie_refclk: pcie-clock-generator {
+		compatible = "gated-fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
-	};
-
-	pcie_refclk: pcie-refclk-clock {
-		compatible = "gpio-gate-clock";
-		clocks = <&pcie_refclk_gen>;
-		#clock-cells = <0>;
+		clock-output-names = "pcie3_refclk";
 		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
+		vdd-supply = <&vcca_3v3_s0>;
 	};
 
 	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
-- 
2.47.2


