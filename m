Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20435CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ph+6qPy2QNKs5BgX9sm2D+uM01/NCEd/eq2joeWRxo=; b=L/5wIp+PFkXi/gjuP7/ek44Vse
	LdckB54BQ8ZSF98yCzE1UPTe/xsamrntRvYA+/TNQt/+dg4c546+kL29xcDM6unzMx6cWicaDvYZJ
	YymxJV2Fq0xxLkrSPXtYrOebw7EnWdVkbnJAwFFlryfmRE0MZrPXmxLC4nrgnudY9KrLTfBbihg7+
	UWXgv9i5THE30E0+nS6AKqzSH6OOjbfLsk5PGuv4dWczVaaZRCRyYtFTYvD+8IYe26TaeShwWi4xW
	cg2tIKSC7SJZzYdlXqiCkbR9uvAwACXjeP7VkysRkkEiUjWMZ21zKqErskTCLSdGWFEyVGmAsdSwO
	QINg4ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpb-0000000Ca5j-16aB;
	Wed, 17 Sep 2025 15:12:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpW-0000000CZyQ-2jxc;
	Wed, 17 Sep 2025 15:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7ph+6qPy2QNKs5BgX9sm2D+uM01/NCEd/eq2joeWRxo=; b=oBVhKLo1YaiyOxQi76g8GribMm
	EGCqGO6VkHYVszdRnJfnCifHuXV8F/PMqtHwZ9WvGNTdxV6DJP/kx1zx7s1JGzcQVoeid9N3M5ZQH
	juhcaDg86+s3KL+8Fk5yKQ+sRbqTLFFOz/wxzxzXGvCv+DsPgtHr59usBcKwMNZI0WHKo9is5VznN
	KtUCfT5pB0iVwXaa3b/rX+ybQbx/Ar1SlNyLyJ4wOQv1PnjuNdcbw0L4Yi8qwlwJWb7yeuaaCVQCE
	KjRqjH5Stj1Cfods5ZDr1lFa2x2oQEqK2x1+DVhLB9tZxRLA9YhuRGEEBK0COxTssNO75lpee7fyV
	KyFNaVLA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36642 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uytpH-000000004k7-1Ja2;
	Wed, 17 Sep 2025 16:12:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uytpG-00000006H29-1Ltk;
	Wed, 17 Sep 2025 16:12:06 +0100
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
Subject: [PATCH net-next 02/10] net: stmmac: use phy_interface in
 stmmac_check_pcs_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uytpG-00000006H29-1Ltk@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:06 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081222_695197_D52CA27C 
X-CRM114-Status: GOOD (  13.33  )
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

In the majority, if not all cases, mac_interface and phy_interface
are the same with the exception of some drivers that I have suggested
only use phy_interface and set mac_interface to PHY_INTERFACE_MODE_NA.

The only two that currently set mac_interface to PHY_INTERFACE_MODE_NA
are dwmac-loongson and dwmac-lpc18xx, neither of which use RGMII nor
SGMII.

In order to phase out the use of mac_interface, we need to have a path
for existing drivers so they can update to only using phy_interface
without causing regressions.

Therefore, in order to keep the "pcs" code working, we need to choose
the STMMAC integrated PCS mode based on phy_interface if mac_interface
is PHY_INTERFACE_MODE_NA.

This will allow more drivers to set mac_interface to
PHY_INTERFACE_MODE_NA without risking regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8c8ca5999bd8..a23017a886f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1120,6 +1120,9 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->mac_interface;
 
+	if (interface == PHY_INTERFACE_MODE_NA)
+		interface = priv->plat->phy_interface;
+
 	if (priv->dma_cap.pcs) {
 		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
 		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-- 
2.47.3


