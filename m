Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD251C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=; b=vKMQDu1tjxpFNkEiFiLUrcP3al
	CPwLFNyQpS/ZZ96TjA2LrfMi5eG4VLpbYTwMD+U3I97DEzBvdrHdgO+lksLbLXCwpMMBvIVXzMmt1
	+NplT0uUfeHPu13NvWq7k0k3TmvlGSJmeZmkv32G/tklaOE/a4f3IQ8G4BFDDtgFw3aFgyHNQ4Abz
	vASm/qpQv+HepzOMCUPY7N/ev/6qY5uFrx4vpCHXKv5MxCsgideV2tvrbsYudQDnHgIQJqirRG/3r
	OIFCXye6VmB44t1cJCkm7kzz9IpnxUyIKsgWnjUwgTf8HKAtPtVdH7NkiqO36gq65evwuV5iLyM9g
	yk64kPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUh9-0000000Bbdt-3QdY;
	Wed, 22 Jul 2026 11:00:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUh7-0000000Bbcy-31sR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:00:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso10628377a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784718056; cv=none;
        d=google.com; s=arc-20260327;
        b=RZKFrPB7t/sZez8wkpsy8aKY3fIDDRQu8mMTsEOKPCIH/SYN8GqScGOdyYg+bMm+rW
         t1tzBwFlprWEv9W8SBVsEECLfwxbDzTquWqSWljnSWm8FEdgD//KJxR0o5GLvQnASIQR
         VcO7NKKxdfgywxOjnWeX65dvsowWkP2COGdr12w2WE1K5SPepXmHkwJnbQUKGCvFIJQf
         u7XEmjg+14ytnSq004AnU8u2Zpx6KIxtEIFTleXEVOMhteivvlllMa2X5h/n0rl6h176
         g9Ash6LPH/DVeDtkU+I5eFHqZ2/iQANH5zv/w5y/w4g2hYpi/vdb/4iRV+9EAme0vVSJ
         9cUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        fh=vvXFnkXsQx+8oVpS4zNDBS3dKpV8IKbKwvk9GiN6sLg=;
        b=QnQ+9YrCwkKnNrXoKaQuhhf3jho9+xkuusKK1oE+lvkzlj7RU06SuXspu6dtnrjKCz
         vM7rX1Qj4reaLan0tQBBY0ak8j5g//XScmOcwzUt8Z8ibZ/nJINItowJP2e7i8vv9mhP
         1njCwlrWf3usT9dXQTMRg1mzVVUAA0Kqv/yfiD9ySiwzBYgpOP37DQ3yJ8OlB1XmyNIc
         uAWqhxJecfohEVWyPAOPqVkT84+tmQvRS6myknghSD3l/hRI82Wp0SAxi9d1pbWRJtsg
         zaUGuZTJRVymLxHUUnK4b6sf0DvzL2038+Sw/SX2ht7x2iQ26azHozlS7fEU98a/CmLp
         OKVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784718056; x=1785322856; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        b=duWKMWnyYDVOiiBS0rlQpdJZG99N2JbMpT2NX/xF793gCo6R5K4wQz9D0HNDbiFb+c
         X+zT73DjhxAoYj3j0fOlHs6Sc+iyHJ/JctTcm+AYWoR72yJw7+6BrZDXaGqEU8UgMlYz
         yie70E460VcdaEgeEnGJs8jdaINnpONMZ8bZQlHUpsi75FAakaKQoRpVPW4nCw9E3HUi
         15mAK6z5N6x0IJ9imGl4UI976n8bvtid1wkk8prsRqTP/8Nu9ZmT2gl61TehvAJyD3Gp
         2pbCg1efLbPp9ND0v8HPwBn/VcMBEmA3+MeYGMRfwD658FsuZUXhLNXsd76AsyIMucvJ
         bTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718056; x=1785322856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G13lg/cI4thK6GDLPzorkSPV/OdLT4ME4RNPWxywtbY=;
        b=tX/OOCpEZ6Ohj036GJ61CJIo9YVJnNkuPyjbJWn0gSvCeAzGmlw3Ftsl860iLPY51L
         9bV3dm5WBWdIu1+9OF7JIv09QgIdzv+T1jp6YoZkBkEqQ7U3GC7vIQRD5eyvlCWJPyeC
         ucH0mrtUFskb/SV9KdehCGnzInihihQbWPsljbXr/TIiuG17JLjN0u/G+MDHuJ8Hw0r3
         KQziG7X6hkoHkRGb82EG+xYWru6ecry5PunKbf51VJH2dsfV8t0vScu+pVFtRw/17q53
         /IhaOazB23AnQcdX9JyoBWIB+xW63c5TPMPjKCXHcWAXuYPC+l8FwE1i1Nbd2Hf/sezC
         8jFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/j+k0KFs9lD08aXWjBhlChvHOUV1/Kaj5pb0XpNNYAR0ui94ws+lAs1a4em9og02FkYR8tP89vLppKz/a0Uay@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ad6kNAEF2cNx2qu8v6ayxRGhEEub1sGn9kgbWonb+oSHr/Fs
	ZouXocXBP97kTJZnHdAr1ckYr4RhOjHvDN26eeYOFpxklf+Si2KIEo/rflOoZy6uKzNwqWYNtzr
	EVfG7bLFsXOZhD+vY777wWYN/oTqDSyMFEl4ekgYze20ze+FPD/6wOzUluFBq
