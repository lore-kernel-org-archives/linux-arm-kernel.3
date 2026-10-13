Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C751CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wlr2A3cvjlO6YixnK/Zszy5kz/8yYj7BS2Y4o19mdj0=; b=sjW9wZzq2kxIW3yAxqH2MolNR1
	pW8xbYYRlg4+efO0qJEqWcWCnlP1085r6cMV/hAgYOpOryLLdM1ZgLXuF4qswvFzc2TKciwOtgSXZ
	uLGs1MZxU0/z6pBUGigzp/0iL5wsQD7Tlza+Kv//xRx5sf/d/f3laedNfc9hyaUHB3fkgCWiasHPX
	sPBRkdwWmP97WZV/MPkSawSCb+x7XiZkFMaZKwgUieKTM0/tM3bmFVo8OxEgJ7DnhufIHS/sMS8zl
	z5yHZvxz00YcbHiWKARunNdFKf6Ibzpo15Z7JM0mOkbe6YZurhzzxsTpQg2n/HAEml6jFRPUISZTm
	EEYadsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeQt-0000000DLL1-2LFt;
	Tue, 13 Oct 2026 15:28:51 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeQr-0000000DLKc-1Ofh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:28:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so2644042e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791905327; cv=none;
        d=google.com; s=arc-20260327;
        b=PSaeNGhD7yMlnnTWHKuBwBM4Na5igKaIs28oi/Eh/r+V9pgdzqlsxMC34GMBuErCOq
         01l9MLBb2Yv0gBHf8tX10bI5t8YAvfIUH7rls4wO8HaeUUr8eCFd9NrxyhkUSNA722lb
         1VGJ8IkFlrUlgbCtBXcqeccTqrq7IKPRGZUHwzwei0hKINO9duV8t1j4TapVthqzkT8y
         qaJ9CgMefxSohbrlmKpl0QhC9Iakomc5TR0TvgQfpyzSQunmBDBbsaystHRZCBzCSpoZ
         2uNazPvOdG64C6gF49xiBW6aSVDcfmCvgkyQ78+q4Zozjm6XSuhwLEfSeanwR6OsXwMB
         wDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wlr2A3cvjlO6YixnK/Zszy5kz/8yYj7BS2Y4o19mdj0=;
        fh=8vNO1dkkRYv2WCqrndXkrgBOYNK44ZQ6URpdFRIB6Ck=;
        b=UkfnAqbXkA/gV1i0N2tZl8o17NVhpmqmRC8qJ3OqMvFvI2ILrWyKlQiK/FZaf1oz1j
         KnIVhFXQXpx8XCEA9+k+v+kD/VdXg1cLAh0Im5elVMC7EtTC+Jy5+JI0h/PvSDN1vkRJ
         evCd9m7ogjSocbPcglfREnpM7wTtk7ttPGkalDLGquipstPQULcCMXQb55OR4FDBuwv2
         7EEOOacl/74bm0LqP5o5dQJGNqcwhfxJwP/3gjQXGNpe4FFzB/6UbhbfLeoc7x6PdHfS
         PJKEJ9/2wn9ATFjyohAAx+KDhwSKE78L3OlFNBXB1fGNezi47SFVEzXcKlhuwFFv0lLh
         oCCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791905327; x=1792510127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wlr2A3cvjlO6YixnK/Zszy5kz/8yYj7BS2Y4o19mdj0=;
        b=SOMqfbYCxcl1cTc05H+ggW7B32oSR2C3AkfjukAfF0PJLR2EmoM36h7RcyQbY4s8Xn
         v3ckFbMbVx77yjD1srwN4A7zSHiBZq1vHrXzxv7PoR2/rK8rsbcPozRWgC8GpKA3pzud
         0EzwS8BKXO26KzW4fYTtVEq/kSnxO08i0i4187+yCmqFytieWHUlSaqVwUSFvqNIBfIQ
         RJAUM57xcVvo9CmCNPAOABrR+VAOuWwiR0X5rLFLAv98oIL2SKDVQlDKAyQ7z7Fw9ryq
         9AF7YPPyyrmfkJOySOkTx+4Cegk+DbKV+Za2nCtY9oo87sj3BKeyjtlBotRb/ElN8i2L
         cPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905327; x=1792510127;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wlr2A3cvjlO6YixnK/Zszy5kz/8yYj7BS2Y4o19mdj0=;
        b=g2WagfmkmMvH4sWYOdovbe1Q0GGEq8+1ZTkE2yw6XnyqKepKeliR6pGmtmcZN9ePGU
         UPd/W8jTIPDdZLjpyc3gEHlclLQjSczwQNJKcus8XzSBnZtq/yYFUeyoXlYCy18LzXYz
         vf0nh7Q2XHXmI5+R2K+VToM+CdkpkJi9loLfDoeddtv2HJApKeVbRsANcL/FLk5H4QdJ
         sM//spv4bfOkGQV17byvTK25fseMtVbLGrejWbjsPnoAp7oT9NvzaI0qxTsWtIgEnJoD
         W6OElQgFc9rl1Ur/oft79mLwH7w8F2nsMoBCeOW672kIWJRNt62UrT2bumYzkDGOGzde
         X0/Q==
