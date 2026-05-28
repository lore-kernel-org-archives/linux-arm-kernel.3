Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D1BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqOl4KJ+POyxHhW5KeMjbKtaqry36nNsOelFZ1HL0ac=; b=3VeXdPguDpt2mVXBBVLHpgnsIW
	rKmqT9maZDYzT9DivzAsbp7qEmZMQ65aNBvT7EjzetXkf/xpXO310yTzCQ4paQI0WMuhlBVrK70Ov
	Jk2jgwOe62E+JekCkRrEhWGA/Cz6ZuRqK11/+/SommO8dWmaNs00oCWulVW1dcFmD333iTKk17HEm
	kHv4Y0RQEkXEqOaZjqT7kNL2tqaon7hpn81MteCrL//5o7jO9BeGXOu7vyrxIJ3PUqitKVRangC25
	xixQo7aqMua6myohY6bJ7CXQtF0a5GV3S0HvHtzB4BPxUMaRtYqMJ1FccDNyy7NWJ78sSoUFodD90
	IZnAOh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSd3H-00000005wfU-2toA;
	Thu, 28 May 2026 15:53:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSd3F-00000005wfG-2tDi;
	Thu, 28 May 2026 15:53:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2CCD6014B;
	Thu, 28 May 2026 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319881F000E9;
	Thu, 28 May 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779983620;
	bh=aqOl4KJ+POyxHhW5KeMjbKtaqry36nNsOelFZ1HL0ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxhI0M0P7/GNtmHmDIp57e9c+ffTuUabCpKnKORQeXlGYCrvUPbtd0sq5ZKyWkIKw
	 JKm3mnIuOvfB/cJfuoakhBuVwcEeijXIXT9HIDU098Oa1SkMa9/HCIXmTNWqI4NR6G
	 uKW9UahepMUSIa6o4qRB1uHttXj066AWRLnpFxZJY/+hqUnd1PM4ec11Uc97p/PWWm
	 +A7vaNixHBu54Www1A+iO3KWM3APVdM8CTFyc6Of3fIqJ2cOIcBkjyCkvwaEHOgLqS
	 U0M/g4vJ1rDXRvFZUH7d5ZVtVsmE6Z9kU/meOODWz0N1ufbGB+yevcI0sA/GOkT0TG
	 58CcjYxmPgmsw==
Date: Thu, 28 May 2026 16:53:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
Message-ID: <512b2bb6-620f-428f-9724-73972e589c46@sirena.org.uk>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
 <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
 <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19pjvJBHzpq/adui"
Content-Disposition: inline
In-Reply-To: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
X-Cookie: Someone is speaking well of you.
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


--19pjvJBHzpq/adui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 05:01:59PM +0200, Valerio Setti wrote:

> I have 2 alternative proposals for this:

> - Change the default value of "HDMI CTRL SRC" so that at boot it's set to
> some working configuration (ex: "I2S"). This should be done somewhere in
> "aiu-codec-ctrl" I think.
> - Run the 'amixer' command above before running ALSA tests.

> Any suggestion on what's the best approach?

Having to set routing is usually fine, I do that for a bunch of my
boards but not Potato.  The only issue with this is that if people
upgrade the kernel they'll see audio break so ideally we'd have the same
default behaviour as we had before.

--19pjvJBHzpq/adui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYZP4ACgkQJNaLcl1U
h9Djiwf8DPaQRmX/EbpoL63XEFpABecPfcnnkx3fq7lRA3ljGP15t7UDi1OBbLKp
qsBm1nynYHc6+rmSYN9WiEaVD02YDD8vQE2bz8gEwqsskC6fZKBM8t4ru/+epCqa
PF9AWcGXca3zx6kTenw+CgxpX2qufynlE/Os6+3XDNbHXUAVgSY2U0aALKB92uHZ
pHDS7XPT2nuWpuPollt7JUrxF6rUxhInQryAl7wt0EC2BelQ/AB9ozIOn3kG73Xg
01WpDT+ql4AP9M5+PHFL6UAQme0RYN2rS6kzSN/eZbzR/sJGcInsW8PvII+o93+O
SxxdCbgl792e+6v5xuSoQEzlwBM0dQ==
=qkk7
-----END PGP SIGNATURE-----

--19pjvJBHzpq/adui--

