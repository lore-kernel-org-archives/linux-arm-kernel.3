Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C219DD43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ke5SyAFlrfgb1d4Sk0fw0tx/F1JDfP8VGWCR6vyCSHk=; b=14K3SFMBVuKu3kKsAISpAWeN82
	ygsy7jkq8VH8irOsWiKSmA2YFd/WvKxB9tJNYRYPEo1nScxOGK7qLRsJAA/ulANZb1pau3eIyEkAy
	uy6LV7M8LDhySBvYk1RpF0Zox7YmxJTOdN8FDFPX2sfY2/MbsPvoKTCIEKzNXXAWZLN/H0p5+qSAX
	IBNF5oQBC2WYhIutYvuVD9WeDT2LgJ6vvihlEvOxXUkGxADuVfxdYg2udr2BCWxlMf6+a+aZLDXA1
	Bvb0+Pf4cdPihOnQOtd8IqWwQs7Wmo3A1Pesu7hZrD3g0MMjUA66euqnSel14IQVBk/r+3nEPkcJa
	O+F9IdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91nM-00000006xR6-3c2v;
	Thu, 07 Nov 2024 12:39:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91lb-00000006xC4-2SWc;
	Thu, 07 Nov 2024 12:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E23A25C584D;
	Thu,  7 Nov 2024 12:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8E2C4CED0;
	Thu,  7 Nov 2024 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730983058;
	bh=JupmGb9015WA+7ZrISN7klsmE+UWxlE8YkOEg7MMi6M=;
	h=From:To:Cc:Subject:Date:From;
	b=q5mAMdjweSV2HmvxiK9NXGeGBBThNSvDW8ctyLZ0oTzxZ6oxRpHuSXC3lEOZQ7w7Y
	 JyK4PNAszGEmAgEoVUrUtZNu35xiy38fzMUQ66bRPHwGCuwVHa3peo/uOWzIlhfsZY
	 oRCv//SwDxlMSO+gXQAebuDOVH+bjnyUrx2kIlpTHFEQov85DWntmfmpBGTD7boXA6
	 P2sgseHyVz6fiDwzdwrhhtyA/i8hLpR9otGhnDyUzVL6/2FwDLnDRvJp0bRnMJatna
	 N8byM8Wi3wQEjrRi8h96i2KrnOP4krVaL869g+7wbCMHatH6Ck0L7TOAjoPANstUfa
	 jKabW20MQIfsw==
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC
Date: Thu,  7 Nov 2024 13:37:33 +0100
Message-ID: <20241107123732.1160063-2-cassel@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4968; i=cassel@kernel.org; h=from:subject; bh=JupmGb9015WA+7ZrISN7klsmE+UWxlE8YkOEg7MMi6M=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJ1tvT8YEyKFhQq+rCj9rrSzbZ3s9/9Z733vfzIWha7O TUyrapXOkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjARHxlGhik1b54Z3w0tUeu/ kcn96qe2e/pijwo2Tn+Pd3JnQg8J/WD4p9/1Mid2c3PmCvVZ3N8OLfaecLBaeP2Ft3ybo8VZziW u5AAA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_043739_765764_4A7E9ABB 
X-CRM114-Status: GOOD (  19.01  )
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

Commit cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php
IOMMUs") added the rk3588 SoC's pcie IOMMU and php IOMMU as disabled.

The mmu600_pcie is connected with the five PCIe controllers.
See 8.2 Block Diagram, in rk3588 TRM (Technical Reference Manual).

The five PCIe controllers are:
pcie3x4, pcie3x2, pcie2x1l0, pcie2x1l1, pcie2x1l2.

pcie3x4 can run in either Root Complex mode or Endpoint mode, the other
four PCIe controllers can only run in Root Complex mode. To describe this
we thus have six different device nodes in the device tree.

A PCIe controller in Root Complex mode needs to specify an iommu-map, such
that the device knows how to convert a Requester ID (PCI BDF) to an IOMMU
master ID (stream ID). (A PCIe controller in Endpoint mode should use the
iommus property, just like a regular device.)

If you look at the device tree bindings for msi-map and iommu-map, you can
see that the conversion from Requester ID to MSI-specifier data is the same
as the conversion from Requester ID to IOMMU specifier data. Thus it is
sensible to define the iommu-map property value similar to the msi-map,
such that the conversion will be identical.

