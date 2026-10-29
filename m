Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFBA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0ncAvh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5pCrvx2wO9rxz/SVIPupq/LgqP91MpNSt9foXvKiLGM=; b=v0ncAvh7tJr/GC
	CHb0UjCI7Fj+xPSxqtC2I/Kn1DH2Z5BH4Y2ZSXwqNMGYLOinbfQBPkBiBaz1eh+/00MFG5cem0aW/
	G0IMywrtk6rQetzSlIUKzO8srVQ8Cy8y304IMAaQdq8FJDH3NXyEkSebwXuQP8oWmWpUl7+9PxRhn
	ZpcTxE/zEJFJpE7g3X7ntBOP2bTH1c7eMDbcUWxy6KPUnCqjtXlQk6gD492ERuY9U1cDqz12Kof93
	XEtW8tv6CNQGyi1iNT0EizVIrFcpJYYJLS//rk7okzqBYBHoP35wt7yutPYglqyP/cXKjoUsIZEH5
	sARYfL+1u521BFAsyjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPvK-00000009IkZ-3Tek;
	Thu, 29 Oct 2026 13:12:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPvA-00000009IaZ-3XAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9758342E8E;
	Thu, 29 Oct 2026 13:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1531F031E1;
	Thu, 29 Oct 2026 13:11:52 +0000 (UTC)
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
Subject: [PATCH/DNI 9/9] arm64: dts: renesas: ironhide: Enable CAN-FD
Date: Thu, 29 Oct 2026 14:11:10 +0100
Message-ID: <66a35ed04f5d3f14a4bc60b4646917e1dc25b2f6.1793278754.git.geert+renesas@glider.be>
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

CAN-FD channels 1 to 6 and 12 to 15 are wired to CAN connectors CN7B to
CN12, CN18, CN19, and CN55 to CN58.

Channel 0 on CAN connector CN7A is not added, as its transceiver is
controlled by the System Control Processor (SCP).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on out-of-tree pin control support.
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 117 +++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index c2d814da9fd97802..63dd4fa2d737a729 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -171,6 +171,66 @@ ecc@1ecccc0000 {
 	};
 };
 
+&can_clk {
+	clock-frequency = <40000000>;
+};
+
+&canfd0 {
+	pinctrl-0 = <&canfd1_pins>,  <&canfd2_pins>, <&canfd3_pins>,
+		    <&canfd4_pins>, <&canfd5_pins>, <&canfd6_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	channel1 {
+		status = "okay";
+	};
+
+	channel2 {
+		status = "okay";
+	};
+
+	channel3 {
+		status = "okay";
+	};
+
+	channel4 {
+		status = "okay";
+	};
+
+	channel5 {
+		status = "okay";
+	};
+
+	channel6 {
+		status = "okay";
+	};
+};
+
+&canfd1 {
+	pinctrl-0 = <&canfd12_pins>, <&canfd13_pins>,  <&canfd14_pins>,
+		    <&canfd15_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	channel4 {
+		status = "okay";
+	};
+
+	channel5 {
+		status = "okay";
+	};
+
+	channel6 {
+		status = "okay";
+	};
+
+	channel7 {
+		status = "okay";
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666600>;
 };
@@ -214,9 +274,64 @@ &msiof6 {
 };
 
 &pfc {
-	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-0 = <&can_clk_pins>, <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	can_clk_pins: can-clk {
+		groups = "can_clk";
+		function = "can_clk";
+	};
+
+	canfd1_pins: canfd1 {
+		groups = "canfd1_data";
+		function = "canfd1";
+	};
+
+	canfd2_pins: canfd2 {
+		groups = "canfd2_data";
+		function = "canfd2";
+	};
+
+	canfd3_pins: canfd3 {
+		groups = "canfd3_data";
+		function = "canfd3";
+	};
+
+	canfd4_pins: canfd4 {
+		groups = "canfd4_data";
+		function = "canfd4";
+	};
+
+	canfd5_pins: canfd5 {
+		groups = "canfd5_data";
+		function = "canfd5";
+	};
+
+	canfd6_pins: canfd6 {
+		groups = "canfd6_data";
+		function = "canfd6";
+	};
+
+	canfd12_pins: canfd12 {
+		groups = "canfd12_data_b";
+		function = "canfd12";
+	};
+
+	canfd13_pins: canfd13 {
+		groups = "canfd13_data_b";
+		function = "canfd13";
+	};
+
+	canfd14_pins: canfd14 {
+		groups = "canfd14_data_b";
+		function = "canfd14";
+	};
+
+	canfd15_pins: canfd15 {
+		groups = "canfd15_data_b";
+		function = "canfd15";
+	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
-- 
2.43.0


