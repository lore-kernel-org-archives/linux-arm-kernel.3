Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A42C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuFYQlpiboXulQVdnqCW/1ad3TJohzHdDO8kExCfgss=; b=FxhrF3NL7dI0HcOoWSNBWqaTEV
	FNJOybN9sqJiOlpsNdIJsMwzZfytBKLujTfggX+wrDAZk8gUyKA6LjTfa5HYrBRbsAgxQIiPTcOvJ
	nhe2L6TNjEdiFJdX9mf4SvD2JFnzwVLplYcIo3BU8GJhOeWi65gYdfHbMVu2MzC/YEnbsZP8NEtUw
	+QL3VdmJb7ZBYyo6g6nU0JZlnpgw6zMBHvwr+j51JIy1OdvYYlUgxlIWAQCtDcX6NM3dv68w3IEUC
	6fFc+ZbQ7xfX2mkdG/QXH6Pz0QQO7sZdcf9S3F8UfoCqn+jupkNfmZUejGwSLeUv23N9v/upuCP8U
	sJ0smmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASoC-0000000FTqm-0GkZ;
	Thu, 01 May 2025 12:14:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMk-0000000FJTD-3KuR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vuFYQlpiboXulQVdnqCW/1ad3TJohzHdDO8kExCfgss=; b=lKtWt8kXWhnA4/k3Y+/frnORrS
	JOrP8BIAc7PoPCw7DvS2Rjlo2CNt5BGWoFoNtQHTY/jp7PhWWBJ5wP1JmLPVp8oKEbipGACerL2Ib
	4d8sW0w+l7BWElR5d7ekXHCNEeSGHkEfClq69MVtIZPmAPWDJmNBqf386RI33UvbjcOZoCQsn1T3v
	9CInpFHH9KjtxPaXsdWjmT1vbuht3oIf10nRj+SjmsHMR9rpkOqifREsm/YnPM1j8qA1zcfaCQZsR
	ob1erFbwKvTRX0cn+TK3x6uFjCzjBzQ5ZmRPfzlJX6HCgXZvmYOhvEIeNtndm8pu+nD9m4lkQUuUf
	3Q/CtabA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52288 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uASMf-00005x-1P;
	Thu, 01 May 2025 12:46:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uASM3-0021R3-2B; Thu, 01 May 2025 12:45:27 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 6/6] net: stmmac: remove speed_mode_2500() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uASM3-0021R3-2B@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:27 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044610_832596_86897C49 
X-CRM114-Status: UNSURE (   8.95  )
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

Remove the speed_mode_2500() platform method which is no longer used
or necessary, being superseded by the more flexible get_interfaces()
method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 include/linux/stmmac.h                            | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5f66f816a249..28b62bd73e23 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7736,9 +7736,6 @@ int stmmac_dvr_probe(struct device *device,
 		goto error_mdio_register;
 	}
 
-	if (priv->plat->speed_mode_2500)
-		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
-
 	ret = stmmac_pcs_setup(ndev);
 	if (ret)
 		goto error_pcs_setup;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 537bced69c46..26ddf95d23f9 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -241,7 +241,6 @@ struct plat_stmmacenet_data {
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
-	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
 	int (*mac_finish)(struct net_device *ndev,
 			  void *priv,
 			  unsigned int mode,
-- 
2.30.2


