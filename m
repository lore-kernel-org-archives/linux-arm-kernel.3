Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF925CF65E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpq92SQpBSOsKevcSEFEmzvauaDO2KYRB7LmM/g/sL4=; b=R7YlgYenjV+Ipe9OqGKFUWLhi0
	FPHKLxWxEy90m8GSJs/mL1C2jqiDrSgDni3abWubifBJ5EPuDh+fcwOTJY0IOIyGHtoQD5f695PH5
	9c+xO6dPantwes7Eh5Ca8yAI6baP8FqLaIf+jt+CRwBRCan813OWRC5CV6PBHqIlooyxGMcohgUFI
	pSAYwUug2oiJhQej41ubkCdw78qSaovkOM2J2l8AuUN5cpP6VTw2YdUm0BujKNOceCbmobnkHa+Vt
	3ewvRBAEAMVAnleSSaLN70qW1J8tOtnIVJQ1bWJYlBovffwee5L4phlnHi3i+P9keE7JcE9UqqfDe
	p0np3ZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2r-0000000CROw-445W;
	Mon, 26 Jan 2026 11:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2p-0000000CRMD-3wkW;
	Mon, 26 Jan 2026 11:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Tpq92SQpBSOsKevcSEFEmzvauaDO2KYRB7LmM/g/sL4=; b=lnIjbhUKcaVlqhQnw73CgoU835
	6EWeKeR5yxwGUSTeRd6MJcHzwCj6RgsifSYk9CfftKZHMq2te3vEVicRMMKVSX8pDjYTRQ3R0nErG
	P/rdciY4wmLMyIHu77qtmyKPsjzGQWbzo0cxP7ddIOxO9l4nKahkCjIfdOOyMO3O9wLAI5VbDzp8f
	+vQ51E8MrSx1i+Abnkd8tO17rbrIRSdRoPnA01IzeeiNeG+ZISh6Ahx0MBT2LMwH49lsxL4HtsK43
	frfjl9IikSjuGG8WEvO8w01PZTGPH/mKJi1V14B+JfA16oD/dHh5tI+VP5IffEk/wC/iBpW5HRWFn
	m8LaPNxA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2n-000000058bV-0ic0;
	Mon, 26 Jan 2026 11:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tpq92SQpBSOsKevcSEFEmzvauaDO2KYRB7LmM/g/sL4=; b=WHsFJ/fTfzIsq8w0tpultRDqEV
	8F9Zw4KRV+pH2KLZBPxnZXGG93KXQyCAwuQKy4gvF6jtMOY+RSGyVQhMoiqWWqbdt2XKlriPo1sM/
	qSS2qGU7fU7U8vquzQufXccL9x5twVoiNgsfEzWOAfNFLxVouLDwvdqYWe5TRMzqFKidklpLOt0pT
	mBfRvb5BRFt1FIwdXwxTx8aFw2H4tco44hcVPW29/GcK2INHin0prwHCbLaZpanaUmlOiZy26B4rn
	XRqPmVsopZoWb1RATYyy04VD5LNVQfCjgiN4QMDwT3T7sqZbJ6hE2G2qST0xsGZrJhddjx5hfa03j
	5OP57V9g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36668 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL2Z-000000004gV-0ukb;
	Mon, 26 Jan 2026 11:45:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL2Y-00000005utC-1IaJ;
	Mon, 26 Jan 2026 11:45:54 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 11/22] net: stmmac: rk: remove rk3528 RMII clock
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL2Y-00000005utC-1IaJ@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_114609_270613_0E110C84 
X-CRM114-Status: UNSURE (   9.93  )
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

There is no need to pre-initialise the rk3528 RMII clock when
selecting RMII mode on gmac0.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index baf41d15eea3..7e82b1831e5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1003,8 +1003,7 @@ static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
 			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
 	else
 		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
-			     RK3528_GMAC0_PHY_INTF_SEL_RMII |
-			     RK3528_GMAC0_CLK_RMII_DIV2);
+			     RK3528_GMAC0_PHY_INTF_SEL_RMII);
 }
 
 static const struct rk_reg_speed_data rk3528_gmac0_reg_speed_data = {
-- 
2.47.3


