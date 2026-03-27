Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A260109E545
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCC+EsRtjQScd/hJdX4t8R6GeUfvuSert8Xa/RAjKDA=; b=FptjZcJn+KEVibF4c+aa15B+gI
	NG+nz+4fKhd7X6Ui8+gLE0TF+3g1XBU6WuS0kXdgmo85MCoKdn/gknD7/1qVPZDQBk6kQSA+r0kQe
	ji6kof4BFxE11N6s4HhyCfQGn6NCd4gTD/TpaofLB9azlWrzjB9yarvQSWc/fK4ltB66HfWRFBSOn
	ixor5GQ4zzb8prMdtLl25/bZ1uW+Y7n2FcGuy2jXUzQqU/zRRaNDt8BK5aLB4tjCTjdZy5UtGy4sn
	Z/gsCd268MCmEnDjo2mRy45mNxlv4DWkhz2tJP8siGCQ7hHQuMDIam4qDR7kGrwBNvifns6RQ3v1y
	cpwUqHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63eN-000000075ea-3paw;
	Fri, 27 Mar 2026 09:38:43 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63eM-000000075eF-0njx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:38:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso1256409e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774604320; cv=none;
        d=google.com; s=arc-20240605;
        b=eYbe3eWHQzH9J0+6ZqC0syu3c51awG7shTw9bUdQhgY/OtYN/ktkhop10wdP1VWbJ+
         qI4dJ7EBeQPP7HJ2jU7qxcAjvdJZUb9aih7rgMLJrERjoAMiKw06vTmbD85Xv0IYFIjS
         Tkcj3ksRdYtn5hpZD0b74OOBhQVt/Z+b4l1UOOy4t0RE2xeN64Z2Av4/2gIFW7iSEsz8
         R6QyRx9tq/sulcVgH9zghSncIb/v/ULacMuwTCfVzyVomaeLbVeduPNaM2g0Nx49rdbk
         9UkxdgsBMViJfrEftW6TqJvR7ehaoAFfWkWxfRFgSxs3GnS8/xMk4c57xhL3qjg2XeUK
         R2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCC+EsRtjQScd/hJdX4t8R6GeUfvuSert8Xa/RAjKDA=;
        fh=IFGMvtftyg7OKBCdQjw7OteTiL8likWZf1GdmGRFymo=;
        b=UX1fkNOMnIkSYYU8LFNZPun7IT3le/TikC4XI+vlwKxnkoxKJ6VZkm1nr/vH1UTOUQ
         Nifpp0Ap+k/HgpDD665nNUTNtgYkYhJ2vIuk7+DFKD25lcEgXXrWpH8PKUbcu14/RdOL
         HKPYnaKQDEY56ejKc6fZlSL/HGBo81tIOQ04Dq6iEYwnbg2uEw2prSER8VoppSvqZ0sF
         Om0raxpyh1ujCXTtMhJtHuHQMOrvZQEagzThDkPrlsxuJ+9qCHInk60CBxy+QMrjekk/
         wemTfD6CY0E3PxSv9BDED/kQTWbwuQOaG2d2ho3g7VRXKwRbSPw2yuK0jzA2voTzGJCW
         W1nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774604320; x=1775209120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCC+EsRtjQScd/hJdX4t8R6GeUfvuSert8Xa/RAjKDA=;
        b=i9hpLScZNnpgFgQhmx2lkDkvuXo6dbho5BKhtsSVf3C9sCUKSVRVMmVSGsKyRtjzu/
         qfUP8WLCK9ng3fKo/m+iB7vO1216IJAXk4UPFkExADgfE1AOWkLs0FwvnyLKsfQSrrln
         Ocz/z5aoczAeclYm5zl7kk3VBNEkxfyrTIEuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604320; x=1775209120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCC+EsRtjQScd/hJdX4t8R6GeUfvuSert8Xa/RAjKDA=;
        b=KdN333bGZthnthMPWLF3TuZ8crmiFTra9nSk6lhSSQWvYy4XxF5wJKDud2Kal2q3P9
         oJnXP+CeiwfEMFYFmkqnA2ykFTWGV2c/F1EIHHctJ49DaYGMbQm8ZNa9P2vDXWl7Ys94
         Nvayz8uSBIQakKC2N1HwHhUueuCQDMCP7fDy4Lm/8k1RoIfqDQtZwAVkB033Wzc+f01q
         NEzapMfETz4zt6ykMCxFXK+mN5vnnTYYkKSE0lpdgaQNRrvj5Vx+GSS18BCxhp76QjxK
         yoXCwzzcTaQi9QvH9ovj1W9SUX76Ce0Owq4w3uh2JQHkYiAtIIzp6WwaeRHX0Qo84rxo
         1QFA==
