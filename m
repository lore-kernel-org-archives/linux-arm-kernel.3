Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88ADC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZdT2eAV4IEfIQPWkA1dt7PbZ0W7C/5bIcL/QQrYOBNg=; b=UwMeGbQD9g5R1HsYNf48brGHOF
	0k2wUc/nVuE1gl8VfHRZH9JcUa3f3eI1/mshjxPcMd0n400Dy7kCO/VowL9WifBi+wGs2BtHGVg20
	accIQhv0SQQk0ocDE3/4x5mCjQpjExGUNDMAGNhAOkbesml+m6iSU7/QpAxxDHJPulPuWFzw8F48c
	NLIMz77dCawTSYEWz9DAegTzqNv56ENKL/Dh1d17yK9AWx/Ie9+/SRw3UuHeZKMKfkcaFV0t6wYbA
	+65f5DC72f7u9g3ewsLrRqFFzWjV9CWcn748t3i8qDy6zT3Wijqc2cLA3PAVFvclLADFRraxErUzQ
	kClbCoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuNX-0000000HFuy-138p;
	Tue, 25 Feb 2025 12:49:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtir-0000000H9WA-2w6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:07:38 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1tmtid-00055V-T1; Tue, 25 Feb 2025 13:07:23 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	aford173@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx8mn: fix micfil dmas settings
Date: Tue, 25 Feb 2025 13:07:04 +0100
Message-Id: <20250225120707.2658709-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_040737_743091_75F542A7 
X-CRM114-Status: GOOD (  12.11  )
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

The third dma cell is used for priority information not to encode
something else. The NXP downstream kernel use the third cell to encode
more information:

 - Bit31: sw_done feature enable/disable
 - Bit15~Bit8: selector
 - Bit7~Bit0: priority level

but this was never mainlined. Therefore drop the further information and
just specify the priority which is 0.

FTR: The sw_done feature was mainlined without making use of the
devicetree.

Fixes: cca69ef6eba5 ("arm64: dts: imx8mn: Add support for micfil")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..8ab4af78acb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -369,7 +369,7 @@ micfil: audio-controller@30080000 {
 						 <&clk IMX8MN_CLK_EXT3>;
 					clock-names = "ipg_clk", "ipg_clk_app",
 						      "pll8k", "pll11k", "clkext3";
-					dmas = <&sdma2 24 25 0x80000000>;
+					dmas = <&sdma2 24 25 0>;
 					dma-names = "rx";
 					#sound-dai-cells = <0>;
 					status = "disabled";
-- 
2.39.5


