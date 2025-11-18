Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3204DCEDD97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQeURHbWrq7V1VcDemCDxa/0nlOdyTiAiKdrEJt+lYA=; b=NkAIvaPX9Bi5FMZAST5KMK42ma
	RUeSeUWqN5/xyeumI1Itjh98Wx10RVgl2XSrkJnUkslet06ud/4IUAv6ZY6oBsk8LVqvNb1UKKJUT
	OlLjbKFJDqDRbh7Kt1LKuFxT870nsFwDVeATQLC3r7xS45HMKRQ/NCb2iXWic/yItth+3hyBji+a5
	j66+QqG+x3WqOsdEVyETrTzrcUPjskwe6HiLJDPW3d1VBJ/z1Mxv3pADvmj3fhfodxLdi0uYPm04Y
	CXiJ1pdLtpxkRHExKyoMNpe7tDr1qahbIqVuydd5UYVkodQp+rYdyJFCLABbGuct7t5EtWKkXmCk+
	TJmoDbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMZn-00000000YGe-0Yt1;
	Tue, 18 Nov 2025 14:20:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMZl-00000000YFw-2PLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FE826025B;
	Tue, 18 Nov 2025 14:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A82C4CEF5;
	Tue, 18 Nov 2025 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475656;
	bh=EzdwBT0I16G5eJM6DmK6r2wyXQKJd9x6ZvKyD1yiOLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrHHHYULyeeAyWOHL3xltIL/2RyYwFA4IQ58Z3ICX34b1YbhqIiyeGP8CkjDXkZUG
	 wxNXrIhJpDRn4Nd8dBGF7QJM9tBSwLjpI5dxH8kEJslL15Q5jGeMysX7zHDc1RWLxr
	 OTCx3larlmOomTBPkt8QPlkaWvMFgllUcc/HiGzUTQVAwBpmTi4wLc4u8uV1rGLtnd
	 jS21MGVeiJGcqubHgqLRuti5b+TfzJhzLG3MJjRjmlGbpCa2gL+JQSIbXigiRC0VY3
	 vhztyu7/UcakAHJlSqi83IJ8MGX5C64yfxAs4T7xLJCFURqXeFsm/I4PpReeALrTtS
	 kOzCT/xoMWDAQ==
Date: Tue, 18 Nov 2025 14:20:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KpCqYkQkjjduxtUZ"
Content-Disposition: inline
In-Reply-To: <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
X-Cookie: Protect from light.
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


--KpCqYkQkjjduxtUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 18, 2025 at 03:13:49PM +0100, Bartosz Golaszewski wrote:

> Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.

> I can't open the link:

> 500 Internal Server Error

> FATAL: remaining connection slots are reserved for non-replication
> superuser connections

> Oops, something has gone wrong!

Retry, it's AI scrapers so those 500 responses are just glitches.

> Any chance you could get the offending line out of this stack trace?

   https://builds.sirena.org.uk/187dac290bfd0741b9d7d5490af825c33fd9baa4/arm64/defconfig/vmlinux.xz

/build/stage/linux/drivers/gpio/gpiolib-shared.c:87

--KpCqYkQkjjduxtUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkcgL8ACgkQJNaLcl1U
h9Aw8Qf7BKlYN82A4Hn0A3YhoC7pHl6/9ZVls6yVRuOZdRxWlqek5IxlKQCbDDUr
oNK8+lusBJz/jg9bPTKvMs3ZuVsjKTvFc3mHMTWVXo0EUWUNf1EGGNpZerfFM+5j
qgAEyvAVdTiO5QVVBagp6ioo7AYR7q/6kUNfT/BkV++RDeBrVI3vnvdrjNPW8PPm
YW/K8NKJBtiN1P/ffBsxeqBPotCLzfcvwDjeo2nZZ6bohr4yVyuMn2O7di023AoE
+cTWnB5Gncf6/bewSEjoyOCkMUxVGUuPkyo/H7byZ+2lxKUBqdXOow7V1xPSThvA
DFO546hKxuy+x32sTmbFBa+DQ7fQIg==
=xzcr
-----END PGP SIGNATURE-----

--KpCqYkQkjjduxtUZ--