X-Forwarded-Encrypted: i=1; AJvYcCU8+zo6UCE36WUqkhTWnoGjQmGT4T7rnbiZeEPRZzmFFT7ID4B6sv8IgTsnd+I47vtpSNUwS7h5pg4MlZbZI0If@lists.infradead.org
X-Gm-Message-State: AOJu0Yw83Z6RkdSA7+cR55tHb/Kj4yAiq2lfsYXjvpmtfiR0n79RHBLl
	6jPp6h4dbgTLib9fFI8KeIrtvL3Fz8NDKv7vbbTe4AsI59TWA4ls9rUn3GhosP+VDPaf5hFM6px
	oloFEs5ZYyto1n3mXEvtPGjH9JkVwUrStZLXZxIrQUeaiqGozBcs=
X-Gm-Gg: ATEYQzxxX691xUuoGxpEcC2n7Gm48Wpr6qeMN9AkI1Ndu1O4nJVarlI35VvUzpK/C4P
	pOVwGwUGyErcLSS11+ou3zDKg5p/FsMTNAt7vKAHFQ2njT3/iwcHj0LgPhcYLZz/5WNDgP2XZ1P
	Uqk2lT+EQsSXKevhmd2htke2/4y0pamuEjxVKHH1+NzA6mCsq8LHYr3kasUZ8+DlLnNdfz5PeVu
	YxDnmUc8ea4iaVMgiekGnQqD0PPc9liU4+XdgPGdYfRXjcdguQ1hggK7Mq0vxw6NB+FfkgsIT0F
	dc+a03QPM0v9wsRolUIpekTLvOTBLRuaHOTPlg==
X-Received: by 2002:a05:6512:32c8:b0:5a1:26f7:71b with SMTP id
 2adb3069b0e04-5a2ab581efbmr751468e87.0.1774604319512; Fri, 27 Mar 2026
 02:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260326100248.1171828-1-wenst@chromium.org> <20260326100248.1171828-2-wenst@chromium.org>
 <243dbc45-cb11-4dfe-b8d1-e08f1b5f73b6@suse.de>
In-Reply-To: <243dbc45-cb11-4dfe-b8d1-e08f1b5f73b6@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Mar 2026 17:38:28 +0800
X-Gm-Features: AQROBzDiHdcvNsL4pOfZZU-Zs3-uFT9qrpPHFMaWbGHA7E62ZL_HdfLvhmVWRwU
Message-ID: <CAGXv+5F+F9oHjuUPwf-r2qKxDdXFuNV7w5Q8qogW=GXxE0GT3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023842_333847_10C6E55A 
X-CRM114-Status: GOOD (  40.90  )
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

On Fri, Mar 27, 2026 at 3:21=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 26.03.26 um 11:01 schrieb Chen-Yu Tsai:
> > From: Rob Herring <robh@kernel.org>
> >
> > Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> > drm_mode_create_dumb. This flag is for internal kernel use to indicate
> > if dumb buffer allocation needs a kernel mapping. This is needed only f=
or
> > GEM DMA where creating a kernel mapping or not has to be decided at
> > allocation time because creating a mapping on demand (with vmap()) is n=
ot
> > guaranteed to work.
>
> I still don't understand what you're trying to achieve. As I pointed
> out, ever driver's memory manager potentially requires a vmap. Passing
> around flags will not solve that problem. If vmap is not possible, the
> driver should not provide the vmap callbacks in the first place.

I'm trying to convert the Rockchip and Exynos drivers to the GEM DMA
helpers. Both have their reasons for not using the helpers, one of them
being that the DRM device is not the DMA device. This is already fixed
by my other series. Both drivers also set DMA_ATTR_NO_KERNEL_MAPPING
for buffer allocations other than the one used by fb_helper.

Exynos's GEM implementation also sets extra DMA attributes at the
allocation phase for their custom GEM create ioctl. But otherwise
exynos is just reimplementing all the GEM DMA helpers in almost
identical fashion. And to your point, exynos does not provide the
vmap callback.

