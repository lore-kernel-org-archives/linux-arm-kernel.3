Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A49C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDOJjloH2trDjnCVarjV86T+ZpZnVfpEtrSMCzlD+kA=; b=SzbzUQBE59jLQTzjepr4eWIFFy
	Or5rxu8VmWE0INBUEv/BbMNnIlShCjoFIEQT6FYXDQZlgrnO8hBXQSRZwCEldGVxrm7awEr+FOKoP
	ltAW/bncnUQqK1/PNJqJb4gF5cIMQLn42XyvhmEuj5MCkbts8mZeMjllFgLHN/8+B0okVSM+Zzlnd
	wZ/KyVkEuTIhTWX/IbFxCBwNF0gmJhyVVr2ni0F8USDBk9u+nktSrtkfU0jhwbxSSxGF9b0a4FhF5
	zVPtVEz9JNAfoetZNvnvXO88crDtZ3L5+V6BqkAPYVnKIUfWIVuJ9Kv1X6QTGlc3ktKWmj0qRWvZM
	X+WD9+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9ZO-0000000Ezw8-49dG;
	Fri, 14 Mar 2025 18:15:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9NK-0000000EyKW-1ZQD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UDOJjloH2trDjnCVarjV86T+ZpZnVfpEtrSMCzlD+kA=; b=JAZJLt2Bk+mCE5pzgJhw/WLTXD
	CKl31JUUTk9vXSOy6ZSf7piVnoSGcjCKdoxRk1cqt2y1DgjIHIv09YaYhFinNO4NmkswZa5D3eN2N
	n/Nt+j10MZA2jy3m2ReoFGESyXhh/D6aDttdwWa//k4ydrZt9jZRrR1+AJogjy7AboqU+ZC4Y4FpH
	bL7UsyotmH2rBVSpzamtF4b1D6yBFfuflj28SKNEr+7gTxyiP/oFXPtNMu6i8kxGxcbwhZNJ8Q+t1
	SVlLSoEOPUgzYF+iPvC9hd9hXyGpPMvSlcoq5wux0aG53l3tLOF091XUWDalkGqpUmPW7b4hKjFAU
	Nf+4vGcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40120 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tt9N5-0000fN-2v;
	Fri, 14 Mar 2025 18:02:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tt9Ml-006xIA-EF; Fri, 14 Mar 2025 18:02:39 +0000
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
Subject: [PATCH net-next] net: stmmac: remove redundant racy tear-down in
 stmmac_dvr_remove()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tt9Ml-006xIA-EF@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Mar 2025 18:02:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_110314_699192_571CC365 
X-CRM114-Status: UNSURE (   8.51  )
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

While the network device is registered, it is published to userspace,
and thus userspace can change its state. This means calling
functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
racy.

Moreover, unregister_netdev() will unpublish the network device, and
then if appropriate call the .ndo_stop() method, which is
stmmac_release(). This will first call phylink_stop() which will
synchronously take the link down, resulting in stmmac_mac_link_down()
and stmmac_mac_set(, false) being called.

stmmac_release() will also call stmmac_stop_all_dma().

Consequently, neither of these two functions need to called prior
to unregister_netdev() as that will safely call paths that will
result in this work being done if necessary.

Remove these redundant racy calls.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa1d7d3a2f43..c2ee6c0af3fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7768,8 +7768,6 @@ void stmmac_dvr_remove(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 
-	stmmac_stop_all_dma(priv);
-	stmmac_mac_set(priv, priv->ioaddr, false);
 	unregister_netdev(ndev);
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.30.2


