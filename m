Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueUNA14OVeEPQ6yDhGtqR0ixCik1TrsIANs9nUl+K/4=; b=QltckAYEH9Ek4qut/1eUMgnTAo
	Q2J1PtUHtMwIw1wFZW6KK9UZwC59gi6OBg8MSHS2l3qDYdufk2rwlJv8L4WPq/OkfqJRa+Cv3uWOf
	no4xIAH2mxiWfQBgoxkxE0+P+lPyInygjCX29DHp7hhu+aCVu+F+4UU36Ek3iZdzwaibMgBOGiq3O
	7K394D2AefvmIpebdnrLniI+gb5fjksamVha2CUfHfSkxsEKyfbFkdZQRFAbx+AbyLASMCoZmtefD
	v/egfrcvYhRCaOW5Q587fe4jDh5UW+9tKPGVbVaD4aUATMYLjvHRO/1bBtOlbpg2Nmny7wMY8EJ9B
	PcG8zJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G4x-00000001GiD-18cI;
	Mon, 14 Apr 2025 09:26:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FmL-00000001DPx-1x0O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ueUNA14OVeEPQ6yDhGtqR0ixCik1TrsIANs9nUl+K/4=; b=hoLn4b4zLHROIv6XBtc1AVDBlg
	IxzwN6NDNuK2sV394D+tTFGvbVWW5ZVGDfMnUCom4AczNYgDIg8X5CJdSJWagwjENKO0rosNxHgvO
	XC3Mvju7IEa32zcE0TTOxaLpj7+w4uztvykihRHhIsAT0i0TR+yQlYIGeNB1pmRArj+TXO80GtCD7
	RzhEzFAZ6TULGHHyJhvKPi+TXtO/CqwwLoDPEfJvItX9fQW6YsZt2jmssd9rT8zCEFbOF9wPpB3bu
	Er3c7TkkaAbGnDRBtlt0tb+6QZ4b8ckh/9hv6JrZVEJVJ0hKewXl/QKIKu8Qk1LnNxuyFzVj9sXy3
	8RVxId8Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41512 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4FmB-0006Cn-2J;
	Mon, 14 Apr 2025 10:06:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4Fla-000XjM-Bw; Mon, 14 Apr 2025 10:06:10 +0100
In-Reply-To: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
References: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 3/4] net: stmmac: anarion: use
 stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4Fla-000XjM-Bw@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 10:06:10 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_020657_524692_51B108A4 
X-CRM114-Status: GOOD (  10.42  )
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

Rather than open-coding the call to anarion_gmac_init() and then
stmmac_dvr_probe(), omitting the cleanup of calling
anarion_gmac_exit(), use stmmac_pltfr_probe() which will handle this
for us.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 941ea724c643..99f6c977ec41 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -111,10 +111,9 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->init = anarion_gmac_init;
 	plat_dat->exit = anarion_gmac_exit;
-	anarion_gmac_init(pdev, gmac);
 	plat_dat->bsp_priv = gmac;
 
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id anarion_dwmac_match[] = {
-- 
2.30.2


