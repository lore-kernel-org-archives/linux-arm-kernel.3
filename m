Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6CCC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDPTyS2taUxoshK2pR+oXYwMAafTxG8wA7i2/X/wOXA=; b=yD+vGLt2JVHC16gtrSw+KPMqu0
	Y34b721WZpJsl0oM8XwHlBu2r8VxgcDa09MNrWTWYRnbUZ1aHoFO+dJVFlBEbAntnP+taS8Ai3N9X
	YLnniMwwpC4QdHAYvz+XwiMaogx431v4/AGSLUF7qxyZmU2T+UybmafcYPG3cwNNwMtcv2TueMoWx
	jhL2qp5Fy4b68QMJUEwKtwELnto70vMoYMUX1PHTvV2oGdggJ1MHkRo35mZJBO1UoBBXk5URQcINX
	ITR0VYF7VUtBTSpq7OCAhsTBCxaHmPn/e7iDOgCkTjQUzYnGETulEc4uT6rqe073l+paqhlOzZb9/
	rgl+O0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv2P-00000005fvJ-1ReR;
	Fri, 28 Aug 2026 11:46:25 +0000
Received: from out-88.mta0.migadu.com ([2001:41d0:1004:224b::58] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzv27-00000005fjC-0Ohv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 11:46:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GZ6xCYTSi9co+IIKhthafL94am9XVPBEdirIBtSwOT0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917565; v=1; x=1788522365;
 b=QEQQdNdXFBQOheJ1lHP0l3fnpUJyNtKD8mlySnnJaFYxYELojmjqEpFaxy6Q/Dvu5YAbc9Lk
 /kyQdPTGJE0dsBeM2gqjFpTpEoH+1lw2nILKnTzFhY9vE/llLwRzClc5Klw3GT7/leXgAmUP4nT
 yt9OwS96Cd9bYejADjSxHs04OqblwMzPkHilvN4N3W1DKellj0EyxFG4Car5JnZoO8YfxuPUIpJ
 FBVIFGyMeZg+pt0pEOYeuUzHuuQGBm/KY9C18gICTHZARWXX1LpBVBNzbNV8bvcNIXTIqGdB0dQ
 FnlznTKtQY2gCVj0sli4Khbnmoktv5buHB2Nwp7hc0xeA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8da0395c564e6944;
	Fri, 28 Aug 2026 11:46:04 +0000
X-Mizu-Trace-ID: 8da0395c564e6944
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 6/7] arm64: dts: rockchip: Improve sound config on NanoPC-T6
Date: Fri, 28 Aug 2026 13:43:06 +0200
Message-ID: <20260828114530.1315798-7-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_044607_274131_19B99A6B 
X-CRM114-Status: GOOD (  12.69  )
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

The kernel can manage the I2S MCLK output gates since commit
02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
So switch to I2S0_8CH_MCLKOUT_TO_IO to do exactly that.

The audio ports are used in audio-graph-card, but simple-audio-card uses
sound-dai phandles to establish the DAI links. So drop the pointless ports.

Add a label to the soundcard to be used by tools like alsamixer.

Sort the various properties according to the DTS coding standard.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index e42b2a14fc82..eb0eb124c4cd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -100,14 +100,14 @@ fan: pwm-fan {
 
 	sound {
 		compatible = "simple-audio-card";
-		pinctrl-names = "default";
+		label = "Onboard Analog Realtek ALC5616";
 		pinctrl-0 = <&hp_det>;
+		pinctrl-names = "default";
 
-		simple-audio-card,name = "realtek,rt5616-codec";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,mclk-fs = <256>;
-
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "realtek,rt5616-codec";
 
 		simple-audio-card,widgets =
 			"Headphone", "Headphones",
@@ -121,6 +121,7 @@ sound {
 		simple-audio-card,cpu {
 			sound-dai = <&i2s0_8ch>;
 		};
+
 		simple-audio-card,codec {
 			sound-dai = <&rt5616>;
 		};
@@ -551,17 +552,11 @@ &i2c7 {
 	rt5616: codec@1b {
 		compatible = "realtek,rt5616";
 		reg = <0x1b>;
-		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
 		clock-names = "mclk";
 		#sound-dai-cells = <0>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-
-		port {
-			rt5616_p0_0: endpoint {
-				remote-endpoint = <&i2s0_8ch_p0_0>;
-			};
-		};
 	};
 
 	/* connected with MIPI-CSI1 */
@@ -573,21 +568,9 @@ &i2c8 {
 };
 
 &i2s0_8ch {
+	pinctrl-0 = <&i2s0_lrck &i2s0_mclk &i2s0_sclk &i2s0_sdi0 &i2s0_sdo0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_lrck
-		     &i2s0_mclk
-		     &i2s0_sclk
-		     &i2s0_sdi0
-		     &i2s0_sdo0>;
 	status = "okay";
-
-	i2s0_8ch_p0: port {
-		i2s0_8ch_p0_0: endpoint {
-			dai-format = "i2s";
-			mclk-fs = <256>;
-			remote-endpoint = <&rt5616_p0_0>;
-		};
-	};
 };
 
 &i2s5_8ch {
-- 
2.55.0


