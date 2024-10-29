Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98232D3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3NttoA5WxBHMHxzBK9jMzti32CvvOP6K0PZcY+FhbE=; b=VPFbkERMljvY/NTXn+W4d1ZYeO
	8yq5nn2uQuCduK6Frs9Fq+bm+y30+oiCvk+HQPVQQrQj4gVPowe17+ci6hVZeDCY5BlK7Ng2aIo6z
	TqiMVZsV8M1EzhOxRi1IQ+gEgEaMM8V9vnsgNwQ891MZf8gOxWEWPxSo/I/KmnTB371taqPGT/CjD
	bkgo9mRvvgoRk3UvBy4BKtUElG6L7xeuusGaZyoQ8HjoazIlgcisIDozqs/JhmaP8tuVISWlMEbo5
	QJzk03qxQHXfNRv5T5vVlStSKnKmV/ilVnQJvpY2QrvpjHUiSNp+I8eZw2zmR2ITbCaBzuFecoJn5
	OE8ArrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sVl-0000000Five-3eRJ;
	Tue, 29 Oct 2024 20:08:17 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sU7-0000000Fijy-3Jta
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:06:37 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6e3a97a6010so67167497b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730232394; x=1730837194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3NttoA5WxBHMHxzBK9jMzti32CvvOP6K0PZcY+FhbE=;
        b=nwaq8GEPjzK8xGggG/uA8qwKU6mmeZFXvmsr3rEnyF6YkcJRYHYHgD+XErvrwMI+l5
         7Wa86N/HO3ERHmdDSbO9EeMfMUoquF5KO8clfBHKOgyd/9IKaRx3rsarPQynjEXfyPtO
         D5YUJoQTRbCQu8EGj9NxYHOqf9c2GklZupmhO+hpZqZRavFhuNF8D/MO+lmOovI0TXeQ
         QZtrtqrUtjSuaT72EeH+pSpi9K25m6pXUrfoNUHTdC0M3DZ7wq5njqH9blz5N1ECzD51
         RO8PMJtbYJhm87zj7fBUO4vGnfx/Xp7mF0akZc37GtNHSmFwjG1zNPaOCPhTVNZ8/2cF
         /JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730232394; x=1730837194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3NttoA5WxBHMHxzBK9jMzti32CvvOP6K0PZcY+FhbE=;
        b=KUB4kTrSabyVk9VKxkQkGrPRZFvtus7frJqpgh7QItvQsHNd8IecWxRXxwrwPRURaK
         Xr+LLnqFWN273Jn41jz4UlYrC1SGNWyoHVqhDTGxI8wiKI1HrC1jVTH9c1e5w69Czvqv
         eudaDrDfPXYFlsQAyru781zFjOEZpSUDciWr9vkwXnFGyU6px8ghWPCDGTxz9I8kJuFF
         atqKesnLzlUwnod1MWTcuaDLIqyUEkDKF2nBL+DDPwLU+CHEtTTM0MJLLdg3T/wIC1y0
         C1gErT4PiKSmLWB/SUBsggryvkt2+Pc2K7RyBpA2OMFtho65JAqbepZKlr6rOcsaG/5q
         Ie8g==
X-Forwarded-Encrypted: i=1; AJvYcCWhl3ridUf4SoAc3HcnQm30M4oZ+vLMNyeg+7q4wYoJhV9rTcVve82klh+OSJVEUV4lZLODUQ+yRzUNn5l9EU4E@lists.infradead.org
X-Gm-Message-State: AOJu0YzloYL+Dh1PxyXWBep9XhroNkVdQPfswAkA5SMYFCBwubzxrulb
	MQ8WlRHQvi0Rip4hRG8LsShr4bJ/+fnVl01EXwoM3tpkaABIiBhpqfsvdJStsXDi8DMQKAJwT5d
	EOTJeTZ6UoTKhPBEwjyiMAl5RVQ3nHfAxc102RA==
X-Google-Smtp-Source: AGHT+IHJIZjJm0+Hsxf3gPKdK8yBtqrSRKRjmh10LGyKq5VrJEw8ofGWS0qIV7jYqKH4wMYRbrhheBmDRAEt5XkqPpk=
X-Received: by 2002:a05:6902:1109:b0:e30:6dea:3ab4 with SMTP id
 3f1490d57ef6-e3087a6060fmr12587842276.23.1730232393985; Tue, 29 Oct 2024
 13:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241029192107.2344279-1-peter.griffin@linaro.org>
In-Reply-To: <20241029192107.2344279-1-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 29 Oct 2024 15:06:23 -0500
Message-ID: <CAPLW+4k7wd4Wix8xEB8+Aeb10_D9XU9jbxhCZ_OMn1fW5OOAtg@mail.gmail.com>
Subject: Re: [PATCH] phy: samsung-ufs: switch back to syscon_regmap_lookup_by_phandle()
To: Peter Griffin <peter.griffin@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_130635_857189_DC97C381 
X-CRM114-Status: GOOD (  18.43  )
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

On Tue, Oct 29, 2024 at 2:21=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Now exynos-pmu can register its custom regmap for gs101 via
> of_syscon_register_regmap() we can switch back to the standard
> syscon_regmap_lookup_by_phandle() api for obtaining the regmap.
>
> Additionally add a Kconfig dependency for MFD_SYSCON.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/phy/samsung/Kconfig           | 1 +
>  drivers/phy/samsung/phy-samsung-ufs.c | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index f10afa3d7ff5..e2330b0894d6 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -33,6 +33,7 @@ config PHY_SAMSUNG_UFS
>         tristate "Exynos SoC series UFS PHY driver"
>         depends on OF && (ARCH_EXYNOS || COMPILE_TEST)
>         select GENERIC_PHY
> +       select MFD_SYSCON
>         help
>           Enable this to support the Samsung Exynos SoC UFS PHY driver fo=
r
>           Samsung Exynos SoCs. This driver provides the interface for UFS=
 host
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/=
phy-samsung-ufs.c
> index 6c5d41552649..8e9ccd39f97e 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -13,11 +13,11 @@
>  #include <linux/of.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/soc/samsung/exynos-pmu.h>
>
>  #include "phy-samsung-ufs.h"
>
> @@ -268,8 +268,8 @@ static int samsung_ufs_phy_probe(struct platform_devi=
ce *pdev)
>                 goto out;
>         }
>
> -       phy->reg_pmu =3D exynos_get_pmu_regmap_by_phandle(dev->of_node,
> -                                                       "samsung,pmu-sysc=
on");
> +       phy->reg_pmu =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                                      "samsung,pmu-sysco=
n");
>         if (IS_ERR(phy->reg_pmu)) {
>                 err =3D PTR_ERR(phy->reg_pmu);
>                 dev_err(dev, "failed syscon remap for pmu\n");
> --
> 2.47.0.163.g1226f6d8fa-goog
>
>

