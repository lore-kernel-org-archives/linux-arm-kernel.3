Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heuIwIaco0ryk9+s/3Tq5BiUJ5G/QcaQOBK21igxZiY=; b=B0X0nL6VhhY7t+evu412zhWdtU
	AUohIYouo7TY1SZiXwYhulPrEhpendHjOpenjKMqoCTSECKMgkwlIbLp0vNiPjtEN63DFBRcS/bJt
	AvaZPnd9+ZS1IjjrPzPR1v8pvwbG4nyfH/Xi0JxeWqCSsPr4qo7jmv4ajbg7Ek+KVBpTS/bUqX0Dn
	YITPkLIP0JPhdurRsM4e+hHnupoPDl9sZiGOFTkd/AIOrZ+K7zPT/Lie6TVoMx0u7BEgeoOnl4oHZ
	tD9JHRLvXhiaW1VqAWgvHyy8Q+3K6ubgh/xhaROpS3Xz52ckSQwJdDy6dJcJmWtN5cBXoUJ+OZ0WW
	N5UbvRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Hi-0000000Bm3K-1JUU;
	Tue, 10 Dec 2024 14:32:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14D-0000000BilT-0AQl;
	Tue, 10 Dec 2024 14:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=heuIwIaco0ryk9+s/3Tq5BiUJ5G/QcaQOBK21igxZiY=; b=XFfBQAqncOi6+bZnJUa8u14GfE
	UH8WBg+i6wqTKWI8CHNHcSbcGTpgqfjaXailak5EzFeS96sihLJ4ldTDUs2ELiuRgSJmULcN9MHzi
	JzA6UCRt5thLH1p17CcvY6BQn/ITnlPDxkb25ziGJDZ0aPCrJTRmvLEvs3gz1jPbX076UP1hfhh8Z
	pxK29YsRBn34S71NiQIxMRLk9kVB0PaqRfJrc6PBhgwUEMqPTI5RPTn1RQhmEnE5M+MlCVAEyYB5W
	xql3R6UiD2YWN1pCm6XOY1K5hlhZ6yaT7TstmWzy+wt6p9fn8DMVhQ4J/MzmLcw2vPG5EWvwSKW65
	yhKcAAjg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38238 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL140-0002Sc-2g;
	Tue, 10 Dec 2024 14:18:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL13z-006cZ7-BZ; Tue, 10 Dec 2024 14:18:11 +0000
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
Subject: [PATCH net-next 1/9] net: dsa: remove check for dp->pl in EEE methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL13z-006cZ7-BZ@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061825_084063_3ABCEE6A 
X-CRM114-Status: GOOD (  12.04  )
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

When user ports are initialised, a phylink instance is always created,
and so dp->pl will always be non-NULL. The EEE methods are only used
for user ports, so checking for dp->pl to be NULL makes no sense. No
other phylink-calling method implements similar checks in DSA. Remove
this unnecessary check.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 net/dsa/user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 06c30a9e29ff..0640247b8f0a 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -1229,7 +1229,7 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
 	int ret;
 
 	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev || !dp->pl)
+	if (!dev->phydev)
 		return -ENODEV;
 
 	if (!ds->ops->set_mac_eee)
@@ -1249,7 +1249,7 @@ static int dsa_user_get_eee(struct net_device *dev, struct ethtool_keee *e)
 	int ret;
 
 	/* Port's PHY and MAC both need to be EEE capable */
-	if (!dev->phydev || !dp->pl)
+	if (!dev->phydev)
 		return -ENODEV;
 
 	if (!ds->ops->get_mac_eee)
-- 
2.30.2


