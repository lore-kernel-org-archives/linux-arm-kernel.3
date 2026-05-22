Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3968CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWG7WKyXYTzmaM1yK/qrR4UtsM0VTLgevWp10mHm/eY=; b=T1GV8P6Ys3y8DZJuar2QLjALR0
	Oetmpi4AhuI6RleSnwODPv0WP1QFvCWo0idbx+gKVQjYn7yQNAzvpFE6Kkrr+cz+/3uTnpt0Q565B
	TfWuXauQZa5OPKOqgP1aZiXiveIdQcn2GxVF+vJvCmVgZbORIzZHK99gxhrq6cRH0wuQBluZqxINj
	c5bO14Z4VPZS0jEyiFaNU7Zvwc3fn8+Xnt4tAvxIys7V18rR6fuEovCcAGrThjoFJLiycwAmstlkA
	BgU+dQuQ4J1sGc8pU51kRDeRbtg7v7pXvqyrhdnoHR9q5OJ6/wO/M5fPhqFM9qHbfNKt8xkUKT92f
	HzX9ToVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL75-0000000ABIg-39S5;
	Fri, 22 May 2026 08:20:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQL73-0000000ABHT-2bYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:20:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wQL71-0002DV-9m; Fri, 22 May 2026 10:20:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wQL6z-001EoG-2l;
	Fri, 22 May 2026 10:20:06 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wQL70-000000006RI-1SZQ;
	Fri, 22 May 2026 10:20:06 +0200
Message-ID: <74844de05ed99d29424ba71e3c625020afdddf61.camel@pengutronix.de>
Subject: Re: [PATCH] ARM: rockchip: keep reset control around
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,  Steven Price <steven.price@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:20:06 +0200
In-Reply-To: <7845032.1B3tZ46Xf9@phil>
References: <20260521210915.2331176-1-heiko@sntech.de>
	 <7845032.1B3tZ46Xf9@phil>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_012009_659366_FAA4A8E9 
X-CRM114-Status: GOOD (  20.71  )
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

On Fr, 2026-05-22 at 09:20 +0200, Heiko Stuebner wrote:
> Am Donnerstag, 21. Mai 2026, 23:09:15 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Heiko Stuebner:
> > Do not put the reset control, retain exclusive control over it.
> > After turning on a CPU, the corresponding reset line must stay
> > deasserted.
> >=20
> > This also avoids calling reset_control_put() before workqueues
> > are operational.
> >=20
> > Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumers"=
)
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Tested-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/=
platsmp.c
> > index f432d22bfed8..f659d894bfae 100644
> > --- a/arch/arm/mach-rockchip/platsmp.c
> > +++ b/arch/arm/mach-rockchip/platsmp.c
> > @@ -34,6 +34,7 @@ static int ncores;
> > =20
> >  static struct regmap *pmu;
> >  static int has_pmu =3D true;
> > +static struct reset_control *cpu_rstc[4];
>=20
> After sleeping on that, this should be cpu_rstc[5];
>=20
> Coretx-A9 SoCs need to enable the SCU power-domain which thankfully
> sits at index 4 of the power-domain register.
>=20
> So while we (already) expect no reset control for that, we need at least
> make sure, it's not reading into undefined memory

The access in pmu_set_power_domain() is gated by
(pd < ARRAY_SIZE(cpu_rstc)). And ncores in rockchip_smp_prepare_cpus()
can not be larger than 4.

> and thus need that empty field in the array.

We could drop the ARRAY_SIZE check and add a placeholder to the array,
but it would need to be set to ERR_PTR(-EINVAL). Otherwise we'd have to
replace all the IS_ERR(rstc) checks as well. I think that would be a
good follow-up change.

regards
Philipp

