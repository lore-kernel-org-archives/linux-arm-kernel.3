Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78020C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=; b=maDWIGyxy/K0ChRn8hOvk7gWxJ
	Xoj63j83pbeeGkHTS1DJNYcg2yBsA5KLQc0eSQ87sJbSkLQDsTqkZDyHzd9vZrET3hq0N4QueC3xU
	1f+EBM/YKlSX8wgOqNSkcnvAlX5emRD54D/5nlVOP0aEgxtsd685oQhdz8FgyYmSSe0ptdZEySG6/
	EwksjJjiqQhF/Z7X3fF/aSGr2SOM2mstQzX4oL3Q9s6lCdnnOllGwiEGfFSzizouIq2cBrhpyTt37
	iS1QI20p0GWTIuOzOWBosi1SKjtYlf/C6yYbQX0s2LQVJuktD2TZlE1yYEe6LXFvrig5BqyKexitK
	Ho7MP05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXDz-0000000BvqE-2HIk;
	Wed, 22 Jul 2026 13:43:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXDw-0000000Bvos-38yL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:43:02 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c167bda216fso1199761466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784727778; cv=none;
        d=google.com; s=arc-20260327;
        b=bIyPIQWKx0eJ2Lb9zb75R6Ncm8RXzrZ/MK6m36abaBs/i08Qh2aGLDqUWxIEt4nUbj
         Dn2nN991XyVhdzrolPVD+GB5axi+wlYCLVe9qx0c9AGcxrjR+7JfOGutjbYwNl9sr0B0
         pU1cR9aIZDYybRf+TnKMbD/zFtDSNifz86LYPpoE+vdKU17g4bOllQbOmJs/qWa165nF
         BaoyV46e3hpwajBe9SYhPsMk+9Yzjoew7cDecBTrIp1jfiKHkahiA4EAkH2nn1SbZaDD
         OX8DCU8wEhgvB49d3yOIE8s8izJhVmKyIE0I5AAHcLbi8INQKkq6DkFB1k1m9n95F9he
         HpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        fh=cnC79EKzBqWPWkb9nsgr0UN0hbcHQFLRogEQDdl8hFw=;
        b=mGwTuzuxJpjiYggdZntuI2qjM4fGrdTOT2boncSP4M+P94j4sBxep+/iY9ZMLuxYzI
         I1dgi6myMJ19UAHPmAqWGPdZJSnQNu36DKE4gSZpvpJjDpQlI5PJOxXt/J2xFVRKArAa
         wtJrhHQBQTsf+/SPFZwq6SNvkUc8Na4Ejodw4j4f4hGOrtJuDO1zeKnh4CRRATS6b6mW
         KX8axw0jaEmnDSnT+2qQTibtJ6lOi3q2qauv3WhKii276L6lvzUplpMOfX6UmnDWaCIA
         jNtLINoQgAMzofjI7NPn9S+j3f4ChbX8xVr4//7BIMBX0pN2r5TnkvucdZIyftUHb91W
         DA+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784727778; x=1785332578; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        b=5BzPFvHd+JOXUyhrTPPea7dGJburmJ2WbcD8tYks87fnFJxCjo9omqy7WpBUBCS4VT
         nz6rr68uBtcavh8nGRcee/BpKn+e7e+L/AiTzF6Ie6JIBI/MkRgYmLuehHDOTT08b4F4
         BNdYqGUt/+PK5SFbWkbqkyDJ5v9/icm/c7kWztaD6PcIS0yMYMA5fvDUGRprBIai34A5
         CQLZGOhwVUwr6EihoWpkuWWiQN15cyPm4+vMgwIw+gtgVgJgY+5sLae7qw1/MHp9FLvR
         E2mb3FvlG22bQ8BPpXfgZJm8Kl1a3Pnq3FA6I1x/l0eJLvG9ZZS+zZ6LipRvNtza73c6
         m6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727778; x=1785332578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ws9DqLMvg8lFjvqdGJHzDu11CpfrZcuXgvmb+KfAdBg=;
        b=fsqPRgNL8oNycWUhr8xi7g3wsXqChTSvLLM41owVYGqI5F8ZlnorWe0tEk9BT9FHJn
         gY34xV1niIOQ5KaPGu2dzJ+bg4zGhjL8l7usgvaCknJx2We5V0Lmchq3G6LCKvQYWUzH
         n2P10BdwLzzkdt/tTyHxT20h+c7JK83lfiP1LkXsFWJQccRcJrrKHztcWtgFZWPNBurY
         CTBeiI/q187UoT9N+wyr+k/WfVND0mkniEqNILD1HrjrHhlKuJkrIGfHIEGRqcu1iaY8
         RmR3w8T/gPmj13vempVbVS07w2NfGVQ+vpnaeIMf2VRqMg22n/xrMD6CO9ehcSJ7yQbu
         4GjA==
