Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BF1C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkAmAXWFdRaV2FEnkFzbQfqrpancqGX/NTP3iRaWbqk=; b=sc4m/yYWHIcMr1gprbRtAG/LUu
	uiy51rYP/KvlsSxsBhJ2bfkGNQJKfxS6SPLpfIpS0F5iIYoA3NhgvMGsgAuj8EudzVHSrhZU4tKD1
	DQe0HY5UMYfQ+Xgci4PzYAqREyRtOJchmsXLpnXa0U4CEcBTy8mglI+VlUuLRrmte4jOoZiKHnhIk
	1H96c/ElQDyao8dr04zvLQ6uDUuFZGZCOQWVNeDIWwXr8rDG1SSaK8Mu5jWP1ThjkDv3NhZVgTuwb
	I5Ih0K9/RZblZN3+dqn+WkJRyedGF2Hkc+rFJJXkbZ66Zy/yNWYnl3ezHe7gx5Sq6gkewwaglYfGr
	7XCR0Zkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Ow-0000000FndR-3Q0N;
	Wed, 15 Jul 2026 19:36:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Ov-0000000Fncv-07CX;
	Wed, 15 Jul 2026 19:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EkAmAXWFdRaV2FEnkFzbQfqrpancqGX/NTP3iRaWbqk=; b=HBeCfxPrMerzTTa1P1DjEdUQs0
	1J1B5NjvdxSdyZy57mYE3pbiGFIzwtcYqFyxc3BPUR/JO1ZFiyUeUUajoAqaKpCSwvImiWpjiyzUn
	keOhAkk1rUm4l5zrSKhBbolCn6Jutkv6GX93ct2DmnH7WZlgbBrfgsDrBM53XB2nC6lDYCvlOXjFI
	jzgrK/oN5gCR4ytiQxQgElEVKJIDE6fzemVetvlwCAjZuS0K9aY0QR6FgiOuIOSxwOnmmhl5eDhth
	DCo4QmILQZAsAqlhkga1GS3r+lN7uq3d9uGkMjO9CYzTudQ00ltb2qxudglNoJ8WXYQTFwaAK38cp
	huSUHPPQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/rockchip: remove unneeded 'fast_io' parameter in
 regmap_config
Date: Wed, 15 Jul 2026 21:36:00 +0200
Message-ID: <9698684.rMLUfLXkoz@phil>
In-Reply-To: <20260705163536.1850-8-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
 <20260705163536.1850-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123613_070851_232C7B8F 
X-CRM114-Status: GOOD (  14.82  )
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

Am Sonntag, 5. Juli 2026, 18:35:38 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Wolfram Sang:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot =
is
> happy, too.
>=20
>  drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/g=
pu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> index d2e76d36d724..aa8642e5b621 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> @@ -368,7 +368,6 @@ static const struct regmap_config dw_mipi_dsi2_rockch=
ip_regmap_config =3D {
>  	.reg_bits =3D 32,
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
> -	.fast_io =3D true,
>  };

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



