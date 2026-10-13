Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA95CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vry0FomY0o+fIiPN+IOFBgx6eDMuiQwPG8U2m/ko8V4=; b=NWhbbXEVCprMG0m8aDTYXiqTzF
	ZOAJx6kY5YhSIv7rcnJEEvHe48j4NTMZ17iNBc3i1Htzs0kfFLNtWwTYj6DjDLDQKbm+IHNBKTPk0
	kEs6zsJ26c3mYkKM/tv9YDA7S+Hl4vCKtFt71sxoVgI3eSD9gYjZw9wynTAY+zfgtnOLgVSjUlWwJ
	1073FhLeebcNxNwbRlx17YDv9UArKpFdPBht8bNErtl0l2QWgqg3U2+XfaDzaVW9kTlT1auCDe+OL
	ufTXZyPB62JjVGHTJoN57tkAOQfHpi2G0jWS8QPprKwPpkFgJi6E2jzQIy+UFAYdth2uHyJ9NUUq2
	4mvx7GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgCc-0000000DfqJ-1rPE;
	Tue, 13 Oct 2026 17:22:14 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgCZ-0000000Dfpk-0Edu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:22:12 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5ba7ed32ccdso3785603e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791912129; cv=none;
        d=google.com; s=arc-20260327;
        b=CeErXGAW4rwEuIdqBP++W2MGhwS8Id2wm1ocIeWmMOpnCov76oJSEup4eQ7sduJlUW
         bf4NbwahWkCqWLyRA8keMnxZS8aPvQUPadoC95efxwbOvlZtONRgFMeLptJ5nL/mcpoc
         BqhkYBVtopqV+ulWmO9dmrWfbTjuVHLSJY9cx/5HcxouULjh52YK95KQitJxfxNj5DXi
         1wL6B7g2lbl9Ai17nX9F71xpqPUcFpPdkC7yK5RablV13fLZxi62iVkXTvOKYwRjO7/N
         cOQRAiSbLh/O4guWBaT81tAm0jhU5U4y9QrsBZebagPQIBhkuVmRu4g2rWbqMmio038h
         vOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vry0FomY0o+fIiPN+IOFBgx6eDMuiQwPG8U2m/ko8V4=;
        fh=cfUg4/AmOMw7p6VgHArjljSflFAv8xRIOofeu/xdCnw=;
        b=YM6kODb8Sfw4RfwajbFb6nLmKkL89YYZ3B+rHZZECKXerfaVu9TnwFs3XJewEe4bjC
         Cczes5v5VNl7c4jN62+yc3xnOAYIbt1oRFeltarOpJKpUTtr1Cihh59ef9JuztODimQm
         GUS3y3/bnCmSe2U4sMlcBERvuQKjhZMmElH1ahnG2xX2z2agG+S7k7N4ShnYyZCsWeJn
         S4gXaj04WbGTWnqrQ1OMWVLa4DRCs5KPFK4UsrafDqukwSWN2akWyGtR14aDw+FT8EWl
         vQvIXreJPww60OZrlO7xkz6SHI6HdUu1tQgJpmdmQWbd2Loyn2cS+GMW3lzYq8lnD8Pi
         Ii4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912129; x=1792516929; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vry0FomY0o+fIiPN+IOFBgx6eDMuiQwPG8U2m/ko8V4=;
        b=TLIwFYIgbqju071d/k9NQltiH6kHl/jnLNRGVj+YVmAh6t+MMQQyENtcmbQgipDjKL
         N4EZuZRS7rMyJeFHmnmwOWd7ubm6VP2esfgcHaWrxWUMIltRSQcbyMsXk33zpMBPhHDP
         XX4rowckcjgPcQBEUUkTOkoMEdm2U1hpSEJeiwRosIBf8AYUHdNakgq3ndEBc7cUVmK/
         F8zwC6ZrEkGQvyJ4SQpWDUFA9WuSRChYPOlq5PwBaXelN8CD1Ok3/biEZblQfaDzs44w
         2bwERAi9JVtCjk17wBPepWVpgH8akfFHPbTgF1Q6Id1SWlBU2XMctc5ZLsqKRq5oZWzp
         8UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912129; x=1792516929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vry0FomY0o+fIiPN+IOFBgx6eDMuiQwPG8U2m/ko8V4=;
        b=R8Zn5XWgV69OYGcthg7njL3cATN1nFDjqTDBVdJSnI38uU1kNExD85lOp1WkwxPhmL
         FSBqWCqQUryol9PM+MXPVmAcRLeYYUXY1kids3lTQ39jaSs5SWzHh+j3yrOjAHMR7OZX
         YVScAke1hjgrDLnxBX1JK5Eg6721ytOcX/yu4mzFGOkzEZJjAsoV5L2jdR4JLx6kEo2L
         VkmQxzV4pAFA9WUxfoEVdt6Djf0PTYkZm9lMzzKdhly/GCLokaGHtHDXPpxPl04EEGkv
         tZ2447okgP/HAChBYJ5DK48nfy/du4N5l/HnYVZSjQ99j4vNoMy/kgEzRbC/1pnAUHj3
         g4EA==
