Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE33C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63mYHX7mtuoiPipaFKq34F2k9faAGyQ8nFHA1oVLU8U=; b=Fr/GDI954I36T4A2c1ilU4iCCP
	d3T7B88C7lLVwTO5RjjZMNJDaFPmaGBXurGIRlCDknml+RtngWxu/ZabP0WgysFu0EJBZ5xEj3QLV
	IXPUAB2lbXU8zt9Wtqp+HUQJnVZdHpDQbb2Hi1I807GrOHZCACzDYUN68Iwcowsot6qwSsCl9Stx+
	ZI5aFAaa5W+cuH2Qe54zqSY6E8+8GyyMhQ22+jcqaFL02AaamMuyDjDB8FolGcCSKPuAiTKHFROdW
	s0g/eCfwxtYZzBxh7soYq/+y0RPw/WO8DMqA8wW3G/nUpVOvCHWS27saZGUvFJWjoBxVyAPKneLre
	eCld86tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4efH-0000000ERy6-1uVX;
	Thu, 10 Sep 2026 13:18:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4efF-0000000ERxo-2QEw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:18:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8B16600E2;
	Thu, 10 Sep 2026 13:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B11F000FF;
	Thu, 10 Sep 2026 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789046284;
	bh=63mYHX7mtuoiPipaFKq34F2k9faAGyQ8nFHA1oVLU8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yh28SgK7gOsyNTvjOGWgVG1/MDJixzQwQhYPAGNTeDU4OCLsroi21iNV/clvoIEh5
	 uKFGiJ3Oi1dp52stLFPNgzYrIwY8vNlOCjtj1+b4kort8izKB+rqCmiPcTI2gh7VgM
	 tnC4jvDMu1aBxEAWYpTLCVl4tx5EUYH1Eo4S55XiuIvhDgkXE6oCXY/ZV/qc9qh0co
	 NXrZ88fbtKVa75c5eqBXedcleXEgyodSEZT+Sa1MLTSh3o3RmvxJy3XY5E77JyMUO4
	 o5wNJdeykoOuBVD3BDFefmraJ/IoJNeQ3gvvoxGkawTwMXxtIDWfOV+WxREmvKXjJl
	 YyFwTlmBFNxlA==
Date: Thu, 10 Sep 2026 14:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Message-ID: <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
 <20260909204042.46656-2-stefanghetu9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bxz62p+0qLECbO21"
Content-Disposition: inline
In-Reply-To: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Cookie: Gravity brings me down.
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


--Bxz62p+0qLECbO21
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 11:40:42PM +0300, =C8=98tefan Ghe=C8=9Bu wrote:
> Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
> call stack") added a shared Xtensa helper that iterates over a flexible
> array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

You've sent multiple tengentially related patches in a single thread
without anything indicating that it's a patch series.  This is really
confusing tooling, please resend as either a coherent series or
individual patches.

--Bxz62p+0qLECbO21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqirgUACgkQJNaLcl1U
h9AwYQf+OIH7nMiz45cq2dAIjQSTZ7xvYRJFfL7NgH9LmIUJzCDA5iD/8JHzAJqH
HtB/dbJUg5yoPkH8vB9DmrouOKM1/ZnoGMZLz2md/fcHprBKzTRRY/hpS/SLL7uG
ebPii0YZt+JZnq0WeDpOljT7LfjU7mcSxobur3AjJd84pHxsxFHB1XnjtBPGHhdT
O77Q+yTV8DjIgXy4iZSWTvmxxYFIagg6w7DiuJ7G5VogrWpFJGOFw1PRw+Xg+S7F
YP96GFRjjB+BMtmXvRYpIyB6Uvm3NYGkYlIMP2TOLR+vEbuz/UxWOwUVFFw9Jg38
W8RJHuPrDPsz/7g1TH6r92mrmYo0ig==
=uzC5
-----END PGP SIGNATURE-----

--Bxz62p+0qLECbO21--

