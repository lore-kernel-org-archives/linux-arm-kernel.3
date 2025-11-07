Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E96CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tHEJW/uohGXrC6WjLOnZ8INtuIGiGHzzYLj1JRrzuw=; b=H8cdcl4/rIgmjd/A4cUMInij3F
	JUcg68xPvELn8EebXIWaNZAcD/6+cDQYkObY/zJIJqexVp4Q1CVSvO+8sBXPfHmBb7fdw8FAA5Cts
	9S4u7+pGaUOZtoQjRLFF3CVw7RoNHjjPV427mubr3RLszfGDhGLPAul08uS2RqO7gYoZXeft26z2R
	XLlUyQoWtu/J7L0C+xCS4eu8jqCa7RIraZCS5f0umFKAyyplo0nNW03vYhxA0yPP5bkOpjEJFI6+/
	jVi3cOm1J7DwKWFtGU9ulYywfZWrjfa8HtFXWg3Nme539aGFVIjMvyjglL6I2g1u7b3a/wku06Xhq
	SESE9wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNvh-0000000HY5G-1CKP;
	Fri, 07 Nov 2025 14:59:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNve-0000000HY3P-2JRH;
	Fri, 07 Nov 2025 14:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6tHEJW/uohGXrC6WjLOnZ8INtuIGiGHzzYLj1JRrzuw=; b=az7B7UIiP4X3flwMTakKGhlyQR
	S3YOu+/7Sj5fS2nd3EP3TLsu3knmkIEazrD9Apt+1bLHhFia8dYdZ2kMm8mJt79xlI+Gf7ooNCwB3
	s+WkhlE6ZVnRnLqFCvhiRZU1y7Lj69MA9131aH/B3UWQcTdk8z++xx6WZ/8/NmLP2g7yPm3gux+cd
	LMEooG7bfQN/fGpVVIDDALVhSMSqZeC3+UvnCDQKnAPA+z1nMglY6wNrPJypKPTJ8qOFF3VzZeYuf
	IvbCtndfbdo7Fx1Rw+0fbE2dU+EPEFvsHdDnAhchhBsT8SRng47dZF2jv9JwejEQIdGdAV5ohiQXU
	8REM/Vbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58972 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSn-000000006jh-2nV4;
	Fri, 07 Nov 2025 14:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSl-0000000DkTH-2tGu;
	Fri, 07 Nov 2025 14:29:15 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 15/16] net: stmmac: visconti: use PHY_INTF_SEL_x to
 select PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNSl-0000000DkTH-2tGu@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_065906_588356_B2722C60 
X-CRM114-Status: UNSURE (   9.23  )
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

Convert dwmac-visconti to use the PHY_INTF_SEL_x definitions. The
original definitions used constant 0, BIT(0) (==1) and BIT(2) (==4)
to define these, but the values of the bits corresponds with the
PHY_INTF_SEL_x values, so it is highly likely that these are not
individual bits, but the PHY_INTF_SEL_x bitfield.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index bd65d4239054..7b6b048e1be0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -42,9 +42,9 @@
 
 #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
 
-#define ETHER_CONFIG_INTF_MII 0
-#define ETHER_CONFIG_INTF_RGMII BIT(0)
-#define ETHER_CONFIG_INTF_RMII BIT(2)
+#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
+#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
+#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
 
 struct visconti_eth {
 	void __iomem *reg;
-- 
2.47.3


