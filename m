Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8DEDEBF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLXyllKe4kME0zGNjdGc3s7idDJSMZuXKlb1PAIure8=; b=lNiPSxIRE/sDfwm+9wzEJ8N0RZ
	wlMmg06scyB9Td86NQ7/B2RRLbmS9LSUZ53TMmTHZ6+snWc2Sot7h3nkJYpyxt14JR8OUzf7Av4tZ
	dMlTzIl+aktGJpr9XwAbmgwp02ZynT1Whk5/pH3516ExvCHGmrCmyUxrt3ZP8iejr7IEPwTQk1C0q
	O6SBCNrrVzMwjNXTHUsXt3rTKTCHBTStHlyRgkFC/8LbGqTzwTLAWIc5ODa0dJDUQs52984z7kb2h
	2SciR30pBbRg13LNQbd7yx4fFfv+jDHXrRhnSCI0EOqKZjiTupLTkpPyoah5bV3gcQSe37t8JD5Tq
	DaTrOpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaOp-0000000GBN1-0smJ;
	Wed, 04 Mar 2026 00:47:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaOo-0000000GBMn-1iPz;
	Wed, 04 Mar 2026 00:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A3CE6057A;
	Wed,  4 Mar 2026 00:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5DFC116C6;
	Wed,  4 Mar 2026 00:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772585257;
	bh=VEGMSRMtXAwgbfeBbhQcBofXpQkKRT5Z8WZUKMAOX38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZaJQBWf7I8pmM/6ZJ4zsjSzJtGhNzRQE6CD4S1mVPptzvU/6lH5lK8jz1yZcE6aK
	 8jUhYVTgqb11gUtPxlHSWCwda8ZbzIiwrTf/c53SMBUVMOHQanGyjhk19++FuPBuJs
	 fa1mxb80xnM3SlGfrqHNVe9jsJvcDgBPlX58Kzxf9bqQX4tXXEXVzFdJwgyNf+UXIF
	 u/xPYkslfzvWDmu7HVBpCgGeQAHf6yc4fXQYuBNNjFDtxE/7mR5ihpWfSK/OsEd1l3
	 rYRnIwMbo5TDY5eYzknl5po8kxlFYRVVAY5icWA35cWhpmZxc+XJltgxnLgmby7Ds/
	 iDBIVJkaQy47g==
Date: Wed, 4 Mar 2026 00:47:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <20260304-regulate-verdict-c3a361d2dc83@spud>
References: <20260303061525.846-1-lizhi2@eswincomputing.com>
 <20260303061637.872-1-lizhi2@eswincomputing.com>
 <20260303163846.156d18f7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/4ukRtYrJaxUNGkn"
Content-Disposition: inline
In-Reply-To: <20260303163846.156d18f7@kernel.org>
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


--/4ukRtYrJaxUNGkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 04:38:46PM -0800, Jakub Kicinski wrote:
> On Tue,  3 Mar 2026 14:16:37 +0800 lizhi2@eswincomputing.com wrote:
> > There are currently no in-tree users of the EIC7700 Ethernet driver, so
> > these changes are safe.
>=20
> What do you mean by this sentence? The commit under Fixes was part of
> Linux v6.19 already.

The "funny" thing is that caring about users doesn't even really matter
on the devicetree patch, except for this hunk:
|@@ -81,7 +99,9 @@ properties:
|                          or external clock selection
|           - description: Offset of AXI clock controller Low-Power request
|                          register
|+          - description: Offset of register controlling TXD delay
|           - description: Offset of register controlling TX/RX clock delay
|+          - description: Offset of register controlling RXD delay
|=20
| required:
|   - compatible
And it only matters here because an item is injected mid-list. If this
was moved to the end with the RXD delay, the **dt-binding** changes
don't have issues with safety. I've not looked at whether there are
knock-on concerns about users in the driver or whatever yet, but from a
binding POV only that hunk can break something that currently works.

> > Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC770=
0 SoC")

--/4ukRtYrJaxUNGkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaeBIQAKCRB4tDGHoIJi
0s/JAP9KQAUavWCtxHELp6gO3nomV9WLzwNt5Y73djyNLOwyAgEA/SUoSqFcn6jk
jbiDfJ6siMbhpiAGPUA8gLzHNWUGhQI=
=2KxI
-----END PGP SIGNATURE-----

--/4ukRtYrJaxUNGkn--

