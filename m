Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55377606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ej9OMxrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6j5fPmNl4JXPUL19Fwb3C5vWLLpOlOJYPelcoa3tW+0=; b=ej9OMxrcSLLC+3
	p33GilSKFdBqeP9iJK2R0f+iNvtNlNMBOtHullDrXr1i+6Zi6hoAmLlEBggcvbwv6MWskFIOdxAZP
	xNk+fqUOCgreehYFHxi9BFgG4r9hRd4FZ7q6+b7oseImBhHpcxq9e3z9qZapbVW2+blldQ8/rU0XY
	vPguZpZ4UE8wDEGTqWAGrEWtPRQQKwqAq3S2XQwG43YSepmjjqIMnx3RemStlpkTmzQvWD2J5sTOL
	7xIQvBNd7aKm42uaBl3uHe8PYGvhZtDzx9SKq85qR8JGUBFm910SpJQ3nriXRCOrkD2LkkSDCyFLJ
	ziXnwkARqAlhiNdIoPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7Y-00000002iXd-35ER;
	Mon, 26 Oct 2026 14:56:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7M-00000002iO6-2iXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:56:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 699194349C;
	Mon, 26 Oct 2026 14:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A231F01829;
	Mon, 26 Oct 2026 14:56:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/11] arm64: dts: renesas: r8a78000: Add PWM nodes
Date: Mon, 26 Oct 2026 15:55:24 +0100
Message-ID: <8912d1d4e99b95fc7e9f0d1cf3c596689c470e09.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
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

Add device nodes for the Pulse Width Modulation (PWM) modules and the
16-Bit Timer Pulse Unit (TPU) on the Renesas R-Car X5H (R8A78000) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 121 ++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 946dce6ab38b619d..c5e48eac4c3712d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -1243,6 +1243,127 @@ hscif3: serial@c071c000 {
 			status = "disabled";
 		};
 
+		tpu: pwm@c0720000 {
+			compatible = "renesas,tpu-r8a78000", "renesas,tpu";
+			reg = <0 0xc0720000 0 0x200>;
+			interrupts = <GIC_ESPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x76>;
+			resets = <&mdlc_perw 0x76>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm0: pwm@c0740000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0740000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@c0741000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0741000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@c0742000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0742000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@c0743000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0743000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_SGASYNCD16_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@c0780000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0780000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@c0781000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0781000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@c0782000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0782000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@c0783000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0783000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@c0784000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0784000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@c0785000 {
+			compatible = "renesas,pwm-r8a78000",
+				     "renesas,rcar-gen5-pwm";
+			reg = <0 0xc0785000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg R8A78000_CPG_S0ASYNCD8_PERW_MAIN>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x70>;
+			resets = <&mdlc_perw 0x70>;
+			status = "disabled";
+		};
+
 		stcm_transport: sram@c1060000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0xc1060000 0x0 0x1c00>;
-- 
2.43.0


