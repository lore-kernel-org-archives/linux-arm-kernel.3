Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A918C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 04:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xHMK6PQ4DMklkCsGbrG44WpM/VPBrCs6nWRyWKBBsU=; b=tgL2gVY6E6XYsUCRkjIkxaPHyx
	up0IJEf4LLfs4R+X7ZWmptc3ehJOlkpECMkUhOsL5aEXtVOzW2z278Z4y7xWoFD8SZcALrVxXM6oD
	cXlNCaLMfgu1WNmFxDF/LCv7xcRYt8Y39kxeIxJnz0IIyvOh2nvZ4Pz1fQ1eq5ERJgACGmzRczsji
	Lli5YZbyBgr/Lhtf0PJIfZxwVBt+WmRqVdFYrt4okxMWP833FiKsrKRH8vAAakJoHso20+Ftu7H3C
	y7xW1OuQCSpQnawl8oGeKrh6YuYbyKCVK7BiqWpbS/WO8Ez6Cgi79Imf/bWffabfooVbhuN7Omhsz
	Lt8f7Dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV0PK-0000000DTVr-26iI;
	Fri, 27 Jun 2025 04:09:46 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV0N1-0000000DTNZ-3M9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 04:07:25 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5313ea766d8so571518e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 21:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750997242; x=1751602042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xHMK6PQ4DMklkCsGbrG44WpM/VPBrCs6nWRyWKBBsU=;
        b=KrQydiQl/bpHuPaC2er8aE0Ago/qov9/NQC2PZHKcUWS1db1K3wtc/TqWgkAc+1l8X
         w7C67GTe7JyqTem8m989U1Q1HxZH3Vh7hmEIrXuXSYC0UKGo2VWehR1EbcUpe0ldEeXf
         iDU7nbqQ82MbKA14RSulrrB2whRiF25Sb0VRYpwNoijqbwoDmf0Qr1iXIpicxDX/ME9c
         6tV8gK1E0ncLa3TRPNZjGwrFBajAfMnkrf8cUHrItB9bT1eoEXwm+gVejXx7TOrbYn5h
         Yo78AoGTgXUOf5q+IaMiBNjFppJp5TiIoAb+ONXyOpuEtifR6N5GKzybeqUX/VLym4ue
         sDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750997242; x=1751602042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xHMK6PQ4DMklkCsGbrG44WpM/VPBrCs6nWRyWKBBsU=;
        b=i5NGR4iOkAegdCFCZ34gZvh7AtHfNJfl0q2+h8o2/kTS7HTJzy4wSWBhqWpbpIVCKX
         /OpjWwpmuOHOrL/+Aq7idYKrmn2jBiy6uRRgqUuVg75qYq0b9CvGtG3J0pNjhI/NTR9s
         IAlgwF36WP9s3I3QT+TrpKht0qv0wYjY+XpckdSKNTJcro3eCyXtv/7dYD7NjzSsopff
         PydVtXQMIf8/Y5dVU8DIPkJWtkybA+eaFZt33CE/2n21u5GUNjUNpqRpcIb6wHxAujqr
         gLbB3pIi+wzjelhk4Zl1PabiIi3967pXKujzql44k7zg0H2i4L9tkR4XsMTO+/SQu0y1
         GDyg==
X-Forwarded-Encrypted: i=1; AJvYcCU7W/kzyJX6tjX9QpG/NmGuMwpu2dkAjTWu/bfdVyGz3bGqp+QJfB9dxpIKOZLjZxS78LGn/d50LIr+l0AFDT0F@lists.infradead.org
X-Gm-Message-State: AOJu0YyofSwEGWENuAXhYn4qtDELc55dlZpo2ltUFdApaZ3yTkQ27YN5
	1mUiZL5fGxUgIBeHkzOutb+lz/s/9ofI1A49Tbydp5Ko9D7G07CwxMU6QtgAD4jpO32tFsYrfPR
	ZObXdUcnbSxF7y/YZWj+K+5c5YAGVm9U=
