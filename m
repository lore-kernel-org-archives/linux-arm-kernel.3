Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D98DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+5GmaJXZT5l+1wfRT+lAuNHUWIAAutwCYXRr+Clwac=; b=YbAQQgUs7lOHXDprHd2qgRhVxH
	fJ/rsKLElSEuIHwJL6xdIDVAkwfXB8fkWhYeNfCJGSr0+YPwz1Y1rqQLBmCS1Ruk+aev3wKhk7svy
	WJ8M6Eft6rgMmYRn89zr5JNWPZmwBbq0VA5vuzeheY7pjxbUWO1DXoNIgevEA3Hw4Rd/Ti02xaixU
	HFQm4/7vYt6Ls53dtlPevcwHl2+mdlObijohOJaD/WKFwdZq2rTmt5dZFKtscv+wOBz/pSLjVOdxl
	OCA2Ia3baCjmIW1iscJ0QORWzLs13LF7s9Fs98G+/eo02NDe257b0ZX6tSlswoWlGi0rkThl6VeQo
	YBkBpBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRN9-0000000H5D2-1lxv;
	Mon, 10 Feb 2025 10:50:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRC4-0000000H2hc-2zvY;
	Mon, 10 Feb 2025 10:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D+5GmaJXZT5l+1wfRT+lAuNHUWIAAutwCYXRr+Clwac=; b=JPCmuPePd7jTYiDqDPokBnue46
	/9xMdoIUYYDcVPJ05GeL1wPwv7vD7p4UIFjcfxdyBdJW8TY+rnBurXP4Ojaskp1ARp9fFUb+/zwBs
	YYK44ibenMmQ8C3PoShh5YHSxA4v5X17S2LQvqn5OAaLuDvLypzvzTGYCftG6RM6Vm1ebyEB/nG3t
	4nWxVpDSd016hRl9Fid8HKe64fMgmIJUG+dLkb9slFLpX5G6uZQdnSPn5AmobsiMB6AXi/iE8oQJR
	HIsvK9i6PYrZ+473VHiS8OJGqxTOFVovHt04pSKV+pwkbZ2DlR6WnGX4t4gEGzyPgEd73jJhcnUZP
	hEm+eEyg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48962 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1thR9z-0006R3-2P;
	Mon, 10 Feb 2025 10:37:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1thR9g-003vX6-4s; Mon, 10 Feb 2025 10:36:44 +0000
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
Subject: [PATCH net-next v3 1/3] net: phylink: provide
 phylink_mac_implements_lpi()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Feb 2025 10:36:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023912_748268_DC6E7AC0 
X-CRM114-Status: UNSURE (   9.62  )
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

Provide a helper to determine whether the MAC operations structure
implements the LPI operations, which will be used by both phylink and
DSA.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c |  3 +--
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..6fbb5fd5b400 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1957,8 +1957,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		return ERR_PTR(-EINVAL);
 	}
 
-	pl->mac_supports_eee_ops = mac_ops->mac_disable_tx_lpi &&
-				   mac_ops->mac_enable_tx_lpi;
+	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
 			       !phy_interface_empty(pl->config->lpi_interfaces);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 898b00451bbf..0de78673172d 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -737,6 +737,18 @@ static inline int phylink_get_link_timer_ns(phy_interface_t interface)
 	}
 }
 
+/**
+ * phylink_mac_implements_lpi() - determine if MAC implements LPI ops
+ * @ops: phylink_mac_ops structure
+ *
+ * Returns true if the phylink MAC operations structure indicates that the
+ * LPI operations have been implemented, false otherwise.
+ */
+static inline bool phylink_mac_implements_lpi(const struct phylink_mac_ops *ops)
+{
+	return ops && ops->mac_disable_tx_lpi && ops->mac_enable_tx_lpi;
+}
+
 void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 				      unsigned int neg_mode, u16 bmsr, u16 lpa);
 void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,
-- 
2.30.2


