Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0690CC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjXcqMOa9aaX+GA+SOvHHXfb0ZNPyUilydrg52FvFzs=; b=p+aqmjSQvTdIEipcQASTJQG8Oc
	WiBiMJpPTcNQl+hErQLAm/7DW7NuNk0iOS6xEGziyZASTqKkRO2gcAD+gLko6YAVX7Cr5d1o/+Vc9
	azYc/ge/FoDMtovvW9dtsa4UY7umK5QnMMg5sGKqXtpDySXUGxnvO/+M6aGc03THb4KGN/JxThZwV
	NJF11LONi2ZYhhrFMqUyj3CZD8f7v5ktao2L2WiV7w4A1wiwHTk0PV2PAnLJPduFWqJ1vuN9rHCQF
	SJOoaashVGGMGwf+OPiYzjU5fGcJQzldH8QAnIXuTLTZsgeXCNvLmGnXbqgJTXiLU1w+SEZ5zfAsW
	U8kalu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vji-00000004eSC-40z7;
	Tue, 22 Sep 2026 08:20:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vjh-00000004eRS-0e4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 620D660DCE;
	Tue, 22 Sep 2026 08:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14B81F000FF;
	Tue, 22 Sep 2026 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065220;
	bh=MjXcqMOa9aaX+GA+SOvHHXfb0ZNPyUilydrg52FvFzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHq0UfbyfXC3CsFAWicoq8LHwkSmHcsYAHHGrfrWMUyluipj6vz6ijaTKolEMEM1J
	 Nw8k+knsmJKNBRA0PAh/aY26f2NBhp5/aYkikclayWzHwHIKNNDcK/2EkY4trtOhBT
	 zoNVU4xcJ973Tkh3rx1h2rz0/771pIacFf/zqW3Bq9+jeM8Nw0JK7LljbNJFNK4a89
	 clh1tMUeIjQoeS+//Z73TU2t1RIYck6Ikwa62GNdjCklIlnBTsJuKZB9HX2mNY9qzj
	 DeAwnCjRTpAyMZqU3sUXq4XjlK6DCkJGm4iAhJeAf97OpVmO74+NjYahdp9yWQj67s
	 ielpV/G+29gtQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 765281AC56A7; Tue, 22 Sep 2026 09:20:16 +0100 (BST)
Date: Tue, 22 Sep 2026 10:20:16 +0200
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
Subject: Re: [PATCH v1 15/17] ASoC: intel: boards: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <arI6QPLCu5zU0N3j@sirena.co.uk>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <15844908.tv2OnDr8pf@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5HyqqGHFH+LIPBo"
Content-Disposition: inline
In-Reply-To: <15844908.tv2OnDr8pf@rafael.j.wysocki>
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


--F5HyqqGHFH+LIPBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 09:55:15PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.

Acked-by: Mark Brown <broonie@kernel.org>

--F5HyqqGHFH+LIPBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyOj8ACgkQJNaLcl1U
h9Bx+Qf/XQKqT8zAAypC4QDplX84kvvsAuOBYTwqfb7dF3Dw7ytXEeNRU3I4BLOm
WtgQ9XPLDynBgy2oYWyeQrAXf+LILRzJzH5IOT4uSkKBpqhZPlKLiN5IOaI533yf
CXEY+C5CQJc8f7RGWm5TZvjJ0yFdUsaHKwiW4NY+znI0ff4cytSD5pbOIg0e4apq
sYDmAXVgOBOff0Brn55XAi9P3Do1BuMdCfESVLVGIUrJtVJ4ivqwCU9TYBEE3moe
6zNf5I9zG/zB+mrTrIMccaCakwoEuBlSTod32q6bobVfYweKmudduwme+sjVtS3t
1uijSSXPHA4q8BFE/4fF7SM1yeWNnQ==
=4Q3T
-----END PGP SIGNATURE-----

--F5HyqqGHFH+LIPBo--

