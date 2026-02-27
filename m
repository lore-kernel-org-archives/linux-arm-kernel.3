Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEDFFD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWZWO/rxH1P6hhg+wVH0jYDJcmR/UO7DcxyCSpqX5So=; b=Uu4bp2tGG6tgnrsk1/4xzl6LOk
	008se+aOQqvCxIPhgYsrgZbXOwFWhozq55igEmf6IF77aMM62lmGIlDrqhK7f6iQRrpMlUnO0Etga
	L3xZP836Ofq+5PqSB1yj6Rb92ZUyXrbmzQ7jJkdrkB067v69N5db/ThdR8AZwYkRwZYM69X7xetIP
	vArdAjQf+cuHSxFyunWpYPOpZOUdEct8vAutCmvIfE/3nFm70hnnQkQugL6yshqQ0KtBugkX2NRPP
	KaxoSUV4RZ6EJMgUYiWTiDbhOdJFShmnmvMDDj611n2Fc7PKzUN1tzoFC3td2+NFQpnKoV92EDVdb
	t5h5nR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuY5-00000008Bee-1osk;
	Fri, 27 Feb 2026 09:54:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuY3-00000008Bau-1zEw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pWZWO/rxH1P6hhg+wVH0jYDJcmR/UO7DcxyCSpqX5So=; b=hVOjTk6BjaM4jqQUbeenetVYKU
	LEsxYqYfRXWVHF/x1j2kqdgtcDDLP98CW233+B3XnOfnoqbEi5M2tz5AzwV08a0b2Ur5jp07rfyRs
	5XtpPdHTY0Hd8WiqoZI7a4p7x9014OjE7+G4EYqbB8FdJ457T4uOnJH097JY9oTFsnJoxfL0M1Su6
	I/wvly72sg15CU+vsdOrVvSqg5IhjYLvjAYRDfJmtwFo/hLpsTNEAc/YtcTVH0LH8RD8+gu4Iqokb
	DPzvaQbKtBWkObHs1KHKxsjoZE3NzjYNR+27tdmtQKlx8Miq1gmyZ3WF2U4BFLf7wuvwq039BiuZS
	Ftqwyg2A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39334 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXn-000000000eO-17Rf;
	Fri, 27 Feb 2026 09:53:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXi-0000000AvnR-3btC;
	Fri, 27 Feb 2026 09:53:54 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 10/14] net: stmmac: make chain_mode a boolean
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXi-0000000AvnR-3btC@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015415_518490_3ECA9CAB 
X-CRM114-Status: GOOD (  13.18  )
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

priv->chain_mode is only tested for non-zero, so it can be a boolean.
Change its type to boolean, and add a comment describing this member.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 57ded8e5177f..e98cb9f3a44c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -307,8 +307,9 @@ struct stmmac_priv {
 	 *  when set, struct dma_extended_desc
 	 */
 	bool extend_desc;
+	/* chain_mode: requested descriptor mode */
+	bool chain_mode;
 	unsigned int mode;
-	unsigned int chain_mode;
 	struct kernel_hwtstamp_config tstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f74766f6e21..be144b946fd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7344,7 +7344,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	/* dwmac-sun8i only work in chain mode */
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
 		chain_mode = 1;
-	priv->chain_mode = chain_mode;
+	priv->chain_mode = !!chain_mode;
 
 	/* Initialize HW Interface */
 	ret = stmmac_hwif_init(priv);
-- 
2.47.3


