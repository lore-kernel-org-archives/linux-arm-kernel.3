Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB9D2592A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGBTNGnmTxwMKDHsZMSMTT/mAkSrcZT730/nj1ps4ck=; b=2vQRVhRzzHDZ8eCGxPloGlTbxh
	ZmPDOt5gmGOGh+L5utCTb47TihiG+gcTSu9f2n5ntWFP8FA7sndjEvPDbJbombzzS6Ksj2g6ftVbH
	6WjSFXGfX2N1e1l8zGtEpPHZ3CZOJsdwd97F4JNQHbC6LTv70ObexdLUtF71w596quWWkUg8zpLVE
	BHIqO0Sw1ozs7+j0LKu0R5tgBQQ3vxOW67UwAFkKsKceK/0kNdA0PJOWXCpZPEMKwG4ZxumfzR0bT
	DNwKtbI0+LE1xeaaX0wIRaTTM7prtADXksTbranB4V2SMMln7sirROPTkj2u0rh/Grh4hS0sErcGV
	TAQ0EtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3GG-0000000FssZ-2ZS5;
	Wed, 28 Jan 2026 10:59:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3GE-0000000Fspk-3UQL;
	Wed, 28 Jan 2026 10:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EGBTNGnmTxwMKDHsZMSMTT/mAkSrcZT730/nj1ps4ck=; b=sAs4uHaqj/eILKLiSvLRLGbGBw
	lXuPAVJBPWgHm2vpJxoAlCbiWnYdTfuJhWQJ3y/pnwzodn/QhmW9we7R3mcN9iXjbSHIY2t87E/Xh
	8DM0/dkS2L3/af1Cigcen5LhkRCq8bG/8bzuZ3eIg2mIep4jHPAKC/mpWgXhv32Hhk4L/CrAsF9A9
	N5NJCFMVuPA/+oSfBycuiqhh+Kc4l8dHuIn2HRQLrc9WjY5bekltn2HnUNGBJf93cWYiyH0XMA6W2
	hFHrvWyRD1iLhausbhXVCu/vgdvxFITS6uUmUK5m6/d+0dt/d7tLIi6gn+OPY8ADWAIPzzlEwsLTO
	Terzf0wg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42812 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vl3G7-000000007GL-1MhJ;
	Wed, 28 Jan 2026 10:58:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vl3G5-00000006v3X-2zfD;
	Wed, 28 Jan 2026 10:58:49 +0000
In-Reply-To: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
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
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH net-next 3/3] net: stmmac: rk: add SoC specific ->init()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vl3G5-00000006v3X-2zfD@rmk-PC.armlinux.org.uk>
Date: Wed, 28 Jan 2026 10:58:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_025858_880985_A5D7F5BC 
X-CRM114-Status: GOOD (  10.25  )
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

Add a SoC specific init method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 976d42fd90df..ea01c5965cbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -35,6 +35,7 @@ struct rk_reg_speed_data {
 };
 
 struct rk_gmac_ops {
+	int (*init)(struct rk_priv_data *bsp_priv);
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
@@ -1618,6 +1619,15 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 
 	bsp_priv->dev = dev;
 
+	if (ops->init) {
+		ret = ops->init(bsp_priv);
+		if (ret) {
+			reset_control_put(bsp_priv->phy_reset);
+			dev_err_probe(dev, ret, "failed to init BSP\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	return bsp_priv;
 }
 
-- 
2.47.3


