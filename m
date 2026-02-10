Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC6EA3F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUZC+ngs+W45WbsV0KL78teH7AsjVk5K7jc4yhcKDqs=; b=uNVQats+HB6tA9XKo84Kx4gQhm
	17/itJ37jNrmLm2f8u0IyBNdZszQf8CZE+ffFm58xGluihbhNjvDEhdwOSgAlqLZ/ix9thJozibIV
	wvdngY9+aQQ+/f1flHdt2V31x0v2eR4Mc80YzTB1RWrGFl6ICcCG93glMlXclMhz5IADS6ZZW0UjH
	5uo80B6wRAVAdx4vvi1ecE6d4eTxxIsc5NLC5BhmDNpMjDtmj/4ZdbF2l95OCIKSL4fY+uX/raCI1
	dK2yU0mx93zQP1i4himU2VUu7Fs1ckWLUcKW41SDIDX5ZC40Z8qcHRsQ2Gf9RvCVjBnKopvETUPR8
	zzNtLZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiJ-0000000GfAp-3bYo;
	Tue, 10 Feb 2026 08:03:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiC-0000000Gf6F-1yAl;
	Tue, 10 Feb 2026 08:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=wUZC+ngs+W45WbsV0KL78teH7AsjVk5K7jc4yhcKDqs=; b=txQulDfnBtVB6bCnQyxS3vkJIC
	+VxnZFAGlyF/ETMchEf9mrYRTcobcalC29Mqq4mPM7defREH6XIyiolRcDe6YQZvOygPRDh4tEGPe
	AQ8pmHvasOpPzgKxIpT8hXczmYhrSxoBFfS3qAsM4UIosGqd2l4wDuWVffnp0pePTtjQXH3KeluO2
	I1koHCpQzHxSiVImYyjdbOT1a+4+oKfk9sIDLYjDTD9qPMiz6ZLsZOBnvtL7m1Vr2RCAMruGBxrol
	MsJr8u5IcHlh5BnKcCZo+JmakZWcdfx+8Lww/ld/krKHtqxKy0+HzrwnTjA1lLp2jMLsVNJwRu8Xm
	V6kcqi2w==;
Received: from i53875a81.versanet.de ([83.135.90.129] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpii9-007v2y-DL; Tue, 10 Feb 2026 09:03:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 2/4] arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3588-tiger
Date: Tue, 10 Feb 2026 09:03:00 +0100
Message-ID: <20260210080303.680403-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260210080303.680403-1-heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_000308_523696_5531830D 
X-CRM114-Status: GOOD (  14.03  )
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
 .../arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 27269b7b08aa..b4b8f305935f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -47,23 +47,14 @@ led-1 {
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
 		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
+		vdd-supply = <&vcca_3v3_s0>;
 	};
 
 	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
-- 
2.47.2


