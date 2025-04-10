Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154ABC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xeDVzMbwT1AzSxcyS2wBwEBAg/IDdHx34CSwamru4U=; b=kgwhwK90yujLq9Le53cxM+2MY/
	b2NiGo/xfcrQkodV8O+lfm6TXN7qnL7FQQbzS9fR/wYZ8/DO/WQD3awEF2YMXlciO3TSu8+Yj7Ay5
	7Gj5GlrExH0Oiqx4UA4r+a5nvIBWkQp70POUZl4FCwbpaFWbaXyKisNfWGhVRS3q2Rwc/+aOJ5f5B
	dDDFov3hN8+YSRO2KxNj7ydZPYy62khdpZBuVxiGSsUrxZ4WgxrnLmYtFi+UYCp1Ot0qq+9+ibQp4
	Gw2ra2OYD7vqeSEJIv00rgHi+eaai0WF0p6JhWx3gSF3xkE77yAm7rp56bLVDrhUUb0fNMzqsXNHb
	jnYG627w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vCm-0000000BHfI-46cJ;
	Thu, 10 Apr 2025 16:56:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u89-0000000B50D-37Mt;
	Thu, 10 Apr 2025 15:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78E3F44362;
	Thu, 10 Apr 2025 15:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B12C4CEDD;
	Thu, 10 Apr 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300073;
	bh=ra1+/x5tvvdws+NLgU93cbl0GnrL59uh7spZ77Nu2f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=osXSzsJizztnuyucaAb6gJ3UnBpmWkaUistvD0lZeqHTGwkjWKi3KEbYTQc9vnNd8
	 sYwJPDNuPwtCN3FbYhNJzKOH8iR0FyZoK9WBBgXFt3JR+GViSj93+J7IKND0x4Nqx3
	 mteKEAyhxOqLlMAH+Bld4AJLE7kyo0qJreNViUmg0SphBF/SUah93W5gpNiwKwgnJZ
	 h8VkECzVm/u3cjOq1pgdbjQHY2CAAKM63iZNYoXv2C4afiK7sga5pqTFTt4hVSadce
	 Hn9ZuGY+KfW+EEWq/+17zPu4G+BWN7J8jRcwOdp4injNxLwJPJaVG76MQRoToHmJKa
	 BhezofOyJOZaQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:26 -0500
Subject: [PATCH v2 05/17] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-5-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084753_839628_BDAA1AC2 
X-CRM114-Status: UNSURE (   8.09  )
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

The "spin-table" enable-method requires "cpu-release-addr" property,
so add a dummy entry. It is assumed the bootloader will fill in the
correct values.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Keep qcom,saw and qcom,acc properties
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 7cd5660de1b3..72f01953e65c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -46,6 +46,7 @@ cpu0: cpu@100 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x100>;
 			next-level-cache = <&l2_1>;
 			qcom,acc = <&acc0>;
@@ -64,6 +65,7 @@ cpu1: cpu@101 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x101>;
 			next-level-cache = <&l2_1>;
 			qcom,acc = <&acc1>;
@@ -77,6 +79,7 @@ cpu2: cpu@102 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x102>;
 			next-level-cache = <&l2_1>;
 			qcom,acc = <&acc2>;
@@ -90,6 +93,7 @@ cpu3: cpu@103 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x103>;
 			next-level-cache = <&l2_1>;
 			qcom,acc = <&acc3>;
@@ -103,6 +107,7 @@ cpu4: cpu@0 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x0>;
 			qcom,acc = <&acc4>;
 			qcom,saw = <&saw4>;
@@ -121,6 +126,7 @@ cpu5: cpu@1 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x1>;
 			next-level-cache = <&l2_0>;
 			qcom,acc = <&acc5>;
@@ -134,6 +140,7 @@ cpu6: cpu@2 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x2>;
 			next-level-cache = <&l2_0>;
 			qcom,acc = <&acc6>;
@@ -147,6 +154,7 @@ cpu7: cpu@3 {
 			compatible = "arm,cortex-a53";
 			device_type = "cpu";
 			enable-method = "spin-table";
+			cpu-release-addr = /bits/ 64 <0>;
 			reg = <0x3>;
 			next-level-cache = <&l2_0>;
 			qcom,acc = <&acc7>;

-- 
2.47.2


