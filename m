Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB16C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=; b=IT2EdThaMNuwHjT7OJESgiHZBd
	nsiiNnBAqElnnztv6UyNLfkGkigxPjv6JXun3i8o+h3OvmMKwS4hiW2G+KXkhtpj6fLURq8qULTsm
	1gMnX4bNCOa5WK4OLIYs1rNA+ws/aHuRMBHQ/ibSwpAoHqgXjuGzbQPlRByfnJ2MvV1ekAQxziEp4
	fHM7mZJKP+gmuz0KEzh5SPKSPooxilfarSeSDFbhuaThL/Lqhfh47KdqtnhxXqb0XRLaWoz2Qm/Vl
	KHJkKLVE09buyVZ2ZBz33LG91F89MJXsL+RNmBD65U0ruAnvw13K6UuDLxYetmzPt8WTcfddMUOuh
	kwVXpcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyU5-0000000DKmr-2kv9;
	Fri, 27 Jun 2025 02:06:33 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyRF-0000000DKZn-0r4H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 02:03:38 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-532dbe71e4eso1048467e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750989816; x=1751594616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
        b=D1nqhpquQ1vDHvQTkqjs2OTG/k9FlMdn1YbhlvNIJBW+7Lrx8ee6VCZpXFBLO5Yd1Z
         ao4E7iQCtGRgkJm5E6XvS6DRu2WVf/GZ4f4I2gCsOdofYarGdeT2s38Wq4bC/0RSdBKa
         IVaEQWfhbjc3ypxInsdaiSvQM9du27nK4A3r3gWEBpoPLeP15o7n7PXXDDMgTj0XDr0n
         MHky3tg2yfrU7vXktf/bCAYZe6sc9y+hqTGggsquqtzt6hzutUkPDNqbcNifauEcHnhf
         zezwgA5B008HsbrhredbrsVhmnokA7xakj/HypZqfQ8OfI8oNb1TT8f32wroyfhrC6Bo
         vLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750989816; x=1751594616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
        b=j5nhsTW8E52UgSNC9aK+IzDbGrf7E7mr26Zh7Cug5HdesVhQbrJ1t8Pwu95rKFBdve
         xzKQZSFmsODx7npO9hrdQvEk9Ga7IQlB4CzjZEg6zbxwKesztpnjemajyDN1NI+fKaFM
         Tta7xRIcjQWp5sMZdsY5IkysxvLQ+nxM/PFe3VKeiRajoGrkJmwCA3DW6WqS4uVJyI4y
         GXM7E5840h/rH4ohyfePcjd1ou+DMbU7Na19PujiuffPHT6jZMFDC4dikJp9Qye6w3bz
         uitI3Aqgmbc47H82OPCIvfE5DIAwyotdg7hO4s/8sdg2dY0Iv0HvckaXFrvzwL5O93o3
         5pFw==
X-Forwarded-Encrypted: i=1; AJvYcCXg3waZWvqTt9qR+7zZ7DxrDn7HttQQT7ykPEvkv3yIGKJw5BTz1F1Upe8cTgH6v1N3yxVc/+q+yOUzKMhBZNIq@lists.infradead.org
X-Gm-Message-State: AOJu0YzvTWLLmT3wgvayJZUKXRve+99kXcf52fndKIJ8t2b1CE2qZrNM
	QnWj3m4QUC+rxy4s+1YIvoESEcUM8eoQGjTua3/yikj/UfRI0lh7RCbrUR7ZaNs3J6hS75QXI3p
	ydsKpwj7iWJD2fXmpktbRcz7nHs4nq20=
X-Gm-Gg: ASbGnctcl7jqGSMCts2Mq7aFxbIX+spJtZo9fnnFzNTPbblP2Ux5qCFAuI+zqVLjQqS
	xlghZxo62VEJdRRu3ffJl0KAb6o6seu51kf5REJvL/4RpTr+BY6Yqf+MfxWViTrd2xonZ3LOoBm
	JoHd+YpHFMnCxFW6+6WGQRzpxCMm2P3OKDbJRnzuZ9iA==
X-Google-Smtp-Source: AGHT+IHhVsq5/VI1dr0dwY9jUchBPbEamRa2csC8XrsamXPtwwwYjcpSjiIYO02pEuPWifIo5HwkuElrIvaVqdLt0x0=
X-Received: by 2002:a05:6122:8c1a:b0:531:2906:752e with SMTP id
 71dfb90a1353d-5330beda07fmr1498050e0c.5.1750989815830; Thu, 26 Jun 2025
 19:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de> <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:02:59 +0900
X-Gm-Features: Ac12FXx_H-k6IjgjBdIwZwvFGVMe7aOTzmfWa57DZUuTaImbO0rimzs6HuQBV-w
Message-ID: <CAAQKjZMBfU5pSsY9sHE3DBB1AZ1sBDp6hXiV9iXVo6acEZezWg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_190337_249231_2D22C290 
X-CRM114-Status: GOOD (  21.80  )
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

