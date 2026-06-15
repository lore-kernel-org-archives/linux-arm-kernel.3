Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B86CCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UfvMLnftnG86sZpVtOaAoiC3x6zQGxcuXN2h4bzNvU=; b=hygVDMfVQlABj3ARmUfZ3kW7qF
	uWpKjo22f/NEUqP6qB3J0D38tQrwEVJQucz+80NwGaL53uOm7aCBKty+v1llhTIsx3by8FHGixE93
	PIBO7jphFikVYQr29wgx61Ji6tb/n6mCLDQ6jyN8yhMzSi/upSkOIr9ZVYXi0DsrRhAmtRyC+Wg4a
	7mK5WNxBawzCSXdtVFfl9atvEUdrwHo0EVOdJpUki/I1kHmiDeB+Gl7Iq+Krzf68v4tN+00X3Jt8H
	/5V0vhtKPqQnYoBTT0MNcQ5FDzmBh6Ye6G5TZq6i4OpE+cXTFzhJaEYKrNY46OL4GuwB8nHuB0pSA
	u6simP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ87o-0000000ENkU-3WIs;
	Mon, 15 Jun 2026 14:17:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ87m-0000000ENjW-2k2e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:17:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-460662fcb4eso2281709f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533033; x=1782137833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3UfvMLnftnG86sZpVtOaAoiC3x6zQGxcuXN2h4bzNvU=;
        b=Kkg0W5uU1bqrictXy3q8QZGVT+jvgQY6mc7Aj7sxM62uQ2iHPKA+L707SMD5ED8kw9
         hHZW4yeMGGh5qef7yGPjGnr6lrQh7GBiBW4gZMsQ1IKppWTLlXIoCG85Db6zxTB1QfIq
         eex4oq8qYmRe7mzzpW3PaZLpIFwuoVnl0+IwDI+JOola/Btd37zrEtItBH9rUiWsDsRG
         XKI1331F/FGmu5SHyWKzXFLAAnR0wO/PmtVEvHzdlgPCOb+xCRXzJbkId1EedcNofFWi
         fQoVqBu2+Yev86M36KSAiwUaIjPdVBr65dKyxfiJ6E4nULJTIMQlC9XNfWkna/6p5zG3
         l5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533033; x=1782137833;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UfvMLnftnG86sZpVtOaAoiC3x6zQGxcuXN2h4bzNvU=;
        b=Iy6anGpEX9uqqHyREJnZzAiJi0+lU+JqG44RZTQwgbm5M0nKF4ZoAhXtEf7Uvm656X
         zl0wxg713M0NF1DZ4npyLPQc1R8oKi9xfHbtI9YcEYg6JQ8n8aAaN8xnnn0Oauygwjwy
         n+bjKAvJhEhSxXl3diB6U9UavsBUxc4IGMKpKNUHQqajbJhi5kOcapg2xJ1p/WXDg6QG
         RYI521VNlwTbDrvje6v6BNlSRRdlBnNhjhx7+VENFhpTxeZqnZ1JjECooNaPpxAgqn6g
         XtNqe3sv5NuvkZMmBtWHnTBQzmREcgPGXcx43ss9lzfUnBkX+60yFcWyUur2oKd/n24E
         4GlA==
X-Forwarded-Encrypted: i=1; AFNElJ8FfS12EyP/0T3ToNXOnHxSiSNP9pp0CZX4nbdqMb6b1QXBeViySI7IykFs16ctscr7x0QFV2XA5Sj7c+yV2W7d@lists.infradead.org
X-Gm-Message-State: AOJu0YyHNFLDW8HNvucqiVxBj43NODAHfDkLsUDF9wgJRB3nXwTjcJ5c
	o8Nz2IXUGYip8hanAABojScZg8o2yLOvzYUUEPi3nQz5sZlk2BnbUQESvQUp1A==
