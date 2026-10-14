Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE72CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XzrVoQ3vWBTwQeyNjjZdGD+xOhZxdrYigQYqaqhay4=; b=XxY/exOiG8Whsr0jKiU1pkTv4A
	Vs2RtDMGQ4Na43MpvHNbIRwQGv7pTmzd9qZq5+daiSjjmpmNu0QHQQt7NVf3Tq/z8l7Ge1n75gAZA
	RHL9XUfYa64CWEJk2e0g4YueF9aMzB2NHAHhPZ1OEKGGjQ3GETowWGSuKeNiz41ciBu3nzXeWN6sF
	ueIaZbUe45W57SDfgZlH+mXEYEjd2GEnrvg+mBLM9kKrvLqd4czBN5kfcJfirU4HUsf48MXxyq/l5
	dZ1lyqUgme9uxkHSQrCljZfWWF6Sbf9fcYuUlKYrMio9yKdc7z6lOsLAF1we96XXbloUzrZKhC1r+
	PgrPytRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpfy-0000000ER7F-1G0q;
	Wed, 14 Oct 2026 03:29:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpfv-0000000ER6j-3OSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 03:29:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so2861127e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 20:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791948546; cv=none;
        d=google.com; s=arc-20260327;
        b=TubAJHs7rOY0gXRfszoCEmMvZjGw6G5jl+0kbsTgU/0eFdeuH/mw34eKrgtQRaVrOX
         2679I0NkliRteNetYbp0AuTanqn0Z3BM1ZlgSzbdv3UQoIqNZKlonOnn1hZPFk0Hx5Hf
         TPQOrV8PIkEEjEbjVp0rS7o22spT6jWDW9Ga0a7RVfFYieTKdkfyTkc1GMlzZsM7e6sq
         jNFgYaIHFnVTz7Ihnl8vjpMx+YVF52Nfy8kXDtU5Ylw7gF9FmQ7dYspLIRCKb71uW1c+
         7BX+UuNeoYA/3rb1t5MdBzR3cClAbmkZl474Rnut8Uq5LO1MvAg70FQWLEqiJC6J4S4c
         F5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XzrVoQ3vWBTwQeyNjjZdGD+xOhZxdrYigQYqaqhay4=;
        fh=p0P8zHQpVYF1eK3GNPLoudj9FNFu5HeVrPqCFFc//cI=;
        b=MQTa40VCrLwvzGcfCzBIMGz9BbySRZJDogqAmgILzJ0O+fczdp5xwV+qzYcemI9Yht
         GQ7lpvHZ/vrL8nLjD1uK3p2UczrX/9Ey+ezLPNlm5wUKL2j6aNGPo0PGjrhR0+BCU2X1
         oRLaUkf8u4lPly6OO/LvPk1ewbbHpQ2vMUqfX/SVYREiWvMkm5lqXZ01tb1vGmaOrqNY
         8o3TdmBoXGX+a9XSi5BYjSC2xhkY/OKcoAUI0CNwVORxZF27FhVLneZ02gen+1POMKjV
         JMEgqOKmxFUmLLxt/hw8SyStn/c0UC6K3lyXSCZ++37UDxE+yEByXPp4zJArBlaxSghx
         G++g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948546; x=1792553346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XzrVoQ3vWBTwQeyNjjZdGD+xOhZxdrYigQYqaqhay4=;
        b=Ny9CIHTSnPxS7MwUF9gj+XywtQqHGmUIHlDVRVbeGP1SWCvEzY1OOedQUndhGSrjfU
         4rRENgp14rmt2YjGfJTvWeSZ72Whwe7kyn+BCBBd0pK9Ng6SidNdTmDe6XLZ5Dqt8Z30
         GOuVEKww8kPlykU3BbKM6KdlNFkG7hczndJeT+MJVChY1eouoRmv2+vy52fNrC+ab3JT
         sKsts5mkPmyV3r72K3Bc+nMCDM38cNq7j1utGCkvgR1nAR8cYIvu5eUkxWDeuD5wl8eb
         EpeI2E86xilXEnHpOcrfJXfwaKi5S/g+4N1D71A7RcVsBafmSliQsaLrvr0dcXqQouDh
         ST3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948546; x=1792553346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XzrVoQ3vWBTwQeyNjjZdGD+xOhZxdrYigQYqaqhay4=;
        b=nqxR2iDhbYJk0EhriNw3h0FwicU+eKSRQpmLkH8bjLMUV/uRJk5hjdA0vWCurS3mFm
         a179R4I1CdQNXFeRrcOF7oTw5CN2lL7dbDv2zA5RJL77G5FLx1SOcb4Glqs1QQaoJ10W
         YNvR3APruRArsPka+w2E2sL8SozD2Uhd9FIztWTnzeChrc+s8s4lfY6w/AlK15K7VZdL
         bofQEJT4yerh72UP35oZO19/WwgHx+3u6vRLic7ni+awWvkTu3XK/90BKkn67y2y9io0
         +/2mYzywsUo2j989euioCG68FipMYyoLK0kWdkILE+Mbd9ddAfzzJer3GesI6SVv40Ps
         BRYA==
