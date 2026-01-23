Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE8D72372
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aoDVUOCqwLVnz3BQv+D4wGUjVEl5XwK7AN4lIMmUvA=; b=K5mZAFB1YJQKW7K/yOB/Msh9Hd
	rfb4TYLzEc5e/vpUqIVQQUjp5xq0NO1syeX2aPSFlS0JWpctl1gFJT8eQHDt9R41lS/G04bGpaT2E
	/12sgaZ1BM+CRyMHi98/uDfOGrX2c4fHPuJKpSiwAM3n3GoICTrbJz3fquWBHAIa2yOpUEVHlbfK3
	G4PSemzh+LdzSgNtOfA87iv4vcazsgXc8jHVd4roup71HAyX3nLu3pTa2FjH00S9YneXcXbil5P5T
	POviVcf7mumbpiL1eeJpSXUuqsnnH1SQHJsUT1A5/rZgNfTyJVUpa+mCAIqAJ+BoGyDB9fj26MiWD
	U9RU1Okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEuz-00000008mIl-08Yx;
	Fri, 23 Jan 2026 11:01:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEuq-00000008m9d-2wAJ;
	Fri, 23 Jan 2026 11:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=6aoDVUOCqwLVnz3BQv+D4wGUjVEl5XwK7AN4lIMmUvA=; b=SHFw7MlYxqhuqumIkI67Mcm5Iy
	shI0JacMTQMU1ARp7vAGBmwSNn6yCntOWxgyMDpzPtHG364+2X+1Lep+eJZ/RENIBbVLbsDSJBLFa
	MytOQDF/ruQot+teUYytxZ0P/xMA4BdlsyQ7wBlrC5qbEQbPuRHdRCFEqlrq5TY/f+4G5JLRAyc3o
	9jZpWp+SnHzLfwfLTkTmQMMUGdpPVwkWsC2pm5IU2LdE2zt6UV5dLD+fPlE2FEixpGH9c3pilMegQ
	xCrQqlRR6KJEBZd4pMNHV7p9ivo9KReC7IBgY6cAyHukKJ07tKUjlQEnI6s2ScPIHDtKBSFL/8SK0
	+T08DoPw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEun-00000002DOd-0Eoq;
	Fri, 23 Jan 2026 11:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6aoDVUOCqwLVnz3BQv+D4wGUjVEl5XwK7AN4lIMmUvA=; b=IAJVjFLSic4qffIhUsi6/u2ON1
	u0nlWZE1FCYZTBOgAsm7Isw6NBNRYSxGpYw0YbPqoFGAOWIwlwYcRexYiBByccoRi9gnEj6GBXmZ0
	JN6MnJ3Lcxpi0Nt4W/14jY4aDNkwjmvq0F32Ij3fh1gZfzJ4g3/8N3+rnsDSSgxijWeAzWS/ElCb4
	0NNbcRgoWu8gdmhXpugbW5KKttFU2SljlxpHZkOfrd6sOmFp74Kv4Jq4UkFvZhj53RioTd+HoNuTm
	g0F6060FXkEODmPtwkC2Ey/R8VYAa5DstCjrPgJGC9Ypvr2CItn+7DzQ5fy7F0MRh+Lu6jwyfbYZ6
	tIknaSJg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42128 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEud-000000001p4-3k5L;
	Fri, 23 Jan 2026 11:01:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEua-00000005ggW-3NuQ;
	Fri, 23 Jan 2026 11:01:08 +0000
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
Subject: [PATCH net-next 10/21] net: stmmac: rk: remove rk3528 RMII clock
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEua-00000005ggW-3NuQ@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:08 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110121_236729_F85F7ECD 
X-CRM114-Status: UNSURE (   9.29  )
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
index 4f32e4b3769c..f2b7917b6a30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -990,8 +990,7 @@ static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
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


