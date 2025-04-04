Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E4C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw5NDFxa2i3TVHkjbbQb0GgVP+tveEJj+S2xDWICGo0=; b=saZWe4F0Yg72zWYmxJsf45aYia
	DF5Ck1GWjTQCoQF7P+1iec7oM6H6sdVywEYhxp2WGlSEzV1Dio0fVBEeFVbP+uL8E905g/S94wcZu
	lgSBx4cLO3tpL09ote9gSZ6UZDovEfQ5WPPUK7Is4qvBLusO6uHqopFnU9jEEfLuB94bOV6692a1r
	O2rFPRS4pn+XfVJ2WOCWXn1V4zPiTlux4EpWHdM/NMnbFRNdSW1r5HX016kdARW2Yrp2MBL06FO0D
	kO1Fw1F5lbgaCUiObo0OxzQEpUkCS5JphGlqbqJXU1DmpP9b9S+4uNedfpk//HjPuvGkAiqi8gsvQ
	Ela9hdbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XXW-0000000AfjA-2coh;
	Fri, 04 Apr 2025 03:16:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHd-0000000Acxt-3EYA;
	Fri, 04 Apr 2025 02:59:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1017FA42648;
	Fri,  4 Apr 2025 02:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE6DC4CEE7;
	Fri,  4 Apr 2025 02:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735592;
	bh=NXfOJoK0Dz0mef/BAq7y8KxDDG3duFbiuiL1Z6QJ9BI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sGzlfMKi1upb46KlxcbmpIatBcJlDA+lJRioYblOpv5TuMcIgUURlrFv/QVkqvcTU
	 cqjZ3jite7u9/lrkFPtYLaZQU+UPcpDjuKKwQKVdaz05Zt2Wg2bX8aD21CBMmgztP/
	 597TFjZnnA5cS1HbMOvLF6ZZO6RT4hAa1J+fA2rlUycXmgZf53mYjv6qE+Elqb9F7E
	 V6LVIXszs4tasfp/HFFOFuNBTRwJoQvjb168YTZBNWldrVQST227wqM+8fQaQlV3RP
	 O1V2tZKhlzmE6O5RVW6E9/CixcMg8/3k12lNJLB9F/Ieoqt9oPG0IvqU/qqu+JWsS6
	 zwQKoFaWCIVXQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:29 -0500
Subject: [PATCH 08/19] arm: dts: qcom: msm8916: Move "qcom,acc" and
 "qcom,saw" to 32-bit .dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-8-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195953_955588_8A67D189 
X-CRM114-Status: GOOD (  12.05  )
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

The "qcom,acc" and "qcom,saw" properties are only used with 32-bit
kernels. Of course, booting a 64-bit or 32-bit kernel shouldn't matter
to the DTS, but the "enable-method" is already different for 32-bit.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi        | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
index 94b7694eeeff..594cc4a3a78b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi
@@ -4,15 +4,23 @@ / {
 	cpus {
 		cpu@0 {
 			enable-method = "qcom,msm8916-smp";
+			qcom,acc = <&cpu0_acc>;
+			qcom,saw = <&cpu0_saw>;
 		};
 		cpu@1 {
 			enable-method = "qcom,msm8916-smp";
+			qcom,acc = <&cpu1_acc>;
+			qcom,saw = <&cpu1_saw>;
 		};
 		cpu@2 {
 			enable-method = "qcom,msm8916-smp";
+			qcom,acc = <&cpu2_acc>;
+			qcom,saw = <&cpu2_saw>;
 		};
 		cpu@3 {
 			enable-method = "qcom,msm8916-smp";
+			qcom,acc = <&cpu3_acc>;
+			qcom,saw = <&cpu3_saw>;
 		};
 
 		idle-states {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8f35c9af1878..88e452752de6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -144,8 +144,6 @@ cpu0: cpu@0 {
 			#cooling-cells = <2>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
-			qcom,acc = <&cpu0_acc>;
-			qcom,saw = <&cpu0_saw>;
 		};
 
 		cpu1: cpu@1 {
@@ -159,8 +157,6 @@ cpu1: cpu@1 {
 			#cooling-cells = <2>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
-			qcom,acc = <&cpu1_acc>;
-			qcom,saw = <&cpu1_saw>;
 		};
 
 		cpu2: cpu@2 {
@@ -174,8 +170,6 @@ cpu2: cpu@2 {
 			#cooling-cells = <2>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
-			qcom,acc = <&cpu2_acc>;
-			qcom,saw = <&cpu2_saw>;
 		};
 
 		cpu3: cpu@3 {
@@ -189,8 +183,6 @@ cpu3: cpu@3 {
 			#cooling-cells = <2>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
-			qcom,acc = <&cpu3_acc>;
-			qcom,saw = <&cpu3_saw>;
 		};
 
 		l2_0: l2-cache {

-- 
2.47.2


