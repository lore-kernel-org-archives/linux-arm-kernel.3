Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC62E81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEPLR8cnMpgueHZG50gYeR0KoXwhGhymV94A/W+Z2Pk=; b=xindyDVatI2vwNlbYf5wU5MQY1
	cu3ATnpCo+PzAizV82oLeZobXXJfM+17BgkHA2gPELNxBBu0fA9TanC6QG/SP6kNSm+b66ynaaz/p
	OpcusMRVKmaGCGODw85rAhit6AWav/BRkV+h9G4KzVn0sjqGii9cGqXLWqqbk5n6VtMtjDM+YRzR2
	LVuUuEf6YC88sFD+z3T5ggVBsZuJovvbSQnmld7rJTBGzDqgPbnd6S+ghHgQoZIie1DQvjYS6BqKC
	lOgyREfYPuuT971uwHefoPjOhGEULSEtXFXRwDvaZ4IGbaoqZMp+zVJk/Lm98Z+pIUNlS7Xe0cygd
	UEssBLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs18J-00000006yBS-318T;
	Mon, 16 Feb 2026 16:07:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs183-00000006yAK-40La
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF1A36012B;
	Mon, 16 Feb 2026 16:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2960C19425;
	Mon, 16 Feb 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771258038;
	bh=hEPLR8cnMpgueHZG50gYeR0KoXwhGhymV94A/W+Z2Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7bhGQ4iHc5VxfRhPoZKY2dwSlBIf7egpLYIQgCKHFuqypDasXrw2FJNLPVe1tehz
	 Bb6abyCh4X8yjy+pJQqILtmAAGQQpP68mbn11T8fLDPR/+GaW9ujE7Nmfh0I6f+6Yd
	 7GnkjwGy7p7u/An1ROb+kpAheOvzK6SLpdqKRsujbbSrgybdu7xGkDtPyakDyx1gr2
	 aunERHIyXbyXkpWd09WaDGmffdeHBmSx8RGOW43INddzw8l/FjqOkOBZj8F0ernRwN
	 0cVBhXurMlzXAogKLNBhhqEMq2GXPjNUW5S7okQ1erhe7ssnKpizafyfCHFdlokcXP
	 2+lK8I52iV8Jw==
Date: Mon, 16 Feb 2026 16:07:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH v2 13/13] hwspinlock: refactor consumer.h from public
 header
Message-ID: <97c1ffb9-e661-4021-8ebc-a5be1f650d42@sirena.org.uk>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HvgiA0QUjJpkbfJw"
Content-Disposition: inline
In-Reply-To: <20260215225501.6365-14-wsa+renesas@sang-engineering.com>
X-Cookie: Beware the one behind you.
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


--HvgiA0QUjJpkbfJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 15, 2026 at 11:54:53PM +0100, Wolfram Sang wrote:
> Factor out the entries only needed for consumers from the generic public
> header. This allows for a clean separation between providers and
> consumers.

Acked-by: Mark Brown <broonie@kernel.org>

--HvgiA0QUjJpkbfJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTQKwACgkQJNaLcl1U
h9Dr4gf/dawn1jflZdEr4KfMA/MruyXk1IsoKKd6nHfm1oO8lk65Zor92E7Xmfx4
fv2GB5hE6qadTOAvHqXE7x79fteb3IQklPN/wT3cu2aTI/rjEgZ0sRP8ppDwAFl8
Y+uWW4fiu0/GF3r0JU+w0eUmNySB2x6iuzQYbSAt0kHRupCUL+7oMfkYUpFloTGP
gXpYBXwh3vIHVbl82mqSr64E76why0OmoRZ742fRWj4PVB+Db4B928d6tVNMV2dq
a1dzjyT+6l1OFHdgN7X4XZQbtdLAhmz6Dk++pV55q+WvAYKpU0jg21AXf9al99U6
k/uHzg/1zB+99V44BT6S1tVSG7Udww==
=dPJC
-----END PGP SIGNATURE-----

--HvgiA0QUjJpkbfJw--

