Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CFD46BEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 19:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7ixvs9SjVU/C4VAAsX3lvuUJ8ZvAu9S9zoeDiQHuKU=; b=nJ/AUHK+mES2K2c6y58anzDhxj
	1LInuQHrwrsqa2MWtLyfPQotTejAlcBvUN2CDaM+6Bj9wlI8CN9eZl5xGYop/FNF2qtk9tcuD3+P5
	UyJm0pNGMB9X7EX1os5YRj7iCPPBAZakNy9Nsy5V4ehn1V+aAU2AxJb0Komax9Zy8UN8+Zbe8K5TV
	4625ut3RB0wfTAVtprYHlaTIpz0EVP7GRHoW9fJnEvJSYKigztndMGUyg2jx2LyMx7iwepwrK3TIq
	E9e5A+nzKk9xeeCWO5KzBr9C2WRTgcG/MlaFO1qgTBk903itI84ICoAjE2oxnYWqL6lFFSxWbFE2Z
	Usy1KmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAnB-0000000Gf0P-2sTB;
	Wed, 28 Jan 2026 19:01:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAn7-0000000Gezv-1j3N;
	Wed, 28 Jan 2026 19:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 830F660007;
	Wed, 28 Jan 2026 19:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C71C4CEF1;
	Wed, 28 Jan 2026 19:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626884;
	bh=n34TAjuaUJNq368XZLmuh46Sjt4jj9OJ3xPmOcHju38=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C8w2mvSqqOv6CNJooWdWwnMODpl641zH6FL4vTpgMjRx34EvM9qL//KZoVYqmVwQr
	 V6V0P5e1YDea3DWFmUsl+x1oMwNTe2zUS6dKUAWeT7RixPfgiCU/7di9qvJCBGXTJC
	 hpAr6nOsVvFDkue6E7q7/axgb0P3PEIg16XjCW7/A6o/XeXlAaF3W0C1C8RPk1sb+t
	 FHNmfFEyooZOZ9bvKOLJgTJXss8jw0JMDsG1rx/N/A2MaegXoGs4GVqb0Ak6e0bdUJ
	 e3D3ST4S/1fPQtZLjzAblj7sTvVRxPR67coMBhPVIHX64yhlEwQV5lOkEp0LSkQf3O
	 YRbj1SwAQFH5w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3745487.e9J7NaK4W3@workhorse>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com> <6678782.DvuYhMxLoT@workhorse> <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk> <3745487.e9J7NaK4W3@workhorse>
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Michael Turquette <mturquette@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 28 Jan 2026 12:01:22 -0700
Message-ID: <176962688200.4027.9869545980331892869@lazor>
User-Agent: alot/0.11
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

Quoting Nicolas Frattaroli (2026-01-28 09:04:55)
> On Wednesday, 28 January 2026 15:47:08 Central European Standard Time Mar=
k Brown wrote:
> >=20
> > For the Avenger96 that says:
> >=20
> > [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> > [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> > [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> > [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
> >=20
> > https://lava.sirena.org.uk/scheduler/job/2412562#L563
> >=20
>=20
> Okay, on this one, there may be a problem in the clock tree.
> ck_mpu is marked CLK_IS_CRITICAL, but its parent, pll1_p, is not. Clock
> core doesn't seem to check whether any children of a clock are marked as
> critical before disabling it.
>=20
> I'm not super familiar with the intended semantics of critical clocks.
> If we need to manually mark all parents of critical clocks as critical
> as well, then a (potentially partial) fix for the Avenger96 might be:
>=20

Marking parents critical hasn't been strictly necessary so far because
we've been relying on the prepare/enable count on a critical child to
keep the parent prepared/enabled.

>=20
> I just looked for CLK_IS_CRITICAL clocks in that file that have the
> CLK_OPS_PARENT_ENABLE flag, and marked their PLL parents as critical
> as well.
>=20
> An alternate approach would be to skip the parent enable/disable pair
> in the problematic patch in __clk_core_init for clocks that are marked
> as critical, because if the parent wasn't on for a critical clock then
> we wouldn't be in that function, we would be dead.

The parent may not be known yet in __clk_core_init() because we lazily
find parents. Putting it another way, we can get to the recalc_rate()
call in __clk_core_init() for a clk with CLK_OPS_PARENT_ENABLE when the
parent pointer is NULL. This hasn't been a problem because when we adopt
the orphan clk the rate is recalculated (see
clk_core_reparent_orphans_nolock()).

I don't see an easy way out of this problem because in general we need
to know a clk with CLK_OPS_PARENT_ENABLE is parented enough to be able
to read the registers when calling clk_ops like recalc_rate() (and
probably get_parent() as well meaning that clk_op can't touch
hardware?). Maybe the simplest approach is to skip any sort of hardware
access when this flag is set during setup and reparenting.

BTW, I don't know what this patch is actually fixing, so I'm going to
revert it. When it is resubmitted please describe the problem you're
seeing.

