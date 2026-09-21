Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31B7C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR3QlLkpOllF17ylDcNIQRMmZtuCsB9dWNGolTVMx54=; b=B+3CK771CVFvGbY2bLhC/iWz8S
	aYfV0b6UdyiSRm5kCdXb0UaLd31i+a/TF4ZstBPCFV0W2y80O3mHdo05jZ4/JNiE1r7nsEP/VZ2J0
	2OS5HU+0VJ50ol/0NFx8jLQpZzUwBeKUjL4rbonGdTbi9WQ9cihyu38s3KUJFKGttk0Y/Xwv38+Ha
	Ngqf0TyvovYXhI87llJ0Nv0zbjuj8kw/9ApMmULnxKW1BAldmvlDCyOV1V7GqF+Bn3YDB4icZ+j90
	W5ml1Z26SarP8SLUJ5xOKNdOaY879ts3yYkgTYd7zgIr9UapFFXeRiwnfZ3G+rotSpj62oag1GJA8
	P2me62UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fvf-00000002bu2-2cnB;
	Mon, 21 Sep 2026 15:27:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fve-00000002btH-1SlS;
	Mon, 21 Sep 2026 15:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B0D1600C8;
	Mon, 21 Sep 2026 15:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD601F000FF;
	Mon, 21 Sep 2026 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004457;
	bh=PR3QlLkpOllF17ylDcNIQRMmZtuCsB9dWNGolTVMx54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clldXVd1qt5JTqeAkuX3EX4mIWHnlMOgEnnMh+oY/nrA318cmAhD5LHyTIc5y2Wbd
	 //bnRA5kAnB6W8JMUS3dmlaIMqgsPMSkZRnBhR8FLjdXu6zzEmylQbDEqFnvs5Kegd
	 B4R67LRz7A2CFXy5oBhEW+5vwa3gwzBB+wCZ0h3n2nNV0r3VAyatsbrKGDs5N6KmJl
	 nVQiXY+jA/6TGI0eQgyN+DPKU9uU0dtSFAbUCmV95QTbJo8vluO6q+yE2CNI49ShaG
	 nxnSwxj7a3Rl8cjTBM/reYdHFLjBsNJ/jFncfOFzTrPYnNKyNFP8eNQFaZv2ozOqJW
	 7iIyz1/esJB3A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 09D661AC56A7; Mon, 21 Sep 2026 16:27:34 +0100 (BST)
Date: Mon, 21 Sep 2026 17:27:33 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Message-ID: <arFM5QGrJx1aYhGK@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qy1Q+x+0xkGVmW14"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-10-741cc20a74e5@gmail.com>
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


--qy1Q+x+0xkGVmW14
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:49PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> In snd_soc_limit_volume, instead of looking up a single control by name,
> also understand wildcard-starting patterns like '* Amp Gain Volume' to
> touch many controls at one.

> -	return soc_limit_volume(kctl, max);
> +	return hits;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_limit_volume);

This will break the existing Cirrus and TI users which treat non-zero
values as errors, most users ignore the return value but they check.

--qy1Q+x+0xkGVmW14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTOUACgkQJNaLcl1U
h9Dkuwf/e+9+p51dk6ApJjuQ0eXbD7tKMLOu2OSHbM26owrg0ihRHT55cBX3KJ9a
YXR3LUhWCtuE3nZLpD15aYVuH8Ix8zzDg7S8e+0X8TIwppv3PJoGL3RFQS8/TMh/
fUwbXTB8oMMTHLZnbJS0L0G6ptXZxb+qYxQj4Sa54U3F3hxla3fMfXfaLPNs0hw/
b/VWJgr72b30FphSIcZDwLs9PIgLWl3sUA2MLNigqhvcyY882sDZmCYlpvmBR0FL
f6q1qYUUd+5Sg0AXe/BqCJGnetxnaM3kfQ4FTgRjbHqx9WahPIj9vORlshRbTzCv
SCf1emZJ+s7LB9sfqe7izn+xljAPrw==
=LUax
-----END PGP SIGNATURE-----

--qy1Q+x+0xkGVmW14--

