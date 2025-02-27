Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF71DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPPe8F/kupJbrBWpX7qUs66Zlmo1bs9+FraXeKyQyco=; b=Yu8i1Id5AFtiIWX39vl29/8gKH
	S8bCiCKRn7pJkqErdox4OwS7ZjKjVEZ5CoS4ZKJe/tsp4yifKhW0wF8h8XbA3W9hqt3XF/yZ9Wl48
	+Ii04fXDjZrugnIawnwJLTim9pGzhjMJ63/75FE8V8N8ETY0qVrjBeyCEykeI67PJwbM2+ABa51hM
	DDeQZIG8nuSiAhYgT2s7HMn0TFcssel2HxsSL2gViibZoGnEmkqyMlouudOfvNYCQOb4+3qlOahlf
	jt0Ao6BrH/jHyycICnp95qVKmjip65NVpNX0WszoQyUmEO8Hcl7xn9ZiZh96Z2VR4zGirChmo6Bpo
	DV/prv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh2-00000008Teq-1z6E;
	Thu, 27 Feb 2025 19:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf25-00000007lsc-0E5n
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=XPPe8F/kupJbrBWpX7qUs66Zlmo1bs9+FraXeKyQyco=; b=DnvytP/II7m/YbKivnrJoyedjb
	hG4Q/24lbdcleWO72Bc0tpVGhrEcg7XgnebVl3fdYXH2TyvOEM/FasRHh3ArgtQvbxPD2yNBwY2vS
	Ov7gAkycINC+2XEjzf48XouQ6SkwSrGrL29BwMoSgmumCD7Ft+xefLNeHXsm77BioHhT+C3naFjMm
	lSmaDLZMzqommO1ZY4ocW0gGQ2YhnruyORgiU2Jsd9Ie59Lbz5X08ANvqLzvWkTj0cNY71OWIcVcd
	nUAiZQdN0MSk5GONEaU77XIJ0OTRiGdlCS7LQFiDmbp8xi4m/Oq6+bKhvS5Art4vSZlee4O5obHd2
	bGFTgkow==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf22-00000003oSY-1adi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XPPe8F/kupJbrBWpX7qUs66Zlmo1bs9+FraXeKyQyco=; b=aaqrA2+F9wnO1h7yRYzc1K+zoo
	xJ+zo2rKVmWGetuvstVl5xucg/VFXhs1ziaNR/xaaYeihJsZM/JbmeZMDv82jnQUxnmdgUr3FekvW
	CKCdsHzO35xKnRPXaKd+4qB/BNPJZ4iAAN9CKcJ2Aa/p+Dn/aE56bTHk33ElCYxMpzHhKlvhzIpDe
	p4V6YzAjjy1okzORaVKKGwe7DB6yqTmvSCa1d69SWqo4HXaDMDMo9ccqzCg8OQmWP6QgEtsZmg6T7
	TSCPwepsC7gTF9eU8VOgmvDNKBLoXbQkc7Ghf7hlQ/4dC0Ot/GILsUL7lI5HXdp5loxGU3JTnKpWc
	3lHTOtEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35858 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tnf1x-0007RQ-16;
	Thu, 27 Feb 2025 14:38:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tnf1c-0056LO-DN; Thu, 27 Feb 2025 14:38:08 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 5/5] net: stmmac: fix resume when media is in
 low-power mode
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tnf1c-0056LO-DN@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:38:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143834_465758_8FD84D89 
X-CRM114-Status: UNSURE (   9.57  )
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

The Synopsys Designwavre GMAC core databook requires all clocks to be
active in order to complete software reset.

This means if the PHY receive clock has been stopped due to the media
being in EEE low-power state, and the PHY being permitted to stop its
clock, then software reset will not complete.

Phylink now provides a way to work around this by calling
phylink_prepare_resume() before attempting to issue a reset. This will
prepare any attached PHY by disabling its permission to stop the clock.
phylink_resume() will restore the receive clock stop setting according
to the configuration passed from the netdev driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 23c610f7c779..13796b1c8d7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7925,6 +7925,8 @@ int stmmac_resume(struct device *dev)
 	}
 
 	rtnl_lock();
+	phylink_prepare_resume(priv->phylink);
+
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
-- 
2.30.2


