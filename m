Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4D0D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc3sVUvSf0qUFVLW+MD3C2Ls9fTd5d+/oumz9FXoC4A=; b=1ZH7C6cfyeO48T+fX9LQX/TOBs
	5hSL0dCxyEnwtRTBAGQZVH4Gc1CEXisipHnLSS4bqI+8OPScAkcE/TThYsDxkyfe9ayPHVWprV1yO
	aReir+xsrSpJMH9RQ0PSqocamPPqK/0E4ncqTvh7EQNVM9sr28jAkpQGVgM9loesQNyT5Mv/UV+3l
	ZcjUNNcveRIk+kcCxc1Y8CD3drwdBbiFGkexZCiasThIZPk2g3kGGzcbE6AiN9cT1s0A/qJQSt8/1
	CapvAUGuLU3/x5/Zo1wkmsB7iP5X6IvrjCnaSpMc+XqAt2/hMnjP1tMuFT8cn1THN1Zq8mfjg4hSO
	R3IjTsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvF0-0000000AeFf-3hVP;
	Tue, 26 Nov 2024 13:04:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv44-0000000Ac80-473C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wc3sVUvSf0qUFVLW+MD3C2Ls9fTd5d+/oumz9FXoC4A=; b=Rjwn3XILVDPJ0eirjgFSYPimec
	F4nd33yRg4/1N8ULTyd6TYmvclbMLfFCl7aYr/57Ya6A6kYcQ6AhhjT/aeRPDJ5j21SAwVN+tC6T9
	cI0froY5Q0UgqXWzSKyxUCLnISyhavJxEYk4ctGTsGL/yldCVq6hF3mFpZgBP5h2oiyrn65YqMUMr
	yl/nuZYf8YXtLKHh0e0ebaU9HM29SiIhmfG5I8dqlp9kxpwkOaV8o4sMQZBMaqGV01PaLjHHQ3qhG
	o2U/lN9rFTPuyPToId0p+Wo4v7Fzq8HCzHikPrMk8ECVBzwW+jxQQ+Z9RCOApDmeuyuAmZwFCIr3l
	+Ia2TmqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39456 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv3w-0006uM-0F;
	Tue, 26 Nov 2024 12:53:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv3u-005yiF-76; Tue, 26 Nov 2024 12:53:02 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 10/23] net: phylink: add phylink_link_is_up()
 helper
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv3u-005yiF-76@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045313_015158_862DFC64 
X-CRM114-Status: GOOD (  10.99  )
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

Add a helper to determine whether the link is up or down. Currently
this is only used in one location, but becomes necessary to test
when reconfiguring EEE.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 30a654e98352..1d68809403de 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1442,20 +1442,21 @@ static void phylink_link_down(struct phylink *pl)
 	phylink_info(pl, "Link is Down\n");
 }
 
+static bool phylink_link_is_up(struct phylink *pl)
+{
+	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
+}
+
 static void phylink_resolve(struct work_struct *w)
 {
 	struct phylink *pl = container_of(w, struct phylink, resolve);
 	struct phylink_link_state link_state;
-	struct net_device *ndev = pl->netdev;
 	bool mac_config = false;
 	bool retrigger = false;
 	bool cur_link_state;
 
 	mutex_lock(&pl->state_mutex);
-	if (pl->netdev)
-		cur_link_state = netif_carrier_ok(ndev);
-	else
-		cur_link_state = pl->old_link_state;
+	cur_link_state = phylink_link_is_up(pl);
 
 	if (pl->phylink_disable_state) {
 		pl->link_failed = false;
-- 
2.30.2


