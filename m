Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E95CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlwurY0TiIkDVpZXAfTwTYREWvI2q1JzRx0JC1ItVic=; b=evuaiAw64PDq+XK1NytSkYWjRm
	Cc5bHAVxk3M3HlZOr/gwXnmcEsdFpNyIVDCxzzUSpKUfmr5xawQOCenF9KV7yd+qlNRbQ4bolSOuC
	ZpOcSzgkO1XA+joxBSYbF4bFF/2XWsOYU9BEgtlrTm72KTlEnRKFxrDJKjm1JU+VwnbumU0FMnoNx
	0l7ESOJYq3lpzI5zMiM2wUFAkF5ykxLdgnH7FlLqlXOhdZlIEPWXrii5pHOpWb06OxmcKhz4ACJEg
	IKQHlvoCe6HtK7FyLNbJcv6wojin3rNrFga7zqiJuLUuwuTRoo/IG1JAHEQuCGvO+bvyxhTnyZOAN
	48BXXN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuw0-0000000Eyt4-2KtV;
	Wed, 14 Oct 2026 09:06:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuvu-0000000Eyqf-2xVN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WlwurY0TiIkDVpZXAfTwTYREWvI2q1JzRx0JC1ItVic=; b=i+00Tv5z2/R3Eo2kJUPqIXHmvH
	MBLQIFWqIE9ekzPQftv3M6Hi2Myg96i+nLzHvUJAofssGxVNXTpZCP4dC3Bl0ulByI0TKofwVtbBh
	H6ZxMmOrox1PgYuqIM4EFLuHxm/7ue0n16rVxq55mDS+hAC/AMn2nrg2X3KvZEtNTbDlE/9RahlAE
	9GnC+1qRkW+4he8uNY5iHxHh16yIufEe7Koxh2PmHx2aQX7IIizu+3kp0GowQ6AmsLxX6WsvjP/zq
	lvvXXdx9PHNhYtRMZs6LTASp9tatyOpcoXdVXGVT+St4K6mtSiF827Gw5Fylq/m8j+TMVRKW/6QP/
	Rlbal5Tw==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuvr-0000000GXZb-2IM7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:05:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5bce4e278baso745560e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791968753; cv=none;
        d=google.com; s=arc-20260327;
        b=lWlTuT/SkJLOgjuQ2AE5qyq1cgYuRaM3sDJEMCTL+TAP6jUFBl9L+HkKB3TjTEh9BO
         E+ldXlZ/4eGHbnlLczj4NqIBW7hthcpxQDNNGBTo05rDLOM+ni+tMcvQF2qBUxBEeWVM
         j9DpCHbVmTCVNb1Ecm1DaMLN2f/YvQLB2OfVjdBngivFSBpuqO1EPvkn22mDJ751lOgq
         Rqiw0Yzodm/s0pPE5vfVbJC2NyJkA2lACnvCgJt6CL4FCPmevblUh1h/GYRZ/ItwtVo3
         nWmjy5BrX6fKxDWJlecN7szNCuRDDJOpfUhGBVyD5St1xDun0E+Yd7VKV6WptFR0x+Lv
         zZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WlwurY0TiIkDVpZXAfTwTYREWvI2q1JzRx0JC1ItVic=;
        fh=XbdiEEEGr12E6Paw5FUq/qUeNsyYV+MT07SYmapKeqU=;
        b=GKMyPwsv1eTncU5OY9KudrvvdSrdrL00396riXb+Z1TSz1m2vaJ9m/O9MEnOGT52Rk
         qHo1UGX3Ax0C4vG/4zOzQjh3klrY88w6Qd7CV28MTBCvq7xz31cwhjDcUgILibM6IQra
         +q5UPH4uH27h+fL2yYXcwj9ofAiD+VmuXqDiyucfxkfONWvrRawvlAbI+oktPK4u1nOZ
         RuqS7V64QiEY+bdggpOBI9WduIY04G4Bp0C4IfioJMlPzkaRepdSV5xQePhGPkfFFe5L
         GOwhHSmmWYvI+0VyoaCxQUO6hyxrvfS1C3IriSH6E4tLNtQqJKtsgH9XnXPtjYAxUtGT
         LeuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968753; x=1792573553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlwurY0TiIkDVpZXAfTwTYREWvI2q1JzRx0JC1ItVic=;
        b=nZ/rHu2FK3bPjQW4yKMnws49+o+c12nAgVbF+b/dyZa17kYKwDzCOC59/IVo5vOw1C
         HPY1BtCyF9B2/7csHBI4Tz5/tHyPkCUO4IQE68C6epGS+yjTg0KbRhKuNvgvE66eOATQ
         DDN1ir6NrP7p/AYNjcjWOVY1TVBvLuSF8gAAYxl/xxrNYiql62FXk8bTXaXU5YadTY/F
         VJ5NRoXb2nda/hMBE4UPDXGBn/VPFyO/JsZzjGNn8Ltwp4GQJME1ovmOZBdnm3m8HfbR
         WSI3G3Hf6Mwi/TMYloosjuHH1WumOJD0L5g8N9jgm/7DMx/4ooEbwg6O+M06KBjChQ8i
         UWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968753; x=1792573553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlwurY0TiIkDVpZXAfTwTYREWvI2q1JzRx0JC1ItVic=;
        b=mffKaCpRl3EdPwTC7Ftghnr0/Zjm0in7NyKE4XKNIMTe/l9rPV4W694OMJ8tpA+GwV
         xKshwMLu5jwl2MeL9Cj7HZsuDEOfHzVUihG4ucEftrzSRP7eQ9jZcaS2z31qnNAz+hWJ
         GVtvXRhr7Q3XSPYZBV6h4tQsrfX78fe4mP6pCxKCrP620DjtiYIK2+OxDDxBj2ZqkuNE
         OqUjDAspkkb0YG/KgFeBYl1Q+hRq+JnMH0rfGyn8HyZHLGv3W4bv+NR7Zoz0/CUCuH2D
         gKGUDwIwRq7oOvxIdgSv+RVTVl26L0p/xRiimD/FAR2nkNYU+ZpZsAShXg0/Rz23tOLM
         LnrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEJNt5WacyCMFfIfeAzc4TbrkAyCbyUtP13ulut31rOGwenZrkOdZDaIYvAakBaW0Dw1ATh2nho4mTB6Nl3nQI@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2sFKb4tbEX+J8ebTPzNQoj0HKycQl6gHl4G5rpa4DWf5lQWH0
	8t633waFV2NSPAzu+pi0r5Wn8QNIsGEjf/qHM78zk8kTRSxkQDgGJkqgi+CNtnnKLybKhq1m+vr
	uEyPgx6H2tl89F1RTOIRhGKydH/AbUeafOwisJ+7pcw==
