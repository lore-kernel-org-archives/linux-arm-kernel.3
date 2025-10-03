Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE73CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUQoE2+YrP4Piuppn11V4n/Ge5n4X6vhqEU1SyrhiLY=; b=wOpYTcqghoV2CTJQR2wEyR/yEz
	+NbypHDNsMDNCEGXsf2UPQqRzBs6QbkTOWjxYRcImrYgM8/ZNBjedwJaGiLmEv60wGpM6Nz3C8EUS
	TVKXJqXeJFD0h3cz1Z8KpojefK6oZGe+l+YWz0JqUicuzWkIPN8XHjxADYQuCyfAtoqs9qjq42EAW
	WauOnsoEn5/HPFF0RaQSHv58tXU2Ggs432I4VpUFCmbX3tjYFoUCe9ksLZf61M/dPS48XI4KYFhTU
	UEIaoKVETKrignd3NE7R+Q9WfJbYBuq2hRddfdFsmC64AIWxBVbWzzZp8WXc2nu1PRzTDvXtdbWYl
	I1vcPS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kMu-0000000CvHU-3KGU;
	Fri, 03 Oct 2025 18:19:00 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kMs-0000000CvGD-2JL8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:19:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d71bcab6fso27490787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759515537; x=1760120337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUQoE2+YrP4Piuppn11V4n/Ge5n4X6vhqEU1SyrhiLY=;
        b=PqqXcK4ioYVd0vresBGaC47Q4P/2WbKbow4lUigoRR1HDYr64mwldrXs6HUNa9FTHQ
         b1KFOSM5rVQ+XBfEd/2W/Nu0FvFJsQC0fb2B+NLGowHd6qccUEiyovGciaIAzTnLag1N
         CUHWrXty9oIVmtnutkfgcPvobkD+zDjgmEvldbYFAoTbs8I22DEV6ZgLhkp5wS0x9jPn
         HNQaigVzBAheg23LvOzWTPLyQ85GQfnysFfWd0TS3stnoSsZzYPXtrL9VBng4QkvWjrR
         8Fy/sZjpyk5IZtLiWG+S0HjY6YyZApwSXSa/unDuVealkM+0K1jDds5dvynHntcNc5Pc
         IMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515537; x=1760120337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUQoE2+YrP4Piuppn11V4n/Ge5n4X6vhqEU1SyrhiLY=;
        b=DtToI0rXz+sVl/d81VtExErwRevVusQ4nFj7IxKMy1cybNbM9ZwBkAFDWBpSpJ45GI
         eJmxuoJOopw9Bah1IQkZhc4JMxwDAAH6s6RuKbBMs/EdSwXLhStnak3srnupRz3Ue14E
         rNcIJ5F0Fz18YNoalwsJf7zyVWyRf8iBMXRh6xxg7ERwH4DQ9apnsCvqegactnRbW4Ps
         j1KyldG6iCGEK+moUtZ3uER1GJ915T7mtmBj8K8b4h+RvbyLEuR5QwNw6o+pPoDt0OwS
         iqrrZKaeDZUAmKhoGoYMFSb3U3m43YFRomSrPkHB2KJOUa6W+vofHruJYadMjwArDMKZ
         FBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLlb6E/qBya7HW4UCHBydPWo66Tg64d+JsTXf1tZ5es7tOD8vJUlPqurV0+8KiP/JZNeluNtokwC3e3yzvNBhv@lists.infradead.org
X-Gm-Message-State: AOJu0YwupGOqlfRgQRwQezU/8AOUkWdBFrun6jTJQbpxL3P1P/fbOL6Z
	KyGEw7F37LgJ2bEId5bNfweH9kRPQl12NjIC0zBrEkfqqQtuxxcrI4jrdmdkfBPHT5NHhstiQjs
	Bk0+/kHQwv/y46ceohomeRC1NACquJPM=
