Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C14BC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGnf2cZEXZo+BToLGnE37FiUuHuPqvYT8KVlteX9Ezk=; b=yBIJFo92IRnBcDiSmPFrGOeRLt
	3448Szr4RPNpp5BwLC3LmgBhdY4NVlCpIG3PGELX8+Wd59TOwfxfLSF7bxCBl0R+CINzZ7GAsHl0Z
	qx27pwobAlw2FUI9YTRsZa4MLGBuDrRC8OEiBv0Y9hxA9WFt2XpQM2mOTo5igAw+d5Yi8xaJyfH09
	X65xK1iZx9PmwVChJwU57DezNR5HyIXSGzmp9+RtlMpkO6VhvHjkCHXk1y5L4solKDs3xCHvbgGLt
	tQIpxkjR8s3P6pGz+XOgYl8Tg1QY1FiQOgAWgtbBmHaUid7lI1ZT96ewXEyaRHjlwuG5mCjXFHfys
	gG5vSqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRjw-0000000DkST-0Mcp;
	Fri, 21 Aug 2026 16:05:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRjt-0000000DkSH-4BtM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:05:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4FEB4039C;
	Fri, 21 Aug 2026 16:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2111E1F000E9;
	Fri, 21 Aug 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787328305;
	bh=mGnf2cZEXZo+BToLGnE37FiUuHuPqvYT8KVlteX9Ezk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kItUVKmt/8LMRL7P+pkPTRGn0ZuZ+1hM9+2UPinkTagoA1AvahXokdmPqwORJUPXb
	 jtzLReqX8Q1JpfY3lDUFz6O0KKOuSo4eH/BGUWlhxKDqkm55Osr1WHcaW0RL/itsEL
	 ++ICNuOixUzkqSd/tC5p3itCxn20v8Xcw5suPWD1+Nn2eG68OYBg2tahbIiCTHwZRj
	 PlqIf0fDdyb9Fk7vsbjGeFE4KrIWDdOks7zxgWkKPg+w69cRdXXyn2l31TwY/6zg9I
	 mzGOPZaRybWJYzHFuZgkXk7qiP+Dl19TJVnYkk9iOrn9EYmqAHgX+coCRdLjkdF4tX
	 YUCvCUQnJpCLQ==
Date: Fri, 21 Aug 2026 17:04:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
Message-ID: <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5tB8uJ6EHv0Zftr"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-3-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.
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


--q5tB8uJ6EHv0Zftr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 03:15:50PM +0100, Muhammad Usama Anjum wrote:
> Most of the remaining MTE tests set a TAP plan and emit results without
> first printing the TAP version header. Direct execution therefore starts
> with a plan such as "1..20" instead of "TAP version 13".
>=20
> Print the header in every remaining MTE test that is missing it. Do so
> before setup and prerequisite checks so early failures and whole-test
> skips also retain the header.
>=20
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Newly introduced. This is an output-format consistency change and does
> not fix duplicated output or alter test execution behavior.

This should probably just be a single patch with patch 1.

--q5tB8uJ6EHv0Zftr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIdyoACgkQJNaLcl1U
h9AtRAf9FraLNy5r6DRRaaK6WNymSBVRB6v8lro0MTuUtEKZbEpRqy91F4I1kMeS
Gwa1jppwkI4dRDB2lk2zDOd+prsyT1uJu33HyMGwT3MCvNy57O6KQ8XLzjQJDZDI
qEAr5f6zdn08OZ8B08Q0CO82ZN32POfUGD8S4UA546FB+WFmA2Qah2U6oTg6jgSf
ee75yurCMzochaNuFBGUXg0MsWaXtuQxsteEcPhj3hIrI2JOmKdzkOXxjdU0ea8y
ZHP6Ko59utXjXq/0r2WRjSTs8WEeu2uCqdmZ1YvjibXFwaweaXZFlqF2LU2+x6hV
yV2r0E2HpNPjWUiHYRrksoN/WRV5pw==
=wVtU
-----END PGP SIGNATURE-----

--q5tB8uJ6EHv0Zftr--

