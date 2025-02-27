Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FBEC1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9ysxQNObpMj0tWTkCYvhUMD6pgSFGpBY5F4SuiIMoE=; b=V5UX+qNGqJd/vT5pXwoXLpuror
	w4mfB+G9A/JdDiQmWQgfRvYpdugrIlILuyjSlTj3It5GWi7KBGwzDoHoDen4YG0oFU+z5YnRsbpwO
	2H3w2hbUVNfl+4sKfGeZiPy6K46ThfLhmWcSh703zJA710VxpvZk7SO1n2tIl4GGLMU6C0V2e99uy
	cGi/KMAJRzHq5QKTVLjt1EBMZ3ZfoPcygzRlIPI0TFRqGFZE8d7dr6lmr0PpfM2H/3L3wDlAeiwIz
	SaJNE3Wk4x32AD+ZTsKKpxhyn1H0cBc19+3BoUR5fMJntTYvOEej3mr/0Aj2dPFx0EMrUE+mfu+yA
	6ACkA0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneTE-00000007dbL-0qpl;
	Thu, 27 Feb 2025 14:02:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneOl-00000007cUm-3mMf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 13:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=N9ysxQNObpMj0tWTkCYvhUMD6pgSFGpBY5F4SuiIMoE=; b=zaGAyN1ir95YVFpBH/l2clB/C6
	ELGOAHxUhnzWb2aSaFC/W9lTCHcs4TeT1mp/5OsyXt+fMOpBjadz8IXffkh/C54sb09La7dV2y6yY
	cvYS7vsYuw0igvJqPRKwjDKjG0uCp3zspwJgqjcA8GeXvfszkkEnkxps0FTUT/6rNigA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneOd-000bnQ-Bz; Thu, 27 Feb 2025 14:57:51 +0100
Date: Thu, 27 Feb 2025 14:57:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/11] net: stmmac: provide set_clk_tx_rate()
 hook
Message-ID: <97073a6f-3200-46da-856b-e7431e09c859@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0F-0052sS-Lr@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna0F-0052sS-Lr@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_055759_950253_08C743FA 
X-CRM114-Status: GOOD (  13.17  )
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

On Thu, Feb 27, 2025 at 09:16:23AM +0000, Russell King (Oracle) wrote:
> Several stmmac sub-drivers which support RGMII follow the same pattern.
> They calculate the transmit clock rate, and then call clk_set_rate().
> 
> Analysis of several implementation documents suggests that the platform
> is responsible for providing the transmit clock to the DWMAC core's
> clk_tx_i. The expected rates are:
> 
> 	10Mbps	100Mbps	1Gbps
> MII	2.5MHz	25MHz
> RMII	2.5MHz	25MHz
> GMII			125MHz
> RGMI	2.5MHz	25MHz	125MHz
> 
> It seems some platforms require this clock to be manually configured,
> but there are outputs from the MAC core that indicate the speed, so a
> platform may use these to automatically configure the clock. Thus, we
> can't just provide one solution to configure this clock rate.
> 
> Moreover, the clock may need to be derived from one of several sources
> depending on the interface mode.
> 
> Provide a platform hook that is passed the transmit clock, interface
> mode and speed.
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