X-Forwarded-Encrypted: i=1; AKwUvBxl1TOPxakkrsPVy4gmbC+Cvy9hI2d9dU1MeSG6gozTaWlJsvYJKavFodO+QOMUTvU7jiEcZ/Cx5sIYNGEf0F9a@lists.infradead.org
X-Gm-Message-State: AFq9FYJk6B0JkPNufoxOg16OZ2QazxX06033ZvCyKnC5K3IIfJW6MgUW
	IbaCqc1w1RRf7VrWTCUqNwE77gLFiUAzyq1GhYvgxci2DUJwMmTV8VuMY0Yo+7SOFyp82et3nUB
	VSVj3uZ+LTnoDM7HBZpXxAH6dt+GliU8=
X-Gm-Gg: AYBFou2ZBv43EkrRghhqaPsAHpEQuYiQ5vRuxhQUCyEP7a2YU5W0xONH8AlPeCF93+A
	qV5ku+nR04/yyIEMH0EWUliNv3iNMJSVGLqM3OxtnL1Pw/OUwGY+yWRK3fwoJeWdnjwGTA30mxx
	FBuA+KdDvkp2c2XNcBuIrWLhNdiVbz4CBBSx2XY/Li7pXOHGX54ez/leLAYjGErFNgNVufpAEEy
	4tkJRJ3yr+OjUhVISNPT3DEVEcYr04QEYcpgVio0bo96B9sVguy4kuuLcJhe4KHmx0f5HaAlaOP
	s1u0kodGScp5BELbOhRV2vjjCMX5ymLLd4tocQF6IWc/knuDRDuI8aPX18pC1Cc=
X-Received: by 2002:a05:6512:668c:20b0:5ba:3df8:5dbc with SMTP id
 2adb3069b0e04-5bcde6b37a7mr2923502e87.20.1791948545348; Tue, 13 Oct 2026
 20:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk> <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
 <as3faB96PFSnC-qP@lore-desk> <CAPZ+gd_S4zMffbFTUbV989XxYtgxuJ3ijEBObehAXP_N20Akww@mail.gmail.com>
 <as5UUQuCjLTXvQ5Q@lore-desk> <CAPZ+gd_S=Wm2DOw+j14HNtsBDQvSgBkWHmBzPqqe3fi3UK4d4w@mail.gmail.com>
 <as6XhxxTqbarzZcS@lore-desk>
In-Reply-To: <as6XhxxTqbarzZcS@lore-desk>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Wed, 14 Oct 2026 11:28:54 +0800
X-Gm-Features: AclHuK_82ADKZfAuGHWzKivAFtRt5-EB7F-dWSDmFyWNeTqF7Lof4wfiGo0wuCo
Message-ID: <CAPZ+gd9Z0kVXy7QnNsByKF=fNAZLsA=q=KySwhmsz3qKgxzGfg@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, horms@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_202907_908482_78A233B1 
X-CRM114-Status: GOOD (  51.83  )
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

Went through the patch:

