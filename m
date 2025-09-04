Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14167CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZcXvnUxZ9WwZU+v3rNVmIX53fawzGgpE8MkePJBJ50=; b=NikWE3F1+4VNYo/xsf5z/VK9ft
	i36oswBWV8RaMNuoykE3Y7rSYQ3JaDHEMp62Gb9/J6JBH+6kZ9KEdylJENBDNPOtHDcCNq/Z5FkFb
	vfbBxPPzqvAusgensINIzmj9RugyCX+3N3/FSrzB+VqQ0uPPPA22nyCc03phTSsujfqGwmqafnQv7
	w+G2h9FUGj6lAw/9V1XU38k1n85DKdIW4BL+CUJKXubXt35hPX33E+RHqgEtDARBxE+n7S2NtpLZ5
	XG5VP9Xk+gttcPokw7pKE25v6bTHDRV5pqnaeTshlYcOv83R15mmQl/c5TtBt/rt9MijPAj+sgU9L
	7UqQdzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1B-0000000Fyc7-2Lz5;
	Fri, 05 Sep 2025 02:17:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF8J-0000000Dldg-0djj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hZcXvnUxZ9WwZU+v3rNVmIX53fawzGgpE8MkePJBJ50=; b=SL9h4ZKKlQ3xcdvwGycKclzwYP
	eXRa2gzUfRoxgMtfbuMQy9QapsvIi4+yFgm1dVpPOzC+pmC1okGHpzld7OLOcT04khq45kb5HEosm
	EsZm4ZSOQk0HLd7/4yk5cGq5CybH0CoOKxfWM3zUcEk7pJi7DRZWcxjevSj48cQN7rZE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuF8E-007G1C-Ti; Thu, 04 Sep 2025 20:56:26 +0200
Date: Thu, 4 Sep 2025 20:56:26 +0200
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
Subject: Re: [PATCH net-next v2 02/11] net: stmmac: mdio: provide
 stmmac_mdio_wait()
Message-ID: <f95b34b6-2c58-4263-bc4f-cc604e928c66@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8nx-00000001voa-0tJ0@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8nx-00000001voa-0tJ0@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_115631_205413_1EF5EA1A 
X-CRM114-Status: UNSURE (   9.53  )
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

On Thu, Sep 04, 2025 at 01:11:05PM +0100, Russell King (Oracle) wrote:
> All the readl_poll_timeout()s follow the same pattern - test a register
> for a bit being clear every 100us, and timeout after 10ms returning
> -EBUSY. Wrap this up into a function to avoid duplicating this.
> 
> This slightly changes the return value for stmmac_mdio_write() if the
> second readl_poll_timeout() fails - rather than returning -ETIMEDOUT
> we return -EBUSY matching the stmmac_mdio_read() behaviour.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

