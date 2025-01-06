Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B27E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUWR+zB34gQucD9TutxNRjsruuEg8bng53IkXPVvSQE=; b=MV2Hm/C9pAtJewXl4pMWOzseGk
	1gikIwqRgotJzlUz8OrzRL4OMpYnCvDAUvYmFIhBeSiEK3VEZ8DB2Rf99ZniedwIDtbKZ/DvyDtiJ
	S58BCL5HpsMjTcp07r8Gmrk73JBfhszIemFtAnd2udqVybVXAWX2xfh0mVKOxivzxKCYy4PqScj5q
	Y+SzpWUuAlx7W9QccKHQUUYlAyFcHZ+/0JHxMvZwOl3RzL9umZDMDhCCJffplVpJdJ+ARVaEvybnW
	lfRnu5lQTaUlykwoGl6o3QjUKTcGxk/vQ+pvzNNnDVyHa/J2vFHGwxxW0BY6tfQh2agDNA48Wo1Q5
	pX51yX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqId-000000020yk-3yA7;
	Mon, 06 Jan 2025 16:49:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqHS-000000020sx-272O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OUWR+zB34gQucD9TutxNRjsruuEg8bng53IkXPVvSQE=; b=yvf2PkxZLIL2hq1wmUMNlSKchr
	ybXJsLCgxPzKgLpg2XTtyD4D6s5RzYLfEJUiXlGs3Vz9wRcF6AiYrB1iY0Ust1sTfH0Ohfnk2FWts
	v27nV5JBNvC6AuTTNvtFngJ2yOFJAn6JAdVx8fpUQX3HPya5zrcWTji/TjA4Ld8ckVy0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqHK-001vx2-PC; Mon, 06 Jan 2025 17:48:34 +0100
Date: Mon, 6 Jan 2025 17:48:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 04/17] net: stmmac: make EEE depend on
 phy->enable_tx_lpi
Message-ID: <435a1b40-12f5-4eca-a9d8-030c0661a9b3@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAK-007VX1-2Q@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAK-007VX1-2Q@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084842_543992_E8CE5F11 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, Jan 06, 2025 at 12:25:04PM +0000, Russell King (Oracle) wrote:
> Make stmmac EEE depend on phylib's evaluation of user settings and PHY
> negotiation, as indicated by phy->enable_tx_lpi. This will ensure when
> phylib has evaluated that the user has disabled LPI, phy_init_eee()
> will not be called, and priv->eee_active will be false, causing LPI/EEE
> to be disabled.
> 
> This is an interim measure - phy_init_eee() will be removed in a later
> patch.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

