Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C27CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=; b=pNwjsGP1XJAq7G877b3QTH3n40
	Hfh/A/Fe1Ah0CT0jEssglEGEeABWoY155MDKz0k0Xt0bJFTF05YSfzlNxvaEbWppheqtib+R7yoJ2
	THzr8LUxlFB52iXSlNkI3OSB9qvZdcmNs3sQ5mi00iaZuf3XiqfBv9P5IZ/5xsMTId5EtOm+p7XrY
	yR5jx+hs6MgSaVSeD46fzoTuQfoFcOHHNGRXDY4iePIGMLWYH42NiR65q/JP+JVAenow9RqsDPCCQ
	ABY73aMOPR0o00EwZ9ZzBHcmTJK4M0wpeukqSWyKgZ/OBSD3LjDeye2txvub2Gx/iid4zdp4vcGo3
	2nQNmMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLRE-00000004kDE-1Lg2;
	Wed, 27 May 2026 21:05:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLRB-00000004kCs-3VQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:05:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso10344607e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779915911; cv=none;
        d=google.com; s=arc-20240605;
        b=F7acOI50Iv7e7juMy+e/eVwSU+ltNC7Qa9D9PCuC7CvfdGYOoUNg3o787RmFnSruj6
         nYu4srG2DvxYdL8/r0ZOtilWqedv+ON4BCscINdMNdf7d1MhFhkQjqswqLyowwHACZoT
         BqG88SpReo/3QkDCNVIsURWIPxVDmOEOthSz8GninWp8MQQZ4E66DR5FVmAf2dQzYGK+
         EllFMx8fA+hMP2zSxN8A90JXmSkcM65yAQOCITV8j07cRJesUuIAw+hwY7n07uBbVy38
         fH7e9/HV8GlXXGSZM0+dRKu6KtgDwqRj3D5SVt5iwvXTr/FpIe0m3P44quGTK3HFa6lm
         fQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        fh=hNgRrAtmrIdPU71Xpw4c4Q0hbNLB5QHOh8i/srdFykA=;
        b=VywO9iP8J7kvVaYmgByYJ+WtLrxXN5UD9vMOiPGSPX8fmsoBz8tE+a5p3dgeBz6S4v
         ieQN3i5Jv8fvo/hzisjyAG9ZDRU1nZXSp7oVZ1eelM0qTs1PSAQcu26tURs5dxGTtmM0
         qEhgUQGAosxPMpHtDXXNewkG/MIEHHn9JygYhvHvZlU9X5P+XgZ8P3iPIYXkVYUcO7gi
         Rm+BpoLxB6oi5FIjohAA19xfTgyMR/GBfBdR4R6tORtxuwgH/9dXIjGFG5xXY08WK3wB
         i1osjPAYB8XGCNgOWWSQcJAUExJdfL5o4PqsWJQScDZQysxejY0BYPimgt2g9dkLkHJN
         Y8NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779915911; x=1780520711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        b=JSOnrcGO6J2ZNewIEvnG31y0XCwXBLeuOCofyGDbRrBNRcxlZde3WvVx/Z0nHH+a5+
         diF5KZ2e1lXEVJARt5AYMeE+GuzuWBw4TTGl+8LxXcNw/yQKfjr3x7xtUnQK6x4yogyY
         qNYyR9oDfytiGyAkPkHf7fIjeqr2SCbtUuijg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915911; x=1780520711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klhpPa38J0whnw5RO/BZGOXxuOqg7LvqNeDQIX9ReEM=;
        b=CpzKcqZ3lzcHCAAfI1wXS4/78wLi+egQJFHvMREP/j5B7zxy2S6aT3XI644TSLQKl1
         EYulkCXv1+URrhF8m2hI79DIowTg82BjuJJMqDifi0+OoxnKQ+c8Fw7C8/IuExNkrj9a
         pc4NQOIBMDAMuaRxsxkWbqgRIzI3leODtSrSHkTMXaQ/SM0hLuaPptzzi9zbWzsLLskv
         0/f/2uSSCISMFEOzHs3fXa+KvlDZtQFnre+u0PhNo/QAe46+1M1W5pJGb9a22MOY5mq3
         ZnaPLH5fHB+B2o0D2u62USyNo6Dq04Im2+rxbBcQZv8IM9fnWlgRDZK6jG/Cgo/M/LsI
         J7OA==
