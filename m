Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E56FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IklpgJhxC8VNpy/qSEzI1QtQ48O0fdOggcFKYKjJY2U=; b=AIJ0IgXXsVdfzbQiRsDilZT5KW
	5BHZ/30PXFidSi0Umnz//1ZexkZeVzp3r8kK9vRrPVq/D4KPfE1MusfbrffyZ6AbVVIJqX9htGd0z
	ceyuxAgAXZBwbuBMHm5gZyh9RrSVOXuzogu0LVVCxvj2BbkYzPySTzL19Noi8ekVek4vMwyojlnl3
	7mDSk1F7Pj30FS4HZ1V2EXCCC27jnlvfXkw8ntA5RWspT+x/1a2hiTEBt+iypjs+1PHrJIr/2uQe/
	jxvU/2KP0hcmIuyB9LKoHJWLJbBinQ1MqAhi1KKRIdQJzn2YDjs1MaOXm8oiGpyKCAwAJi+kat41A
	bOtIJ0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw275-0000000963S-1nZG;
	Tue, 09 Sep 2025 17:26:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1W4-00000008e1p-398T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IklpgJhxC8VNpy/qSEzI1QtQ48O0fdOggcFKYKjJY2U=; b=Z/Udmccvz4i/YBdSHaJgLcN73s
	ZQflCiXgQxpEd7uLmLxwr/ZNfYLRaE1ytKsuzq5uCogLUPqMwLo8sSsn9M4nt2EGhlG+zl0tji4kM
	7FscO6mWz0Fa2bdhzdnbYkbvyTmmmZTCBqK/Zidg/D+omvwh7pZIRag07KX4AJhoRuRsjX7z/zYnG
	mzYHlclVMCdW/HxIrxrFF5MVegTw18Unp0ANQr0c1vUwKh0QGaO3DwxGczQCxy9c6/rTmMZKxIb84
	UnoolTdTLkYGT80o7Yt1202xG+ZMvmkac7/W5L7zWReQOOMIXMKmo5D2Tb9s6TR1amDONIepAFe1s
	9e+lv1cg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55566 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1Vn-0000000005T-0E3I;
	Tue, 09 Sep 2025 17:48:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1Vk-00000004MCX-38Zs;
	Tue, 09 Sep 2025 17:48:04 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 08/11] net: stmmac: rename stmmac_init_ptp()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1Vk-00000004MCX-38Zs@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:48:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094824_789732_DFC6FF6D 
X-CRM114-Status: GOOD (  12.23  )
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

In preparation to cleaning up the (re-)initialisation of timestamping,
rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
which better reflects its functionality.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 716c7e21baf1..7cbac3ac2a9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -773,13 +773,13 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 }
 
 /**
- * stmmac_init_ptp - init PTP
+ * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
  * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
  * This is done by looking at the HW cap. register.
  * This function also registers the ptp driver.
  */
-static int stmmac_init_ptp(struct stmmac_priv *priv)
+static int stmmac_init_timestamping(struct stmmac_priv *priv)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	int ret;
@@ -3502,7 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 				    ERR_PTR(ret));
 	}
 
-	if (stmmac_init_ptp(priv) == 0 && ptp_register)
+	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
 		stmmac_ptp_register(priv);
 
 	if (priv->use_riwt) {
-- 
2.47.3


