Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09295C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=; b=TgYWmMxRMx3VAesPOW8xuXLkhz
	xko9B8qoo61ts7IMnK3WzMatE9b30t0aDIR9Rq3eP2m1JMD+nsPtvTRsOOkJGbPgA4ddZK3rsUxTC
	egW4jmFfN9/NXBCZPh6BbWoLcHGEYccFQxKOWkM+5Ol3uVlHaQ37ErBjVVvfEj/mS1HSdjUMeHwWv
	Mo0ogSUSFLYhVmi9LCyzixiUHVAbiaSSnG8AN3bybkRrwjgHOVKNjtVxd4fzaA32n7vsphhW3brJ6
	P0W9axGOxiJxTryK9Gt+Vbvw55BzG+lGZBPcI5bMlYns0ftAKnaFCOYG4f6IbrW+ClSbvZwuA6nsn
	vpHMCQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrELE-00000001otS-4975;
	Tue, 04 Aug 2026 12:33:57 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrELB-00000001osw-0kdQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:33:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so6047565a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785846831; cv=none;
        d=google.com; s=arc-20260327;
        b=PhG4eYe+8R5GhZWn2Q/3X+Mxa+BksJWzNQTQ3imyJRD4Mb56Jh+wtslKDMEzT1wV0U
         6NokAEL6hrWflLgqXZNjzgTxE+Z5JY9qSYhOn8048D3LXdd4Sp7AzlmHeQJCXY75MdrV
         Aci82gjsVxmXrQUNt0uUiuPWys9ZLL1KHqwYAxpdKw9q8XRUQ+baM14wx7bzaIBEWR0V
         /cXMSIxeV8gkepXnsRsymEWAeXv5hXfQlSMVLBbI07znurYL63EwJVw6VEcG/NIt/Tos
         UimroxKWc4ark0rPZ2ldLgqJPpWT7JweVyuzaMcNzicYWzsxK3xRGunH8wSmXqGH3JmK
         bgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        fh=GSCkokkYidz7EFSXxVTnJFdfAzNsl+6EiuvcIANnDEI=;
        b=DFNIVas0LhrkC/RNFAsxnQx5Jia5WcrrUIUlBT/1ohsVSWr9kPOCFU+Z4+gl8+xDrJ
         NFYmQ90qNEW0NC4Wge2UPjSaSZGv+SRBfRC0f5np0SptvUBH2zA+ZI0ljRLp6GMzJdUf
         xeddOnZTr6eFKsqXxReAvSUicclU6e3j8xanqosHQqrxXfN7qhTLKaiJacYc/oGkTQ7U
         gZa9S3eyvGaVGZDjA4DWlLG8YtFrinj53FF5g2h0DrENwzvwIGPv3zlq2UQj9Z7ssTnr
         A9qX0wGoWoK9GlmsjatpzkmvXwyvgJc0J6HZQjAY4/x4u+/gxYFHljEmDsmZ/h3v7XJC
         ifKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785846831; x=1786451631; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        b=FwE1NpA3kIwrw2ibY7n05E64JFp3eP9IRRnfofKDnJUNMkVb58Rb0oYfDfsG5Eyyv4
         Xhjmbu2fTeRe68LcEIHES5UvfO7NB6xGSFKuHq+WWhFxGR3p0EhxItEDQkHymcFKleic
         6NbznEn1Ka2mMQHPhIMm9oMlJyIyHtgReE9tTOSa5InBKNWu1APzXwAIxcworpP/YJWp
         HxXsthnmZg36//rMS50xHgSJ3ctJ6Yr7yLGM+HsvYlv5FihKbQnDo86/ZZ/Sa29IaDrU
         WiiWsRfNHDSwgUmuliUQACfNaKk//4r4HUGXUAuUpdzI4/9zHVOR6+7/2uuL0abCWZ4h
         KlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846831; x=1786451631;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxBuSuUOsN3xcHdKVMUU11HrTG94kQJTqxpKG7QuLAE=;
        b=kCsUSdPRIbootfyecgQCGesY1dRxG780Qt8MwL4xa5h+RQXhwTbfZCIKFAwMcg+TmG
         Gt6EJjyFrU6qzE+cILKA0IIUQQzoB5PDOETDeK1PLWJ1+Q9cYJX7tGPkMjDbjcu0UDvy
         McnyS8PXo3nb2STCxD6Z8KLN6CKZijN368NxJzIyNO2cTbSK8+fTpWtGPtZ0v7WiPNmg
         kep5MbA6RkZESHXbaVUS/JslM5CO2Pld9SwExGACuyfOWagxRIXXEbt1sSNswRzy7PSd
         VygvwaT7go1+iI/lS8cleDxnRxoSjEkU+F5YgCC9CMHNPOG3rVATfjmIYU3trOP1J3W/
         bSgA==
