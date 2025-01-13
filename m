Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2C9E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Icf5ryCIJcF20+mRtB38lPc5k3RjJWwfbRKAYFqi0WI=; b=kRajLUnYRH21sW2Vq4MiORxI/O
	kQrHLkbQjiijLFQFWCJRdJOvyiJJC/Sxs2XwCZBT8ctS6oK2bzv4vn2bC82WalKLxZ7XKAGL1FV/u
	UaB/C/vxWfseIM7HVnNztbXFlwt3Wi0me5ZeH1ZINM+I4682y9mT0KOrlfHd4VeZ2B+0te6HqBLsM
	loclxi2QDvcooj3FX+WHZ3wT/HMO59X7xRnpKK49SiArAW2ihOvT7hWQS6BR76Zhv9UnduFbM3Si5
	OGFhlPCFTKuxW8wFkWCypHxcA0FabQU08st0xj2M96Koelqdq/2HfW6q029vP/zWHXuJEFe6/dMo6
	ksVEorrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ5b-000000050yi-1ZmG;
	Mon, 13 Jan 2025 11:58:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIu7-00000004ypi-0OPL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Icf5ryCIJcF20+mRtB38lPc5k3RjJWwfbRKAYFqi0WI=; b=CLIuNbxFGCKkV5AyGiPGpfX0qt
	CZ0/7NdHsZ09sRDrsLpbtoTyxVUD2jfzkZb+laaei7Iip6Rf+22dD1VE8/WKEaMicd3R0AsJkm9sG
	BMriQ5zO02Zd/6bWt+BK8b1LwCd1cGWFmZnpqnINQoKDmI+UlB1yurUmbJ6SpMohG1vSx7cIZRhMd
	FOdfSnFKSdILVaTtCTIQDeBdssaBaXxoI0tFL9XU+G4geaXQ3Lhy/N7I4IuvpovyTtXuL5pmb46FL
	P/sgHslnKCeWeoxzIB/HzZEaN38dX9f6jFo8eWrou8sHw6XxzTCziaoke/KPNYeFVP6T5xlkXd4tl
	XB33yW3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38268 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXIu0-0006X5-02;
	Mon, 13 Jan 2025 11:46:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItg-000MBg-TW; Mon, 13 Jan 2025 11:46:20 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 9/9] net: stmmac: restart LPI timer after cleaning
 transmit descriptors
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItg-000MBg-TW@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034647_126745_81A07E85 
X-CRM114-Status: GOOD (  12.44  )
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

Fix a bug in the LPI handling, where it is possible to immediately
enter LPI mode after cleaning the transmit descriptors when all queues
are empty rather than waiting for the LPI timeout to expire.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 72f270013086..acd6994c1764 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2795,7 +2795,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 	}
 
 	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode)
-		stmmac_try_to_start_sw_lpi(priv);
+		stmmac_restart_sw_lpi_timer(priv);
 
 	/* We still have pending packets, let's call for a new scheduling */
 	if (tx_q->dirty_tx != tx_q->cur_tx)
-- 
2.30.2


