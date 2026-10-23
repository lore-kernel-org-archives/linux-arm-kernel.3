Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C676606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFfTKPxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1muTcKBLuC7q1JD0nNZzHZd+pNV0OB32RDBryHwu9Mc=; b=gFfTKPxnxVilhI
	Tc4/BfImLcl1iwvAShnbtT0rAFh8UTEOrK0he+tp5jIezxNoUvu6lwLkZyR+gjcvTjpxtCNb6+yCz
	Jrmc8PXAKxYxuvj8et+xWed+MwI5B6ET9Toyp79uRJ5Q5rz8BmcCbHcuoND9eSf/Q1gsmRc84gThh
	yvkPTcuI4EiEveWzWvffoBE/edOPzhkpLGA0S7ktlCG/5c0/kOSiduh9A8mh8Uha0xbm5vNilHBOP
	A//neGi7D0v/MuXHz3dx+rpWKJGJJYvkq6oFC0xdrmUEQ3M3QBxEhNbw3m4YG2eQZJ6ocUOY70xav
	/STkXq2LZObOaZRx+PsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJSf-0000000GlC1-3vaA;
	Fri, 23 Oct 2026 17:53:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJSe-0000000GlBW-1EtW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:53:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1185343B35;
	Fri, 23 Oct 2026 17:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6461F031E0;
	Fri, 23 Oct 2026 17:53:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
Date: Fri, 23 Oct 2026 19:50:41 +0200
Message-ID: <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
the Renesas R-Car X5H (R8A78000) SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to Marek's original:
  - Use hardware clocks/power-domains/resets instead of direct SCMI
    references,
  - Drop gpio-ranges properties for now, as upstream lacks Pin Function
    Controller (PFC) support.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 155 ++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 66eec0907b34fa58..36a4fa1e032ee703 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -1263,6 +1263,161 @@ pfc: pinctrl@c1080000 {
 			bootph-all;
 		};
 
+		gpio0: gpio@c1080110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc1080110 0 0xc0>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SCPBUSD16_SCP_MAIN>;
+			power-domains = <&mdlc_aon R8A78000_MDLC_PD_AON 0x20>;
+			resets = <&mdlc_aon 0x20>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio1: gpio@c1080910 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc1080910 0 0xc0>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SCPBUSD16_SCP_MAIN>;
+			power-domains = <&mdlc_aon R8A78000_MDLC_PD_AON 0x20>;
+			resets = <&mdlc_aon 0x20>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio2: gpio@c1081110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc1081110 0 0xc0>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SCPBUSD16_SCP_MAIN>;
+			power-domains = <&mdlc_aon R8A78000_MDLC_PD_AON 0x20>;
+			resets = <&mdlc_aon 0x20>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio3: gpio@c0800110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0800110 0 0xc0>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_S0D24_PERE_MAIN>;
+			power-domains = <&mdlc_pere R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_pere 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio4: gpio@c0800910 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0800910 0 0xc0>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_S0D24_PERE_MAIN>;
+			power-domains = <&mdlc_pere R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_pere 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio5: gpio@c0400110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0400110 0 0xc0>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SGD32_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_perw 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio6: gpio@c0400910 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0400910 0 0xc0>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SGD32_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_perw 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio7: gpio@c0401110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0401110 0 0xc0>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SGD32_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_perw 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio8: gpio@c0401910 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc0401910 0 0xc0>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SGD32_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x30>;
+			resets = <&mdlc_perw 0x30>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-reserved-ranges = <16 10>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio9: gpio@c9b00110 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc9b00110 0 0xc0>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_S0D24_HSCN_OTHER>;
+			power-domains = <&mdlc_hscn R8A78000_MDLC_PD_APL 0x50>;
+			resets = <&mdlc_hscn 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
+		gpio10: gpio@c9b00910 {
+			compatible = "renesas,gpio-r8a78000",
+				     "renesas,rcar-gen5-gpio";
+			reg = <0 0xc9b00910 0 0xc0>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_S0D24_HSCN_OTHER>;
+			power-domains = <&mdlc_hscn R8A78000_MDLC_PD_APL 0x50>;
+			resets = <&mdlc_hscn 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+		};
+
 		cpg: clock-controller@c1320000 {
 			compatible = "renesas,r8a78000-cpg";
 			reg = <0 0xc1320000 0 0x10000>;
-- 
2.43.0


