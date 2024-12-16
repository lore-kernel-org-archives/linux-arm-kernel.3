Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ffQGy2TMqwM/P0ea5bqOaj/0Pbat+9jyPLZz6qR+vM=; b=qoVFA0UTkAAVFNE4uD/mrZh+3y
	c7fGdZ48WD8hp0a3+DrRvTpTZsCrmT8E5H5VSQKe8hXdJ1lNE7NgDlVhVob3L9ZgOvO6IU21IaNEE
	Sofhi6wPP+DA2+NyAQlD9jtzO5azC+DmkmpGBcryf9XpXoLML7SX2QB+21H+hyHmY20A3rUYheiCc
	VxY+AI0hbe4NIq2Qf5wTUX0XtKpYOGOSqbmMFZ3ozuOmZmogBu/g542uTeB+5a8I4ZZBpnk6GwFJj
	lJKmeTt0ZTdXLDKP4F5FAlbXVK97YDWOkkHFYegHS4LZ0Op+7izcuzijHVw3Qz9fnIuFpzL2ziXMh
	lEvDbtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCnP-0000000AN0c-2Uf5;
	Mon, 16 Dec 2024 15:14:07 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNClh-0000000AMi7-3kYn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:12:23 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e3f78f5fc07so3107077276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734361940; x=1734966740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ffQGy2TMqwM/P0ea5bqOaj/0Pbat+9jyPLZz6qR+vM=;
        b=thGkGllrBoISG3frWuR7yslzBBbGnbN5dhG4gBlMB0+f9qn3Kfy+QGBONE0TI2vJto
         KBIBLBaYD6OnhcvrvtYlIY4YcXh0C73PqxkCH5OAvhgjvKAowQHyMm/bGmI2Mkbfwjmb
         varKSx4dyo0yt10vAMFQqovbQAQ54U3trDcQZOfsCOR+q4diA+0ZhMsU/E6nmL0eUad6
         UOUGoAXvYhatpTYv8qL3OcDKRyYw+F8PzfMprlfEivrWbnwPq/gPN7hmB7QTosyRnQNi
         gZd4EozMDJ4flbogJ3roGjoJsn5q+QOgqU20ZCEKaQk1G8vfuJH4tR3MFML/NYiDAnMh
         haRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361940; x=1734966740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ffQGy2TMqwM/P0ea5bqOaj/0Pbat+9jyPLZz6qR+vM=;
        b=TW5a24QJ2LSlt/hNVOWlTuBgDOsladijdE5xR7z4xSYwHljRXAbxeDU8DXt609e802
         U9NpcPdyTzWePMjFTH88jP3syzwsBZr5FUmghuE8KGcEmx+BJpiH1pTkZpm+mNp88mxR
         UCKfsUUnw4jlKhA/r+R34W4jkqliiK/xVXCJJ68Nm2Fy63FQYFTIZonk+mlAcwMfDNW8
         U4ICBrpC7MRSl5ye9xzZzWpcNVZawabsNGw3X/zdnf2KQDnMnbx4b4p3gQNMiun9qcmK
         jnIYHpdj2JqvzGnIulT5P+E/JEfzHu7MUGYJMEg00lwYG+JsOSG2/xXZVMfLG++gIrrT
         d/YA==
X-Forwarded-Encrypted: i=1; AJvYcCWEz3rE7qMCoHIX+P/k4v/SPdg2Ef7tUvnSFFzLXPwy4HL0xZBMT2AdYIT+2TyfV0kPFw6W5QtQp1DcP3H8tDa6@lists.infradead.org
X-Gm-Message-State: AOJu0YwGpxJzwQaNAOGCCjkM2xy92aOVruhR7EbsjEw1IfwGR5zitgdm
	CRSZqRUT0hs95lsAn4po77bQBO038Wdn5UKV2b0CYIAfL9XxzCEt3fNlKAlPS8AYSbsPq5e7AaF
	PD7cfaT+CSgPU+nADxooymT1t2yO5FhgfqfRytQ==
X-Gm-Gg: ASbGnctO7O+dVEzW9aHJH4S57VixrVtPgcHz1rMVb+ISMCRBUtr+T21UhSKL2uepM06
	PjBQq7QI5nyFV8ZfqvTz7iEM9W4sRBLEKdf9I6I37kYTqbHKIuh0J
X-Google-Smtp-Source: AGHT+IFkMt1zHDB2S3QiYdScTiiPg+ltfkwwZwvvoVehY7huEV6zK2tbYbYSsx3gC5GsnfCaH/SlaLvHa4pCCl1Vu/Q=
X-Received: by 2002:a05:6902:3301:b0:e47:f4e3:8804 with SMTP id
 3f1490d57ef6-e47f4e38da5mr5451800276.24.1734361940405; Mon, 16 Dec 2024
 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp> <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
In-Reply-To: <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 17:12:09 +0200
Message-ID: <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Harry Wentland <harry.wentland@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_071222_742221_E90124AE 
X-CRM114-Status: GOOD (  26.66  )
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

On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> >> Reading access to connector->eld can happen at the same time the
> >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> >> order to protect connector->eld from concurrent access.
> >>
> >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >
> > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this one
> > and to the radeon patches? I'd like to be able to pick the series for
> > drm-misc and these two are not reviewed by you.
> >
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
> >>                      continue;
> >>
> >>              *enabled = true;
> >> +            mutex_lock(&connector->eld_mutex);
> >>              ret = drm_eld_size(connector->eld);
> >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> >> +            mutex_unlock(&connector->eld_mutex);
>
> All of this is wrapped by the adev->dm.audio_lock mutex. It might
> be safer to modify the audio_lock mutex so it only guards the
> aconnector->audio_inst access.
>
> But I don't see any way these mutexes would otherwise interact,
> so this change should be good as-is.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Would you ack it to merge it through drm-misc? Or would you prefer to
pick up those two patches after merging drm-misc-next once the rest of
the series lands?

>
> Harry
>
> >>
> >>              break;
> >>      }
> >>
> >> --
> >> 2.39.5
> >>
> >
>


-- 
With best wishes
Dmitry

