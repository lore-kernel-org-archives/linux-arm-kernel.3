Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C9C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxxW+MwnQxUOfAp3KfVr2VuOhebu99ePea2AwZmEnyA=; b=D0At0EUbl2hMetlHI9axnwlKVx
	3uSBzLWu43U/vwPxXedU0Zu/9rYq1iIHeGmvMAMwJ25jNibVuN8NSgiSxBV2za15OisW/atZofsau
	p+7p2y5zvD5bM0Fuuj66h5TLoYfZmMcykusFAnIpc3JdXj1rOEFynK2nyHPHrg8xOwN1C6qHwuOl0
	i9cGM4iTphzMckZYOAon7NIVRW9KDIcWF1NvjYz16pPNM2EvKl4Vzjf83nHfQTU5A2gPHk8Xygaso
	UuYqBqWo82ZBVYMqHZ8wrntnPYBiBn9JvXQk98XwcRmptj/nHhhut6CKX4b4CobkMr9bypx806XDR
	HhWo48ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vjF-00000004eKB-3JKe;
	Tue, 22 Sep 2026 08:19:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vjE-00000004eJu-2IVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 230DD400AE;
	Tue, 22 Sep 2026 08:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC191F000FF;
	Tue, 22 Sep 2026 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065192;
	bh=NxxW+MwnQxUOfAp3KfVr2VuOhebu99ePea2AwZmEnyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oj6dB1BmKHYgg7PizPzvu9WcKFtaX74zYU6aeDvM/h7b6sdAHmxkMM1YF8zw9/ydh
	 kAIo2SRJeBMoE/+xcRObhIolkxJCJ+5oqPQG9pe9GRBCMIaYQYhlNrkUgomFRJJKFM
	 4zWTjPHXbMKGVdm7II2dLWPOsomxoG3kQFY911pg82xyXJGjrrMDWohvW9m5lPYelU
	 BzT9ADYHWqeybQrKzJb4PL2g7u8hzjX2bsDlHP54+V/cLNalP1ydjLuvT4zrg37Pwt
	 XXT1Doi0+dC8KDhvGSnr4AZRXezjQmzYyAfjGhXvd+kQk2CWxFCl16dQSUxZBHTcKS
	 4bIF+c5CO0iLg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 060C81AC56A7; Tue, 22 Sep 2026 09:19:48 +0100 (BST)
Date: Tue, 22 Sep 2026 10:19:47 +0200
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
Subject: Re: [PATCH v1 14/17] ASoC: amd: acp3x-es83xx: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <arI6I_BxOtpGOwia@sirena.co.uk>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <2310746.NgBsaNRSFp@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHQlndWyXpKXz6+B"
Content-Disposition: inline
In-Reply-To: <2310746.NgBsaNRSFp@rafael.j.wysocki>
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


--wHQlndWyXpKXz6+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 09:54:29PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.

Acked-by: Mark Brown <broonie@kernel.org>

--wHQlndWyXpKXz6+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyOiMACgkQJNaLcl1U
h9CBPQf+OX4ZAxsyOFVoLqfS85Wr2AMB3h2WUbbxm4pL+tda7ODHcsiozFiliKvi
HHqVGJzrKF2nwXn5f7fSwL4N/9c/EYmYGdyjEWuv2KUXCd86pGCLwxM2wu7l2wbB
L5v4Hd4hgwQz8DgGGPb/DVlGsiFmOxE+ecb6hfgapJiq7UvMXSDSY7Zsuujzran1
HFazFt4MUr1ZmbeJJXcPBHGJHz7+pVngbiDEiDmugrMwWfiGG6cnPI3UBmd+wFPy
9ss5nBTiAAdXUiWN+E/S2Sf4wlMUiYSDnsV+pXJntMBbBu3NLljdLdrZ8ZLNdsjt
yLyrIm/PLgzKxV9EMoLP5LNqSu5bCw==
=SX0f
-----END PGP SIGNATURE-----

--wHQlndWyXpKXz6+B--

