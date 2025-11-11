Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A9CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=fVCKJp57n+N5fqSGzv55lVkuw6
	C1JYNUeC0q+oSYb4neWPeoceucKl2Cv+fggqqwr/ik96IwY/vT1uenDN5nez624Qkc4O45O8i4bNW
	9Jo6CkIGNYkg1HN4UZrmmNagitnclMmviuqvTWWeB2FGfLstDxOoNZ/wYTCOtRi1ftfRClWuynm7v
	WUYXxmnvY39tCQZzlSY1NfUbBAg+NpzF8HTqHH7ErehuMh+2tjtuUsMo/Vv6Raf87eXzxbxkOKzwR
	xROK4qhdzp0ylaCXXK9OAHTUJxLtBmyoc4Cz+WfwO/5mj1UH88X3j4+CwhfjuGB/Kn7oLhRLVkgw1
	7cSTa0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUc-00000006lBa-1cxp;
	Tue, 11 Nov 2025 08:12:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUa-00000006l7J-0YHY;
	Tue, 11 Nov 2025 08:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=D2ueYuFF5SKkwVVuG1ga4EosQ1
	6EOOO3u+JYrBZqJ7CvGeGaTUBB5g4UlR0JvzmxucLjeHI8LIU6+2Og/w+v9bC76/q5d2ES5c5i9xO
	9py7DA4ddKkST+/xe9peRiNsjmMb/31CQF5Usn++QmOaY5NWfd2B07BiqrDjKdsQrKmvVbpsU62cz
	5PTUSfaf9+Y+Je+OuT+hIdwZEIjXo4QEUENAzHyIh5FGemyV9FOSWRhAaC+quhtMzKmuXNw1RiMHl
	K2V7dlm7fW/LX+EAczA7xyu+129AKm5zUtH74d8LmVvDyfcUTvC9PBtrdd4YJCJXJl72oBAKpwwsw
	XMfggluA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50410 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUM-000000002CB-3Vmz;
	Tue, 11 Nov 2025 08:12:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUK-0000000Dqtn-1AyK;
	Tue, 11 Nov 2025 08:12:28 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
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
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 09/13] net: stmmac: stm32: use PHY_INTF_SEL_x to
 select PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjUK-0000000Dqtn-1AyK@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001244_166999_9910105B 
X-CRM114-Status: GOOD (  11.33  )
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

Convert dwmac-stm32 to use the PHY_INTF_SEL_x definitions.

For stm32mp1, the original definitions used constant 0 (GMII, 0 << 21),
BIT(21) (RGMII, 1 << 21) and BIT(23) (RMII, 4 << 21) to define these,
but from the values it can be clearly seen that these are the
PHY_INTF_SEL_x inputs to the dwmac.

For stm32mp2, the original definitions cover a bitfield 6:4 in the
SYSCFG Ethernet1 control register (according to documentation) and use
the PHY_INTF_SEL_x values.

Use the common dwmac definitions for the PHY interface selection field
by adding the bitfield mask, and using FIELD_PREP() for the bitfield
values.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 6c179911ef3f..1545772419d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -47,9 +47,13 @@
  *------------------------------------------
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCR_ETH_SEL_RMII	BIT(23)
-#define SYSCFG_PMCR_ETH_SEL_GMII	0
+#define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
+#define SYSCFG_PMCR_ETH_SEL_RGMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
+#define SYSCFG_PMCR_ETH_SEL_RMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
+#define SYSCFG_PMCR_ETH_SEL_GMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
@@ -60,9 +64,13 @@
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MII	0
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	BIT(4)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	BIT(6)
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
+#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_GMII_MII)
+#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RGMII)
+#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RMII)
 
 /* STM32MPx register definitions
  *
-- 
2.47.3


