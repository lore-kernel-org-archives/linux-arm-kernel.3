Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E241CC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxpEqx2dw/xmsX5Rvft+Dq3Uke5C6iT0Ri7WrYNVr9Q=; b=BlyvL5YWgYCB5WaM0xyaJbZhsE
	xItwOZyPndnfd2BmIcQzvKzYTjFYD+2/wosP1/ba9702o9tD+Up19PpOXcTmQzmAGAjOFFft3miPC
	q3VSmpr+aaOCinRxDrYN8xFSRMPwFzu/RG2sDGZ7Yg91Vx/5I2RHPdGlkNxxm6T/tPMvJY01w6DUM
	fUhVgKmjcGZTG9zV7szLapoDO1X1YkRCkhimC/GTL0Bfc50pWAEB5HD/ojtuO6V6YdP9IiJVct8FN
	z4ujFk5YLSyAKNP4Ss1WrvYIafGUgsOnA1jOt4Nr7OWkZT4k62qDV9sAukkO+p5AXh3xDbbBh48ie
	sLwH0HTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2lK-00000000cC9-4AU1;
	Thu, 22 May 2025 10:02:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2jG-00000000bch-0Rfh;
	Thu, 22 May 2025 10:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83DE662A37;
	Thu, 22 May 2025 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4BC4CEE4;
	Thu, 22 May 2025 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747908045;
	bh=MqopuUpYpRBwINTm0XZy4Btrri9/43yCJfmha+uoSws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cj2WJCiWjYkooKVwSF7qK5qxGnxD7tXSUsN1yjJeFEgcgg/J6VU0+CKvUu4K82JWn
	 2J3EhgNsiuNcS9LFh7XQt48XPGkVjcypJmoCjd3JredBT6Tf1zRaByi+y03ZiPIrny
	 h0ubB6YEsb0W3LPuq8M2xkXuqT4SDiCyiG5i+Xpqm3RTgyoKJsQL4BP6TAj40R2iYa
	 Axe4uLW7riQND3IRZcX+WkMpXqU7DdzjKS3xKXaCU4OPIPZOI4EYUQLZwXrhuES5Wa
	 rt4laTbjxh8v+1ny12wFiI7j5z3IAWAURoXdZxe/wBBitobPOfsXpEn5SczrUcBfHq
	 xn3VT8iG9nKwA==
Date: Thu, 22 May 2025 11:00:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: ppc: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <6625e6b1-53a7-4357-99ab-bdf5810e6699@sirena.org.uk>
Mail-Followup-To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz,
	tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-2-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dYBUrfbV055H0pXU"
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-2-aichao@kylinos.cn>
X-Cookie: Beware of dog.
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


--dYBUrfbV055H0pXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 01:02:54PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.
>=20
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/ppc/tumbler.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

This is for ALSA, not ASoC (same for patch 2).

--dYBUrfbV055H0pXU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgu9cQACgkQJNaLcl1U
h9CN3wf+PegrYTPlsVJy+enj/g4eJLMHrb+6cwhGIJ+rpuWUhYGaAAV3EeSH51g9
RpUaPpzmbI1W9rHSufs3UHUUX+xeLAOCmoGQY3zHQDiXcB6kH7ZnVbFLcGCEQjbE
63rKXX3DuoMTCyrERQSyyVztgwF4gtwM7/SpkrP6EF/IwRBHuR7PSbfudShqajl3
JmjzCk+11NNoW4pgUBcsCdTuxGyEd5eGZWAT/b68XKAq8AbndHwwsY2X0OC28Ibu
dCW1cX1s+NK6W/MErAM0B72wYF0HVOmzOT45F6UlMZVJqPDezTE8IB+oUmzSf+hv
3t/hI5FgEmIU4rj4jwuBpqaSXrPi2Q==
=1khQ
-----END PGP SIGNATURE-----

--dYBUrfbV055H0pXU--

