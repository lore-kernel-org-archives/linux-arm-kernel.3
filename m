Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C32C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz+ycJGyz3nSRG9p8hP5+LC1RqbEPoiShhFlu0+Ke9o=; b=AEikUSxurAg5tAHBJHqOC8fZeB
	KoNDE//aGTN34NxKH7sz5VOX+SSY4nr+6iGOUouXHEoP9C/MOkbHmDXT6aG3KbwFgQ40yFSyx4E06
	mzEN+zaQQOdA04HsA4eg3RKx6JZjFYgfWPbtHefTX9F0KkdXDzhIrav2eiSVQtMQWFO6xfUR5jzVZ
	qY1L2WDbbKzxQFrRwvZn9l/9s/rEqvMPcQWtWwwRIAfElov5IvDTvsNLpyJ/Lu17r4wR3nTzc875g
	Le+/JRBFtU1zofvLU0ttzSRM1h6f4PStkPc7Q0Pm6i6R9S+cy2wwjaoNkwEuoLcUprCaAee4ef39C
	indplzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnyN-00000005EPi-2SFq;
	Tue, 28 Jan 2025 15:57:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnob-00000005C9z-1vvd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tz+ycJGyz3nSRG9p8hP5+LC1RqbEPoiShhFlu0+Ke9o=; b=th2CPtALOBlUQkboIvRSC7VEXS
	RqpZL/4H1pWtv+K0plXkn8ApIMU1cRhVBXV+L4neCOBobIKpMagIsf+rP8Fw6sWhn9VE5p0UQfSYf
	cI84ux9DzXKScvoGztv34XcfP8NRc2w46LNWABCePnThSDUY3TTjXlxrJyXjcphjVVuLNg1wu2FP/
	ILeVHQuqAqJ1ckJ47hB+IIj2Xl+1uZIvG7wMPxCMFTLaJoqc5a96Q3piw1SDWJJ8LRUSKG5KyHGE2
	lzphbQywc5NPAu+t27Y05DJTvkf9W1El0xhQ9BxmjITtzwWt54sUwKgOXCS1qLiI6bGveo+XUL2np
	tnzseGhQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39312 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnoX-0007Ul-0H;
	Tue, 28 Jan 2025 15:47:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnoD-0037Go-Qj; Tue, 28 Jan 2025 15:47:25 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 08/22] net: stmmac: clear
 priv->tx_path_in_lpi_mode when disabling LPI
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnoD-0037Go-Qj@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074749_497740_107F9A62 
X-CRM114-Status: UNSURE (   8.68  )
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

As other code paths do, clear priv->tx_path_in_lpi_mode when disabling
LPI. This is done after the software timer has been deleted and
hardware LPI has been disabled.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 485b2bfaf811..40b9e387446e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1052,6 +1052,8 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	priv->eee_sw_timer_en = false;
 	del_timer_sync(&priv->eee_ctrl_timer);
 	stmmac_reset_eee_mode(priv, priv->hw);
+	priv->tx_path_in_lpi_mode = false;
+
 	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
 	if (priv->hw->xpcs)
 		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-- 
2.30.2


