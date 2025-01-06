Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08E4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4HcR+uk2k+/haMI6YVeZlGnK63mLuRugXFx+MkSpyg=; b=Kit3z0XCObaaPZucnksd2ZelZd
	8J6YlGWFR7NI7Uj1Qgiub+LFgmgn03a0oKrCnRGa+xA1JU9BYF7IDAgwrszISTeiaIMRUPX8sG6e1
	8Y1RQKopQ6As1QHFjCWgcqOO2QKknbnmlDZ53WqKLZ4s+DgZiQt2eKrOzKcM7koRell0TKZeMM1cC
	JGivzQ3X8zijsRDoVJpbL5lwI5TL6SmOTAHSB91hAC5tdHTYGsw586jgYegvp4IKZgM/SGuNeslMZ
	/JsKprjxSDEfeZESyuW1ipXcD6Tk8IRKtmtT7jynkf+aC5LOy9xeOIAmJJz/Ki2o6qSC9lPMivczy
	avHSOVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlnm-000000017bB-1i5e;
	Mon, 06 Jan 2025 12:01:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUllS-000000017An-4Bkb;
	Mon, 06 Jan 2025 11:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I4HcR+uk2k+/haMI6YVeZlGnK63mLuRugXFx+MkSpyg=; b=Goh2vXItiH09PqezFLHuJQtp2U
	P5zntrSx/FulA4azPuWyssK9DSZkHWpfo/qXKi8WPl0pv9V7JF88R7yEqMOUiySACtCw8IhnCNJw6
	46dWShQc7xK1+yEHClakI+TTmY93FuyK7V768Q6uvnXhsXmuT3o8X698Derh7Z5ju6t9/eT9v+E3N
	APIhdprS9XPGzzNrfRCIHOh/wwbWrceRsY2rzLVeJAgBPvc7SxcS7WxGF+rYBn2eiSIZ9ulerxVyN
	HdZbewK24C5+tamDhfHvIYsDvHtHnPT4oVsffv7AYuG60oXNBySqKdqERLI3BEEmK/RniBvi9PXj1
	ik5tXUlw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37114 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUllI-0005lR-1Q;
	Mon, 06 Jan 2025 11:59:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUllF-007Uz3-95; Mon, 06 Jan 2025 11:59:09 +0000
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
Subject: [PATCH net-next 6/9] net: dsa: mt753x: remove ksz_get_mac_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUllF-007Uz3-95@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:59:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035923_091703_53237E1A 
X-CRM114-Status: UNSURE (   8.32  )
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

mt753x_get_mac_eee() is no longer called by the core DSA code. Remove
it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 4c78d049b9f4..d2d0f091e49e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3085,12 +3085,6 @@ mt753x_setup(struct dsa_switch *ds)
 	return ret;
 }
 
-static int mt753x_get_mac_eee(struct dsa_switch *ds, int port,
-			      struct ethtool_keee *e)
-{
-	return 0;
-}
-
 static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 			      struct ethtool_keee *e)
 {
@@ -3233,7 +3227,6 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_mirror_del	= mt753x_port_mirror_del,
 	.phylink_get_caps	= mt753x_phylink_get_caps,
 	.support_eee		= dsa_supports_eee,
-	.get_mac_eee		= mt753x_get_mac_eee,
 	.set_mac_eee		= mt753x_set_mac_eee,
 	.conduit_state_change	= mt753x_conduit_state_change,
 	.port_setup_tc		= mt753x_setup_tc,
-- 
2.30.2


