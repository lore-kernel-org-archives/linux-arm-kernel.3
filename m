Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50112606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SkGvhujG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=L2CZxSC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I4SUzivYpnSYJ/lCx6y810yaNKGFV1PRYqvuX0xqFq8=; b=SkGvhujGag/RWsYzfk8JWzMUG6
	g7kCOmvkdY/9W6NynQMl9qM0/D8Ir1mzQ+I0F7FcyUFKQ3J2ezn2ck1WERNicvRFvRbuWhewyeldb
	7Ua5Y0oflfcoFqPMpO5qETH8RuZmVzzBvGUE6/+98jLPQuuvWZwt00zciapBYedH1nJ/IOWwMtho8
	VncIT8SRweXnOuV6JycK4yWUeuc2AdkzenzO27MuNbzpbOTsfqzII/rLQdy+p41Iany1slvTHz+VS
	yV/pp4xSxobpX5ysjyclM6T/rlHy6cjuPcFPBSmcR97VLy65k9s3rGqCD84X14BlFfQBOoxO36qJm
	U13CS5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM37J-00000006ysw-0XWe;
	Wed, 28 Oct 2026 12:50:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM37G-00000006ysM-35xg;
	Wed, 28 Oct 2026 12:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=I4SUzivYpnSYJ/lCx6y810yaNKGFV1PRYqvuX0xqFq8=; b=L2
	CZxSC3XYnCB0mWsCoxLLDP7tsZQ3O+vCkrBcl1ZvrnZe/rISNVHUXadwbWPnvd7KZmcLEJOKBESDL
	Rhs2CCQdnkd1e6sj5lBOvh5UvmTVsYdu3ZHwfWpLbUR+lQEfmkKYCtbVNI6W5alqLNjyqY7pDqj3m
	Ox59MrqCo/upT3s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xM36y-00D6p1-71; Wed, 28 Oct 2026 13:50:36 +0100
Date: Wed, 28 Oct 2026 13:50:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 5/7] net: dsa: mediatek: support MDIO switch
 downstream of MMIO switch
Message-ID: <bdde8389-008a-430a-8d0d-14edcb4050b4@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-6-cjd@cjdns.fr>
 <f6fe9c7a-5617-475b-babe-da24cda815cc@lunn.ch>
 <acf55987-e96d-407f-a4a7-1c78178a0c7a@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acf55987-e96d-407f-a4a7-1c78178a0c7a@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_055054_774397_4CE76595 
X-CRM114-Status: GOOD (  28.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:59:23PM +0100, Caleb James DeLisle wrote:
> 
> On 28/10/2026 03:20, Andrew Lunn wrote:
> > On Wed, Oct 28, 2026 at 01:13:15AM +0000, Caleb James DeLisle wrote:
> > > The MT7530 / MT7531 can connect via either MDIO or MMIO. In MMIO mode
> > > the switch provides its own MDIO bus which connects to its integrated
> > > PHYs, but also can be connected to other things, such as another
> > > switch.
> > > 
> > > If the MDIO bus contains another switch, then the upstream switch
> > > will register but it will not setup the DSA tree because the
> > > downstream switch is missing. Without the complete DSA tree,
> > > mt753x_setup() will not be called on the switch and therefore
> > > mt7530_setup_mdio() is never called so the downstream switch never
> > > registers.
> > > 
> > > Update mt7530_setup_mdio() so that it can be called multiple times,
> > > export the symbol, and call it again after dsa_register_switch()
> > > from mt7988_probe().
> > I would suggest just moving it to probe. Don't also have it in setup.
> > KISS.
> 
> 
> I don't think there's a way to do that which will work. And I guess I need
> to add a few comments to explain why. Basically when dsa_register_switch()
> is called, one of three things can happen:
> 
> 1. return error (often without calling mt753x_setup), typically this is
> EPROBE_DEFER because the ethernet driver is not there yet.
> 
> 2. return 0 without calling mt753x_setup (because not all switches in the
> tree are yet probed)
> 
> 3. call mt753x_setup, complete setup, and return 0
> 
> 
> In case 1, mt7530_setup_mdio must not be called, because it would be setting
> up an MDIO on a driver that's about to get deleted.

Which is fine, because when the probe fails, you unregister the MDIO
bus. That should work. The second time around, you do have the netdev,
and it should work.

It is not great, you are doing extra work, but many DSA drivers are
structured like this, the MDIO bus is registered in probe. The bus is
scanned, PHY are found, and then the probe fails, and the PHYs are all
thrown away etc.

Hanging one switch off another switch like this using MDIO, kind of
pushes you in this direction. Typical DSA setups don't do this, there
is one MDIO bus which all switches hang off, sometimes with a
multiplexor to make one MDIO bus act like many.

Something to look at which might be interesting, Vladimir had some
patches which allowed for partial switch topologies, where you could
take a switch in a DSA setup off line. Maybe there is something in
those patches which help, you can bring the switches up independently?

	    Andrew


