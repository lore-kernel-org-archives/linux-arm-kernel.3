Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A72CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=; b=1c7RyjovqtSa1+nUyQkI7Xqa8G
	gyszRJPq7vcEyrxxT4IDO/jcdTz43qVnjHUg38IkHibmyGfndByYYTU+q8QecnPYfScyryw2wuBRS
	rFATXXceKtuf4L5owhkG7YUN694m0N6NUah412iUZfCMzyZMFxc6gpv79o9ERsDoJxGt9SO98Q66k
	Je+mLQ5cS0rT3dwTcG4i4THTyT/4U1vhDgr0qzHuTOXZdTIZ17J+LVfCZOp0VnZZSIQen0MclE1Pq
	S9iw1LkRz1Lu+FmKIKCqr6Ho/3M/F6+jhzPj2b6JDVKm2KJYOZgUpPNsNzgYvgTqre8q9XPy2haIx
	4MR/gydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLPL-00000004k45-0SNx;
	Wed, 27 May 2026 21:03:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLPI-00000004k3h-2jbR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:03:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a87782588cso6010208e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779915794; cv=none;
        d=google.com; s=arc-20240605;
        b=YvleNinYySYcCUWV7ASKZfNWrh9ZKGruLcCJua8NC7RrWhxmERWi/WHdp1xen7yGot
         ctp2rhX4RS4zT03CU0fhEaxppMBiLYbX/FjlxOG54seLhqDsZlRx+iNYqTdnAUCwDpIz
         8zPBuS4/lTqJiXWY17Ao3nuwEtIx3Psz5WqN28e8wm296wkgTVjHtQU0YVXwIZD/4glZ
         wSpdu3wSf120vtrg4CjQVmCNcXZP8W8Ut+cxEPar7bEqVxhcZ06BHG5s5W2oKum1capr
         TxI7PVZ0KHzo+4Cz8+1Kbg1vExsF2nj522ZBzgcj8QYCLTeuy5bfK1VuReGNkkxuxZ/v
         XVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        fh=sFQbNfPNad5BUJ/ec8Q6iJHrmflNmSLtQheRtBYXQzs=;
        b=cqWt18ymbXzkGKHnPL+eit/6m0ohFRZqVClYeG4wiUEV8+3ixO7rLnvfG4D1lHG0Du
         sIRqhzRfUFhA7cjAjNwebSit4udMfLEL7zpzwhAYuawop2JSFBKWLcoTWj5cKFZYmbCN
         qkyOxpwvGUMmpkhOmafJjlG+Ec/Y3Tzw67BWSrU2BPlOOnP59x7AgL2cJ6jhz8YkGNSb
         O+cyyrYTgX5P6tyvlqd7om76fOLOiUixtRQjcrxpqZIDIYdRZ8CssGdehXU6QjTB+Gmf
         TOh9qR9BJDpFTvh87ibeZdW6PYeG0wcYF0UWKz1AI06wr8mVWJt7nunRAc717X2EmWk5
         pihg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779915794; x=1780520594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        b=AiHE1t9QZ9Qxr3h1ZtT+NESQPqS3jGdOgItSfORBkweS9hV8fTuQzZKZehDplwBFXz
         n2602sWhCoWANUuT6HfxUX/9leni5nputygkQWCZ1gOSdgOHbZNllKDMB7kBF9lspOhH
         ehk2W/IK8DRF/dvsITB+QLdmAivJl423FUwzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915794; x=1780520594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VM4t7RohIYKOVlucu8IYIFbInmIydQz2ONIivwoDCeU=;
        b=ikF5visRp46yCazubUWOt1mwlDEbNHv6l0GDq4Y7CzmZ/vfU5jMewMCde5Z190Rw9M
         aPEhwqAnkUHGIDMQGMCuumFU0J2WQ5Iq1PxIRET3B/10u9ylZIi6U3rw3jw040Lu4Dzd
         zTZbvEH0lCcYrc21vVc0bgXW2MAIt0u1pgGK4TAiwYwcPNXOdory6KUVMlho7tJw9XCd
         nuusGxsPUq3o0hkJdzPNKKQoe1mHd8uRrlj9ouWMYq9QSEHjvBVysrX2sIcOgWs2LRxr
         9rcMtpUQ60pYM9Y0jtUKjdlTnRx1Zgswe0QbwTucisk9heEijFRSW9n3FZhDhzWSfNic
         1KXA==