X-Gm-Gg: Acq92OFGn9eE3fTTVfXLc7wxwX146iT4VxBlEiwG5+S5Yk1FurDvUCttVJDn9oggf6O
	bt6I5HIIQwzkmKKbPXdKc2djDHAajTYcpheAWwpB65tz8Z1LV/eJwIukmfFvcMCaQxJR9v7w5VH
	1B54xHZcN5rSDL7o+NIiuNflApf3iNnoIHvTOEtB+KEvrw0lo+uAZ9Nmjf6tXwFOR+6viKnN6ng
	MHLy+4ftyna5Oo6d0dZXE0JM9I1fHTNZSpTer7ENrBc6XK0+nnyX32OV2Dbw0xm07Mk+5c/8//l
	dDHDr/cwUmDRMnpagkg1nSnJ8Vm2SxlBHwutT6WQb5Z/tgZgZ0QbMrRU82oCQP+MFh/exByKyVn
	pmc6MJXfcEyCg0iLDMsfqG60KkxeSPCKvB0CeNdPucR0EDqLp7TSoq2nnXAVyV1aOkQs99m7wty
	1B5aCx0/2eX0OFx6qwaZEv/8cBzcHzW2knUQqS0qgaX5jW2CzP9KtdeA==
X-Received: by 2002:a5d:5e8c:0:b0:460:51f6:6248 with SMTP id ffacd0b85a97d-4606dbc695bmr19385571f8f.27.1781533032304;
        Mon, 15 Jun 2026 07:17:12 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm35293507f8f.2.2026.06.15.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:17:11 -0700 (PDT)
Message-ID: <6a300967.379593d1.36e868.4f67@mx.google.com>
X-Google-Original-Message-ID: <ajAJY92mipEgxdlA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:17:07 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 02/12] net: phylink: introduce internal
 phylink PCS handling
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-3-ansuelsmth@gmail.com>
 <3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_071714_752109_9BEBD153 
X-CRM114-Status: GOOD (  54.85  )
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

