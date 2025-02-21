Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E887C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qugMnCcisAWRd3N7XpZaDvLqsnQ13hI4MnOJQYSPqR8=; b=wI2jnmW1TvYp9oVoIHznn4oXgj
	XPttlgV6cQM1Z5A9N+4/QDeUtjnw4FtAEx7Kyntem9k6lS3j6UH7Hx3/r/wsSz2gYVE7fEFDZ07vt
	wYGAVn6+XtQMhCRJETYK1x4hnGP1JV8Oq6rrgikYSIPgbOGmmLmRgioBChriWpe4a+0FQkGxR59O/
	DIOkDhE5uL9EOwl8ukLvwmx1Bkm+gSh75h3yowONhFU/h7ayx2dhlLa11GM660UJWKpxD8ZvLAN+h
	trkuq1lAOUe7cVE+l4zs9mYgJ+oNo8yzQhvZtHWqVZI4a4Z1CCFkROFUpnsHyawdbQqV3pPcLY7aq
	bg0SejxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlROJ-00000005M4U-1YcN;
	Fri, 21 Feb 2025 11:40:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRMo-00000005Lql-2V4m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qugMnCcisAWRd3N7XpZaDvLqsnQ13hI4MnOJQYSPqR8=; b=slJ1doNLYx0gJdh83NuzDDMBis
	jySo+YRg1x1stRmo8dE1FiD+VXvxu7aowfRHxBaPU7hK8tUgXJj1zSJ72tURzCOajhPknQZO6Oo5i
	4Flh54HosFPQIk6SMglRaU3RZTS7zFUcnxRKtY9B4dGPEk/nIrbFwCLHEyKPb62IqAZ6ciZdlIRWn
	rk8Z780gW8LFPfTA/N9TBNe9yL/axY6Sw4vaOd69xuVZoO0WWmXfsExMEg71FvxHfl0QBOnjoLKBU
	qOlUnA3q7QPnDjirYRuAIALkZzQYksAEN1hV8qWKWqZh0pBREK04e7HhYUXGAcMaRXqobo7rgC03m
	lXtD3lPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36572 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tlRMe-0004Pp-28;
	Fri, 21 Feb 2025 11:38:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tlRMK-004Vsx-Ss; Fri, 21 Feb 2025 11:38:20 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set
 the link clock
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Feb 2025 11:38:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_033850_955051_70FCC4D5 
X-CRM114-Status: UNSURE (   9.17  )
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

The link clock operates at twice the RGMII clock rate. Therefore, we
can use the rgmii_clock() helper to set this clock rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192f270197c8..eafe637540b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -169,30 +169,17 @@ static void rgmii_dump(void *priv)
 		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
 }
 
-/* Clock rates */
-#define RGMII_1000_NOM_CLK_FREQ			(250 * 1000 * 1000UL)
-#define RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ	 (50 * 1000 * 1000UL)
-#define RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ	  (5 * 1000 * 1000UL)
-
 static void
 ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 {
+	long rate;
+
 	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
 		return;
 
-	switch (speed) {
-	case SPEED_1000:
-		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
-		break;
-
-	case SPEED_100:
-		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
-		break;
-
-	case SPEED_10:
-		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
-		break;
-	}
+	rate = rgmii_clock(speed);
+	if (rate > 0)
+		ethqos->link_clk_rate = rate * 2;
 
 	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
 }
-- 
2.30.2


