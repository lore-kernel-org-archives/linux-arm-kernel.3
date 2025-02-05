Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E4C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCFhGClg9CjSX5KAb4d8jJf4KQjHkPGgZ/ES74pcY90=; b=wg58HADsflvcaaefDlHfG+BgoO
	Of6nB3eAwbhEQA3QjMpbyVlnIDc1UFP61ioLFIs3YaOYxbwt9NEJPQaurRuLIvExtZbG+XkLEoz9O
	YyUuNsBrrLaAbvNI1kZPOql+r3TdULZ06UpXySNMAWvX72x+JTuDVq3J6aX+cYyOd3f/5qOYmnjd+
	HBEUegZJys01wCeH/195EJkKCFTuOEEHGyzNHsS/m9qYyJ4pRSACF0mV5CoEQCzEwOreWSdH9qa9W
	Mh96PsQ6GDy4rE9gdN8GF8j9R7xGJakWtBR7kcnllK90jqdiMU+/+dVF+nalk83d24CK7ihD1fcq9
	JsvENWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffhc-00000003QoS-07zE;
	Wed, 05 Feb 2025 13:44:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdh-00000003Q7o-1Ht9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=eCFhGClg9CjSX5KAb4d8jJf4KQjHkPGgZ/ES74pcY90=; b=mgpgmiTY3thPZQiKoNoE4PwYK+
	h12fwBVkA1FOl+riyzvVEUd/6RCWap8XC1+Qj65GyoaZMMxxZ4gHTFI6qiG4yoiOU1phDEZX1yXIS
	CBnkKSYfRBlOC9kZcwyctAmN+m1/U2uFKLiTsW76riCl/ntGmrsMFaOQWWhrf2yQ+30JIhonWLVHb
	PrznqA68I4SmQynxUzLlCFsyP/1yWq60NoR8x723nxhS34ZvCDp6PaPJQ65SorIWGiqAr0uaWlaQ2
	L13lwx+RHQWDwhgAd0S6c2+awZ5myTpCN+E/yl7ALRFbXrxY+zjNsO/CFYXWM50L/wTyrqksH24iF
	m4OIgfSA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffde-0000000GeS3-1VQi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eCFhGClg9CjSX5KAb4d8jJf4KQjHkPGgZ/ES74pcY90=; b=GNZ2u28Thy6rnj0vAO8fROn9v6
	9Qba1U4DIdMUk+vrH96TgOA2vfxU1X2C7OCCJUHqqsS+3SoeyCHHoQrwZlqko/E+44BJfx16kqQnz
	JC/48n4YOXKLsXNbRWGgeEJ4AMeGyyc0MxkSa6QX3wm7QcpEHhUSMSv/x9aBeFnYBBj+5l7MM2OI7
	KFArwXPiQvsOOU7apWM0O2S+d+dKINphB5nS3wlvIZvco/IsgXTMv9VXxH/UyhiCEeTWnJbkUTi2U
	Xa4W8ZX5cfxrDJzDcu/nITejHvFJSNRwrQ8DQlRgXqKT62wDZo0nrrrGhinQOQ6sd87mx32gp3YxT
	m0OmaxbQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58636 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdX-0007AM-0o;
	Wed, 05 Feb 2025 13:40:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdD-003ZHh-Ew; Wed, 05 Feb 2025 13:39:55 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 03/14] net: stmmac: dwmac4: ensure LPIATE is cleared
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdD-003ZHh-Ew@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:39:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134022_728082_DCF0BC3A 
X-CRM114-Status: GOOD (  13.67  )
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

LPIATE enables the hardware timer for entering LPI mode. To sure that
the correct mode is used, clear LPIATE when using manual/software-timed
mode to prevent the hardware using the timer.

stmmac_main.c avoids this being a problem at the moment by calling
stmmac_set_eee_lpi_timer(..., 0) before switching to software mode.

We no longer need to call stmmac_set_eee_lpi_timer(..., 0) when
disabling EEE as stmmac_reset_eee_mode() will now clear all LPI
settings.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 9ed8620580a8..17bf836eba7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -387,6 +387,7 @@ static void dwmac4_set_eee_mode(struct mac_device_info *hw,
 	 * state.
 	 */
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
+	value &= ~GMAC4_LPI_CTRL_STATUS_LPIATE;
 	value |= GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA;
 
 	if (en_tx_lpi_clockgating)
@@ -401,7 +402,8 @@ static void dwmac4_reset_eee_mode(struct mac_device_info *hw)
 	u32 value;
 
 	value = readl(ioaddr + GMAC4_LPI_CTRL_STATUS);
-	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIEN | GMAC4_LPI_CTRL_STATUS_LPITXA);
+	value &= ~(GMAC4_LPI_CTRL_STATUS_LPIATE | GMAC4_LPI_CTRL_STATUS_LPIEN |
+		   GMAC4_LPI_CTRL_STATUS_LPITXA);
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fecf9e8b29bf..c0472738bc76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -493,7 +493,6 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 			netdev_dbg(priv->dev, "disable EEE\n");
 			priv->eee_sw_timer_en = false;
 			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_disable_hw_lpi_timer(priv);
 			stmmac_reset_eee_mode(priv, priv->hw);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
-- 
2.30.2


