Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D332C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE8rDnvy1JsbxyXI0ST4MR7QmWEmACLz23hTtIu4bio=; b=KWImgjzGR0eBE4VH385UAMKm3e
	Ek2FxRP5OrbFhz+9ydVWH6+69XLIDpuTT4m/X3EiQhEfYZkhrS+HftK1VvsdP+GTglWM/J7PYJ3QL
	dkmWP6VIFqHfXCUXPu+M5D0o9UX4Fazr4FyeKZxGLMOPP2kQQe87XxtRGxkeyHHY5p+W2Tv3Sd1SZ
	UXLqoOI7sCwmMBj+iu7ImWaC4iyPg68kEK/Fa+LgJptcLhN3f6o1qYA27wu4uX4BtClpEBIITxRL4
	PO5Kzbz9iTXM6i4xKVaQx2zi5Xyd3DTnbuyINm6Z2GLN+OnfdyH2iVClcelSUqwDVDPVEi2MwqnDK
	D6H+FtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wxC-0000000BZPx-1eR8;
	Thu, 10 Apr 2025 18:48:46 +0000
Received: from mail.mvand.net ([185.229.52.35])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wvN-0000000BZCP-0uQT;
	Thu, 10 Apr 2025 18:46:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.mvand.net (Postfix) with ESMTPSA id 34FEA1FFBE;
	Thu, 10 Apr 2025 20:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=martijnvandeventer.nl; s=default; t=1744310809;
	bh=35f6PssSUk82gUbtI8PktIZ3m65teiiSAGKD5LD8TgM=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=ESQ/pJWIaR4uTXdP/9KMB45vWyGoLXrT8WlK1orbSkbIqAHvcP9cblEE93RxWKMW7
	 pDKCBk0Wonc4PdiqukPYmRaHs+VEC7yRcT5iBukWDuc2diig4ExCA+/w3lA0fPECDe
	 1yh8FHyhEGyuXdVguaVK0FUI3A4++JsXiUn3ujriGcNL3eQEIy2N0773GJqnK8hgrb
	 Iu6wh8XzKbBulaaIhbqokXsH2arfjT65kq4cPGm7AVIStExiJ9XpsJt4TYEwZSNTiW
	 r34hjcKsvfVLa9G3vXHymZPksKs0ma0JYE4aYXhnEDeEGfwWDgg7p1k94++TC+8ygx
	 qXSY54OVqzP8w==
From: <linux@martijnvandeventer.nl>
To: "'Martin Blumenstingl'" <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<jbrunet@baylibre.com>,
	<neil.armstrong@linaro.org>,
	"'Furkan Kardame'" <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
Subject: RE: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master() on error
Date: Thu, 10 Apr 2025 20:46:48 +0200
Message-ID: <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us
Thread-Index: AQHanRYIlb/sWKyzPMx9MZcpgEt53rOfTIcg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_114653_458524_FEB3C5DC 
X-CRM114-Status: GOOD (  29.84  )
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

Hi Martin,

Thank you for the patch.

I encountered this issue some time ago as well and had a possible fix in =
my tree (see
below).=20
My apologies for not upstreaming it earlier.

While my fix is not as symmetric as yours=E2=80=94I like =
symmetry=E2=80=94it is somewhat simpler. It
did make the assumption that only  calling component_unbind_all() was at =
fault and the the rest of the=20
code was correct. Therefore, calling one of the following functions:
meson_encoder_dsi_remove()
meson_encoder_hdmi_remove()
meson_encoder_cvbs_remove()
in case their counterpart was not called, should not result in any =
issues.

I just verified, and, as far as I understand, all of these functions do =
a check to confirm
whether the encoder was initialized before proceeding with cleanup.

-----------------------------------------------------
diff --git a/drivers/gpu/drm/meson/meson_drv.c =
b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..4e2d45a271c2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -184,6 +184,7 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
        const struct meson_drm_match_data *match;
        struct meson_drm *priv;
        struct drm_device *drm;
+       bool do_unbind =3D false;
        struct resource *res;
        void __iomem *regs;
        int ret, i;
@@ -312,10 +313,9 @@ static int meson_drv_bind_master(struct device =
*dev, bool has_components)
                ret =3D component_bind_all(dev, drm);
                if (ret) {
                        dev_err(drm->dev, "Couldn't bind all =
components\n");
-                       /* Do not try to unbind */
-                       has_components =3D false;
                        goto exit_afbcd;
                }
+               do_unbind =3D true;
        }

        ret =3D meson_encoder_hdmi_probe(priv);
@@ -378,7 +378,7 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
        meson_encoder_hdmi_remove(priv);
        meson_encoder_cvbs_remove(priv);

-       if (has_components)
+       if (do_unbind)
                component_unbind_all(dev, drm);

        return ret;
-----------------------------

This patch has somewhat less code redundancy. I don=E2=80=99t have a =
strong
preference for either patch, so please feel free to choose whichever you =

prefer.=20

If you decide to go with yours, I=E2=80=99ve provided one minor comment =
inline
for your consideration.

