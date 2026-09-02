Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74FDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNfORgOwxE5iDU8cvK6xtfxcznHwopKBKWSuxTAjG6E=; b=Xe/VpcXry5Qp6ERW4wPs9H++2/
	W0hEp/o2yUsQq0QEOMxaBcdc6fMoAMtEwvYrFddHDm7wGQrBXBPR8nMkl5qx2CBVJ/YklFnDh2EoQ
	p9KmyPR7Pbxa9xbiDOP2GC2Tg3eUKFlJEKRG/OyFE9eARTIr6iGQxlaxPbFlnm7GYq9ZQTp+sEQ0o
	CL6E442ABkRx882ox3UTGjAw/KVbY70GenxWTrVcFeZbuCQkeLJNhruKBO+jh3wxjTSx6jOTq1doO
	PsCAXhq36XzKNne3Wu9HgifX3GkqueA9MXHGxnneQYsbAHGJ+Zn6stg+fZcmCry/I0JZ74dpazSBK
	wsV58yMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jB7-0000000EVZi-0eK3;
	Wed, 02 Sep 2026 11:30:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jB5-0000000EVYs-3m6E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:30:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A684440244;
	Wed,  2 Sep 2026 11:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE291F00A3A;
	Wed,  2 Sep 2026 11:30:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>
Cc: devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 12/12] arm64: dts: renesas: ironhide: Add CPG/MDLC renesas,scmi-firmware properties
Date: Wed,  2 Sep 2026 13:29:28 +0200
Message-ID: <da82ca150ef0bae62ba61b60376103c262f60ebc.1788338320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
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

Link the various Clock Pulse Generator (CPG) and Module Controller
(MDLC) device nodes to their SCMI provider.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - s/firmware/renesas,scmi-firmware/,

v2:
  - No changes.
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 04291f04da2b7fb5..a6f055a1f38a8449 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -170,6 +170,10 @@ ecc@1e66660000 {
 	};
 };
 
+&cpg {
+	renesas,scmi-firmware = <&scmi>;
+};
+
 &extal_clk {
 	clock-frequency = <16666600>;
 };
@@ -183,6 +187,118 @@ &hscif0 {
 	status = "okay";
 };
 
+&mdlc_aon {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_cmnn {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_cmns {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr0 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr1 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr2 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr3 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr4 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr5 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr6 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ddr7 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_dsp {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_gpc {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_hscn {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_hscs {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_imn {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_ims {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_mm {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_npu0 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_npu1 {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_pere {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_perw {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_rt {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_scp {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_top {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_vio {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_vipn {
+	renesas,scmi-firmware = <&scmi>;
+};
+
+&mdlc_vips {
+	renesas,scmi-firmware = <&scmi>;
+};
+
 &mfis_scp {
 	status = "okay";
 };
-- 
2.43.0


