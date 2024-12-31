Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0748E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 01:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yweBIDwWAcJ8zuNX2nWLa6JRBl31MnfA56kEQi2R+n0=; b=CGGSqY48X4UR/wdjbKesZQu2Nt
	rtsqdoqltU49YdzVfaJcsh1HywXofxIHdjGHgkVKFlheAjSAFm/cmYXHv3XadKpvFPStsZnwq/TEp
	nVG5K1S1xaqqC/lGt0LtDIGKljdmLlaht2ulFSVFJL5SQIHhp+NLcIkN1AHLQOH9DxSR/5xaLzVEq
	B8dqm5Szq3q7V2wj4jSilIPwprRxm9TXHVLo68XWk5iPFIXOyuIkkkRPbhB5goagIcR2/ZK5ZYP1W
	JHNBecmQXrQRqN9npUPrUqXhah62jwt3HbGurvW9Fl82Ad8o9R/8xH2Rz7h+iSbJfljg+TqDFNEWK
	YptFNurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQzU-00000006GqS-4AJx;
	Tue, 31 Dec 2024 01:24:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQyJ-00000006Gjg-48YL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 01:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38F16A40FFB;
	Tue, 31 Dec 2024 01:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF35C4CED0;
	Tue, 31 Dec 2024 01:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735608178;
	bh=6/KQluQbR5WRrJVNS61IDNDVMHTHXFHLqi2YBMMnL7E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oju9zuw93COQ2rtTWFexnlWlteo1qU+an7SDYhpN9lzLpkLGgo5z4z6HmMHI+bY4T
	 AcNBdMMO6hRDqzEYbdPkM68RbTixFlRKGd5saCzCVCktXMmFI0LiBjwCBpzLnrJmDc
	 Lc/vHXyiaEEL8MqCD7tTwXPMMasfZMkvt/tIkfHwzL1N3MIZvY6W4zcpnzAD6YXE4t
	 LFcjaV+VocNNiz7a8gt0Ygu+zF+CGmDIZ94+7McZa3FKWU/CbsNawe08UgTZunef2P
	 MgxvtyUYJCqNL5cVj5Be9T2f6g7tM19jhtxnPUIYdaAZmT9zO0Upt3fYXRPXjJEAu/
	 cHOXrbzPgahww==
Message-ID: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87bjx2tf3y.fsf@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com> <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com> <20241217-brown-wapiti-of-promotion-e3bec6@houat> <87bjx2tf3y.fsf@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
To: Maxime Ripard <mripard@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Dec 2024 17:22:56 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_172300_179957_0A6C1BA9 
X-CRM114-Status: GOOD (  32.69  )
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

Quoting Miquel Raynal (2024-12-23 10:43:13)
> Hi Maxime,
>=20
> On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:
>=20
> > On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> >> There are mainly two ways to change a clock frequency.
> >
> > There's much more than that :)
>=20
> "mainly"
>=20
> Or maybe I should have added "on purpose".
>=20
> >
> > Off the top of my head, setting/clearing a min/max rate and changing the
> > parent might also result in a rate change.
> >
> > And then, the firmware might get involved too.
> >
> >> The active way requires calling ->set_rate() in order to ask "on
> >> purpose" for a frequency change. Otherwise, a clock can passively see
> >> its frequency being updated depending on upstream clock frequency
> >> changes. In most cases it is fine to just accept the new upstream
> >> frequency - which by definition will have an impact on downstream
> >> frequencies if we do not recalculate internal divisors. But there are
> >> cases where, upon an upstream frequency change, we would like to
> >> maintain a specific rate.
> >
> > Why is clk_set_rate_exclusive not enough?
>=20
> I am trying to protect these rate changes from subtree walks, I don't
> see where setting an exclusive rate would have an effect? But I might be
> overlooking something, definitely.
>=20
> ...
>=20
> >> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *c=
ore)
> >>  {
> >>      struct clk_core *child;
> >> =20
> >> -    core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> >> +    if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> >> +            core->new_rate =3D clk_determine(core, core->rate);
> >> +            if (!core->new_rate)
> >> +                    core->new_rate =3D clk_recalc(core, core->parent-=
>new_rate);
> >> +    } else {
> >> +            core->new_rate =3D clk_recalc(core, core->parent->new_rat=
e);
> >> +    }
> >
> > Sorry, it's not clear to me how it works. How will the parent clocks
> > will get notified to adjust their dividers in that scenario? Also, what
> > if they can't?
>=20
> The idea is: if the flag is set, instead of accepting the new upstream
> rate and recalculate the downstream rate based on a previously set
> divider value, we change our divider value to match the same frequency
> as before. But if we cannot, then we just keep the old way.
>=20

The exclusive rate code could support this if it doesn't already do so.
If you call clk_set_rate_exclusive(child, <constant rate>) followed by
clk_set_rate(parent, <new rate>) the core code should try to keep the
child at the constant rate, or fail the clk_set_rate() call on the
parent. It should be possible to confirm this with some KUnit tests for
clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
parent changes the parent rate, we should speculate the new rate of the
child_A that's protected and fail if we can't maintain the rate. We need
to start generating a list of clks that we operate a rate change on to
support this though, because right now we rely on the stack to track the
clks that we change the rate of.

Initially we thought that we could do this with clk notifiers. That may
work here, but I suspect it will be clunky to get working because clk
notifiers operate on struct clk.

