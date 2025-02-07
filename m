Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1880C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+5GmaJXZT5l+1wfRT+lAuNHUWIAAutwCYXRr+Clwac=; b=hTUu3eXxirneT7u9DRpGIbqCqN
	ObEkLfdWwFLuaDMdUqlX68XDrlvfGpqiVkvD8OhzEoizTL5fd6RJPn1sANeS8gDSTPt5fOeBUbo8H
	ZyMUttj3JJWQDvJnCaFMB7DT2I5WfhfCIWcnH5Xdj9yTdcD6XU0gY21XP5Olfrn6NeKa+RJxQD2DC
	kaR4i5GBDvKtEG1DdAr8liaoVwBFLTbfcnmSXwj0T36sSfLBnKLfjOTmQUxhBTuFcB75jeVdKHCbb
	xC0Z7RQ8bUnNFuJQENb7lcEFgxLX9tZzgev7xw1CpkYS5MiqgYEZXT8ZvWQ8+KPcLiM2i+pU43jRS
	5Ih0pD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO9I-00000009bxv-429T;
	Fri, 07 Feb 2025 13:12:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO7N-00000009bi0-1ATo;
	Fri, 07 Feb 2025 13:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D+5GmaJXZT5l+1wfRT+lAuNHUWIAAutwCYXRr+Clwac=; b=NQ7srPzUs+tMrZ/y6itehAOO+y
	V8CdwzSQvoIzk8NrTiWl5ln7ifBiMA0YB+icBAW66vdNowFAxBTWrlI3gbA+/pRp/NfE7uZLRTjuC
	qG7eciLtSdNWNmqdtyuikr1u6zUdHDlwB7qaV3FJbDXt1FLq2jtJARIlsMiFuMza8JL0PPo+tS3rH
	dGcsxxTokP/Qk1FFnAiiD0NbUGX+iNqqGYmf1YD0Ks9Zcz04uJ9q025vxXy82VLedNN15VtG34dPn
	GgPzh+XKCKZMf/Tq7bVxKNsFxhXH+nECBlg3Q//cxEVzOmjH3fqK/55uMycxtDy0l/Nri65XT6mJ7
	wBPb31KQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38292 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tgO7E-0005he-1a;
	Fri, 07 Feb 2025 13:09:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tgO6u-003il9-UQ; Fri, 07 Feb 2025 13:09:32 +0000
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
Subject: [PATCH net-next v2 1/3] net: phylink: provide
 phylink_mac_implements_lpi()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tgO6u-003il9-UQ@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Feb 2025 13:09:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_051001_315317_8A49C413 
X-CRM114-Status: UNSURE (   9.54  )
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


