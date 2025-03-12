Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C1C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hNZU7Eufd1JegykKvVAxyzlCRzhTF9+s3bvb0sxIJX0=; b=2hQPrIAhr5OVTgBcNj8N6yXThh
	1seGnniysi7YWDbQ1K0Iuf1SVWmnEgEH88HUaMssCN2ZZAQZA48Zbnk4ixemaSiW1Uaxw3b9P/mB5
	HtbuYAGSF9UQ+QnX1uqKE/uYZUkOhrfj8GYEI4gDBcHbk96Bslr+t9IrwHk7eA3P1If5Z/EH3X/IS
	wrN7l9+BPFB2oyS5tmaOlL5VjdGoGr38W2N+DB0zr8DjB1DDZXD2kzaQQR+sYD2/XWcIvy2EZBaHa
	7+IE1ZHu9o5RZJIuJTCdIBAO7rZ15blpgTvjWY0rMoqsgoZCUFGwGIu7hDRch9D2yGOKLjePTHDeC
	duCtyu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsS2p-00000009Mn7-1SNR;
	Wed, 12 Mar 2025 19:47:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRzO-00000009MMZ-0ECi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hNZU7Eufd1JegykKvVAxyzlCRzhTF9+s3bvb0sxIJX0=; b=0vw3r5MrcHlD21PyA7dl1mK4Kg
	ufSmqwKJDBV7slfX+xao+ZepvMw1mX1QA4f88351Me+OPN4sePXP4CmjSE6b6psd60uCnu/kTLe1Y
	xNgFMCUgcHk8oLevRFWtxMTLDJkg18Nq3oOOk/QefBWwuDV46iJCBWgFDuHy+u1Q7KiOEWNogwLfY
	j4dXk8xqzHPdYnVOhTryc6CmsIN+atWh/8TykZ3g+kA3bakaWXEGdsW6VrXO8+o6ZgtMVmRdePNvA
	tBdCG1wWJv/T0o7DOFJz0BruOt/VpMNJzRGGunRBw5f6oxthrbCSOPULsXrILs0iqxa0Y3v+lRjsg
	2aGRjHVw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42086 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsRzG-000647-0E;
	Wed, 12 Mar 2025 19:43:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsRyv-0064nU-O9; Wed, 12 Mar 2025 19:43:09 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Joao Pinto <jpinto@synopsys.com>,
	Lars Persson <larper@axis.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: stmmac: dwc-qos-eth: use devm_kzalloc() for AXI data
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 19:43:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_124338_089892_A11DBBC7 
X-CRM114-Status: GOOD (  11.08  )
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

Everywhere else in the driver uses devm_kzalloc() when allocating the
AXI data, so there is no kfree() of this structure. However,
dwc-qos-eth uses kzalloc(), which leads to this memory being leaked.
Switch to use devm_kzalloc().

Fixes: d8256121a91a ("stmmac: adding new glue driver dwmac-dwc-qos-eth")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index bd4eb187f8c6..b5a7e05ab7a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -46,7 +46,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	u32 a_index = 0;
 
 	if (!plat_dat->axi) {
-		plat_dat->axi = kzalloc(sizeof(struct stmmac_axi), GFP_KERNEL);
+		plat_dat->axi = devm_kzalloc(&pdev->dev,
+					     sizeof(struct stmmac_axi),
+					     GFP_KERNEL);
 
 		if (!plat_dat->axi)
 			return -ENOMEM;
-- 
2.30.2


