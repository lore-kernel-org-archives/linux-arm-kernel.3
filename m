Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C92BD3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFHx7Hpa/Wx2HX4vYATVmQHXD/1eII6Z1rk5n+BqG/I=; b=EzAfbwZXxXwD0Ah8dPHNbk3xr9
	vrcuJukWG53DuEOj+M/KiVdX1ApS8Hfa0LhBB5+ZCjwRcjI1twLMrug+NbnR2ihNq2U0NdEG18oHD
	C/mT7ngWlpG0YoSBO2DEw/o/M1VjlhyUNiVP99+yzcCd4yfxBsnMvoEJA96APTGqTTL0pV6OeJTn5
	7W/4eKMjEivnw7OA7XxOs+jeoPIrlwE/UxfyzpXF9i+5pD8DBP/3G09L4SQN2OLYIng64Hf1tsCYW
	zs1JcS4g9025dF/E/EO/yJPtR00AvQSTZUlkf/SCqcnRZZD1+FgCGRJn+AbUKF9eDBW9A0PSDpZHM
	LqhQijPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvJj-0000000Af5f-0Ogy;
	Tue, 26 Nov 2024 13:09:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4S-0000000AcGA-30JQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tFHx7Hpa/Wx2HX4vYATVmQHXD/1eII6Z1rk5n+BqG/I=; b=CathQnXfVBwElud3lAsxFw9PN4
	QqoXP88vAKQ5DWFkQSEO19UMz0bZ4ed4IZ4CbEKeGUpQdxzBbVpHOMBgOx5eurSxuDn3adbDpCqnt
	wvRGpo15OKVPqmRLp3pFg5xysmcwIzhQBVbsWHe+2SYeFgJX/wXKot5rg3AmL3U3JklsodRAAFDZY
	FjIKu6YAz/p6hV4Kzw9KI17ZJLarDKq44Axs9xDY1SCQzKp1ArGr5axlr7AXGdiqjz5QlDSog6pok
	tifmN0S30Si/078U1UNrxIBDdF/EjRa6JMbXMYEO/5w67drha80TKqgpsc1WiByMXl2QjT9zck6wu
	hHKubxkw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40374 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4L-0006w4-0G;
	Tue, 26 Nov 2024 12:53:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4J-005yiq-PH; Tue, 26 Nov 2024 12:53:27 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 15/23] net: lan743x: use netdev in
 lan743x_phylink_mac_link_down()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4J-005yiq-PH@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045336_749680_0C8A649F 
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

Use the netdev that we already have in lan743x_phylink_mac_link_down().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 4dc5adcda6a3..8d7ad021ac70 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3029,7 +3029,7 @@ static void lan743x_phylink_mac_link_down(struct phylink_config *config,
 	struct net_device *netdev = to_net_dev(config->dev);
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
-	netif_tx_stop_all_queues(to_net_dev(config->dev));
+	netif_tx_stop_all_queues(netdev);
 	lan743x_mac_eee_enable(adapter, false);
 }
 
-- 
2.30.2


