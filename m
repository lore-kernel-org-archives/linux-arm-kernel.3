Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=; b=hUL7bbY/HKG0rqbpzewHMxqtYQ
	JhMmBaKpBL7HKqkrOBRPFNd6JJgj8SaEvXL5gZF6EZMq4y6VDzN4P3dZQy1QUPazFCCW6gak2dDgu
	6ZhC2hxaImMc5HnKahWupuYkoqlczkonb439FVB4YLIIs+LGt41jy9T2qnAK4jeIfctTZ/S0QVG2j
	gxLdwQOu4xlJOQeZQ6sUku7cIAUJcxiUd9nzDaOu5v9Hqf60q/zD2BnNWOztBs6O4KkZKlw5ld+ht
	fX3xBID7tDPisgkTEbyKyv8Cbak9uTv26dKiHoHTtTXRooZPsThbYBtw+H4qvnx7LHV21Ffn7qpnd
	XDtBaERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSDw-0000000CSRx-1A9T;
	Sat, 27 Jun 2026 12:33:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSDt-0000000CSRD-1Q7N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 12:33:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso9013035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563603; x=1783168403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=R7746qcY8q4GLqbBpr/+osa3Pfvm56/8k3DVmeA9rd80CKzD7XT/9spZHLUyutHGQH
         GLvVJMI10oJDeqKaz7FWux20h7VRr4lME6ox5123XMhe+nGgqRASlXp4GaFExKPg2mmb
         SfBHVGeXEpXqM8ZnT1MCyxlFc2VLxe0cpKH9OtuDtjgvHbo7KLcQYbicLWN/G6h1AOon
         GlQwQTW5F8X95i70gYRehbagPAUcjVIYEGvM3Qehg4Qw2LTDhWUtV6jnwdpvJhi2gnNK
         0JAdfGJ3IQVRuC+MjX7SfeoemZbwE8XEutrT4tRLvhg4Z7bQ6Vzzj6B32VwOnTDekPS6
         kFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563603; x=1783168403;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=gIllM83uSmiKlEk3+BKTsR5MH6ieADm3z9bPVV38nlc7zGAem2zZVAasVdUn7Q4D0J
         SU9ODGxph65IiwG3aKUXIwnGJUains8Z0a7JJtNXDHCSnExlVkbrOUm2FC56jawglUXs
         jhwtEAzxB7Pe+mO5Z7c4PKWiHRZixDvzaA6GEkPdASfBPDobroqnXIl9CDyKVm1dhgWZ
         N6ZaYeptlKTUy6f6tMY1N20i4Uj/FqMsgulkL5EU5aH0cOWzpS7O59Q1UtapZhUuzc44
         Ob7J49m8P5WhwuLHh0WJzUjzvo5tcGB8tDrJvY2u849WeBK7HkhqESMq18IUFpzYxKRZ
         fvbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nm8hea2HRv+6LtYSPkb/ldoR6Y+qbbRQRwHRRT0o5p3XnfIpqMpiVwPiuFLyCRNOgSo8/q4La9rb0jWuxR4xp@lists.infradead.org
X-Gm-Message-State: AOJu0YxKpfi2CZ974PjjkEPSNtgi/O+EgR3o3t2WNLTz6/BcSIiwZcJr
	5AGP2nNUSd9JJ6S1iOzENE+qB0MgVeVDbjn05QbmnE8iekoTmy7ubEFt
X-Gm-Gg: AfdE7cli3ZvUiWghYLPGH4SH5jD2zbZxNsL+7j7Q27bfO4IqHoPXPzwRM7uk4feHmHR
	9p2d/lxBPVE/ep3SzXKlmMRmhto+FQ4ZQjCmJ9Ikd4dFBvu1bY9WGUFkngCO6buewtGtDGnnrPe
	gjXLxYOVE+HU4OSzt9wIdFtZaVgH2pjZOVSjVrhus5wOHF2o/h2ZI+EcNK9hl/PS3/ySTogqOrF
	zykkH8o4W+CXfR2FX3Ak+v8y/X5luWlsx+xDA0Iis7S4s6aUnhXVSdTOKZcca6MjjBzMRMmiDJT
	XXFmii1Aq+DlJ/K7CLpKkqEkfmF5GRbzn/IC8ltb1scJ5aeeGE21Iq1nqLXuj2tHd9KFmXcZlpW
	nL1tdIP657p+vZMdp5YCywnEMlcNVGnfjrq7OVylqGh51qHBWnrMHzKZHaxSc9ggq89gbzo5PgM
	k4o0EMN2OsDKdctWcb0oaejIehH1zolGdMHFcIAfD1XQm5
X-Received: by 2002:a05:600c:81c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4926fcade65mr62722535e9.37.1782563603146;
        Sat, 27 Jun 2026 05:33:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm271536875e9.15.2026.06.27.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:33:22 -0700 (PDT)