X-Forwarded-Encrypted: i=1; AFNElJ+zZA7sPigndp1FX65UConzceEbb2LhIUjStmXGhNbdJwdtc9OajYjORR4JZFLoCqhKlVff9Gf26e+z3FFs+Srr@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQ3akmTaEcmEuqJe/M0m5VmVOGM3i/5n83pa97Ics7pt14KFM
	CZ3SBmbZNt++asVjgKFWXRR3co/gH6zch3gOejiFo98TLybQMAeDs9KdTNfEw8RzMI7elX41CtN
	062tLFARvnm9s1+hDXN5xXu5eychQXhZgmFK04j4X
X-Gm-Gg: Acq92OEtRNSrCJVXUK6Q7DGYFte2+afelXqzEoFdryAQf9tFahHSGCRxqCn9w1HQZFq
	927rLi6hwRDIk/GyNaXihEMgrQybXIq4o7S5Kp4BdJAFlbGlj3j43wgS40k2mCLBf0QyxigeqX4
	OSsgNBXBn1OT/BR05sw74nc+WilYbvuwUMBVaKcRSb0Db1Q4i/SIFkAoib+R0BjBPJdKON3mLPh
	Lj5RVfUpVQIm8Ep+QSfwfPEh6nTZpVLc53OL7nhENgiD9ON0lPcWYL21y39Lp7HFdvGHUx/+yos
	ylq0C/1tEPCKHQXC0Q==
X-Received: by 2002:a05:6512:1243:b0:5aa:116c:4127 with SMTP id
 2adb3069b0e04-5aa323a9065mr8608773e87.41.1779915794436; Wed, 27 May 2026
 14:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260527194525.45762-1-arnd@kernel.org>
In-Reply-To: <20260527194525.45762-1-arnd@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:03:03 +0200
X-Gm-Features: AVHnY4LRzDDBlNjN91IVgQeLtIl2oIQHuVQ0PjzTLkjbwtceKRBrVHRW4l0ArGU
Message-ID: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fix size_t format string
To: Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_140316_748737_48788253 
X-CRM114-Status: GOOD (  22.97  )
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

On Wed, May 27, 2026 at 9:45=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The exynos_gem->base.size argument is a size_t rather than an
> unsigned long, so adapt the printk() format string accordingly:
>
> In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_bu=
f':
> drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expect=
s argument of type 'long unsigned int', but argument 6 has type 'size_t' {a=
ka 'unsigned int'} [-Werror=3Dformat=3D]
>    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx),=
 size(0x%lx)\n",
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
>    70 |                         (unsigned long)exynos_gem->dma_addr, exyn=
os_gem->base.size);
>       |                                                              ~~~~=
~~~~~~~~~~~~~~~~~
>       |                                                                  =
            |
>       |                                                                  =
            size_t {aka unsigned int}
>
> The dma_addr in the same line is already printed using a cast
> to unsigned long, so change that similarly to use the correct
> %pad format.
>
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I posted the same patch [1] one and a half months ago when the culprit
patch was queued up and I got a report about this from the bots.

Inki hasn't picked up my fix yet.

And it seems the exynos-drm-next stuff was only merged into drm-next
yesterday, now causing the warnings to pop up all over.

ChenYu

[1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org=
/

> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 297a93b087cd..8e357f2beb9e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *=
exynos_gem, bool kvmap)
>         if (kvmap)
>                 exynos_gem->kvaddr =3D exynos_gem->cookie;
>
> -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x=
%lx)\n",
> -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->=
base.size);
> +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%=
zx)\n",
> +                         &exynos_gem->dma_addr, exynos_gem->base.size);
>         return 0;
>  }
>
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *=
exynos_gem)
>                 return;
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->=
base.size);
> +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +                         &exynos_gem->dma_addr, exynos_gem->base.size);
>
>         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exyno=
s_gem->cookie,
>                         (dma_addr_t)exynos_gem->dma_addr,
> --
> 2.39.5
>

