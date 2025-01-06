Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95974E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpla/p5jBbXU8PHtAJsqJXMShZ+2IQdFhklawDkmOxI=; b=ZqcRCJkfowoePl76VXE7oJ0yYw
	Hp20of9/2cNrGY1kewro3sYZsy0trTiM3o8UtlUlx0xY8+2CaEvb9dKGcMKCOPt8GZ/xlBgA7NT2C
	wGSOucoupua/gYzw3rxYtb6UidIVU6M0dGa8NI/mLPMfHh063rlGx1ke0I4r4wj8HJiJsyOx/7+Jq
	PpYFRFb6BEehCU5urgBczxBAe/QqFdGGyhy4LFM3/gBn1KY4nsD8mmnuJUGKtDBg6wtuG9nF8m25X
	QKvoTS4adykn8jPac8NMuku56Y6fR/jeG/nOev6hsONp+fJAQzByJ0ss9BDDmVeOR/xN/G0NRffY0
	dk4g6tGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUltY-000000018u1-0jzQ;
	Mon, 06 Jan 2025 12:07:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUln3-00000001772-17LZ;
	Mon, 06 Jan 2025 12:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tpla/p5jBbXU8PHtAJsqJXMShZ+2IQdFhklawDkmOxI=; b=kim957CCwJw2F0uyW8on/x6ptj
	CdMTQGZpQXlS9VWnCYJBE011UoxOC6m07+lSBaeF6L5uwIt+DhvqgNuwhtl70BVvt45+7iQFxYcxh
	6ngHHDU+nzgUqkKvfk5uys7pmF9zHOfOgU57V29i82m0tXnaGXzRH+q2OHmN9rZziHaUfKh+W7ejn
	HHdnPpJad9vwjhhWjmK0JN+MRLzHRn7uyG1vbw0v/AHVOa0XZN+fPx5yrlvbpTvWYvpmSo6HGPW17
	RzEP2zohaZHNyVu5xpp/HCQCWIs/3Qt1E5ejCU7kRuHsDz84TbgKxdpHYVWxO+yV42CNS6Kfz0eqk
	YusGlGqg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52330 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUlkx-0005kC-2p;
	Mon, 06 Jan 2025 11:58:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUlku-007Uyc-RP; Mon, 06 Jan 2025 11:58:48 +0000
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
Subject: [PATCH net-next 2/9] net: dsa: mt753x: remove setting of tx_lpi
 parameters
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUlku-007Uyc-RP@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:58:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040101_307896_4ABA2EAB 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

dsa_user_get_eee() calls the DSA switch get_mac_eee() method followed
by phylink_ethtool_get_eee(), which goes on to call
phy_ethtool_get_eee(). This overwrites all members of the passed
ethtool_keee, which means anything written by the DSA switch
get_mac_eee() method will be discarded.

Remove setting any members in mt753x_get_mac_eee().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9605febd3573..4c78d049b9f4 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3088,12 +3088,6 @@ mt753x_setup(struct dsa_switch *ds)
 static int mt753x_get_mac_eee(struct dsa_switch *ds, int port,
 			      struct ethtool_keee *e)
 {
-	struct mt7530_priv *priv = ds->priv;
-	u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
-
-	e->tx_lpi_enabled = !(eeecr & LPI_MODE_EN);
-	e->tx_lpi_timer = LPI_THRESH_GET(eeecr);
-
 	return 0;
 }
 
-- 
2.30.2


