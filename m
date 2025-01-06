Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91930E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVjjOeVo8Ce/t55+rQVszo5wPlO5d2hOsrXlSpvC7mI=; b=C2X2BRKWUuqtA5ohvF/GoJVYD+
	bwlthrI9678fODYADmYpMdxr+DoXUAuTKuPkRGgqVIQUXjm2oPcoljyFurGDPUMLagUwRaw+/PK/v
	jBtwAGYKCRnx/F6Aer7JwDHgB6d4a/7rZ40rVoKzl+RXd0rGkqAybacHXRJFCqzZ4mK666EBB427J
	sQwllnC99lljFMclGxPxL8XqPUNhGzpFiXCMenhFlXbEQn11TSJRPQGU31IFs901xyaCUj+kqq2eh
	Wdy7Qd12lY7u1Hffm6FRNJ0smDlYnxqLMp2+j/DwQBgwfhf5aXhbPlsUk6kv3lDln5ZpW8Jqvr1z6
	xrX7zwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlui-000000019GX-0ZtG;
	Mon, 06 Jan 2025 12:08:56 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUln9-0000000177C-0efa;
	Mon, 06 Jan 2025 12:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aVjjOeVo8Ce/t55+rQVszo5wPlO5d2hOsrXlSpvC7mI=; b=oKKT4YfxbWhUxoDLZSBzfK+lqz
	17rq6kc5RsA+Oi3YMKsANec3Le4fCnGQOnKAlWpCxjtz6HNSxcbc50e/bBt243XG3n6aQg64W9Q30
	GNnHtJ7dHUSbP7rVvTB0IvdjnirMEeB9yDHVg3MQ9Yn476K/0B7VF7uroevYF5RA1cfbScnE8+zpz
	9+A4QBgXuuBZWzLV/uCn3BCltzkyQa3iqUjTDRuLPZNg4JBjnQ+TJX8Xi9zIMwYBhAVYdAU5osB4M
	5FWV0wVXf1u9PNpQiGs+pR78UKEFYKsMxL24WpOTZtxGstXtsRRNBVXoRz9dVekk6i8enTNTSz6ED
	KSQP0IHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUll2-0005kU-2w;
	Mon, 06 Jan 2025 11:58:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUlkz-007Uyl-UA; Mon, 06 Jan 2025 11:58:53 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 3/9] net: dsa: no longer call ds->ops->get_mac_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUlkz-007Uyl-UA@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:58:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040107_187472_9750B847 
X-CRM114-Status: GOOD (  10.11  )
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

All implementations of get_mac_eee() now just return zero without doing
anything useful. Remove the call to this method in preparation to
removing the method from each DSA driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 4a8de48a6f24..c74f2b2b92de 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1251,7 +1251,6 @@ static int dsa_user_get_eee(struct net_device *dev, struct ethtool_keee *e)
 {
 	struct dsa_port *dp = dsa_user_to_port(dev);
 	struct dsa_switch *ds = dp->ds;
-	int ret;
 
 	/* Check whether the switch supports EEE */
 	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
@@ -1261,13 +1260,6 @@ static int dsa_user_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!dev->phydev)
 		return -ENODEV;
 
-	if (!ds->ops->get_mac_eee)
-		return -EOPNOTSUPP;
-
-	ret = ds->ops->get_mac_eee(ds, dp->index, e);
-	if (ret)
-		return ret;
-
 	return phylink_ethtool_get_eee(dp->pl, e);
 }
 
-- 
2.30.2