Per-port UPDMEM slots referenced from the FOE and programmed
through the notifier look correct; the slot range fits the 4-bit UPDMEM
address and the 5-bit smac_id field, stays clear of the GDM port ids,
and would only reach 0xf (the "keep original source MAC" marker) for
an 8-port switch, which this SoC does not have.

For the non-DSA variants, in our setup several service VLANs
(voip/iptv/tr069/internet) are stacked on a single GDM port, each with
its own MAC address. VLAN devices are visible neither to the notifier
nor to airoha_set_macaddr(), and foe_entry_prepare() still collapses
them to smac_id =3D port->id, so all of them would egress with the port
base MAC. The two-airoha,eth-port multi-SerDES variant shares the same
gap.

What the VLAN case needs is the same identity-scoped treatment for
these devices: a slot allocated per egress identity, programmed on
their address events and referenced per flow instead of per port.

Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=
=E6=97=A5=E5=91=A8=E4=B8=89 04:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Oct 14, =E9=99=88=E8=80=80=E6=98=8E wrote:
> > Yes, your analysis is correct: with the patch, the flow offloaded at t1
> > reprograms the shared UPDMEM entry, so the flow egressing port0 starts
> > using port1's L2 address. Our setup happens to carry a single IPv6
> > identity per GDM port (the other services are IPv4), which is why the
> > patch holds there -- it is a stopgap for that topology, as noted.
> >
> > On the second question: in the default DSA configuration user ports
> > inherit the conduit address, so the conduit MAC as source is
> > indistinguishable from the user port's own. It diverges once user ports
> > carry their own addresses (nvmem-assigned or user-configured): the
> > egress frame then differs from what the software path would emit, and
> > upstream bridges learn the conduit MAC behind a user port. Whether that
> > is a bug or a corner case is your call; per-netdev slots would cover
> > either way.
>
> I have not tested it yet, but can you please check if the patch available=
 at
> [0] fixes the reported issue? Thanks.
>
> Regards,
> Lorenzo
>
> [0] https://github.com/LorenzoBianconi/net-next/commit/486a5f13c62985d433=
3a231cc9aaec714e81fcd2
>
> >
> > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=88=
13=E6=97=A5=E5=91=A8=E4=BA=8C 23:54=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > > The issue is reproducible in the upstream codebase, without any of =
the
> > > > out-of-tree PON code -- the PON setup is just where I first hit it.
> > > >
> > > > Reproduction with mainline code only (airoha eth + the mt7530 MMIO =
DSA
> > > > driver; the "airoha,en7581-switch" binding and driver are mainline,
> > > > the DT node just needs to be added to a board file):
> > > >
> > > > - AN7581 board, switch node with its CPU port on GDM1. Use a DSA us=
er
> > > >   port as a routed WAN interface with its own MAC address.
> > > >
> > > > airoha_get_dsa_port() replaces the egress netdev with the conduit, =
so
> > > > routed IPv6 FOE entries carry smac_id =3D conduit port id, and the =
PPE
> > > > resolves the egress source MAC through UPDMEM[conduit]. That slot i=
s
> > > > only programmed by airoha_set_macaddr(), which never runs when a DS=
A
> > > > slave address changes, so offloaded IPv6 frames leave the port with
> > > > the conduit's MAC instead of the user port's. IPv4 is unaffected,
> > > > since HNAPT entries store the MACs inline. The same shape appears o=
n a
> > > > GDM port with two "airoha,eth-port" children carrying different MAC
> > > > LSBs, which the recent multi-SerDES series allows by design
> > > > (REG_FE_MAC_LMIN/LMAX); for that variant the exposure starts with t=
he
> > > > series introducing multiple net_devices per GDM port.
> > > >
> > > > The posted patch only reprograms the shared per-port slot at offloa=
d
> > > > time, so a later address change on any netdev of that port re-break=
s
> > > > offloaded IPv6 flows. It is a temporary patch for this setup; the
> > > > final solution is up to the maintainers.
> > >
> > > I do not think the case you described is fixed with your patch. Let's=
 consider
