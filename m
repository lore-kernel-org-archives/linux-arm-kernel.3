Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE71E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlYmLFN/8CAJKF2m4Ukp5uw+PCBqObvzNJY6qsnkWK8=; b=HOdgAxFSLmWjW01ainTk0TQqY1
	GvPUZBe4y4szHskXUgT8+fj1ouBj6P41C++9rvYevsB0kfgFX9yOhvkZqQ5U0+6AtZt49JwaSjyby
	Pu3DvFGuygGQicW1E/DcopsgdhUU+qU6O3lrv00HxgUVTFjKHO3bIKGmdUSD27WHZIckXSyjssl7z
	XKOVP5CQwTFK6/ka9khEgWUgU23IDO+ORiQziou/i4UyzTi6jnjRSF8A8fERy74+I8QnkJE9J+tt+
	AQ5ImTBpDNnF1GJBdGnljOdof9QGu69pygm+HSLh3RZY0Bb3bSPxHrjAbs0/Em7WbRVi118Am0mbX
	0uOJzojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Py-0000000BoAt-2QvZ;
	Tue, 10 Dec 2024 14:40:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14q-0000000Biyh-03Ot;
	Tue, 10 Dec 2024 14:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KlYmLFN/8CAJKF2m4Ukp5uw+PCBqObvzNJY6qsnkWK8=; b=F+Pf5dI51Ctrw55VBld9EEk+dn
	uYLqPJohRuJUK+ymYvnxdIf80s9g9Bj08uB7WAH2hHXUhXZHQdyqRTTbllxx5MN4EZmn49rhRsLq8
	38IwM72V3I8y538wVPhUSy9kpvdbVl55DgKCThdHO+woh5oZg+eoQugjppoTuxYgg5ESYhR7WJcF0
	xA4aqQF2KcRGIjOkxjx36pssFxR+sTckaCSstoGRiju79IoafOrwQyRvQFc9IAu67qsFfQW4UTRuv
	SbsK7pUpMmRQjc3DXtGbp1LnKQU9NRrrX+luZanJ3jMFU+CxEMNUqs2HWwdcwt+7GQUoeemjFjnYb
	3SgGTBAA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34148 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL14g-0002VH-2a;
	Tue, 10 Dec 2024 14:18:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL14e-006cZy-AT; Tue, 10 Dec 2024 14:18:52 +0000
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 9/9] net: dsa: require .support_eee() method to be
 implemented
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL14e-006cZy-AT@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061904_055984_EFB92310 
X-CRM114-Status: GOOD (  11.40  )
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

Now that we have updated all drivers, switch DSA to require an
implementation of the .support_eee() method for EEE to be usable,
rather than defaulting to being permissive when not implemented.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index b54f61605a57..4239083c18bf 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1229,7 +1229,7 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	int ret;
 
 	/* Check whether the switch supports EEE */
-	if (ds->ops->support_eee && !ds->ops->support_eee(ds, dp->index))
+	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
 		return -EOPNOTSUPP;
 
 	/* Port's PHY and MAC both need to be EEE capable */
@@ -1253,7 +1253,7 @@ static int dsa_user_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	int ret;
 
 	/* Check whether the switch supports EEE */
-	if (ds->ops->support_eee && !ds->ops->support_eee(ds, dp->index))
+	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
 		return -EOPNOTSUPP;
 
 	/* Port's PHY and MAC both need to be EEE capable */
-- 
2.30.2


