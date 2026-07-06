Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIBdR4kNPFgAFg6CIvOqngtwtnAfcvSaKkHxpyzx3/A=; b=k4mI57zkoxa5NSUdbey8CZniTe
	bXNs91d6STnN35f2tg4BFUmly9iZENgmeyquBIW7/6x8M4Qa9ylswmnk6NcYe1gRuj6yeQRU8Qy87
	ALVGIwyHoe1PZB+8jVUFIO92afeG1e5owHXAEItesq27DG+P5MGnyiWcUqb6PnamO1FFw1n6y4kW+
	yCCLZmt0NXm2QIrAfeB0mNHE5LY+4WNhrgOI8+Qv96Kr5uHtpOqLDV0YVIVDkmZMt/j+4HGUCoWz8
	OV57LXs+IWGLpmsCrAvIs16LES2aWFXE/DuAWdh3ns29FdfcMmgA8jhFRGbisa86+m8F9QjEiDQR9
	Q5FUF0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjGQ-0000000CZrC-3Lmx;
	Mon, 06 Jul 2026 13:21:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjGO-0000000CZln-0MlU;
	Mon, 06 Jul 2026 13:21:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE61C4078E;
	Mon,  6 Jul 2026 13:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E42B1F00ACF;
	Mon,  6 Jul 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344091;
	bh=LIBdR4kNPFgAFg6CIvOqngtwtnAfcvSaKkHxpyzx3/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hzhGtLEIi1bGKJUC8u0qeW903kcSL3pljP7AzVrtfkZGGdgUDrJReqcoxx+k3wMrP
	 Zz/RnazFls+zmQ8qsn1GMbrnZ7t5QVR0DM1m1vzifytBeK3QFfRGlZgP8DV/8RcrsY
	 W7sc6enVxVr0saHu8cE8jQyiQuo0kLSlFLwWvsK20bBlrZiotMIxEmcS4aYw0USZaf
	 IJqxLzl1Htxaa7FBiJ6AMgwyHg1HnPrY9B6qOdeY6Z3G1BVSzCC0UgnZd9vfe1Dzmw
	 ukFJvYnBBzWJuKp4++gojDAnCDOmKlaQOIaKuk9fbhj1zMZAFXNcF+lFVH6z+eystA
	 D494h+6Eq+sLw==
Date: Mon, 6 Jul 2026 14:21:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	weishangjuan@eswincomputing.com, horms@kernel.org, alex@ghiti.fr,
	lee@kernel.org, wens@kernel.org, lizhi2@eswincomputing.com,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <20260706-confess-dagger-e60b5fad57e8@spud>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ULiKs6VR99TI7WYu"
Content-Disposition: inline
In-Reply-To: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
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

--ULiKs6VR99TI7WYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> >=20
> > Enable the on-board Gigabit Ethernet controller on the
> > HiFive Premier P550 development board.
> >=20
> > This patch is included only to provide the DTS context for reviewing the
> > binding and driver changes in this series.
> >=20
> > The upstream DTS series will be submitted separately after the binding
> > and driver changes are finalized.
> >=20
> > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>=20
> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
> PW, but I think it needs explicit acks from relevant SMEs. Could you
> please have a look?

We do not typical provide tags from dts patches, but that's irrelevant
for you, because this (and effectively all other dts) patch(es) should
not go through the net tree to begin with.
Instead, the platform maintainers should review and/or apply it.

Additionally, it seems the contributor's commit message suggests
that they didn't intend this patch to be applied at all?

Cheers,
Conor.

--ULiKs6VR99TI7WYu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakur0wAKCRB4tDGHoIJi
0lJJAQDyznJ0mXwKfkHnFRg/RjkZfn/slGLhUuYfKnvvJnC3yAEA7uHRCP2yagsd
bJ/ACyG7Ej0e3jeZwhPFEWzspucP9go=
=kICX
-----END PGP SIGNATURE-----

--ULiKs6VR99TI7WYu--

