Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6381CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZlFQc2UTR3ED1ZPNl8phV8Bpe1SexIgz/UK5O1E8dk=; b=s6RJ521XXSnL32cVQN5SJO0NZ4
	yieG0eZpNLLByg/MRxgtWrP1u6Ir0gqSNuASLSN/XMUgZ3FriQHyCj7ipEQzc1Kc/JZfK364je97A
	FEsWwO4BHNn4x34kG7GnBFZT4XaVdTRw0REMek6murIMtTmg0sDTxYIB7KP4NpRM++XZggl6ZFHir
	ZCVLW1GABtnI1ck/g3F249r18gSuGRENHOmZmkxgtvR2xeqztm8Y87LYwXIeC/ar1xtgjC3cEqExp
	Jpwfps50X0OGFxiChYKEfMZbMAbFNhPHBk7ts5YzuGHxwKks6cme5SSpcVz5yX7v4UibiQOT3LGqa
	E1n/iUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zlp-00000000unT-2xJV;
	Thu, 24 Oct 2024 15:29:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXy-00000000sc9-1T2X;
	Thu, 24 Oct 2024 15:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9ZlFQc2UTR3ED1ZPNl8phV8Bpe1SexIgz/UK5O1E8dk=; b=d8VnFAs8OI2g3Ngd4Q3Zqhn7RV
	UBYcLPNf+Yrjov74WnpfYWnButQ30xJqicdfivGeU/GkVv4pFxQtOix1IUZBVxP9x3tvSeiZjJCvv
	9IcZKzSfQvOyycSP39YLDhEf54otMpGwdUqEaX2QKXHSYL/xVuHOk2VVVPGOrE7gnNsNgF+P9OR6B
	DE8mbl6qn88LfxR5LHloVSuH/VR2Yk2Ktsp/VwWcp2KTFn4I5JXrrD86HW0//9F+oWIG8T4CJ1w4I
	BiSTMCuWiml8oeoaAgEhkP2facCEaD+yv9e2+c7ZQ9oIWmN1Rr5BfHQwDQSzB5tc1fwqqknHQWwGn
	qniSpjTg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zXu-00000008hAb-2g7U;
	Thu, 24 Oct 2024 15:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4373E5C3F5B;
	Thu, 24 Oct 2024 15:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AEFC4CEC7;
	Thu, 24 Oct 2024 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782877;
	bh=N0wI9OFBged5/7iffZvOk9Mo2r1WR2+eTGn77TckzCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBBqpvgnq0/Gyxky+R05Qzs+OeZB6Z7fCii1KfwDU/Qbe8k7nIxnmR4nLOlK+oreC
	 zeDepQiNOWnNz+uegudFwedT27+SprAE9xf4OexxUgYv8Il8Ls+0qsgm5W7aPlazvq
	 XhTvCSFH2C9Dr8PVZkdu0K8LoZp6sJat6LKcDhxebk6JlQXK/78FcrvZSHRd6kVpdC
	 1wo7po8j75ovC+hPE0BxcNth2mcSAoRhAFEK4UU6kX6N85YE74GVAojAvEAyC65QPe
	 Cn5NRU78vVPdjfygVc6/MlyWdo4BkFciWJWEsNJFZpGzzIrw5Pm6j9sUtwMR2LO5gl
	 OFTNdxDiP23vQ==
Date: Thu, 24 Oct 2024 17:14:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
Message-ID: <20241024-elastic-courageous-wolf-9b9692@houat>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ilqx6g56qdz6ge6u"
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_161443_013248_FB61E6C1 
X-CRM114-Status: GOOD (  17.18  )
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


--ilqx6g56qdz6ge6u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 05:49:58PM +0100, Dave Stevenson wrote:
> Pi 0-3 have no deep colour support and only 24bpp output,
> so max_bpc should remain as 8, and no HDR metadata property
> should be registered.
>=20
> Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 62b82b1eeb36..6ebcc38be291 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -640,6 +640,11 @@ static int vc4_hdmi_connector_init(struct drm_device=
 *dev,
>  	if (ret)
>  		return ret;
> =20
> +	if (vc4_hdmi->variant->supports_hdr)
> +		drm_connector_attach_max_bpc_property(connector, 8, 12);
> +	else
> +		drm_connector_attach_max_bpc_property(connector, 8, 8);
> +

Are you sure that one is needed?

https://elixir.bootlin.com/linux/v6.11.5/source/drivers/gpu/drm/vc4/vc4_hdm=
i.c#L594
should take care about all that already.

Maxime

--ilqx6g56qdz6ge6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxpkVgAKCRAnX84Zoj2+
dpYuAX4gdROrmsHWAAzitdr3V3i9R9MKM1Yf94Dzb9HOdZshoaT6nkdTbK04N2GS
BRjpxg8Bf2T4PNnDmxK/oGIdaqzLKcFGfcrvNfmHtgm1+2GHasLnWOExN5va/678
E03+pOebBQ==
=KqRv
-----END PGP SIGNATURE-----

--ilqx6g56qdz6ge6u--

