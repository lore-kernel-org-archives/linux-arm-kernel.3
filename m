Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F97FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLaGdp8YbDuKJDS27qr7DpF30lE39Y2UTMae3idzC+k=; b=Iqxr7XFprDVfVrlSOwn8RS2gkp
	/ATotv57kHEU+db2o9fZlwJ0CAcvBlOo/W85TrGc6V0dgPwRP34vzNLoWfyWSXIRfAXjdLGUGVkLK
	0xAF6ZfeCr2RSvHXp4fQErAtmtav7aHRKt/PfZvBekin16bEHNb7ib4x775GwsFXgEIOikIwlOETY
	MRMrMmxjTqlHIJMZ9asLpFLtkpT3a71U9HzqI54KHb5SNMLYuaUjJG5Jv6jNbCOMnR2Rd3+XqwzpM
	jOuT5Wu9IjBsbPdT7xo3uhmBwz/Hs8St41lQ+IvDguJ8c4hunykeZRx8RZQlOKQeM6zJzblhuQQLU
	b40gQVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6cr-0000000ALOW-3yTh;
	Thu, 06 Mar 2025 08:30:42 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6bG-0000000ALDu-15jV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:29:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 284A044537;
	Thu,  6 Mar 2025 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741249739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLaGdp8YbDuKJDS27qr7DpF30lE39Y2UTMae3idzC+k=;
	b=QgCkjePBKvLNC63g9kZ5aWfuy70/ftJqqY7atcr7qEA2lv4rKFNJbjUByT/KLZptwsScbU
	J5AyCoEa/nSAgpbu/XxmJUJHKkWE7Vw2rVX0mePVVfDOQAeuiYobvqs4VOTW7EZTymPpz/
	G5DuKRw0kKlJ+qPr0Z+Ak9DJnK10JT3czoUGqBPjaaXBMHsqMDlI45haZ9yFLdaMYGWhn/
	h8iLuwQgVulxGTUGO8GBJohSvnddf+Mns//HDwvFzh6XlvO8v8BUlamYtpAMt3MxYX03eR
	BG5NcsU0pjcG2pUVpfI5IuVW9JQlL0+mhJNT+5zBegg6g1JMw462WDdstbAXAA==
Date: Thu, 6 Mar 2025 09:28:57 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: phylink: add functions to
 block/unblock rx clock stop
Message-ID: <20250306092857.5cafd6d4@fedora.home>
In-Reply-To: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
References: <Z8iRM8Q9Sb-y3fR_@shell.armlinux.org.uk>
	<E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepthhrvgguihhnghesnhhvihgui
 hgrrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrtghsvghnghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_002902_436545_1718EF19 
X-CRM114-Status: GOOD (  22.77  )
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

Hello Russell,

On Wed, 05 Mar 2025 18:00:39 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Some MACs require the PHY receive clock to be running to complete setup
> actions. This may fail if the PHY has negotiated EEE, the MAC supports
> receive clock stop, and the link has entered LPI state. Provide a pair
> of APIs that MAC drivers can use to temporarily block the PHY disabling
> the receive clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I only have comments on the implementation, see below :)

> ---
>  drivers/net/phy/phylink.c | 50 +++++++++++++++++++++++++++++++++++++++
>  include/linux/phylink.h   |  3 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a3b186ab3854..8f93b597d019 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -88,6 +88,7 @@ struct phylink {
>  	bool mac_enable_tx_lpi;
>  	bool mac_tx_clk_stop;
>  	u32 mac_tx_lpi_timer;
> +	u8 mac_rx_clk_stop_blocked;
>  
>  	struct sfp_bus *sfp_bus;
>  	bool sfp_may_have_phy;
> @@ -2592,6 +2593,55 @@ void phylink_stop(struct phylink *pl)
>  }
>  EXPORT_SYMBOL_GPL(phylink_stop);
>  
> +
> +void phylink_rx_clk_stop_block(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
> +		phylink_warn(pl, "%s called too many times - ignoring\n",
> +			     __func__);
> +		dump_stack();
> +		return;
> +	}
> +
> +	/* Disable PHY receive clock stop if this is the first time this
> +	 * function has been called and clock-stop was previously enabled.
> +	 */
> +	if (pl->mac_rx_clk_stop_blocked++ == 0 &&
> +	    pl->mac_supports_eee_ops && pl->phydev)
> +	    pl->config->eee_rx_clk_stop_enable)

Looks like there's an extra closing ')' here

> +		phy_eee_rx_clock_stop(pl->phydev, false);
> +}

Do you need an EXPORT_SYMBOL_GPL here as this will be used by MAC
drivers?

> +
> +/**
> + * phylink_rx_clk_stop_unblock() - unblock PHY ability to stop receive clock
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * All calls to phylink_rx_clk_stop_block() must be balanced with a
> + * corresponding call to phylink_rx_clk_stop_unblock() to restore the PHYs
> + * clock stop ability.
> + */
> +void phylink_rx_clk_stop_unblock(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (pl->mac_rx_clk_stop_blocked == 0) {
> +		phylink_warn(pl, "%s called too many times - ignoring\n",
> +			     __func__);
> +		dump_stack();
> +		return;
> +	}
> +
> +	/* Re-enable PHY receive clock stop if the number of unblocks matches
> +	 * the number of calls to the block function above.
> +	 */
> +	if (--pl->mac_rx_clk_stop_blocked == 0 &&
> +	    pl->mac_supports_eee_ops && pl->phydev &&
> +	    pl->config->eee_rx_clk_stop_enable)
> +		phy_eee_rx_clock_stop(pl->phydev, true);
> +}

Same for the EXPORT_SYMBOL_GPL

Thanks,

Maxime