> > > the following case:
> > >
> > > - time t0: you offload a flow rule for traffic egressing dsa port0
> > > - time t1: you offload a flow rule for traffic egressing dsa port1
> > >
> > > Since the index written in REG_UPDMEM_CTRL() subfield is still the co=
nduit port
> > > ID, you are egressing traffic from port0 with L2 address of port1. Am=
 I right,
> > > or am I missing something?
> > > Moreover, is it a bug if we use the conduit port L2 address as source=
 mac
> > > address for IPv6 traffic?
> > >
> > > Regards,
> > > Lorenzo
> > >
> > > >
> > > > A proper fix would probably give each netdev its own UPDMEM entry: =
the
> > > > table is indexed by a 4-bit address (16 entries) while the FOE
> > > > smac_id field is 5-bit with 0xf reserved for "keep original MAC", s=
o
> > > > there is room beyond the port ids. Slots could be programmed from
> > > > airoha_set_macaddr() (always under RTNL, as you noted) plus a
> > > > netdevice notifier for DSA slaves, and foe_entry_prepare() would on=
ly
> > > > reference the slot -- removing both the race and the extra locking =
the
> > > > current approach needs.
> > > >
> > > > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 15:36=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > > Ooo,  the new patch should be a dedicated leaf lock inside
> > > > > > airoha_ppe_init_upd_mem().
> > > > > > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > @@ -416,6 +416,19 @@
> > > > > >    dsa_port);
> > > > > >
> > > > > >   smac_id =3D port->id;
> > > > > > + /*
> > > > > > + * Routed IPv6 entries resolve the egress source MAC
> > > > > > + * through the UPDMEM table indexed by smac_id. The
> > > > > > + * egress netdev can legally carry a different address
> > > > > > + * than the GDM port itself: on PON setups the
> > > > > > + * authentication MAC lives on the pon device while
> > > > > > + * each service VLAN routes with its own address. Keep
> > > > > > + * the table entry in sync with the source address this
> > > > > > + * flow is actually going to use.
> > > > >
> > > > > Is the issue occurring just with PON or are you able to trigger t=
he issue
> > > > even
> > > > > in the upstream codebase? I guess you should not post a fix for s=
ome code
> > > > that
> > > > > is not upstream yet. Moreover, in the PON setup, I guess the appr=
oach is
> > > > still
> > > > > broken if the user change the device mac address.
> > > > >
> > > > > > + */
> > > > > > + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> > > > > > + airoha_ppe_init_upd_mem(dev,
> > > > > > + data->eth.h_source);
> > > > > >   }
> > > > > >   }
> > > > > >
> > > > > > @@ -1529,10 +1542,21 @@
> > > > > >
> > > > > >  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const=
 u8
> > > > *addr)
> > > > > >  {
> > > > > > + static DEFINE_MUTEX(updmem_lock);
> > > > > > +
> > > > > >   struct airoha_gdm_port *port =3D dev->port;
> > > > > >   struct airoha_eth *eth =3D dev->eth;
> > > > > >   u32 val;
> > > > > >
> > > > > > + /*
> > > > > > + * Routed IPv6 entries resolve the egress source MAC through t=
he
> > > > > > + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac_a=
ddress
> > > > > > + * writers hold flow_offload_mutex (QoS paths re-lock via
> > > > > > + * airoha_set_macaddr()), so this lock also serializes the lea=
f
> > > > > > + * against them.
> > > > > > + */
> > > > > > + mutex_lock(&updmem_lock);
> > > > >
> > > > > This is only required adding the above configuration since in the=
 current
> > > > > codebase airoha_ppe_init_upd_mem() is always running holding RTNL=
.
> > > > >
> > > > > Regards,
> > > > > Lorenzo
> > > > >
> > > > > > +
> > > > > >   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | =
addr[5];
> > > > > >   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
> > > > > >   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> > > > > > @@ -1545,6 +1569,8 @@
> > > > > >       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
> > > > > >       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
> > > > > >       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> > > > > > +
> > > > > > + mutex_unlock(&updmem_lock);
> > > > > >  }
> > > > > >
> > > > > >  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

