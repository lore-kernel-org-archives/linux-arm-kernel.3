Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33478C61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRn7emcmBc++SvjJm0K2yXoyPRIyox7G9VOUHofmZ2A=; b=K/k8z0fi8KnaSzr7XFb6plZrsF
	siVqaDPsrj3DnnlRe6FjkTYiFLTAU3gvCiqHDbfqoj2eVoNpiBRVnGGi3l4q0Fl2tXCk83Owvp2Ot
	QgOPra3DEkfTFxrgy+i60QEriFc+XsFWIg/W6ech57fYkU0l6Rgf3OKRA0+ivelJfFzTOFw4jOQt8
	SJiYclG8/jwtFZqjGmDmBD0ga0U6tF3/YflqqvTzigSEeiJBe/n2R+x5TK69G5PkYWOpumsVvopkQ
	LRohdFPm+J+oIYx8ZP0532MGyUrYd4jM+N5PIDKP2kLo/sdf4phYkL3GD132N+SkG+no7ImTkyXA1
	B80/6EOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoTz-00000000bzt-1bKk;
	Tue, 25 Aug 2026 10:34:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoTu-00000000bys-0zS4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787654054; x=1819190054;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zrStYGCJI5zg0s0lkCyQJpYcpXw8vJugr3qu2zUu1K8=;
  b=kuRQXm9Dr8NhsLq5KORW+j2LNz8q5ucziqHddSIBwXTrLmHhDlqAS4yS
   EjjrW+XAOei23QtfcsNbe5nYx3IE2q2PAa52FhUu94EuRv4HoDeIJNTue
   Vai3qsqCCWsUC4XYhCsBJaE7QRYGnsTi0KPCo4lgaVu55xrnRjeGCGMg8
   ldTpO/k/Hmy0ch60uEBq/y+gE28PwlJHjFCLsgw8fbR6I2dg1amlfBUPx
   9yl8R+bB9vm3eQLhOEx3DG+oc4D7mVN+t9VwB99MXGvsvSEJiwH8vOc3p
   u9t5CIsLFTHDtePMrIpZaW/ydoE3X3jpC04dzaQfxXU78wWRvJWTdmlu6
   Q==;
X-CSE-ConnectionGUID: +3YBZkRuRtiVFAud92hvQg==
X-CSE-MsgGUID: 7JBZc/kjR/WQTPPfxUaTKA==
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="229744370"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2026 03:34:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 25 Aug 2026 03:34:12 -0700
Received: from DEN-DL-M77643.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 25 Aug 2026 03:34:09 -0700
Message-ID: <cd8c7732d896bafe436204362bf5f20e3fddf3ed.camel@microchip.com>
Subject: Re: [PATCH net-next v2 1/9] net: microchip: vcap: fix rule move for
 rules of coprime size
From: Jens Emil Schulz Ostergaard <jensemil.schulzostergaard@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <daniel.machon@microchip.com>,
	<Steen.Hegelund@microchip.com>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-hardening@vger.kernel.org>
Date: Tue, 25 Aug 2026 12:34:08 +0200
In-Reply-To: <20260817211333.3633182-1-kuba@kernel.org>
References: <20260810-sparx5_l3_routing-v2-1-59e68cc8c8ca@microchip.com>
	 <20260817211333.3633182-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_033414_612884_03F39B82 
