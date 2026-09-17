Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C79C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=; b=jfPyravvs9nPOvIsNX+94i+tc6
	CmQFZvxlenpOv/nFfVg1/WV3veeR9DuH4rkTYCpvVv5/rdfx/RkIMYtC7Lo7PHeYPjnLfOv4pJK96
	YkbaAlka/bwuwB27M52cmCrsH4GDTlOQVvDUrBMtpRE/l9rrxBXtxq5OGBtJkcVAbirrLNx71Oyf/
	N8gAKUBSI9ABZcboShj9gITZ7YJYVmqNUOsJq7Rrxq6uxbKEgh+gc3jjRz9xiDgV8MlZheyl5cHk/
	EwVIQZMCh3PqUTS2HOW9pGibXcrKcJTEyffgU/RVHBOz0kfpg6QyHbBW6d7Icq/Kbt8y/ThMA4DLn
	6E8zKSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AW2-0000000BDRI-4AZr;
	Thu, 17 Sep 2026 11:42:58 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AVx-0000000BDPN-2jwv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:42:55 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab20a33so734016d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 04:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645372; cv=none;
        d=google.com; s=arc-20260327;
        b=EzKOPSZXME6O26Ep63Fs33QoW/Qzal1FU8fWYdw5mFOSxvkChfzGkS612pqNKlJIQe
         7YNXlufYY34bETPG9Y5VEHWbTzkp9vyj2RwXVMApReJ4/r3d1Wz4AWazwaDleCn+Wpav
         U6zc5sP80NKfo0Av7Bt9o+Ge8aG2g1PdvlY9I9PABbvAMcxS0UUc8uV0ZxpZIbInp2iA
         fs38qrkAhAWKYBOKF1GgVp/F3BU0wof9SqwhTkrTKYF9ImeZXehjzc7zhmK0Tb+CMNBd
         uv6+IIgZpgOh7ZIEY3diE4uEbDhrYAy0/bYJY0qUav3gnlVQ0MMj9HZmDEA/8rnlG84e
         +e/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        fh=/E2a2SkTwlC1CJvrNErlWDx/TeEgfSfOBpGHQf5jXS8=;
        b=SS58W8BWIp6vgjvmKaXAnfZ2UbFwGJDDEHghcbLLFbo+0VO0R/m7nDotdyL0MIQbS8
         qr+mJI/n63H9w/P2fScftUdwTPOEUTr2X4WTzHHuP5UixPEm9DS6PZGY8EPqlqDP7Rfr
         JDR1msT0yQ1drAhLtmgOi6NCsV2x5XNuxCxgGPsqtz/WjIbAyVnnN+2kpCdxzgceuOQZ
         miM7jxrZfrq9YMyq0DnzL17L/KeC1ZbNgA427fL1ck95d0o/jCTHAyW5HCVLJcbe27FJ
         BHMiQGTlj2f8R/4AuF0PoyghcI1J6o6IHmXGjzdCjTBb2oE/t0fSpUYqvw6Y118qGiiY
         SDnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789645372; x=1790250172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=CJcR+19kv3sDGcl96pz4mDvZLSBWRg739ioB5LGnCT01Mu3cWWKe01snj21bDfTwVB
         wdpUnwZyzwg7FKlfUBhU52KWqKaAG1qitgPkbhMqLuOz+pXP+P1TYLxjnAFMlZMfwKRZ
         bN5sjtHVuJSfBKoQZ+9Vss3VKdPIABFXdi0/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645372; x=1790250172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=neAjlaA9ZffMWmXrqGXpGL0fUCwbIjvesS+vWI5mC8b3dOZd/w0rBrElZqCwvET9xr
         dL2YI+dKGYal6ZRw4TL+IcmhxVp0D68UuwKWbMJCu7cRQL6CJBmRaR2MLsYewQcySTlE
         JPjpPG7L9dKyezSaQfCaaDUADmjIjUVY6/DBiCDF5acwuHmZNoMiXWJm+Rdi8DjH4OzQ
         FCdj6K4BRue3a9w8h0/RCSgW30jN4K+MNVkEWX3lKyLYSURTgsFlAB+JmGey1t/3OBDT
         WwZUlYqV+nkku2mIcaErAKRzzNQXpe4HCH+C7uFMvVh8hpBE07XVdliKjWY/UQLZVrQA
         8/Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzbMnWxL00Jt/gD3oKDwCamB5lv1FUBFGBSRZPzQAwDXeFCvZ4K9Vw7JookW6QEPf749Ogxoum5TuqYnb9OC9wh@lists.infradead.org
X-Gm-Message-State: AFuF++mZmmt7X2EMg1aE2l75zKHdWxPFzrqcNsLbuc72ncmaR00TDKPJ
	X+tnlvlyxk3qMpYGpbS20vWxDFTw1mLUXoyBuEgHDhy/lumL+Dwkba2WEtoyBOEfrSMpEnJRb0D
	GXpy8yZjM8KMFfAFVQ7hbjJdkEZjwd6osn2HSCIR5