Message-ID: <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
X-Google-Original-Message-ID: <aj_DD_djHkw7CLZ4@Ansuel-XPS.>
Date: Sat, 27 Jun 2026 14:33:19 +0200
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
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_053325_438190_F4094C36 
X-CRM114-Status: GOOD (  51.59  )
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

On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/18/26 14:57, Christian Marangi wrote:
> > Add phylink_release_pcs() to externally release a PCS from a phylink
> > instance. This can be used to handle case when a single PCS needs to be
> > removed and the phylink instance needs to be refreshed.
> > 
> > On calling phylink_release_pcs(), the PCS will be removed from the
> > phylink internal PCS list and the phylink supported_interfaces value is
> > reparsed with the remaining PCS interfaces.
> > 
> > Also a phylink resolve is triggered to handle the PCS removal.
> > 
> > The flag force_major_config is set to make phylink resolve reconfigure
> > the interface (even if it didn't change).
> > This is needed to handle the special case when the current PCS used
> > by phylink is removed and a major_config is needed to propagae the
> > configuration change. With this option enabled we also force mac_config
> > even if the PHY link is not up for the in-band case.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/phylink.h   |  2 ++
> >  2 files changed, 58 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index c38bcd43b8c8..064d6f5a06da 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
> >  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> >  
> >  static void phylink_run_resolve(struct phylink *pl);
> > +static void phylink_link_down(struct phylink *pl);
> > +static void phylink_pcs_disable(struct phylink_pcs *pcs);
> >  
> >  /**
> >   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> > @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
> >  	}
> >  }
> >  
> > +/**
> > + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> > + * @pcs: a pointer to the phylink_pcs struct to be released
> > + *
> > + * This function release a PCS from the phylink PCS available list if
> > + * actually in use. It also refreshes the supported interfaces of the
> > + * phylink instance by copying the supported interfaces from the phylink
> > + * conf and merging the supported interfaces of the remaining available PCS
> > + * in the list and trigger a resolve.
> > + */
> > +void phylink_release_pcs(struct phylink_pcs *pcs)
> > +{
> > +	struct phylink *pl;
> > +
> > +	ASSERT_RTNL();
> > +
> > +	pl = pcs->phylink;
> > +	if (!pl)
> > +		return;
> > +
> > +	mutex_lock(&pl->state_mutex);
> > +
> > +	list_del(&pcs->list);
> > +	pcs->phylink = NULL;
> > +
> > +	/*
> > +	 * Check if we are removing the PCS currently
> > +	 * in use by phylink. If this is the case, tear down
> > +	 * the link, force phylink resolve to reconfigure the
> > +	 * interface mode, disable the current PCS and set the
> > +	 * phylink PCS to NULL.
> > +	 */
> > +	if (pl->pcs == pcs) {
> > +		phylink_link_down(pl);
> > +		phylink_pcs_disable(pl->pcs);
> > +
> > +		pl->force_major_config = true;
> > +		pl->pcs = NULL;
> > +	}
> > +
> > +	mutex_unlock(&pl->state_mutex);
> > +
> > +	/* Refresh supported interfaces */
> > +	phy_interface_copy(pl->supported_interfaces,
> > +			   pl->config->supported_interfaces);
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		phy_interface_or(pl->supported_interfaces,
> > +				 pl->supported_interfaces,
> > +				 pcs->supported_interfaces);
> 
> I've given more thought to that 'supported_interfaces' thing. This
> patchset redefines the meaning of
> 
>   pl->config->supported_interfaces
> 
> Currently, it's filled by the MAC driver and means "Every interface
> we can support, including the ones provided by PCSs that we can use
> with this MAC".
> 
> It now becomes "Every interface we support without needing a PCS", at
> least the way I understand that.
>

Wait but with the current code using the OR logic, it still follows
"Every interface we can support...". The modes that needs a PCS are
specificed with the pcs_interfaces mask in phylink_config.

The late add and release operates on the phylink supported_interfaces ONLY
when the MAC didn't specify support for it (by removing it as only the PCS
will declare support for it)

The confusion is present because everything is validated later on
major_config so those supported_interfaces are just an HINT that are later
verified with get_caps and with the pcs_validate OPs.

Adding the supported_interfaces to phylink is really to keep an original
reference of the value. This is to address a pattern I have notice where
the MAC driver always OR the interfaces with the one supported by the PCS.
(I remember it was pointed out by Russell)

But I'm more than open to discussion as this is something marginal to the
whole implementation, I'm also questioning if this OR is actually useful to
anything on the nth tought on this.

One thing that I notice is that parsing this early with AND might be
problematic at phylink_create, but I still have to evaluate that.

My take is that would be good to have some review also on the other logic
as I think I reached a point where Sashiko starts to comments on more or
less unreal problem.

> It's not an error in your code, but I think this is worth documenting
> somewhere as this changes one the things that's already fairly
> error-prone in new drivers.
> 
> I don't know to what extent people use that, be we have a porting guide
> that explains how to use phylink in a MAC driver, maybe an update in there
> would be nice as well :
> 
> https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink
> 
> Maxime
> 
> 

-- 
	Ansuel

