Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A04F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXZyqgN8dMCgcgZFM/zLAXjQCHFSgvYmx6oyb7xGPsI=; b=u2bUOBJ2Lyr8BU5af/+SgMUIH1
	nH6DbHRWak9/Y1A/MhVRh9w3s8MlYsBpeo+1CIIDMuf5kYtez1XNH3qccLkFzMWQBJi4SWGwcConn
	F2zqd5qQ0ek2HcKq0TqaSn10a8r+NQmG69H//J+HwkXksXLd6MkgmsZXQTip0OmKg3JPzWkJfuGNs
	Wxg9UpbiBLp218XRQIasUEDgLzRKXRnhbnvcNRw8lwKJNhzl30peid6lv+woND2oJQxeb86Sa5+z/
	IJGJZMGeUZEAhrKlQ9Qe9lyimV9ZdvM5zi/AJ9M0NmJArWBbJe6wlnDM1HCx187S7y+Vxhb7PrdLf
	/nCWEFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6Ab-00000001bbI-2Tuu;
	Thu, 05 Mar 2026 10:43:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AZ-00000001bXY-0CFR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nXZyqgN8dMCgcgZFM/zLAXjQCHFSgvYmx6oyb7xGPsI=; b=yIxKsNaGj0884hFedTKYrmGTv/
	MAIIGTLD7qzIQsE475lPs20slPp7XAAAP8NSnYMYyvhcIMZtgEw3LF0+V1RXxhlVrJAmIXt736i0T
	R6Czkb2uLPIvNHddhiTLVhQQ8RV9SVNrFpLtmIx8eRsLg6wsaJALyR2v9LLTsKHaBWtIoxc7Fw2UV
	G9q169qOTxX+LFxJ4gyof1LlB08uxcli3JIods61zjSvVrCMyoOGiK1liXNu0Qu1k8xDU9UKDSoE+
	qM9tgeWSfLYNPQ245GY7HRxk1dPx5N8qlDSF5Dv3qp0rstPtefPlahLlPbl01p+TVPLMIqnl4rXip
	pBEASvQQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43338 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vy6AP-000000007oH-3b3E;
	Thu, 05 Mar 2026 10:42:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vy6AO-0000000Btx7-2NDV;
	Thu, 05 Mar 2026 10:42:52 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next v2 6/8] net: stmmac: use GENMASK_U32() for mdio
 bitfields
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vy6AO-0000000Btx7-2NDV@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024303_083904_AC989399 
X-CRM114-Status: GOOD (  10.35  )
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

Rather than using hex numbers, use GENMASK() for mdio bitfields.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a6f8e78856aa..b913fe5af488 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -367,8 +367,8 @@ static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 	mac->link.speed_mask = GMAC_CONTROL_PS | GMAC_CONTROL_FES;
 	mac->mii.addr = GMAC_MII_ADDR;
 	mac->mii.data = GMAC_MII_DATA;
-	mac->mii.addr_mask = 0x0000F800;
-	mac->mii.reg_mask = 0x000007C0;
+	mac->mii.addr_mask = GENMASK_U32(15, 11);
+	mac->mii.reg_mask = GENMASK_U32(10, 6);
 	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 4ea55be04c5c..c7cb30672604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -496,8 +496,8 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	mac->link.speed_mask = GMAC_CONTROL_PS | GMAC_CONTROL_FES;
 	mac->mii.addr = GMAC_MII_ADDR;
 	mac->mii.data = GMAC_MII_DATA;
-	mac->mii.addr_mask = 0x0000F800;
-	mac->mii.reg_mask = 0x000007C0;
+	mac->mii.addr_mask = GENMASK_U32(15, 11);
+	mac->mii.reg_mask = GENMASK_U32(10, 6);
 	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 7c91ea2775d4..6b5cf3a0866a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -184,8 +184,8 @@ int dwmac100_setup(struct stmmac_priv *priv)
 	mac->link.speed_mask = MAC_CONTROL_PS;
 	mac->mii.addr = MAC_MII_ADDR;
 	mac->mii.data = MAC_MII_DATA;
-	mac->mii.addr_mask = 0x0000F800;
-	mac->mii.reg_mask = 0x000007C0;
+	mac->mii.addr_mask = GENMASK_U32(15, 11);
+	mac->mii.reg_mask = GENMASK_U32(10, 6);
 	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
-- 
2.47.3


