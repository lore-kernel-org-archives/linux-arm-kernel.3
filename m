Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96A2EEE25C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNebvpYzUNK1d9hMY00eovKv3pm6J0VQLBTkOK+0hEw=; b=NRw5UYeTA/gY5BDe4uKYvZKX31
	yWLM2L5zjD92KpPRF4l+x1+pd7QRp0DfUHalFb10gFQ2Hk9rLtbnKeNyeI97PbgBWFViHvbNVl5yV
	My8CImNUci0J8RVQk6ndBGhdRKuHvdDg6xWfi+TXctovQUAaMqGQvBvyciHGwgB7TtyfGl2LGpRC6
	QvZHg7Ku87PPcVSLwoLgjHou0oN7e00SAB4CuXi4NuvWykqAKMcaEMAZU2CmC6P+F2Fi13rYDkZmp
	HegHApLaY/kmwKb4C6aaWElpRfRoY1gYfbdljlQGKLxA3eHsd6y1k7Z74MwfGwi9VzBr1Y9Mha61r
	iA2/HC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTW-00000007UbN-1cue;
	Thu, 01 Jan 2026 20:40:50 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTF-00000007UMU-3AlR;
	Thu, 01 Jan 2026 20:40:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dhzH36x2Nz9tB8;
	Thu,  1 Jan 2026 21:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNebvpYzUNK1d9hMY00eovKv3pm6J0VQLBTkOK+0hEw=;
	b=Z+Myj7h94vGM8ycL8oTYtZcre5AwpFFRUaDb3EVFJwbuhE9MEZ8/51o6BEPSyGD9SHNJBV
	TLPMo8SuYa/Szbqi2pynkjcDNSqBRMhBzjvVwxIiqy/gj4M62bfa3L5vDN/+2dtIQ7Xjk9
	fqIy23CRPRvco3qtcW0Vxtd4dq54OibzMR29vnCEjbSTTcTU9lmhXTr9ZWdQPewyff8yk2
	Z9McwUG9SooJnPgbABBUiG7HQ1c8WEZdZQyz/j5uEQFwcthp5G9hYutzHBgTtAdAychSDV
	uirATaa1Bn1uxG9HvN0YQ8YjMDcAxXs+MMWREsSxwm2zZioeHkhyZSBVI8RiPQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bar7Sw36;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNebvpYzUNK1d9hMY00eovKv3pm6J0VQLBTkOK+0hEw=;
	b=bar7Sw36H/mh9Xyi+FP60p1nk7H9Qo3S3rol31O1BHuDfnPlCyn5lXS8+JYxwo3f9J/ZW3
	fxsWOBDvHAgfIMPTlQMUyE/7aLJ/3/HVtSPD8orsWrYtCG7p26n60YtdlkJg6m4GGDnqoy
	XtJFhmc12gEagBBdHyRWpxA+gTL3M5hj699IglVRaZordYYYLRHU03APxVdL9/87RMKTdA
	xqDaUgiQZiInDr9s/b7IBpjhD4VV2oEj3/FSoQHb/lKdCvhXnxBr2mLKcQUzt5ex/ji+5+
	GU7kVzUznIhDyQgO/e8j+fE/hGE7aQgP32XrPgcUBXwjKOUPAVwY9r5t1DobVw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:57 +0100
Message-ID: <20260101203938.159161-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6a8126c908b296c5ca4
X-MBO-RS-META: bzs6yu93zf5sk7ccf8q3xeguxu86hz16
X-Rspamd-Queue-Id: 4dhzH36x2Nz9tB8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124033_962233_55D47C3D 
X-CRM114-Status: GOOD (  11.63  )
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

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
board. The clock generator supplies 100 MHz differential clock for both
PCIe ports, the USB 3.0 PHY and SATA.

SATA is not yet described in the ULCB DT, therefore the connection to
this clock generator is not described here either.

The H3 ULCB schematic does describe connection from output DIF7 to
USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
this connection is also not described.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi    | 13 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 2a157d1efb3d3..567d0f8467a78 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -352,19 +352,30 @@ &ohci0 {
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&pcie_usb_clk 1>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	clocks = <&pcie_usb_clk 3>;
+};
+
 &pciec1 {
+	clocks = <&cpg CPG_MOD 318>, <&pcie_usb_clk 2>;
 	status = "okay";
 
 	vpcie1v5-supply = <&pcie_1v5>;
 	vpcie3v3-supply = <&pcie_3v3>;
 };
 
+&pciec1_rp {
+	clocks = <&pcie_usb_clk 4>;
+};
+
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_a";
@@ -475,6 +486,16 @@ &usb2_phy0 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
+	status = "okay";
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+	status = "disabled";
+};
+
 &xhci0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a9e53b36f1d9c..c1bb80361db74 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -47,6 +47,12 @@ audio_clkout: audio-clkout {
 		clock-frequency = <12288000>;
 	};
 
+	pcie_usb_refclk: clk-x24 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	hdmi0-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -232,6 +238,13 @@ &i2c4 {
 
 	clock-frequency = <400000>;
 
+	pcie_usb_clk: clk@68 {
+		compatible = "renesas,9fgv0841";
+		reg = <0x68>;
+		clocks = <&pcie_usb_refclk>;
+		#clock-cells = <1>;
+	};
+
 	versaclock5: clock-generator@6a {
 		compatible = "idt,5p49v5925";
 		reg = <0x6a>;
-- 
2.51.0