> -----Original Message-----
> From: linux-amlogic <linux-amlogic-bounces@lists.infradead.org> On =
Behalf
> Of Martin Blumenstingl
> Sent: Wednesday, April 9, 2025 11:44 PM
> To: linux-amlogic@lists.infradead.org; dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org;
> jbrunet@baylibre.com; neil.armstrong@linaro.org; Martin Blumenstingl
> <martin.blumenstingl@googlemail.com>; Furkan Kardame
> <f.kardame@manjaro.org>
> Subject: [PATCH] drm/meson: fix resource cleanup in
> meson_drv_bind_master() on error
>=20
> meson_drv_bind_master() does not free resources in the order they are
> allocated. This can lead to crashes such as:
>     Unable to handle kernel NULL pointer dereference at virtual =
address
> 00000000000000c8
>     [...]
>     Hardware name: Beelink GT-King Pro (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>     pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>     lr : component_unbind+0x38/0x60
>     [...]
>     Call trace:
>      meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>      component_unbind+0x38/0x60
>      component_unbind_all+0xb8/0xc4
>      meson_drv_bind_master+0x1ec/0x514 [meson_drm]
>      meson_drv_bind+0x14/0x20 [meson_drm]
>      try_to_bring_up_aggregate_device+0xa8/0x160
>      __component_add+0xb8/0x1a8
>      component_add+0x14/0x20
>      meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
>      platform_probe+0x68/0xdc
>      really_probe+0xc0/0x39c
>      __driver_probe_device+0x7c/0x14c
>      driver_probe_device+0x3c/0x120
>      __driver_attach+0xc4/0x200
>      bus_for_each_dev+0x78/0xd8
>      driver_attach+0x24/0x30
>      bus_add_driver+0x110/0x240
>      driver_register+0x68/0x124
>      __platform_driver_register+0x24/0x30
>      meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
>      do_one_initcall+0x50/0x1bc
>      do_init_module+0x54/0x1fc
>      load_module+0x788/0x884
>      init_module_from_file+0x88/0xd4
>      __arm64_sys_finit_module+0x248/0x340
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x30/0xcc
>      el0t_64_sync_handler+0x120/0x12c
>      el0t_64_sync+0x190/0x194
>=20
> Clean up resources in the error path in the same order and under the
> same conditions as they were allocated to fix this.
>=20
> Reported-by: Furkan Kardame <f.kardame@manjaro.org>
> Signed-off-by: Martin Blumenstingl =
<martin.blumenstingl@googlemail.com>
> ---
> This issue was reported off-list so I'm unable to provide a link to =
the
> report.
>=20
> I'm not sure which Fixes tag fits best. My preference so far is
> Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to =
bind")
> but I'll happily take other suggestions as well.
>=20
>=20
>  drivers/gpu/drm/meson/meson_drv.c | 31 =
+++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c
> b/drivers/gpu/drm/meson/meson_drv.c
> index 81d2ee37e773..031686fd4104 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
>  			dev_err(drm->dev, "Couldn't bind all
> components\n");
>  			/* Do not try to unbind */
>  			has_components =3D false;

Above two lines are no longer used, so can be removed.

> -			goto exit_afbcd;
> +			goto cvbs_encoder_remove;
>  		}
>  	}
>=20
>  	ret =3D meson_encoder_hdmi_probe(priv);
>  	if (ret)
> -		goto exit_afbcd;
> +		goto unbind_components;
>=20
>  	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>  		ret =3D meson_encoder_dsi_probe(priv);
>  		if (ret)
> -			goto exit_afbcd;
> +			goto hdmi_encoder_remove;
>  	}
>=20
>  	ret =3D meson_plane_create(priv);
>  	if (ret)
> -		goto exit_afbcd;
> +		goto dsi_encoder_remove;
>=20
>  	ret =3D meson_overlay_create(priv);
>  	if (ret)
> -		goto exit_afbcd;
> +		goto dsi_encoder_remove;
>=20
>  	ret =3D meson_crtc_create(priv);
>  	if (ret)
> -		goto exit_afbcd;
> +		goto dsi_encoder_remove;
>=20
>  	ret =3D request_irq(priv->vsync_irq, meson_irq, 0, =
drm->driver->name,
> drm);
>  	if (ret)
> -		goto exit_afbcd;
> +		goto dsi_encoder_remove;
>=20
>  	drm_mode_config_reset(drm);
>=20
> @@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
>=20
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +dsi_encoder_remove:
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> +		meson_encoder_dsi_remove(priv);
> +hdmi_encoder_remove:
> +	meson_encoder_hdmi_remove(priv);
> +unbind_components:
> +	if (has_components)
> +		component_unbind_all(dev, drm);
> +cvbs_encoder_remove:
> +	meson_encoder_cvbs_remove(priv);
>  exit_afbcd:
>  	if (priv->afbcd.ops)
>  		priv->afbcd.ops->exit(priv);
> @@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
>  free_drm:
>  	drm_dev_put(drm);
>=20
> -	meson_encoder_dsi_remove(priv);
> -	meson_encoder_hdmi_remove(priv);
> -	meson_encoder_cvbs_remove(priv);
> -
> -	if (has_components)
> -		component_unbind_all(dev, drm);
> -
>  	return ret;
>  }
>=20
 --
Best regards,

Martijn



