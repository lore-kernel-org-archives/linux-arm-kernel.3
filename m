Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF535C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FerZ4kTl0rkvw9m185z+fVK0KMmdcN69UcScxyykAI=; b=vknEt1WZrUFk3vSZKrXp+lY9+3
	aaBEQrdeqmyogjY49BOlPqS7rf1uZm2VcRpWgPeJzHdN5Eez2aRRaubrLOJ5VRJ6FtI4XbrW90QEr
	6v9foe0nEMqDFRJs7zPx45oWSRrrwhdwaQd6C1VpbH4t7EYCathTd6irQv+v2/PajULR8Vo+ZhAov
	r+htNBubMAR/qqIRVF9e/q0oQu4V5NZNcEXsyrqmSTcoKsC01578P43jdZTuA/s9TAOXJ9G60x4XA
	my5HuVBUWFjjTTf5yTbFlXu52I5G/Frns6AqKjmuL3OihZ2qOSRiexfbXDgxlTnaHvTbz2wZ/c94W
	CgCzhHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyp1q-00000000f6O-0Kgy;
	Tue, 25 Aug 2026 11:09:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyp1n-00000000f5p-1F0Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787656155; x=1819192155;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Fu0oF9ep7FRe13cBAiIsRbgK4pvnivRbrmEzm7GLz1M=;
  b=gBEzAkJnSYtQQBQefADGxGw0Re3SV0d83XCNHwKPb9pd8J12Q/3P3vQy
   P6EZz4sHx+FdO1GDGiPzHPGmO14ZGtJELX96uUuCUHu6vr0H5VvUJjbiy
   7xSDp3xHQu7Iq9gzmSkJby1vmsxsHaW4WYY/n7kwWW/9zYBNza5wo9HhV
   JuSyj2zNldit9TPzS+aARB7kiH+8gRFUg0b02hL2yA21HFARZncCagqtK
   93cbv9Y0DugV6KCoRpDZpB/FvSabcBMJNjij3QAT4U7cGX8eVpak8ST4P
   uTmB/X7Wv8xTfKsxKHf2RaPr1vw0DVXDZBeKoM1NnyO0TBRBilF0HiZ1J
   A==;
X-CSE-ConnectionGUID: wiPdy7gsTvCs5FTPDln7gQ==
X-CSE-MsgGUID: UNBvfWi2Ssm4Jaqipfg1og==
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="294002896"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2026 04:09:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 25 Aug 2026 04:09:13 -0700
Received: from DEN-DL-M77643.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 25 Aug 2026 04:09:10 -0700
Message-ID: <029bfcd0e1142c43b3992389d2abe6954a8a5108.camel@microchip.com>
Subject: Re: [PATCH net-next v2 4/9] net: microchip: vcap: expose helpers in
 vcap api and update debugfs
From: Jens Emil Schulz Ostergaard <jensemil.schulzostergaard@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <daniel.machon@microchip.com>,
	<Steen.Hegelund@microchip.com>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-hardening@vger.kernel.org>
Date: Tue, 25 Aug 2026 13:09:09 +0200
In-Reply-To: <20260817211355.3633327-1-kuba@kernel.org>
References: <20260810-sparx5_l3_routing-v2-4-59e68cc8c8ca@microchip.com>
	 <20260817211355.3633327-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_040915_683578_2F5FAC89 
X-CRM114-Status: GOOD (  35.63  )
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