X-Gm-Gg: AYBFou1en9IelalU/kSVgtORFhdrSHXZFHAyarZeTwVxnRxiZXnfn9Y8jJoKLZqPU70
	ncL9ym0j79Xi6BIx580FI7ZtpMe+6jrNr9DVivKr4azLmK6akMGE9FIocx+HmqKiYy1fDgFp76H
	AF3gusSd+Mt5wvVv3U/Jyc5ezlZmDxGMqICVmJ7RZV8MZuALYLK49xIUvS3z+A08eRiHR2ZVtTQ
	4uZtya+n5gJukfzs4GPkKdr8IFWex0PJEDeKkWaLlMn7tcG3bD+OzRVMy9GVxJ4W5MYO7afVvft
	WTxfSB7FzoIj/Sr8mmlsRbWQEDCmYt6BHOuGa8EANhUUzkppUlLzoeV9LfqAFB0JKg==
X-Received: by 2002:a05:6512:b1c:b0:5b8:e9cf:daa6 with SMTP id
 2adb3069b0e04-5bcdd4f080cmr5278239e87.10.1791968752266; Wed, 14 Oct 2026
 02:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk> <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
 <as3faB96PFSnC-qP@lore-desk> <CAPZ+gd_S4zMffbFTUbV989XxYtgxuJ3ijEBObehAXP_N20Akww@mail.gmail.com>
 <as5UUQuCjLTXvQ5Q@lore-desk> <CAPZ+gd_S=Wm2DOw+j14HNtsBDQvSgBkWHmBzPqqe3fi3UK4d4w@mail.gmail.com>
 <as6XhxxTqbarzZcS@lore-desk> <CAPZ+gd9Z0kVXy7QnNsByKF=fNAZLsA=q=KySwhmsz3qKgxzGfg@mail.gmail.com>
 <as80MpGWB6jtxrGj@lore-desk>
In-Reply-To: <as80MpGWB6jtxrGj@lore-desk>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Wed, 14 Oct 2026 17:05:39 +0800
X-Gm-Features: AclHuK8yunaWqrdYNRULXWfdhMLrXu8LzBcxepO8E6oxvDONIgZoFlS9pWE9vwI
Message-ID: <CAPZ+gd8DCeBBNV8dRMRY2hFq8qiA+ivTOof4wwx6K2aONXQjZw@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, horms@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_100555_809594_51784741 
X-CRM114-Status: GOOD (  57.30  )
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

No, I don't have a setup to exercise the DSA offload path, so I can't
provide a Tested-by for this one.

Agreed on the VLAN case: extending the notifier to VLAN devices is the
easy half; the smac_id hw space allocation is the actual design work.
That is beyond our scope for now.

