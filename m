Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA5BCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g48JP3qWZ4FrCT4GGKsP2pJyutWsZGO6pIbIs3KUgqA=; b=YWf5DMCz6Sg1jHQGwWj01a3072
	JWFsBMw49nYZagG3Ha4WdFhz85G0CcJvK6dQm8UP2FuJ+GpFGKKczC99eDUp+fPObeadWI/GG9Nag
	HxZo0YnsJYF1X1W1JnN8Lb81EUPkh+kF6Xrw5Jp/Zx3AoeWnz0MvH8VrxxpF+qs0GMjLUTskWH6c0
	j304hE3sz8qZ/URktRaESi5ctVr1cX4/HBm7eh6leVpLbpLYJ7taDN0CmC4Gv6uYo3eGYzjoNXjPf
	kLkcORAHXaE6cTC74HFiakDgQ2HJ7/kbnnpIE7deppMhZQMwFBTHNdVxqjLKatLBiFeT4w3ozqd0u
	BMetzyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGpD-00000000TYu-1KZc;
	Thu, 18 Sep 2025 15:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGoq-00000000TFB-3JyH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g48JP3qWZ4FrCT4GGKsP2pJyutWsZGO6pIbIs3KUgqA=; b=pZy7ouN06jixTq10wmLUqGBO/X
	izGgXM0saIOglJzbIKgP/hZtqLGOIR8oDFZkifTZB1l83Metb90Csd8XcxPNc6ha8wLqpgKL6oxCG
	029lSvyTkmoBYHMRh9p9bdu+Wpo1ipk5T57jnFQdjOC2SGzTHb7m5NXtoho0hTmErOfyj+4yoI8Gj
	TI1WpR1XvJPU3oksAdgmC0iecX9xQbvqoGhNuufnVtYl06S4mXSG4J/y3hdu01kkZvqd58VahdoDV
	fBNooFr+XwJXGflhgbl87oK2o4wfBl9fAqNN4sWcXRzpYadAb+jzV89eB1bh5fvivekDjB8in9OSB
	9nwN4i+Q==;
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGom-00000007doZ-1dUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:45:11 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uzGoZ-00B1eF-3U;
	Thu, 18 Sep 2025 15:44:55 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 2/7] arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI PHY
Date: Thu, 18 Sep 2025 08:44:46 -0700
Message-Id: <20250918154451.2531802-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918154451.2531802-1-tharvey@gateworks.com>
References: <20250918154451.2531802-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164508_534587_FD721B2D 
X-CRM114-Status: UNSURE (   9.72  )
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

Disable the unused refclk output for the TI DP83867 PHY used on
Gateworks Venice boards.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
v2:
 - add tags
---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
index 37db4f0dd505..baf46fe28133 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
@@ -115,6 +115,7 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index c09b40fc6dec..468c7e993c52 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -253,6 +253,7 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
index a5f52f60169e..5aa0e2cd155e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
@@ -248,6 +248,7 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
index 303995a8adce..a1232a4f8485 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw702x.dtsi
@@ -101,6 +101,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0x0>;
 			interrupt-parent = <&gpio3>;
 			interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 12de7cf1e853..7662663ff5da 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -228,6 +228,7 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0x0>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-- 
2.25.1


