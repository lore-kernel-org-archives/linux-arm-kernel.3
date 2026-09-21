Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53329C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8D2yB3bE6BKhGOLQ/iMBVp9chvKCeuMO2b5VVl3euw=; b=bnhcsJT9x3oAV45iOPqnV9Ynr8
	bqrraezWDMyaRE7G25v4Zqn9eeDvCU8oQ5NGLha4nWbHKVHbFgWH4Kecnq783nnZCIAd6F+l7zlC7
	1NlhGBzpQwcEnBluzoaGWRROwhY8BEzXP96F2SJUHpgTJ+UdJW5wW2JvBV3duJw2SXGLe0+6mAXHd
	DszeJ7FSI6sVrsKVTBzaQTY+JCgNpppf9lbKm9OJVEhR2zlS4vaG/AXcfu9DXf9/Joz3xSBphBpum
	J9mvPnq+eTtP1tkxlVqEHXFtNtKsPrvEhF/Ci1QDk31LABxc9SqgaUUqQ7pwo8tl3SeccJD8P9yB1
	epfdtxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g0s-00000002dHs-0LtX;
	Mon, 21 Sep 2026 15:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g0p-00000002dHC-2e6O;
	Mon, 21 Sep 2026 15:32:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6261342E72;
	Mon, 21 Sep 2026 15:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B941F00893;
	Mon, 21 Sep 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004779;
	bh=W8D2yB3bE6BKhGOLQ/iMBVp9chvKCeuMO2b5VVl3euw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=omqZJTJw3PS4Hi5M6+ar0tInmiG98Vpn5CiLztucoUgrYpt+KCEftnxirMgNs2cqf
	 tJvVdi35oPoJcq67aCkSrjwJrX157arhUnBVjKWg90/DLXnvPnQDPIXYQg35dk0BLw
	 8qBG6l4V7Skg36KaxaxwpV14JdTD6fQ1Al1YfXD+egl/AvfPRT9dlu91qVxKC2Zgpk
	 4LSeVRPPqE/uuCMinpgSB/Y+/XNWMMcWXkECW1d7fqV2KW6PRs2Hxrtk8D+xNl2nMu
	 3l6caMeoFxWFt/Ozq46DQ2wUGQEzXsPVicDxx2IUlvl4gXpE1rqggjuoGpDHbwvQnn
	 qSOWCMp8TfLRw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 049A61AC56A7; Mon, 21 Sep 2026 16:32:54 +0100 (BST)
Date: Mon, 21 Sep 2026 17:32:54 +0200
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
Subject: Re: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
Message-ID: <arFOJnILnWgUY59s@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xOqEqatVNA/Q95D7"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
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


--xOqEqatVNA/Q95D7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:46PM +1000, James Calligeros wrote:
> From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>=20
> Add support for nonatomic dmaengine PCMs.

This is nice to have but I don't see a user being added here?

--xOqEqatVNA/Q95D7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxTiMACgkQJNaLcl1U
h9D8yAf/bljkO0Fr3bF7YamCura0DZBNVxUDe198L5l38PN93J+nfGKN1w3Ttw89
OB35EXtVf7Jp6WxjFmNUTfWWT3/BVPMBzoZ+KhamYQYQn0JTPI3SG4W3sxvvWMP9
9LX4NfetIr6oh2gwoJ46XeZhTl36iP72hNbOvxWqdiuB7uU27kDyt+fhgtmGbUjw
T7OZEpb7Zf7fJfaFdJ9wJ5qo3fvE/O8tw1Q/cx+tur3aValh9G21+pQVgVcL6snQ
rCZ/D5M9TSFhACwZHVtg9uaU9KtLXlQob25SUqBRz3+c9h/fgQoKdnJCxkKX0lB1
8j36JXdggD/naDGfRyraCDekc+AjPg==
=i2/i
-----END PGP SIGNATURE-----

--xOqEqatVNA/Q95D7--