Hi,

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 32 ++++++++++++++++-----------=
-----
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f8e6f9eecaacb1535765c246688c8..d44401a695e203bd36b3b6678=
fdeb3572a91bfda 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -174,7 +174,7 @@ static struct exynos_drm_gem *exynos_drm_gem_init(str=
uct drm_device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %pK\n", obj-=
>filp);
> +       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %p\n", obj->=
filp);
>
>         return exynos_gem;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_ipp.c
> index ea9f66037600e1020da4b0a9c318ca2f2266a871..03c8490af4f45447d123a2077=
7e5362ebd933b46 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -271,7 +271,7 @@ static inline struct exynos_drm_ipp_task *
>         task->src.rect.h =3D task->dst.rect.h =3D UINT_MAX;
>         task->transform.rotation =3D DRM_MODE_ROTATE_0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %p\n", task);
>
>         return task;
>  }
> @@ -339,7 +339,7 @@ static int exynos_drm_ipp_task_set(struct exynos_drm_=
ipp_task *task,
>         }
>
>         DRM_DEV_DEBUG_DRIVER(task->dev,
> -                            "Got task %pK configuration from userspace\n=
",
> +                            "Got task %p configuration from userspace\n"=
,
>                              task);
>         return 0;
>  }
> @@ -394,7 +394,7 @@ static void exynos_drm_ipp_task_release_buf(struct ex=
ynos_drm_ipp_buffer *buf)
>  static void exynos_drm_ipp_task_free(struct exynos_drm_ipp *ipp,
>                                  struct exynos_drm_ipp_task *task)
>  {
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %p\n", task);
>
>         exynos_drm_ipp_task_release_buf(&task->src);
>         exynos_drm_ipp_task_release_buf(&task->dst);
> @@ -559,7 +559,7 @@ static int exynos_drm_ipp_check_format(struct exynos_=
drm_ipp_task *task,
>                                             DRM_EXYNOS_IPP_FORMAT_DESTINA=
TION);
>         if (!fmt) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: %s format not supported\n=
",
> +                                    "Task %p: %s format not supported\n"=
,
>                                      task, buf =3D=3D src ? "src" : "dst"=
);
>                 return -EINVAL;
>         }
> @@ -609,7 +609,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         bool rotate =3D (rotation !=3D DRM_MODE_ROTATE_0);
>         bool scale =3D false;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %p\n", task);
>
>         if (src->rect.w =3D=3D UINT_MAX)
>                 src->rect.w =3D src->buf.width;
> @@ -625,7 +625,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             dst->rect.x + dst->rect.w > (dst->buf.width) ||
>             dst->rect.y + dst->rect.h > (dst->buf.height)) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: defined area is outside p=
rovided buffers\n",
> +                                    "Task %p: defined area is outside pr=
ovided buffers\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -642,7 +642,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_SCALE) && scale) ||
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_CONVERT) &&
>              src->buf.fourcc !=3D dst->buf.fourcc)) {
> -               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: hw capabilitie=
s exceeded\n",
> +               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: hw capabilities=
 exceeded\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -655,7 +655,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         if (ret)
>                 return ret;
>
> -       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %pK: all checks done.\n",
> +       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %p: all checks done.\n",
>                              task);
>
>         return ret;
> @@ -667,25 +667,25 @@ static int exynos_drm_ipp_task_setup_buffers(struct=
 exynos_drm_ipp_task *task,
>         struct exynos_drm_ipp_buffer *src =3D &task->src, *dst =3D &task-=
>dst;
>         int ret =3D 0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %pK\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %p\n",
>                              task);
>
>         ret =3D exynos_drm_ipp_task_setup_buffer(src, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: src buffer setup failed\n=
",
> +                                    "Task %p: src buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>         ret =3D exynos_drm_ipp_task_setup_buffer(dst, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: dst buffer setup failed\n=
",
> +                                    "Task %p: dst buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: buffers prepared.\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: buffers prepared.\n",
>                              task);
>
>         return ret;
> @@ -764,7 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_t=
ask *task, int ret)
>         struct exynos_drm_ipp *ipp =3D task->ipp;
>         unsigned long flags;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %pK done: %d\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
>                              ipp->id, task, ret);
>
>         spin_lock_irqsave(&ipp->lock, flags);
> @@ -807,7 +807,7 @@ static void exynos_drm_ipp_next_task(struct exynos_dr=
m_ipp *ipp)
>         spin_unlock_irqrestore(&ipp->lock, flags);
>
>         DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                            "ipp: %d, selected task %pK to run\n", ipp->=
id,
> +                            "ipp: %d, selected task %p to run\n", ipp->i=
d,
>                              task);
>
>         ret =3D ipp->funcs->commit(ipp, task);
> @@ -917,14 +917,14 @@ int exynos_drm_ipp_commit_ioctl(struct drm_device *=
dev, void *data,
>          */
>         if (arg->flags & DRM_EXYNOS_IPP_FLAG_NONBLOCK) {
>                 DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                                    "ipp: %d, nonblocking processing tas=
k %pK\n",
> +                                    "ipp: %d, nonblocking processing tas=
k %p\n",
>                                      ipp->id, task);
>
>                 task->flags |=3D DRM_EXYNOS_IPP_TASK_ASYNC;
>                 exynos_drm_ipp_schedule_task(task->ipp, task);
>                 ret =3D 0;
>         } else {
> -               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%pK\n",
> +               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%p\n",
>                                      ipp->id, task);
>                 exynos_drm_ipp_schedule_task(ipp, task);
>                 ret =3D wait_event_interruptible(ipp->done_wq,
>
> --
> 2.49.0
>
>