X-Gm-Gg: ASbGncuH526/P4t1zPSyBWQqsNjbl8dpc05Of8Z4LRllMGv7fVxT0ghij8fNcmUVUoT
	SC2mSgU/KrXjDOF66AapZACdmhMvp37G7zk3pnWk5Gn9bAMldZpJ/fGRRZo0tUSWJdLpTW76dw6
	+oj7Lrt0RAsTUObq7DeQe7k5ovdCKCz6EOtDe7U2ZbqbSeTDiKx9mc3YbngnXwO1adxLP8Vy7hB
	LJ9Ntkf4mVpXeEwhcPNlu8pOMyI80tR042wmOTZHhbl62OA6eDhP+kB54AAwcLN3hyc8BK2GwH2
	fiQUKrv3bksseVuftcmBQg==
X-Google-Smtp-Source: AGHT+IGtLMvtFx4RxHoNIBh2x4X8Ab6Ix6GqGCbCEA5mUc1tZP075IB+GlQMmeZfD4IGoIK1kUGSajZNab9Clue8LXg=
X-Received: by 2002:a53:c043:0:20b0:636:1ee5:7745 with SMTP id
 956f58d0204a3-63b99f36944mr3824334d50.0.1759515537310; Fri, 03 Oct 2025
 11:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com> <20250929-mt8196-gpufreq-v5-5-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-5-3056e5ecf765@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 11:18:45 -0700
X-Gm-Features: AS18NWDjAm-QC4ccunNsvz_U1UXKS_05wvPJ1N_78dxhAoW5d44NTw2whZ6ltCU
Message-ID: <CAPaKu7S6_0G4rbRP_nCF0Aw9uy1K8ABqi2z8isvpHcVWkWjJaQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/panthor: call into devfreq for current frequency
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_111858_600577_DD30B703 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, Sep 29, 2025 at 12:48=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, panthor keeps a cached current frequency value for when it
> wants to retrieve it. This doesn't work well for when things might
> switch frequency without panthor's knowledge.
>
> Instead, implement the get_cur_freq operation, and expose it through a
> helper function to the rest of panthor.
>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 33 +++++++++++++++++++++++++=
++----
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
>  drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
>  drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
>  4 files changed, 34 insertions(+), 8 deletions(-)
>
[...]
> +
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +       unsigned long freq =3D 0;
> +       int ret;
> +
> +       if (!pdevfreq || !pdevfreq->devfreq)
> +               return 0;
> +
> +       if (pdevfreq->devfreq->profile->get_cur_freq) {
This and the other two NULL checks above seem unnecessary. But let's
follow other functions and check for pdevfreq->devfreq only.

With that, Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> +               ret =3D pdevfreq->devfreq->profile->get_cur_freq(ptdev->b=
ase.dev,
> +                                                              &freq);
> +               if (ret)
> +                       return 0;
> +       }
> +
> +       return freq;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> index b7631de695f7d79456478c87e8af5dc47673cd1d..f8e29e02f66cb3281ed4bb4c7=
5cda9bd4df82b92 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptd=
ev);
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
>
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 9f0649ecfc4fc697a21a8b2fc4dd89c8ecf298df..f32c1868bf6d782d99df9dbd0=
babcea049c917e0 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -214,9 +214,6 @@ struct panthor_device {
>         /** @profile_mask: User-set profiling flags for job accounting. *=
/
>         u32 profile_mask;
>
> -       /** @current_frequency: Device clock frequency at present. Set by=
 DVFS*/
> -       unsigned long current_frequency;
> -
>         /** @fast_rate: Maximum device clock frequency. Set by DVFS */
>         unsigned long fast_rate;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index ea4a37b566a8b215f2b7a09c333a696f1dcdb58f..4d59d94c353c3ca76f4b98a41=
1c8f8284efafd08 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -25,6 +25,7 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
>
> +#include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
> @@ -1519,7 +1520,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_=
device *ptdev,
>                 drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats=
.cycles);
>
>         drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate)=
;
> -       drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_fr=
equency);
> +       drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n",
> +                  panthor_devfreq_get_freq(ptdev));
>  }
>
>  static void panthor_show_internal_memory_stats(struct drm_printer *p, st=
ruct drm_file *file)
>
> --
> 2.51.0
>

