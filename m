Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D453DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4UCwVyKzHujgFhWgXUmNylgGLEyCpXl2odXacDq9ZE=; b=DOuw0N68rl3Yit2N69Rws7W4db
	c+66N94t1IQVK7qW6R5k0nCn1ubUr/zJx9aejmQESdBO3KumoCve4FbwrZ7oI8jFVGkhm/GAoLxiT
	BHpcbDOHC7suo+jWyu3jK/MvmW42N1QCUiieDWE0RIQLZJ1sOi6kzjwzU33jFBSKyWc43Dla4XGlc
	3gcrna9oDK9tljODsewUDWs6u6dutIpTR/IN8OA09n3KAjA92b0R+/bNj5rdyyAqFBInDfUWZMhQs
	70t9hVIbRAytQoGOVSgBRbYAQiopSIY1gDTyKDyR3BxZI1X+Bt0Go8GKy6Xhrq/EG4d5ImRhCWcUh
	5C0fnf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5I-0000000FNPE-0TUo;
	Thu, 06 Nov 2025 11:23:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5F-0000000FNOU-41lg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X4UCwVyKzHujgFhWgXUmNylgGLEyCpXl2odXacDq9ZE=; b=TxVYwpXXabYXNoW2h/c2rAsT8P
	cCYGxCLn0gXte1++gBcoznPEMv52vOOBn61Vtz3mfZMaQZ0/1xu4/8GKeZ/sgSQI4ULUUtOddylnZ
	G/0qRV3O4KMvfP+LzWDzMe4Jmtiy4m1hteKBR/A5mI8WlSXF9ff1JWOCztwML8ncaY6faREjcbyb0
	jQQBttWdKOdfpwFzCaS+Y7PA9zPN02LP3KRHAZjPq8EQiA/EmF6zCmSXWwOXnlvulr9nXU5HdDEbO
	OzqH+WZ0qCXZ9+IsF1zF7ZcOQ1P376/OBkgG/ixnUeJaW+lp9k7zWPxsEaVVxcXl+p1fHBfJj3MPw
	1sL0ak5A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44972 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5A-000000004uE-25o5;
	Thu, 06 Nov 2025 11:23:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy59-0000000DhQ1-393H;
	Thu, 06 Nov 2025 11:23:11 +0000
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
Subject: [PATCH net-next 1/9] net: stmmac: lpc18xx: convert to PHY_INTF_SEL_x
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy59-0000000DhQ1-393H@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032318_019196_1F182669 
X-CRM114-Status: GOOD (  10.24  )
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

Use the common dwmac definitions for the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 6fffc9dfbae5..66c309a7afb3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -22,8 +22,8 @@
 /* Register defines for CREG syscon */
 #define LPC18XX_CREG_CREG6			0x12c
 # define LPC18XX_CREG_CREG6_ETHMODE_MASK	0x7
-# define LPC18XX_CREG_CREG6_ETHMODE_MII		0x0
-# define LPC18XX_CREG_CREG6_ETHMODE_RMII	0x4
+# define LPC18XX_CREG_CREG6_ETHMODE_MII		PHY_INTF_SEL_GMII_MII
+# define LPC18XX_CREG_CREG6_ETHMODE_RMII	PHY_INTF_SEL_RMII
 
 static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 {
-- 
2.47.3


