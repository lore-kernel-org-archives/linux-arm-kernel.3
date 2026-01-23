Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB2ED72372
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKPoQXhWfefa9IPSBp4S1aiNYPNqA4mtfO1M9qWfnGI=; b=CIfF4j+waBKHIAhcBaCyAnktw8
	5f7Gcb65hN/04oqB/n7Lfm/PiwomoNKt1PnVErE05M3e7eJagnVFaAq1QeJ5k88xDMynHKYUJsrpo
	63J5myxvy+J0/1rgwYpVTiFhDs0oGjlaQcK6XIVHaw6kVupjoynNX+URiSUIWCZ4hAwuLvhy7c+fb
	OKlkVSxDO4DrsbSYAF5aw+/fuvwJ096axIhS0dpvBad2avLCfthTmYgJhtPTbhRQtQQoZ/H/AXgKI
	IrxLjclS6w1BSsnjqMdDcOcQUuK2BxAvN3wg4XAw77tD7UZp8roCrrbArF8A7+RPh6S+R1u92pKRL
	scWI3jqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEww-00000008nsr-0x0l;
	Fri, 23 Jan 2026 11:03:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEwu-00000008nrg-2gi1;
	Fri, 23 Jan 2026 11:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=vKPoQXhWfefa9IPSBp4S1aiNYPNqA4mtfO1M9qWfnGI=; b=FuITWitU9MblYbP79oM9V3HPh1
	2yjEuv9ATg2Eg2Phv/N+45XajKFdQF5wOon4YeX+wpWmxbbCcLv7i6eC7mwRMW6uxT0ZVhXdWvzxq
	BXkyhWUmtZilpP8ehN1jO3MObzs7+0UFdxB18GWF1tLhU23EP90wlARJXpWdhbjJzLKBAQGfTeMeJ
	DXVhzzDxYsRTm5dLumUNYxk9KarxprheOULA6/kVfOqfVxl1J2nw8wc1Yr0CqB+RNWoelhk2D9CVz
	sd8twn5pUmeDORXm1yizVYgEe29HlnMaIEFVNn4iAJ7qeWUr6+W6RWQhA+hSOmnvkc3jdc6LH/y7z
	86fu2CjQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEwr-00000002Doh-3F0U;
	Fri, 23 Jan 2026 11:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vKPoQXhWfefa9IPSBp4S1aiNYPNqA4mtfO1M9qWfnGI=; b=jzXzvd4oy+Oto9JPQ/6smm2e10
	YJU4aI0bjlsqn7CnubxDodAlRZLkwhnUNWyG9wB3GHsHj24PlSLfkhkr/6s7deBLXkA0/FnD01phz
	5ncbJTU2/9LxEdirELnVp1WCOZdJPW9wphaayiJdKqKDcfsiYSZlp+tOk+e/94SyanNJMHJTNxG15
	1+usqXZWUU7SKfuuXLb7YnooCzQf8m7QFE5dV2O9NWIb8VkOgcLRQY5WsUqylUcneMfLL6+NEdQM/
	OzppGFzImmMBx6nSTzJXAB0nPNahUbXdxI8hvZFbUbul+lDz4Fc+EvqqEKy+v5ygeyn2He1LD6qKm
	uKiSTn8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42308 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEvP-000000001re-2b4b;
	Fri, 23 Jan 2026 11:01:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEvK-00000005ghP-3lCt;
	Fri, 23 Jan 2026 11:01:54 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 19/21] net: stmmac: rk: rk3528: gmac0 only supports
 RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEvK-00000005ghP-3lCt@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110329_922460_507918B0 
X-CRM114-Status: UNSURE (   8.08  )
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

RK3528 gmac0 dtsi contains:

                gmac0: ethernet@ffbd0000 {
                        phy-handle = <&rmii0_phy>;
                        phy-mode = "rmii";

                        mdio0: mdio {
                                rmii0_phy: ethernet-phy@2 {
                                        phy-is-integrated;
                                };
                        };
                };

This follows the same pattern as rk3328, where this gmac instance
only supports RMII. Disable RGMII in phylink's supported_interfaces
mask for this gmac instance.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 109ed62fb04c..d99e77211b95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -715,6 +715,7 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 	case 0:
 		bsp_priv->clock_grf_reg = RK3528_VO_GRF_GMAC_CON;
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(3);
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	case 1:
-- 
2.47.3


