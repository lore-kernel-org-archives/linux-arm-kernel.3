Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED5EB594B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 01:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EakT1hLowwtmKPzAINUoQ/hf7LzQVPrsfk76ZwhNbgw=; b=kUpLVtxgEwA34O6ljKzZcrWUfE
	vNo+FPvMSo3ztCEpQYHYsJM2yDNwqv+MGsRAAwiFCQ6X0Ob7pg8ymuekp+Rg6Ku9pb2vhjp0uO/3L
	r18w5wzLtJL9IjphpVjxg5PJ00Al0TlCh8zD2fSIulp2EEJI5ATRWjD1B/eOMAnhHi6M4rb3Nh1Rg
	Ga6nm0AdBFcrYCDkKf0HO+SkL8muu6btjC+hpv4WJ+7h5uPst1hTVNOZ84o5KpECNgxnr8YrWBjag
	YqT+YPVzox8ZcBI5gBQZ2h46E+9Qp0HDqPuBVsWPsxZgOJGxbH6U7cn29VMfA/xrqe1YmF5t7bC5T
	iAWmf1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpzLm-0000000063l-3SQQ;
	Wed, 11 Feb 2026 01:49:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpzLk-0000000063P-0AvF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 01:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770774535;
	bh=EakT1hLowwtmKPzAINUoQ/hf7LzQVPrsfk76ZwhNbgw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j2aso4RoraIWSto2koPfLCJtWXbahxGOS4F92RyaOGH+78Q8Q9iIZ/eUuvTp27cwz
	 SXvrqpP9nSmfrOmTGeATd/1wAYIwQvsIZFajhF7jfm0Kgh4M0HCrBs0ndy+GINfUCx
	 xRPl4KwOJ0Zm7YQZOn34RsRkKdxWo4QH3BxhM2nvpfOg8bvm9QHprtvgy1serdTxng
	 +aXDiqbUrJfbEz9rqIpQ8lqGgBruyDHeFYJn68/nSjvvg/OV4jzL3dyO45qrSM58yu
	 J2l8WGLBGkO349u/X+M8/a62r6cVK2mPWHQfGYyN/SPJ6l3W1g0IySz4rpDjqVH4f4
	 bbWnqCOBWwlcg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7CA69603B4;
	Wed, 11 Feb 2026 09:48:53 +0800 (AWST)
Message-ID: <15b7c7cd97cc974605ffd79125d641ba159587f5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Tony Lindgren
 <tony@atomide.com>,  Linus Walleij <linusw@kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	 <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 11 Feb 2026 12:18:53 +1030
In-Reply-To: <OSQPR06MB72526DA818EACDE2931BA0168B62A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
	 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
	 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <20260206042215.GA5376@atomide.com>
	 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
	 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
	 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
	 <20260209144250.GC5376@atomide.com>
	 <OSQPR06MB72526DA818EACDE2931BA0168B62A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_174904_297365_9FCC179C 
X-CRM114-Status: GOOD (  31.71  )
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

Hi Billy,

On Tue, 2026-02-10 at 06:28 +0000, Billy Tsai wrote:
> > * Linus Walleij <linusw@kernel.org> [260209 09:51]:
> > > On Mon, Feb 9, 2026 at 3:25=E2=80=AFAM Billy Tsai <billy_tsai@aspeedt=
ech.com> wrote:
> > >=20
> > > > To make sure I align with your expectations:
> > > > 1) Would you prefer the new driver to be fully standalone (using th=
e
> > > > =C2=A0=C2=A0 GENERIC_PIN* helpers + syscon/regmap-mmio), rather tha=
n trying to
> > > > =C2=A0=C2=A0 refactor/export helpers from pinctrl-single?
> > >=20
> > > Yes. Conor improved these helpers so now it should be possible
> > > to use these to do a very simple and slim driver for what you
> > > want to do.
> > >=20
> > > > =C2=A0=C2=A0 Action item: Introduce a new pinctrl-single-bit.c driv=
er and DT
> > > > =C2=A0=C2=A0 binding, which can also cover the existing bit-per-mux=
 logic currently
> > > > =C2=A0=C2=A0 in pinctrl-single.c.
> > >=20
> > > Sounds about right.
> > >=20
> > > > 2) For the syscon/regmap hookup, is it acceptable to add a syscon p=
handle
> > > > =C2=A0=C2=A0 property in DT (e.g. "syscon =3D <&scu>;") for the new=
 driver to obtain
> > > > =C2=A0=C2=A0 the regmap, or do you prefer a different binding/prope=
rty name?
> > >=20
> > > This works for me.
>=20
> > Great, sounds good to me too!
>=20
> Hi Tony & Linus,
>=20
> Thanks again for the earlier guidance =E2=80=94 that was very helpful.
>=20
> I wanted to double-check one remaining detail around the syscon/regmap
> hookup. As discussed before, using an explicit syscon phandle on the
> pinctrl node (e.g. syscon =3D <&scu>) is fine from my side, and I
> understand that approach is acceptable.
>=20
> Andrew also pointed out that, for AST2700/SoC0, the SCU is moving towards
> an auxiliary-bus based model, where subfunctions such as pinctrl are
> instantiated as auxiliary devices by the SCU driver itself, with the
> pinctrl node appearing as a subnode of the SCU binding. In that setup,
> the pinctrl driver would obtain the regmap from its parent device rather
> than via an explicit DT phandle, similar to what is discussed here:
> =C2=A0 https://lore.kernel.org/all/459f84c56a5010910ecbf8b445c092674f0606=
91.camel@codeconstruct.com.au/
>=20
> Before proceeding, I wanted to confirm whether this auxbus-based approach
> for the new pinctrl-single-bit driver would also be acceptable from your
> perspective, given that it avoids introducing a generalized DT-based
> syscon hookup up front and aligns with the SoC0 direction.

While how we describe the hardware in the devicetree is important, the
impact on the driver is ultimately some glue code. I think the thing to
prioritise right now is the design, implementation and testing of the
bit-per-mux functionality, less so how we get the driver bound to the
device and retrieve the syscon.

The proposal I made in the message you linked is a bit speculative at
the moment. It needs buy-in from the DT maintainers as it proposes some
rework of what's already in-place. That needs thought, but perhaps it
can come a bit later. For now you could write a proof-of-concept
implementation of the glue code for testing purposes (which we may
replace once we resolve the binding discussion).

Andrew

PS: However, regarding the syscon property itself, it's probably worth
paying attention to the "=E2=80=9Csyscon=E2=80=9D is not a generic property=
" note in
https://docs.kernel.org/devicetree/bindings/writing-bindings.html#typical-c=
ases-and-caveats

