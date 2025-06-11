Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241B1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZclaEQ54SIk1pJO3CjsIkJLOnCU2npqOihuIG2/ylug=; b=U7DapLhKgV0QP9gwMqaY6wfHfe
	RFaSYIUwIP4FXtBcBYLgLX0zBfMSc+P0Aed7f7j4eq3vT/PnnEV1K3sfJ/Ahx51KR7ZZTMrlpN9qi
	UF4iZ6H91wZTuxG346Kqp6yov5/5/xDHCXnm4oj70y0R6mzNVTyC3kTHpjCUuuSXrWKX1BkRJquLa
	r4PhwQf/Yj2n/jsL7x6PYMKB0nHZPF69h/R5Awzccx/8/BYn3zxo6yUOwamH1453AfmKuFLfUHcyM
	L7ZwjAzSGNNMKpFlcXNCPZwg/AAPfX2Yu4a7WS+TQDW5XAvHqvES6eYZ48IQKac77wLvmKhTdCWW1
	1UVG1HXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOKw-0000000AcBJ-2GZn;
	Wed, 11 Jun 2025 16:30:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLE8-00000009vNI-22pL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE43644C5C;
	Wed, 11 Jun 2025 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F178C4CEF1;
	Wed, 11 Jun 2025 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749647447;
	bh=Z2p+EaCVvCC5rA59Eoy55kVZTXGrjuA8oN2F6ylO3Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rc8Ml1jNJ8Odiy4dTo8yxSiK7T7KD4cboVLSHQDW6uxl8b/tDTrFh8k3+nMtfbtBw
	 0WgK6bv9kgN+W/zsDLoXZJlQS7DHDENpGzjid/XsAAGB6DcR+xXMcTPc/tG4E1ATru
	 UQpNfjLkgEUtMcaY+MTBA3Pid+4NOpfgZpJXcZqVnoB0FtvkVzJZMdLnZynFVNKo0l
	 XXsq1n4ojRijNMiIBbVLXCw148OL+6f8J7TTxJQO5bgyckGTxznCmDgysNR+B6OKcA
	 IaG7GDcUPe+jdqy4eTOLW5yRxE9etA4wqu4rTPVfZk1arM9wPxIEaf19QtNCCHaNnT
	 4X5zusZzPKG6Q==
Date: Wed, 11 Jun 2025 14:10:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] kselftest/arm64/mte: preparation for mte store
 only test
Message-ID: <87931a27-36e4-4c6f-b97c-206493ec3da0@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJDJd5eGbyHdjCVv"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-7-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_061048_544341_9572AED7 
X-CRM114-Status: GOOD (  12.55  )
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


--TJDJd5eGbyHdjCVv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:48:01AM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
>=20
> This patch is preparation for testing FEAT_MTE_STORE_ONLY
> It shouldn't change test result.

Not verified that that's the case but from inspection:

Reviewed-by: Mark Brown <broonie@kernel.org>

> -	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
> +	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
>  	item =3D ARRAY_SIZE(sizes);

I was going to say on the other series that the boolean flags are kind
of awkward from a readability point of view, but equally it doesn't feel
worth it to make these arguments enums so I'll just mention it but it's
fine either way.

--TJDJd5eGbyHdjCVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJgE8ACgkQJNaLcl1U
h9CKygf+OtfW9Ek6HiQhh2kbGskJ+4mpCZoWK4EZTQDwrvnd7WBe0Ax4Lpa9Ond9
BBOt6hXXbnLMLnQv4s3p+SfX/bt8+tlN1sS//m1N7ciUSBKoUpJvc1nEJNtd6ECZ
rIWIiqMO93wMQoDTTX2/YVLm9ybiH6pc6yIALEdmzFIPOCdUaFF1xynz+FTRvINp
3jLrqhxPmumnhRaGuSf0XYp5EzLPT6qeSa56UGFCg8Uye5CZLzHGujzqV8ZtyVwY
UkYWCpxXvXAK14XzMqjfm56sJ76w0aT3WTJGGwXVG3pxXQ54wS5owjeZS/U7lbDX
0PqEG0JDWCo8VeRv9K0o4htJdHtIrA==
=VY3F
-----END PGP SIGNATURE-----

--TJDJd5eGbyHdjCVv--

