Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD90C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgHfgZdfHwr3VmPVenW/lrNRZErmyNxPVMe0JcfQ1QY=; b=iBI8aG6lkoq/t0yP6P0pX7Z5Zw
	sOsqY5T19etRh3UBva2ymWRl7lO7XmRtAUbPqFzh9g5xKl8CIafud5nkWlWH5CE+kVwnTxKAFA2PA
	1LclS+blQ1j95ck51re84hK01ZcemlO0nZTZVyx+qrhAZVw72fNrIeoCf6tJy1pcCGsmb1kT9c3r+
	NTW7knzRP6Ve2vOCX1EoSmXsUGfz95TuRLEEKfmG0ND9sO5bwAJN//XAvnno2u/DxNZ5YS4tMwsJu
	vL3cSG162AUjRv9h86jvdgciCWnkcM/4SEV+HbIGp7HpikXsElnHUGYaSC/yTnVahaPCB1ZCV3tw9
	LlcS6kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdHb-00000002oN8-1VxZ;
	Mon, 10 Mar 2025 13:35:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcIW-00000002dOk-0JiC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TgHfgZdfHwr3VmPVenW/lrNRZErmyNxPVMe0JcfQ1QY=; b=sd0N0ZqJhCRyvdz2F7y6JUxNga
	YYjzwJUZ9cqkq0SbGlyNFiafge7+hDBemsZhscFCmXF1xwYYvEfPWRXV/BDQhs09pjLdCD+RSPx6K
	AlNomXJ1j43jZ7MZzM74owHqa8ljAJeMR4wrcGjBe8GS8p1daI8lJ4YWX3yTU3mmwpR1oZ6s7Txbi
	NfEPy6XyZ8sJk4Y7Zcp72l5nEE3vCcgY7tMYGX312OnhReoFu4hzVObVgR1DcPMamiuS+bojmci8U
	gu5V3KeLNGazv8OFNPzt3wQMswQy/O0z55r/Uf4PbVtc8AKdiKtqVnXd24kRcw0K1G+WPVJYqLwoc
	zEtum9tA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51248 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trcIQ-0002e9-2Y;
	Mon, 10 Mar 2025 12:31:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trcI6-005rn8-GV; Mon, 10 Mar 2025 12:31:30 +0000
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/2] net: stmmac: remove unnecessary stmmac_mac_set()
 in stmmac_release()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trcI6-005rn8-GV@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:31:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053156_110363_7E20BB25 
X-CRM114-Status: UNSURE (   8.28  )
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

stmmac_release() calls phylink_stop() and then goes on to call
stmmac_mac_set(, false). However, phylink_stop() will call
stmmac_mac_link_down() before returning, which will do this work.
Remove this unnecessary call.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2ee6c0af3fd..839ecebf5f5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4129,9 +4129,6 @@ static int stmmac_release(struct net_device *dev)
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, &priv->dma_conf);
 
-	/* Disable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, false);
-
 	/* Powerdown Serdes if there is */
 	if (priv->plat->serdes_powerdown)
 		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);
-- 
2.30.2


