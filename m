Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919CCC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLmpQy10LAf59a6kgySBlE1Nh56Tj3sgrogpWbPQDNY=; b=G78ZwS367n4ws3yZGCJQuUGNWN
	xzZyL4ayq8Amoe2qDHeIpgRabL5WdZIu2xAxCgsY2NR+Wq71kr+5DnJPRAWAxZi4uRKPeHMGoQtoC
	P1hsJEz9/z98ED51RvBbue5Rjag4tWu7v500BvqWJILKhXmbGkPUT5PkYHQVRr8hTB8UyC/0gHrin
	XLr7/SoIUr6U98y8EBDY0BmASF4XUhHS000WzOU6zm7z2O4C/A0wZPx6Iv0AvQ/kOx3SdCHhePGVZ
	TxhdPwPd7NsA2Xb/QhHhSJ0hKqYBQ0ZAyBQE9ZwcW/Z4M9b92GyTVKYSuKXrsm1d/QEiEHpDxdvAP
	v5ougXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3ev-00000007nkV-1poU;
	Tue, 10 Jun 2025 18:25:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0nO-00000007Hv6-1car
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OLmpQy10LAf59a6kgySBlE1Nh56Tj3sgrogpWbPQDNY=; b=QlVd4QNEhnQNozsmr4Z8K1I5tN
	PXy0oRZCupeWoJjoz3bz/mevDoZUD6oJ6sP2tYNuhuJl4Nvw5j2QnuqFlPWGouHRKpM9UFln7Nz+m
	WL9Z4Ndon10l0h8HAhQbybt0RbFiULGVU/wh+j9LWtzu5XhE0sbFGBUgtKvj2CQ/td6vx9awJh/2B
	XF4vDXObaxpczvfe1taLYchGOC5I1o+2V9/KA5X6bVE5ifI8E89zwxPw5V0RZ+4Vsvv/NumHwK5QF
	X0jmX3ZAfLolzHmLAEd53zwlp6iTzn2qWK9nWpE0rg8fi1qKDYbRbQOWLSS09IrrNY6WDpPfcLRe2
	JefFM/Ww==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0nM-00000001tXI-1y8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC21E43B6F;
	Tue, 10 Jun 2025 15:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B73C4CEED;
	Tue, 10 Jun 2025 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749568904;
	bh=ZDPC+Zvhv6bvCgKo7qyJDoaCmns1b7BJIKlJTcGDLPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OB/itAkOa1IIGbT5iloMMpzs9GpLqPzU8C6RD284AUu2XEPIzb87tI2EbWXRV4v2R
	 nAKJM5GpUwWe1h39l3K8pRHzrzjlyRAohuGTZooi6gJ3PgrwtIDFsBjVCj0CsvzBHt
	 ANvbIBFfgU540mG4rHI3goAEzm2+G8Vd/TU6NvcimXNzh9qU3P0E1afzTrmbohDn4T
	 JCtYxHX7vA8jngp7QKTb1hOCHX2buD+wWlkZfgjtrNdSJ6JJ4jh9P8n76/4g5tBO5l
	 rGy+nLcpLeX4tbMAR6P0mYsFjtzDCM/cT3cNlp2jUNn/ZYJAd0LZ4xg4KHEpzFYwNY
	 scDw4zCxazlSw==
Date: Tue, 10 Jun 2025 16:21:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/6] kselftest/arm64/mte: preparation for mtefar test
Message-ID: <6b13e414-9377-4806-abd5-fdebda6c14f2@sirena.org.uk>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GOU5km0pmcdcSUm"
Content-Disposition: inline
In-Reply-To: <20250610150144.2523945-5-yeoreum.yun@arm.com>
X-Cookie: When in doubt, follow your heart.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_162148_686255_DBABD633 
X-CRM114-Status: GOOD (  17.18  )
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


--+GOU5km0pmcdcSUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 04:01:42PM +0100, Yeoreum Yun wrote:
> If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault ad=
dress
> are preserved in response to synchronous tag check faults (SEGV_MTESERR).
>=20
> This patch is preparation for testing FEAT_MTE_TAGGED_FAR.
> It shouldn't change the test result.

I'm not clear from the above what the change is intended to do (ie, how
does it prepare for testing FEAT_MTE_TAGGED_FAR).  I think this could
usefully be split out into multiple commits (eg, adding logging of the
additional si_ fields separately, or splitting the renaming MT_CLEAR_TAG
to MT_CLEAR_TAGS), it's kind of hard to review as is.

> @@ -45,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, v=
oid *uc)
>  		}
>  		/* Compare the context for precise error */
>  		else if (si->si_code =3D=3D SEGV_MTESERR) {
> +		 	if ((!mtefar_support && si_atag) || (si_atag !=3D MT_FETCH_ATAG(cur_=
mte_cxt.trig_addr))) {
> +			  ksft_print_msg("Invalid MTE synchronous exception caught for addres=
s tag! si_tag=3D%x, si_atag: %x\n", si_tag, si_atag);
> +			  exit(1);
> +			}

We should really exit with a kselftest error rather than just a number,
though I see this is just copying the existing style for the file so
*shrug*.

--+GOU5km0pmcdcSUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhITYIACgkQJNaLcl1U
h9A4kgf/QplQ4dWFT6f/xxxKyypU2qtRmPJRXs/iiAORuXfp1kEonCeiT4uAi3+F
M3uLr8ISj6doJQcRo6YA5czQ+3uwL+iB35MEWJPxuPgdE4Fedxytn/9fs9A1FTfs
zft71Zjl+3xUdSR8uWJeCnwvYRnI2FPQmSx6HQRVlCOQ02FC8sLbsgTikN+H5+uZ
ojjS49eRV7qEd+Oj7vQ/BojjxQr0OSGmMkox964ZhpiBKjIgjg78aA9OsYBy00Mb
WzVXqYbANk3Xx8oMn7Ei6K9OIDuPacGYZOAZqF28BEPhCwnoHgLicOTFlIh5M+O0
XXSh6nKKo3EbB6cVs/iL2jv+rGT0yw==
=8x/9
-----END PGP SIGNATURE-----

--+GOU5km0pmcdcSUm--

