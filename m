Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C30CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIjK8L0zmx3vzH4+wepEoghbzlgv5uJqUNT8+cEOMRw=; b=lNDSDmuFwhi1NSm6oArGdh0Jv+
	jBM+WqRgdSyx3hMM8GUEn1bAA370q4z58igRMlVh6noaVj78FqKBraqSDYUTmqXr0rI4GW1N5eLn9
	pmOFjixYeS+tuQqIF+l/RQUCQWpbHtrXRm3C5VbFE+Kw1eN38j6Z55BIKnhKvj8KHHO+NtE4XMNlC
	2Sj7phuuH2nXGkt4ZoQZOwIrsBka3nhC8si5nlzmkMAgEFXsDeBj6XzFErOi561i2pcFvy3YhcBF3
	0/jfEFzF5I6QAHF1kiaCxQpNU9GWXcOU4GtaNMAt7z9bw5AKcLxo56t6ex2pQQPXmARhr4ZXHwHJq
	i87PdLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2B0Z-00000002j4u-3CT7;
	Fri, 26 Sep 2025 16:09:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2B0Y-00000002j42-1bMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 16:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67AAA61EBE;
	Fri, 26 Sep 2025 16:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD350C4CEF4;
	Fri, 26 Sep 2025 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758902957;
	bh=vIjK8L0zmx3vzH4+wepEoghbzlgv5uJqUNT8+cEOMRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GS6E0EXmr6Vld7SgTsA6FsDXzrFcXM4Yi1Aq10B9ivoONfTJAD+oQn55Ab6o7OTdk
	 4MF14UppV3queoLGGMs0YlliihhIJFCM7yLwRQAvUivnBPazOLDz3XhXsDw0EoyBu8
	 LfjN2t0HyCSMSO8I7uXdEjyPIDGLu/8IVAEReVyi+McMCXO2lJ64JmkhcvaMr0aHxe
	 0kKRLwgcqk6k6prx621TO8IsOjicUaSx6WvhusVX66hrawa8z2UTBZoXGlArt6mKEH
	 d98+Gg5z1RTlFQPwQu6YNyYUKrj6gNRM+1pJr33Qd/oVE2ARxEvXfUxEUODVPiTS17
	 Dxj7TrI8u8MhA==
Date: Fri, 26 Sep 2025 17:09:08 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
	"nsz@port70.net" <nsz@port70.net>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"dalias@libc.org" <dalias@libc.org>,
	"jeffxu@google.com" <jeffxu@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"yury.khrustalev@arm.com" <yury.khrustalev@arm.com>,
	"wilco.dijkstra@arm.com" <wilco.dijkstra@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"codonell@redhat.com" <codonell@redhat.com>,
	"libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Message-ID: <5397025d-7528-4b9c-b38d-b843ab004f47@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <760447dc3e5805bf5668e80a94bf32356e2eb2d3.camel@intel.com>
 <8aab0f36-52ad-4fd6-98c3-bcdba45dbe16@sirena.org.uk>
 <ac0ceb09ffaeb1f0925b61ed1b82ee6475df2368.camel@intel.com>
 <604190c7-5931-4e74-a1c9-467e52d3001b@sirena.org.uk>
 <eab692794cbc82080b708c581efd5973b6004be0.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptvvVk1i1ZxvsU15"
Content-Disposition: inline
In-Reply-To: <eab692794cbc82080b708c581efd5973b6004be0.camel@intel.com>
X-Cookie: Your canceled check is your receipt.
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


--ptvvVk1i1ZxvsU15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 26, 2025 at 03:46:26PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2025-09-26 at 01:44 +0100, Mark Brown wrote:

> > I agree it seems clearly better from a security point of view to have
> > writable shadow stacks than none at all, I don't think there's much
> > argument there other than the concerns about the memory consumption
> > and performance tradeoffs.

> IIRC the WRSS equivalent works the same for ARM where you need to use a
> special instruction, right? So we are not talking about full writable

Yes, it's GCSSTR for arm64.

> shadow stacks that could get attacked from any overflow, rather,
> limited spots that have the WRSS (or similar) instruction. In the
> presence of forward edge CFI, we might be able to worry less about
> attackers being able to actually reach it? Still not quite as locked
> down as having it disabled, but maybe not such a huge gap compared to
> the mmap/munmap() stuff that is the alternative we are weighing.

Agreed, as I said it's a definite win still - just not quite as strong.

--ptvvVk1i1ZxvsU15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWuqQACgkQJNaLcl1U
h9C0tQf/bJT4tz0mWt/tJVu1pg6AwGbm5/vbqNjvsiVUkegN4TV1NVKgmCA9mnG8
YhPNEYEZ0H8rdL3+zsXN7nFrlzwdh8L/+Kds+ktFeh+86DSA9tAb9v8paIU8Z2Mo
rqW11WJ5+znEADjTcS/dr3Dos9jru2S9z9VOdtNvX7/aaXn5XZEsjPto3ecwL+tl
vFkliUWV/ZgRYV5r5FUBiVldrfHZoUpbe1sL/qPxan+hNnXCteaOhqP4hmO71BHt
18HbfNDN+tswNVbbWCzdi1sUo2/2YJ+ueL0A/rKqL+ns8v9YWThVOJgkSh22Yy6i
Qq1dnnSRhfstXWIi/s4XBmlh6QEwCA==
=sqXy
-----END PGP SIGNATURE-----

--ptvvVk1i1ZxvsU15--

