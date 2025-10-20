Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA88CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWcxiyUnH+GCuZQzCUqbz2uG3U/Ek9WtMP6FsoEVRQ0=; b=NdsFTlj2FCd7LoF/Si6f051rBR
	pfmAXOJteZ9nTVlQx16QfvwFGewVZ3sjWkoil4CPpjCZNaeVbUJzywXzSt/9sBF7Q6K2PGYYlKl3Q
	7Kul3b7h0lCWGTSSrzK4MaMrlTuUW5gHHY26UR/cwwdxGi+/Vg1WKf9h8iy9hbHU1put1ZJgC9rSq
	I+9favPOUK//zma70F4pJRPA2Z3V5LuzKBp0PoqP8ciHfQVHjx4gMenHhheJ8Prr6Z1bKDuClrC3O
	chdEC4ljXp3l2OUI2xmmU1T2Q3htNsgBLQKdbaM3MlcZd/V3ZdmTgrjeNF9Ka047nLFTeZzrTjkI/
	4cF9mPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqDG-0000000DqD5-1oyM;
	Mon, 20 Oct 2025 13:46:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqDF-0000000DqCP-0Vu4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B21A61F6F;
	Mon, 20 Oct 2025 13:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4AFC113D0;
	Mon, 20 Oct 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760967971;
	bh=KtOvr2CT2ZJfd+Wdd1NhPf0C0AhFoUXbwiHFwdYHSkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4s8JzE4+w9MiKIIMzTbYJec56T4vfL+sBHbkRo0o1iACbS9wjydWznV7ooaim84T
	 AKDL0vLzOM8yb/W4hRv/4WjZeCAr0JofCsF5mRHU4zjF4I/l0bJNjE2kVjtl8XtS1n
	 3c7YLb1hTKZWlKyGRfN1OyyZOkWF2vHmKUfwjPu0oxZJAo6+VicMbOt1NAWBgsvWBp
	 ZLp5eXyYy4Cx+XQAm3JO2PY9EPYAMNzOh8OxVj/UBSIGpUHtbFi0aHaZNm9ZmqdJjY
	 HrtmtrZHWkgXtfIcv63PhDcSgN2qIXNK5DYiKAjxRzN4RZjgMSNUHtBKtI5lj0PdNC
	 /7dkyBEb9Ks3g==
Date: Mon, 20 Oct 2025 14:46:07 +0100
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 net-next] net: stmmac: mdio: use phy_find_first to
 simplify stmmac_mdio_register
Message-ID: <aPY9H0zTwhCWTmXK@horms.kernel.org>
References: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
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

On Sat, Oct 18, 2025 at 08:48:07PM +0200, Heiner Kallweit wrote:

...

> @@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)

...

> +	phydev = phy_find_first(new_bus);
> +	if (!phydev || phydev->mdio.addr > max_addr) {

Hi Heiner,

Depending on logic earlier in this function max_addr may be PHY_MAX_ADDR (32).

>  		dev_warn(dev, "No PHY found\n");
>  		err = -ENODEV;
>  		goto no_phy_found;
>  	}
>  
> +	/*
> +	 * If an IRQ was provided to be assigned after
> +	 * the bus probe, do it here.
> +	 */
> +	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
> +		new_bus->irq[phydev->mdio.addr] = mdio_bus_data->probed_phy_irq;

And new_bus->irq is an array with PHY_MAX_ADDR elements.

So if phydev->mdio.addr and max_addr are both PHY_MAX_ADDR,
then the if condition above my first comment will not be met,
and it seems that the access would irq[] may overflow.

Perhaps this can't occur. But It does seem worth bringing to your attention.

Flagged by Smatch.

> +		phydev->irq = mdio_bus_data->probed_phy_irq;
> +	}
> +
> +	/*
> +	 * If we're going to bind the MAC to this PHY bus, and no PHY number
> +	 * was provided to the MAC, use the one probed here.
> +	 */
> +	if (priv->plat->phy_addr == -1)
> +		priv->plat->phy_addr = phydev->mdio.addr;
> +
> +	phy_attached_info(phydev);
> +
>  bus_register_done:
>  	priv->mii = new_bus;

...