X-Gm-Message-State: AFq9FYKNv1kEfmw2nW4rT/3krmbxGT3jQOqaNUB1v3qlL2hRfTbqvbAM
	AJB2+jZR4PijpvSsiqe8HJ6k3sk6XZo9s9S3NgwzxOYA9axm84LaKOxv0zihJunBRD/Ux/vUMEd
	DinKX46/eFFm09SOsRVZ/DbUOgsgMGszkuWww018=
X-Gm-Gg: AYBFou2Os/2cZSB/+CkNCpuJ8l488TKbmAgNrGgC5FEQWdJ45W+j62t59ogup6ZRY7P
	LnHPYpFdX4jySwbC1Gg5nUXro3Qh3Gr/9IIvDyDaM6Y5yJ2jyRcy3pal4sfyGhFGj8TG1HKm1tM
	yn9zwo1yrjR8t36o+WCMEBHRjw2sgATNS8531DJnjkXQyXF6SttCR25Bh97wvk4jbBSQYG5/RgO
	scXFaFK6iyWCiZH5k1a6orguBOTZONXrMyni2e0Z7ILP8e7h6pZrLmhTDI4msDiugTexYhLeIBh
	jyiQl2qR4dgXnMLFb5RMf6C32fbyPgSSaLNIATD3feQEOURIUq4TlL4=
X-Received: by 2002:a05:6512:4503:b0:5bc:e661:d673 with SMTP id
 2adb3069b0e04-5bce661d7d2mr3718391e87.56.1791905326942; Tue, 13 Oct 2026
 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
 <as0DO7n5SCr2j3Z2@lore-desk> <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
 <as3faB96PFSnC-qP@lore-desk>
In-Reply-To: <as3faB96PFSnC-qP@lore-desk>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Tue, 13 Oct 2026 23:28:34 +0800
X-Gm-Features: AclHuK_tjh-WukXfY9rE_KIeJrl_BDZkT8IspZAQQb-7Ol5sh7tOVOy6Bh1FWo4
Message-ID: <CAPZ+gd8NQC6bwC9qAkN2779yU1QxXQE44ORs+2FKTStz3_C9Xg@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082849_413064_59310544 
X-CRM114-Status: GOOD (  30.17  )
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

The issue is reproducible in the upstream codebase, without any of the
out-of-tree PON code -- the PON setup is just where I first hit it.

Reproduction with mainline code only (airoha eth + the mt7530 MMIO DSA
driver; the "airoha,en7581-switch" binding and driver are mainline,
the DT node just needs to be added to a board file):

