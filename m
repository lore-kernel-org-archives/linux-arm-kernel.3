Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69417E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlZYWPX0QNCSKKO5JWx1URTrYTNj5bjTeUg1yJzKm6g=; b=Bsg/qXhs+I3pNyBPH1xY9qOjKg
	QP7B7UuTVOTw/WgNP2/S6rOXMuaohufsh9taw1dpVXuRYnD/dgFHnLdPId7Y93YVnHuDIC999qvuf
	AnfqmEppXhr4+RI2rHvT1pb7FnCsyQnJuLDmeHqxGOPX/7nBXhE5Ja9/vgWE7eJX+hdHZRD+UBOcP
	OLKtMNBoV2CUDU73UDvlv9is+tGtiKfbevCMM2Te3k6geDwUJ2MTBKxRCDXI6BORtEbXQpxrFu9sw
	1NReZYbfcTWeH3X0swDNxOg6dywkIVG/EPg5tu78RppPunEKnKJIHHLB87wX2gsKrEFZB3H7dzzVr
	Vg/b38Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ3D-000000050dO-0S7S;
	Mon, 13 Jan 2025 11:56:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItx-00000004ymv-2qtb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OlZYWPX0QNCSKKO5JWx1URTrYTNj5bjTeUg1yJzKm6g=; b=CEVqnTPusTw+aupRrYqlu84HHr
	/uDDsggTdYHG/CMitY1r+ceWHqYlZxEnITYNiOoqAhCbEbg8LuDndZA2x8+B74LGUlk0xjizBemZY
	4MLhDG3qwEc/fn4P8fhTQEL5psw6fJsvJ3xYEJSm7ZoUqaUMBa2cVO4vPDBWEATKxqsPljsEjgAVb
	RAKjZqFXH7GpllEcahl4sbFKHZvhCZH3SgBNFfuzmVNWaD0lZBmaweN1ui4sj2ug2lSy3BAd/L8Q0
	/T94hvXNLMlEKf5R0f9lq8rVBlt8IMk7IuR7XkaCvdH9uKB7207cUoIp/eadNipG0So3kunn+R54S
	sx0BhEeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45902 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItp-0006WZ-26;
	Mon, 13 Jan 2025 11:46:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItW-000MBU-KQ; Mon, 13 Jan 2025 11:46:10 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 7/9] net: stmmac: provide function for restarting sw
 LPI timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItW-000MBU-KQ@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034637_716329_8545EBAC 
X-CRM114-Status: UNSURE (   9.97  )
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

Provide a function that encapsulates restarting the software LPI
timer when we have determined that the transmit path is busy, or
whether the EEE parameters have changed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ddbcbe3886c0..677a2172a85f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -416,6 +416,11 @@ static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 	return false;
 }
 
+static void stmmac_restart_sw_lpi_timer(struct stmmac_priv *priv)
+{
+	mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+}
+
 /**
  * stmmac_enable_eee_mode - check and enter in LPI mode
  * @priv: driver private structure
@@ -437,8 +442,7 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
 {
 	if (stmmac_enable_eee_mode(priv))
-		mod_timer(&priv->eee_ctrl_timer,
-			  STMMAC_LPI_T(priv->tx_lpi_timer));
+		stmmac_restart_sw_lpi_timer(priv);
 }
 
 /**
@@ -526,8 +530,7 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 		/* Use software LPI mode */
 		priv->eee_sw_timer_en = true;
 		stmmac_disable_hw_lpi_timer(priv);
-		mod_timer(&priv->eee_ctrl_timer,
-			  STMMAC_LPI_T(priv->tx_lpi_timer));
+		stmmac_restart_sw_lpi_timer(priv);
 	}
 
 	priv->eee_enabled = true;
-- 
2.30.2


