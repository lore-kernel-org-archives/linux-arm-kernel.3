Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB91C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo3mWNGatWCN9U9NdsHgYs4FZPyOo5lVBCESSB/+w6k=; b=LvKAgpiTezEfMDdtoH1X13APam
	oTi8x8X2xdP+oeD4y598dChSt+ucsyx7w4gP+1BheH6Td2HLYMkPu/8xYtCRq/n6v5bZ6DQu8hYg3
	SSJgEcwFMA6rcff0e36OLssusbSn8Ol0S1SUYbv0BF5iPyA+toeG7+ZQ86KVqxl4ivGc7L8Mat3Md
	Y8tlTT2Jsin8SUbbhNVOt6BcdpTKv8RTE5MH5HhshW1+8jj4SaecN+1YOaJiYf3pOnx/Px+9zrmMc
	b7z00R6FH+7xbRPCtHVhY0yuIl25DJJvaJPu9G+xzj3kG2o/OX0NoGJyjmaQCzIhnSaFqa+pSZhn9
	c34X2Vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsVl-00000008nON-2Os2;
	Wed, 05 Mar 2025 17:26:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsT3-00000008n5R-1Aej;
	Wed, 05 Mar 2025 17:23:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46CC65C6B5F;
	Wed,  5 Mar 2025 17:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72558C4CED1;
	Wed,  5 Mar 2025 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741195415;
	bh=Uo3mWNGatWCN9U9NdsHgYs4FZPyOo5lVBCESSB/+w6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ri8Ar6n5p2xBm9RoUR7lfLv/IX2/ebTBuDpaaCIcqGbViU7c/W9BiAWxLFXRF1t8I
	 WzrFyqkvMHHNSXk48gJh8mxR2cSBXtaaNZMoWhdG6c0irXIjWomD+jTcJJG9OptBY6
	 tM12CgTHcUHN/D1DrarJbIaOe9D9fUGJtZrT2eu0tFX6Re47o4ujUEYkCLIzfV+KI5
	 3whidGPBut1xFRiGsqHXl6vpPDo6cKVvGtgbRMlaobOuq8xHNncI9ySvGBFasbZGPN
	 ZZbFpugpS+3MAtNF5RekqT95D7Tee8/rh1FoJleciexP88k3zTO5MYFWV1mT0XkoJp
	 1Mrl17smqux+A==
Date: Wed, 5 Mar 2025 17:23:29 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: Add accdet headset
 jack detect support
Message-ID: <7661b71a-9d5a-46c4-9639-0fba1b118b52@sirena.org.uk>
References: <20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com>
 <20250304-mt8188-accdet-v2-3-27f496c4aede@collabora.com>
 <59d0d382-1d15-46c4-b9e4-b66c32c188d3@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3lZokx9nkSuQ7Eg"
Content-Disposition: inline
In-Reply-To: <59d0d382-1d15-46c4-b9e4-b66c32c188d3@collabora.com>
X-Cookie: Everybody gets free BORSCHT!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_092337_373949_D5CC5111 
X-CRM114-Status: GOOD (  11.55  )
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


--A3lZokx9nkSuQ7Eg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 06:18:41PM +0100, AngeloGioacchino Del Regno wrote:

> Get to that mt6359-accdet.h header and:

> #if IS_ENABLED(CONFIG_SND_SOC_MT6359_ACCDET)

> function signatures

> #else

> static .... { return -EINVAL; (or whatever else) }

> #endif
>=20

It should probably be return 0 for the registration/unregistration
functions so the caller doesn't fail if it checks the return code when
the accessory detection is configured out.

--A3lZokx9nkSuQ7Eg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfIiJAACgkQJNaLcl1U
h9CMZQf+Ifm+gO7vy+HK8RUWgpgzNwyEaaG9mU1+cZEDRedSC6PkwGHGr6nahS9G
34+jdkZ/QUiRaiC9wFejUo6yDAxGAmn0vp4U1En2P1lzrjK/aa0mNneVXmN/p7bJ
hAoLZr4RQ3iKCSqrWdpUVf/uLZ97LMNi7q7Gu13BbWJl0VYdfpcWyMcXWpZr62Is
F5CSNUwZkvpcy6wzcj5P6Y1PSlR8c5SmygJ1ohNt9ujhNWNSxNqQoKajIgI+3oWK
6Uw59dXmeWtFsCpcuB6/w2fKw+UdwYpnAbnwtGwlJivbRqa0vgt4Cxzzgflz0V4I
AU2ee5PAEVtbq/r4fJ5EtqWBRE5yLg==
=n+jb
-----END PGP SIGNATURE-----

--A3lZokx9nkSuQ7Eg--