- AN7581 board, switch node with its CPU port on GDM1. Use a DSA user
  port as a routed WAN interface with its own MAC address.

airoha_get_dsa_port() replaces the egress netdev with the conduit, so
routed IPv6 FOE entries carry smac_id =3D conduit port id, and the PPE
resolves the egress source MAC through UPDMEM[conduit]. That slot is
only programmed by airoha_set_macaddr(), which never runs when a DSA
slave address changes, so offloaded IPv6 frames leave the port with
the conduit's MAC instead of the user port's. IPv4 is unaffected,
since HNAPT entries store the MACs inline. The same shape appears on a
GDM port with two "airoha,eth-port" children carrying different MAC
LSBs, which the recent multi-SerDES series allows by design
(REG_FE_MAC_LMIN/LMAX); for that variant the exposure starts with the
series introducing multiple net_devices per GDM port.

The posted patch only reprograms the shared per-port slot at offload
time, so a later address change on any netdev of that port re-breaks
offloaded IPv6 flows. It is a temporary patch for this setup; the
final solution is up to the maintainers.

A proper fix would probably give each netdev its own UPDMEM entry: the
table is indexed by a 4-bit address (16 entries) while the FOE
smac_id field is 5-bit with 0xf reserved for "keep original MAC", so
there is room beyond the port ids. Slots could be programmed from
airoha_set_macaddr() (always under RTNL, as you noted) plus a
netdevice notifier for DSA slaves, and foe_entry_prepare() would only
reference the slot -- removing both the race and the extra locking the
current approach needs.

Lorenzo Bianconi <lorenzo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=8C 15:36=E5=86=99=E9=81=93=EF=BC=9A
>
> > Ooo,  the new patch should be a dedicated leaf lock inside
> > airoha_ppe_init_upd_mem().
> > --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> > +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> > @@ -416,6 +416,19 @@
> >    dsa_port);
> >
> >   smac_id =3D port->id;
> > + /*
> > + * Routed IPv6 entries resolve the egress source MAC
> > + * through the UPDMEM table indexed by smac_id. The
> > + * egress netdev can legally carry a different address
> > + * than the GDM port itself: on PON setups the
> > + * authentication MAC lives on the pon device while
> > + * each service VLAN routes with its own address. Keep
> > + * the table entry in sync with the source address this
> > + * flow is actually going to use.
>
> Is the issue occurring just with PON or are you able to trigger the issue=
 even
> in the upstream codebase? I guess you should not post a fix for some code=
 that
> is not upstream yet. Moreover, in the PON setup, I guess the approach is =
still
> broken if the user change the device mac address.
>
> > + */
> > + if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T)
> > + airoha_ppe_init_upd_mem(dev,
> > + data->eth.h_source);
> >   }
> >   }
> >
> > @@ -1529,10 +1542,21 @@
> >
> >  void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *add=
r)
> >  {
> > + static DEFINE_MUTEX(updmem_lock);
> > +
> >   struct airoha_gdm_port *port =3D dev->port;
> >   struct airoha_eth *eth =3D dev->eth;
> >   u32 val;
> >
> > + /*
> > + * Routed IPv6 entries resolve the egress source MAC through the
> > + * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac_address
> > + * writers hold flow_offload_mutex (QoS paths re-lock via
> > + * airoha_set_macaddr()), so this lock also serializes the leaf
> > + * against them.
> > + */
> > + mutex_lock(&updmem_lock);
>
> This is only required adding the above configuration since in the current
> codebase airoha_ppe_init_upd_mem() is always running holding RTNL.
>
> Regards,
> Lorenzo
>
> > +
> >   val =3D (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];
> >   airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
> >   airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
> > @@ -1545,6 +1569,8 @@
> >       FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
> >       FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
> >       PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
> > +
> > + mutex_unlock(&updmem_lock);
> >  }
> >
> >  struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

