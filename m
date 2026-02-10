Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B971EA3F1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qvgpQOKdKnYsnRxJ2HEXeDXCKwUZaclRd3sIgObCp4=; b=I+LhyCUr/ggU41rh5ijrglp0oK
	Y0PboypRxr4rOzXYB/Wbzf9NbTZmdw107aMTVl+efl+9r2EyF2XN1NzghUossftJ3fVED2H9SKhJ3
	73v9TxiZRsW8DPYtfDv5tBrbKCeYU3DbJTYTlD+NoPatfDcV3yB80666Z7d9E4sd76PpSKYrmuD1m
	Zqvqb+9eNYS505sxjgz7CVvH3OZmqNQqIK3Uljc4kYq3H4dLdI1nhVwk2dehQvd+H2Qi8bPzb/SNH
	2LJR5ZK6p8ZCTHrXeBn0PIMoBwDk63TNIcf7ERanThvjgQAYMH/MD3ZQcspJoKt1WM6HoLgwZCr2w
	vMiE6UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiF-0000000Gf8N-1LTG;
	Tue, 10 Feb 2026 08:03:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiC-0000000Gf6E-1vux;
	Tue, 10 Feb 2026 08:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=7qvgpQOKdKnYsnRxJ2HEXeDXCKwUZaclRd3sIgObCp4=; b=0dTSpJzT4IpVeF6s0WLsiTg/ug
	2Ui/AnsUzoh29Vx8yOuDQZdLQIkd6g7ReDS/ww8yA68sExn6U0WcYwKCq3/MzKryvxnCW8XLZVBpD
	JsRw+k19mqhQ+Yt7Q0ivTdI4VI0enaHX1vcMh4lOgUFE/njhpEODR6aa8ZJeUtgW6JwWRHF6jBPDe
	FCezRob952WQKH7HCyyGCZvdp0RSpvLR32OlfuO7m9A1/CZZe7AmIECu7FJ/G7vtnLpp22TMfkASP
	KK6UnCLKJYwsJ12zR9m/3v2QBkN/GKbzUYWY5IeywNpR0IGakQx6KsDXmI5qKaGYyvsJPeAsBa02u
	OvjYyuOQ==;
Received: from i53875a81.versanet.de ([83.135.90.129] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpii9-007v2y-2o; Tue, 10 Feb 2026 09:03:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/4] arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3588-jaguar
Date: Tue, 10 Feb 2026 09:02:59 +0100
Message-ID: <20260210080303.680403-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260210080303.680403-1-heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_000308_521799_C98E150A 
X-CRM114-Status: GOOD (  14.44  )
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
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 952affaf455c..e21ad7575cb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -86,25 +86,16 @@ led-1 {
 		};
 	};
 
-	/*
-	 * 100MHz reference clock for PCIe peripherals from PI6C557-05BLE
-	 * clock generator.
-	 * The clock output is gated via the OE pin on the clock generator.
-	 * This is modeled as a fixed-clock plus a gpio-gate-clock.
-	 */
-	pcie_refclk_gen: pcie-refclk-gen-clock {
-		compatible = "fixed-clock";
+	/* 100MHz PCIe reference clock from PI6C557-05BLE */
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
+		clock-output-names = "pcie-refclk-clock";
 		enable-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>; /* PCIE30X4_CLKREQN_M0 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie30x4_clkreqn_m0>;
+		vdd-supply = <&vcca_3v3_s0>;
 	};
 
 	pps {
-- 
2.47.2