X-Forwarded-Encrypted: i=1; AHgh+RrSWXRGfZFp/UAqvr+TEF3QBj3SGvCTJHEvRkoNWbN4L/HPFrqtfDGzL/cShlDjCA5h/zqUdVwNk05667rcjOy8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Yp+mdGfF/OV2vjRaE8zLs9cC+ILutyod6YwYoCFPCHASXjVk
	fhkcykcBquetsKA3d7PAdCHwUSp+P6jR+q1givcbr5/aHdfYaU99LUOa5U/ezingvMH5b9ULauJ
	y/Cs6axrwlBWIuRzmu0+HDvS5tp5YebB3xd60jqCxqA==
X-Gm-Gg: AR+sD11S8vwYM8HeMoO8IHRQr3CBHyseWxb0FWcxW0WYgP7WSlHcQ5dEtB8NTdGmAvy
	QRj0T0Krdmp+0Afj4Zg++aErweelgcpJvZPMau3tXJBF/VZ8tahFjW6aKedIt7iKb0jgieBflt5
	nShQsYXZaFI40oyg9r96SA8ZcXdwZUoL0CquGWdDKn2dZwU3/YqzBmsdtUG0HzMVJMVeytB4ZGk
	TAbSpBMUDjzTYZjeSM+aF5TRvWEWxWJPJlOdpQNUfVf739QzhWxFQmgpC8wzDT0L57c7V6Amm34
	dqGD17fxk87B7SbmOQ==
X-Received: by 2002:a17:907:3cc3:b0:c1c:2aa5:322b with SMTP id
 a640c23a62f3a-c1c2aa53339mr232997666b.2.1784727778174; Wed, 22 Jul 2026
 06:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de> <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
In-Reply-To: <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 17:42:46 +0400
X-Gm-Features: AUfX_myGX12qd4burJ5mB183OFZAM6Miq0O2zuOdAg4Lag83kZHUHWOe4T-69Po
Message-ID: <CAKTNdwGVMMa1KDCiGscEy-H9WmjvmsGyJs4tBs7R4Byp7nim8g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260722_064300_863963_D62C5EB8 
X-CRM114-Status: GOOD (  53.93  )
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

On Wed, Jul 22, 2026 at 4:59=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > Hi Quentin,
> >
> > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@=
cherry.de> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 7/21/26 9:17 PM, Alexey Charkov wrote:
> >>> When the PLL rates table was first committed for RK3588 (and later re=
used
> >>> for RK3576), the fractional PLL coefficient was defined as an unsigne=
d
> >>> value, while the TRM clearly states that it is a two's complement 16-=
bit
> >>> value.
> >>>
> >>> Rockchip's downstream kernel later revised the fractional PLL code [1=
] to
> >>> account for the two's complement nature of the coefficient, but that
> >>> change wasn't upstreamed.
> >>>
> >>> Change the PLL table definition to use two's complement for the
> >>> fractional coefficient and update its users accordingly.
> >>>
> >>> Note that a negative fractional coefficient is meant to be subtracted=
 from
> >>> the next larger integer multiplier, so the _m values in the table are
> >>> also adjusted accordingly for the two negative-k entries.
> >>>
> >>> While at it, fix the denominator of the fractional PLL calculation to=
 use
> >>> 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Secti=
on
> >>> 2.13.1.4 Setting Guide on P, M, S, and K):
> >>>
> >>> Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> >>>
> >>> Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc0=
5dcc3a51e85ae531749e6270bf9b9212d [1]
> >>> Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3=
588")
> >>> Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3=
576")
> >>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>> ---
> >>> Not adding Cc stable, because while this fixes a real bug it's not a
> >>> regression, as the issue was introduced in the same commit that added=
 the
