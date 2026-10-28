Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QOLrRieK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OIeTSxkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sum+6SOo6fPr4wojZMJ/HsdG/QxP8iiWGofKkRuMS1M=; b=QOLrRieKEX36sEY7oGKlzXS2GT
	PiDPzlS+J2C0txFfP9WuRL1rSvwXgb8i4IvHYUpbCBiL8tw9v1LdSI63N0NEVJsivYOJYK95ygxnx
	fqQFSrsonBhAF8+giDMiFLj/VzKn3ByK91LRv4mC5lgFJ39ianY8KglIR1IQTtEhfvboOnrjD7hnS
	/mbQdDNyF6oZBqy8n1xjtLbAyRxm2YrFu1tmogk4isGsOTerqKi6R1IoZmeFDnxTvw71Bghm9NVXn
	oEZs8+K2zwIQt6+KKtgKDUnTlN/wNp0nGus9pbeMkjM7UD25/kz0zSRe7vOPk8NMRxxS/Lp5xI5K+
	vu2kTFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2mR-00000006xU5-2sXi;
	Wed, 28 Oct 2026 12:29:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2mP-00000006xTI-07EJ;
	Wed, 28 Oct 2026 12:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sum+6SOo6fPr4wojZMJ/HsdG/QxP8iiWGofKkRuMS1M=; b=OIeTSxkEVEyNnKkle53WGtuvkZ
	4QPsQXrPuG3ysSTXNKb1A9KeiGyBKadA1zp93MsEorhYJ12wPx7/9ZK7/WAHrYWRF+gV/pYRWsCC5
	YGvVChI+oL7M5/9vB/XnbuhBGquvyooySQ/6nwz/2UKrj9OU6DG9a/TRn2xVJ3KAVzl0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xM2lx-00D6fN-W5; Wed, 28 Oct 2026 13:28:53 +0100
Date: Wed, 28 Oct 2026 13:28:53 +0100
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
Subject: Re: [PATCH v3 2/7] dt-bindings: net: dsa: mediatek,mt7530: add
 passthrough mode
Message-ID: <a566aad7-754c-4960-b018-4471a0068344@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-3-cjd@cjdns.fr>
 <a031f089-0b96-4fc0-b878-6af13414524f@lunn.ch>
 <521b930f-0bf9-4373-bfbf-3e2570661ec9@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521b930f-0bf9-4373-bfbf-3e2570661ec9@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_052921_065213_B0C11614 
X-CRM114-Status: GOOD (  30.60  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:27:18PM +0100, Caleb James DeLisle wrote:
> 
> On 28/10/2026 03:04, Andrew Lunn wrote:
> > On Wed, Oct 28, 2026 at 01:13:12AM +0000, Caleb James DeLisle wrote:
> > > MT7530 switches can be configured to blindly pass packets between their
> > > CPU/upstream port and a downstream DSA port, in particular, without
> > > altering the MediaTek DSA Tag on the packets. This mode is used in some
> > > integrations where an SoC integrated switch exists, but a more capable
> > > MCM switch is added to effectively replace it.
> > > 
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > index 90b3582b7619..e29fb8693498 100644
> > > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > > @@ -73,6 +73,13 @@ description: |
> > >         Check out example 7.
> > > +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
> > > +  mode. In this mode, traffic is unconditionally passed between the CPU port
> > > +  and the DSA port which links to a second switch. To use passthrough mode, the
> > > +  upstream switch is configured with a DSA link to the downstream switch. In
> > > +  passthrough mode the upstream switch is restricted, with no other ports or
> > > +  switch configuration allowed.
> > > +
> > >   properties:
> > >     compatible:
> > >       oneOf:
> > Looking at just what is here, all i see is a comment. There is no new
> > property? Yet the subject is "add passthrough mode"?
> 
> 
> Indeed, I used "add" to mean "add documentation of". Per my reply on patch
> 3, I think we really prefer to avoid special properties and let this
> constitute (very) limited support for a switch hierarchy.
> 
> If there's another verb you think makes a better commit line, I'd be happy
> to adjust.

[Goes and looks at mediatek,mt7530.yaml]

So pass through is not an existing property. You are also not adding a
new property 'passthrough'.

What you appear to be saying is that the MT7530 and MT7531 are hard
coded by the driver into pass through mode? So it is in effect a
property of the compatible? So maybe put this comment next to the
compatible? And make the subject/commit message talk about the
compatible being hard coded for pass through?

Looking forward, what happens when somebody wants to use the switch as
a switch? Or you figure out how to do proper D in DSA? It becomes
messy because you need to add a property indicating the compatible
should actually be a switch?

So maybe you really do need a property?

But DT describes hardware, and pass through is configuration. So maybe
it should not be in DT at all, Maybe the driver needs to look at the
DT tree, figure out a port is used as a DSA port, and put the switch
into pass through all on its own? Once D in DSA is supported, the
addition ports become available, but no other changes are needed in
the DT blob?

Sorry, going around in circles, but hopefully it helps you think about
the big picture.

	   Andrew

