Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D6FC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPrdgQOQrocNPqIgoaueLRdVVKBCes/xeIpXjvkXuhc=; b=d8rOj5XItiooHq5J7f9kd88OR8
	uMLz+9zC7FYOBnDyJ2+Oj0Xem/e/yofXjOr5mMZOrhVLbDO6tMhyn/CEyIrGFyKxDHkMKzb4dDEUP
	AWli7v4R0lmD4PnRGcey/rijGbxLIcWWWw0XNjyOVbMSJSQueCdSxYcyugN+nuUANNHzPdr4Iwd7+
	d+K657tqgKtNpAgAXQlwP20D7KXinA2kPVTu4c/zJpY4WPfL73nvub1wEhC39Sb/81VAVceE4WoKJ
	t3ZUIeoe6uoUIvM1Ed8GrMv2LCn+yQ/+v3ardgmy0YdcjYLQgASi56wGMTQvfQi2c7RKQ+rLpFHsp
	PsqdfkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDvh-00000007KBZ-1Mk5;
	Sun, 25 May 2025 16:10:29 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJDqy-00000007Jah-1g3R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 16:05:37 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4b53dl5rMpz9sqW;
	Sun, 25 May 2025 18:05:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPrdgQOQrocNPqIgoaueLRdVVKBCes/xeIpXjvkXuhc=;
	b=BmXD2/TlTrswtNrSSbEjZSM22TH+Af/Sni5ioUWF9cYBOyuA3DQbMj6heMDZUh/rXT0sX9
	ykBkUuxrPRJ0Vns9k8hkKdu8Vh40Pq8lboxGnxpXM7fBwFItjf4FxOEHT5v911apEXJkXb
	98zgY05lrhfw+7GJ+MSqZn8V9H9yn5Ej+m0aqh9LOhLf8pKPoT6FhYP6wX9TyrUX4xRT/+
	vWMog5Rw8t3hTcUI5I/7YKVhburOdBGz3XrYdt4TY98ZE4nvZPMqrN1D74VY/jYFxweSSx
	EMhbjjbDPaZZFhJPA5KJAjU0niLhnDDBp0VdMnz1hg8jmiljmBrqCdEALoxFrA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748189129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPrdgQOQrocNPqIgoaueLRdVVKBCes/xeIpXjvkXuhc=;
	b=rjeVGvDpyHT27GD+9uawz1PbV+yxyedwQSN1G1ExQUssRW0nFvDG4sFPt29uM7vF7mFspQ
	1tk++sfJqd/OiwFrvYQ5XGnHfzaUQXw/EsMcW5Y8MmjOZXuljMwM3ZQdWz2YUNbwq/gS6M
	le9W7KviLJIGjMf/vYMxIZGqhkngR1iQvpQTyaFv/jQ4gfonx+/fB30BNVdkJJKVEUy0wn
	1waHbEDSUB8uR9h7KJlkwBgdi6t8XrDpY/yRLQozGrQEN9R4cYQ1skoeLCPgJykhnR18S0
	J197wzyCyoqT7GclWmbSy3+X/6mrCkxrUl4Sr+waWeW8IjnfAa1ItUQ1rDJERg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g3: Describe split PCIe clock on V4H Sparrow Hawk
Date: Sun, 25 May 2025 18:04:04 +0200
Message-ID: <20250525160513.83029-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
References: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b44ts3qhxxkcs5eeid4n9o3pp136tqx4
X-MBO-RS-ID: b718b974327949ec1da
X-Rspamd-Queue-Id: 4b53dl5rMpz9sqW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_090536_581230_BA03CC57 
X-CRM114-Status: GOOD (  11.28  )
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

The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
Describe this split bus configuration in the board DT. The topology looks
as follows:

 ____________                    _____________
| R-Car PCIe |                  | PCIe device |
|            |                  |             |
|    PCIe RX<|==================|>PCIe TX     |
|    PCIe TX<|==================|>PCIe RX     |
|            |                  |             |
|   PCIe CLK<|======..  ..======|>PCIe CLK    |
'------------'      ||  ||      '-------------'
                    ||  ||
 ____________       ||  ||
|  9FGV0441  |      ||  ||
|            |      ||  ||
|   CLK DIF0<|======''  ||
|   CLK DIF1<|==========''
|   CLK DIF2<|
|   CLK DIF3<|
'------------'

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index b8698e07add56..7c050a56290fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -130,6 +130,13 @@ mini_dp_con_in: endpoint {
 		};
 	};
 
+	/* Page 26 / PCIe.0/1 CLK */
+	pcie_refclk: clk-x8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	reg_1p2v: regulator-1p2v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.2V";
@@ -404,6 +411,14 @@ i2c0_mux2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			/* Page 26 / PCIe.0/1 CLK */
+			pcie_clk: clk@68 {
+				compatible = "renesas,9fgv0441";
+				reg = <0x68>;
+				clocks = <&pcie_refclk>;
+				#clock-cells = <1>;
+			};
 		};
 
 		i2c0_mux3: i2c@3 {
@@ -487,24 +502,50 @@ msiof1_snd_endpoint: endpoint {
 
 /* Page 26 / 2230 Key M M.2 */
 &pcie0_clkref {
-	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>;
 	reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	/* PCIe bridge, Root Port */
+	pci@0,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		compatible = "pciclass,0604";
+		device_type = "pci";
+		clocks = <&pcie_clk 1>;
+		vpcie3v3-supply = <&reg_3p3v>;
+		ranges;
+	};
 };
 
 /* Page 25 / PCIe to USB */
 &pcie1_clkref {
-	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec1 {
+	clocks = <&cpg CPG_MOD 625>, <&pcie_clk 2>;
 	/* uPD720201 is PCIe Gen2 x1 device */
 	num-lanes = <1>;
 	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	/* PCIe bridge, Root Port */
+	pci@0,0 {
+		#address-cells = <3>;
+		#size-cells = <2>;
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		compatible = "pciclass,0604";
+		device_type = "pci";
+		clocks = <&pcie_clk 3>;
+		vpcie3v3-supply = <&reg_3p3v>;
+		ranges;
+	};
 };
 
 &pfc {
-- 
2.47.2