It is worth noting that the free smac_id space is tight once the GDM
ports and the DSA range are carved out (single digits on this SoC), so
the allocation likely needs to be dynamic with reclaim, covering only
identities that actually route IPv6.

Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8814=
=E6=97=A5=E5=91=A8=E4=B8=89 15:50=E5=86=99=E9=81=93=EF=BC=9A
>
> > Went through the patch:
> >
> > Per-port UPDMEM slots referenced from the FOE and programmed
> > through the notifier look correct; the slot range fits the 4-bit UPDMEM
> > address and the 5-bit smac_id field, stays clear of the GDM port ids,
> > and would only reach 0xf (the "keep original source MAC" marker) for
> > an 8-port switch, which this SoC does not have.
>
> do you have any chance to test it with offloading? I can't do it at the m=
oment.
>
> >
> > For the non-DSA variants, in our setup several service VLANs
> > (voip/iptv/tr069/internet) are stacked on a single GDM port, each with
> > its own MAC address. VLAN devices are visible neither to the notifier
> > nor to airoha_set_macaddr(), and foe_entry_prepare() still collapses
> > them to smac_id =3D port->id, so all of them would egress with the port
> > base MAC. The two-airoha,eth-port multi-SerDES variant shares the same
> > gap.
>
> I guess you can modify the airoha_eth_even() logic in order to look at vl=
an too
> but you need to implement the proper logic for the smac_id hw space.
>
> Regards,
> Lorenzo
>
> >
> > What the VLAN case needs is the same identity-scoped treatment for
> > these devices: a slot allocated per egress identity, programmed on
> > their address events and referenced per flow instead of per port.
> >
> > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=88=
14=E6=97=A5=E5=91=A8=E4=B8=89 04:41=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Oct 14, =E9=99=88=E8=80=80=E6=98=8E wrote:
> > > > Yes, your analysis is correct: with the patch, the flow offloaded a=
t t1
> > > > reprograms the shared UPDMEM entry, so the flow egressing port0 sta=
rts
> > > > using port1's L2 address. Our setup happens to carry a single IPv6
> > > > identity per GDM port (the other services are IPv4), which is why t=
he
> > > > patch holds there -- it is a stopgap for that topology, as noted.
> > > >
> > > > On the second question: in the default DSA configuration user ports
> > > > inherit the conduit address, so the conduit MAC as source is
> > > > indistinguishable from the user port's own. It diverges once user p=
orts
> > > > carry their own addresses (nvmem-assigned or user-configured): the
> > > > egress frame then differs from what the software path would emit, a=
nd
> > > > upstream bridges learn the conduit MAC behind a user port. Whether =
that
> > > > is a bug or a corner case is your call; per-netdev slots would cove=
r
> > > > either way.
> > >
> > > I have not tested it yet, but can you please check if the patch avail=
able at
> > > [0] fixes the reported issue? Thanks.
> > >
> > > Regards,
> > > Lorenzo
> > >
> > > [0] https://github.com/LorenzoBianconi/net-next/commit/486a5f13c62985=
d4333a231cc9aaec714e81fcd2
> > >
> > > >
> > > > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 23:54=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > > The issue is reproducible in the upstream codebase, without any=
 of the
> > > > > > out-of-tree PON code -- the PON setup is just where I first hit=
 it.
> > > > > >
> > > > > > Reproduction with mainline code only (airoha eth + the mt7530 M=
MIO DSA
> > > > > > driver; the "airoha,en7581-switch" binding and driver are mainl=
ine,
> > > > > > the DT node just needs to be added to a board file):
> > > > > >
> > > > > > - AN7581 board, switch node with its CPU port on GDM1. Use a DS=
A user
> > > > > >   port as a routed WAN interface with its own MAC address.
> > > > > >
> > > > > > airoha_get_dsa_port() replaces the egress netdev with the condu=
it, so
> > > > > > routed IPv6 FOE entries carry smac_id =3D conduit port id, and =
the PPE
> > > > > > resolves the egress source MAC through UPDMEM[conduit]. That sl=
ot is
> > > > > > only programmed by airoha_set_macaddr(), which never runs when =
a DSA
> > > > > > slave address changes, so offloaded IPv6 frames leave the port =
with
> > > > > > the conduit's MAC instead of the user port's. IPv4 is unaffecte=
d,
> > > > > > since HNAPT entries store the MACs inline. The same shape appea=
rs on a
> > > > > > GDM port with two "airoha,eth-port" children carrying different=
 MAC
