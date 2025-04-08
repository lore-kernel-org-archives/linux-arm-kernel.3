Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8CCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTMv4vYxEzUm5dpYG+MypOSc4ymXE3Ae+3l357p9Ty4=; b=GaF6uLYN+6JLuTB/JKCDjWGw8W
	gIZa/hKSeC3skS4BDNQYM8ha1fY0fe4lcrNSfdpB6mHwQcjXS3CIdzlRkEQviU7I79KEwkx31Od1F
	uljIx3Vjj0Udl61yYwrWBbXiQ9/1CC/eNjwpZ7hMS3kxOr+EJgKOqWwHCBz26DoMskzgV7mglkgdP
	2Z7joFsUWDO5sOxY25IlcnLmTpQw4i2FMx3pfWyI0Fa5pMxXTyKJuSudEZ2JfNhn+6lRiSzJ+eAJK
	6iR1bS6LaycGhAC0+VvCh1OtX1MgtTLR3f2/QGkvgLFbBa2YAEh11MF7Db+HOj4gCP7VwJFWdBKMw
	d7Pa2OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EEq-00000005Be1-1gX0;
	Tue, 08 Apr 2025 19:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E8l-00000005Alp-2Y3b
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kTMv4vYxEzUm5dpYG+MypOSc4ymXE3Ae+3l357p9Ty4=; b=MR+NjBg/BNv2ZS+8uJT1FVzbBK
	pW28eNI2VlAfHJgWTnwpjsoBQidF7L8fcJLWqX3agsjLoOBbK0VkDdUNnIIf5+U6bi1Fe0IKWOzek
	5K8TzDUVavYTr3RqMEtaZjnvGCEa3T0EonenUcwkGa4slIo2qBnsA1qiyT6UhNJmuU5nMIbABUSZ2
	3MDg71WQ5Q9U5FePqHsr78HNrIUNPA+dAzqJLHIus631TZCC+IrXijNq2Ly3bcokN2qKhLm7Ryo0O
	WT2vz2ZN4dF+dapEkENeunhCBpc1qf69U7s5sMBaiVENiswbW4JtZNx8WJDDPkQ73fNv04c6Y5ahP
	5reKcj0Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E8i-00000008Oxy-1V2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kTMv4vYxEzUm5dpYG+MypOSc4ymXE3Ae+3l357p9Ty4=; b=SGJdSSs2C7nMBvTSLvYpH/5mp4
	822hLAWwWuKqzxjVhmmfZ9Kw2Bf6JI0OmSW4ewft+6kw9z35pxbB1pwdMw9sZlC9Kpwj7nJ0tgf63
	eVS+ren+O2qPPYK+wbFnmOsgL0Nh99xIJYBx7iboI4RO7QsB7eoPij7BCQl2BDpI3/Sk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2E8e-008RHT-Jh; Tue, 08 Apr 2025 20:57:36 +0200
Date: Tue, 8 Apr 2025 20:57:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 3/5] net: stmmac: intel-plat: remove
 eee_usecs_rate and hardware write
Message-ID: <157d8990-4dcc-4f36-ae6b-c908d1d12965@lunn.ch>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
 <E1u1rgT-0013gp-97@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rgT-0013gp-97@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195740_513572_D55D1E16 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, Apr 07, 2025 at 07:59:01PM +0100, Russell King (Oracle) wrote:
> Remove the write to GMAC_1US_TIC_COUNTER for two reasons:
> 
> 1. during initialisation or reinitialisation of the DWMAC core, the
>    core is reset, which sets this register back to its default value.
>    Writing it prior to stmmac_dvr_probe() has no effect.
> 
> 2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
>    MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
>    this register based on the rate of plat->stmmac_clk. This clock
>    is fetched by devm_stmmac_probe_config_dt(), and plat->clk_ptp_rate
>    will be set to its rate profided a "ptp_ref" clock is not provided.
>    In any case, Marek's commit will set the effectual value of this
>    register.
> 
> Therefore, dwmac-intel-plat.c writing GMAC_1US_TIC_COUNTER serves no
> useful purpose and can be removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

