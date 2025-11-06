Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD83CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixru25OiBe6UnUEPl+muwDgqr8p/6jSsc5BNi9e89ws=; b=mv21d3eEFvzvGxRzjWUxa3qjdf
	PzvSsWIJYmYhUhtZO88QlhPq6KGdp2GTez7p/fevAZzqoOPIEWjsNHsPzyu3WtE/IuY2taJFh4pzs
	P9inw4SFRoSjLrvgR/dwy63iiUG3ZReVevPlkCoz5p4qOfq0wN3kcp+oVhxUrYCJ8MRyelo5jGHnx
	jdNAGXfNtGrDMUamI8MquGuuv0he3iVLJgFqkJeFacK3CdUTUzdh2dRP3FJkmKdpSgml7dIbKKRDh
	Dt+eE2v030vyVDmTRRWGkd0RHS7rCmbju13ciojutAwLmCngrPKjB/z+kS6+yNpQCMr4E+DnEDK8y
	b7GD1e8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5i-0000000FNa6-0Yf9;
	Thu, 06 Nov 2025 11:23:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5g-0000000FNY6-1K2E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ixru25OiBe6UnUEPl+muwDgqr8p/6jSsc5BNi9e89ws=; b=Fj68tNPd2VxqZ8XghYzQkIoEXr
	EjU9T1/58Z9OZ0C3QYmHnNvx8HK5uQNP+W5Ngq06fR0uBOgGj8zKbTHNjq8ahfwZPisl8ISzs/aQc
	MvHUuCLt1oECcMKx5dn4NPs7cu4YjNKxewgg8Z8OYfEBW6U6qIHd+8s8LJ2IsUtgNz7e5go5UGLm5
	MB7xZjnw9b/IKI00zE9Pl3M4RksNQW7uLrVCMQmp5FHy05ll2xmYwO+g0kdj8VePD01my2iOmJS6L
	hMhzj5sLjkok8BM9EDoWnFgSmrjCnLdhcIiUXTJcCZ5jSarnl5elyyiXtwmDP2neWEUMK7BP1N23D
	ELJRWDUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53560 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5a-000000004vk-1bev;
	Thu, 06 Nov 2025 11:23:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy5Z-0000000DhQV-1e2l;
	Thu, 06 Nov 2025 11:23:37 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 6/9] net: stmmac: sti: use PHY_INTF_SEL_x to select
 PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy5Z-0000000DhQV-1e2l@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032344_358646_D06BDAA1 
X-CRM114-Status: UNSURE (   8.90  )
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

Use the common dwmac definitions for the PHY interface selection field,
adding MII_PHY_SEL_VAL() temporarily to avoid line wrapping.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 53d5ce1f6dc6..1e8769a81d77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -77,13 +77,15 @@
  *	001-RGMII
  *	010-SGMII
  *	100-RMII
+ * These are the DW MAC phy_intf_sel values
  */
 #define MII_PHY_SEL_MASK	GENMASK(4, 2)
-#define ETH_PHY_SEL_RMII	BIT(4)
-#define ETH_PHY_SEL_SGMII	BIT(3)
-#define ETH_PHY_SEL_RGMII	BIT(2)
-#define ETH_PHY_SEL_GMII	0x0
-#define ETH_PHY_SEL_MII		0x0
+#define MII_PHY_SEL_VAL(val)	FIELD_PREP_CONST(MII_PHY_SEL_MASK, val)
+#define ETH_PHY_SEL_RMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RMII)
+#define ETH_PHY_SEL_SGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_SGMII)
+#define ETH_PHY_SEL_RGMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_RGMII)
+#define ETH_PHY_SEL_GMII	MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
+#define ETH_PHY_SEL_MII		MII_PHY_SEL_VAL(PHY_INTF_SEL_GMII_MII)
 
 struct sti_dwmac {
 	phy_interface_t interface;	/* MII interface */
-- 
2.47.3