On Mon, 2026-08-17 at 14:13 -0700, Jakub Kicinski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>=20
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: microchip: vcap: expose helpers in vcap api and update debugfs
>=20
> This adds two new client API helpers, vcap_val_add_rule() and
> vcap_rule_mod_action_bit(), renames VCAP_CID_PREROUTING to
> VCAP_CID_PREROUTING_L0 and adds VCAP_USER_L3. The debugfs dump learns
> about the IP4_XIP and IP6_XIP key fields, and the action-field printer
> mask expression is changed to a GENMASK() based form.
>=20
> A couple of questions below.
>=20
> > diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/n=
et/ethernet/microchip/vcap/vcap_api.c
> > index 6e1ee15b82b7e..1ad2c44da8bd7 100644
> > --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> > +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> > @@ -2389,6 +2389,19 @@ int vcap_add_rule(struct vcap_rule *rule)
> >  }
> >  EXPORT_SYMBOL_GPL(vcap_add_rule);
> >=20
> > +/* Validate and add rule to a VCAP instance */
> > +int vcap_val_add_rule(struct vcap_rule *rule, u16 l3_proto)
> > +{
> > +     int err;
> > +
> > +     err =3D vcap_val_rule(rule, l3_proto);
> > +     if (err)
> > +             return err;
> > +
> > +     return vcap_add_rule(rule);
> > +}
> > +EXPORT_SYMBOL_GPL(vcap_val_add_rule);
>=20
> [Severity: Medium]
> This isn't a pattern introduced by this patch (every existing caller
> already does vcap_val_rule() followed by vcap_add_rule() without holding
> vctrl->lock across both), but now that it is packaged as an exported
> helper, is the check-then-act window worth documenting or closing?
>=20
> vcap_val_rule() ends with the capacity test and runs entirely without
> vctrl->lock:
>=20
>         /* Finally check if there is room for the rule in the VCAP */
>         return vcap_rule_space(ri->admin, ri->size);
>=20
> vcap_rule_space() reads the shared instance state unlocked:
>=20
>         if (admin->last_used_addr - size < admin->first_valid_addr) {
>                 ...
>                 return -ENOSPC;
>         }
>=20
> vcap_add_rule() then takes the mutex and the append branch of
> vcap_insert_rule() consumes address space without re-testing against
> admin->first_valid_addr:
>=20
>         ri->addr =3D vcap_next_rule_addr(admin->last_used_addr, ri);
>         admin->last_used_addr =3D ri->addr;
>=20
> If two adds to the same VCAP instance interleave between validation and
> insertion on a nearly full instance, can both pass the stale space check
> and the second one push last_used_addr below first_valid_addr, so the
> rule is encoded into addresses owned by another VCAP block instead of
> returning -ENOSPC?
>=20
> For the users present at this commit I could not construct such an
> interleaving: the L3/LPM adders added later in the series all run from an
> ordered workqueue under sparx5->router->lock, and the TC and matchall
> paths are serialized by rtnl. The one case I could not rule out is a tc
> filter installed directly into the LPM chain range concurrently with a FI=
B
> work item, since sparx5_tc_flower_replace() resolves the target instance
> purely from the user-supplied chain index:
>=20
>         vrule =3D vcap_alloc_rule(vctrl, ndev, fco->common.chain_index, V=
CAP_USER_TC,
>                                 fco->common.prio, 0);
>=20
> Is such a tc configuration rejected somewhere? If not, would holding
> vctrl->lock across validate plus insert, or re-checking vcap_rule_space()
> in the append branch of vcap_insert_rule(), be preferable?
>=20

Thanks, this is a good catch. That tc configuration is rejected today, but
more as an mergent side effect what has nothing to do with LPM. It is
however possible to add either goto's targeting the LPM chain, or the
matchall vcap enable rules. These will not write rule data, but the intenti=
on
is that the LPM vcap is system only.

I will add explicit checks rejecting the use of the LPM vcap from tc. I wil=
l
also add re-checking vcap_rule_space() in the append branch of vcap_insert_=
rule(),
even if no caller can reach it. I will add that in patch 1, which already a=
dds
the symmetric test to the insert-in-middle branch.

> [ ... ]
>=20
> > diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/d=
rivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> > index e0c65c7ab23e1..36150822ce153 100644
> > --- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> > +++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> > @@ -133,7 +135,12 @@ vcap_debugfs_show_rule_actionfield(struct vcap_con=
trol *vctrl,
> >               out->prf(out->dst, "%d", value[0]);
> >               break;
> >       case VCAP_FIELD_U32:
> > -             fmsk =3D (1 << actionfield[action].width) - 1;
> > +             if (action =3D=3D VCAP_AF_MAC_LSB || action =3D=3D VCAP_A=
F_MAC_MSB) {
> > +                     hex =3D true;
> > +                     break;
> > +             }
> > +             fmsk =3D actionfield[action].width ?
> > +                    GENMASK(actionfield[action].width - 1, 0) : 0;
> >               val =3D *(u32 *)value;
> >               out->prf(out->dst, "%u", val & fmsk);
> >               break;
>=20
> [Severity: Low]
> This isn't a bug introduced by this patch, but should the sibling
> key-field printer get the same treatment? vcap_debugfs_show_rule_keyfield=
()
> in the same file still evaluates the shift first and only repairs the
> value afterwards:
>=20
>         } else {
>                 u32 fmsk =3D (1 << keyfield[key].width) - 1;
>=20
>                 if (keyfield[key].width =3D=3D 32)
>                         fmsk =3D ~0;
>                 out->prf(out->dst, "%u/%u", data->u32.value & fmsk,
>                          data->u32.mask & fmsk);
>         }
>=20
> The printed value is correct because of the width =3D=3D 32 fixup, but th=
e
> 1 << 32 on a signed int has already been evaluated at that point, which
> looks like the same undefined shift the commit message describes fixing
> in the action-field printer.
>=20
> This branch is reachable today: VCAP_KF_IP_PAYLOAD_5TUPLE is
> VCAP_FIELD_U32 with width 32 in is0_normal_5tuple_ip4_keyfield for
> sparx5 and lan969x, and in the lan966x is1 keyset, and VCAP_KF_RT_FRMID
> is another W32 U32 key in lan966x is1. None of them are in the %pI4h or
> hex special cases, so dumping a rule carrying one of those keys via the
> VCAP debugfs rule dump would hit the shift with a width of 32. Would
> converting this site to the same GENMASK() form make sense while the
> area is being touched?
>=20
> Reported by an automated review pipeline; both items are pre-existing and
> neither is claimed by the commit message, so they may well be better as
> separate cleanups.


Yes, I will fix this case and also add the new VCAP_KF_IP4_{DIP,SIP} under =
the
pI4h case, same as IP4_XIP.