X-Gm-Gg: ASbGncszwfLIhJSTGfJBcPOC2b/gpgNI00nFzduBxnYa6jUFqHJ1BLdK96F5yizpIbP
	/ERiYys4aO3O9k1ON8LEQxpjTisIM8HpYIpcKLmY9s4ko+twU4DdLw7Yo1Vg7DZbrjtdFI7QFmC
	gepSyTxc9FzUqDmIuFtw9zqgWUKfF9RGHaJgLKIiiO4g==
X-Google-Smtp-Source: AGHT+IHlxMc86ufSZtcL3j8P2poeXg8qzyvnAbUw4dy1htBYX9hCb5oAZgsY7er9NHUMK/7ApR5+KQERvropag7FPFQ=
X-Received: by 2002:a05:6122:2526:b0:530:720b:abe9 with SMTP id
 71dfb90a1353d-5330bfbe262mr1496367e0c.7.1750997242580; Thu, 26 Jun 2025
 21:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org> <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-2-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 13:06:46 +0900
X-Gm-Features: Ac12FXwIXNh96XjcbS4nbV5KnzWbsp93XPto9lDaR0yFPoINZtMFfYL62VbDpSI
Message-ID: <CAAQKjZM+++P3ozLZZYEusYepamF0qdeuOe+thDb2BevLCsab_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/exynos: exynos7_drm_decon: fix call of decon_commit()
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_210723_841457_CD069B5C 
X-CRM114-Status: GOOD (  22.94  )
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> decon_commit() has a condition guard at the beginning:
>
>         if (ctx->suspended)
>                 return;
>
> But, when it is being called from decon_atomic_enable(), ctx->suspended
> is still set to true, which prevents its execution. decon_commit() is
> vital for setting up display timing values, without which the display
> pipeline fails to function properly. Call the function after
> ctx->suspended is set to false as a fix.

Good observation. However, I think a more generic solution is needed.

>
> Cc: stable@vger.kernel.org
> Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index f91daefa9d2bc5e314c279822047e60ee0d7ca99..43bcbe2e2917df43d7c2d27a9=
771e892628dd682 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -583,9 +583,9 @@ static void decon_atomic_enable(struct exynos_drm_crt=
c *crtc)
>         if (test_and_clear_bit(0, &ctx->irq_flags))
>                 decon_enable_vblank(ctx->crtc);
>
> -       decon_commit(ctx->crtc);
> -
>         ctx->suspended =3D false;
> +
> +       decon_commit(ctx->crtc);

There seem to be three possible solutions:

1. Remove all code related to ctx->suspended. If the pipeline flow is
properly managed as in the exynos5433_drm_decon.c module, checking the
ctx->suspended state may no longer be necessary.
2. Remove the ctx->suspended check from decon_commit(). Since the
runtime PM resume is already called before decon_commit() in
decon_atomic_enable(), the DECON controller should already be enabled
at the hardware level, and decon_commit() should work correctly.
3. Move the code that updates ctx->suspended from
decon_atomic_enable() and decon_atomic_disable() to
exynos7_decon_resume() and exynos7_decon_suspend(), respectively. The
decon_atomic_enable() function calls pm_runtime_resume_and_get(),
which ultimately triggers exynos7_decon_resume(). It would be more
appropriate to set ctx->suspended =3D false in the
exynos7_decon_resume() function, as this is the standard place to
handle hardware state changes and resume actions.
decon_atomic_enable() is responsible for requesting enablement of the
DECON controller, but actual hardware state transitions will be
handled within exynos7_decon_resume() and exynos7_decon_suspend().


Unfortunately, I do not have hardware to test this patch myself. Would
it be possible for you to try one of these approaches and verify the
behavior?
Option 1 would be the best solution if feasible.

Thanks,
Inki Dae

>  }
>
>  static void decon_atomic_disable(struct exynos_drm_crtc *crtc)
>
> --
> 2.49.0
>
>

