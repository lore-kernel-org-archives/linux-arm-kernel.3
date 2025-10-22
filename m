Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91621CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5H2hOYHrC6k0KzLWWZQ6pqjMN1sq2+E7LMIYVsMxic=; b=sNGB7Wf9MNWcrdxGAUH5jl/UDX
	nT7Ql2aExRhcc+gzRfa4fMaa9pjsDpyiMo19d+dM7fSg3kRhdDVXuLz53Vp66oj8/eRCCOWFiUkhO
	R1B2BcRZsPw+yh2odMLAj1Mt08spCPEHMnRbf9E4WjcS7vZ3Rn1xVY0wzr372gq0mDBXotPCx5kJD
	VBl0jpMFLA8O6yuvAKKNM6cjRhzmTy+Ovy9PoRfYUm/lV803w2FUqIfOh9K7Q+RJWzQsblDreH/Qe
	Y+Csbb04smHk9OTmBslI4E84epmhlp7UXeUiLeLLUNe3YMGHChpQhXxrp+XrbpfqsKXnCZkbKo2JV
	ss1QKqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWgs-00000002a34-37Pr;
	Wed, 22 Oct 2025 11:07:38 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWgq-00000002a2Q-2FLe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:07:37 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7814273415cso55128537b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131255; x=1761736055; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5H2hOYHrC6k0KzLWWZQ6pqjMN1sq2+E7LMIYVsMxic=;
        b=lf8pQvf83MuLdokVcA1quI1W4+R9DV9rQY5abtfxWPBeibJ6UqOSy/U0QhOToRR22E
         Z9WDY+71BGj1DggwBtAfWEHDPt8NmhO7SGpHSZz0YxA4IJzI4421+FZ6br1m7yHFv9nc
         JqwVyhKchODa3JGL1S7cmvPS6P8CWqFiHL6iuwfNbfo9OZuKmSQkJ2iJ8Vk1nqSiCH2Z
         tHAvIvF4fHI492WXgAiZyZMZmwx99+rBcirvjPzwozWDRDTwu0vnxp3RKS4NOJd4SFO0
         TvpsZpxCoKJqasy2tYAnmo1VAuSG9bNQqRPN3JGfPLgkOKFZwn1UFnwUaeJzrLCIdDI4
         9gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131255; x=1761736055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5H2hOYHrC6k0KzLWWZQ6pqjMN1sq2+E7LMIYVsMxic=;
        b=beXirGGEVu3GGC5y8aJEQ3JszIW4UJIxJDtqiWaboUgS12UmVgOLssiqHNX5Rl6zEt
         ZsYEVxgkusPyv1gMc8T0ocWGqPn23vTKuwiNJuNZjTxRBlUtRF7cstu4Nzt4KLjvqUFw
         jNw2mekreuiuZwJEmaOiful/mjOmGPdGsUpF06Ou6XuKnEZS40407UaH0W6RogjEINs5
         MwwJ8CeYONlWTqFWkT6PLcTniUigCaAgP4xZ0vg3Xn8OHw3IvHv9cImdgTswCxrXkf7f
         w/3iLV16Ecb9yI82X6rpaCa89AJgsjtUppETUbDWjeMB2JA84mxQsFxcunRds4DwgCzQ
         t5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVFiQUY8ABBfWedpL07CjfNyPbMUQt62LCDAErwseeJg/gFTvW1npTmAk1CqcqLX4n7HFAhaWH/gh2SRh4hTSYp@lists.infradead.org
X-Gm-Message-State: AOJu0YzYyKz/GzdDTogsphc26DnCiG0PHRj9gj4Aj3v1qQlAyN/bDkwr
	d/yNNSPjVFU6tf8twjLLrMD75roNprb+KFEoTcIQzBgVHbi9cwQot087sJaKLYWub/AvQlflxsV
	MAw3j3gR9Caw4r0gm6YTUNz9+J3hWL0S9+LX2Hch+4Q==
X-Gm-Gg: ASbGncsx3W1+t5YksjJ/JAzouFYJTa1h2MadsPfgJliT5LQmZ/oZ1LX+40+6dncqget
	aqO3zS2BiWz31n1V2ffv9hqUfrrYU6mcul15BoYdV7dgbveT1/w81BfLc4zrTngKSxiUYgCmshM
	ZD4sDmDqez4GfmiPZG+L3WyYMNmlYPqsdCF+901dqKtmOuhx8WZSxjrwlWsQEfcvpAn9quCedvj
	VUxA6Ao/ANcEMtdiVkUGUacOsMMNR/ESiWEXM9dHR78tvY+x4tu3npott4gA6CtVCVWFYSo
X-Google-Smtp-Source: AGHT+IFJ1vqYp3EqzVjhqjgkltJtdC0F8S0mc4Lwhfr9E90fNJYBhrJvwPxKs+vLQCTJSeMcdqP1qkhWadhCQNPbGBw=
X-Received: by 2002:a53:a0cb:0:b0:63e:e9b:6220 with SMTP id
 956f58d0204a3-63e161d9a5emr12477946d50.47.1761131255117; Wed, 22 Oct 2025
 04:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org> <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 13:06:59 +0200
X-Gm-Features: AS18NWDVrbFCkhc03fhqCT8wIs3nWgG9ruif750F0ANB4USSH-3L9fEAVcRT1Po
Message-ID: <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced sync_state
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_040736_599486_54ED0F3A 
X-CRM114-Status: GOOD (  26.23  )
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
> Unconditionally calling of_genpd_sync_state() causes issues on
> platforms with child domains as the parent domain will be turned off
> before the child domain was even registered during boot.
>
> This in particular is an issue for the upcoming Google gs101 support -
> all operations on child domains registered after the parent domain
> misbehave.
>
> Add a flag to the probe data to be able to sync_state conditionally
> only, and enable that flag on the two platforms currently supported by
> this driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> v2:
> * use bool for need_early_sync_state (Krzysztof)
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681=
600d9415369fefd 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -20,6 +20,7 @@
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> +       bool need_early_sync_state;
>  };
>
>  /*
> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_doma=
in *domain)
>
>  static const struct exynos_pm_domain_config exynos4210_cfg =3D {
>         .local_pwr_cfg          =3D 0x7,
> +       .need_early_sync_state  =3D true,
>  };
>
>  static const struct exynos_pm_domain_config exynos5433_cfg =3D {
>         .local_pwr_cfg          =3D 0xf,
> +       .need_early_sync_state  =3D true,
>  };
>
>  static const struct of_device_id exynos_pm_domain_of_match[] =3D {
> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>          * reset during boot. As a temporary hack to manage this, let's e=
nforce
>          * a sync_state.
>          */
> -       if (!ret)
> +       if (pm_domain_cfg->need_early_sync_state && !ret)
>                 of_genpd_sync_state(np);

The call to of_genpd_sync_state() was intended as a temporary solution here=
.

Potentially, if we would be able to distinguish what PM domain that is
causing the problem on the Exynos platforms, we could set
GENPD_FLAG_NO_STAY_ON for that genpd instead.

>
>         pm_runtime_enable(dev);
>
> --
> 2.51.0.788.g6d19910ace-goog
>

The above said, $subject patch is still fine as is for me.

Kind regards
Uffe

