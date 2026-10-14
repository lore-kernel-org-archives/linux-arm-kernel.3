Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82BBCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK89iW7TYCNehvJTMbFjRK1BkWKHkETW0nQQ//2ac0g=; b=RcvhiqqAbMbcxueyXa8ppvdedV
	i04b0JLEU8P9Pe6XgVO3SdzWjs264mZfRgb59vM+SFO5raZYQajvqnvXUC0KTqaE21Zg2WsL3tpTX
	oZEHYZyCD6Y6PWBcUvQy56zcejqKvtQR23HrfrQBiwkR5KW87bSV79OKX4FEeCaDItn7UuRpKbK18
	7kuDWM/U0VMnI8G+c6A827BQWRAt3iLY7tCYW8m0fXAQiAYYcLGMI3aBwhrWpz9IXBaYQXZWhRocO
	RALdTWhhgSEjsCA1jRMSQeBq9VXxNNpVzFHNWLKh/U4iz/IC09XkDZD2e7KouNEhTogxseVP4Il1c
	hj8xJBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtke-0000000EoQc-2ceX;
	Wed, 14 Oct 2026 07:50:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtkc-0000000EoQQ-2T8l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B9BB60213;
	Wed, 14 Oct 2026 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C041F000FF;
	Wed, 14 Oct 2026 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964213;
	bh=uK89iW7TYCNehvJTMbFjRK1BkWKHkETW0nQQ//2ac0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kf6m5wJwQW97j1tp9uWoAWXwWL+UcaR7IO+2zmpMxqFgdDEqyF3j1JUmF9CDbc0fG
	 G0hrWuaNEhReGSPm0OcmfNpuCa971r6DeB1VsYwPGzmVLc/h51Ose8p4WS9rsn8Hy/
	 EXZ+Oxs2sD5KS4duVQDk1+r/sn7lCMe+6dD1tW1kHVU6gV2QTUocN34ml87ib1zcdX
	 r+JNe49/Y6KG+pGuA12qfYrCpRlq/icB9V9i80VgRlWwJvACrmz0crrZPnkTrK50mS
	 ToWa5dmXZOpaRO7Yuc143xm01n3fwsjcVU9nAHEE69T3aSWyQ3bg+QBHbYLekwOKBP
	 d6cPoFNoAu2fA==
Date: Wed, 14 Oct 2026 09:50:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
Message-ID: <as80MpGWB6jtxrGj@lore-desk>
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk>
 <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
 <as3faB96PFSnC-qP@lore-desk>
 <CAPZ+gd_S4zMffbFTUbV989XxYtgxuJ3ijEBObehAXP_N20Akww@mail.gmail.com>
 <as5UUQuCjLTXvQ5Q@lore-desk>
 <CAPZ+gd_S=Wm2DOw+j14HNtsBDQvSgBkWHmBzPqqe3fi3UK4d4w@mail.gmail.com>
 <as6XhxxTqbarzZcS@lore-desk>
 <CAPZ+gd9Z0kVXy7QnNsByKF=fNAZLsA=q=KySwhmsz3qKgxzGfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bFnl5cuHayO5eqE4"
Content-Disposition: inline
In-Reply-To: <CAPZ+gd9Z0kVXy7QnNsByKF=fNAZLsA=q=KySwhmsz3qKgxzGfg@mail.gmail.com>
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

--bFnl5cuHayO5eqE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Went through the patch:
>=20
> Per-port UPDMEM slots referenced from the FOE and programmed
> through the notifier look correct; the slot range fits the 4-bit UPDMEM
> address and the 5-bit smac_id field, stays clear of the GDM port ids,
> and would only reach 0xf (the "keep original source MAC" marker) for
> an 8-port switch, which this SoC does not have.

do you have any chance to test it with offloading? I can't do it at the mom=
ent.

>=20
> For the non-DSA variants, in our setup several service VLANs
> (voip/iptv/tr069/internet) are stacked on a single GDM port, each with
> its own MAC address. VLAN devices are visible neither to the notifier
> nor to airoha_set_macaddr(), and foe_entry_prepare() still collapses
> them to smac_id =3D port->id, so all of them would egress with the port
> base MAC. The two-airoha,eth-port multi-SerDES variant shares the same
> gap.