> >>> RK3576/RK3588 support.
> >>>
> >>
> >> I don't think this is a valid reason :)
> >
> > I believe Linus frowns upon changes like "it never worked, but we've
> > fixed it now" being submitted as fixes. It's been broken for years,
> > and since nobody complained yet, going via the normal development path
> > (i.e. -next) seems perfectly fine to me.
> >
>
> My bet is because of the Fixes: it'll get backported anyway even if you
> don't put Cc: stable. In any case, I don't care too much :)

Maybe... I can try to shout loudly when/if I get the email from Greg's
autopicker bot :)

> >> In any case, this patch is doing too many things at once. I see the
> >> following things that would warrant individual patches:
> >>
> >> 1) fix the wrong denominator, stable candidate IMO,
> >
> > I could split this one out, but since it's a trivial one-liner, I'd
> > like to hear what Heiko prefers.
> >
> >> 2) fix the table (using unsigned int still), to match what Rockchip di=
d
> >> in their downstream fork (maybe check they did maths properly first :)=
 )
> >> stable candidate IMO, except if they are related to 1) in which case
> >> squash with 1),
> >
> > Not related to 1), but directly related to 3). The old table was
> > calculated using a flawed logic as if the k is unsigned and purely
> > additive (and thus k > 32767 stayed at the lower value of m), while in
> > reality the hardware subtracts negative k from m (thus k < 0 should
> > come with m++).
> >
>
> Yeah ok, I missed that we aren't using the signed decimal value in
> rockchip_rk3588_pll_recalc_rate() and thus k > 32767 really is used as a
> positive k, instead of the signed value (thus negative).
>
> > This is confirmed by manual recalculation of effective PLL rates under
> > both approaches:
> > - If k is treated as unsigned and purely additive (valid logic, but
> > doesn't match the hardware) the effective rate lands within 40 Hz of
> > the target for the affected table entries
>
> Valid logic, but the hardware won't actually do that at all and be
> completely off (as it'll subtract for anything above 32767, as the s16
> MSB will be 1).

Yes, exactly. But at least that logic was internally consistent for
the parallel universe in which k would have been truly unsigned and
treated by the hardware as such, and for that universe the existing
PLL table makes sense. Not for our actual universe though.

> > - If k is treated as signed and subtracted from the next higher m
> > (similarly valid logic, matches what the TRM says and also what the
> > updated vendor kernel does) the effective rate lands within 40 Hz of
> > the target for the updated table entries
> > - If the parameters are mixed and matched, there is a 2 MHz delta
> > (five orders of magnitude difference)
> >
> > So I don't believe that splitting the table updates across commits is h=
elpful.
> >
>
> I agree, because it currently is sound logic but result in broken
> hardware. I honestly understood the commit log as "the register is s16,
> so I'll just switch the kernel driver to use that to better match the
> hardware" (i.e., a cosmetic change). Maybe really highlight that the
> current approach resulted in completely wrong clock rates (as k cannot
> be > 32767).

Fair enough, I will highlight it in the commit description. Thanks for
pointing it out!

> >> 3) switch to signed integers wherever applicable, not stable candidate
> >> IMO (but eventually may be backported to facilitate backports of futur=
e
> >> fixes),
> >
> > See above.
> >
>
> Agreed. A reworded commit log would be nice to highlight they are indeed
> related.

Ack

