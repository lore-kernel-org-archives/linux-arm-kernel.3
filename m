Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867A7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZeUKmjTWrPxI3nhYuZ5sil5KUc6LYRAxvBAbVkyF2w=; b=cEibCONDorlU2IwtflyESNxqyW
	8W2zBnbzEv6n5CALK6fj1dq5Zo4tFljsoPdsvxyODrWelDP/TCpUKdnBCq+OlEsCjcQTP94Q09ddQ
	zAqjs9Fspi68CnWerTLHSp3zDPdieYWrzSUdLcb7maagTPnuTryGjpdXsG+/UoeoJ1HfWZWMOh/CD
	GRsoEvd5g+CVoP1gj3NymehsvO8b+giWM3fdQ7+SwgAXODUiAOD14a8gWMvriJ/bUrFjlA+q7ROxN
	hiubI9v4hu+e/8pW43YhRauqZF4jesgIFX9wK1s56jJiMlkDqO1v1QIaZGeTJT/S2UUEu07k2grU/
	MlLHMVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Ik-0000000BmOY-1LJZ;
	Tue, 10 Dec 2024 14:33:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14D-0000000BinA-4Aut;
	Tue, 10 Dec 2024 14:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gZeUKmjTWrPxI3nhYuZ5sil5KUc6LYRAxvBAbVkyF2w=; b=g7O5fXsTSYslmoYkIrplDjGH9+
	SoGILQDnbkvlyF/XdP3Cexmqb40R1sGBKHta2hHotDaEM/Ce9b0aW5p0N3LelyAo2BkaT3sx0wB1R
	nVdG0eew6kyRAtaeREHtXZFwzNeH2oENELF4vnqIwNjOWWdsixmB0FQ5Qmb86xLQCHmNjeLS4w5w1
	tXykbrISXcMzQb2hIrrmwWp2phccFOQmehVXvaZu6IWNWAfIyD1BXCbFcYpNdPu0pGJLLJimwyxSI
	1oiGtl9uXB042cceIuC4YdQQAdVo7KmPrhtXiMhjGwxHTZzITXhDfzUjUOhkm3+aOJclRJX7L/uPp
	bMXJgjLw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38252 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL145-0002Sq-31;
	Tue, 10 Dec 2024 14:18:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL144-006cZD-El; Tue, 10 Dec 2024 14:18:16 +0000
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
Subject: [PATCH net-next 2/9] net: dsa: add hook to determine whether EEE is
 supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL144-006cZD-El@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061826_030074_29A7F671 
X-CRM114-Status: GOOD (  12.93  )
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

Add a hook to determine whether the switch supports EEE. This will
return false if the switch does not, or true if it does. If the
method is not implemented, we assume (currently) that the switch
supports EEE.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/net/dsa.h | 1 +
 net/dsa/user.c    | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 72ae65e7246a..aaa75bbaa0ea 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -988,6 +988,7 @@ struct dsa_switch_ops {
 	/*
 	 * Port's MAC EEE settings
 	 */
+	bool	(*support_eee)(struct dsa_switch *ds, int port);
 	int	(*set_mac_eee)(struct dsa_switch *ds, int port,
 			       struct ethtool_keee *e);
 	int	(*get_mac_eee)(struct dsa_switch *ds, int port,
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 0640247b8f0a..b54f61605a57 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1228,6 +1228,10 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	struct dsa_switch *ds = dp->ds;
 	int ret;
 
+	/* Check whether the switch supports EEE */
+	if (ds->ops->support_eee && !ds->ops->support_eee(ds, dp->index))
+		return -EOPNOTSUPP;
+
 	/* Port's PHY and MAC both need to be EEE capable */
 	if (!dev->phydev)
 		return -ENODEV;
@@ -1248,6 +1252,10 @@ static int dsa_user_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	struct dsa_switch *ds = dp->ds;
 	int ret;
 
+	/* Check whether the switch supports EEE */
+	if (ds->ops->support_eee && !ds->ops->support_eee(ds, dp->index))
+		return -EOPNOTSUPP;
+
 	/* Port's PHY and MAC both need to be EEE capable */
 	if (!dev->phydev)
 		return -ENODEV;
-- 
2.30.2


