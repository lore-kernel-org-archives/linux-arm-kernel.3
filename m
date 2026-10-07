Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3491CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwR3gHAwZrUlbJdpWYscVbEmULgrTOfq08+7cc5P/XM=; b=yISQXFwzUDtIAeyfsteJU2b3Dw
	kDZy//2Ee1Q0ebGoloK3XPNBcs/754hieg1FcfGmuz41KzYnB7l4/QiyqwhxyobYdPI8CJXUDQLKv
	yN/w0lT2bL9cX2KaEM9nSU4u0Hfs++Yi2YdyuySVG17KfedXZYzRx/LOFR3Adpt5MSFUgiktz0OQH
	LPo17qk17tsYBURojyLCCHJBvY5ov3Mw0ozL73yBwPuQK88rRTLaCT4mSzm7ycrT//9K+T+KUIhNd
	bvMnvl5VbZq4t/fGSALQKLIq8UpFbPr0D94pCuK1PBZdOzXV3M6wJg6zbXiEdBruYdLUKN69S04uF
	9Ltqm+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEREy-00000002URT-17wn;
	Wed, 07 Oct 2026 12:59:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEREu-00000002UQU-1Fap;
	Wed, 07 Oct 2026 12:59:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95FDB4175C;
	Wed,  7 Oct 2026 12:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0F51F0089B;
	Wed,  7 Oct 2026 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791377959;
	bh=dwR3gHAwZrUlbJdpWYscVbEmULgrTOfq08+7cc5P/XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZgvNs+7KV/3y0yBb6ZoBJJqh7YzO3nfMCDqmPeXmK6DaiouIQDadghSTjRcACi/2
	 HULuc2RxEc57Jmnn1ubL3ISW1lJuwmn57sn7FBi+jTg+O7todNEnVPgrNxrx88jiDd
	 qtRzaDSQ4TaYVExYFgs292X5lRCcIKyyUa+WuXBEn/1yL2s9gdUdRQ2ASfVZKQ5w0D
	 zVnTuBh+7A0Jft/lWl2gRN9v5KT6E0uzKmqcGjcqWiDb0Qa6Fa7ac5dwFDbNOBFaR/
	 Ab5fXSFarOAzb/0/W6y4mzhhILxd5DFaBruQV47oogqVwU+K65XMH80aq+UD5LzvHW
	 ljFjw3fnmLC/w==
Date: Wed, 7 Oct 2026 13:59:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <20261007-634979008f45ea7ff444d41b@squawk>
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-4-tanure@linux.com>
 <asYWEwjFO8g50o1i@squawk>
 <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zbkq0YzkpeyE441M"
Content-Disposition: inline
In-Reply-To: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
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

--Zbkq0YzkpeyE441M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 11:34:54AM +0100, Lucas Tanure wrote:
> On Wed, Oct 7, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Oct 07, 2026 at 09:26:23AM +0100, Lucas Tanure wrote:
> > > The T7 has the same ethernet glue as the G12A, but the controller
> > > reaches memory through a pipeline stage that this SoC inserts in the
> > > bus path. That stage has a gate of its own, which no other member of
> > > the family has, and nothing else in Linux claims it. It is therefore
> > > switched off as unused, and the port can then no longer finish a
> > > transfer.
> > >
> > > Describing it needs a fourth clock, and the fourth clock of the
> > > existing list drives the timing adjustment logic, which the T7 never
> > > uses. So the T7 gets a list of its own with the gate in that place,
> > > under the name the SD and eMMC controllers already use.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> >
> > Didn't I ack the previous version?
> Sorry, I didn't receive one.

Hmm, thought I had sent one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Zbkq0YzkpeyE441M
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZCCgAKCRB4tDGHoIJi
0o/uAQDH6PB4FUDRgOVLQKFmYjwcQt2CXCVjVxTNOzUqkxslCQEAyqjDGZUbFb3t
Rx4Z3kIt/JfIveShRWhBuUi6Iqkvrgc=
=rJrd
-----END PGP SIGNATURE-----

--Zbkq0YzkpeyE441M--

