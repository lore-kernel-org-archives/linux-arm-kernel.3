Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDE0E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHGBpnOJSbQXIJIcFls+W2wBz5McA8yNE0ntaczE2hE=; b=ZZy9GgB7/BoBwnOHYJ1+ORpHVh
	S165mqdX15o/7EbCXQiJX0sW3ZAmc62cnugKFEkSYv4/fOOTCaeyuSMZ8Rvhfe1c1LZcbdfthstCc
	sPfM7HdagXp3nNu2dguyzWQt4F1FgsO0C8eHnQZjd68udbHAFuLrQFTSXMNv9JJ3gFVrs5mA6fcSr
	gAqyzbjaISUPIvNtL9B8fTms68O0j0QS1C+r/H+nYCjnbAWADReCl7DzsMww2u3AjshYg1X558ROj
	geebmmQ62wW2xLZ022I1qntjae60k5x1uokeIZn8zvvjj1zYg0B00onjmZHtiyJrK09a8MRhSNVe4
	Bq3q00wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ0o-000000050Fy-3EVa;
	Mon, 13 Jan 2025 11:53:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItm-00000004yiO-1Sfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eHGBpnOJSbQXIJIcFls+W2wBz5McA8yNE0ntaczE2hE=; b=07IgX5hzLIa68QEHroPBGdGykk
	ylc62DhROu9kE3gMANoaYDxGIaU7Lm8Ffz6GSzTB1TjeMDowHqmiPFG/gVaKxzu+wF3BjC0nn9Qks
	L+hyXuq8L3k95XzNlCZE0j23Il+PClcGVKTIDmDzaOVYNJZkdPU/btLl2TphPtDrbBMAbMJXSyPqK
	vsdKhyd2ubop0qIlcejcA8k8cbmVaQsrhDLRxFQJX6CYEPzqxJnCb3EgSHgMUg8lIPHHx2KU+VmfJ
	QQtUrMj8Sl4QXQhPc4mkjACkpUX0UXbwByEHqfopxwNgjP4FZhxLXNCQmKAOljmEaCMv7BEEunLYu
	9Dt05LNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35704 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItf-0006Vx-14;
	Mon, 13 Jan 2025 11:46:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItM-000MBI-CX; Mon, 13 Jan 2025 11:46:00 +0000
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
Subject: [PATCH net-next 5/9] net: stmmac: add stmmac_try_to_start_sw_lpi()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItM-000MBI-CX@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034626_384029_74194145 
X-CRM114-Status: GOOD (  11.97  )
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

There are two places which call stmmac_enable_eee_mode() and follow it
immediately by modifying the expiry of priv->eee_ctrl_timer. Both code
paths are trying to enable LPI mode. Remove this duplication by
providing a function for this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 26ff1ded4e3d..2bb61757e320 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -426,6 +426,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 	return 0;
 }
 
+static void stmmac_try_to_start_sw_lpi(struct stmmac_priv *priv)
+{
+	if (stmmac_enable_eee_mode(priv))
+		mod_timer(&priv->eee_ctrl_timer,
+			  STMMAC_LPI_T(priv->tx_lpi_timer));
+}
+
 /**
  * stmmac_stop_sw_lpi - stop transmitting LPI
  * @priv: driver private structure
@@ -449,8 +456,7 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 {
 	struct stmmac_priv *priv = from_timer(priv, t, eee_ctrl_timer);
 
-	if (stmmac_enable_eee_mode(priv))
-		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+	stmmac_try_to_start_sw_lpi(priv);
 }
 
 /**
@@ -2782,10 +2788,8 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			xmits = budget;
 	}
 
-	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode) {
-		if (stmmac_enable_eee_mode(priv))
-			mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
-	}
+	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode)
+		stmmac_try_to_start_sw_lpi(priv);
 
 	/* We still have pending packets, let's call for a new scheduling */
 	if (tx_q->dirty_tx != tx_q->cur_tx)
-- 
2.30.2