> >>> Note that there is a separate unrelated issue with the rate table, na=
mely
> >>> the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MH=
z,
> >>> which is just above the TRM-stated maximum of 4500 MHz. Also multiple
> >>> entries in the table end up with Fvco < 3 GHz, which according to the
> >>> TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GH=
z.
> >>> To be revisited separately.
> >>> ---
> >>>    drivers/clk/rockchip/clk-pll.c    | 8 ++++----
> >>>    drivers/clk/rockchip/clk-rk3576.c | 4 ++--
> >>>    drivers/clk/rockchip/clk-rk3588.c | 4 ++--
> >>>    drivers/clk/rockchip/clk.h        | 8 ++++----
> >>>    4 files changed, 12 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/cl=
k-pll.c
> >>> index 6b853800cb6b..f445b01aabd0 100644
> >>> --- a/drivers/clk/rockchip/clk-pll.c
> >>> +++ b/drivers/clk/rockchip/clk-pll.c
> >>> @@ -13,6 +13,7 @@
> >>>    #include <linux/delay.h>
> >>>    #include <linux/clk-provider.h>
> >>>    #include <linux/iopoll.h>
> >>> +#include <linux/math64.h>
> >>>    #include <linux/regmap.h>
> >>>    #include <linux/clk.h>
> >>>    #include "clk.h"
> >>> @@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc=
_rate(struct clk_hw *hw, unsigned
> >>>
> >>>        if (cur.k) {
> >>>                /* fractional mode */
> >>> -             u64 frac_rate64 =3D prate * cur.k;
> >>> +             s64 frac_rate64 =3D (s64)prate * cur.k;
> >>>
> >>> -             postdiv =3D cur.p * 65535;
> >>> -             do_div(frac_rate64, postdiv);
> >>> -             rate64 +=3D frac_rate64;
> >>> +             postdiv =3D cur.p * 65536;
> >>> +             rate64 +=3D div_s64(frac_rate64, postdiv);
> >>>        }
> >>>        rate64 =3D rate64 >> cur.s;
> >>>
> >>> diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip=
/clk-rk3576.c
> >>> index 2557358e0b9d..63f229e73a45 100644
> >>> --- a/drivers/clk/rockchip/clk-rk3576.c
> >>> +++ b/drivers/clk/rockchip/clk-rk3576.c
> >>> @@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_=
rates[] =3D {
> >>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> >>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> >>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> >>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> >>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
> >>
> >> For some reason Rockchip didn't fix this for RK3576 in their vendor
> >> kernel, so it's still using the value from RK3588 from before the comm=
it
> >> you pointed at.
> >
> > Looks like an oversight on their end.
> >
> >>> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip=
/clk-rk3588.c
> >>> index 75d42fea2a11..24baa0ef9bf3 100644
> >>> --- a/drivers/clk/rockchip/clk-rk3588.c
> >>> +++ b/drivers/clk/rockchip/clk-rk3588.c
> >>> @@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_=
rates[] =3D {
> >>>        RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
> >>>        RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
> >>>        RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
> >>> -     RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
> >>> +     RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
> >>>        RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
> >>>        RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
> >>>        RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
> >>>        RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
> >>>        RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
> >>>        RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
> >>> -     RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
> >>> +     RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
> >>
> >> Are you sure this is proper? Rockchip changed 51117 to 51119 (so -1441=
9
> >> to -14417) and 49806 to 49807 (so -15730 to -15729) in the commit you
> >> linked.
> >
> > This change of theirs is not explained in the commit and is not
> > related to the code changes they are introducing, so I'm reluctant to
> > blindly copy it. I also suspect that reducing the magnitude of the
> > negative k will result in overshooting the requested rate (but haven't
> > checked).
> >
> > -15730 results in a -41.504 Hz delta vs. requested
> > -14419 results in a -32.959 Hz delta vs. requested
> >
> > So yes, this is proper.
> >
>
> Please specify this in the commit log, since you point at Rockchip's
> vendor kernel and don't actually implement two's complement with the
> same values in the table.

Ack

> >>>        RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
> >>>        RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
> >>>        RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
> >>
> >> In the commit you provided, they also change this line (though they
> >> don't change k, so unsure why (if) that is related). Wondering if this
> >> isn't related to the denominator fix they also have done in the same c=
ommit?
> >
> > It's unrelated and unexplained, so I decided not to change it until a
> > valid rationale is discovered. Their kernel never used 65535 in the
> > denominator, FWIW.
> >
>
> It actually did use 65535 for some part, c.f. line 1601 (- column in the
> diff):
>
> n =3D div64_u64((uint64_t)ppm * 65535 * fbdiv, 100000);
>
> but that is guarded by CONFIG_ROCKCHIP_CLK_COMPENSATION which isn't
> enabled except for rv1126_defconfig, so I guess we don't care here indeed=
 :)

Yes, well that part is unrelated, so it doesn't count :)

> Looks good to me!

Thank you for looking into it and for your feedback!

Best regards,
Alexey

