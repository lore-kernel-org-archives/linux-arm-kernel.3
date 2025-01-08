Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edAKNe3zhY2EotSduckpqmoyr3Ch4JP4aX8L24TkpuU=; b=IXh94sosCMXGzCxYMtLH/aVpbl
	5vtnFWACRBve8FhluG2TeHPmJQD0zJimfDAaErvXjNi4+XDV51ClHcECe0/HQkkN1kJtfF2Y/NEyn
	gGb0ddqfqTaxkiE1XSN6dlc/POjLxMgC+WLFfNPQ5oswvatAv15HIZfbQdQ/4yzwNmoZBAFvk5WGE
	aQDNprFqz1XnGZOo0awyQgmAeUcIELgyf2jCBKVUybLto0p1QQw0ARke3MlHrXASHuSYXlv813MuN
	a0sWXrtZvLZXfMx1OoQLRKaRckns9d4rzzckjzDQF0W4rtVK4PqH2sr47rAyNwc4HEx3UvctpgM29
	IxrhOcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZZb-00000009KT7-3KzO;
	Wed, 08 Jan 2025 17:10:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZEU-00000009Fp9-3Z0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=edAKNe3zhY2EotSduckpqmoyr3Ch4JP4aX8L24TkpuU=; b=wh0rOs6VodcPE/oNn8K7DaqVJA
	yHCRzwyB380dpeeUuZKZ5SxXtXKHpOmbSWUv0MTEEJWgHFXnliwerwP5UgddrTl/0JoFyDFMtcNyh
	lcSoEVhWy7uWZRDYRRIv8bogeu7Uzl/ErjURnV4jQDVN5ipzMhOssT6SY/itwhai+Bto7hGjYYa7z
	4ed8/+Cd32iD597/lzdV6AqMf0w8XDEi2tdogzfFbMadaoLsOri1OkM+SBZvZxmOYgnjvbhaozzmu
	lpeXXY+LKL7XsQyTqo0LHyUnIXAt7DITiwlN3peVaoCfF4a9uH/Eg0sBjK9CsPOgJKJW115umr7zT
	YK0qGofw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46334 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVZEP-0000wX-2I;
	Wed, 08 Jan 2025 16:48:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVZE6-0002KY-Nx; Wed, 08 Jan 2025 16:48:14 +0000
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
Subject: [PATCH net-next v4 09/18] net: stmmac: report EEE error statistics if
 EEE is supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVZE6-0002KY-Nx@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:48:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_084838_885980_1225ED31 
X-CRM114-Status: GOOD (  12.69  )
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

Report the number of EEE error statistics in the xstats even when EEE
is not enabled in hardware, but is supported. The PHY maintains this
counter even when EEE is not enabled.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 693f59c3c47a..918a32f8fda8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -654,7 +654,7 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 					     (*(u32 *)p);
 			}
 		}
-		if (priv->eee_enabled) {
+		if (priv->dma_cap.eee) {
 			int val = phylink_get_eee_err(priv->phylink);
 			if (val)
 				priv->xstats.phy_eee_wakeup_error_n = val;
-- 
2.30.2


