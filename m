Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC4CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjHCiBVOvbI+4LpGDwQaBWevRQ0TTlcNerso3E4z//Q=; b=ntKAId4KHMdf6Gy6Onkv2Nr+gw
	tzVrWDeJ2eW+JkiRyQUIzYmJL51ieNegyzdwktSjzXAMBj9jC5SAyHvedxE1Q1y1Di8DmExLI37ti
	uQz8y6BGtIMiU0uI1VqDgW9uPxY8/zONRYW8NQtTAldkzIfFh5fUBgip42dynCIk/9WpIrzb+Wa4R
	VLF/bez2LfJK2sDRWGu9hLLMve6ANlvPiG3v4m7XWG8a59VCJElFvEw8A6GwL52etwf5396kfNqoF
	57v2kQzjdkKpUuQusIixUlV1CS1p495M6V1LQNAMNo8uXUN8ja6hNlp+J3e5ZI7iXLn7XEboohSTj
	yBGbSfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41c5-00000008kiR-02kw;
	Wed, 01 Oct 2025 18:31:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41c2-00000008khT-3TbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BEB448E9A;
	Wed,  1 Oct 2025 18:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EC7C4CEF7;
	Wed,  1 Oct 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759343498;
	bh=PHcl1dE1lCANCZqnPCN9was7SxasDxHGeD7z9oJ+HwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E1ZAaQkaR+7mqUhr3lwMO7tVW4Ml2xCPZlHaxK0iaMeY0SI32oh+ynx613sKA7sQm
	 w20Yr0K6ZzIXW8/YTQQbXdPb3vR0QaNVckZFFIAIeEqTfCwLr9qgCchgKPysUeUr/y
	 i3a3eWX576XQvLrrl5eYRF8rLI56qCR8UIzenofLiDIIzUlJSTtlpABxw0Xz1iOXh+
	 Hw8WeBPKaGAPuBpuZLq7YTGWxGKmkMgHcOpGHIZxzFKHQfgSTO+30ZZr0l89jGg4Vs
	 8Cz7B/vfnLcBF0PR/r5d2fRxdCtqTclFSA89ziCulV4soaeWdPdRbuDVdsxFuUQKAi
	 yxHm45NoZapDQ==
From: Conor Dooley <conor@kernel.org>
To: linux-spi@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jun Guo <Jun.Guo@cixtech.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/2] arm64: dts: xilinx: add soc-specific spi compatibles for zynqmp/versal-net
Date: Wed,  1 Oct 2025 19:31:13 +0100
Message-ID: <20251001-cheesy-shucking-c55431bbcae3@spud>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001-basics-grafting-a1a214ef65ac@spud>
References: <20251001-basics-grafting-a1a214ef65ac@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5g4PfVPLFBuaLYvor0B86romXUgNKzoaBX7dvqZsNgQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBl3iyv8Z19oCz7CxHdSsMdx7i6WLQbbVvra7Kucu21ZZ nNr6tSHHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI2iWMDH3erWf5/HituD/7 tS6NORvOEbTk/j+jWzOWKLWtqJzeuYfhr0hr/NqDhjO3Jr2YZHggdW+cZpaI61uBHc0fEyb9Xnq WmR0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113138_908323_8D1280EF 
X-CRM114-Status: GOOD (  13.86  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Unlike zynq, which has a specific compatible for the Cadence spi
controller, zynqmp and versal-net do not have specific compatibles.
In order to "encourage" people to use soc-specific compatibles for new
devices using this IP, add specific compatibles for these devices, with
a fallback to the existing compatible for the r1p6 version of the IP so
that there will be no functional change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Jun Guo <Jun.Guo@cixtech.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 4 ++--
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index fc9f49e57385..38af1a4e34f7 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -610,7 +610,7 @@ smmu: iommu@ec000000 {
 		};
 
 		spi0: spi@f1960000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "xlnx,versal-net-spi-r1p6", "cdns,spi-r1p6";
 			status = "disabled";
 			interrupts = <0 23 4>;
 			reg = <0 0xf1960000 0 0x1000>;
@@ -618,7 +618,7 @@ spi0: spi@f1960000 {
 		};
 
 		spi1: spi@f1970000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "xlnx,versal-net-spi-r1p6", "cdns,spi-r1p6";
 			status = "disabled";
 			interrupts = <0 24 4>;
 			reg = <0 0xf1970000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e11d282462bd..89c565bef274 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1076,7 +1076,7 @@ smmu: iommu@fd800000 {
 		};
 
 		spi0: spi@ff040000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "xlnx,zynqmp-spi-r1p6", "cdns,spi-r1p6";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
@@ -1088,7 +1088,7 @@ spi0: spi@ff040000 {
 		};
 
 		spi1: spi@ff050000 {
-			compatible = "cdns,spi-r1p6";
+			compatible = "xlnx,zynqmp-spi-r1p6", "cdns,spi-r1p6";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.3


