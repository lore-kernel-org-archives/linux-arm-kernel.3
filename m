Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6779AE83EF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQDOqk69HI1vcR0dQ45xOWUsSFumPXVuhCIx/0CuDnw=; b=Bahwh2vBLEt1YgqDBMxYrBQiK5
	Nh/wrz0QouVxTcUeGD3cKHcX/hbLA4vn1+IbOHtvzlDOl8ikaSWbO7DB84S4x67UWaOHx0AFUd4P5
	GmEPYxjXo773H6wtmNdDAOZ0K21j3X6nx+I+DstbeS8e76HDbooSAYrdPTY4lf2EwurPU+qlBff1W
	rsuEvoq5FewjRVy4ZH5v5Psnj6C5ybRxEoJHSZSrLR0i0sRYPpDmGnGgMnEW6HAV+vAbS20Pz4/fL
	R0No7xYlPoIdb9hDP/FBsVQYTLIOJ0c7Zrgt1He9xOvJ+Yn/sGvVr8dJsCSucNqgv/KZ1kgqBzLo1
	L0VcLTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYy6-00000008BEv-1cXA;
	Wed, 04 Feb 2026 09:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYy5-00000008BDn-28SS;
	Wed, 04 Feb 2026 09:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=dQDOqk69HI1vcR0dQ45xOWUsSFumPXVuhCIx/0CuDnw=; b=chtqTEQMyBwxrQposNbTp5epHo
	MoqK4x/gFBqZgOZLcptPAPSX8EA/p9/6ybDCgdte4nW7WSYkpXmOHq7pfmVxN/udzLIlmrPTpnzOf
	Tqg/Mh3MSP41u7iHgfIcpuGl9jbwtEtHQAHJBLyzJXVuweNfRWhRkkm5f+LVvK3brafkiZybk08Yx
	qUVyNyQBHTbb9MFEoUkJzyCXatq3Sh+k6q9vQ0EpEpchDC3JUoEf/06XLscx0FzHn2iSMPM+LJtAu
	r15m3LAcn7ndSCVqP68+jth2XS7x8/xIbFZWI61jKxQ62KdBe7WTj1/bVNzJgffXEyQCLAW3bcHKQ
	wSLLmdLg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYy2-00000000C4c-39Ds;
	Wed, 04 Feb 2026 09:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQDOqk69HI1vcR0dQ45xOWUsSFumPXVuhCIx/0CuDnw=; b=NRXMiJXX0Z2YNVkVvOCWcpRNE6
	OLTgacUVLdBrDwHFQvAgjmuLhSuWIPCGFlXcn4M6X6lWkImwXVCZpENHDT47u7OJB07M5Ykt42aqs
	dO7x6QwV95J2RFnJnLQIinsZnRIdaipbAO9BrFwY/e6hZulTJh7xAEQXFb7C9fa+Dlo43ooAXt/Db
	zbdJFHlLAxDb1kKkND6081ZeR6Oo25eVsh9dVBEBeT7SPx77LugQ8OZPeXlX3MtdqFMCWMwOUdeGQ
	KIHpkvUItYIFZPyTdGXzVY+lNxQZ1N2HoHW+FKpm2yLhl8iJE/CHXA+8NSN9buqbqvoF+zT2hUWdZ
	dg0ba+2Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38686 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnYxw-0000000066s-47HJ;
	Wed, 04 Feb 2026 09:14:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnYxw-00000007hox-0DqH;
	Wed, 04 Feb 2026 09:14:28 +0000
In-Reply-To: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/6] net: stmmac: rk: rk3328: gmac2phy only supports
 RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnYxw-00000007hox-0DqH@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 09:14:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_091434_970503_DC026BF5 
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

As detailed in a previous commit ("net: stmmac: rk: convert rk3328 to
use bsp_priv->id") rk3328 gmac2phy only supports RMII, whereas gmac2io
supports both RMII and RGMII. Clear supports_rgmii for gmac2phy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 25ad8600e9e2..8dd2122fd9b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -465,6 +465,7 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	case 1: /* gmac2phy */
 		bsp_priv->gmac_grf_reg = RK3328_GRF_MAC_CON2;
 		bsp_priv->clock_grf_reg = RK3328_GRF_MAC_CON2;
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	default:
-- 
2.47.3


