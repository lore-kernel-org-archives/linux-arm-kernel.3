Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C86FB518C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed7IJ5GSBXEYvfVGQN3rSQE0J19697RZGgHvSAagUwg=; b=lB5oyG5A3aYW4qih7uvcNUJDN2
	ui368NY38l5yJ5e46IcgcaKA0y37UBg0gWgCEbp3M2akVWVtZq115+aMCONuWbGs0HJf3IaXZUVJm
	Fej5sL28sV5YX/lJN3g7GXV6La7gbK+UEXAwSSmx2MryigognqFy80R+cjKIexEMQiZkxy8GUkL+F
	E62M33++dCN7DuJHn+H7FPo2fhGZ6CSwrNyZ//ZIG+Q0Oy/2Y3Wq2NPx4Xn8/OJbDX189fLsD3MpL
	5/RAaxEwmmtGLgdSnmU+cBkmM/GL4FNij513RPqX3RzUCx0NixokX7Po0cAE3Qo9h1ikv3TkisJkj
	VhOLr0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCM-00000008bmV-025b;
	Wed, 08 Apr 2026 09:27:46 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPCJ-00000008bin-3416
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ed7IJ5GSBXEYvfVGQN3rSQE0J19697RZGgHvSAagUwg=; b=eLYN5hjGogoHiOmFImFRlYgYhI
	gWL4oUX5KiyAxcvm3HY91IWYJDRO1TmqUl+Uh0G8yFcB3J0BEHR1h3PcI+Eba6CTtPCathDQLDFPO
	OYb1y926ZCokPdP6mJADhAWFaiUdCRFd1gxEajOxE55NhumnfNf11g3T9Q+CT3D/toZgsyAj2FTZP
	c7LuDKVN/9NxKrLzD89y1UWwKSQNtlqR4VvwPxfcZrt1TyB9+O7qiDiHhm+XlRfouwDr+ElSYZsUB
	p4SJWGt61fQsmq0OlYVhyBc57rZqpH0dav7lXKSBPuuScBTwSU8MReAMCl1JOxoRxoXzn5Ep8h6AU
	WDdF0VVw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43578 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPBw-0000000023h-1TcH;
	Wed, 08 Apr 2026 10:27:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPBl-0000000F7kT-3kSP;
	Wed, 08 Apr 2026 10:27:09 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 06/10] net: stmmac: dche is only for GMAC4 cores
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPBl-0000000F7kT-3kSP@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:09 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022743_785717_B3842B4F 
X-CRM114-Status: GOOD (  11.42  )
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

dma_cfg->dche is only read by dwmac4_dma_init(), which is only called
for the DWMAC_CORE_GMAC4 core type. Rather than having a bare IP
version check that can match any core type, make this conditional on
DWMAC_CORE_GMAC4 to make it clear that it's a GMAC4 feature.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 295d31d7b28b..e47321119c83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7895,9 +7895,10 @@ static int __stmmac_dvr_probe(struct device *device,
 	if (ret)
 		goto error_hw_init;
 
-	/* Only DWMAC core version 5.20 onwards supports HW descriptor prefetch.
+	/* Only DWMAC4 core version 5.20 onwards support HW descriptor prefetch.
 	 */
-	if (priv->snpsver < DWMAC_CORE_5_20)
+	if (priv->plat->core_type != DWMAC_CORE_GMAC4 ||
+	    priv->snpsver < DWMAC_CORE_5_20)
 		priv->plat->dma_cfg->dche = false;
 
 	stmmac_check_ether_addr(priv);
-- 
2.47.3


