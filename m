Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrvI0lS5iedsIuWwFJtRVpqvsYUQdMp/dmyITNGxSg8=; b=K8xzpaZm4ceKRU9VkVhZHA4AOM
	aSEG8Y6ea7AXJOrRh2bJxyxAf2z9ueGd+RXkiWNlBnMLf5ONHV1gA/kMIEcHMdOfCwMUXVL1u7yLx
	iIF/qjVhthqJ5qpvbL8woG+6ahD66q9c3h0hHWaBUibYiR6wYQY0YJMNumD20iUUbZzUsFrW7ttv7
	PPLcnjZDIhxvJBaNQXTdsdf9piEs6nYFa5uk9M3wD1YljHasLSADCyOkRWs/0EhgPWNWxz0q1j7x1
	OabT4uOSa5vEaLu1i1bvh9ziNYTGKCvTkKJqfp0k7BPplxZNsYb3u4myxgSze0Igg/CxuTGlSu/da
	ZOQnSaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vYs-00000004co1-1xOO;
	Tue, 22 Sep 2026 08:09:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vYr-00000004cnn-24Vw;
	Tue, 22 Sep 2026 08:09:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C49834338D;
	Tue, 22 Sep 2026 08:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCF51F000FF;
	Tue, 22 Sep 2026 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790064548;
	bh=OrvI0lS5iedsIuWwFJtRVpqvsYUQdMp/dmyITNGxSg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZbbCPoTSBcurUYk2bz1VDxkNWDMV02RvhWrWaiMNpPz6ljb/j9YGOTwoSVab/b0a
	 N6G9FFCwypeOzY92+k7EwJLGDxA4l1FrS/oE8wrhv5oT19CwwEJzHzGyleT25NEG7J
	 QragPj5OgzHOHobEPQY28YnPMIUb3mLuULNFeKa5LUn69I2dhr/faKLe+JTiWXicwF
	 VdXenJ3YXYc//eoor40OzvZ2yBtIdA6SG3/zPi6aKuDJuB4NxtqMx9C3bOt9uLsJqO
	 dZcqz3FayH52g5YJkxpReTDqATZD3kUvaiaovKoI9t3mKoGCPEtOJ7484u3md+1eyj
	 AGnX/+OzQnHNw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 44B461AC56A7; Tue, 22 Sep 2026 09:09:05 +0100 (BST)
Date: Tue, 22 Sep 2026 10:09:05 +0200
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
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
Message-ID: <arI3ofru4is-jDF_@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VcZRb/AbZTZ33dvh"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
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


--VcZRb/AbZTZ33dvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:44PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> Fixes warning:
>=20
> [    8.502802] ------------[ cut here ]------------
> [    8.503445] cpu_latency_qos_remove_request called for unknown object
> [    8.504269] WARNING: CPU: 5 PID: 2790 at kernel/power/qos.c:322 cpu_la=
tency_qos_remove_request+0x48/0x98

Do we know why this is being triggered?  It makes me a bit nervous to
just shut up a warning without an commentary on why whatever the warning
is telling us about isn't an issue.

--VcZRb/AbZTZ33dvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyN6AACgkQJNaLcl1U
h9Dq1Af/Rvn6BWUaXoit9+fIWsqMQTQahObIGVt9y9ZaK4eU5kRQZDy4XXcqXGj7
guQpBstVggAYk0rrNXsGwPkKcibW446LRRrT5dPYXr5XMXcz5S7UYFnOZQrP41U/
nJwjC5LLzJZkCcogV8Y+UDBda2ny2XMHgQYHFaRYRnVn0P4cfCckgTPbqRBNT9rd
mJDM0h2B8n1CNvoAKxL8NJyozqmtO/u+M9ks3TLQ7rRpP0BhngvBEFQ3L8/auQm5
9LThLXY908JZXJUCDVmT9OxhQk57RbY6tnXZ6QufWM2LvVG5BcQplu/maBqwSTVf
bgv6QOlSelzI1sx1m+fvlFPwkh5NTg==
=v+bB
-----END PGP SIGNATURE-----

--VcZRb/AbZTZ33dvh--

