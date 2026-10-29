Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7628606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=btMb0r+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xCaU8OgKweL0hH8jd16muVJhjSF82fs6FeZyCWrYC5o=; b=btMb0r+pxeGKPp
	AFhtdhmBKVWOa4LpO1fAw0ql7XceL2GeXeduqbpDnr6RThzH5rGnpd4IeOFb/aTsvhutS7ip8efxg
	L89GM26Tr6Sf+eXgGSElFJkcFN02KdsNADwdFKA2KUaLxY31D216lpmXk3gBThbvNHDoI0qPGOZhE
	W4yKd/ue6ekVxkzlS6rr4HjnN7rIz1sXm1zhjjtxDG7hcJtD+pfo8dBRJaJkanUDF4f9Z6QU6w0+h
	4MNo8xoEvPE6UU+SpryU698ya1up5OdZEStLhbd87uYGuv5B7pFKmAt/SuyZC5lNugZ9kP3Xw6MXq
	znW1gzclKluUtQZhA2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPv2-00000009IR4-1dF7;
	Thu, 29 Oct 2026 13:11:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPuy-00000009IOB-2yyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75CA3419E7;
	Thu, 29 Oct 2026 13:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26AD1F031E1;
	Thu, 29 Oct 2026 13:11:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/9] arm64: dts: renesas: r8a78000: Add CAN-FD nodes
Date: Thu, 29 Oct 2026 14:11:07 +0100
Message-ID: <258c1bf126f5f350dcb998b8392b74f7aa642864.1793278754.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793278754.git.geert+renesas@glider.be>
References: <cover.1793278754.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device nodes for the two Controller Area Network Flexible Data Rate
(CAN-FD) interfaces and the related external CAN clock on the Renesas
R-Car X5H (R8A78000) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
RFC, as the DT bindings update is marked RFC.
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 235 ++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index c5e48eac4c3712d8..437e49c58ff299a0 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -15,6 +15,13 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -1783,6 +1790,234 @@ mdlc_vips: system-controller@c3460000 {
 			bootph-all;
 		};
 
+		canfd0: can@c1420000 {
+			compatible = "renesas,r8a78000-canfd",
+				     "renesas,rcar-gen5-canfd";
+			reg = <0 0xc1420000 0 0x8500>;
+			interrupts = <GIC_ESPI 610 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 611 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 612 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 613 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 615 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 616 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 617 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 618 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 619 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 620 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 621 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 623 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 624 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 625 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 626 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 627 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 628 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 629 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 630 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 631 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 632 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 633 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 634 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 635 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 636 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 637 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 638 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 639 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 640 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 641 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 642 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 643 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 644 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 645 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 646 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 647 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 648 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 649 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 650 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 651 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 652 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 653 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 655 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 657 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 658 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 659 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx",
+					  "ch3_err", "ch3_rec", "ch3_trx",
+					  "ch4_err", "ch4_rec", "ch4_trx",
+					  "ch5_err", "ch5_rec", "ch5_trx",
+					  "ch6_err", "ch6_rec", "ch6_trx",
+					  "ch7_err", "ch7_rec", "ch7_trx",
+					  "vm0_tx", "vm0_rx", "vm0_err",
+					  "vm1_tx", "vm1_rx", "vm1_err",
+					  "vm2_tx", "vm2_rx", "vm2_err",
+					  "vm3_tx", "vm3_rx", "vm3_err",
+					  "vm4_tx", "vm4_rx", "vm4_err",
+					  "vm5_tx", "vm5_rx", "vm5_err",
+					  "vm6_tx", "vm6_rx", "vm6_err",
+					  "vm7_tx", "vm7_rx", "vm7_err";
+			clocks = <&cpg R8A78000_CPG_SCPBUSD4_SCP_MAIN>,
+				 <&cpg R8A78000_CPG_CANFD_SCP_MAIN>,
+				 <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg R8A78000_CPG_CANFD_SCP_MAIN>;
+			assigned-clock-rates = <80000000>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x72>;
+			resets = <&mdlc_scp 0x72>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+
+			channel1 {
+				status = "disabled";
+			};
+
+			channel2 {
+				status = "disabled";
+			};
+
+			channel3 {
+				status = "disabled";
+			};
+
+			channel4 {
+				status = "disabled";
+			};
+
+			channel5 {
+				status = "disabled";
+			};
+
+			channel6 {
+				status = "disabled";
+			};
+
+			channel7 {
+				status = "disabled";
+			};
+		};
+
+		canfd1: can@c1520000 {
+			compatible = "renesas,r8a78000-canfd",
+				     "renesas,rcar-gen5-canfd";
+			reg = <0 0xc1520000 0 0x8500>;
+			interrupts = <GIC_ESPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 663 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 671 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 672 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 675 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 676 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 677 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 691 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 696 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 697 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 698 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 699 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 700 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 706 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 708 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 709 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx",
+					  "ch2_err", "ch2_rec", "ch2_trx",
+					  "ch3_err", "ch3_rec", "ch3_trx",
+					  "ch4_err", "ch4_rec", "ch4_trx",
+					  "ch5_err", "ch5_rec", "ch5_trx",
+					  "ch6_err", "ch6_rec", "ch6_trx",
+					  "ch7_err", "ch7_rec", "ch7_trx",
+					  "vm0_tx", "vm0_rx", "vm0_err",
+					  "vm1_tx", "vm1_rx", "vm1_err",
+					  "vm2_tx", "vm2_rx", "vm2_err",
+					  "vm3_tx", "vm3_rx", "vm3_err",
+					  "vm4_tx", "vm4_rx", "vm4_err",
+					  "vm5_tx", "vm5_rx", "vm5_err",
+					  "vm6_tx", "vm6_rx", "vm6_err",
+					  "vm7_tx", "vm7_rx", "vm7_err";
+			clocks = <&cpg R8A78000_CPG_SCPBUSD4_SCP_MAIN>,
+				 <&cpg R8A78000_CPG_CANFD_SCP_MAIN>,
+				 <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg R8A78000_CPG_CANFD_SCP_MAIN>;
+			assigned-clock-rates = <80000000>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x73>;
+			resets = <&mdlc_scp 0x73>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+
+			channel1 {
+				status = "disabled";
+			};
+
+			channel2 {
+				status = "disabled";
+			};
+
+			channel3 {
+				status = "disabled";
+			};
+
+			channel4 {
+				status = "disabled";
+			};
+
+			channel5 {
+				status = "disabled";
+			};
+
+			channel6 {
+				status = "disabled";
+			};
+
+			channel7 {
+				status = "disabled";
+			};
+		};
+
 		msiof0: spi@c1700000 {
 			compatible = "renesas,msiof-r8a78000",
 				     "renesas,rcar-gen5-msiof";
-- 
2.43.0


