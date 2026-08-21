Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1A3C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NeHBJUd51yUtarGVxbHliftzknjEZ2v7UACWXEhCdc=; b=EufIkM+Y0aUailv+a1zk6bfH5n
	wgcG9sCDnstY4IBZ0ePPiMvB8rVXiXAK2CttGFlh9S/Ja8OSiIwAYanzZ3V6j53As6zLQSzPFKXQ/
	KUw1IpWbTIEoDbziq1Tr57NSfcnZg/RhfCXxnlFKuXxjqvqt/Y/z56vnAy6gTbJNz/zjOSJo2Ju11
	/Yqx8+UY6gDG4mLQ9mKEUakWzRC1r5jYw8rHzGF+sqon7SAQRhCfoq3a4e1VV71oIOZd/QPQWriQB
	6nKaO9ALVxan7GlqMhTVVFEV8/pAX7d+NjwDaSTRXUnPfRGpJF1+oynB0otarWK8PXCzlgR/NDJ9g
	EulSJXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxXay-0000000E6ST-1sUs;
	Fri, 21 Aug 2026 22:20:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxXaw-0000000E6SN-3YSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 22:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0874600E2;
	Fri, 21 Aug 2026 22:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE52F1F000E9;
	Fri, 21 Aug 2026 22:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787350776;
	bh=0NeHBJUd51yUtarGVxbHliftzknjEZ2v7UACWXEhCdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZmAsk+SSUHDa7FIVusSqVMl28Vnrrjcs9YyxiPH2/vuDK3RQT7DL/2d6lIKLnpK2T
	 VQoX+P/voxQP5Y5DapVxuSUAL3z6z/Nao/VRmnOTUOaIgmcUCTpUNvsDblcJiQyEtQ
	 tXL/MDjl9MQLO/inaadHMNglRayg4DU4K+iJ1aVDEYAlT0rFWfYM8o5rc9Rvdg+G00
	 JzuLyTltWLp6Ta1TXHZ8SrIxAda4enCwzjA/tY1LsUt0QfoqbhXJEZgTH752He90yu
	 RRvwfEY2gMRd/J/ZC1w11UEHIrG3qJ+N+iTNO88F8As4wMBVWz4EGbq3Wr9jwb0NKr
	 LZxQitHNf6cAQ==
Date: Fri, 21 Aug 2026 23:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <02b970b2-dbd9-490f-bfc0-be10708e0f9b@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-6-9105afd828ac@kernel.org>
 <vdmz43ogvmwu4liilfqzdrgsf5v765bucl7mybhfdxj7yrywkd@5mssukdegdwg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4LzlXfWWvj49V3N"
Content-Disposition: inline
In-Reply-To: <vdmz43ogvmwu4liilfqzdrgsf5v765bucl7mybhfdxj7yrywkd@5mssukdegdwg>
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


--h4LzlXfWWvj49V3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 03:32:58PM +0100, Wei-Lin Chang wrote:
> On Wed, Aug 12, 2026 at 08:12:05PM +0100, Mark Brown wrote:

> > +/*
> > + * A subset of the pseudocode ELFromSPSR(), validity checks are
> > + * assumed to have been done in code that is not GCS specific.
> > + */
> > +static inline int exlock_el_from_spsr(u64 spsr)
> > +{
> > +	return FIELD_GET(GENMASK(3, 2), spsr);
> > +}

> It feels a bit odd to me to have this function named exlock specific, as
> it's just spsr_to_el, right?

As the comment mentions it's not quite that - ELFromSPSR() in the
pseudocode has rather more going on in it that I'd managed to convince
myself wasn't relevant in this specific context.  I didn't want to give
it a name that would cause someone to think it did the full thing and
trip them up using it in a different context where those things do
matter.  I do agree that this results in awkward naming.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--h4LzlXfWWvj49V3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIzvEACgkQJNaLcl1U
h9BZIwf/ba+nE8Vy9gULofY3/WFN8ZxH4XRxW6e/DbaSGPJBBf2HHUHVp8/s5DLk
oZUJmCtk/wioY00bc1GOA6wZ0tK8mPMpqB1suUh2OfsA39XPZc3uSIaP3Sc74Mwq
9h3hysTkO/9Ne86KmOkBq2Plkjc3M1fZok/SEgdkXW0mw5q3bfczzS9J+XaUZzN4
4liLWN5tx1n5E7tFE8f9UTU17cufCZGuCCWjOhBXR0iilRj6uvenzU1ioVpi7Z3g
HDT/zdt1sylOzCwoKOWPe8mK0EQfTZSRgpJowSWzBhoPq4+VR3VmOd49XeFy+vzC
uld3QEPfmTg0AP56dErhncG/Q2yZ8A==
=qOw0
-----END PGP SIGNATURE-----

--h4LzlXfWWvj49V3N--