I guess you can modify the airoha_eth_even() logic in order to look at vlan=
 too
but you need to implement the proper logic for the smac_id hw space.

Regards,
Lorenzo

>=20
> What the VLAN case needs is the same identity-scoped treatment for
> these devices: a slot allocated per egress identity, programmed on
> their address events and referenced per flow instead of per port.
>=20
> Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=
=E6=97=A5=E5=91=A8=E4=B8=89 04:41=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Oct 14, =E9=99=88=E8=80=80=E6=98=8E wrote:
> > > Yes, your analysis is correct: with the patch, the flow offloaded at =
t1
> > > reprograms the shared UPDMEM entry, so the flow egressing port0 starts
> > > using port1's L2 address. Our setup happens to carry a single IPv6
> > > identity per GDM port (the other services are IPv4), which is why the
> > > patch holds there -- it is a stopgap for that topology, as noted.
> > >
> > > On the second question: in the default DSA configuration user ports
> > > inherit the conduit address, so the conduit MAC as source is
> > > indistinguishable from the user port's own. It diverges once user por=
ts
> > > carry their own addresses (nvmem-assigned or user-configured): the
> > > egress frame then differs from what the software path would emit, and
> > > upstream bridges learn the conduit MAC behind a user port. Whether th=
at
> > > is a bug or a corner case is your call; per-netdev slots would cover
> > > either way.
> >
> > I have not tested it yet, but can you please check if the patch availab=
le at
> > [0] fixes the reported issue? Thanks.
> >
> > Regards,
> > Lorenzo
> >
> > [0] https://github.com/LorenzoBianconi/net-next/commit/486a5f13c62985d4=
333a231cc9aaec714e81fcd2
> >
> > >
> > > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=
=8813=E6=97=A5=E5=91=A8=E4=BA=8C 23:54=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > > The issue is reproducible in the upstream codebase, without any o=
f the
> > > > > out-of-tree PON code -- the PON setup is just where I first hit i=
t.
> > > > >
> > > > > Reproduction with mainline code only (airoha eth + the mt7530 MMI=
O DSA
> > > > > driver; the "airoha,en7581-switch" binding and driver are mainlin=
e,
> > > > > the DT node just needs to be added to a board file):
> > > > >
> > > > > - AN7581 board, switch node with its CPU port on GDM1. Use a DSA =
user
> > > > >   port as a routed WAN interface with its own MAC address.
> > > > >
> > > > > airoha_get_dsa_port() replaces the egress netdev with the conduit=
, so
> > > > > routed IPv6 FOE entries carry smac_id =3D conduit port id, and th=
e PPE
> > > > > resolves the egress source MAC through UPDMEM[conduit]. That slot=
 is
> > > > > only programmed by airoha_set_macaddr(), which never runs when a =
DSA
> > > > > slave address changes, so offloaded IPv6 frames leave the port wi=
th
> > > > > the conduit's MAC instead of the user port's. IPv4 is unaffected,
> > > > > since HNAPT entries store the MACs inline. The same shape appears=
 on a
> > > > > GDM port with two "airoha,eth-port" children carrying different M=
AC
> > > > > LSBs, which the recent multi-SerDES series allows by design
> > > > > (REG_FE_MAC_LMIN/LMAX); for that variant the exposure starts with=
 the
> > > > > series introducing multiple net_devices per GDM port.
> > > > >
> > > > > The posted patch only reprograms the shared per-port slot at offl=
oad
> > > > > time, so a later address change on any netdev of that port re-bre=
aks
> > > > > offloaded IPv6 flows. It is a temporary patch for this setup; the
> > > > > final solution is up to the maintainers.
> > > >
> > > > I do not think the case you described is fixed with your patch. Let=
's consider
> > > > the following case:
> > > >
> > > > - time t0: you offload a flow rule for traffic egressing dsa port0
> > > > - time t1: you offload a flow rule for traffic egressing dsa port1
> > > >
> > > > Since the index written in REG_UPDMEM_CTRL() subfield is still the =
conduit port
> > > > ID, you are egressing traffic from port0 with L2 address of port1. =
Am I right,
> > > > or am I missing something?
> > > > Moreover, is it a bug if we use the conduit port L2 address as sour=
ce mac
> > > > address for IPv6 traffic?
> > > >
> > > > Regards,
> > > > Lorenzo
> > > >
> > > > >
> > > > > A proper fix would probably give each netdev its own UPDMEM entry=
: the
> > > > > table is indexed by a 4-bit address (16 entries) while the FOE
> > > > > smac_id field is 5-bit with 0xf reserved for "keep original MAC",=
 so
