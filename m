Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62FAE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeXCOxezUrfM140D6OtvELG0GwtRPEiO0F0OtvPAjDM=; b=R8U29hTjQwwHfUr9GtLf416BNu
	8rSf9TEC6N2cZTxE7IhsvdsUBm4aFbBRsOlBdvfkoNScgjN9wn0T1rWgi1eXoQGRv4OGiL3KZdtdN
	spxE6PodbW90BhfLNZUUIJ1X/DimV1Egs8ceIT4IW7PU8Gg/LoGzAauuRaEnLypphbuEpSh4jo7UW
	oiSqK+aIb8CpmzrnyJf7EWIaKvp4kP7wqntTFJ829cqzqVzPz8+ovnstByDhJ20d1i67u336nfXpT
	YGJZB0kVwgZHFTEheHbyxkfpNLBb0PWzMc717//bJbOfa3IISlSPn7Qi8AbqvrCGCZHafIanjr+4M
	JidklFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Km-0000000Bmvk-20Ed;
	Tue, 10 Dec 2024 14:35:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14P-0000000BiqZ-0tKs;
	Tue, 10 Dec 2024 14:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YeXCOxezUrfM140D6OtvELG0GwtRPEiO0F0OtvPAjDM=; b=1lKwWQ0lUNF59KweF14maIy2Ss
	8QpyJpAUqZR59MgZF/W24oLzcF/UwiirssAMsOofOaf7MLpFOsQ3Y9RjlXEBs38x/GyXtjXuVvNLS
	1TWPbc5ht6Oq2rSLYm1/N6IFYhGI3u039iHymx8m5YJ5S93a2UP04O5t414pHWhg8vRa0j+5zMM7U
	rr68HtfAbRJ/OGseXFRk8LbCuAV/LF4t5cLrVCeEg+1N9W4E2s2Taa+0hoVoB0BgynpHCioH1W77F
	EUk271G8y681KXJnh0LE8DYIrMXiaMoE2OVqkWqyk/R/RwkjXRfhwPWVqfyO3JPnTRd42I9SdwtQ4
	EwcvK9zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37012 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL14G-0002TT-1W;
	Tue, 10 Dec 2024 14:18:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL14E-006cZU-Nc; Tue, 10 Dec 2024 14:18:26 +0000
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
Subject: [PATCH net-next 4/9] net: dsa: b53/bcm_sf2: implement .support_eee()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL14E-006cZU-Nc@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061837_249476_77FCCEF8 
X-CRM114-Status: GOOD (  11.35  )
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

Implement the .support_eee() method to indicate that EEE is not
supported by two switch variants, rather than making these checks in
the .set_mac_eee() and .get_mac_eee() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/b53/b53_common.c | 13 +++++++------
 drivers/net/dsa/b53/b53_priv.h   |  1 +
 drivers/net/dsa/bcm_sf2.c        |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 285785c942b0..0561b60f668f 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2224,13 +2224,16 @@ int b53_eee_init(struct dsa_switch *ds, int port, struct phy_device *phy)
 }
 EXPORT_SYMBOL(b53_eee_init);
 
-int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
+bool b53_support_eee(struct dsa_switch *ds, int port)
 {
 	struct b53_device *dev = ds->priv;
 
-	if (is5325(dev) || is5365(dev))
-		return -EOPNOTSUPP;
+	return !is5325(dev) && !is5365(dev);
+}
+EXPORT_SYMBOL(b53_support_eee);
 
+int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
+{
 	return 0;
 }
 EXPORT_SYMBOL(b53_get_mac_eee);
@@ -2240,9 +2243,6 @@ int b53_set_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
 	struct b53_device *dev = ds->priv;
 	struct ethtool_keee *p = &dev->ports[port].eee;
 
-	if (is5325(dev) || is5365(dev))
-		return -EOPNOTSUPP;
-
 	p->eee_enabled = e->eee_enabled;
 	b53_eee_enable_set(ds, port, e->eee_enabled);
 
@@ -2298,6 +2298,7 @@ static const struct dsa_switch_ops b53_switch_ops = {
 	.phylink_get_caps	= b53_phylink_get_caps,
 	.port_enable		= b53_enable_port,
 	.port_disable		= b53_disable_port,
+	.support_eee		= b53_support_eee,
 	.get_mac_eee		= b53_get_mac_eee,
 	.set_mac_eee		= b53_set_mac_eee,
 	.port_bridge_join	= b53_br_join,
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index 05141176daf5..99e5cfc98ae8 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -384,6 +384,7 @@ int b53_enable_port(struct dsa_switch *ds, int port, struct phy_device *phy);
 void b53_disable_port(struct dsa_switch *ds, int port);
 void b53_brcm_hdr_setup(struct dsa_switch *ds, int port);
 int b53_eee_init(struct dsa_switch *ds, int port, struct phy_device *phy);
+bool b53_support_eee(struct dsa_switch *ds, int port);
 int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e);
 int b53_set_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e);
 
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 43bde1f583ff..a53fb6191e6b 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1232,6 +1232,7 @@ static const struct dsa_switch_ops bcm_sf2_ops = {
 	.set_wol		= bcm_sf2_sw_set_wol,
 	.port_enable		= bcm_sf2_port_setup,
 	.port_disable		= bcm_sf2_port_disable,
+	.support_eee		= b53_support_eee,
 	.get_mac_eee		= b53_get_mac_eee,
 	.set_mac_eee		= b53_set_mac_eee,
 	.port_bridge_join	= b53_br_join,
-- 
2.30.2