X-Forwarded-Encrypted: i=1; AKwUvBx3XGGd7YJtQI/gf2B78haUpx45NXYQCJ8llf19VfU6t+VFWbrNB63QsqLrcaCLKyvZTVSyUZwxRfdO6H7Rj4hw@lists.infradead.org
X-Gm-Message-State: AFq9FYKHti3tsIWTBgp+D7qpUxa7YG+JVF7GUG8vxaWHCZJDT//kU0Td
	k317EDOwrMjRnvWjOkeP3kpkvbJmc7IzcVEO8QVHYHTCWrrzMp9PKgVuf4/xfI4ta1skevWICDT
	YK7doAoy/fSbfe9ULmBpoge6ld/mqhJxSmFPCIj+I/A==
X-Gm-Gg: AYBFou37B8+QCtqfEE8nuXbGAjHw2ZYyWbyJzkr+peSttZilmkyjrmkWD8qkDSlKAwO
	W1J3vUE2p0hewUHMvOyQxDnMk5suwaKq/49jILf4aE7Il0r+JmNngJw4E5cf8J/DGkbt8WPJQoI
	J9c37adKmRagQFkNBcw4ETrxy436yMPB0PMakF20gboY7WTLvEJ5SW3Y3vPiyX+1pEYAqh+WbBO
	qnWbCt4cDhdyf0lYCBWFz0i3oZxULvPUsfiKU55QbVDpyIqtDuSguduDfT0zEPlI0Z4rGjeHizs
	3tsFPbqKMzxvVDI9224XSzvwQ+d5kxGihDsZ5RGiYYR6KC+euNk4Xec=
X-Received: by 2002:a05:6512:6c3:b0:5b8:f955:29e7 with SMTP id
 2adb3069b0e04-5bcde361b06mr5358978e87.6.1791912128673; Tue, 13 Oct 2026
 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk> <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
 <as3faB96PFSnC-qP@lore-desk> <CAPZ+gd_S4zMffbFTUbV989XxYtgxuJ3ijEBObehAXP_N20Akww@mail.gmail.com>
 <as5UUQuCjLTXvQ5Q@lore-desk>
In-Reply-To: <as5UUQuCjLTXvQ5Q@lore-desk>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Wed, 14 Oct 2026 01:21:56 +0800
X-Gm-Features: AclHuK_g-Sdjjejv96ItYunQgs7YZaH9slg-qPbOvXsBv4lveQ-6_oB1RIvpKRc
Message-ID: <CAPZ+gd_S=Wm2DOw+j14HNtsBDQvSgBkWHmBzPqqe3fi3UK4d4w@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, horms@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_102211_143818_14403B49 
X-CRM114-Status: GOOD (  45.96  )
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

Yes, your analysis is correct: with the patch, the flow offloaded at t1
reprograms the shared UPDMEM entry, so the flow egressing port0 starts
using port1's L2 address. Our setup happens to carry a single IPv6
identity per GDM port (the other services are IPv4), which is why the
patch holds there -- it is a stopgap for that topology, as noted.

