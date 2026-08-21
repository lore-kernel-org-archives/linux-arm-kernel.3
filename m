Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7479EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9a7nA8HCBztJhljVkb8PGWuj4EJLsv7QEFc+3RJczQ=; b=a5fQeLRwur575llbQl6ZG9q727
	8cOrcopghzSFUcY74t76qUTnAKd1g9b19qrxlAimWSnVSHnqsLHS6jgpGxtUCC4TL5zJeISD7THI9
	O1aPjoQAXFP/8XT03pGrgyfNYk5XEwbFt3Vlui+mJPB/WXqDO/QdCJJ71kGhQEmT38eUJM6ltqS+c
	nLdbO/w276McfiXGmca7cmAlW3dptfohgd3lrNQzk0pRO1wnjhltNzvrV/hfaIl2dG/htqNObU1PU
	/VwzS29mh+neX2tyn64fxxI9j9U3TMVyxOoSTMdaTMbOqEx5+TsnimA5MHKUdMwPsGHdJGmGBaOr+
	2QGY+mgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS0r-0000000DnNT-2s8V;
	Fri, 21 Aug 2026 16:22:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRzP-0000000DnHk-0iRc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:22:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC28C41B45;
	Fri, 21 Aug 2026 16:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BA61F000E9;
	Fri, 21 Aug 2026 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329266;
	bh=z9a7nA8HCBztJhljVkb8PGWuj4EJLsv7QEFc+3RJczQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fj4rOAqKMbpDe1PX6o7tuErN64y3dcGBFYXjgXLVkXPj53jWdwJjXYhUYfq2uOnJD
	 SlGd8QJ/IjorY2JFB9BdWQicF8bxvld/RPywOsf+T3W/AAQu1amrHrkWOFq8z3ntWG
	 lzjZO3JLUWXsZJY2yFKvnda1RtefU2ebxuoTsvOWZ8qWP1a6Esk2kF3eXo/GXz2NY3
	 fvMykXafeEkOaA72aQFLcxNypD7QHg1WGWK06Eq7PVeN6ngXCliD7rjqMxHlftEOGr
	 RL6P5S8Mm4EelHXsKwiJPeexoMpgvLj2soMlX3CHtN5NCa08DorvMp9mMAS3MJcu0I
	 hU9+JxuuuLrKw==
Date: Fri, 21 Aug 2026 17:21:01 +0100
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
Message-ID: <988acb8e-2918-4f88-99b8-a0b1a09f4793@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
 <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
 <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOfL+EvY5O+3PccB"
Content-Disposition: inline
In-Reply-To: <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
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


--EOfL+EvY5O+3PccB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 05:11:28PM +0100, Muhammad Usama Anjum wrote:
> On 21/08/2026 5:04 pm, Mark Brown wrote:

> > This should probably just be a single patch with patch 1.

> My idea here is that the first patch would get backported as that's
> true logs cleanup patch. (1024 lines of 1..1 are avoided with that).
> This patch wouldn't get backported. Its just formatting fixing of the
> output.

I'm not sure there's any problem with the extra backports, and it's a
spec correctness fix for the output which given the existing scope of
stable backports is probably reasonable.

--EOfL+EvY5O+3PccB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIeuwACgkQJNaLcl1U
h9DZ/wf/Uc7VZul9UkxOxkJdDi7toiHRQY4lb39/45K0JzG0P2THIgCDZBF2MJUC
K9g4ZUHZu2IHVZ+vN4LkY5wezIA8DGLPG0unPwlFaLcFIOWvkncf2+rnXP4DFWtI
5oZjsHYr3Uu4jHQWtmPcsbDyd3cMyMq05UmAs6XGVTQTatpxuw6K0Iaex4TOn4Fz
rwacvfLU3dcnWfG5va+gw+1O+mNQ7MxeiaBxO57p5tKNKyC42SN6qsoZSDSHrKaV
GAns01v4GRq+dQGnUEGXE5VkAz7r0eALazIEU92cwegIf3GhjS3aRxfNrVZ9Etuc
v/WNTRfdkwQJKPT4WTHV9KrDKoX1SQ==
=ntHK
-----END PGP SIGNATURE-----

--EOfL+EvY5O+3PccB--

