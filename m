Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94653C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IORuiq+y7bk4+ibcdt0oVfIzdyoZqyiyPnSEWbGyQ4=; b=il/1uoVPD3ORiySU1N0i7BzdSI
	rqNgGP4EJDm/y9xt55w1SCtA+IJyob0t8rdVsYLfZI08+fFiivbj8Yudvw7ch85dbouHAu5679aN3
	7d8qnxQFj2fLqFvViE/4/Sc3WLeJZ7uAOqc1OeMUTDjG75ODOHyEfgsq/8h6yL3JxjNdeWqHiaNGP
	ZMiSk1PhBHNK8TnrJsrleLFI7CJR5KzyvkS4Rn+4iqlpA3ULA30qt+hEsnJrU6ILF/TAoP4ovAKqS
	KaJP6rDqVOQFIBWZj0WdfNY7xs5OsFLhjopyZ1SEUqmZFJxzgMhffKXeeB78oE3JddLo9qqAHMD9O
	NxHwGhhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vkA-00000004ebF-0mLE;
	Tue, 22 Sep 2026 08:20:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vk9-00000004eb3-2OG7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:20:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 069F660213;
	Tue, 22 Sep 2026 08:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0031F000FF;
	Tue, 22 Sep 2026 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065248;
	bh=0IORuiq+y7bk4+ibcdt0oVfIzdyoZqyiyPnSEWbGyQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYhnLHaZoo+UgLgpJ3WSIc07Kf408OFArco3q9ul+K9KDCpP8da4Zf3BjgvfmoCzX
	 P1pKGzazd/Xsm7mOkuD/BEaxBkzHN6Z2SsGZwk2P2Vliqp6mHUr/mSYAgvN3AvPyNi
	 azukjnjjKv2QaCei2fF3iRnW9bgkK7q4UZS5+1pAkiMsAhVKpsvwS0LZe8V0XUHqVs
	 BaYnC9YvVfP5VHBRsZntUEKc6XrIS2oOb3dcPUCuvY/LEnh4/VNisgfa5bfk/6/Z6X
	 UxAxHaCFxpL89oHqCm8t36uwsybKmFPA5tj3DlpwM286wv7wBBQC3trIMsij851wPt
	 BcoJLqyFxdGxA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C2E741AC56A7; Tue, 22 Sep 2026 09:20:44 +0100 (BST)
Date: Tue, 22 Sep 2026 10:20:44 +0200
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH v1 16/17] ASoC: loongson: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <arI6XGheDLqcM5h2@sirena.co.uk>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <2796562.BddDVKsqQX@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vZ4DAFp8EW84+teb"
Content-Disposition: inline
In-Reply-To: <2796562.BddDVKsqQX@rafael.j.wysocki>
X-Cookie: Too clever is dumb.
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


--vZ4DAFp8EW84+teb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 09:55:56PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.

Acked-by: Mark Brown <broonie@kerenl.org>

--vZ4DAFp8EW84+teb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyOlsACgkQJNaLcl1U
h9BVVgf+NHmKV8A+2Q/nOEOuw2I3+zdga+JgwoRwtArRjRtR+bVOUgnM+X/kaToi
CsUmvFtABRvEvzsgqGvp4PTPNYf8n3gJGHJfEOM+3EsqZpBX/cvoantUcu48VFYe
IkWVDka+uVjmEIHEeeSNWHd0+ZCFDuHqcvKpaPYsnv88TamcFUzsTYrkVgvMUJGy
fW4sEBYc4XGr/FqvffKLTO5E2CAQ/qhiXn3cFFMvadcm6YY2bEicWLlz7sKlcOmG
vkD//KecfKS8WmW3l9OYlCpUxTDA17e/ntdmTrBa4BHSP5wMGsS4Mf9qzQ9u6fUb
BR+eawjJR4XvFkhhblvxCW80tj3pIQ==
=FR2A
-----END PGP SIGNATURE-----

--vZ4DAFp8EW84+teb--