Add the proper iommu device tree properties for these six device nodes
connected to the mmu600_pcie, so that we can enable the mmu600_pcie IOMMU.
(The mmu600_php IOMMU is not touched, so it is still disabled.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Testing done:
-pcie2x1l2: Ethernet connected to the pcie2x1l2 works as expected.
-pcie3x4: A PCIe endpoint (running the PCI endpoint framework) connected to
 pcie3x4 can run pcitest.sh without any issues.
 Modifying the PCI endpoint to DMA to an invalid address gives IOMMU errors
 (as expected).
-pcie3x4_ep: A PCIe root complex (running Linux) connected to pcie3x4_ep can
 run pcitest.sh without any issues.
 Modifying the PCI endpoint's inbound address translation to point to a
 buffer that has not been mapped using the DMA API, results in IOMMU errors
 when the RC writes to the PCI BARs exposed by the endpoint (as expected).
-My board does not expose a convenient method to test the other PCIe
 controllers, but considering that the ones that I did test worked fine,
 I do not see any reason why the others should not do the same.

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d97d84b888375..f96e607db2857 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -551,7 +551,6 @@ mmu600_pcie: iommu@fc900000 {
 			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	mmu600_php: iommu@fcb00000 {
@@ -1641,6 +1640,7 @@ pcie2x1l1: pcie@fe180000 {
 		linux,pci-domain = <3>;
 		max-link-speed = <2>;
 		msi-map = <0x3000 &its0 0x3000 0x1000>;
+		iommu-map = <0x3000 &mmu600_pcie 0x3000 0x1000>;
 		num-lanes = <1>;
 		phys = <&combphy2_psu PHY_TYPE_PCIE>;
 		phy-names = "pcie-phy";
@@ -1692,6 +1692,7 @@ pcie2x1l2: pcie@fe190000 {
 		linux,pci-domain = <4>;
 		max-link-speed = <2>;
 		msi-map = <0x4000 &its0 0x4000 0x1000>;
+		iommu-map = <0x4000 &mmu600_pcie 0x4000 0x1000>;
 		num-lanes = <1>;
 		phys = <&combphy0_ps PHY_TYPE_PCIE>;
 		phy-names = "pcie-phy";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 0ce0934ec6b79..4a950907ea6f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -162,6 +162,7 @@ pcie3x4: pcie@fe150000 {
 		linux,pci-domain = <0>;
 		max-link-speed = <3>;
 		msi-map = <0x0000 &its1 0x0000 0x1000>;
+		iommu-map = <0x0000 &mmu600_pcie 0x0000 0x1000>;
 		num-lanes = <4>;
 		phys = <&pcie30phy>;
 		phy-names = "pcie-phy";
@@ -212,6 +213,7 @@ pcie3x4_ep: pcie-ep@fe150000 {
 		interrupt-names = "sys", "pmc", "msg", "legacy", "err",
 				  "dma0", "dma1", "dma2", "dma3";
 		max-link-speed = <3>;
+		iommus = <&mmu600_pcie 0x0000>;
 		num-lanes = <4>;
 		phys = <&pcie30phy>;
 		phy-names = "pcie-phy";
@@ -248,6 +250,7 @@ pcie3x2: pcie@fe160000 {
 		linux,pci-domain = <1>;
 		max-link-speed = <3>;
 		msi-map = <0x1000 &its1 0x1000 0x1000>;
+		iommu-map = <0x1000 &mmu600_pcie 0x1000 0x1000>;
 		num-lanes = <2>;
 		phys = <&pcie30phy>;
 		phy-names = "pcie-phy";
@@ -297,6 +300,7 @@ pcie2x1l0: pcie@fe170000 {
 		linux,pci-domain = <2>;
 		max-link-speed = <2>;
 		msi-map = <0x2000 &its0 0x2000 0x1000>;
+		iommu-map = <0x2000 &mmu600_pcie 0x2000 0x1000>;
 		num-lanes = <1>;
 		phys = <&combphy1_ps PHY_TYPE_PCIE>;
 		phy-names = "pcie-phy";
-- 
2.47.0