Rockchip's GEM implementation splits the code path between DMA and
IOMMU usage as it needs to attach and detach the DMA device from the
IOMMU domain on the fly. This predates the DMA IOMMU framework. This
GEM implementation provides the vmap callback, which will fail for
direct DMA allocations without the kernel mapping.

There's also something fishy about Rockchip's DRM driver. It's using
fbdev-dma, even though it's not based on the GEM DMA helpers or even
drm_gem_dma_object.

As you are against changing the existing *_dumb_create() interface,
I will look into reusing drm_gem_dma_object with driver-specific
functions. I believe I will need to keep patch 2 adding dma_attrs
though. Would that be acceptable?

Once again, thank you for your patience.


ChenYu


> Best regards
> Thomas
>
> >
> > Several drivers are using reimplementing the GEM DMA helpers because
> > they distinguish between kernel and userspace allocations to create a
> > kernel mapping or not. Adding a flag allows migrating these drivers
> > to the helpers while preserving their existing behavior. These include
> > exynos, rockchip, and previously mediatek.
> >
> > Update the callers of drm_mode_dumb_create() to set
> > drm_mode_dumb_create.flags to appropriate defaults. Currently, flags ca=
n
> > be set to anything by userspace, but is unused within the kernel. Let's
> > force flags to zero (no kernel mapping) for userspace callers by defaul=
t.
> > For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
> > can override this as needed.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [wenst@chromium.org: Emit warning (once) if args->flags is not zero]
> > [wenst@chromium.org: Moved flag def. to include/drm/drm_dumb_buffers.h]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Switched to drm_warn_once()
> > - Moved flag definition from include/uapi/ to include/drm/drm_dumb_buff=
ers.h
> > - Reworded commit message
> >
> > Changes since v1:
> > - Emit warning if args->flags is not zero
> > ---
> >   drivers/gpu/drm/drm_client.c       | 2 ++
> >   drivers/gpu/drm/drm_dumb_buffers.c | 4 ++++
> >   include/drm/drm_dumb_buffers.h     | 3 +++
> >   3 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.=
c
> > index 46c465bce98c..3d3e61823cc1 100644
> > --- a/drivers/gpu/drm/drm_client.c
> > +++ b/drivers/gpu/drm/drm_client.c
> > @@ -14,6 +14,7 @@
> >   #include <drm/drm_client_event.h>
> >   #include <drm/drm_device.h>
> >   #include <drm/drm_drv.h>
> > +#include <drm/drm_dumb_buffers.h>
> >   #include <drm/drm_file.h>
> >   #include <drm/drm_fourcc.h>
> >   #include <drm/drm_framebuffer.h>
> > @@ -404,6 +405,7 @@ drm_client_buffer_create_dumb(struct drm_client_dev=
 *client, u32 width, u32 heig
> >       dumb_args.width =3D width;
> >       dumb_args.height =3D height;
> >       dumb_args.bpp =3D drm_format_info_bpp(info, 0);
> > +     dumb_args.flags =3D DRM_MODE_DUMB_KERNEL_MAP;
> >       ret =3D drm_mode_create_dumb(dev, &dumb_args, client->file);
> >       if (ret)
> >               return ERR_PTR(ret);
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_d=
umb_buffers.c
> > index e2b62e5fb891..60f4c2d08641 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -233,6 +233,10 @@ int drm_mode_create_dumb_ioctl(struct drm_device *=
dev,
> >       struct drm_mode_create_dumb *args =3D data;
> >       int err;
> >
> > +     if (args->flags)
> > +             drm_warn_once(dev, "drm_mode_create_dumb.flags is not zer=
o.\n");
> > +     args->flags =3D 0;
> > +
> >       err =3D drm_mode_create_dumb(dev, args, file_priv);
> >       if (err) {
> >               args->handle =3D 0;
> > diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buff=
ers.h
> > index 1f3a8236fb3d..4657e44533f4 100644
> > --- a/include/drm/drm_dumb_buffers.h
> > +++ b/include/drm/drm_dumb_buffers.h
> > @@ -6,6 +6,9 @@
> >   struct drm_device;
> >   struct drm_mode_create_dumb;
> >
> > +/* drm_mode_create_dumb flags for internal use */
> > +#define DRM_MODE_DUMB_KERNEL_MAP     (1<<0)
> > +
> >   int drm_mode_size_dumb(struct drm_device *dev,
> >                      struct drm_mode_create_dumb *args,
> >                      unsigned long hw_pitch_align,
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG N=C3=
=BCrnberg)
>
>

