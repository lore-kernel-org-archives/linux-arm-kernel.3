Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C89FD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=538ON5EPZTBMBX3+al1tdLxWXuKOKR+PvV1XuIE1imE=; b=Ni5Agw1OoQvImTsN5sbqI3bUbL
	FFhl1jBafajKFfGXr+2Nh7TlVoD9P/b9iiDm+Wd5uuXfYRiMethPzk69Spdwl/PyeKz3FcYOLB31o
	uXTkh31MDjiQxGFtumZWHAZbjSWW14IGW8BiJ4884jCW9XSVNXlF1MWN+n+OfL00oVVteoMNDsM8m
	2TeBEbcSgqNM5HstCH+OtZ8kx57LbJuaGCA8+e8mE5NorcTW4rAJ2k1xD/Q3OTwxqKTJR3mfwWhSd
	Z17XLjyYkHZcY3yJm4hEMh3BBnB8keSpoKUNRSIEi48wVnF70AZbrfrwmwcMFzTdmXZhghwYf2hjR
	9kTm4WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrtV-0000000A9fP-2ipT;
	Tue, 26 Nov 2024 09:30:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroJ-0000000A8P8-0E5e;
	Tue, 26 Nov 2024 09:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=538ON5EPZTBMBX3+al1tdLxWXuKOKR+PvV1XuIE1imE=; b=S11dqHZK7HrPo/UXqJai8zRyvl
	1JuxX7nIV7wvR4ffWWtihwnXdH2MyJzO1NRQ5V4sxZDeY3fuYYTbir1JxOKsBcFs4YXToaesHyZqw
	XgcerYg5PL+2cANaFi9DKegtqevg4wzGGCBkJTO0UkQ59ueG2XkPOZ944KPH3zE/vX8Fqu+t5j/iy
	TddSLwbKQhMe6WXuHqURWFvfqVUVzW4worReUja5FQyweE4O+QYYn026hv4P/dsFGKO6+8LvLIVfD
	TBvC4ZU9pFe5VHtyW8dga3EUl1mnu8JznvfzFEpfkdjYnuUirUo54tsHl2BKOiBlmWQKkC9Ka0m97
	YkprexXA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37306 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFro8-0006SK-1F;
	Tue, 26 Nov 2024 09:24:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFro6-005xPq-S1; Tue, 26 Nov 2024 09:24:30 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 03/16] net: phylink: add debug for
 phylink_major_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFro6-005xPq-S1@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012443_087928_6E510319 
X-CRM114-Status: GOOD (  12.72  )
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

Now that we have a more complexity in phylink_major_config(), augment
the debugging so we can see what's going on there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 43a817de4bc8..e43a083cec57 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -175,6 +175,24 @@ static const char *phylink_an_mode_str(unsigned int mode)
 	return mode < ARRAY_SIZE(modestr) ? modestr[mode] : "unknown";
 }
 
+static const char *phylink_pcs_mode_str(unsigned int mode)
+{
+	if (!mode)
+		return "none";
+
+	if (mode & PHYLINK_PCS_NEG_OUTBAND)
+		return "outband";
+
+	if (mode & PHYLINK_PCS_NEG_INBAND) {
+		if (mode & PHYLINK_PCS_NEG_ENABLED)
+			return "inband,an-enabled";
+		else
+			return "inband,an-disabled";
+	}
+
+	return "unknown";
+}
+
 static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
 {
 	switch (interface) {
@@ -1164,7 +1182,9 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	unsigned int neg_mode;
 	int err;
 
-	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
+	phylink_dbg(pl, "major config, requested %s/%s\n",
+		    phylink_an_mode_str(pl->req_link_an_mode),
+		    phy_modes(state->interface));
 
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -1180,6 +1200,11 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
 
+	phylink_dbg(pl, "major config, active %s/%s/%s\n",
+		    phylink_an_mode_str(pl->act_link_an_mode),
+		    phylink_pcs_mode_str(pl->pcs_neg_mode),
+		    phy_modes(state->interface));
+
 	phylink_pcs_poll_stop(pl);
 
 	if (pl->mac_ops->mac_prepare) {
-- 
2.30.2