On Mon, Jun 15, 2026 at 03:31:20PM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Introduce internal handling of PCS for phylink. This is an alternative
> > way to .mac_select_pcs that moves the selection logic of the PCS entirely
> > to phylink with the usage of the supported_interface value in the PCS
> > struct.
> > 
> > MAC should now provide a callback to fill the available PCS in
> > phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
> > the number of elements in the array. MAC should also define a new bitmap,
> > pcs_interfaces, in phylink_config to define for what interface mode a
> > dedicated PCS is required.
> > 
> > On phylink_create(), an array of PCS pointer is allocated of size
> > .num_possible_pcs from phylink_config and .fill_available_pcs from
> > phylink_config is called passing as args the just allocated array and
> > the number of possible element in it.
> > 
> > MAC will fill this passed array with all the available PCS.
> > 
> > This array is then parsed and a linked list of PCS is created based on
> > the allocated PCS array filled by MAC via .fill_available_pcs().
> > 
> > Every PCS in phylink PCS list gets then linked to the phylink instance
> > by setting the phylink value in phylink_pcs struct to the phylink instance.
> > Also the supported_interface value in phylink struct is updated with
> > the new supported_interface from the provided PCS.
> > 
> > On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
> > phylink instance by setting the phylink value in phylink_pcs struct to NULL
> > and removed from the PCS list.
> > 
> > phylink_validate_mac_and_pcs(), phylink_major_config() and
> > phylink_inband_caps() are updated to support this new implementation
> > with the PCS list stored in phylink.
> > 
> > They will make use of phylink_validate_pcs_interface() that will loop
> > for every PCS in the phylink PCS available list and find one that supports
> > the passed interface.
> > 
> > phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
> > where if a supported_interface value is not set for the PCS struct, then
> > it's assumed every interface is supported.
> > 
> > A MAC is required to implement either a .mac_select_pcs or make use of
> > the PCS list implementation. Implementing both will result in a fail
> > on phylink_create().
> > 
> > A MAC defining .num_possible_pcs in phylink_config MUST also define a
> > .fill_available_pcs or phylink_create() will fail with an negative error.
> > 
> > phylink value in phylink_pcs struct with this implementation is used to
> > track from PCS side when it's attached to a phylink instance. PCS driver
> > will make use of this information to correctly detach from a phylink
> > instance if needed.
> > 
> > phylink_pcs_change() is also changed to verify that the PCS that triggered
> > a link change is the one that is currently used by the phylink instance.
> > 
> > The .mac_select_pcs implementation is not changed but it's expected that
> > every MAC driver migrates to the new implementation to later deprecate
> > and remove .mac_select_pcs.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> 
> [...]
> 
> > @@ -1872,10 +1993,28 @@ struct phylink *phylink_create(struct phylink_config *config,
> >  	mutex_init(&pl->phydev_mutex);
> >  	mutex_init(&pl->state_mutex);
> >  	INIT_WORK(&pl->resolve, phylink_resolve);
> > +	INIT_LIST_HEAD(&pl->pcs_list);
> > +
> > +	/* Fill the PCS list with available PCS from phylink config */
> > +	ret = phylink_fill_available_pcs(pl, config);
> > +	if (ret < 0) {
> > +		kfree(pl);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	/* Link available PCS to phylink */
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		pcs->phylink = pl;
> >  
> >  	phy_interface_copy(pl->supported_interfaces,
> >  			   config->supported_interfaces);
> >  
> > +	/* Update supported interfaces */
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		phy_interface_or(pl->supported_interfaces,
> > +				 pl->supported_interfaces,
> > +				 pcs->supported_interfaces);
> > +
> 
> I'm not entirely sure about that, we may need to restrict the supported_interfaces
> from the MAC.
> 
> As an example, take mvpp2. We have 2 PCSs, one for BaseX/SGMII, one for BaseR. But
> if we don't have a comphy (generic PHY) device, then we can't use all the
> combination of modes our PCSs can provide :
> 
> https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c#L7074
> 
> These aren't external PCS IPs, but from what I understand you'd like to
> handle these the same way as purely external PCSs, right ?
> 
> I'd say the MAC driver utltimately has the knowledge of all possible interfaces.
> 
> The way I see it, it's probably safer to let the MAC give a wide range of interfaces,
> and filter that down with what the PCSs can provide (i.e. turn that or into an and,
> while handling the case where the pcs supported interfaces is empty).
> 
> What do you think ?
>

The idea is that supported_interface is a mask of every possible interface
from MAC and PCS. Then it's phylink_validate_mac_and_pcs that actually use
that mask and validates it on both MAC and PCS.

This is why the OR was used instead of AND. The idea is to have the PCS as
external standalone entry (even if they are internal to the MAC). So each
entry should have they own set of supported mask.

The previous patch and this try to address this problem where phylink is
actually clueless of what is actually supported exactly because it's has
been given MAC too much freedom of modelling limitation internally.

I feel limitation should be handled by their dedicated function with
.pcs_validate and .mac_get_caps.

Just my idea on this, if needed it's totally ok to simplify this and let
MAC entirely handle the mask. (but I feel the current idea of phylink code
was to have a generic mask in supported_interfaces and then verify MAC and
PCS in phylink_validate_mac_and_pcs())

But by thinking on it more, following your case of mvpp2, with this new
PCS:

- You need a PCS for the .get_state.
- And such PCS will have the supported interface set 1000baseX and
  2500BaseX (as that is what is actually supported in HW)

Either some magic is done in .pcs_validate to deny changing the interface
that was initially configured or this gets limited at the
supported_interface configured by the MAC.

I need to check if this might be problematic for the other driver where
this is being used on OpenWrt but maybe changing the logic to an AND might
be sensible for these kind of case.

(for the other it shouldn't change anything)

-- 
	Ansuel

