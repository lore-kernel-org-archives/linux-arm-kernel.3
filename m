Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BFACEE35F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PgSTIf7/1v607mYlTHSCmeolvuzQwG5u3QpU2ODho0=; b=BfyeVwpmN/uUfydOEN2L1nFQUt
	MspjBbAb2B1rLUhBzvjtw7Bk1/+FvokMAeJOMTx2wZruZEvIas7uOyAczIHO8I6LAyUKrPdJWI4xl
	YPq35hQTA4ooslCQ77Fvk4pGEhWGJ8oeF/30NaQZ2wVbYLg3oBxP5GAwS7Aedqb+oVvHkLnb+Q/I1
	nDyN7WmMYRYNsdNNHx+mq2/F6W8N9vO6Pex0GOoC5V3gU6T2m+gpmcd8DnnRckmUWn8UNd5po9vTg
	o+SCbhrV2oz5//4BoIrCV3Wu3edtji1STbNMMPjrxmCxqP2bMfxAL4B5BzcCmeWz9/Z/nsZFmEirG
	jfbMFnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTU5-000000018VU-3KA4;
	Tue, 18 Nov 2025 21:43:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTU0-000000018RX-42sU;
	Tue, 18 Nov 2025 21:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EC4660211;
	Tue, 18 Nov 2025 21:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E9C4AF12;
	Tue, 18 Nov 2025 21:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502207;
	bh=piP/RwbPgLfG2R/w3aecdxfRCWSEvz8vScqdpVTga7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FwnjNszeyn9daUwzPkwXHXbm3uS3LnvI7TRirjy1MtUO1KAzBjZ2f+fiyRiDPUjHg
	 6tw0Hjvho6hSMPZpzK5yqNIjgUysVyYyMKsCm9OgEZx/CuACD9r8r42Tkwu+wxw0SB
	 SqjqkmQdH0JDdG+trYr4wstR57e/cuNEIJbTaGZpGn18iGD6c9tdLtU/umKIA93JCq
	 llhW8re++DyBRIh6cyThEpOspsojrmGk5y4TduwuWAkpLccTxZ20N8nlvehUGItOTG
	 vwzCo7H45khum/cEyDtv276WoHPaS4pVd2g6OceLL6WKLerfYoBI1vXlJqeTqZdnfl
	 dkFv9EGB6xubQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add PCIe clkreq stuff for RK3588 EVB1
Date: Tue, 18 Nov 2025 15:42:18 -0600
Message-ID: <20251118214312.2598220-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118214312.2598220-1-helgaas@kernel.org>
References: <20251118214312.2598220-1-helgaas@kernel.org>
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

From: Shawn Lin <shawn.lin@rock-chips.com>

Add supports-clkreq and pinmux for PCIe ASPM L1 substates.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Hans Zhang <hans.zhang@cixtech.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/1761187883-150120-2-git-send-email-shawn.lin@rock-chips.com
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index ff1ba5ed56ef..c9d284cb738b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -522,6 +522,7 @@ &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
 	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	supports-clkreq;
 	vpcie3v3-supply = <&vcc3v3_wlan>;
 	status = "okay";
 
@@ -545,7 +546,8 @@ wifi: wifi@0,0 {
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_1_rst>, <&rtl8111_isolate>;
+	pinctrl-0 = <&pcie2_1_rst>, <&rtl8111_isolate>, <&pcie30x1m1_1_clkreqn>;
+	supports-clkreq;
 	status = "okay";
 };
 
@@ -555,7 +557,8 @@ &pcie30phy {
 
 &pcie3x4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie3_reset>;
+	pinctrl-0 = <&pcie3_reset>, <&pcie30x4m1_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie30>;
 	status = "okay";
-- 
2.43.0


