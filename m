Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70DEC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOQAGaXhyO7ZB/UZi9ueA8JjP2xLmkVdgsalxBQMQE8=; b=O9PC+4iIlmHv16ASVUEaEW2RLK
	MaRq1Mo3N+sIPccCsg+P/Rv0c/HE4ogixQ8mIhDGUUaVUsQaPSDPaYRBDOnvnPJMot+L+L/NXSnxo
	IvItHCHGX2h8ti0udPUcbOIUixW+eTUP62hTyPeyCApgJMUbivoOla9Tl7mPPPX7HGdImUDKyuQT3
	qj3SHRa9vyFCxUp0cU3A6dZ42G3RMwV3qW25IMkTpFhpMSKKCKnT9c3z2A04V6c2dCC3zi8dRyJWe
	XkufHM+HQhdU61aXHxH1vs/cgqP85rLnV9kAs1HfcaXxZoKBwyJBeJ6rLPquxRpriBUc1LZhJAVLn
	IHJYmgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIUf-00000007zSu-0sKG;
	Wed, 12 Mar 2025 09:35:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHf-00000007wT8-2dDP;
	Wed, 12 Mar 2025 09:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=fOQAGaXhyO7ZB/UZi9ueA8JjP2xLmkVdgsalxBQMQE8=; b=MdwF0HqFI/BZ8O+fY8/FnaK9M5
	CRgwaaL+YxXNgIAdrDrjYrYWJ4FHYLkftI0DJ4lzjQ1MuQLd6nhAWg1DY80wjkb3bqcQZveCjCS2i
	VoXWwxsR4roAz7HehKQzGsNC2lZgsX8DDOphiPCNFwOfLUD1mQm4nGdNmfpwf8izVAJhwCmWUhmZv
	SB21m3Pi53aSZhCiJtoYibWz/kk2Emz6oOs52VA0rSFie0avDZW2I09iia6fDyfueGVep2A6S7Q0D
	N3CkTso2P1+JN2JR45UIbWsVDUJza4xusyicWe8bmhk2oPi//Xq+2Bh7XEA4lII16E6M586fe9vpq
	ENd0zYRg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHc-00000002LLp-3LDo;
	Wed, 12 Mar 2025 09:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fOQAGaXhyO7ZB/UZi9ueA8JjP2xLmkVdgsalxBQMQE8=; b=vWxf44WBHDpHwXKyucX8M4LdB9
	Iae3nKYghul7aPxEzR3SqSzO7Gogl9o/vpB6wPrp5iKMOMTwSlvyfYPVIlybNYczxWxka7K5YNg+R
	K80g40Fn1FO9B0NObXXZIuO7D8P5B5R2YkFsTrjC19ULemWS/r/f/vbQV3G8srMvDNhX9sphp6MHn
	RM81z3bDsC7mkAsSoc389sHpg9F+CAOzhV4EnsuvKVTQsI1Iq/1LyWS7mb/Ez+j5At2PqD0XB4JZl
	H/ZHl/LD4FBHz4ME6T6f/23S3bn0ksd5dEW8g/VPjn85pL0j7mejaLMhDJX5TykSERbF6MojXBWHI
	lvgiw1KA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35456 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIHL-0005Dd-0f;
	Wed, 12 Mar 2025 09:21:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGx-005v0F-Ev; Wed, 12 Mar 2025 09:21:07 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 9/9] net: stmmac: sunxi: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGx-005v0F-Ev@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:21:07 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092148_947616_A2CEDCF8 
X-CRM114-Status: GOOD (  10.15  )
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Set gmac->interface from plat_dat->phy_interface.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 1b1ce2888b2e..9f098ff0ff05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -116,11 +116,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	if (!gmac)
 		return -ENOMEM;
 
-	ret = of_get_phy_mode(dev->of_node, &gmac->interface);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "Can't get phy-mode\n");
-		return ret;
-	}
+	gmac->interface = plat_dat->phy_interface;
 
 	gmac->tx_clk = devm_clk_get(dev, "allwinner_gmac_tx");
 	if (IS_ERR(gmac->tx_clk)) {
-- 
2.30.2