X-Forwarded-Encrypted: i=1; AHgh+RoZPZtI5F3R1Ej8nLZWRuehJuaCvmk/vh93Nw8VYmDUkBqeQ0MBsEpGaoStPanfWJSznT49A0CXoXiv2ggaVAHe@lists.infradead.org
X-Gm-Message-State: AOJu0YziXfbidlDLMUhQ3yVQEnXczteBY026GI61Afr81TFYGD/RHNsW
	1GmxIKq2g9sSOYsohlaiZBDdlVk8YSPS65cAyL+bIwlKqn8E6QuqdAwf4JtvMfspN2pnvP3tGbU
	LbqIHi7Lz8MP7kxTGePRZQvOdIlwsQGpmZxVLs9kTNw==
X-Gm-Gg: AR+sD11vO5nApn1aLhey6b4hb7kcafCpxyjvIMz/3ewgRZ9Jw8frNgIM6yxTotx2DuP
	l5zdPwKKhGP/t8F9wzlfkHqPWAaP63Ocj0wO5uyIxlgJW1rGgu8m8/M6LZ9M6x6XMStdejUIcnc
	WlCEvOnAqxgi9MBfPPggfqSvhVEDFoYH+5zmRBP+DM4WzCUt/pi0w4uDEmAKq72Pzj3XS+d45E7
	60HT/DEuTES5PJ99tJchCh/pl3pe4NB/QmPN3iPR3Yd4lni9LcjC7GJgsnnK95CWUYvPKDh3tYr
	VeIzF7AD3MgionB8dh4EQCyGb5SrL77oZBMbku/GahCFMDp8qHSAKIJ/aURetvL8QD2JBWWedJH
	poVI=
X-Received: by 2002:a05:6402:a6ca:20b0:6a0:dda3:83db with SMTP id
 4fb4d7f45d1cf-6a0dda38483mr5803047a12.0.1785846831292; Tue, 04 Aug 2026
 05:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260803135322.2898247-1-wenst@chromium.org>
In-Reply-To: <20260803135322.2898247-1-wenst@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:33:39 +0100
X-Gm-Features: AUfX_myS2cidHM43LBbhd8UVPlKcCVWzzAL3r2Xg4qgdaYQLg0tQthlf_dnS1Jc
Message-ID: <CADrjBPqVOTqfj6Xx6LMvnrVS8-gxrwh=-_XevD56Nf+ypSNhAg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_053353_234453_6F170E81 
X-CRM114-Status: GOOD (  17.47  )
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

On Mon, 3 Aug 2026 at 15:28, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> The recent size_t format string fix for exynos DRM driver left the "0x"
> prefix in front of "%pad" format around. Since the pointer format output
> already provides "0x" prefix, this ends up adding an extra prefix.
>
> Drop the redundant "0x" prefix".
>
> Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 0208c9259572..acb8def747de 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
>                 return;
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
>                           &exynos_gem->dma_addr, exynos_gem->base.size);
>
>         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
> --
> 2.55.0.571.g244d577d93-goog
>
>

