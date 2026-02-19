Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9118EE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TyuelZ+E4C+VYFranha+zBDCO7Q94VbMlL9wG+QtKvc=; b=JOL1Ry0K1xruhz8irB1HpIotm1
	sDX9AT1APnu65YOIO+OYpjB9okRHx0tzx5efamJuoJhbhZaXM8R1FGmcLg2sDws2L+D8xRmVni9cT
	uOlb0nNYfaGP0LXHBubqpqBSYS48IdCupskbQaQcxP1YDaeugT8HyZfid3kiznjvnl7CcivGeD4NZ
	E8mMw6gU+iNC+iY5UfimAapWp3Nbo22rER22ET1holBmu+C6ur/7PO/0UVuHfRAtqQfPcUlwyWRs/
	/uClKReULndwWSTjBPOJHnFTkhC8bfVfhklvt4Vs3tybSYSzvkJeEK6EHS7yim+Eok+cPzbOtkzUw
	I3D23r3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ER-0000000BTRo-01VD;
	Thu, 19 Feb 2026 14:42:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5EO-0000000BTRU-2p86
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9598643914;
	Thu, 19 Feb 2026 14:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E74C4CEF7;
	Thu, 19 Feb 2026 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771512135;
	bh=STRB27EWeB6oVhlikxDHPndmSosAoqfOYJy01qlfm2U=;
	h=From:To:Cc:Subject:Date:From;
	b=DxDSXsVMd+s2WLtv8IYneiiF2BtKRFWB2oDz+DuL8oEF8N1r1bTA/aAbEA2DDir2x
	 jTLd453//zArrhL4VhZ2lQxS5erOa59crkaQjvS+1+IdMFMUDG698YPxdI9OPqk4gs
	 3eagilyHMYOmp4o9cwDkxkEL1qfxCz7Bx6dmUlNqHzf7C12KH1XejRsVtmGsDbOoo/
	 EZ9q7wxDiGji/Sz5jeDErve7JxhqBKOzEc4KLfREkvT2JFoiSG7SJF4OY3qCYHsieE
	 ubYnJGqZe7IrOQr5usDA5TMLyfBx71NXFkz7kUWfYQ1CHj1GL1qnntoyklhM/5ArvV
	 jEysEgu0lEAdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Forrest Shi <xuelin.shi@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
Date: Thu, 19 Feb 2026 08:41:59 -0600
Message-ID: <20260219144200.2633404-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_064216_745974_2D4BBEF2 
X-CRM114-Status: UNSURE (   9.10  )
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

i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
temporary buffers. The SRAM is larger than 96KB, but that is all that is
available to non-secure world.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
NXP folks, any comments on NPU freq? IIRC, the clock controller supports
setting the freq to 1GHz. Is that supported?
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb5..d826d4b5a06b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -43,6 +43,29 @@ map0 {
 			};
 		};
 	};
+
+	sram: sram@20480000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x20480000 0x0 0x18000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x20480000 0x18000>;
+	};
+
+	soc@0 {
+		npu@4a900000 {
+			compatible = "fsl,imx93-npu", "arm,ethos-u65";
+			reg = <0x4a900000 0x1000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mlmix>;
+			clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
+			clock-names = "core", "apb";
+			sram = <&sram>;
+			assigned-clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_24M>;
+			assigned-clock-rates = <800000000>, <24000000>;
+		};
+	};
 };
 
 &aips1 {
-- 
2.51.0


