Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2B9C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBrVJ1k5VPvOvKcaq/E5y2Tzud4Q8rsO6WAeUhiA9B0=; b=FmR2uYaG+Bo3eK7l0UOa4FmPE0
	aSoNDN+Va/FiI53u69Ijg8L+4FyB+x+FiLIvso6HQcHTtThfM9nZhC/XmV/k7/XNnRQydGtdx+CaB
	CjI2xpQN63RIUVyLmZuGbgGEAy/5D27Gz4S2vuI+Xej9O0EUq81eSb/Qprv6IgL0Fv7ylj3+eVp+0
	c/Z6iFLNIS3rYgzaOdmPWbRnqu+xz2UnzHpTiw5ahs3rF63fX7odDwbkdPwmtxDFoCapYY02DpS5c
	I0TLrXKVa18Rh0Lez3vq0BU6GFkR8tKsOZyuxO9JHxoytr2Q/Rer6kBvvJOZU3Vf148JK2Ay+oX5k
	A9SW1T3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7sX-00000004B5Y-0QB1;
	Mon, 16 Jun 2025 11:19:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6tK-000000042zh-0WTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sBrVJ1k5VPvOvKcaq/E5y2Tzud4Q8rsO6WAeUhiA9B0=; b=AKc6cc55yswjjryG8G4MMvK34b
	eWl0lmldUhPFHjvMHkyUeUpxV1owbxZMPEC6pMJB7zCK0NMN4IHkrg5rWgAAtiAsP/i+onAsGcDkN
	k4wvlGSK8XdsMWHPz8JgpokwtotT+msJohfhaNGsyL4Jq7o7vk8Cu6ZdDSCzo53rfC4O1zulylu/2
	HIqCIjXUSdIfYJMvE5iI6Vgl5nAg4K8k/Ym1MLLUdorg18CCO1S8GHzBp7Qkoa5a9gFPT9OY6uNdL
	4ndFwOxvIn9lqSbRx5zg2eiK5KA5DjL9FdPfTuy1asKiNV0xayi4tgPkCtWT8B1vs/hqbkJxJZdKK
	DAcgQuJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52678 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uR6tD-0003aS-21;
	Mon, 16 Jun 2025 11:16:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uR6sZ-004Ktt-9y; Mon, 16 Jun 2025 11:15:51 +0100
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/3] net: stmmac: rk: fix code formmating issue
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uR6sZ-004Ktt-9y@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 11:15:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_031638_160883_AE2426AB 
X-CRM114-Status: GOOD (  10.69  )
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

Fix a code formatting issue introduced in the previous series, no
space after , before "int".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 18ae12df4a85..5865a17d5fe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -904,7 +904,7 @@ static const struct rk_reg_speed_data rk3528_gmac1_reg_speed_data = {
 };
 
 static int rk3528_set_speed(struct rk_priv_data *bsp_priv,
-			    phy_interface_t interface,int speed)
+			    phy_interface_t interface, int speed)
 {
 	const struct rk_reg_speed_data *rsd;
 	unsigned int reg;
-- 
2.30.2


