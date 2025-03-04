Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EABFC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z7H9csckGqLSufOJUp9XXvgfTc9ZOxQQQ6azPlLWDI=; b=Q4RNzgYDPzDw8lKZNfkzK6bE/d
	dzew+oio/cFueXcLrDxhRqs2PloOEv87wa6TtGX4S75+RcXlkojwQbtg8td65kCpc4XRh+wsE8WCS
	vREtUEHItbYXzWf/DElmPuJgxI2CWV3S1pm+QxmHRVSdHsBRIjjFlm41t7HybWdL1CpNrN6sYBE7y
	lFPvTohvX0VYnM6DaklmcKXIIdMcRrtlSWb3Aj2RPDWf8QV7e6N0UaFCjcdKJYulJNLYdv5wNYh1S
	fnjV4Z9NOZrzNmU6mhzZ41LlGlcMcWqKWIpwo+YkyJkhvbDsjWrqE7mgffLf4AuBvsG8alrfSzduF
	iJplDPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXXX-00000005waE-0KbY;
	Tue, 04 Mar 2025 19:02:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVte-00000005alc-25ky;
	Tue, 04 Mar 2025 17:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E273EA45A38;
	Tue,  4 Mar 2025 17:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F3EC4CEE7;
	Tue,  4 Mar 2025 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741108653;
	bh=4z7H9csckGqLSufOJUp9XXvgfTc9ZOxQQQ6azPlLWDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAkkJIy29QnQjVEgSpSYNLm2gsMIuLzqzehYykZ1wUQES+pa8gxoV87KPfcoe80bZ
	 tYx0igDYoUPO9aoc1Jt5H609W7iXn8yHMs+nELJ1AONXDfICRo8fqyFNhDPyZrE+RI
	 NJGYelL8lgORMnm8sNpYm/duk6MWrAbNx6fUlsGua+OMxh9wsNRnc+vT/NpQ4FXvKI
	 Y9hB+p0WfsklwIPoTG4EpkvhGUKhU069cY4d+aexHtKBbmzskFKuv7XFUIeeYOAipi
	 Ipgi51cn0ijIj1yTPtsOhVmLhslvT9XOrmdoMVRvB78f0mUqFQl2NgfB3KjfT8/DDM
	 vPtG4ydTU2oQA==
Date: Tue, 4 Mar 2025 17:17:27 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: Re: [PATCH 3/3] ASoC: mediatek: mt8188-mt6359: Add headset jack
 detect support
Message-ID: <e544340c-af89-4ba5-b22c-a1fbe1bc18c9@sirena.org.uk>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQxBYpJeSEONvwho"
Content-Disposition: inline
In-Reply-To: <20250214-mt8188-accdet-v1-3-6bbd5483855b@collabora.com>
X-Cookie: No campfires allowed.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_091734_602016_CDCFAFBE 
X-CRM114-Status: GOOD (  10.11  )
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


--sQxBYpJeSEONvwho
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 12:14:31PM -0300, N=EDcolas F. R. A. Prado wrote:
> Enable headset jack detection for MT8188 platforms using the MT6359
> ACCDET block for it.

This breaks an arm64 defconfig build:

ERROR: modpost: "mt6359_accdet_enable_jack_detect" [sound/soc/mediatek/mt81=
88/mt8188-mt6359.ko] undefined!

--sQxBYpJeSEONvwho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfHNaYACgkQJNaLcl1U
h9CVcwf/cEXGyYbJzY/LG/gtq4RQ3+3Nbsi7YBj19yJ+wFTX/nkro1+oCXhFm/My
qNPYIfWKzJzREoLN1uolpyWB3ffXgf8K6YMH5gJDSSwBngo3qycJ+Q14OfwoK5PX
MAHUIulHOADCpMQEtODRPXwtEklB5jlpXyf8trwGIJyIXBFCm1NGw8vNq7XWB0cn
12wjTmq0Nr2bA7E0LaU4j2pryPCXLkFv3dg6mbrS79GiwQRYUBaURz8saWqj56Oy
D2k78AJbhycmDKbDKI8pDV34O3VsC/J6/rgYZefvKtDVOia7C89hqSleSTt13fUC
HTW7JbCtS9/S1+wHTAPb02BP45QAnQ==
=lfm3
-----END PGP SIGNATURE-----

--sQxBYpJeSEONvwho--

