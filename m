Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45173CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dDruC6iw3EJwORfpY8MHfyohIHz8lNWLx1YR5ATtrc=; b=PSZe6gOjgtz8VQW8v9gKs9nG7T
	rTfeKGCQXG4kBZZkFx/pYQHVo1YWxclLaL5DIKvkAQ+Kj18ea2GPtb50w0ntSeZdGL+ACEdk9N5Qm
	zuCcQgrbt8SpYcTbRNCA9s+YYAflrKgN8uv0ChZaHa341CeyZGomc1EX66BPUgG9fTDOGTPg3nttx
	Lidl2ut0kjyP7qFdwm89z1Nl11HDoa8iCAwmiz06wvtkZhJI23rr6NJhk5P88aZ0ODmlxfxRhu3U8
	oSBHbn7KI4R12YFZyp1m6PMt9R5lPsgbqi3RwECzRNCc+HygHj0gUTt1ChvAx6QUdc22yoLJG24qb
	cDo60c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozQL-0000000G3ix-1IdF;
	Thu, 21 Aug 2025 07:09:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz71-0000000G0Fz-2zfQ;
	Thu, 21 Aug 2025 06:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B97F7A5762B;
	Thu, 21 Aug 2025 06:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57B0C4CEED;
	Thu, 21 Aug 2025 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758966;
	bh=+dDruC6iw3EJwORfpY8MHfyohIHz8lNWLx1YR5ATtrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gnz7iZd/BdECzBP5MOTF9P/jh0Oi3LHdU3YrbPKWmAylyObxiuwvHv8NJi6M18NMa
	 /iD93nWQZV4BBt47V3bsFUKncJuTQlkOdZx8JhvIonYEV1i0LWg5+rT6kcsm8G3DaC
	 7YeXIPbhBMCyfPTSovYxY1/vk8medqxI6Ya/HQIxUJ6mPKE9zVdmGEkgi49CGV38MZ
	 PszApBGc88nJXjTXgeAAc0CV6C7G3bo85VjTC4Ii66fhfS9fR5iMql0EC5wHJiwTFQ
	 UT4oHtIaZNifYwUzzuNQkc7Nvfxsk1PpdEV4eOwVdxGE5EaslH3fosSKGbV9bAEvS9
	 MNQAEvAr61Tpw==
Date: Thu, 21 Aug 2025 08:49:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Ray Liu <ray.liu@airoha.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/4] spi: spi-airoha-snfi: return an error for
 continuous mode dirmap creation cases
Message-ID: <aKbBclHYmjI_H3jq@lore-rh-laptop>
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
 <20250814065423.3980305-5-mikhail.kshevetskiy@iopsys.eu>
 <78542bbe-1def-4aca-8424-cc26542d9762@sirena.org.uk>
 <e8f77b06-b47c-456e-8671-ac8ae573af64@iopsys.eu>
 <a18185a0-407c-4a1c-b915-fec9b3283b87@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fQ/mndwu5rqbmfjT"
Content-Disposition: inline
In-Reply-To: <a18185a0-407c-4a1c-b915-fec9b3283b87@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_234927_827689_FEC4B11C 
X-CRM114-Status: GOOD (  16.93  )
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


--fQ/mndwu5rqbmfjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Am 14.08.25 um 17:33 schrieb Mikhail Kshevetskiy:
> >=20
> > On 14.08.2025 18:29, Mark Brown wrote:
> >> On Thu, Aug 14, 2025 at 09:54:23AM +0300, Mikhail Kshevetskiy wrote:
> >>> This driver can accelerate single page operations only, thus
> >>> continuous reading mode should not be used.
> >>>
> >>> Continuous reading will use sizes up to the size of one erase block.
> >>> This size is much larger than the size of single flash page. Use this
> >>> difference to identify continuous reading and return an error.
> >> This seems like it just applies anyway regardless of the rest of the
> >> series?
> >=20
> > Could you provide a link? I do not see this in upstream linux repo.
>=20
> Mark asked if this could be applied without the other patches of this
> series through his SPI tree and I think that is indeed correct. The
> other patches are still being reviewed and applied via the MTD tree.

Can you please add the following Fixes tag?

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")

Regards,
Lorenzo

--fQ/mndwu5rqbmfjT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKbBbwAKCRA6cBh0uS2t
rK9SAP4/fA0AATBO9QcF9hsrFQCmlkwxxrHcvQqs0F8yCLHidgD+M3A/bqxivvA8
dgQx6GY/EeGvfXJ4S0LIK2YiItbX7gk=
=6qIu
-----END PGP SIGNATURE-----

--fQ/mndwu5rqbmfjT--

