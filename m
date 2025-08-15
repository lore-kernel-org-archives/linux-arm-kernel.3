Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A16CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVGyduMsGp9jIcV0Q/MypAFdrMixXAG4hD33b4pow40=; b=1KrzeROJ4j8BoLsQNgnOLuaV+J
	Hh794PwJB1uwTxSUps8ocPxZXatUuHNwSr9StNNQuP8En/il+MGvUsgOxX9tJDaY0jVgILtIw2qPV
	7/6a/KP/H5TqSBK+Aeltqfvu5ys8BPbc15lfVXtcivXeUHoLeIWZpPggJdv7vurMDiUbh6lEkRQwd
	YOFEm89JAxXweQKmhZph7jiww6xWBEHor9Gh66z+KRr6XczR5t3TtX+R0ym83jgY5gNtP1p7BLoxh
	dZaYbLjd5xmI6t9dnuatWyPL5QC8dz8RXjLQUM4qcvZsesqdt4HQXFcmtVx55d4aTC5QY9mfAhbUB
	93naF0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvMP-00000002i3k-0XHQ;
	Fri, 15 Aug 2025 14:24:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsfx-00000002LCV-1oIw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UVGyduMsGp9jIcV0Q/MypAFdrMixXAG4hD33b4pow40=; b=PNSGHwZ+Z3Ie+P8OzTLhtlVT+3
	9OgjuqQrxIg7OES+48tMdoGksYkXCWxHnnpo5vmFicR/LCozh+eH/kCurym1+Tew2O2NariRAqGc2
	4ImEfAUmTwSkQCFxjxJ5Vsy0f52Z/Gb6Odoks6xY6N72T3Rr38T+SDHN1JuluV/QtgZ9UW3WwFqoe
	TPek0CqlWF/ruFy1dszrx7L4S8Sy1ONqAhQC6AuiL7Y1XZg1skPFRKgChWP+XuwrnvZ7CwNDhSv7m
	liljNt42brDxAK4s/7sAKJe+d8b4qJVERZYv5ZWe8AccuxpYOpeIITJaPQx/3uaUFfePhSr0m1N4r
	RigqdMaQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52750 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1umsft-00011m-0l;
	Fri, 15 Aug 2025 12:32:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1umsfA-008vKW-H1; Fri, 15 Aug 2025 12:32:00 +0100
In-Reply-To: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/7] net: stmmac: remove redundant WoL option
 validation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1umsfA-008vKW-H1@rmk-PC.armlinux.org.uk>
Date: Fri, 15 Aug 2025 12:32:00 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043249_471647_AFCEF734 
X-CRM114-Status: GOOD (  11.30  )
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

The core ethtool API validates the WoL options passed from userspace
against the support which the driver reports from its get_wol() method,
returning EINVAL if an unsupported mode is requested.

Therefore, there is no need for stmmac to implement its own validation.
Remove this unnecessary code.

See ethnl_set_wol() in net/ethtool/wol.c and ethtool_set_wol() in
net/ethtool/ioctl.c.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index dda7ba1f524d..cd2fb92ac84c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -803,7 +803,6 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u32 support = WAKE_MAGIC | WAKE_UCAST;
 
 	if (!device_can_wakeup(priv->device))
 		return -EOPNOTSUPP;
@@ -816,15 +815,6 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
-	/* By default almost all GMAC devices support the WoL via
-	 * magic frame but we can disable it if the HW capability
-	 * register shows no support for pmt_magic_frame. */
-	if ((priv->hw_cap_support) && (!priv->dma_cap.pmt_magic_frame))
-		wol->wolopts &= ~WAKE_MAGIC;
-
-	if (wol->wolopts & ~support)
-		return -EINVAL;
-
 	if (wol->wolopts) {
 		pr_info("stmmac: wakeup enable\n");
 		device_set_wakeup_enable(priv->device, 1);
-- 
2.30.2


