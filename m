Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A5FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkfjVEKFOzj0a7pCRXpz7lWWXfngyymyfaKG/KilTm4=; b=hMwM4BUlzzfH3r2tDDkIZYQux+
	6O8Ogc5SjCElj6Iizz3RHsqbkTSUwgSsPOYY0zXvnfE+wJU5xJE4jY0WofbcDkhi9nIKC+9GE4cTI
	7yLEJNPPiNP/KMUfDhiqVjO9Io6+6SckB1y7l2mfWDITLYUXgVyRg63V6/IL3xHGr+G1mZIvxlRRY
	7krE3XSyt3H2E+ztQrWHNsi08GG2vJTG28TaujcgErecUSU8cOt6M3euT1ynnZ1vOaV+oJ3qccgvl
	FdAI6UFP2bN/Yh64HJn6sWytmORi1xw0Ieye68l0f+p/88n7wnsDeFLd8ZJIlDAHGFcXWOONsyc0c
	TDg7FNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7D-0000000EjYm-1Osp;
	Thu, 12 Jun 2025 22:09:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkD6-0000000DrYO-4AMS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tkfjVEKFOzj0a7pCRXpz7lWWXfngyymyfaKG/KilTm4=; b=CSMzHpNGvshGmE6pFbWM7AxiAY
	zz9nF5tji5P1lwNv1GmvSO0YaIU4HX8QOJrOKNEX2W8Rm9HxtzZ9jxks+4ggNyTmbiOrr6cwbeglh
	lA1IpC0XjJz+imWdz1GR2agMfoQ+1TKMzOL87mn63Zsz+m2OoLj/GbmCMam0YgRLpNIs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkD1-00FZEt-UZ; Thu, 12 Jun 2025 17:51:19 +0200
Date: Thu, 12 Jun 2025 17:51:19 +0200
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
Subject: Re: [PATCH net-next 6/9] net: stmmac: rk: combine .set_*_speed()
 methods
Message-ID: <76cdb7b9-1c2c-4c0e-b948-4863dc1756db@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk39-004CFf-7a@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk39-004CFf-7a@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085125_027923_ED24025A 
X-CRM114-Status: GOOD (  12.82  )
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

On Thu, Jun 12, 2025 at 04:41:07PM +0100, Russell King (Oracle) wrote:
> As a result of the previous patches, many of the .set_rgmii_speed()
> and .set_rmii_speed() implementations are identical apart from the
> interface mode. Add a new .set_speed() function which takes the
> interface mode in addition to the speed, and use it to combine the
> separate implementations, calling the common rk_set_reg_speed()
> function.
> 
> Also convert rk_set_clk_mac_speed() to be called by this new method
> pointer, rather than having these implementations called from both
> .set_*_speed() methods.
> 
> Remove all the error messages from the .set_speed() methods, as these
> return an error code which is propagated up to stmmac_mac_link_up()
> which will print the error.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

