Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76C3CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knTNCoPdWg2pHCztUfEQ8k7yWdqtvYzIJewGisE0oL4=; b=j+g/bLhZYs3VLMP4hfVqROoGf5
	Ab1CGlYOc0FsMOTsacbxL7NCqNMsQ4hIH9/S1UE+GCROipsjFQCd4PdZchVi948/kHdR8nsB88Olm
	DpTOEY0kCdk9W+5Fiv82GcCwEOumRJ9QuruJVqy8P1L05WPA4XRQuzDEdkrjCLG1V0A7ci2uXHFJ4
	nyCKmuyhlK8bcJQt8o3GtnmF1bPKuEIPfEg3Mf6/bdoyRFFpNAuuvQ4/dVt5xjkA7HgSa2kyfNZbr
	Ifg5WLEf8qTgc59AvDIxC9FhMZdnj/CJZc4RSiiUlxsK8a5sk5xJAs+QhUC05eq+AnYTLJEIZ/Rw0
	CYCvHkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8NG-000000049ST-2PdY;
	Mon, 15 Sep 2025 12:32:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8NE-000000049RA-1Ywv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:32:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32e32f702b9so1451091a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1757939519; x=1758544319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knTNCoPdWg2pHCztUfEQ8k7yWdqtvYzIJewGisE0oL4=;
        b=eH76I9XdjzOX+yd7lb0fExAX2HYOryGRDh2fKRFtBcikOU1+mYJ7AWJwyh0O5tZ+3d
         w73hxexVIQe3xQMRV3gP/NXAc6IhsZ8Ca55tl75ZQH2LyXGy3/IiYD8mdVAjX/sCHrAf
         DxQJppB22Fc4TN0EhQQPb5dFL1eC/hinfRhBw46WNCmKFQaee7eFiucOXD6GI20pd1zN
         wf1wWTrvTUU6Pq7uT+uZtirPcHjP3L8Sr/2FqEkrz+L/frxHUpk7SOHNu9P1hdfqJRnM
         SUSosgmHQ5q1JgsOYS3A6KZJnER0VBGbQdt4valRrCfS2gJg78sJt62Ddc36o7wcvY55
         e2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757939519; x=1758544319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knTNCoPdWg2pHCztUfEQ8k7yWdqtvYzIJewGisE0oL4=;
        b=Y2JZsEFLknu1qMiahlurC3Zb2F/kp7Ce8Bn4ZxiNlA4meoyvj5v9Aysx3suv6ZPBFm
         A7a9pKxiu/IDD1poDMcPPoj+Sqfjk5/4xlgLIfYc6xlb+4rRwbNAgiO3kYDOtX+YgT/D
         lZVfDU9eofUHuL3Sg1knwwQwKOAkjXpJ7NVV4MvAmmZU5IZOHrAbET2k40m5oRMgyWwn
         kCngf3ZauADu4ktntPefj9Sq5Staz0wX+h0gvECDisUlFZTSm/3EK0Lq41yWi/aHigeA
         pRpgdwVBk7D+g1aZLHuPVQ8rh4JuA7PvwkjS5YjoECO9gbPOCHnGHBUJpYhQFegbDATs
         i+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxUwJIZT9lS9PNiS5ZXrHdX2ugA2+goGPrWNuSTenW+me8NNIFOIIJQtbfCzU1on69vmqClamXWGmP1ysFNTK8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0QbtXyE0ax0RXPmD2S5493ng0QP988gMpCde5yLQIXNJDqt4k
	/a/CBSwMAvgs3IVs1xDZfsYWkv7LE9CF4Y0iIGeNL2NDHCrNzyR77kfleDPMEb9uxitJJmHiDgJ
	/hwOfwlw98BI6+Gsv8V/8FGN0HcztFQg087j1m7hfHA==
