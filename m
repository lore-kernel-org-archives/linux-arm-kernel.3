Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3654CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eB/qpBvIcQf18JueWLvsI8rJu7S3pvMSLnsYJ9449OQ=; b=eBUz1Xxk7vNrTU6Rtwq865noRT
	q4f86I8ex/NWpv6jHXDFQYtEn70ZAVQLkNPEAp4LVxg9QUj4IbwuApbxYlsR0BwSCpbfnkj1WbQUo
	Sm9JgfLKalhyVDS/KqN71FFLeIb8jCtz2JCmS2CgzReyHXsrGu3E2Sy0buaqXcWgaJ2Q7BiNYw79u
	retGSbiJ8GGNtoZAxZnXzWZUaCw9jUPxA5iovpg9n2u1V2rxcqu4X+f4/m/UDrU6LSVVQWtZMxe5f
	zxoalPRtaZjORSvvJmIzRscnnjo/+MjtPBnsB+x+NMnb8pwPDkfsD2E/kKaEA7V4ue9/eJ+S8FUyp
	PQupWjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3n-00000009TVM-08Ev;
	Thu, 11 Jun 2026 13:03:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3k-00000009TTs-48yb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC44843B63;
	Thu, 11 Jun 2026 13:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178C01F00899;
	Thu, 11 Jun 2026 13:02:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 9/9] arm64: dts: renesas: ironhide: Switch to pure SCMI
Date: Thu, 11 Jun 2026 15:02:13 +0200
Message-ID: <0940352910d97e24410c5fffd815a8dded3db070.1781171706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Switch from CPG/MDLC remapping to pure SCMI:
  - Add SCMI IDs for selected devices, supporting SCP FW SDK v4.28,
    v4.31, and v4.32,
  - Enable SCMI clock domain support,
  - Replace clocks, power-domains, and resets properties by pure SCMI
    references.

Note that the user must uncomment the line that defines
R_CAR_X5H_SCP_FW_SDK_VERSION to the SCP FW SDK version being used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch is included as a PoC.
This fails to apply, as the SCMI protocol subnodes are not added in this
series.
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 00b5a010b7247722..f4093c359b21379e 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -9,6 +9,45 @@
 #include <dt-bindings/soc/renesas,r8a78000-mfis.h>
 #include "r8a78000.dtsi"
 
+#define V4_28	4028
+#define V4_31	4031	// Supports v4.31 and v4.32
+
+//#define R_CAR_X5H_SCP_FW_SDK_VERSION	V4_28
+#define R_CAR_X5H_SCP_FW_SDK_VERSION	V4_31
+
+#if R_CAR_X5H_SCP_FW_SDK_VERSION == V4_28
+
+#define CLK_SGD4_PERW_BUS	1661
+#define MDLC_HSCIF0		228
+#define MDLC_HSCIF1		229
+#define MDLC_SCIF0		209
+#define MDLC_SCIF1		210
+#define MDLC_UFS1		203
+#define RESET_HSCIF0		228
+#define RESET_HSCIF1		229
+#define RESET_SCIF0		209
+#define RESET_SCIF1		210
+#define RESET_UFS1		203
+
+#elif R_CAR_X5H_SCP_FW_SDK_VERSION == V4_31
+
+#define CLK_SGD4_PERW_BUS	1657
+#define MDLC_HSCIF0		224
+#define MDLC_HSCIF1		225
+#define MDLC_SCIF0		205
+#define MDLC_SCIF1		206
+#define MDLC_UFS1		199
+#define RESET_HSCIF0		224
+#define RESET_HSCIF1		225
+#define RESET_SCIF0		205
+#define RESET_SCIF1		206
+#define RESET_UFS1		199
+
+#endif
+
+#define PD_APL			257
+#define PD_UFS1			13
+
 / {
 	model = "Renesas Ironhide board based on r8a78000";
 	compatible = "renesas,ironhide", "renesas,r8a78000";
@@ -35,6 +74,7 @@ scmi: scmi {
 			scmi_devpd: protocol@11 {
 				reg = <0x11>;
 				#power-domain-cells = <1>;
+				arm,clock-domain = <&scmi_clk>;
 			};
 
 			scmi_sys: protocol@12 {
@@ -138,6 +178,10 @@ &extalr_clk {
 };
 
 &hscif0 {
+	clocks = <&scmi_clk MDLC_HSCIF0>, <&scmi_clk CLK_SGD4_PERW_BUS>,
+		 <&scif_clk>;
+	power-domains = <&scmi_devpd PD_APL>;
+	resets = <&scmi_reset RESET_HSCIF0>;
 	uart-has-rtscts;
 	status = "okay";
 };
-- 
2.43.0