X-Forwarded-Encrypted: i=1; AFNElJ+LVW03G8ZMGUybwBaTVxkWkPMLLYhPATt+tl6aJUAni0REvc46FxEvIIBdt5RaN2weqMjSenGGrxFT3v+NbquT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw+sLtQXtgEyPVPOmp46O62xeLMPkIXAsk13Qqjk66RsdO1Nb7
	PlZ+KsegUUtxjRKveY8TsbuhHnyUWIPn6ZAYRzPKYQ5F4O7kFpA8dg3ur/hG6JF74Zp8xdrzxCu
	FDV+pnCWnAUpiGJpFVaLuOCkoQdmBRAckh0VVkNrd
X-Gm-Gg: Acq92OExYAcrkC4Mx4t5EIhDZA2orbYGmvpgBJe2ewxcSZ7jH/ppvwXIY3Oj0N7U5Lt
	GGskqbxZF8MzoU4EsLNCYximwlkpf/w/N6hv/K7Zv109CjeYm7SSCIZnZ8EmXI34HXmQOouqMfc
	16y1sr4jweRb5FXMLDYlq5qQzACwICr5URL402E6PKuaXe/dRUEvaILV0XNcC2zK7xXnoJQpEem
	2Dt3vWpZzWnoghp99+SBLZ/Hy6wiE76Ped+HFmNRQmbCxQp5d/mOVOUkUYUtLBYZXJiymSp1uGI
	YXe8r5mgiKenIev3eg==
X-Received: by 2002:a05:6512:65dc:10b0:5a4:1902:3d17 with SMTP id
 2adb3069b0e04-5aa3239b51emr5764637e87.12.1779915911516; Wed, 27 May 2026
 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260326094308.1161335-1-wenst@chromium.org> <20260326094308.1161335-4-wenst@chromium.org>
 <fa11e295-c3a2-4baf-a7d6-a290a4255ca6@sirena.org.uk>
In-Reply-To: <fa11e295-c3a2-4baf-a7d6-a290a4255ca6@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:04:59 +0200
X-Gm-Features: AVHnY4LEGpZKQecMkzAfBGdO7O4dM-_0AAlkjrus41LuLxUrwJWQv5-AV3HxcEY
Message-ID: <CAGXv+5GC_fxarWMgsAyZ2553codJg4U9A7KChjZpmiQp2NGSjQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/exynos: Drop exynos_drm_gem.size field
To: Mark Brown <broonie@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aishwarya.TCV@arm.com, 
	Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_140513_919194_6DFC3AB4 
X-CRM114-Status: GOOD (  21.22  )
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

On Wed, May 27, 2026 at 7:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Mar 26, 2026 at 05:43:05PM +0800, Chen-Yu Tsai wrote:
> > A size field is already included in the base GEM object, and is
> > initialized through drm_gem_object_init() with the same value.
> >
> > Drop the field in the subclass to save some space. More changes to
> > make exynos_drm_gem a subclass of drm_gem_dma_object will follow.
>
> I'm seeing warnings on arm multi_v7_defconfig which also show up in
> other CI which seem to be due to this commit, the type of the size field
> is different so the format specifiers need updating or casts adding:

I posted a fix for this one and a half months ago when the culprit
patch was queued up and I got a report about this from the bots.

Inki hasn't picked up my fix yet. Arnd posted the same fix today.

And it seems the exynos-drm-next stuff was only merged into drm-next
yesterday, now causing the warnings to pop up all over.


ChenYu



> CC [M]  drivers/gpu/drm/exynos/exynos_drm_gem.o
> CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.o
> In file included from ../drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc=
_buf':
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> 70 |                         (unsigned long)exynos_gem->dma_addr, exynos_=
gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
> ../include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
> 563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |         ^~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:69:76: note: format string is =
defined here
> 69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), si=
ze(0x%lx)\n",
>       |                                                                  =
        ~~^
>       |                                                                  =
          |
>       |                                                                  =
          long unsigned int
>       |                                                                  =
        %x
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_free_=
buf':
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:37: warning: format '%lx' e=
xpects argument of type 'long unsigned int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> 84 |                         (unsigned long)exynos_gem->dma_addr, exynos_=
gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
> ../include/drm/drm_print.h:563:39: note: in definition of macro 'drm_dev_=
dbg'
> 563 |         __drm_dev_dbg(NULL, dev, cat, fmt, ##__VA_ARGS__)
>       |                                       ^~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:9: note: in expansion of ma=
cro 'DRM_DEV_DEBUG_KMS'
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |         ^~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/exynos/exynos_drm_gem.c:83:64: note: format string is =
defined here
> 83 |         DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n"=
,
>       |                                                              ~~^
>       |                                                                |
>       |                                                                lo=
ng unsigned int
>       |                                                              %x
> CC [M]  drivers/gpu/drm/rockchip/rockchip_drm_vop.o
> CC [M]  drivers/gpu/drm/exynos/exynos_drm_plane.o