X-CRM114-Status: GOOD (  26.45  )
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
> net: microchip: vcap: fix rule move for rules of coprime size
>=20
> This reworks the VCAP rule move logic so that insert and delete compute a
> single uniform address offset, aligned to the LCM of the rule sizes in th=
e
> moved block, instead of per-rule "optimal" offsets. The goal is to keep t=
he
> software rule addresses in sync with what the hardware move command does,
> which becomes necessary once rules of coprime sizes (2 and 3) appear with
> the LPM VCAP.
>=20
> One question about the delete algorithm description in the changelog.
>=20
> > On delete:
> >=20
> > 1. Initialize HW memory at the deleted rule's addresses before
> >    moving, since the moved block may not fully cover them due to
> >    padding.
> > 2. Reclaim any padding between rules in the block.
>=20
> [Severity: Low]
> Is step 2 accurate for the new implementation?  As far as I can tell the
> padding that sits between rules inside the moved block is preserved, not
> reclaimed, because a single offset is applied to every rule in the block:
>=20
> drivers/net/ethernet/microchip/vcap/vcap_api.c:vcap_move_rules_sw() {
>         list_for_each_entry_continue(pos, &admin->rules, list)
>                 pos->addr -=3D move->offset;
> }
>=20
> Since every rule in the block is shifted by the same move->offset, the ga=
ps
> between rules within the block are structurally invariant across the move=
.
>=20
> What appears to be reclaimed is the deleted rule's own space plus the
> padding adjacent to its position, and only down to block_lcm granularity.
> In the delete path unaligned_offset is always negative (block_first->addr=
 +
> block_first->size <=3D ri->addr <=3D base_addr), so the truncating branch=
 is
> taken in vcap_move_from_block():
>=20
> drivers/net/ethernet/microchip/vcap/vcap_api.c:vcap_move_from_block() {
>         unaligned_offset =3D (block_first->addr + block_first->size) - ba=
se_addr;
>         if (unaligned_offset > 0)
>                 move->offset =3D
>                         ((unaligned_offset + (block_lcm - 1)) / block_lcm=
) *
>                         block_lcm;
>         else
>                 move->offset =3D (unaligned_offset / block_lcm) * block_l=
cm;
> }
>=20
> Integer division truncating toward zero leaves up to block_lcm - 1 addres=
ses
> of the gap unreclaimed at the boundary.
>=20
> Could the changelog wording be adjusted to describe what is actually
> reclaimed, for example the deleted rule's addresses plus adjacent padding=
,
> rounded down to the block LCM?
>=20

Yes I will update the commit message, this is poorly worded.

> > diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/n=
et/ethernet/microchip/vcap/vcap_api.c
> > index 788c0728d7636..75c2ca54fddd2 100644
> > --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> > +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
>=20
> [ ... ]
>=20
> > @@ -2106,12 +2108,63 @@ static u32 vcap_set_rule_id(struct vcap_rule_in=
ternal *ri)
> >       return ri->data.id;
> >  }
> >=20
> > +static void vcap_move_from_block(u32 base_addr,
> > +                              struct vcap_rule_internal *block_first,
> > +                              struct vcap_rule_internal *block_last,
> > +                              int block_lcm, struct vcap_rule_move *mo=
ve)
> > +{
> > +     int unaligned_offset;
> > +
> > +     if (!block_first || !block_last)
> > +             return;
> > +
> > +     move->addr =3D block_last->addr;
> > +     move->count =3D block_first->addr + block_first->size - block_las=
t->addr;
> > +     /* Integer division rounds toward zero. We want to round toward +=
inf
> > +      * for the positive case (insertion) to ensure enough room.
> > +      */
> > +     unaligned_offset =3D (block_first->addr + block_first->size) - ba=
se_addr;
> > +     if (unaligned_offset > 0)
> > +             move->offset =3D
> > +                     ((unaligned_offset + (block_lcm - 1)) / block_lcm=
) *
> > +                     block_lcm;
> > +     else
> > +             move->offset =3D (unaligned_offset / block_lcm) * block_l=
cm;
> > +}
> > +
> > +static void vcap_move_rules_sw(struct vcap_admin *admin,
> > +                            struct vcap_rule_internal *pos,
> > +                            struct vcap_rule_move const *move)
> > +{
> > +     if (move->count =3D=3D 0 || move->offset =3D=3D 0)
> > +             return;
> > +
> > +     list_for_each_entry_continue(pos, &admin->rules, list)
> > +             pos->addr -=3D move->offset;
> > +}
>=20
> [ ... ]
> --
> pw-bot: cr