X-Gm-Gg: AYBFou0MQvZazT8fmoxmgk5B88cdMHL4alJfPSGm3UWkSKNTJ7OlhxsdiNGsI9ONVp9
	75KQFdc1I4eWehTM+O4U7yTappgN47ySe97snEswxVy0lC8InSfpvFe5mhIEwnhPiJzCnSULYBS
	MzZTVA0iTyOxHHpT4bWwp3X7QGkHKDE3jl19Dmc2d/RXnj/isqNLK+QjA9Op3ESathv5TV9Junt
	APp6vz4hioVHtPybDPyKMTufgUeMjCXhWs092mX/u+S8BOaswXV5I4VX+1YKr5TEDGSwCEBFpyj
	DZhO9MoxWWPxo3+jqBy1ypet7MYqLiI4zZYV7FW7TTKLa67Jnjods6BkZlDXZRE9MesSQaDl8gB
	NktWBM25d
X-Received: by 2002:a05:690e:1181:b0:66e:54a0:cdd3 with SMTP id
 956f58d0204a3-6717724501emr313133d50.42.1789645371777; Thu, 17 Sep 2026
 04:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
In-Reply-To: <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Sep 2026 19:42:39 +0800
X-Gm-Features: AcwNN1UiSWBQWxLfTBKkSaF0uFiyhB3L4EIUoSHVNJlTekBmF6uuJ4F5EBEDj-E
Message-ID: <CAGXv+5FHiW8umZ=wLLb5wK5Qz3hf-mbxC_zH5v+pwxxyUNTwew@mail.gmail.com>
Subject: Re: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr()
 helper
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_044253_736065_43ECE934 
X-CRM114-Status: GOOD (  32.91  )
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

On Thu, Sep 17, 2026 at 7:16=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-09-16=E4=B8=89=E7=9A=84 11:33 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.
> >
> > Changes since v1:
> > - Add and use new drm_framebuffer_get_block_offset() helper (Thomas)
> >
> >
> > This series adds a helper to retrieve the buffer starting address of
> > a
> > "clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
> > which gives the address of the full buffer.
>
> Should vs_fb_get_dma_addr() in verisilicon/vs_plane.c be replaced with
> this helper too?
>
> I implemented manual framebuffer offset addition here.

Didn't I replace vs_fb_get_dma_addr() with drm_fb_dma_get_gem_addr()
already? At the time only primary and cursor planes were supported by
the driver. The primary plane can't be clipped, and the cursor plane
had some custom clipping, but seemed to want the unclipped address.


ChenYu

> Thanks,
> Icenowy
>
> >
> > Some drivers program their hardware with clipped dimensions, so they
> > should be using the clipped buffer address as well, unless the
> > hardware
> > can advance the scanout directly. (Side note: many drivers still use
> > the non-clipped dimensions.)
> >
> > While at it, also pull out the offset calculation of
> > drm_fb_dma_get_gem_addr()
> > into a separate helper in drm_framebuffer.[ch], thereby separating
> > responsibilities.
> >
> > The sun4i driver was recently incorrectly converted to use the
> > unclipped
> > drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
> > pixel groups, but also exposed the mismatch between the dimensions
> > used
> > vs the buffer address. Two other drivers were also touched.
> >
> >
> > Patch 1 adds a new helper to return the byte offset into a
> > framebuffer
> > for the start of the pixel block of the given pixel coordinates.
> >
> > Patch 2 adds the new helper to return the buffer address based on
> > clipped coordinates.
> >
> > Patch 3 switches the sun4i driver to the new helper, and fixes the
> > luma plane buffer address offset for subsampled YUV formats.
> >
> > Patch 4 converts the imx/dc driver to use the new helper. This fixes
> > a
> > mismatch between the programmed coordinates and the buffer address.
> >
> > Patch 5 replaces the open coded buffer address calculation in the
> > imx/dcss driver with the new helper. Existing behavior, which might
> > be
> > wrong, is preserved.
> >
> >
> > Please help test. The series is only compile tested on my end. The
> > sun4i
> > changes should revert its behavior to before the
> > drm_fb_dma_get_gem_addr()
> > was adopted. The imx/dcss changes should not have any behavioral
> > difference.
> >
> >
> > Thanks
> > ChenYu
> >
> > Chen-Yu Tsai (5):
> >   drm: Split framebuffer pixel offset calculation from
> >     drm_fb_dma_get_gem_addr()
> >   drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
> >   drm/sun4i: layers: Fix VI buffer address for clipped offsets
> >   drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >   drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >
> >  drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++----------
> > --
> >  drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
> >  drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
> >  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
> >  include/drm/drm_fb_dma_helper.h        |  4 ++
> >  include/drm/drm_framebuffer.h          |  3 ++
> >  8 files changed, 118 insertions(+), 51 deletions(-)

