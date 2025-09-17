Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2691BCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oThadm21fEBgUmueHIYFCBoOqv4I0OZFwnRSNhY+FMM=; b=BorSB1fVO6POScNekMRvnPIJ4q
	UJluZ45bzhVYQ4AXYjoj/NvsTJQlId+hxxUH9K0eU1QuAVbnHxoXwEzxalkTfqI/FhL6jSI3EnvSN
	F0e/7zMLmvJFwFsAwRaJExd4TWXxz18Mlry+D1LlWqWydTDiQcTSwPj11cjdIr8ozr6lUMCyZ4+6g
	QilIbfkp/P9KpgZ0gxr5YSRFl5sraysDEQ1t8Sxyab0knTXAzOF4LF7Tpsx+DFUIFWGYVwF/SoWzE
	X3Q3rpah1t5SXFsojcPeBvL3u3Lg20vr6IymeG/4eEBKT7BreXOD4StcBACVjqB0Dcsu/8IT9XcNf
	pu2Exf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytq3-0000000CafN-0nzN;
	Wed, 17 Sep 2025 15:12:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytq0-0000000CaVf-2rl5;
	Wed, 17 Sep 2025 15:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oThadm21fEBgUmueHIYFCBoOqv4I0OZFwnRSNhY+FMM=; b=lFv5bKHlEudVmnA4EZ2ln+tYdr
	MmDXVFX3yWOudQVYFuf99vC00RJb4YsG7iyLyF7glum3ijhL++XV04I8VWyyrOR45t7tHnOvq6Pcz
	1xn8pCp1DqYAtYzXc27o2P2u8vXxszL73N7VdGgVcVqklngBGFx13Q/0Igbup7dVm8EwkvsolPJbq
	fvpdwHSV9yEKuMuHzplCyz58ijQZYAynHN9bP+UEuTRm7LJvSCODSQwDq9ZJdP9bbkSMZxLhhLgXW
	HzEU4SxprsIpymeN9vGtJ8C74CktmRHu/gRr+dCvk+hwNw9c7qEHAzyFry0B3xwojGa+SY1R2ID+p
	d5nbNOFw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35106 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpX-000000004lG-40TF;
	Wed, 17 Sep 2025 16:12:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpV-00000006H2R-2nA6;
	Wed, 17 Sep 2025 16:12:21 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 05/10] net: stmmac: socfpga: convert to use
 phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpV-00000006H2R-2nA6@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:21 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081252_745296_E7B80B44 
X-CRM114-Status: GOOD (  13.37  )
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

dwmac-socfpga uses MII, RMII, GMII, RGMII, SGMII and 1000BASE-X
interface modes, and supports the Lynx PCS. The Lynx PCS will only be
used for SGMII and 1000BASE-X modes, with the MAC programmed to use
GMII or MII mode to talk to the PCS. This suggests that the Synopsys
optional dwmac PCS is not present.

None of the DTS files set "mac-mode", so mac_interface will be
identical to phy_interface.

Convert dwmac-socfpga to use phy_interface when determining the
interface mode rather than mac_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 01dd0cf0923c..354f01184e6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -234,7 +234,7 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
 
 static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
 {
-	return dwmac->plat_dat->mac_interface;
+	return dwmac->plat_dat->phy_interface;
 }
 
 static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
-- 
2.47.3


