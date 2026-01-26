Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527AFCF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHWeUWbQE2hpAgTFMwwsGN/ylXlWDn4KjHeglceZ8q0=; b=RxFTNJ+nhX0fyk8qeGu35TigTM
	sr+S4LnXvKL92QEOG2lfnUHOjODjtOmUNRHiRfGcE907XWRYHwykfixdY7mNwNddk9U0w0DAJP72C
	yPzPddifJykxVyHwlwqC1guYot+BEBfIo2hTwkzPToJvQ9dBQIoBu0FmQgGiakcbYxhJYquWOlDtt
	8O75I34cQJwdivy7htky3eC3C8ZLJeXBWXPdUK/42lbEKTUdwLjKzEPZCW9HE1RG4gvbO6if2bmuI
	F8DrLrgSPyEzTsji7XlJfG3C7jhQGwVZEIuhar3G3fddKokKrW5LsNNpMI4EvMPe3uJGOmajqVMGN
	pu6ntfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2K-0000000CQsz-3uXa;
	Mon, 26 Jan 2026 11:45:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL2H-0000000CQoO-3SRl;
	Mon, 26 Jan 2026 11:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NHWeUWbQE2hpAgTFMwwsGN/ylXlWDn4KjHeglceZ8q0=; b=CNK2vexlaXIWBNj9A7cm6q5E4m
	l2QLGbB7WDB2RRF9heaOyhceA8KM+zzUbp5aBTNhHRNcvosk/YLErjrr1iVYKn6DX2FL4ErNW27sB
	0yi5eT78W/0uy344Srn+GOtoqw/5WqYW5tALk/EKYVZMpcY2gq7P73MXRiLxtUPBT82AEuI2HRWpU
	Yc4s9UKzOu3GozzJuUATEXoODS3swG2sPzourmj/PHZK80z9WwAN3/FgJWgmYhLUR/2zTCB0iReNw
	aacmNYuE9daSGAPGa+eSV7hmCqG7qutXH36Pt1I+sITqSdhyMiPsOoexCI53jmIjpu0XtH4KknJSY
	EG/NRiMQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44922 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL2A-000000004ew-0hkg;
	Mon, 26 Jan 2026 11:45:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL28-00000005usi-30YC;
	Mon, 26 Jan 2026 11:45:28 +0000
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
Subject: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific ->init()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:45:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_034537_856502_2A5C4142 
X-CRM114-Status: GOOD (  10.04  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7f8ffd1549bc..4117f6863ff0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -35,6 +35,7 @@ struct rk_reg_speed_data {
 };
 
 struct rk_gmac_ops {
+	int (*init)(struct rk_priv_data *bsp_priv);
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
@@ -1618,6 +1619,14 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 
 	bsp_priv->dev = dev;
 
+	if (ops->init) {
+		ret = ops->init(bsp_priv);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init BSP\n");
+			return ERR_PTR(ret);
+		}
+	}
+
 	return bsp_priv;
 }
 
-- 
2.47.3


