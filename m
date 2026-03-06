Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE9FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KVabfjGn7gDPX5fBffLKhVpARqPTjAWjlekod/tgGWs=; b=36egirEE8arlKtfv94kYHG3C/a
	0Xegt+XYUbKgBdLQZD8jmKtRPzxgMCzwz3hwd02iWJbd4PxenRtKFMbAgi8HPmEadVzOjyfLQ4J6w
	608S/tOmbAzKnlvEMw4uAyyrXBVHMkegKxI98qVwliUDJl3zrAFB+bMaiHFt/JuF0jsYnaJfBglS3
	sE+NF7zWn0F/0UUuNxZt7htKCDgb90HQfH5oOb70Lnar2s8wAZQwymZvap/JXb8SlBhb8zoLIor0T
	aBNgxXaRpy1xD7PMBpQjOJ6q/GyS75wzTeS8n/yN8RPRMF7mGA7WZXqEbQg2gZbNTLpXodoapTbS+
	ESAwzxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybpJ-00000004TtK-3oZs;
	Fri, 06 Mar 2026 20:31:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybpI-00000004TtE-2GHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 20:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F0C56001D;
	Fri,  6 Mar 2026 20:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E90BC4CEF7;
	Fri,  6 Mar 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772829071;
	bh=y2TR/OG2MXL4lsCroTuzZzLl5gqQRV2w9LTb8iHNGjs=;
	h=From:To:Cc:Subject:Date:From;
	b=UU6csl4rGDcFlBKVQx/fd5t1jVHLKN6o9q+otWVe8SR878m5xNK/aRgmNUga25+vl
	 Zd3S+91AzqzQeAQyoJKWN8PMMxUUUr7Et2K7AUYLUjdGhvi/SuqKTA9xzPncWfvvJU
	 +hX5dE920ltyIf9Z314krYaWVrdFXAKKeEVUTCNmKnLsQM4KREhmyjjZNwwZZ+P5Up
	 /slCRAMl85nkspIs0+2PX7so+4KaFGS0rP83LZ/XoH8+JprjIhSNKGkS5ackrx56lr
	 1Xc1n70Ul8QCFl3sYl1BPqDnjqPg+oTPprSTQAqHv7UnMyS3xlD0bhQ+Xec0vw1kZg
	 nhXlmC8GSitwg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Forrest Shi <xuelin.shi@nxp.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
Date: Fri,  6 Mar 2026 14:31:02 -0600
Message-ID: <20260306203103.3119790-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
temporary buffers. The SRAM is larger than 96KB, but that is all that is
available to non-secure world.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Increase the APB freq to 133MHz
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb5..95cc60158349 100644
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
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <800000000>, <133000000>;
+		};
+	};
 };
 
 &aips1 {
-- 
2.51.0