X-Gm-Gg: AR+sD139IMyzvIJN7FCLdXTEvpgbyHrJvp/QU6uDUuSe1i473c1wu89GypwzXA+CLXY
	uwLnUW6jLYbzNncF9LcjMthOedD3qmIA9C+MzFm3JJlbmdhk6RTC0SHgAY27BrHFJWBOXzmuEBo
	4eAyx8hHvT8NSDgatgS7h3xQP4Z5qlEmhT531b8RuIabT7cYFpdqbRYxZLckU2HbpFkddSNRCR+
	hdx1w4D0WZnt9JWI8YwOY3OurJmyuYXrtjb/+M4G9t7dfsj0Mn2tDyL31cNhWTVgkLExrOeIah6
	mLZWfUU07NV2Qdu6fw==
X-Received: by 2002:a17:907:1c06:b0:c11:efec:6ca9 with SMTP id
 a640c23a62f3a-c16b4699a22mr1050333866b.8.1784718055604; Wed, 22 Jul 2026
 04:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net> <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
In-Reply-To: <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 15:00:47 +0400
X-Gm-Features: AUfX_mzRWfigiVNLTvEoa0ag8xHY_819uFONXMG9otmafQymn25GMsMrwN75lQY
Message-ID: <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Wyon Bi <bivvy.bi@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, 
	YouMin Chen <cym@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_040057_827060_32970F94 
X-CRM114-Status: GOOD (  47.66  )
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

Hi Quentin,

On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alexey,
>
> On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > When the PLL rates table was first committed for RK3588 (and later reus=
ed
> > for RK3576), the fractional PLL coefficient was defined as an unsigned
> > value, while the TRM clearly states that it is a two's complement 16-bi=
t
> > value.
> >
> > Rockchip's downstream kernel later revised the fractional PLL code [1] =
to
> > account for the two's complement nature of the coefficient, but that
> > change wasn't upstreamed.
> >
> > Change the PLL table definition to use two's complement for the
> > fractional coefficient and update its users accordingly.
> >
> > Note that a negative fractional coefficient is meant to be subtracted f=
rom
> > the next larger integer multiplier, so the _m values in the table are
> > also adjusted accordingly for the two negative-k entries.
> >
> > While at it, fix the denominator of the fractional PLL calculation to u=
se
> > 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
> > 2.13.1.4 Setting Guide on P, M, S, and K):
> >
> > Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> >
> > Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05d=
cc3a51e85ae531749e6270bf9b9212d [1]
> > Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK358=
8")
> > Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK357=
6")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> > Not adding Cc stable, because while this fixes a real bug it's not a
> > regression, as the issue was introduced in the same commit that added t=
he
> > RK3576/RK3588 support.
> >
>
> I don't think this is a valid reason :)

I believe Linus frowns upon changes like "it never worked, but we've
fixed it now" being submitted as fixes. It's been broken for years,
and since nobody complained yet, going via the normal development path
(i.e. -next) seems perfectly fine to me.

> In any case, this patch is doing too many things at once. I see the
> following things that would warrant individual patches:
>
> 1) fix the wrong denominator, stable candidate IMO,

I could split this one out, but since it's a trivial one-liner, I'd
like to hear what Heiko prefers.

> 2) fix the table (using unsigned int still), to match what Rockchip did
> in their downstream fork (maybe check they did maths properly first :) )
> stable candidate IMO, except if they are related to 1) in which case
> squash with 1),

