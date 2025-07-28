Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0446C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNke7P0p2MkmqnbIedx8TUmpEi+fJFfmn41mD4GRN0c=; b=AfPOJ3hNSx10zt9fJZdtJJhfbV
	bfUYOgyDz50S72r7tiygJWpEn19cSf8mlys/iueAL5JYxIsx8h7QfQHwRhNKaYY+Mgjd4rDe7y2tv
	rKa5tGKL3+LpkfkWuXtHbZG2mKd2HgHACgvOOrG+HjfvqFEJSgcXWVyXCfzPNtFXhcw9C5Z4sQROz
	D1aujamY3WsqF+tU95iIxYcZTMIMb7/8sdqjcMuVWPrBDp9xQe7lvK+J1FMgk7RQefgNA9OrxsS0v
	gUpQQNi4LccjL727DarIvggzvDsGf5jnDm/x3xN7j1D336f6F0Sh1TQ4DRQWX4LleKlpfJPFNHfUX
	u3dDFBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS6X-0000000F9mi-1nxJ;
	Mon, 28 Jul 2025 17:57:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRf7-0000000F6jS-2GJQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 17:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FNke7P0p2MkmqnbIedx8TUmpEi+fJFfmn41mD4GRN0c=; b=UG1YiZTSMt75ORDw7IvL051q+r
	diP1xSOZXmKKkPVSv8XVg8+rnjJinl8wWGEZhh/F2v7rttFLlt+JDVu7wf0ZD/TCsExPHN+V+SQMM
	OPPrBITpide3+w2l0m9klmslZ3H/42WiFxMAG2MtyNP2Mw1kyT8LoqjiMznvlTNOF/VkNkAUPFDrh
	6pwwZOavwlIxL8OdY9ecUJK8mihoCx07R/ugVK0fWgpez1rT4wdO9i1yi1t/ztqaj29PVGG3S+bWg
	ljQOTQ1bIyVuWYn2/fLeT/83OGP0aJLWiyyklYWHSnUXxMsDo4vLSYBx0g22xEUppMD3t4hFCJCq1
	D+xRG4bA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRf4-0000000CVmG-3Gll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FNke7P0p2MkmqnbIedx8TUmpEi+fJFfmn41mD4GRN0c=; b=YuYfw3ryZeHrVLS46MwEIEeXRB
	eGP0ZB10wUTlicKTx0DfFocl/rtx4e4M9HQwCozwkytb2fEU/Omk+u0bj2jZGnwlOl/ZOVac/VJLc
	WwoIRheN+7Cw9GpQD+HJCcFEbqKlL+SD+UR18iY6U2i02wWRKoZJmCeAPVOvBbJjvbZ4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRev-0037SU-IO; Mon, 28 Jul 2025 19:29:09 +0200
Date: Mon, 28 Jul 2025 19:29:09 +0200
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
Subject: Re: [PATCH RFC net-next 7/7] net: stmmac: explain the
 phylink_speed_down() call in stmmac_release()
Message-ID: <b612eaee-17f2-4cab-bc37-a1cb9560ffe1@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ38-006KDX-RT@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ38-006KDX-RT@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_182918_916562_3478A05A 
X-CRM114-Status: GOOD (  17.96  )
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

On Mon, Jul 28, 2025 at 04:46:02PM +0100, Russell King (Oracle) wrote:
> The call to phylink_speed_down() looks odd on the face of it. Add a
> comment to explain why this call is there.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f44f8b1b0efa..0da5c29b8cb0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4138,8 +4138,13 @@ static int stmmac_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u32 chan;
>  
> +	/* If the PHY or MAC has WoL enabled, then the PHY will not be
> +	 * suspended when phylink_stop() is called below. Set the PHY
> +	 * to its slowest speed to save power.
> +	 */
>  	if (device_may_wakeup(priv->device))
>  		phylink_speed_down(priv->phylink, false);
> +

Is there a corresponding phylink_speed_up() somewhere else? Does that
need a similar comment?

	Andrew