> > > > > there is room beyond the port ids. Slots could be programmed from
> > > > > airoha_set_macaddr() (always under RTNL, as you noted) plus a
> > > > > netdevice notifier for DSA slaves, and foe_entry_prepare() would =
only
> > > > > reference the slot -- removing both the race and the extra lockin=
g the
> > > > > current approach needs.
> > > > >
> > > > > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 15:36=E5=86=99=E9=81=93=EF=BC=9A
> > > > > >
> > > > > > > Ooo,  the new patch should be a dedicated leaf lock inside
> > > > > > > airoha_ppe_init_upd_mem().
> > > > > > > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > > @@ -416,6 +416,19 @@
> > > > > > >    dsa_port);
> > > > > > >
> > > > > > >   smac_id =3D port->id;
> > > > > > > + /*
> > > > > > > + * Routed IPv6 entries resolve the egress source MAC
> > > > > > > + * through the UPDMEM table indexed by smac_id. The
> > > > > > > + * egress netdev can legally carry a different address
> > > > > > > + * than the GDM port itself: on PON setups the
> > > > > > > + * authentication MAC lives on the pon device while
> > > > > > > + * each service VLAN routes with its own address. Keep
> > > > > > > + * the table entry in sync with the source address this
> > > > > > > + * flow is actually going to use.
> > > > > >
> > > > > > Is the issue occurring just with PON or are you able to trigger=
 the issue
> > > > > even
> > > > > > in the upstream codebase? I guess you should not post a fix for=
 some code
> > > > > that
> > > > > > is not upstream yet. Moreover, in the PON setup, I guess the ap=
proach is
> > > > > still
> > > > > > broken if the user change the device mac address.
> > > > > >
> > > > > > > + */
> > > > > > > + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> > > > > > > + airoha_ppe_init_upd_mem(dev,
> > > > > > > + data->eth.h_source);
> > > > > > >   }
> > > > > > >   }
> > > > > > >
> > > > > > > @@ -1529,10 +1542,21 @@
> > > > > > >
> > > > > > >  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, con=
st u8
> > > > > *addr)
> > > > > > >  {
> > > > > > > + static DEFINE_MUTEX(updmem_lock);
> > > > > > > +
> > > > > > >   struct airoha_gdm_port *port =3D dev->port;
> > > > > > >   struct airoha_eth *eth =3D dev->eth;
> > > > > > >   u32 val;
> > > > > > >
> > > > > > > + /*
> > > > > > > + * Routed IPv6 entries resolve the egress source MAC through=
 the
> > > > > > > + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac=
_address
> > > > > > > + * writers hold flow_offload_mutex (QoS paths re-lock via
> > > > > > > + * airoha_set_macaddr()), so this lock also serializes the l=
eaf
> > > > > > > + * against them.
> > > > > > > + */
> > > > > > > + mutex_lock(&updmem_lock);
> > > > > >
> > > > > > This is only required adding the above configuration since in t=
he current
> > > > > > codebase airoha_ppe_init_upd_mem() is always running holding RT=
NL.
> > > > > >
> > > > > > Regards,
> > > > > > Lorenzo
> > > > > >
> > > > > > > +
> > > > > > >   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) =
| addr[5];
> > > > > > >   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
> > > > > > >   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> > > > > > > @@ -1545,6 +1569,8 @@
> > > > > > >       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
> > > > > > >       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
> > > > > > >       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> > > > > > > +
> > > > > > > + mutex_unlock(&updmem_lock);
> > > > > > >  }
> > > > > > >
> > > > > > >  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

--bFnl5cuHayO5eqE4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas80MgAKCRA6cBh0uS2t
rGlnAP9+nPBdDTIOUWeHUeWNlU1pieseWUc303gM+J+KV3R1yAD+KyqoSYSE1qzY
J9oYwpYAk9poYL9s+FKtkw29DWX/ZAg=
=eOxL
-----END PGP SIGNATURE-----

--bFnl5cuHayO5eqE4--

