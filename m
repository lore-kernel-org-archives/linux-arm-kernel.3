Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EA5CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTEc98M4XZy4WMkROG0qptNsTU3Fmgz7V9VTlpGoaVk=; b=PhKsLvIwdKtTQpKVMqHkNZsL2e
	Y9egbyyZfvYEW6cxOyYEJ7Xho8FrsTQsdBLtUgAUf/Agdl25Xo+jjF59p22ywe0rLzzCYUrXi9mUq
	bJ65dciki+PAqQBcmZBIIPvUjyqF4Z6WuACT62+BYCfPlES7Vz8mhvP7F+WXLpwIG00yWa2L8wp6B
	pn2q/ob1vW1xtQkmpZJ00D8iSW+AeCcFnnohgF2riQAD05Es9hxdFugUKBpGoKJhqUwWtomv7z2bH
	sdCHDisdBnEd+CAQgUkId17g4iKhqRsl3PcIqydPoZOWWCgLsu3To6tAkuJg1XY8lduWUGXsteM6I
	5GHw7KKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFX8-0000000HKG4-3PYv;
	Thu, 04 Jun 2026 21:23:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFX7-0000000HKFt-3kZ6;
	Thu, 04 Jun 2026 21:23:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3065A6001A;
	Thu,  4 Jun 2026 21:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1AE1F00893;
	Thu,  4 Jun 2026 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780608200;
	bh=sTEc98M4XZy4WMkROG0qptNsTU3Fmgz7V9VTlpGoaVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJNpkEQt0CjkCEugmUYRNBhibW8aOtscYwd1wNIXNfvnqPgDBnxZiY1nhmlqv7+ny
	 9mbOZCovyunje6G1Z6EhgfiE+hADo5LdmjDPBYtBqZNZR7IYQ7SG5JeBDyIrOksuln
	 KS8Inh2I2jYGs+sE1IKgZqGLLnBca+6vlZnRACzPDmofakkIHTRD6hWN6cio3Jy8Mq
	 qZxdLtODHaz/gheWt60QtP04MNza/uKK4d9+wqPt3TpMcIrZPheJj1MqZ7azgqTTsm
	 2w6ortBrQUgasNRO1mQtECATG3HqNSdo9d0FDnAY38MpMKIIQzamgNGoHFDx8P4jrY
	 7k5oLWJK437Hw==
Date: Thu, 4 Jun 2026 23:23:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Westphal <fw@strlen.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: airoha: Fix use-after-free in metadata dst
 teardown
Message-ID: <aiHsxFrleJfpLeuA@lore-rh-laptop>
References: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
 <20260602-airoha-mtk-metadata-uaf-fix-v1-1-3aaa99d83351@kernel.org>
 <21810a20-abe6-4490-969c-cfd62c4c082a@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aWp9RvEMdmSaWjBX"
Content-Disposition: inline
In-Reply-To: <21810a20-abe6-4490-969c-cfd62c4c082a@intel.com>
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


--aWp9RvEMdmSaWjBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 6/2/2026 2:21 AM, Lorenzo Bianconi wrote:
> > airoha_metadata_dst_free() runs metadata_dst_free() which frees the
> > metadata_dst with kfree() immediately, bypassing the RCU grace period.
> > In the RX path, skb_dst_set_noref() sets a non-refcounted pointer from
> > the skb to the metadata_dst. This function requires RCU read-side
> > protection and the dst must remain valid until all RCU readers complete.
> > Since metadata_dst_free() calls kfree() directly, an use-after-free can
> > occur if any skb still holds a noref pointer to the dst when the driver
> > tears it down.
> > Replace metadata_dst_free() with dst_release() which properly goes
> > through the refcount path: when the refcount drops to zero, it schedules
> > the actual free via call_rcu_hurry(), ensuring all RCU readers have
> > completed before the memory is freed.
> >=20
> > Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index cecd66251dba..eab6a98d62b9 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2936,7 +2936,7 @@ static void airoha_metadata_dst_free(struct airoh=
a_gdm_port *port)
> >  		if (!port->dsa_meta[i])
> >  			continue;
> > =20
> > -		metadata_dst_free(port->dsa_meta[i]);
> > +		dst_release(&port->dsa_meta[i]->dst);
> >  	}
> >  }
> > =20
> >=20
>=20
> the port->dsa_meta is allocated using metadata_dst_alloc().. how is it
> safe to use dst_release here? Seems like we should be calling dst_alloc
> instead of metadata_dst_alloc in order to use dst_release??

We need to allocate the metadata_dst using metadata_dst_alloc() since
md_dst->u.port_info.port_id is consumed in dsa_switch_rcv() to get the
switch conduit port.
I guess it is fine to free metadata_dst running dst_release() since dst_ini=
t()
sets DST_METADATA flag and so dst_destroy() runs metadata_dst_free() after =
the
RCU grace period.

>=20
> metadata_dst_alloc does call __metadata_dst_init which calls dst_init..
>=20
> I guess the start of the metadata_dst structure is also the same address
> as the internal dst_entry struct...
>=20
> But dst_destroy does a whole lot more than metadata_dst_release so I
> don't feel confident in this actually being a drop-in replacement... It
> calls netdev_put, it calls the dst->ops->destroy, it releases child
> refs.. Or for metadata dst entries is that all basically a no-op??

__metadata_dst_init() calls dst_init() with dev =3D NULL so netdev_put() is=
 a
no-op. Same for dst->ops is dst_blackhole_ops and and dst_blackhole_ops has=
 no
destroy callback.

>=20
> I feel like I'm missing something here.. The driver also calls
> metadata_dst_free in the remove path and that wasn't changed by this
> patch either.

can you please explain what you mean here? we do not run metadata_dst_free()
anymore.

Regards,
Lorenzo

>=20
> Generally it seems like we should be using the same API to allocate as
> to release the object... This is confusing. What am I missing?

--aWp9RvEMdmSaWjBX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiHswQAKCRA6cBh0uS2t
rHipAP4llkXraaMXUK3wGAgySlJJUwlEcRj8tHK/o/3m+eELXwEA2l1QByKUIy8/
sBrHvIWNbv90x/tGgmBZkNoYSKAXpAo=
=ev4h
-----END PGP SIGNATURE-----

--aWp9RvEMdmSaWjBX--

