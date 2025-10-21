Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AC3CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7l2S0fTu5SAF3VSsMCSsLrp+bmdGs9v0RGyTD+mw5o=; b=ud94rh+cV+imLgNNXgHulKUoNI
	WHHjI503K8Dcbf0F4FZTHk2rh2/FM/3HFV17Oj02yd0NTRjGR6DCIGhIq3cJE8YpTEe9sp229UF1m
	1hVcKnR/L3ly7njbax6DdliOzsfm0wrra2WfZNp+agB0Ci3kREdgtmAb+la7JEyw+d8hI3zdFe1Rz
	dnlT3lSyvlCz7rmSVX4xiPZCZpbAfqpWS+8CWS5b4m3+A3eK37qEtnXHxVYGtcQ2Sw+pM31tJJcBm
	JUzdMi2upq169Bm1SuSd5pP8Y6vY+7R+EJcS47QfEpUsbCLJujfZPrqTN0zHU2CJB66namsQlLp9v
	qTKlr39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCpE-0000000HE40-0lXc;
	Tue, 21 Oct 2025 13:54:56 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCpB-0000000HE2V-1jga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:54:54 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78485808eb3so39346697b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761054892; x=1761659692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7l2S0fTu5SAF3VSsMCSsLrp+bmdGs9v0RGyTD+mw5o=;
        b=raW4eW9FcGqz18KBEby6PFtv1m2h2vRA/SMsR3XQ5pF/8w6YM3yCKq+5KLS0VXYXEl
         Nx5R68cpHD3v1jwJsTT+92Y2e19pK32G9P0NIv6ro2Yt57tE9LYH2ptGqtNlWibXKQ/g
         dFMlXOO/qCaxFs6muz/f7rlCTzgs+vznteIU8eaLMZFkN9ID8CEY72P63zT70APZsASB
         DGVYUxtjKrgFVbtar+qg1sXqMDEo5ALQEPOQm7SDi5FuPEjfB8y/95/6v5XbmcoGQoZS
         WGQpTmLrbOhyiuYs5o15u0F+uuKaSGtZpxZURaIZs5WP/Y9cmtEuDx8YVMOfUReGtnA1
         sJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054892; x=1761659692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7l2S0fTu5SAF3VSsMCSsLrp+bmdGs9v0RGyTD+mw5o=;
        b=lEo/8IMMsMbmTIrihQx1xcnOrBzi4iyEoOwK7lFFc6ZfC17mOFgsyPA3ZmR4CNtybr
         9y/R6ke/969k51/ycGb5oM9yZZg+VTKpVxmZ1J2nQO8WMCLAe5qH360tgOyCqSxCReCV
         +TxgM74it/rbvBCr9JqkDJNyon3CZTmDAUAi+xaiohN2oqjprhYRU+qG3ZEValf6p9Ek
         Sixe8aBlPOkG29jnkYnwvAA6VcF/mrxYqHschicMSX62UHu+Kkf2axx3f2x5TFe7OLRq
         fyJaEiG5EWMaUcDwjERIW4fP6VNViS5ojOnSI44y/FLgtducqxX+ZiSHimQQmVXfdslN
         6AyA==
X-Forwarded-Encrypted: i=1; AJvYcCU0xUSDZWqeZTrtyQSHJrbkAmTgmTh2XzNO2YIeze3j+vqSlULTVl97b+i64jcZ0/HbTqCUuQgqy6Manmq+VFnF@lists.infradead.org
X-Gm-Message-State: AOJu0YyX6AJlJ9EzUY3jALzYZco1DfQPfx6lPpIW7uqgKKKuuih/igOH
	xnpipXng6WLIliezrjSSq07Xs56D9muJc0MYf1LoDU9naCAHY2S0sN+WMIFFhgzcpe6CkLbLgT+
	OrsuRLsjqGs391EjvEt/VKHGm3015Rd+7ORuloC04qA==
X-Gm-Gg: ASbGncuAGuI/t+fYUGi3VV8g4tajwfc84nGdkrNawytOpE+Te3LYX9IIHdtgvtmHzQD
	nTAIqOXyoB63f3XOaPoQsRaG0SGfBdrSeLQS85SqGhRS/Ez5YZWd3ubi/db2LJLjmT7QnmTC255
	zJt4NRZf0/nOmToc3Chbh4B+Cu+wXzEOtu7hJiqSSw9pBxA48WmenlVjNbnm5oIu2unoiBmyv/i
	G5420Hmzi61owTCQ/QcNfMU6gLjrejC0JrL9IfmxJBYOuVfunPBhtlrzHVphxpUMiBkQ/sw
X-Google-Smtp-Source: AGHT+IHBbKVNcuM7l9dFMzW3m4txAHgl/oBl0HllzJAJ6dzOGjsTsg6Juv5F+fWERMC7Ma504B1opcnGXEPDICN6WPQ=
X-Received: by 2002:a05:690e:134a:b0:63e:34ed:a131 with SMTP id
 956f58d0204a3-63e34eda971mr6291641d50.31.1761054891971; Tue, 21 Oct 2025
 06:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org> <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 15:54:16 +0200
X-Gm-Features: AS18NWDpF262ybo6_Emnnj0aCX8cQdB1lik5qoOWoSB0z0MgCBOGMTnmDv5nouE
Message-ID: <CAPDyKFpH2p=JhkuXOxL4V3QMH8GObh0qSphPCK=OM9cNe+QmJg@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] pmdomain: samsung: plug potential memleak during probe
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_065453_455587_3CC1EB74 
X-CRM114-Status: GOOD (  19.56  )
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

On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> of_genpd_add_provider_simple() could fail, in which case this code
> leaks the domain name, pd->pd.name.
>
> Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
> simplify existing error handling.
>
> Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platfo=
rm driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
> mark as fix, as this isn't a pure simplification
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 5d478bb37ad68afc7aed7c6ae19b5fefc94a9035..f53e1bd2479807988f969774b=
4b7b4c5739c1aba 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -92,13 +92,14 @@ static const struct of_device_id exynos_pm_domain_of_=
match[] =3D {
>         { },
>  };
>
> -static const char *exynos_get_domain_name(struct device_node *node)
> +static const char *exynos_get_domain_name(struct device *dev,
> +                                         struct device_node *node)
>  {
>         const char *name;
>
>         if (of_property_read_string(node, "label", &name) < 0)
>                 name =3D kbasename(node->full_name);
> -       return kstrdup_const(name, GFP_KERNEL);
> +       return devm_kstrdup_const(dev, name, GFP_KERNEL);
>  }
>
>  static int exynos_pd_probe(struct platform_device *pdev)
> @@ -115,15 +116,13 @@ static int exynos_pd_probe(struct platform_device *=
pdev)
>         if (!pd)
>                 return -ENOMEM;
>
> -       pd->pd.name =3D exynos_get_domain_name(np);
> +       pd->pd.name =3D exynos_get_domain_name(dev, np);
>         if (!pd->pd.name)
>                 return -ENOMEM;
>
>         pd->base =3D of_iomap(np, 0);
> -       if (!pd->base) {
> -               kfree_const(pd->pd.name);
> +       if (!pd->base)
>                 return -ENODEV;
> -       }
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>
> --
> 2.51.0.788.g6d19910ace-goog
>

