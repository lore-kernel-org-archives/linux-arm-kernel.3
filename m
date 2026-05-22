Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30817CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gotifz0xhZuJ54eoZRFKuXrlKTTQrnNqUx9KJdbsj+o=; b=cBW17FLvB+zpemPXe3LPl6b+gF
	t+Gh/dWFgDPXxBpGuagVw0GqPUwGeWf9igkXg72qRXSq16BlhTFIGAS2aHiGzhBEfW7AL1NR0zWOd
	8/hu81OSmMPh/Wxp9P0vsUN50zjiv/IyhC6j83+gdK7Qq2tghlK1Lu/OiRRnIT6b7dGeMfPHXCAGt
	H+ci1naToP+/OmvFzxk7k5KT/eF8ODOpj5vzZ/zvq7+98e5w/5C2qZMixUrxWQEy3+V/ST481eKvi
	SB/DmCh9xl8/Qfy8RyMyk4qbZVOcvIhkeHQotXNdiEeQHU7n57Wkryf4CksM+bDBe4XGUBgK8F6RM
	pxHuZ2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLTP-0000000ADqc-3S5a;
	Fri, 22 May 2026 08:43:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLTN-0000000ADpm-2Gff;
	Fri, 22 May 2026 08:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Gotifz0xhZuJ54eoZRFKuXrlKTTQrnNqUx9KJdbsj+o=; b=dh8JJPWgyuzJYiQNgKow0kB4t/
	j2vVPeJ040BzACNCJQ1Zi0eWE8FNqz/vPBkQ9GqZTD+lFd2tEVqViqNz2NLHGqJ3+idC5xNDxsu7o
	F5YKWgmh+bE2G1d8JoZM+14voH0RZ2v06kb393p6NzokjRLNtglCPZxSxbxURMR8d77/VUQt3zIHn
	+p2eSbmmhxwN1WtlmglJvzwbwR1Iqb5QjNo/af8x29muOGCGI8zLgcaYtmZ4y2xhXV47RlXoqT5DD
	k0RBpJhV0Fm3Kr7qAdgq/THYoL4S8RmWYNwsdpmFTUkzy35uP/OPIcClUT97zHU10+9roTy04hpEk
	Mz3I8cxQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Steven Price <steven.price@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: rockchip: keep reset control around
Date: Fri, 22 May 2026 10:43:09 +0200
Message-ID: <4223462.bcXerOTE6V@phil>
In-Reply-To: <74844de05ed99d29424ba71e3c625020afdddf61.camel@pengutronix.de>
References: <20260521210915.2331176-1-heiko@sntech.de> <7845032.1B3tZ46Xf9@phil>
 <74844de05ed99d29424ba71e3c625020afdddf61.camel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_014313_642652_8F9D698D 
X-CRM114-Status: GOOD (  26.88  )
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

Am Freitag, 22. Mai 2026, 10:20:06 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Philipp Zabel:
> On Fr, 2026-05-22 at 09:20 +0200, Heiko Stuebner wrote:
> > Am Donnerstag, 21. Mai 2026, 23:09:15 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Heiko Stuebner:
> > > Do not put the reset control, retain exclusive control over it.
> > > After turning on a CPU, the corresponding reset line must stay
> > > deasserted.
> > >=20
> > > This also avoids calling reset_control_put() before workqueues
> > > are operational.
> > >=20
> > > Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumer=
s")
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Tested-by: Steven Price <steven.price@arm.com>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
> > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchi=
p/platsmp.c
> > > index f432d22bfed8..f659d894bfae 100644
> > > --- a/arch/arm/mach-rockchip/platsmp.c
> > > +++ b/arch/arm/mach-rockchip/platsmp.c
> > > @@ -34,6 +34,7 @@ static int ncores;
> > > =20
> > >  static struct regmap *pmu;
> > >  static int has_pmu =3D true;
> > > +static struct reset_control *cpu_rstc[4];
> >=20
> > After sleeping on that, this should be cpu_rstc[5];
> >=20
> > Coretx-A9 SoCs need to enable the SCU power-domain which thankfully
> > sits at index 4 of the power-domain register.
> >=20
> > So while we (already) expect no reset control for that, we need at least
> > make sure, it's not reading into undefined memory
>=20
> The access in pmu_set_power_domain() is gated by
> (pd < ARRAY_SIZE(cpu_rstc)). And ncores in rockchip_smp_prepare_cpus()
> can not be larger than 4.

argh ... you're right of course. So the patch can stay as it is.
Should not think about code before going to sleep ;-)


Heiko

> > and thus need that empty field in the array.
>=20
> We could drop the ARRAY_SIZE check and add a placeholder to the array,
> but it would need to be set to ERR_PTR(-EINVAL). Otherwise we'd have to
> replace all the IS_ERR(rstc) checks as well. I think that would be a
> good follow-up change.
>=20
> regards
> Philipp
>=20





