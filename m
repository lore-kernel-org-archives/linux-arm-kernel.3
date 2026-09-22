Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D429CC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC4/JUWknuRlDmTPWvUCZL5/IBX6KNizhyFicMFHfRI=; b=s/Cjy0hSY+6q7HVxjGOdB4dWPt
	tBRiIG3/WqFJGbZhhBRfgT6VV5gAAXhjeMSv7EBjkL9QhCZyF/NbGU29uOgcuoM4qyJIFG11lbzrS
	WSyXnY1QLIYrhdzJk2TxL18H5DvSTzJclOFcUJHU2bi0Hu6yVzyJHjcftMpY2MrG2KAcJlbPjS+Ec
	HQz09RKFIehK4SRTfXCDBGVT2igQlnzOmFdo5zc1YxdHRQ5lygM+1Qibml7V+xwnvdixYSehP93ZP
	K3zawHNw823xwzg38XDxNiCHs5vojBgnsrEkTaGLLF0iWwKN6qljZsp5G9Z5rB0nB20DBXTWIBkoP
	5lWXQhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8viv-00000004eFe-2f4s;
	Tue, 22 Sep 2026 08:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8viu-00000004eFV-1Vr7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:19:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E71BB4197A;
	Tue, 22 Sep 2026 08:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A981F000FF;
	Tue, 22 Sep 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065171;
	bh=HC4/JUWknuRlDmTPWvUCZL5/IBX6KNizhyFicMFHfRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kvig3ccl5HE4pxQr3PQ2Fbl5qfBzi54hak7xsY46yImVe9s8c6x3djMYojEOALfc0
	 6cwbAzDbCILc13LrY0PwRYfva+uonCbGzp8K3ZGUhtwVNL9AYUnM+U/7AbH1zH/4kj
	 1tBuWYOEbdZbpUyzfiss20T3dkcLRgUip8z/ulamXJ1wvlccDStjqDP6Kha0AiR0ru
	 vOSlGl5adOaekke3rvueLgeDd2tksdbcz0mdLxT/2sVEeEA4Wc0jYZMSLLFyvgYRJi
	 YWCtGNvZzgZNq1OvqzUI+kjRr9z2ctehrcb1iisCCbv0FLWYrdMppb+CTT0Uepua2s
	 mTZZgAIbPGgUA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 029161AC56A7; Tue, 22 Sep 2026 09:19:27 +0100 (BST)
Date: Tue, 22 Sep 2026 10:19:27 +0200
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
Subject: Re: [PATCH v1 13/17] ASoC: amd: acp-es8336: Switch to use
 acpi_bus_get_primary_device()
Message-ID: <arI6Dz3lQiiSzWkl@sirena.co.uk>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <2063881.yKVeVyVuyW@rafael.j.wysocki>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9wLfpB3a5wcy/uF"
Content-Disposition: inline
In-Reply-To: <2063881.yKVeVyVuyW@rafael.j.wysocki>
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


--g9wLfpB3a5wcy/uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 09:53:51PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.

Acked-by: Mark Brown <broonie@kerenl.org>

--g9wLfpB3a5wcy/uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyOg8ACgkQJNaLcl1U
h9AtUAf/WrIx+1IBC/UCxyrfh6fRaiYU9rQ+OYNSO1bYP7b5ypcETGIH5hluHriB
80NoC7AO1Jgl6ZA30C8zMRGGlAw8r92sskZ51+sFEv3SzOegWgM0emRP2hM0H30v
0O4wZVu32zEC6aerkzPsGSthKygZa7hcl0Hy0oD9s6u4OmP7c8+LHadujlcD0uob
slUDG1TpAhDS4Uu5YKUTvqc1yMxvr2O8DfzIPiGHDh0aEeocrtbe5cgnrxQwGJBJ
+pj46e7cPjW3IKg0q8uOEyliL63BAeAaw1VQ49CoIDt2/LE93qGx9DUO1njPeZ9z
Llty1bZVqnhIOR0frCQwA1pyak3New==
=lFHR
-----END PGP SIGNATURE-----

--g9wLfpB3a5wcy/uF--

