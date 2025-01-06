Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AC0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mADUhzsEC0DSAkZRvhyikjiPCGNGx2x++rnr2RtZ8RU=; b=BrmULNkL5Ftqd3FudzaJc4EuN/
	U62SYDYeGpMfG7+TvEsn4qrRFmjicD7x8UAGuju669gXAJCJx2XcV/8foZJDzVccPj7LOJFFqb3y7
	Fkw28fdGSrhQDeQ7sxVTmlyKCvCnpS6WREh4QQL1OKdVeeVfaQgmQGfBeU1WMYl93+IjVmiZW6REh
	Jhvam33MwbL8qoiN2HBPI/kK+lJvyCmc5MXQY9oUX10ZJMgv8+isF8pZLRz7DGzFxH/61XnK68CRB
	XC/GhH6L0KpCVL41aBXBU3uR6im3SWpLa10QHvWuAZMUTVI17m8Ui8XUf9WC0kFJrJbIfD7X08bTT
	yDil3kpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqdr-000000024qq-0QOV;
	Mon, 06 Jan 2025 17:11:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqZv-000000024MI-1e3O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mADUhzsEC0DSAkZRvhyikjiPCGNGx2x++rnr2RtZ8RU=; b=gD/nQUT9zidMUdTqtsuAAaZiSP
	o2XuKNYkq4p/pygMLhje0ZsOy0KXzG29Yvdc40HiO1M0xxYKoC8WEbXIj4TPKT1i91gMSd8Fns9s5
	oGUlI2bw2ug63n0L0W3p8cTMDSX4GTt9a3jZ0y4x/jX6TjMoDBUy3DgtOgwc5gH61lt8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqZn-001wRk-Sg; Mon, 06 Jan 2025 18:07:39 +0100
Date: Mon, 6 Jan 2025 18:07:39 +0100
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
Subject: Re: [PATCH net-next v2 16/17] net: stmmac: split hardware LPI timer
 control
Message-ID: <ac4ca4ad-5c35-4842-855c-2b1a052660f6@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmBJ-007VYB-H2@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmBJ-007VYB-H2@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090747_429246_9E081CE3 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, Jan 06, 2025 at 12:26:05PM +0000, Russell King (Oracle) wrote:
> Provide stmmac_disable_hw_lpi_timer() and stmmac_enable_hw_lpi_timer()
> to control the hardware transmit LPI timer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

