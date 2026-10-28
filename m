Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD64606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/HHtzcW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+Ku+Dfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PjhlO6bW9+MSarY6wTfU4M87BNvgFcP6/LMpd2feJeY=; b=I/HHtzcWSTd5A9mpfvML8ElSgm
	vhXw8MbTKjzPy4nlp2j11ff+krsxmGcenCeu+hBNig2VHhm4dSmZ1Fk0idUkPVJMO9hO4YIgNHzer
	a+OE5lw76Rb/UsfHFm+lxvM81od2IH6sUzQZ3eNM8ixHJG4DtTU8R6gCMSgz4OH2DnpZyKiGVyDSX
	vwhTOShIMRMxU4mwoO9cNh7Mx7CsDX5DzIpnOoPMc2Fg7wokO8um+qB5i+V46DmGTIlrWimvLO2RE
	kUUr9DgtWs0R7FCYMUmX56WN92C42Am/Bb/Q9BEb8dReoRpnRr658bvy8OtujMycKuKWjDQcpxpmV
	SzJmx7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8aS-00000007lK9-0AKh;
	Wed, 28 Oct 2026 18:41:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8aQ-00000007lJy-0fBR;
	Wed, 28 Oct 2026 18:41:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E12060120;
	Wed, 28 Oct 2026 18:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072BD1F01825;
	Wed, 28 Oct 2026 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793212880;
	bh=PjhlO6bW9+MSarY6wTfU4M87BNvgFcP6/LMpd2feJeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I+Ku+Dfy9D1rIjDAH01vQDIriIj8Zw42Ol3KsnQQisCDSNUzpgxOB5hpqZiFAyjVs
	 YGr7Uzn63H4DUG+31UyZfBsNIl4kpzI2WFUDE0Y7FcYO2J2WJABgafFjrjQvasOXZw
	 ZuEf6nx60b958GRx2QgfzkwisLaoa3x79rs8XurGiU85IAOF5Dhj56+/9KOaikiQkz
	 PlphaYIDP1LHurqocO+l0yWviduSuuWAoRTEatuKhQkA47rqoPT/iKhPaO+fVK/Yd3
	 RhECPtQPienO90RuwfI54HwGQdVKukGOO9MmBS6sRPHB6Bx+zFakp3lCKqRBSknDyi
	 dc4Q326CsbINg==
Date: Wed, 28 Oct 2026 18:41:13 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Message-ID: <85c7637d-f5a8-4d65-a5a7-40b3984094c8@sirena.org.uk>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
 <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ide9tbszk81fwOPE"
Content-Disposition: inline
In-Reply-To: <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Cookie: Pushing 30 is exercise enough.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ide9tbszk81fwOPE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:43:12PM -0300, Iv=E1n Ezequiel Rodriguez wrote:
> copy_thread() can map a CLONE_VM GCS and still return 0. A later
> copy_process() failure calls exit_thread(), but arm64 did not
> implement it, so the VMA stayed in the parent's mm. Wire
> HAVE_EXIT_THREAD to gcs_free().

One extremely minor nit below, I verified that this fails with the
current kernel and that the kernel change causes it to pass so with or
without dealing with that:

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

> @@ -328,6 +335,7 @@ static int copy_thread_gcs(struct task_struct *p,
>  {
>  	return 0;
>  }
> +static void gcs_reset_thread(struct task_struct *task) { }
> =20

This looks like there's a missing blank line but it fits in with the
missing blank before the stub for copy_thread_gcs().  Possibly slightly
neater to put this before there next to the similar flush_gcs() stub but
meh.

--ide9tbszk81fwOPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriQcgACgkQJNaLcl1U
h9D9+wf/SHEa+LP5AxakY5iKXz8OEmHkAD3fFP8gBmCVPhIqGctmgQHKjOqdW7kP
xOfXg/CJU4L6nYqnyiGhiXDZ8vgIWOIJ1kX+6H65vbIQi+Z5BWDuL9V/4tXG+Ue5
vm493cyci8zp1g/g1ygcvRbPJc622QWP61VWAy1gUnN2IA8ix6/Sdj28+/QAcJ9y
IcrkwKGQuuJyU2xU/3EIpmW4Y3tL09b8/kunnn1SbvyGTvYRLCc/K2TTdtH+T0Wi
OvPhpmGzjGQv5OGNX4aHkIW5tx/wqUKcSfqb70IyHGqD8I8srKRZ2UyQNZ9+mU2a
0Eh6URoZuIVQGFrVDFvxcZqHfpC1CA==
=Yq1h
-----END PGP SIGNATURE-----

--ide9tbszk81fwOPE--

