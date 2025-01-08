Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A7E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHRng+xDV3xNyaudjuVxs4GBrXTsurm2SQrnhxQx0WU=; b=qJ17RDHJxB42PJkaXm8xiEJVAA
	SS2DtQV5lH++97pa7iHGWdbrmFxI8UuAeio2gMp0pPsSFldbbr1Kk4FXBCA2ofBD/6Tb1zakFCoeB
	BvAFZtaQGhIXevyfzNSRvzqppD+vtAoxJrzYhUdIav4pv+IUrksGdyDPG9xD58pTt8CyirWKj3M9B
	Ui69ZOsZL4z5EGRPjUD1zCMn+EVIWY2ATOFpag/nivQK+0bAbtn2ymaK3w3huPfpWFvTa8+/wRnLJ
	YX8TJd+eK/iXHne5bHjpAN467S4eBlXHeq6vBqJZJlWehcu1Zab5GkqTjG+ctQ//Uy1sWJjUMQWhg
	58ZFHezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZgp-00000009M2t-3TtW;
	Wed, 08 Jan 2025 17:17:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZF1-00000009G0c-2op3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KHRng+xDV3xNyaudjuVxs4GBrXTsurm2SQrnhxQx0WU=; b=1U4lh3tbst0bBH4If+eqkR+GPC
	s5oqi7RpaPS+0JK1aap19e1RljTjQi6BbTTgor6glKtOvVExZ2tIK5ATMwYosr9oSedSSM7DrTBaO
	e8eTFhuAJgtrPYkLtoTKcI7WvosYWjqs9mbcTLFEvc0ED3+jbywTV1tfyKls9FKPXxWA1fTm3B8iX
	TQrsXNHzoSC5But6qbd+8MLt4DqdRdY1qPegPqZVHevQ2X2kPfVsn/ZZy8bSnqLXlvRuSyipIK0Mt
	Vwx5f72Ab4Cg5zawael7/ygzkegmAiR9RBxSEROxO/cnQ9Uel0AkvbhiSgkkLqDshGO73l+pzjhYr
	mawYRd6A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59554 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVZEv-0000y7-2G;
	Wed, 08 Jan 2025 16:49:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVZEb-0002L8-DJ; Wed, 08 Jan 2025 16:48:45 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v4 15/18] net: stmmac: move setup of eee_ctrl_timer
 to stmmac_dvr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVZEb-0002L8-DJ@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:48:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_084911_708443_CD58E0FA 
X-CRM114-Status: GOOD (  10.43  )
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

Move the initialisation of the EEE software timer to the probe function
as it is unnecessary to do this each time we enable software LPI.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2038dca8a02..57338794695c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -494,7 +494,6 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	}
 
 	if (priv->eee_active && !priv->eee_enabled) {
-		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
@@ -7405,6 +7404,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	INIT_WORK(&priv->service_task, stmmac_service_task);
 
+	timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
+
 	/* Override with kernel parameters if supplied XXX CRS XXX
 	 * this needs to have multiple instances
 	 */
-- 
2.30.2


