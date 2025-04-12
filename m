Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E11C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+tqpzcvIfMSvkwfj4Wt8zWvm38OZPWN5QBKZwmvXH4=; b=NvW1M+RNhVkBgLMmj4vs/e821I
	3f11A6OWMVWcQF3SWK1aEN6dexXkeeANA89njOGv6CpY/0kh2OdnwpZaBdCBNccQgP5XK5o7PNSuq
	mb+e149EGO+lqL34GCWihqgFNVpz2E1w+1EmzZybh0sUCknwh96LvzRp2cUAK/DitvNaRKwgiNOGS
	g0C5huJMP8qduvpNMxDFGIdEJPezXASLjNh//JjnajKfrgMuaQgYhPEdHnXgT/c3rzv+HrICMbXE8
	SI3rA4CncXTNPguyDHwLMvjpCMwlcE/NEqdqQZsS+sOQIwtU0Q7+kAZCIuyOIxCW3llqSfzf/WzFT
	iMY8NbNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3boo-0000000G0zL-2VE1;
	Sat, 12 Apr 2025 14:26:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bg5-0000000FzyZ-14dP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I+tqpzcvIfMSvkwfj4Wt8zWvm38OZPWN5QBKZwmvXH4=; b=ZXhZqFZmvU0DA71lAdEBfkv6Yg
	Hh/Fquh2A1e+7EN4Hbk9iRdkk+LZHdbA+VlQ+aXRndwFXblwb+lxR+2jvDEZGhq4uY/AhBF6d1sLz
	Pxql//PL0H41zCovGuDT+YtKT7xzSF4/BadgJAGFxHHj2hLm9MrD3z4GAjXYiqXO/gKwKHOYk8xDT
	v2rSHrOlRW6Ms/3onSGO2WW5f56TQ1ZiVy1RJEk6mcxI0/6CzOIdYKS7lgYVX3tlmDGj480jTIyDl
	rzhcrOndRejBBotBIK1oPAMBSQac+txe5BHlRWLWCgQ0egCJD5UM9b53NO9Cw6QxdrH3bR5uCIyuB
	alE2+VeA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50618 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bg0-0004cU-2d;
	Sat, 12 Apr 2025 15:17:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bfP-000Elx-JE; Sat, 12 Apr 2025 15:17:07 +0100
In-Reply-To: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/4] net: stmmac: anarion: use stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bfP-000Elx-JE@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:17:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071749_293503_95C7F02F 
X-CRM114-Status: GOOD (  10.28  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 941ea724c643..8bbedf32d512 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -111,10 +111,9 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->init = anarion_gmac_init;
 	plat_dat->exit = anarion_gmac_exit;
-	anarion_gmac_init(pdev, gmac);
 	plat_dat->bsp_priv = gmac;
 
-	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	return stmmac_pltfr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id anarion_dwmac_match[] = {
-- 
2.30.2


