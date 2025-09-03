Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C86CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC/No0ng9OP1QG5vP36eN7zONL2hjkecSyux6oN6Bvo=; b=CjsIovhDM5/zfD58ZFeNklTruD
	ySeroHxj+QR8LvOIT3mkCAyB+WgZe565q5AqrX6brKusJH8SPLKn597MbzWajuv4s6rZ+vRSeJzGw
	gEkjL8s0I7SNGqEzi2E149syJk9OyDFaU1PhV3Mnt72hTyMSKoNk37Ae8YI/UfybhzJ7yNRifnwv7
	erJrmpXqd1jHSM5hDDR8zpr5FL2Gcav4MorprfZKAG9aydIdc1y0j7N629ku/TDCyqolxnMaODSoN
	Gg5wuiu3s1Rr86ZGNicIwZgJcyEgekvhGAGQvnWLhGxk6lSN02lqNjT2qlUSQyWkZryr+xIVss1a2
	4ITgKozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomp-00000006luw-2a7a;
	Wed, 03 Sep 2025 14:48:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmmZ-00000006QDu-2qrf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mC/No0ng9OP1QG5vP36eN7zONL2hjkecSyux6oN6Bvo=; b=Y0/DOkBIui9ksiL/p/TosmKYfs
	X+YHLbv9Y4GWYyn2QXK9/dI1r9Nbb7c5kuPqxILWc497lw4hpdKtzkEp/QKNJvjr70nT02i1l4nOy
	4VJIiKysSUmop4QtC+8J2gfZ5q4V4onjYz5QVw7owBoCElO8/9SO502Yip0vmmMrBC3o0CD9ZRZ+M
	h52g9BHDdY+jkUnbBqTolrWzMGOXjACn2wmgcwjR03R4e/PjbyN8GLJZo5uewPg83bYeDnxyP2gMx
	4IIaUVIOiizaP7KdQk9gIuDB069PMmvkm6obRHWZRyRBRHLp09xEwYNBIfd6UFPs2NC6K3dwK8Jwn
	555A+srg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39592 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1utmmT-000000000XA-3iY0;
	Wed, 03 Sep 2025 13:40:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1utmmT-00000001s0x-0TMB;
	Wed, 03 Sep 2025 13:40:05 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 10/11] net: stmmac: mdio: remove redundant clock rate
 tests
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1utmmT-00000001s0x-0TMB@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:40:05 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_054011_725068_C3684B9B 
X-CRM114-Status: UNSURE (   9.22  )
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

The pattern:

	... if (v < A)
		...
	else if (v >= A && v < B)
		...

can be simplified to:

	... if (v < A)
		...
	else if (v < B)
		...

which makes the string of ifelse more readable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7326cf5401cc..4c1a60ce9d42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -499,19 +499,19 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 */
 	if (clk_rate < CSR_F_35M)
 		value = STMMAC_CSR_20_35M;
-	else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
+	else if (clk_rate < CSR_F_60M)
 		value = STMMAC_CSR_35_60M;
-	else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
+	else if (clk_rate < CSR_F_100M)
 		value = STMMAC_CSR_60_100M;
-	else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
+	else if (clk_rate < CSR_F_150M)
 		value = STMMAC_CSR_100_150M;
-	else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
+	else if (clk_rate < CSR_F_250M)
 		value = STMMAC_CSR_150_250M;
-	else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
+	else if (clk_rate <= CSR_F_300M)
 		value = STMMAC_CSR_250_300M;
-	else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+	else if (clk_rate < CSR_F_500M)
 		value = STMMAC_CSR_300_500M;
-	else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+	else if (clk_rate < CSR_F_800M)
 		value = STMMAC_CSR_500_800M;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-- 
2.47.2