X-Gm-Gg: ASbGncvKfVwhYdSXL1A9TnLVsnaN54IzmfSsLo42Z0sbXyPbbarRdBE87gBYtDLZhNY
	LnHIYKpl6iE2yreFgtULQEIR3s/P6pcXKfWMkJC86d1IiHHr49YmPeCXCwguSYGikUtmcwRO+rE
	Pz97ISk+h9zkSV3w8L9jHe/DmNt/p5oSN1OBPoE6RjpFr3qn8zlB8j9mKuGxqe0zKCgXRaR1dCD
	ZrMKJPp/Bsrc2JYLGwM93n3l6uVzKgajXIYEOY0tVWgroGAt353
X-Google-Smtp-Source: AGHT+IH/frGLEtZ7ZHZnQY/5z33pxs75DFZAWxPCVhbB4mB21NkvYviO2w4jUhkbFFY8+vXiW0ByKtS6YODahX8cUnM=
X-Received: by 2002:a17:90b:4c4d:b0:32e:32e4:9785 with SMTP id
 98e67ed59e1d1-32e32e49ff9mr6355901a91.6.1757939518184; Mon, 15 Sep 2025
 05:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com> <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
In-Reply-To: <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Sep 2025 13:31:45 +0100
X-Gm-Features: Ac12FXx-lR_XqhTnyAEupBeFxl6WMTjW6Kcjw5_GSL4qiK2IHfeaMNkbyUCiheY
Message-ID: <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
	joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_053200_416907_0683C820 
X-CRM114-Status: GOOD (  24.89  )
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

Hi N=C3=ADcolas,

On Wed, 3 Sept 2025 at 19:43, N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> On Tue, 2025-08-26 at 13:25 +0100, Daniel Stone wrote:
> Based on this discussion, this is my understanding for the changes
> desired on the series and their reasonings:
>
> 1. Add a driver cap, DRM_CAP_POST_BLEND_COLOR_PIPELINE, which drivers
> will use to signal they support post-blend color pipelines.
>   - Reason: Allow userspace to figure out that the driver doesn't
> support post-blend color pipelines and choose to not set the client
> cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, so it can use legacy
> color management instead.
> 2. Make it so setting the client cap,
> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, fails if the driver cap,
> DRM_CAP_POST_BLEND_COLOR_PIPELINE, isn't set
>   - Reason: Prevent userspace from making color management unusable if
> the driver doesn't support post-blend color pipelines, as the legacy
> color-management properties (GAMMA_LUT, DEGAMMA_LUT, CTM) would be
> unwriteable with the client cap set.

Definitely.

> 3. Make legacy color-management properties (GAMMA_LUT, DEGAMMA_LUT,
> CTM) read-only if the client cap,
> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, is set
>   - Reason: Allow drm_info to print legacy color management
> configuration while still enabling post-blend color pipelines through
> the client cap. Also to allow smooth handover from pre-colorop
> userspace client to colorop-ready userspace client, as the latter can
> now replicate the legacy color configuration through the colorops.

I think yes, but I don't really feel strongly about this. If others
involved have stronger opinions, I'm happy to yield.

> Side note: Smooth handover back to pre-colorop userspace after tweaking
> the colorops to something else would not be possible without making the
> legacy properties writable too, so that the client could update them to
> match the colorops setting before switching back. I don't imagine this
> would be a common use case, and colorops are a superset of the legacy
> properties so there are cases where it wouldn't even be possible to
> replicate the colorop setting on the legacy properties, but thought I'd
> mention this limitation for completeness' sake.

That's a totally acceptable tradeoff. We don't have a standard
inter-client capability handshake, so if downgrading from a
newer/more-capable to an older/less-capable client is a bit janky,
that's OK. There's only so much we can do given the original design
decision for the KMS core to not be opinionated about a 'golden state'
that could be used as a reference for userspace to work from as a
base.

> Also, as Xaver noted, this feedback also applies to pre-blend pipelines
> and its legacy color-management properties (COLOR_ENCODING,
> COLOR_RANGE), so the same changes would be desirable there for the same
> reasons. So we should share this feedback on that series as well.

Yep.

Cheers,
Daniel

