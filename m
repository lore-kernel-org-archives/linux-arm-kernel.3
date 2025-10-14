Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E086CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG2IH1ZK8qb6TTcf7dxksUZjA+HIDL6UEjkoAAD0oRU=; b=Z/HmYSGPlldDsXy/I0GBaLACO4
	O0kuX25bv7V+TkYN6zhROSHliciSQa6UoipTnifyCSUg6oDbmxJ2qANsYbeqRNgYX+tdHfGu8B/rh
	gf1g1B1PxHIKWCupxJ74ndTKFqqbfQ6GUvw2dMbn+3FFIKtMQ+e45O7WtgDFyUnwMAbS4R5oCYVk4
	Mh7TQW4qM5rh6bNv9GKRSOV2ofTby+WgxsDgsWn3vtZLqX6+aj0pXCb6CLUgl9UiVM1nM3Oa3Bd4P
	EIhS7/MNIeM/cek3PU8g8jAvruaMVRMnf46J66rEz77JaSHP0th7UtQUFrBphW0yBEUs3fQHrO7iH
	aA8UKy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bVl-0000000Fmhw-06hK;
	Tue, 14 Oct 2025 09:40:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bVi-0000000FmhN-1OLM;
	Tue, 14 Oct 2025 09:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WG2IH1ZK8qb6TTcf7dxksUZjA+HIDL6UEjkoAAD0oRU=; b=2LbcdrcB2kDESjcRFs7It7jalT
	SttAJIKLX3es8jlGcb/a1lIxcRoiC/29xgFYiK4SquCyIFhsd6Tn748Xe8o5t3e482n8r4Ei+Kkrw
	Xemz3yO0ehVrdx5yaNoAyHWlR3p2zKzf6Cr/Cp+a+Cd4/Kve2P8E1AxWnjPNnx2rCipVQoj5D8sfx
	JHMc9CehITs4a5gaDA6qsPUa6FCHjTnD957wN0z2PTT7wZnB2EybJgFSUXkB7jiy+TeY0Q0PZbFV6
	gSUr4nkRo9zKS+1tX75Pw3AWij/FVu5sLG5KBFlpi9jUg3tOANDGy+TLGCmHILQfcpv4pXOXP/ada
	E7FZA0VA==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8bVe-000662-1y; Tue, 14 Oct 2025 11:39:58 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, chf.fritz@googlemail.com
Cc: Sandy Huang <hjc@rock-chips.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] drm/rockchip: rk3288-lvds: honor DCLK edge via GRF CON15
Date: Tue, 14 Oct 2025 11:39:57 +0200
Message-ID: <1983151.taCxCBeP46@diego>
In-Reply-To: <9dd924871a81364a922131461339dec2a45d434e.camel@googlemail.com>
References: <9dd924871a81364a922131461339dec2a45d434e.camel@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_024002_372252_28FFE448 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Christoph,

Am Montag, 15. September 2025, 19:35:22 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Christoph Fritz:
> Set the DCLK edge (normal or invert) via GRF_SOC_CON15 when the specific
> drm_bus_flag is enabled. Keep track of the vop source in use so that the
> right DCLK (BIG: dclk0 or LIT: dclk1) gets set.
>=20
> This change is especially necessary for RGB output configurations to
> actually propagate the DCLK inversion.
>=20
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 17 +++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_lvds.h |  4 ++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index 2411260db51d7..08784c3ecf703 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -235,8 +236,11 @@ static int rk3288_lvds_grf_config(struct drm_encoder=
 *encoder,
>  				  struct drm_display_mode *mode)
>  {
>  	struct rockchip_lvds *lvds =3D encoder_to_lvds(encoder);
> +	u32 bus_flgs =3D lvds->connector.display_info.bus_flags;
> +	u8 con15_dclk =3D (bus_flgs & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE) ? 1 :=
 0;
>  	u8 pin_hsync =3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 1 : 0;
>  	u8 pin_dclk =3D (mode->flags & DRM_MODE_FLAG_PCSYNC) ? 1 : 0;
> +	unsigned int con15_dclk_mask;

I think the variables might be nicer named as dclk_inv and dclk_inv_mask
instead of referencing the that con15 thing.

But on the more important side

  CC [M]  drivers/gpu/drm/rockchip/rockchip_lvds.o
=2E./drivers/gpu/drm/rockchip/rockchip_lvds.c: In function =E2=80=98rk3288_=
lvds_grf_config=E2=80=99:
=2E./drivers/gpu/drm/rockchip/rockchip_lvds.c:239:28: error: =E2=80=98struc=
t rockchip_lvds=E2=80=99 has no member named =E2=80=98connector=E2=80=99
  239 |         u32 bus_flgs =3D lvds->connector.display_info.bus_flags;
      |                            ^~

because of commit 40a382aae1d4 ("drm/rockchip: lvds: Convert to drm bridge"=
).

So you'll need to adapt to that change.


Heiko



