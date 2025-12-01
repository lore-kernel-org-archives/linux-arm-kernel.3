Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B9D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2fXZwmb35EIN/x1qesc6br+Ei92V4Iw4QaRP7+DyA8=; b=sQNyhRbThAdwR22JGry1STcaUx
	OAQWgX3YhrKAfCXVI/nxEX0xs+oNE9bSTvE3XRVL5tYzX4v3Phewv38D3KD8GJqNfYuF4gQTcEuOT
	v+ocADGzXxDl4/O5J4VA6V/cbNI8NGnbxN+L1ijYcpfWU1PnpodPPQxWC9+poptRuosvF4h5rPX2u
	oIsjXjiZQXSajc5WEMit4CDihoGeIJ/GyprlAnSLAlWc17XpDKvr8mB/x5nGqPYRF70cd7qrekq8Y
	QxfR4U2GEKrP5/xYa80/6OTUSIOBSOgIxtuiQx71KijchJh0SFN6UF85dZ8ticKb7oPCr3XWl2Tgv
	fP5Hcl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5N5-000000048o2-3KUi;
	Mon, 01 Dec 2025 14:59:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5N4-000000048nI-0BV0;
	Mon, 01 Dec 2025 14:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=I2fXZwmb35EIN/x1qesc6br+Ei92V4Iw4QaRP7+DyA8=; b=LyBVuzivIQpV+ampkVHHXT6AdP
	JqE/smWcsyc9iX8kgBePCNsmSyO2GAm9CssP2huklvfRT7boitYNV/KsGkVryvocLw5RPri7bfNeB
	KzjGmrH+LjiezoSyt/gBfTK1BLZrCWZWENyeN7xOJnMT1A+/ZNw/aXfYUi7/mEcz4jJY17PTA72d3
	9RG3dhisNTthhZOYuwcbvOzoX3GmZJ20Ja7PNlyQUtHfe8jayoCcDO2wztpKny69UMZtehJ2aL9H4
	jSf4PvE81zGWHIFxERvcEmH2IvkXziCQRGabE6AslW3qZeOZc8lIi9dlJt93kIRV0BvDOF7yESIff
	hUJk8Tgg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4VS-0000000G2xy-22r8;
	Mon, 01 Dec 2025 14:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I2fXZwmb35EIN/x1qesc6br+Ei92V4Iw4QaRP7+DyA8=; b=Conu3tvH+YjBecg06O4GMiHMCg
	ZINsYOtCAQnKyHX+MZ68BNJfLzg8E4WK4A8MIlzNozy8G47GYPBD9qqI7LzB3pSTJ7hCX0I63KfdX
	ci7UdMdA9XX1FbZPOEpAnOLdDx4Minpat6uU9EUb5Q1ZV2quxsrcaSbOhSxqyf7+nuVoDWCl5cFKj
	3om06mjbdsmSgM8BQTzks2F3Rysjt+v/fLRAmhJ7gc461DWL2B8immYieSNpV9WdSf6NzYt7hh6/f
	MvzbZfKijvqUzlutYBpJy0g6owfnhNElW/WkcH4f8KiZhpO5bv7BP+xjd8FEhT4EzN5wIHvqkeEb3
	YNKuedDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46786 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vQ5G1-000000000iB-0oWY;
	Mon, 01 Dec 2025 14:52:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vQ5Fq-0000000GNwl-1aSe;
	Mon, 01 Dec 2025 14:51:54 +0000
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 14/15] net: stmmac: rk: rk3328: gmac2phy only
 supports RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vQ5Fq-0000000GNwl-1aSe@rmk-PC.armlinux.org.uk>
Date: Mon, 01 Dec 2025 14:51:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_140358_736424_EC81158B 
X-CRM114-Status: UNSURE (   8.52  )
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
index c9a915b2cb84..c04a115beb98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -438,6 +438,7 @@ static int rk3328_init(struct rk_priv_data *bsp_priv)
 	case 1: /* gmac2phy */
 		bsp_priv->phy_intf_sel_grf_reg = RK3328_GRF_MAC_CON2;
 		bsp_priv->speed_grf_reg = RK3328_GRF_MAC_CON2;
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	default:
-- 
2.47.3


