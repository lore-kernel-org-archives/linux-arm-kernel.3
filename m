Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF2EA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LAkeeuR803P8LXVEZcANcWdKDHU68JzR37mEZkU3so=; b=HpvZyHwDYGStbDittkxagrZ8K5
	Nm51313YLnug2gsVNdJYjF1zRMFb25KT3lcIqobU42kMY8CWVl41VtNFlstHdcosWXIX1d9EGA6Se
	5NjGwITfOSlZmpTYGDYdToaxyfAau9fL6ddvOVuzmSEKbZ+l+W+0SecbIx72S4NUQzyHthe0S0L0j
	v6P89Re75EgXSYzGxNhfNfZM35graMeeepjXK9U9ruFJ+gHPDYkDSh7GJCcFP4ry10UvXIitwNUVf
	3Dmnezx8cDf/FYmyfVBdjtfivsrCJHvZM53XC7s1uD3Yi9gPWqERUvsMN5q30Q2+tSWLbqPfqGwrI
	FPTw5c9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BM-0000000DMSy-3rHV;
	Mon, 02 Mar 2026 15:27:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BK-0000000DMRU-3ENv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13FC04434D;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EF6C2BC86;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=OMfRQgfsQDyQJeWugDAblKSTBtsVMa/6YkVPJx2p8lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqxOI7BxzZ0qz7vSqumO/C6C0Zem/L8wwUk+SHT/N5E9PQyVzC7O9QFQ+SgBqDbat
	 QlysAXQYr6FdoDrDlAfmLKw/QCKc0CwiQMhbN4lyuX36kjxN3vaMpi2vi6nOR237BZ
	 +VvWZiqpK5MhJmzj73ZuftN5VCQYfv3nG6M3k9NPXHpx4V89zDErrPUY9DaoQSslGM
	 kNsoXiaz06i19IQ1gSnntIE/91QPenxrh6rRTnjnufLIMqMElvaD/TKALvEU23Hu37
	 i0Pdlk55ha2tOAqBSyHP7BTlzKecmx17yxK6nxpZIlCDt/vjET42y4P5Uc92Jp+Sd5
	 Jw60Le+WzOEbw==
Received: by wens.tw (Postfix, from userid 1000)
	id 55D7060003; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Mon,  2 Mar 2026 23:27:21 +0800
Message-ID: <20260302152724.3197587-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072738_826032_6E7C1787 
X-CRM114-Status: GOOD (  11.59  )
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

The A523 SoC family features an LED controller that is identical to the
one found on previous SoCs.

Add a device node for it, and one of the possible pinmux settings. This
setting is used on the Avaota A1.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 9335977751e2..92aecb90d4e1 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -153,6 +153,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ledc_ph_pin: ledc-ph-pin {
+				pins = "PH19";
+				function = "ledc";
+				allwinner,pinmux = <5>;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -283,6 +290,21 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ledc: led-controller@2008000 {
+			compatible = "allwinner,sun55i-a523-ledc",
+				     "allwinner,sun50i-a100-ledc";
+			reg = <0x02008000 0x400>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_LEDC>;
+			dmas = <&dma 42>;
+			dma-names = "tx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
-- 
2.47.3


