Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EC0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+J1UiQEH3Rtesh/EDPg41C9ly4Q28WAviDALAty324=; b=18XPn+l2c40dEp7S8/sX2oDHt4
	5cYuHtOfMlpzlsFCyHOYJnxqGKjva2b9RdtpHHWPo8qD3J/SY32BuSvzK+tuHf8fvhW+8V8dmM3E1
	LlvgckHwFDJQIkaXV2ceYUN1JTUb+rGeR6FSQbHkS7fWvPmbGCZUTwYxXpXXYwCNBr7X3GzNVeokV
	MtoX0lSnpAPModP4vxXhHEECO4mWZj0DFRFJewTw5zF4YHEwQn4v0c29nUaAfWldI2SFa4ZabWzp3
	Xlawca+bH+sg61k48UBs937XW/9zKpI2YC1kM9o1Nb2KplHZbB+r3BuZ+kuLgUd/XA2XErHFsxayO
	qC7CzYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBhm-0000000EZYs-3fwk;
	Fri, 11 Jul 2025 11:14:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9pI-0000000EGzQ-2MU2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A49E43C78;
	Fri, 11 Jul 2025 09:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A27C4CEED;
	Fri, 11 Jul 2025 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752225232;
	bh=D+J1UiQEH3Rtesh/EDPg41C9ly4Q28WAviDALAty324=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB7i/wSnyCsoVTs9OQknYxwFVOVpM2CusWxCqIs1eVhOcPRvap/k39SzKRXhEt0FV
	 Rfs0JSKM60g5cpuD+ce/+cBEUW1BFJsV9+17g+VaUk5mK7cJFZ0Giwai74c1aPg9RC
	 +DAQjJKe5NcHKdmdAJ3wT5mTxTOLmawWsOZvD22RXuHgzrf7XIVGa98VywnGlWhtkV
	 aEu+oCLzZ960iRceCHbj2JpvEyLL2/wVJHdF76NJLuPKe4mYlXTK7rYzdMqlHKI5dS
	 p8c5b/Rh+v/3LhuC+VYqz6fcYoUL9SR5VxdESBR1vSvbsmJ3Qh5UgK8xn2BS2Aat7q
	 24/CTHe93DLzA==
Date: Fri, 11 Jul 2025 10:13:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Morse <james.morse@arm.com>,
	Sebastian Ott <sebott@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: fix u64_replace_bits() usage
Message-ID: <aHDVzKnJ2Yb6kmAC@finisterre.sirena.org.uk>
References: <20250711072752.2781647-1-arnd@kernel.org>
 <86h5zj9laj.wl-maz@kernel.org>
 <4befb9eb-96e6-4a7c-9746-286144564f4e@app.fastmail.com>
 <86frf39kh6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8OlcYUwNPTX3vWXV"
Content-Disposition: inline
In-Reply-To: <86frf39kh6.wl-maz@kernel.org>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_021352_621321_68F7682A 
X-CRM114-Status: GOOD (  16.72  )
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


--8OlcYUwNPTX3vWXV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2025 at 09:53:41AM +0100, Marc Zyngier wrote:
> "Arnd Bergmann" <arnd@arndb.de> wrote:

> > Yes, as far as I can tell, the warning only showed up in linux-next
> > after f66f9c3d09c1 ("bitfield: Ensure the return values of helper
> > functions are checked").

> > As far as I can tell, Ben added the check in linux/bitfield.h
> > when he sent you his version of the fix, they just ended up
> > in linux-next in the wrong order, so I ended up recreating his
> > original fix slightly differently.

> I don't think Ben's fix is in -next, as I queued it in the kvmarm
> fixes branch, which isn't pulled by -next.

We should really get that added to -next, that'll ensure it gets covered
in the pending-fixes testing coverage and avoid issues like this with
the main -next tree.

--8OlcYUwNPTX3vWXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhw1ckACgkQJNaLcl1U
h9CYHQgAhW0ZGSJZA9yZmoehX8pya7ceC2yx43u8tF7XehnZB4F8M4KuYj+WWPBf
e5XXehH+M4lv2LggQYFAoVOZtIvkIfKeiyYa67R5SHd0dgKATCWBvVCLg0JiFFil
DuGffTyg6C5bZA4S+Q812aGk1XJsmycaDgwTHwb1fMTWvr+AUoAWGH4fWOvt2WtX
6qw/gaEg3NdNAgMgWzCr5hJ2WJCEtA969vSm1vFPG6SvLxHnrLsMYhOkUCiePE4h
GfbSce0UsS7U/S0qPU/a4l/05pWaRoGgu82sOvepjW48lqOFvsIuuaTcGs2+amJ7
H+J2nbsIdT0rPC58X4TKumZDsOZcjw==
=sUyb
-----END PGP SIGNATURE-----

--8OlcYUwNPTX3vWXV--

