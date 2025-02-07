Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B2CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an4Bf9RgJBmZ5nR+GtJJGxEy/QAJGcPX467lHgjHOaQ=; b=ymo9rwF1KjwRln9+e/N47PvnGn
	4olXD8wREDAf/wM4SeYYKfbw7mgXM8+JQqDq77lXHOHhBNBiMWswDyLh9W6zUMPH9SRke9ICpqsjH
	/iNEb78ZC/P2guL7ptHOSqUEHcxgT2i4nsvltcsY1ZhP+padcJAHpeT2QzvQycWckf9p4L8iLgFs0
	gxvF5uhNM5mv2CYdw6bQ5XLXJ563pNqelfpK3OScXCaOssaygd+vEKG1o8HkvVCD4U+ixrOVxg9kx
	n2R9+X6K/qZMnwfdhvjUOL02zzEpWlpQwQQMfPObL3ihGcLC79mnxCNUwbPO9Av6SOZCSe31nOEFB
	SHJYKK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOAe-00000009cCK-1UH1;
	Fri, 07 Feb 2025 13:13:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO7S-00000009bkE-3nzP;
	Fri, 07 Feb 2025 13:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=an4Bf9RgJBmZ5nR+GtJJGxEy/QAJGcPX467lHgjHOaQ=; b=K7s2KxwviVD+MgpsgfOZW3AOOe
	r85Y02EYl4KogHc3dBBQZgOn6dYBEx2AoVTfrD7digxqxG4N0vbItIF8+EYmgIHiy0BGWG2JydAIf
	OogWu1TZjba+b7B04l9PgKxP0b19ghcoD3RVakjKQyd4qnD9u9MfJ17x1337+bkwod5BKa8/ih860
	x3+gPN21qogO/04m8jZyU+/OE96pSnc7Cd3dMYC32CjSZKZLgMDBzHB5AOst7/RMKh5D4ZCFZgLrW
	5aaMIkhg7W1EPIsQYHrx7BA6RfKejaBO916FMS31BCJLSkYJP39XyZjA5WLenYE9sxfjQQqx94Vxf
	dZq3+01Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38300 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tgO7J-0005hp-2G;
	Fri, 07 Feb 2025 13:09:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tgO70-003ilF-1x; Fri, 07 Feb 2025 13:09:38 +0000
In-Reply-To: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed EEE
 support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Feb 2025 13:09:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_051006_944223_A237346E 
X-CRM114-Status: GOOD (  13.12  )
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

In order to allow DSA drivers to use phylink managed EEE, changes are
necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
make use of phylink managed EEE, these should just pass the method on
to their phylink implementation without calling the DSA specific
operations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 291ab1b4acc4..2e0a51c1b750 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1243,16 +1243,21 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
 		return -EOPNOTSUPP;
 
-	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev)
-		return -ENODEV;
+	/* If the port is using phylink managed EEE, then get_mac_eee is
+	 * unnecessary.
+	 */
+	if (!phylink_mac_implements_lpi(ds->phylink_mac_ops)) {
+		/* Port's PHY and MAC both need to be EEE capable */
+		if (!dev->phydev)
+			return -ENODEV;
 
-	if (!ds->ops->set_mac_eee)
-		return -EOPNOTSUPP;
+		if (!ds->ops->set_mac_eee)
+			return -EOPNOTSUPP;
 
-	ret = ds->ops->set_mac_eee(ds, dp->index, e);
-	if (ret)
-		return ret;
+		ret = ds->ops->set_mac_eee(ds, dp->index, e);
+		if (ret)
+			return ret;
+	}
 
 	return phylink_ethtool_set_eee(dp->pl, e);
 }
-- 
2.30.2


