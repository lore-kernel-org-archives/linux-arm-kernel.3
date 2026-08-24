Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31138C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZTtou1nRtbS6X9wfhp/PYfrCMog+YyUjJyHyt53b9w=; b=dlF4sF45zzjYnXIPNfmPIxJoWm
	wgFt10VKY/tN67O/J0w8LcbLWJIzlPpTE879Hno0RlcayUQqv1xv/hjp0+/oWj0iEr4f0xULncJ8x
	l+QoxMrM2Fq6kz9vGSLDQr4qRPcaiqjP+reVZq61CJfuVLjOo/mMpIwA4u3/vsfpGUlsGrW8XBsP1
	v0+VYZCQRj5FsxYXsDpzcAI4voOdhncQS58FzdfZm9YcB2XDsZZh8PCy438rqJqvERsf0gIXf57KB
	luwWySX4XCjNu3LJPRZ81EZrfKouKiDRE5moyemOgLB7k6OaYFMaKNAAnCMWj0beHDMtdjulaaBeu
	iesc2mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXTN-0000000H2Rr-3bRq;
	Mon, 24 Aug 2026 16:24:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXTG-0000000H2Q4-0i6y;
	Mon, 24 Aug 2026 16:24:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46E5E6011F;
	Mon, 24 Aug 2026 16:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FAB1F000E9;
	Mon, 24 Aug 2026 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787588665;
	bh=uZTtou1nRtbS6X9wfhp/PYfrCMog+YyUjJyHyt53b9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSoDI9sQ9BHabsbH51rW1u8jLgL4QG++cA48MrXJMxPR4bDejclsFyhIgG3qxIHIo
	 pmI6mr2UaRmsJztTzXiQ6OAPaqTOB2Z0m5Ky2JSuWSmtOMQIEZs/BirC1kXNi6UpfC
	 CqivYmGPQTbjfAGmbJeqAvLGfB1bl7AiiRcY76XiVO+Jr3VpbXzs8Q9GWE9XsVAiTh
	 1tcWhwMQ9lriNfxV6NwPEi2bKFQD812en2/eKGMC8Ye1YzUcHxfikkhBPEsxIRtNa4
	 PgNIad6IHpt5nuuGNR8MWaGouLZ65pnAT8yueKCumctr/hVmi9i4l6qDRwTKw675Fd
	 5lWdCxADZsxtA==
Date: Mon, 24 Aug 2026 17:24:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
	p.zabel@pengutronix.de, ogabbay@kernel.org,
	zhangqing@rock-chips.com, royalnet026@gmail.com,
	u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com, alchark@flipper.net,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 06/13] dt-bindings: power: rockchip: allow resets in a
 power domain node
Message-ID: <20260824-hardening-tinwork-60c54a562c8a@spud>
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <c34278613fdb483ee7d771077a9451f66973e89d.1787568944.git.gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+tDi0f/c68q1mpsR"
Content-Disposition: inline
In-Reply-To: <c34278613fdb483ee7d771077a9451f66973e89d.1787568944.git.gahing@gahingwoo.com>
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

--+tDi0f/c68q1mpsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 11:08:55PM +1200, Jiaxing Hu wrote:
> Some domains do not come up in a usable state on their own and need
> their resets cycled once power is on. The RK3576 NPU domains are one
> case: without it the first access after power-on takes an async SError.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  .../bindings/power/rockchip,power-controller.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-control=
ler.yaml
> index b41db576f..83741f048 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> @@ -136,6 +136,13 @@ $defs:
>            A number of phandles to clocks that need to be enabled
>            while power domain switches state.
> =20
> +      resets:
> +        maxItems: 1
> +        description:
> +          A phandle to a reset that needs to be cycled once the power do=
main has
> +          been switched on, for domains whose logic does not come up in =
a usable
> +          state by itself.
> +
>        domain-supply:
>          description: domain regulator supply.
> =20
> @@ -216,6 +223,7 @@ examples:
>                      reg =3D <RK3399_PD_IEP>;
>                      clocks =3D <&cru ACLK_IEP>,
>                               <&cru HCLK_IEP>;
> +                    resets =3D <&cru SRST_A_IEP>;
>                      pm_qos =3D <&qos_iep>;
>                      #power-domain-cells =3D <0>;
>                  };
> --=20
> 2.43.0
>=20

--+tDi0f/c68q1mpsR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxwMgAKCRB4tDGHoIJi
0kv+AP0WeUFb4dKPJSmjaR2SbLsqglAK44hwzBB4HyxQNKxIqgEA+h8O0hVC2kna
C84nBPE3JorbtfSL3jl4fvdc2oOxcAc=
=lpjX
-----END PGP SIGNATURE-----

--+tDi0f/c68q1mpsR--