> > > > > > LSBs, which the recent multi-SerDES series allows by design
> > > > > > (REG_FE_MAC_LMIN/LMAX); for that variant the exposure starts wi=
th the
> > > > > > series introducing multiple net_devices per GDM port.
> > > > > >
> > > > > > The posted patch only reprograms the shared per-port slot at of=
fload
> > > > > > time, so a later address change on any netdev of that port re-b=
reaks
> > > > > > offloaded IPv6 flows. It is a temporary patch for this setup; t=
he
> > > > > > final solution is up to the maintainers.
> > > > >
> > > > > I do not think the case you described is fixed with your patch. L=
et's consider
> > > > > the following case:
> > > > >
> > > > > - time t0: you offload a flow rule for traffic egressing dsa port=
0
> > > > > - time t1: you offload a flow rule for traffic egressing dsa port=
1
> > > > >
> > > > > Since the index written in REG_UPDMEM_CTRL() subfield is still th=
e conduit port
> > > > > ID, you are egressing traffic from port0 with L2 address of port1=
. Am I right,
> > > > > or am I missing something?
> > > > > Moreover, is it a bug if we use the conduit port L2 address as so=
urce mac
> > > > > address for IPv6 traffic?
> > > > >
> > > > > Regards,
> > > > > Lorenzo
> > > > >
> > > > > >
> > > > > > A proper fix would probably give each netdev its own UPDMEM ent=
ry: the
> > > > > > table is indexed by a 4-bit address (16 entries) while the FOE
> > > > > > smac_id field is 5-bit with 0xf reserved for "keep original MAC=
", so
> > > > > > there is room beyond the port ids. Slots could be programmed fr=
om
> > > > > > airoha_set_macaddr() (always under RTNL, as you noted) plus a
> > > > > > netdevice notifier for DSA slaves, and foe_entry_prepare() woul=
d only
> > > > > > reference the slot -- removing both the race and the extra lock=
ing the
> > > > > > current approach needs.
> > > > > >
> > > > > > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=
=E6=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 15:36=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > >
> > > > > > > > Ooo,  the new patch should be a dedicated leaf lock inside
> > > > > > > > airoha_ppe_init_upd_mem().
> > > > > > > > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > > > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > > > > > @@ -416,6 +416,19 @@
> > > > > > > >    dsa_port);
> > > > > > > >
> > > > > > > >   smac_id =3D port->id;
> > > > > > > > + /*
> > > > > > > > + * Routed IPv6 entries resolve the egress source MAC
> > > > > > > > + * through the UPDMEM table indexed by smac_id. The
> > > > > > > > + * egress netdev can legally carry a different address
> > > > > > > > + * than the GDM port itself: on PON setups the
> > > > > > > > + * authentication MAC lives on the pon device while
> > > > > > > > + * each service VLAN routes with its own address. Keep
> > > > > > > > + * the table entry in sync with the source address this
> > > > > > > > + * flow is actually going to use.
> > > > > > >
> > > > > > > Is the issue occurring just with PON or are you able to trigg=
er the issue
> > > > > > even
> > > > > > > in the upstream codebase? I guess you should not post a fix f=
or some code
> > > > > > that
> > > > > > > is not upstream yet. Moreover, in the PON setup, I guess the =
approach is
> > > > > > still
> > > > > > > broken if the user change the device mac address.
> > > > > > >
> > > > > > > > + */
> > > > > > > > + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> > > > > > > > + airoha_ppe_init_upd_mem(dev,
> > > > > > > > + data->eth.h_source);
> > > > > > > >   }
> > > > > > > >   }
> > > > > > > >
> > > > > > > > @@ -1529,10 +1542,21 @@
> > > > > > > >
> > > > > > > >  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, c=
onst u8
> > > > > > *addr)
> > > > > > > >  {
> > > > > > > > + static DEFINE_MUTEX(updmem_lock);
> > > > > > > > +
> > > > > > > >   struct airoha_gdm_port *port =3D dev->port;
> > > > > > > >   struct airoha_eth *eth =3D dev->eth;
> > > > > > > >   u32 val;
> > > > > > > >
> > > > > > > > + /*
> > > > > > > > + * Routed IPv6 entries resolve the egress source MAC throu=
gh the
> > > > > > > > + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_m=
ac_address
> > > > > > > > + * writers hold flow_offload_mutex (QoS paths re-lock via
> > > > > > > > + * airoha_set_macaddr()), so this lock also serializes the=
 leaf
> > > > > > > > + * against them.
> > > > > > > > + */
> > > > > > > > + mutex_lock(&updmem_lock);
> > > > > > >
> > > > > > > This is only required adding the above configuration since in=
 the current
> > > > > > > codebase airoha_ppe_init_upd_mem() is always running holding =
RTNL.
> > > > > > >
> > > > > > > Regards,
> > > > > > > Lorenzo
> > > > > > >
> > > > > > > > +
> > > > > > > >   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8=
) | addr[5];
> > > > > > > >   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
> > > > > > > >   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> > > > > > > > @@ -1545,6 +1569,8 @@
> > > > > > > >       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
> > > > > > > >       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
> > > > > > > >       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> > > > > > > > +
> > > > > > > > + mutex_unlock(&updmem_lock);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *d=
ev)