On the second question: in the default DSA configuration user ports
inherit the conduit address, so the conduit MAC as source is
indistinguishable from the user port's own. It diverges once user ports
carry their own addresses (nvmem-assigned or user-configured): the
egress frame then differs from what the software path would emit, and
upstream bridges learn the conduit MAC behind a user port. Whether that
is a bug or a corner case is your call; per-netdev slots would cover
either way.

Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=8C 23:54=E5=86=99=E9=81=93=EF=BC=9A
>
> > The issue is reproducible in the upstream codebase, without any of the
> > out-of-tree PON code -- the PON setup is just where I first hit it.
> >
> > Reproduction with mainline code only (airoha eth + the mt7530 MMIO DSA
> > driver; the "airoha,en7581-switch" binding and driver are mainline,
> > the DT node just needs to be added to a board file):
> >
> > - AN7581 board, switch node with its CPU port on GDM1. Use a DSA user
> >   port as a routed WAN interface with its own MAC address.
> >
> > airoha_get_dsa_port() replaces the egress netdev with the conduit, so
> > routed IPv6 FOE entries carry smac_id =3D conduit port id, and the PPE
> > resolves the egress source MAC through UPDMEM[conduit]. That slot is
> > only programmed by airoha_set_macaddr(), which never runs when a DSA
> > slave address changes, so offloaded IPv6 frames leave the port with
> > the conduit's MAC instead of the user port's. IPv4 is unaffected,
> > since HNAPT entries store the MACs inline. The same shape appears on a
> > GDM port with two "airoha,eth-port" children carrying different MAC
> > LSBs, which the recent multi-SerDES series allows by design
> > (REG_FE_MAC_LMIN/LMAX); for that variant the exposure starts with the
> > series introducing multiple net_devices per GDM port.
> >
> > The posted patch only reprograms the shared per-port slot at offload
> > time, so a later address change on any netdev of that port re-breaks
> > offloaded IPv6 flows. It is a temporary patch for this setup; the
> > final solution is up to the maintainers.
>
> I do not think the case you described is fixed with your patch. Let's con=
sider
> the following case:
>
> - time t0: you offload a flow rule for traffic egressing dsa port0
> - time t1: you offload a flow rule for traffic egressing dsa port1
>
> Since the index written in REG_UPDMEM_CTRL() subfield is still the condui=
t port
> ID, you are egressing traffic from port0 with L2 address of port1. Am I r=
ight,
> or am I missing something?
> Moreover, is it a bug if we use the conduit port L2 address as source mac
> address for IPv6 traffic?
>
> Regards,
> Lorenzo
>
> >
> > A proper fix would probably give each netdev its own UPDMEM entry: the
> > table is indexed by a 4-bit address (16 entries) while the FOE
> > smac_id field is 5-bit with 0xf reserved for "keep original MAC", so
> > there is room beyond the port ids. Slots could be programmed from
> > airoha_set_macaddr() (always under RTNL, as you noted) plus a
> > netdevice notifier for DSA slaves, and foe_entry_prepare() would only
> > reference the slot -- removing both the race and the extra locking the
> > current approach needs.
> >
> > Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=88=
13=E6=97=A5=E5=91=A8=E4=BA=8C 15:36=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > > Ooo,  the new patch should be a dedicated leaf lock inside
> > > > airoha_ppe_init_upd_mem().
> > > > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > > > @@ -416,6 +416,19 @@
> > > >    dsa_port);
> > > >
> > > >   smac_id =3D port->id;
> > > > + /*
> > > > + * Routed IPv6 entries resolve the egress source MAC
> > > > + * through the UPDMEM table indexed by smac_id. The
> > > > + * egress netdev can legally carry a different address
> > > > + * than the GDM port itself: on PON setups the
> > > > + * authentication MAC lives on the pon device while
> > > > + * each service VLAN routes with its own address. Keep
> > > > + * the table entry in sync with the source address this
> > > > + * flow is actually going to use.
> > >
> > > Is the issue occurring just with PON or are you able to trigger the i=
ssue
> > even
> > > in the upstream codebase? I guess you should not post a fix for some =
code
> > that
> > > is not upstream yet. Moreover, in the PON setup, I guess the approach=
 is
> > still
> > > broken if the user change the device mac address.
> > >
> > > > + */
> > > > + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> > > > + airoha_ppe_init_upd_mem(dev,
> > > > + data->eth.h_source);
> > > >   }
> > > >   }
> > > >
> > > > @@ -1529,10 +1542,21 @@
> > > >
> > > >  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8
> > *addr)
> > > >  {
> > > > + static DEFINE_MUTEX(updmem_lock);
> > > > +
> > > >   struct airoha_gdm_port *port =3D dev->port;
> > > >   struct airoha_eth *eth =3D dev->eth;
> > > >   u32 val;
> > > >
> > > > + /*
> > > > + * Routed IPv6 entries resolve the egress source MAC through the
> > > > + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac_addre=
ss
> > > > + * writers hold flow_offload_mutex (QoS paths re-lock via
> > > > + * airoha_set_macaddr()), so this lock also serializes the leaf
> > > > + * against them.
> > > > + */
> > > > + mutex_lock(&updmem_lock);
> > >
> > > This is only required adding the above configuration since in the cur=
rent
> > > codebase airoha_ppe_init_upd_mem() is always running holding RTNL.
> > >
> > > Regards,
> > > Lorenzo
> > >
> > > > +
> > > >   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr=
[5];
> > > >   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
> > > >   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> > > > @@ -1545,6 +1569,8 @@
> > > >       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
> > > >       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
> > > >       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> > > > +
> > > > + mutex_unlock(&updmem_lock);
> > > >  }
> > > >
> > > >  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

