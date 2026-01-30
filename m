Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625AEE6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XkZOk7FqUkLdlqp2VaiHJPS5cbES3nLzbHstV3AGmGc=; b=HcBTXZiSgnUtnIso8c/ldBPTkJ
	NqqrJkTUbwaNTfTy/C3nUzjSkdOfUPtEMXTqQRKMhDMMG9s/wr/SmeDToi8SLENx4NZ+NSl7GPjlF
	5KQrNzcNkTFkoqfs23VHx2izhp16ZGH6XFD1+Xw9+Cu9I7i/BmQwM6YENGOHYFTIl1YLknzlMq0u0
	7DTk4m9Qcsp/y+ROSBOoX8qvVXSPgXWwVBKn9XZQAns35v8UeaZWZuduatevs/3CC92mOzp3qrQOs
	CojgK6pPStQVjKXHkusPoOfCZ2UctalDp0K7chgIO0i+ZVimAyhOkhPn3S5HS3Di9/ZQDkg8akRIm
	L2YdtyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlujs-00000001uke-1WzK;
	Fri, 30 Jan 2026 20:05:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlujp-00000001ukI-3OXA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XkZOk7FqUkLdlqp2VaiHJPS5cbES3nLzbHstV3AGmGc=; b=RF6+jDvsep//mrz7LBk9SpZ0TI
	z2g/rs+QEsbyulobRblX3QGeUrKHDwrdKLvRrPIiS4ReOXKvvzi2BemIO5SKccuncQZXXlHuunvaV
	+3uV33J40n5CgEQCqOdaSKURuiyxMPnIAsnQJiyWJwZV9S6fpheOqNmMxO9+Cbm9K7AGTtsN1QPsU
	qqYnazJnI8qALiU0qWCxSDtKMYeIbMV2E67Qduw0O4bolUOPtYQSLgG9RygNCwH1pT7RlfFJw5ry/
	orqcxB6H559vtz+e/eZZBcKmg9j4TzeOAwO6YPjRUPpXvwIGriY9XJMSeo0D3yqxciAWQwvuyBN2F
	5mCsG+uA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40108 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vluji-000000001Ox-3M4H;
	Fri, 30 Jan 2026 20:04:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vlujh-00000007Hkw-2p6r;
	Fri, 30 Jan 2026 20:04:57 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Marek Vasut <marex@nabladev.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: stmmac: fix stm32 (and potentially others) resume
 regression
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vlujh-00000007Hkw-2p6r@rmk-PC.armlinux.org.uk>
Date: Fri, 30 Jan 2026 20:04:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_120505_873359_304916F3 
X-CRM114-Status: GOOD (  11.65  )
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

Marek reported that suspending stm32 causes the following errors when
the interface is administratively down:

	$ echo devices > /sys/power/pm_test
	$ echo mem > /sys/power/state
	...
	ck_ker_eth2stp already disabled
	...
	ck_ker_eth2stp already unprepared
	...

On suspend, stm32 starts the eth2stp clock in its suspend method, and
stops it in the resume method. This is because the blamed commit omits
the call to the platform glue ->suspend() method, but does make the
call to the platform glue ->resume() method.

This problem affects all other converted drivers as well - e.g. looking
at the PCIe drivers, pci_save_state() will not be called, but
pci_restore_state() will be. Similar issues affect all other drivers.

Fix this by always calling the ->suspend() method, even when the network
interface is down. This fixes all the conversions to the platform glue
->suspend() and ->resume() methods.

Link: https://lore.kernel.org/r/20260114081809.12758-1-marex@nabladev.com
Fixes: 07bbbfe7addf ("net: stmmac: add suspend()/resume() platform ops")
Reported-by: Marek Vasut <marex@nabladev.com>
Tested-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f42843cd9ed..a379221b96a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8042,7 +8042,7 @@ int stmmac_suspend(struct device *dev)
 	u32 chan;
 
 	if (!ndev || !netif_running(ndev))
-		return 0;
+		goto suspend_bsp;
 
 	mutex_lock(&priv->lock);
 
@@ -8082,6 +8082,7 @@ int stmmac_suspend(struct device *dev)
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
 
+suspend_bsp:
 	if (priv->plat->suspend)
 		return priv->plat->suspend(dev, priv->plat->bsp_priv);
 
-- 
2.47.3


