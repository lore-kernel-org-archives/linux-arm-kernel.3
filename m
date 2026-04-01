Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A57D2ED0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ba6VMDCu719GEeXE9oZuJ74eelHzZnLQkGyGOGQ0dTU=; b=W8ALNg2e86h6YKXGs4xR2ZC3Qz
	SAVPEtC5n9H5TRnwZ/PxtlXNFYjg4o4NKJ4yzcmvly02pu88j5JkKp9NtFx3bVZ6zukZS9C3kdL/k
	1OdMr2sijjC/Ie5n3AFncV0kjrEqeUVf4DjjyxNPmf6vLxRDn8/+X5iiDwvbs7yEGtZYKqXiQNdxc
	QInvXlSCZfxHsFl3FKQCQROj4dmj/l5vtX6WlcfHCWABcpVfy8hWcUjbiBvPJ2KoVqKufqDVPpC84
	Xu+epneASdmTCjPen3lcQFj/IfLC404fpmr4ZTAZZeXYpnK2Dp0m+y7DcVDVNK6/thuce/NPhecaM
	IARp2n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vj3-0000000FK7p-3VqV;
	Wed, 01 Apr 2026 13:35:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vj3-0000000FK7e-0bIv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 13:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ba6VMDCu719GEeXE9oZuJ74eelHzZnLQkGyGOGQ0dTU=; b=jzGGy8n4zWf/zajUDpY6ZPtf3H
	txiLJl7Yzsg4FnoXbPdDcEDnA2KwM22qTxS5b9fZ0qzSOZ090mQwDbzBxD+e/sMxKQx+URvfeTOvm
	uUJ9FR77xWVUHfftxyrn8h3k4b/MpwQkJfKys8OaY7/UHSqRniIhFb+BbXb09AON4ZUZH9Tvq8R/u
	GEaxgFbsMdlFy2yYdtNUOPKAxQiwZtG1cO98NFFn5uym2nzChHHNUiuMNLW3xbSl9S9x44d62m6LM
	Mk5L0BJnYuXw+IHI42hAkyFlrfcQaYGdnAgAt9txZhs/nre5aaeH8iQU3T5yaDDP6Dz6ePQLX9Sgt
	Qkr9RBcg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7viz-00000000TUP-45Rz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B798408A1;
	Wed,  1 Apr 2026 13:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF9EC116C6;
	Wed,  1 Apr 2026 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775050511;
	bh=2TAiYxjzVwdqX//M0tim4X32TxlCbCXsOAveLah/O3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcM/v+IFj6IIz8mSM13m6fQRWoKjz3T3opLQesDd1Z+ZC9PoV4La0283nxpxB9Oo4
	 /2TRb1M8hfSxS8sbSONGcKVEsJyQxRK8MXIBAV5zC/VfYC7tVxztfehS7EwbTFflfB
	 Wizi9VyGmvSvFf+6lsHR+zKTGnYizea5QPOrLBMLsAuhX0nutizORO4CwCtHgowehq
	 m2hXmRxrrJUbiKoUkBcl32rFlujrY7g3fLnqFocajl/UAfNbSMEDQFZdRbV/PoSC2/
	 tr13xLcdMemmVKWLIyKAUrmyUkA6KhJ4EU/0OlOVcySGIaER3DA93gZ7wkW+55F2F2
	 mFPQxguyJ5nRA==
Date: Wed, 1 Apr 2026 14:35:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 11/38] KVM: arm64: Split teardown hypercall into two
 phases
Message-ID: <ab5383dd-b3c9-4f08-97fe-b96d14850dd5@sirena.org.uk>
References: <20260330144841.26181-1-will@kernel.org>
 <20260330144841.26181-12-will@kernel.org>
 <0cf948e9-be64-4c75-97f8-a560442eb5d2@sirena.org.uk>
 <acwfcFytYX7eHAUZ@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HMblpO9oyn5+ZS2O"
Content-Disposition: inline
In-Reply-To: <acwfcFytYX7eHAUZ@willie-the-truck>
X-Cookie: "Yo baby yo baby yo."
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_143514_361904_C08DBB6E 
X-CRM114-Status: GOOD (  12.01  )
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


--HMblpO9oyn5+ZS2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 08:24:32PM +0100, Will Deacon wrote:
> On Tue, Mar 31, 2026 at 08:15:40PM +0100, Mark Brown wrote:

> > We've started seeing WARN_ON()s generated in -next on N1DSP when running
> > kvm-unit-tests under pKVM:

> > 1821 23:03:59.721620  <4>[   17.558270] ------------[ cut here ]------------
> > 1822 23:03:59.725053  <4>[   17.558274] WARNING: arch/arm64/kvm/pkvm.c:373 at __pkvm_pgtable_stage2_unshare+0xbc/0xfc, CPU#3: qemu-system-aar/390

> Aha! That's probably the thing I tried to fix today. Please can you try
> these patches on top?

> https://lore.kernel.org/r/20260331155056.28220-1-will@kernel.org

Yes, those seem to stop the warnings showing up.

--HMblpO9oyn5+ZS2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNHwkACgkQJNaLcl1U
h9B31wf+Ml5vYmGKXL7N1xiYL/XeWbiWf7r2JRHRkjOJyiyzZiwO3OnrLa0cx3qB
spVaiKrjPytYNV5eRyswYHvA08EkE6szcvY+D/zrDCow/y9AFnewd7PPaT5+OhBP
hZRO7Au/xkZcU7E0k6FQP3WHviUtYpcNUxFU4X563qagE2makCX0DVDOT0Nr3696
A0qom3PNXvZdAtWnaTzFtoPMwE+KmmJhIXM6R7RoXEFNFaw5uXaJAf4Bcx6Z8/8U
ML1v86MQNx+zRfO4Zup4Vl2nw7k2d7AOygbZp5/5WDCBCyvX4AbmvAaeLXMkUUor
pCCV+EU1wVK+7QFHvo1YqNh5TcQE/g==
=QqUb
-----END PGP SIGNATURE-----

--HMblpO9oyn5+ZS2O--

