Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBB4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=; b=3xvsV28EZaZw+uEhni6Cs4GKRu
	0/OO2gUQxfcUoWynJXDI0qmSezz0+/e2A45gkcNymkkOieiyLyxTxdyEO17QeyFzEVVT5PvIwRlPt
	YY8e/l7SvvQi95rBz+3aKe1fM+cllsAPFDe7bZhIcihz3PnqwWKiDlDEng3K4o2UztTlP4QWKIaI6
	DjG5JONLlDY/Rp61NCdC5JONMDLMAxUhrWci31Z92i7bIoB7O6kGL1vH9R3dP+hv5X8HfM7iie9oZ
	DX2yfexoV0o7Oe2DS8gBOjZD9h12kYWleOx4z61jvWtoK1qo3fmk9aJfgi4xTB6goFLLzzbOKG4q8
	AEWPBiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tND5y-0000000AQ6T-1Ree;
	Mon, 16 Dec 2024 15:33:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tND4p-0000000APxY-3PZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:32:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-725e0798585so169729b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734363127; x=1734967927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
        b=Ymxltl6W1BkSBNdeDGFyEklNEJoZGCPoB8JKNXIPl9FRK5XYoiSDmJoTkkFicSZWXp
         Gq53qq2xTR5CRpHOgcAMpcPOJ7ixvDdqzSSj5M52ow5JsArdPpXicKWSdmDtyP85bH6r
         9DpEAUkGbeD+jrGkDQ5USl5DCcFMQ/FhpG7WgFbuobVN8VomeyB9VhlVFcNJ4Vfq5KgR
         R4Zx8Puy8Xo24Pp201wN5M4y+ZCo4K3TyMVz0oWa2E+y4DO+l0FZe5ZWGM0Nqu2vMwC6
         K25SCrZXa/gdNI75SUJ4ZtLOOgo5WVcfs97H09KAQ8uZVmrw9TFcEbQKRdYVJkOQL2bc
         m3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363127; x=1734967927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
        b=CIdzUZL52jQhkzbWgTdULuARj+4jjm7rPSYlLWvSQ+buxjff2Q5vb8m4bPi9+ewo0H
         RwlBog4OyZiLaWZsRj9F8BbnecgqKcx7h6kJcJ8wXSR8bLuJHf0+3ZyLvUjsc9e2SQEx
         LZrQfvbzoTmGk2318K3NW62drPX3Tk9GK55SndU6UHrOC9YRDJvanUN7at8aK9P6ne95
         k0Gm2445EMKHEn8gmvh0nOboGDiYRft6wOXBQC/pH+uUEt5FwwiWd4m0sb8Bh8whX+EG
         4RPYwqUTO8rroaZQ/dwxW9GaIPi16gkQiDRVi5BksBZY4nFeSl9To8CSOrbohjriv+3N
         4vLg==
X-Forwarded-Encrypted: i=1; AJvYcCXtzJBfm43S8SWVBInBjn1AcH8X4rWMIyo692/8kZY1qCkxsIqc4o4ROBSI3kQdIduF8pEC+raJVeVPyO/63iAT@lists.infradead.org
X-Gm-Message-State: AOJu0YzcEySIWvpREm2xDHfPghTlt3lvgCoDpc/qqGwAVkKhULbc7lk2
	aOUlx6LvL3UptL7QE+YZnarwEHUcylauQ+uwyY0wQrNZ/8S3KglQ/FfvfS5q8TEzAlspi9VYNU0
	O9v+NrXWyoXIc2Dej3a3/Pkd4Pxg=
X-Gm-Gg: ASbGncu5FjkrMHJcbVANxtpGSyjyconN1f2aeJY+QR7V9wefY1iaWwgdpO3CLpP+E6U
	zQfTtO/XgWyEFEQTlC1xUwWVlIM3nJdcZw7huyA==
X-Google-Smtp-Source: AGHT+IENFuEqCpmJ+fh0Mtq+tiJji0QPe43tbh0IyC96vkUIWO6e+Z85h0KDNnVCSDCt9fLi9Qb2WTPgncrCMq+hdNM=
X-Received: by 2002:a17:90b:5444:b0:2ef:93:154e with SMTP id
 98e67ed59e1d1-2f2901b2b70mr7145457a91.5.1734363126741; Mon, 16 Dec 2024
 07:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com> <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
In-Reply-To: <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 10:31:55 -0500
Message-ID: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Harry Wentland <harry.wentland@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_073207_878264_579B6066 
X-CRM114-Status: GOOD (  28.84  )
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

On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> wro=
te:
> >
> >
> >
> > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > >> Reading access to connector->eld can happen at the same time the
> > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex i=
n
> > >> order to protect connector->eld from concurrent access.
> > >>
> > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >
> > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this on=
e
> > > and to the radeon patches? I'd like to be able to pick the series for
> > > drm-misc and these two are not reviewed by you.
> > >
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647=
f0606fb86fe57f347639 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(=
struct device *kdev, int port,
> > >>                      continue;
> > >>
> > >>              *enabled =3D true;
> > >> +            mutex_lock(&connector->eld_mutex);
> > >>              ret =3D drm_eld_size(connector->eld);
> > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > >> +            mutex_unlock(&connector->eld_mutex);
> >
> > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > be safer to modify the audio_lock mutex so it only guards the
> > aconnector->audio_inst access.
> >
> > But I don't see any way these mutexes would otherwise interact,
> > so this change should be good as-is.
> >
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Would you ack it to merge it through drm-misc? Or would you prefer to
> pick up those two patches after merging drm-misc-next once the rest of
> the series lands?

Merging through drm-misc is fine with me.

Thanks,

Alex

>
> >
> > Harry
> >
> > >>
> > >>              break;
> > >>      }
> > >>
> > >> --
> > >> 2.39.5
> > >>
> > >
> >
>
>
> --
> With best wishes
> Dmitry

