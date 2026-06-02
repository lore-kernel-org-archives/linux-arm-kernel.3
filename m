Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39568CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJzkqUtVg54mBprGrZtQSWQkiwWBq/0aCh5qUpxBt0w=; b=mg9MgXvUxxId7kr+AQjc+6BaoX
	0Uj8BoH5JzwHNvOYsmpULA6ZWPAVov+inVEgLpqT3GQC+5zxk6vMXfa2vmZCdlkTR4Nte4qQ6qpob
	j/mDHTMRoBmiXs9B7v6IfRPv3RAO7YMVqZoGkXAp+b4+DMjoYC+1oobPGzpHe/lZ0xmQlMXHOzSV5
	YuuwTi8s6s3VlgO5JxE5DPem2P3oYq4pgcFOcAoEHn4BFXms5fiwJi+RijZDpPT5Ni8WWfvx0uJSQ
	X+leau+BcZ74p6+u5G08mC1uewcxwgoZWaTbImYyv2f34hUTPFihp6s5/f8a+4B3UrIaTxDnmzZ6G
	lrBhDQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQeE-0000000DEs0-0ol7;
	Tue, 02 Jun 2026 15:03:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQe9-0000000DEpR-3zDb;
	Tue, 02 Jun 2026 15:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dJzkqUtVg54mBprGrZtQSWQkiwWBq/0aCh5qUpxBt0w=; b=gQeJJRTQB6Dg11khGhrcVXu63F
	d0RG0hYUA6OciYzZiAle8Fnk87FXjgvhJBxnKlh7OVQ8c5BFSFH50OjDwxEm0v5Oug2LoGOoRAff/
	/BapZxdQro6zjQWEnrok3Xu91ao6JlxxmJZz9CcitdpyRD36ZatxqGwtqIuy5NiIdJxF5qzzjL0Z1
	bzQC0bqJF2BmWHIrknloT/w32TAFEaogrC/i6gpK3fln2NNr6/Rq6vTwkOJHVpTppKr1oZfWlcYZL
	ZQtJ0sxju1t7J37uuRu5jy9JGmd8bNvDXojYEQYEQjpIFKhPcD0u2IAKsHNmfNVSCIhmil9gewqIR
	0ZiXPtIA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 62/76] drm/rockchip: cdn-dp: Switch to atomic_create_state
Date: Tue, 02 Jun 2026 17:02:37 +0200
Message-ID: <4650339.9PvXe5no7K@phil>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-62-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-62-875d828d31bc@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_080313_987127_879ABEF3 
X-CRM114-Status: GOOD (  16.06  )
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

Am Samstag, 30. Mai 2026, 16:00:07 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Maxime Ripard:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
>=20
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

having looked at the first parts of the series adding
the new functionality, this change looks good:

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>=20
> ---
> To: Sandy Huang <hjc@rock-chips.com>
> To: "Heiko St=C3=BCbner" <heiko@sntech.de>
> To: Andy Yan <andy.yan@rock-chips.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index 190cce9530c8..e159e1627f3c 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -823,11 +823,11 @@ static int cdn_dp_audio_mute_stream(struct drm_brid=
ge *bridge,
>  }
> =20
>  static const struct drm_bridge_funcs cdn_dp_bridge_funcs =3D {
>  	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,
>  	.detect =3D cdn_dp_bridge_detect,
>  	.edid_read =3D cdn_dp_bridge_edid_read,
>  	.atomic_enable =3D cdn_dp_bridge_atomic_enable,
>  	.atomic_disable =3D cdn_dp_bridge_atomic_disable,
>  	.mode_valid =3D cdn_dp_bridge_mode_valid,
>=20
>=20





