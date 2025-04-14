Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A84C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gnja6srub3n8tJYS03csOlPaZZrQF5QqUXIS5NZAuvw=; b=eCW73jAoPtoii2G1HkxddoG74o
	YJlBruoSiyZj4yaCi3MJAw4SUn7i0BlcqQEdD7D1TP6GTqmRrW85S8xs24iKw/Q1hBJ7ulFwyv8/Y
	JyUBYzjJjLnOAGjr7Kp4N07S4VlIPzpBK5r1H3XpIBTf5+eOsC//+F2mU+bE+70buPY5mP1L3V1VS
	jDkFmqnTpMuf3W/YJKcYarcO4P+WV3SKkXAhyk3YkQhLQmzHxSaWvBH3YT2hY17EbPAlCNXxaBjIq
	M5ccWy6Zy+0wTBnCxK8Wm7rfTQQ6CEpWX1wKsYKebycSpWKdenGhI7pOHYwgZhxWFkX4Nu7TWm+Di
	XbZKoHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G1N-00000001GGJ-3XuT;
	Mon, 14 Apr 2025 09:22:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FlY-00000001DN1-48Hi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gnja6srub3n8tJYS03csOlPaZZrQF5QqUXIS5NZAuvw=; b=Kgb3xxE+36KP1bFTLvCdZqc0HL
	e/Fh3IlAjOp4ZAvzc4UcuLthtIZD34391hP9VimUS8hvGE+b3sKLTkM2RJhz2ICgBX2q/L3W2N8PU
	tK23bjbOibkojsSFIa9MszfDB3ZqiVdtK5IetR771Sb9pCDCnCzMZ/cLZV7Yi7A5i5iefVyOMj6y0
	xLUXAV3hdJFU+iXPVjzBmlESzekW1wK6ZlrGTDjPBvL7IjmK2yfljrSDtaRHX2j43UO6l13L1SM+4
	i+Z6Aby5Njc4n79Je8xr+hSKWDIAiJDOUBWqyWFah6Syxj5YpL7SjxZ+Wgt92r7IPxQ2USKmRZg23
	LAP1tBMA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58320)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4FlQ-0006CB-22;
	Mon, 14 Apr 2025 10:06:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4FlM-0007cR-16;
	Mon, 14 Apr 2025 10:05:56 +0100
Date: Mon, 14 Apr 2025 10:05:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 net-next 0/4] net: stmmac: anarion: cleanups
Message-ID: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_020609_022255_8D92AA1B 
X-CRM114-Status: UNSURE (   8.22  )
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

A series of cleanups to the anarion glue driver.

Clean up anarion_config_dt() error handling, printing a human readable
error rather than the numeric errno, and use ERR_CAST().

Using a switch statement with incorrect "fallthrough;" for RGMII vs
non-RGMII is unnecessary when we have phy_interface_mode_is_rgmii().
Convert to use the helper.

Use stmmac_pltfr_probe() rahter than open-coding the call to the
init function (which stmmac_pltfr_probe() will do for us.)

Finally, convert to use devm_stmmac_pltfr_probe() which allows the
removal of the .remove initialiser in the driver structure.

Not tested on hardware.

v2: fix build error, add Andrew's r-bs.

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 25 +++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

