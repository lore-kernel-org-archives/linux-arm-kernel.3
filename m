Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F3DC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/x3UvyWT4tgUsu5VDm1icexsdISA7hrKj/RK5xxKkk=; b=3cJZyScKcIbsGLB572rsCJmCZN
	DJD8zFuVQEN0qfWxJqVANw2SYtCuMqZvzRZn12gl2i+AE7LlYcHsHztVS54O0u24eolwOAmpdXUxZ
	G9S+7/RkXlM6WrrDuuKWEUHpraMydrK/h8dPqmBUZeUDi6VvbcwAS6RnricwZDrPGSs5DR0gX1Ag9
	VGnzHfDV9ZHX6PxDp+ECH0rPgAIB3d4FsEQ3WVwyIcrIHs1Y5YxB0iaYdj0U1MNC3rbNhyXwYrGXB
	YCGDhCHeYqMuDz3mvVTzvpUZfows/pWF9ub1Gju5BblkCflzvfnM6p6CvCJfXE9Njqbhxu9P8S6aM
	55gO14aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dQa-0000000ADkn-3Bl0;
	Thu, 24 Sep 2026 06:59:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dQX-0000000ADjx-2EF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:59:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A3101516;
	Wed, 23 Sep 2026 23:59:24 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E925D3F86C;
	Wed, 23 Sep 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790233167; bh=YHr0dnZ4DkdP5OsnRDTK952N33BeT0+O2Zw+kHc670Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OJmFpQPwGPzvj5wq7IEMJ3FA2qjJ2RzWVw2uO6c9VFk0VT6NGzyjuiJT9XatnD0ZQ
	 rdHJXjtkTErlFT6NFkrAiZS36VYVv6+jqh9PqwSbVl2sFnQUEPczfAtojSpix00Jc3
	 aEwe29CpewHXq7ltQOxJG6OVpJcHqP9yp4GUFu0E=
Date: Thu, 24 Sep 2026 08:54:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a
 shift register
Message-ID: <20260924085438.3edce740@ryzen.lan>
In-Reply-To: <CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
	<20260917223913.1855301-3-andre.przywara@arm.com>
	<CAGb2v67XsgfoYrJ6gJ_kshjnbSOOrJt9fK6RE1ErsTuHuVji5w@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235929_689503_77074EA4 
X-CRM114-Status: GOOD (  22.83  )
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

On Fri, 18 Sep 2026 11:51:19 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> On Fri, Sep 18, 2026 at 6:39=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The "mp" clock models a mod clock with divider and a shift field. At
> > least one clock in the Allwinner A523 features just a power-of-2 divider
> > field, so support an initialisation of the clock without providing an
> > actual divider field.
>=20
> Please just use the single divider clock type instead. It properly suppor=
ts
> power-of-2 dividers.

Ah, indeed, there is SUNXI_CCU_P_DATA_WITH_MUX_GATE now, will drop this
patch then.

So when using that macro it looks like this:
static SUNXI_CCU_P_DATA_WITH_MUX_GATE(pll_cpu_l_div_clk, "pll-cpu-l-div",
                                      pll_cpu_l_hws, 0x060,
                                      16, 2,                    /* P */
                                      0, 0,                     /* no mux */
                                      0,                        /* no gate =
*/
                                      CLK_SET_RATE_PARENT);     /* flags */

There are still some unused bits, does that look OK or shall I add a
macro that allows to skip mux and gate?
static SUNXI_CCU_P_DATA(pll_cpu_l_div_clk, "pll-cpu-l-div",
			pll_cpu_l_hws, 0x60,
			16, 2,			/* P */
			CLK_SET_RATE_PARENT);	/* flags */

Cheers,
Andre


>=20
> ChenYu
>=20
> > Add a check whether the "width" field is 0, and skip the divider
> > handling in this case, as the GENMASK macro will not work with a zero
> > length.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_m=
p.c
> > index 7cdb0eedc69b5..3896cb94bf733 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         spin_lock_irqsave(cmp->common.lock, flags);
> >
> >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift=
);
> > +       if (cmp->m.width)
> > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp-=
>m.shift);
> >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift=
);
> > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > +       if (cmp->m.width)
> > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> >         if (shift)
> >                 reg |=3D ilog2(p) << cmp->p.shift;
> >         else
> > --
> > 2.43.0
> >
>=20


