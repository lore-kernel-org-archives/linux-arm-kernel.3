Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D0CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mpVefq1UNY1SGKUfN3+hAjz1yzcYY5QGHd4Xt4Xl8U=; b=cAr7ZN6d5nYlUtQMfZaohJZ1iD
	UQyfru8MBH6dJSUzUnhnSmOlSz0q8PcGaym+tIQDuL70/AYCIoKxBxbe6jv0RQVvPRAH2c28sMfg5
	80k4BfvW8BWAEbc3zWZxidMqtqANxcs3n96ip50nthBDaDgyOsZXAS1aJ0TGwzOmYubwyUI+M1Dfb
	+ZaTjJQwPeRqp/dq/KyFdVfZ0PpxJJbhLFDOlkmMNbrnq+RU7WLvBCtoidW/6V2EHchuk2oANT9OI
	NhaDdDOoLDM6cC2QpPo2pAsfFzzMr7jSHe7k904qDvUdJbiOt5XUqsYCXxuOAc43vAAP76W2zglqZ
	Mn9oG1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgzs-0000000F0dE-1NzE;
	Sun, 16 Nov 2025 17:57:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgzp-0000000F0ct-32kE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 17:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B8A44173C;
	Sun, 16 Nov 2025 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BBEC2BC86;
	Sun, 16 Nov 2025 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763315823;
	bh=ZxE3pNt+j8NnD/nwSAGBGZZ9fMcR+a45aZUW2GrPMWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiFT6WYDKlo6o+0ZAB3YCoCQ7KRfXxw2KwQCgy6hGe06+n47NwrARhHLURjrvb6cP
	 EtuVYS91t5EZb9/Y/EoAUy2C3LAitKNKCeFDeL1eU+EdkBuo43ZGFjP3Y5rq8IaOTh
	 HkBaoGaFoRBOSw3zLKBPN/xQo8hhpWN7pn9GQXSf3zhKkkkfbAGbNaw60Hj0R2wwQq
	 6yI51muHfpKcHJSHEFVpRmEiNq0qNjcl7A9CTRwXwKRDWO+n/LqqVoAjL6qZkv5n/N
	 05YbwQvaznLMvq/3r2ihUknxu/XTLrxWdwmg0uyxUV1KMFfz0h0+oaQpI8dqg81lik
	 ae5r/quOV8hdw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 926DC1ACCC98; Sun, 16 Nov 2025 17:56:59 +0000 (GMT)
Date: Sun, 16 Nov 2025 17:56:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, kernel-dev@igalia.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
Message-ID: <aRoQa80RE_3yAoTI@sirena.co.uk>
References: <20251104174518.11783-1-wahrenst@gmx.net>
 <cbb49407-5b66-409d-8a0b-260e50932156@gmx.net>
 <aRnXMzuxPXfmRf30@sirena.co.uk>
 <a56e3318-b29f-438c-9da3-556555d633d8@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q1coYmeJbj4KUmzF"
Content-Disposition: inline
In-Reply-To: <a56e3318-b29f-438c-9da3-556555d633d8@broadcom.com>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_095705_785590_5BCBC427 
X-CRM114-Status: GOOD (  15.59  )
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


--Q1coYmeJbj4KUmzF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 16, 2025 at 09:14:39AM -0800, Florian Fainelli wrote:
> On 11/16/2025 5:52 AM, Mark Brown wrote:

> > Yes, it seems to work.  Given that this patch was applied I had been
> > expecting it to show up in -next but that doesn't seem to be the case?

> It was applied on Nov 14th:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=020e792ca39b

Ah, that's the pull request you sent with it in getting pulled in to the
main SoC tree.  I was expecting your tree to be in -next directly as
well (a lot of individual SoC trees are) so when you applied it on the
4th it'd start appearing.

--Q1coYmeJbj4KUmzF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkaEGcACgkQJNaLcl1U
h9C96Af/YYarba05504b/6sNRndf0YZFn4F5BDqYKYBjfErEJxbNy0p9du03R7af
bZB/vvgWOIWVugGHsvrttbMf0LFj8NwfJ6rF/ggexS6NYAefkzsDMeKkcN+i4Toj
YydYT8YR4KZ7G21hzEQsgXGeKKyH/oRXMGL4qfkMGb3qCijJws007aS2vL8X+gKL
tb8qHffDKOzT1hzlOA3odgl/iBnr2CJR2LMJYCpJ8NYj6IHHr0s2PRQQ81TwfILP
PdcKZYhGIlBTqcqWaqpadE6R9WfZT0RGkr5uSAkgbonk7HDtf4lhH5Z49A+PbFki
cQmUg/ab5cKx8aLLood1G2ETEwGqdA==
=aHhF
-----END PGP SIGNATURE-----

--Q1coYmeJbj4KUmzF--

