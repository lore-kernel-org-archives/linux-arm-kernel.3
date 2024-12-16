Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AFAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=; b=dwytOvFzVT+7uebPaMo8vI3O7X
	26qEQeEa668U+rjweRw/nWeWCKCFXf+3sKpiwI9DddTf5VWhAhGYo2BOLDReav4WdLEraFLzSFgj0
	yjNU1RgXHs1NbCzXJQuBToiCFpS/pdNZVAbt9WEMCmEfs9RNK2nbZsD2kRmvrC3VEHGWodVAxnUqp
	8viGE+vEY+6V+zj5hkHONLlErWzGMAuPHzl9pQG8gPmzr+pwNb7nz8NPOr96WzQN7SAzlgjW7Ow3m
	OnEAmc8voxyZQIJ1mhYdBY2+vppZQLTXS59LDQSgpbFVdjqdQgXI7HQ+wge73KaMyGovuOStoVcua
	T6kucHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDDC-0000000AReR-1arA;
	Mon, 16 Dec 2024 15:40:46 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDC3-0000000AQt0-0GnD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:39:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so2075777276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734363573; x=1734968373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
        b=QKSxod9tVdUqd3U7Eily2uobhkhD2sBHD/wf8Ep1A3M/Z+B9ocab/w3kNYBEqsrck/
         kvqTNM5x+fbS+tUpDW95yAlXwxlEhPTlOyyLN5zhw5oaFi1LzG/xMwDT2HLXAa/+1N70
         x49jCJl0ssYxCYEN5hLxtC6IbMTN74vlKzL0HsqCsLCR+C6gnc15divFd5y68HgKP/cD
         CfR+CezdhtG8h5S8obZMv9j0wG2W+TqY742DWi57YMjLHn4mCaz+09JRfkqOTG9pjs3a
         vvHsGHecRqcyr4/EY19fGLWd7cM29Zg1RLzp7rSfAam20fgedXo+TYEdh4TDsqsyYKZl
         5J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363573; x=1734968373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
        b=ft/8L4KchiqqV+a9rxerQJLkFl0XXSNlvtFygek3R9zmWfHdktL9j5aSkml1UE/NQc
         5TUWhdh8Yjl0yBos9TqaPol3rlKn1Po1G8VaLutPQnrx4mwgXtDSNeFhO9ZHBk0a0owu
         uXXSunf2EgtUiEJ/abmbgfEENyB3Yg+FbyoMhKYfGk/nUmjggaXp/+k4u2WJehpnlmqv
         ZaFPqNamJYjjxqyiwYvky2vqdQ1WFplQw7XOnGSXe4I2rL5oRA2aDaj8MpN8BX3j4ywf
         /skcKZU3l1GMXkL7y6uy8UDgZdBvZ0tkRqC+sORba878vMeoObOimBDLuFYJZxrxJVd5
         duMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsSHYLRpjEvbRn6UI/npR9RCQK96QtbWRmaV9lrDgVAWLh55RrJAj9uF6G0MHk42h6ev+iN89FA9BQv1TNcv50@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2K2atiwBldpP9C7+0i7aeSPEjR/NkhhcPWe//CZHKOobeCj1Z
	pFalUmB04G2wzM6tTSalEl5PVIH45Uu67b1nf8PW6SxDvIyEKDBmChc2CPepA6YOe6E8ePmXuCj
	HZZfO0ZgI77V9KLXGD9WPJXB94DVO+JpkvLlsjA==
X-Gm-Gg: ASbGncvOFhxxene5L3SifpbWL1jIo8Bh+Xj5DiP99LcFco6qxgirHI2WkV40Cfd5gi9
	M6y2BgzSezS2JlOIvuK2bHyaJQfdgiNTOLA8i0ZRjSJQDATflEEIY
X-Google-Smtp-Source: AGHT+IG+H16BKk2N9qAAZI58ZkiAMWnWq2KJ5i2xrkWhHJZG86PFBQyzzbHk+XT6vSRTQXHuY/aP5XO15EqLEv61aT4=
X-Received: by 2002:a05:6902:70b:b0:e33:1096:f2e1 with SMTP id
 3f1490d57ef6-e434fd23319mr9276225276.40.1734363573390; Mon, 16 Dec 2024
 07:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com> <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
 <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
In-Reply-To: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 17:39:22 +0200
Message-ID: <CAA8EJpqYs92T9x3omDa5XR21GC04Kcc75eVRr6w3pt0W7qPX-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Alex Deucher <alexdeucher@gmail.com>
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
X-CRM114-CacheID: sfid-20241216_073935_107663_F7654F61 
X-CRM114-Status: GOOD (  31.27  )
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

On Mon, 16 Dec 2024 at 17:32, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> w=
rote:
> > >
> > >
> > >
> > > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > > >> Reading access to connector->eld can happen at the same time the
> > > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex=
 in
> > > >> order to protect connector->eld from concurrent access.
> > > >>
> > > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >
> > > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this =
one
> > > > and to the radeon patches? I'd like to be able to pick the series f=
or
> > > > drm-misc and these two are not reviewed by you.
> > > >
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce96=
47f0606fb86fe57f347639 100644
> > > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_el=
d(struct device *kdev, int port,
> > > >>                      continue;
> > > >>
> > > >>              *enabled =3D true;
> > > >> +            mutex_lock(&connector->eld_mutex);
> > > >>              ret =3D drm_eld_size(connector->eld);
> > > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > > >> +            mutex_unlock(&connector->eld_mutex);
> > >
> > > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > > be safer to modify the audio_lock mutex so it only guards the
> > > aconnector->audio_inst access.
> > >
> > > But I don't see any way these mutexes would otherwise interact,
> > > so this change should be good as-is.
> > >
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> > Would you ack it to merge it through drm-misc? Or would you prefer to
> > pick up those two patches after merging drm-misc-next once the rest of
> > the series lands?
>
> Merging through drm-misc is fine with me.

Thanks!

>
> Thanks,
>
> Alex
>
> >
> > >
> > > Harry
> > >
> > > >>
> > > >>              break;
> > > >>      }
> > > >>
> > > >> --
> > > >> 2.39.5
> > > >>
> > > >
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

