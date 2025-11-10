Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE624CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 05:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVbcQdsxhGJ251GekmogRgMgrAHB7EALgaSbuq0BgLg=; b=g+r53XJwIAMEEKOfquZLIGiwsD
	gjf5LcNqkNzDJ/0KDoGADskAx8d3z95D/uJVjWn06lRoAa10VWYm7niupntPCt1UXjF6RkUlWuz0b
	XHFZ/9R0Q6D35Ci1JM8vV+EgSL6LzToMh78O48j1dTdne/2HazVMTh5VeeuxnyuACriy4LrNwHg10
	NdiXlKiTu1JMj3z3skgyjcyR5uGOOHCqMoZ3ZZnzrrH5AsTjdIseU2wr/HMtNylUDGRnV6d2q1hFN
	jgUIcpDI4t3VKs23PxbiK9OU394K+1wdJbViNcBba8agMaYg9XnAw5ntd8mCuGO3I2F+6YwIfJjp4
	hnSiNJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKMV-00000004lxZ-0SzB;
	Mon, 10 Nov 2025 05:22:43 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKMS-00000004lwn-1Jp1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 05:22:41 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5dd8988d098so895281137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 21:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762752159; x=1763356959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVbcQdsxhGJ251GekmogRgMgrAHB7EALgaSbuq0BgLg=;
        b=Rq1f2wlC4W89HGmzbNOvN7hJjzoojB7Gc/H9JtpSViOj860W2aroiO5SCYceTsrMmA
         jWxta/NF842FLwunEmoj/L9W84lhjxDU1o0wbYNsHfLur/+PiXmk1s8Ka/4TmvOaqq94
         VKpZ7iJhS/m74FszMyoi3StoiClEDwNu6Fm0QOfIuAri9CKcUVfTTd8YWH2mpvZjFucS
         SkF64bpBuNyPJ8aSoGg1L56cLSo6Bd/GqOtE5frwqbpuTrJLXumyyTwLPNOgh4DRSM4V
         VS/J6nz6RSuLPLPcn77cfT4j3DYKDyaZlsyDEJvbMHflWcK0NFuLn1pic+deYtenowss
         qtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762752159; x=1763356959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVbcQdsxhGJ251GekmogRgMgrAHB7EALgaSbuq0BgLg=;
        b=nuKNHQfIMNECUw39SyJ57KngSm3Kh1lvNzAvgxHT+NQQduVLduj7fYytcbtD1d81Y1
         6bRiQNGZqPk8r7sezd6VE8SJ+7fIlVufMY/BT6PkIrHGTGwoQYv6LPex64x1Ac7dGF5Z
         1MHkfVLR9g3D/cBSFABY1LpaXpFVgFdLiauta1HuSxazUl3olQkmEshpDPs8qlPvJSL/
         9FoQxOGsmEKodxsMfX1JolFNUNkXiLSTdIkrpTIjBBfmZgo03qlb+87upFZVUkIFSduL
         537NLHSuMOoh2xAoNcEiekorw8+nx81YlIntbuMzMTivHAJHG6Ha30lz0iOfLiZoNtvP
         dYeg==
X-Forwarded-Encrypted: i=1; AJvYcCVG+r3UzQJ8bV/44eknwx/MtDivwu7V02DXX2clcSXT2ydLGrbMvuigGfVfmU3zFk0HFeqUkl/YkmVLNkE6JSxY@lists.infradead.org
X-Gm-Message-State: AOJu0YyR7HRW7EsSAYyXLPRd8XX+sFHKGy3o3S/EuhggDbHG8fL+a3jQ
	2OhO8VrYq/7qAR3+TrTYs7QLZvq2I8dQSjR0BURYq+OOl53V/poZFhuJe2CwNDGw+OxLvQmp4cB
	l0ZnXvN6MUv07Chlmg1RiZAWe8/sgLFA=
X-Gm-Gg: ASbGnctt4ZHkpuUxnDdrdvhYlspPGlQL+iYDdKai0lbf1DMz7lPyO3fZ3Dzvfyka0nN
	sRWzTVDkqCHX8SZrjI+U5TEUWnadQ76RN1xU3AyzUtRRz4UuPWiciol3OFUsuynD4rH3cYk3oaX
	Fr5x8wQxoEJ1y7Grj5yp5Foq46EfLbLvwQXu+eUIM+AftYUjUNNeVIo5SR3gfKMCe3O2DH5tf1p
	tsddK2Vhs0oOkta9SYHDlVz7C/dhJijEHvamt/T6DonosBt6doMpxxcUTA=
X-Google-Smtp-Source: AGHT+IEeFVULUntPJGmAB60bMxKjcERl9eTW1jbOHV8XuGq9ZMrcrkcUimjG5F2o26/OwntJmcCh8HHKGulh3BYrYP4=
X-Received: by 2002:a05:6102:390f:b0:5dd:8c81:d7ab with SMTP id
 ada2fe7eead31-5ddc452d062mr2218860137.0.1762752159000; Sun, 09 Nov 2025
 21:22:39 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 14:22:01 +0900
X-Gm-Features: AWmQ_bnqaqpr6mbii-XcWKvzW_ttKXH-Eb8J1UjIIWLeqzt5jQH_vRs30wQTWl8
Message-ID: <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_212240_373247_016399D4 
X-CRM114-Status: GOOD (  18.48  )
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

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:54, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Switch mode-config initialization to drmm_mode_config_init() so that the
> lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
> from error and unbind paths since cleanup is now managed by DRM.
>
> No functional change intended.
>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 6cc7bf77bcac..1aea71778ab1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
>         dev_set_drvdata(dev, drm);
>         drm->dev_private =3D (void *)private;
>
> -       drm_mode_config_init(drm);
> +       drmm_mode_config_init(drm);
>
>         exynos_drm_mode_config_init(drm);
>
> @@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
>  err_unbind_all:
>         component_unbind_all(drm->dev, drm);
>  err_mode_config_cleanup:
> -       drm_mode_config_cleanup(drm);

In the current implementation, there is a potential dereference issue
because the private object may be freed before to_dma_dev(dev) is
called.
When drmm_mode_config_init() is invoked, it registers
drm_mode_config_cleanup() as a managed action. This means that the
cleanup function will be automatically executed later when
drm_dev_put() is called.

The problem arises when drm_dev_put() is called without explicitly
invoking drm_mode_config_cleanup() first, as in the original code. In
that case, the managed cleanup is performed later, which allows
to_dma_dev(dev) to be called after the private object has already been
released.

For reference, the following sequence may occur internally when
drm_mode_config_cleanup() is executed:
1. drm_mode_config_cleanup() is called.
2. During the cleanup of FBs, planes, CRTCs, encoders, and connectors,
framebuffers or GEM objects may be released.
3. At this point, Exynos-specific code could invoke to_dma_dev(dev).

Therefore, the private object must remain valid until
drm_mode_config_cleanup() completes.
It would be safer to adjust the code so that kfree(private) is
performed after drm_dev_put(drm) to ensure the private data remains
available during cleanup.

Thanks,
Inki Dae

>         exynos_drm_cleanup_dma(drm);
>         kfree(private);
>         dev_set_drvdata(dev, NULL);
> @@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
>         drm_atomic_helper_shutdown(drm);
>
>         component_unbind_all(drm->dev, drm);
> -       drm_mode_config_cleanup(drm);

Ditto.

>         exynos_drm_cleanup_dma(drm);
>
>         kfree(drm->dev_private);
> --
> 2.34.1
>
>