Not related to 1), but directly related to 3). The old table was
calculated using a flawed logic as if the k is unsigned and purely
additive (and thus k > 32767 stayed at the lower value of m), while in
reality the hardware subtracts negative k from m (thus k < 0 should
come with m++).

This is confirmed by manual recalculation of effective PLL rates under
both approaches:
- If k is treated as unsigned and purely additive (valid logic, but
doesn't match the hardware) the effective rate lands within 40 Hz of
the target for the affected table entries
- If k is treated as signed and subtracted from the next higher m
(similarly valid logic, matches what the TRM says and also what the
updated vendor kernel does) the effective rate lands within 40 Hz of
the target for the updated table entries
- If the parameters are mixed and matched, there is a 2 MHz delta
(five orders of magnitude difference)

So I don't believe that splitting the table updates across commits is helpf=
ul.

> 3) switch to signed integers wherever applicable, not stable candidate
> IMO (but eventually may be backported to facilitate backports of future
> fixes),

See above.

> > Note that there is a separate unrelated issue with the rate table, name=
ly
> > the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
> > which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> > entries in the table end up with Fvco < 3 GHz, which according to the
> > TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
> > To be revisited separately.
> > ---
> >   drivers/clk/rockchip/clk-pll.c    | 8 ++++----
> >   drivers/clk/rockchip/clk-rk3576.c | 4 ++--
> >   drivers/clk/rockchip/clk-rk3588.c | 4 ++--
> >   drivers/clk/rockchip/clk.h        | 8 ++++----
> >   4 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
> > index 6b853800cb6b..f445b01aabd0 100644
> > --- a/drivers/clk/rockchip/clk-pll.c
> > +++ b/drivers/clk/rockchip/clk-pll.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/delay.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/iopoll.h>
> > +#include <linux/math64.h>
> >   #include <linux/regmap.h>
> >   #include <linux/clk.h>
> >   #include "clk.h"
> > @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_r=
ate(struct clk_hw *hw, unsigned
> >
> >       if (cur.k) {
> >               /* fractional mode */
> > -             u64 frac_rate64 =3D prate * cur.k;
> > +             s64 frac_rate64 =3D (s64)prate * cur.k;
> >
> > -             postdiv =3D cur.p * 65535;
> > -             do_div(frac_rate64, postdiv);
> > -             rate64 +=3D frac_rate64;
> > +             postdiv =3D cur.p * 65536;
> > +             rate64 +=3D div_s64(frac_rate64, postdiv);
> >       }
> >       rate64 =3D rate64 >> cur.s;
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/c=
lk-rk3576.c
> > index 2557358e0b9d..63f229e73a45 100644
> > --- a/drivers/clk/rockchip/clk-rk3576.c
> > +++ b/drivers/clk/rockchip/clk-rk3576.c
> > @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_ra=
tes[] =3D {
> >       RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >       RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >       RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> > -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> > +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >       RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >       RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >       RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >       RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >       RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> > -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> > +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >       RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >       RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >       RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>
> For some reason Rockchip didn't fix this for RK3576 in their vendor
> kernel, so it's still using the value from RK3588 from before the commit
> you pointed at.

Looks like an oversight on their end.

> > diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/c=
lk-rk3588.c
> > index 75d42fea2a11..24baa0ef9bf3 100644
> > --- a/drivers/clk/rockchip/clk-rk3588.c
> > +++ b/drivers/clk/rockchip/clk-rk3588.c
> > @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_ra=
tes[] =3D {
> >       RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >       RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >       RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> > -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> > +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >       RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >       RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >       RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
> >       RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >       RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >       RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> > -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> > +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
>
> Are you sure this is proper? Rockchip changed 51117 to 51119 (so -14419
> to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you
> linked.

This change of theirs is not explained in the commit and is not
related to the code changes they are introducing, so I'm reluctant to
blindly copy it. I also suspect that reducing the magnitude of the
negative k will result in overshooting the requested rate (but haven't
checked).

-15730 results in a -41.504 Hz delta vs. requested
-14419 results in a -32.959 Hz delta vs. requested

So yes, this is proper.

> >       RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >       RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >       RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
>
> In the commit you provided, they also change this line (though they
> don't change k, so unsure why (if) that is related). Wondering if this
> isn't related to the denominator fix they also have done in the same comm=
it?

It's unrelated and unexplained, so I decided not to change it until a
valid rationale is discovered. Their kernel never used 65535 in the
denominator, FWIW.

Best regards,
Alexey

