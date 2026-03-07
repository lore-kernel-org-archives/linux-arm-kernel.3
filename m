Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DCCFC9EF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GfNekjph7q7LXyyIy0Z8aqKol/fBgQeMMk9zE7ThleU=; b=r2BGUADPtE74y4MywmmhkcDRvc
	9LFKQwuHXMcikSE771YzuNJe6k6p47ppe2HqKz/AgMGQVmcsXauwzkITapgz86urafxYNEgn7CieY
	LAZt5Cb2HF83RMT2O+Z/TzGB/8teKltlJMU6UopfZp0eUCTD2AHRSEI1JZ/A/9lhZgNv2IU/6WCTh
	Nfrm9k9nWGYnXCIZXvOLIGJxXbT2psrpu9LE6Y5Npnq+q6NJQcc3bdX/p/wdXQs/2xxM+TtZwJqst
	xBOKNnVTyn5xsrioJQNt9hOvcLa0f7hO2VvivA9UEN1Sal55AIQyrJQmiMrvDdvr+OlhtHOP6MzUZ
	dVLYxfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypJU-000000057XV-0vpQ;
	Sat, 07 Mar 2026 10:55:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypJS-000000057XB-1IAZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GfNekjph7q7LXyyIy0Z8aqKol/fBgQeMMk9zE7ThleU=; b=WxF3aTDCUrRJBwIbMzjWFYbU0r
	33/vaxd8Ym3gLdVk6F2Ccz6xDxmHvVfBPBdlgWd/VUKwH+jnd0vaf/+DY5iPoQ5sa+xJEy4MkYBD6
	/54XR4kbG9E3r1V+4jSWmztu7BdDPKXjoMfGv3rx5Zwj+Tm0i+Hqrmz5/5zr1oeA7nc/q7fjp4iMd
	6LBAn/f0zvfpJnr60lNxC5ARqKaYvKT4vgExZR5b/khhSIR266U2pAxP+q55YLS2EjHxwc6G5zxO8
	sOgh947rwpB95S9nICy0Vr2pkv2RWEAYw5VzSGpLsnmwdXa/YG5Frm4YcoHN1xr8BLN3MFbch4c48
	+U725hGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40590 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vypJN-0000000025f-2pMA;
	Sat, 07 Mar 2026 10:55:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vypJM-0000000CSiJ-48yO;
	Sat, 07 Mar 2026 10:55:09 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: remove stmmac_dwmac4_get_mac_addr()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vypJM-0000000CSiJ-48yO@rmk-PC.armlinux.org.uk>
Date: Sat, 07 Mar 2026 10:55:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025514_372943_C70D4E4B 
X-CRM114-Status: GOOD (  10.23  )
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

stmmac_dwmac4_get_mac_addr() is identical to stmmac_get_mac_addr().
Remove stmmac_dwmac4_get_mac_addr() to avoid this code duplication.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c  |  4 ++--
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 18 ------------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 602771e19d0f..e6bcb77b22a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -373,8 +373,8 @@ static void dwmac4_get_umac_addr(struct mac_device_info *hw,
 {
 	void __iomem *ioaddr = hw->pcsr;
 
-	stmmac_dwmac4_get_mac_addr(ioaddr, addr, GMAC_ADDR_HIGH(reg_n),
-				   GMAC_ADDR_LOW(reg_n));
+	stmmac_get_mac_addr(ioaddr, addr, GMAC_ADDR_HIGH(reg_n),
+			    GMAC_ADDR_LOW(reg_n));
 }
 
 static int dwmac4_set_lpi_mode(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 8c87a20880c4..a0249715fafa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -226,21 +226,3 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable)
 	if (value != old_val)
 		writel(value, ioaddr + GMAC_CONFIG);
 }
-
-void stmmac_dwmac4_get_mac_addr(void __iomem *ioaddr, unsigned char *addr,
-				unsigned int high, unsigned int low)
-{
-	unsigned int hi_addr, lo_addr;
-
-	/* Read the MAC address from the hardware */
-	hi_addr = readl(ioaddr + high);
-	lo_addr = readl(ioaddr + low);
-
-	/* Extract the MAC address from the high and low words */
-	addr[0] = lo_addr & 0xff;
-	addr[1] = (lo_addr >> 8) & 0xff;
-	addr[2] = (lo_addr >> 16) & 0xff;
-	addr[3] = (lo_addr >> 24) & 0xff;
-	addr[4] = hi_addr & 0xff;
-	addr[5] = (hi_addr >> 8) & 0xff;
-}
-- 
2.47.3


