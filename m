Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4241BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlxjZGXanDXKYhqFjk9v56yUdRPX52NKfpEf5gaJfFM=; b=oBcj0R/fdkf518TgSTLf/Vqxpf
	hcfE9Jagc9UDbJDMdI/x2Ze7DLw+yNVWDZ/mArqPaM1tzShDY9A+7Y/wksIGFbMOsomsBKPlkXD4V
	d42BN3a92ex6MoqoZvoi2ssM9MqmX6RTq3F7n8afMhWNzYb4QlXZzaE4oVQDfO0q8fIeK04gPzlbu
	Qe9nGa/ySgQn9S4sz4619pBnrNT2SKx25iUSAdKWiJ9kf6QTgAWRte4pc5HUshT/+whXfXSC2w39d
	pLfwUsYTwCCpGUU6+iNx8vORONSI29uee18tgDBDOeOBA2GwxNPrQyL5TdrOFESqPm7pvGW+7fo3l
	Cvn5omTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thROV-0000000H5UY-2ULe;
	Mon, 10 Feb 2025 10:52:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRCA-0000000H2jj-33I0;
	Mon, 10 Feb 2025 10:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DlxjZGXanDXKYhqFjk9v56yUdRPX52NKfpEf5gaJfFM=; b=cqSOlErmRjo6dfA7xMOFeKkTuw
	yj4z1UUBURPdHcBahaCr08QjLIyTN2nv9vFXbX1n1EYdiSVtyzFh8v0ZirBkX6n4mO6ULVpZcuNrw
	+UEWuc7My2dGnlIwzJP7YMC1WWHl0g8/q3+RqsaIiCqS9gvn+MHARLwrhOr3bNJoLk3Q1pfgDiFHN
	TCvlmXeBbjJkslgSlcMydggqkwK8A75v1h446Y2VVWOY0AACHowqTXw6G0i/UkCP7308lWJEuMPnZ
	7fAUwivaLa/gEqGJHiP1Bu8uH3CUA9e+RYQCG0LrLfsOJN+IwlIGw6dlRLhb0Sz+JWRNmZ9LPi7j3
	Ge2ErPDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48976 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1thRA4-0006RG-2q;
	Mon, 10 Feb 2025 10:37:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1thR9l-003vXC-9F; Mon, 10 Feb 2025 10:36:49 +0000
In-Reply-To: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
References: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 2/3] net: dsa: allow use of phylink managed EEE
 support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1thR9l-003vXC-9F@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:36:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023918_758648_75349866 
X-CRM114-Status: GOOD (  15.22  )
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

In order to allow DSA drivers to use phylink managed EEE, we need to
change the behaviour of the DSA's .set_eee() ethtool method.
Implementation of the DSA .set_mac_eee() method becomes optional with
phylink managed EEE as it is only used to validate the EEE parameters
supplied from userspace. The rest of the EEE state management should
be left to phylink.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 291ab1b4acc4..2296a4ead020 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1243,16 +1243,25 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
 		return -EOPNOTSUPP;
 
-	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev)
-		return -ENODEV;
+	/* If the port is using phylink managed EEE, then an unimplemented
+	 * set_mac_eee() is permissible.
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
+	} else if (ds->ops->set_mac_eee) {
+		ret = ds->ops->set_mac_eee(ds, dp->index, e);
+		if (ret)
+			return ret;
+	}
 
 	return phylink_ethtool_set_eee(dp->pl, e);
 }
-- 
2.30.2


