Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4392BCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wusSRoPz5XHuYf/hgRAbVTth3meUxSSzw6AAFjCcAZ8=; b=ugx3K+vYR06sEI+Tq7xycXJ9Pr
	ig9oYE6+dfuaNEXvB+4iYvj17aYc6Wwe68ujSpyko8o9drs54S6KwojqSuZE+A6itqKNdooMSjBcG
	RYymxW24WsznicttmdDd8dhH53qNTPqDl6bUa3KC/XMHqTWUuFeBTp7SWS9z2+4Xh8sUTN8DWvUDS
	Mt8ZGAWsnzcR6UGWoHIaw0NcNdX8l3S1gx9PY7xQWQpcoHTfmWer/Q5YE7mC2YRAr4cvO+KhWPK4K
	i7H1wRVdYsh9cPyyFZZoNiTsVclAJeRvzX5oOqtJ0ddTtNRUXNk0dqPAwua8lXkyfofoZsbfppgjw
	+YHGzJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ4p-00000007mzw-05Mu;
	Wed, 10 Jun 2026 13:34:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ4l-00000007mxS-0Vn7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:34:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so9691717a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781098473; cv=none;
        d=google.com; s=arc-20240605;
        b=eqH8jJcHQo2c9k573YWX3Si1d993+uHZaKOhVTrEkL54WXYUB6oWStkv/mL6jQGcx8
         Mqh3sNjpfv8Q5NQhFjELmYrHFhw1/G3BFJCdM6sISnTowHwsBTentT29v3tZmUeKIVGB
         ziu55g89H44msMo8Eb0uUv20TLl1VOGu+t+/G3qccZZkl1dm4KwzTue2fjzOMpgjaVZm
         Cko2wHt09X1GKtMdBgdYvIfj5Jwk9Gf1e87hzu8Ho9uGoLNu99hWWqyoBECKyEzM/qlh
         6RFN48OKErRj/XE+uVFuI6uzInIWo7IJDXMAf6mQ4N0XJHOap9aa41JLzzpjvW3wQKGG
         9IIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wusSRoPz5XHuYf/hgRAbVTth3meUxSSzw6AAFjCcAZ8=;
        fh=SD7UJAop2HU+OTrIFUQKmgAhN3RtR0JFLmq+SMvS4c0=;
        b=Gm53DBvxCNvm/V9ZaZJSwA54ovzSMKCpBv8cGsvmFDMF7vpBtnN199kcA+EydEiSyY
         vcNRmBbAcsZ0KWWO+lu0p7lhCzplqjaoXJHKD9x7reEVYcRdBgxm1e1oUxIWSYHkiDsq
         /+XMarGpIffK3z1GS41O38/VtqO29O09qIbXqrggkxH8TErvCXNm9DRtDjtrYKShotla
         p24js6GqmV/ezbEvzp86imTMFG78vPN9wCa6zEZ6O04+ohIbuU0uhq5BrNbswOwZGwkm
         tshubrELpQH84u1uDz09VPKYg7m+Pax4ka9A/CcsZij5lkgaGr7v9g1r+Lf9Vbmqllks
         VnyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781098473; x=1781703273; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wusSRoPz5XHuYf/hgRAbVTth3meUxSSzw6AAFjCcAZ8=;
        b=a84AXuOD8KMSuT5wsMKaC0J5PqZr9zlBR1RvBiuZcVbGriEPMiXQmhnl9F/cJ30IsJ
         /JDk6oqYROI4GEGayx1a0ONwOgaeCBttUaOZI4+7COMkqihAhlJczDZHs6uhLcrmrsBk
         2xudlOmfAXcOhxmHPvoDvI9Sq25ZTcnEMv1ajGhtanxyMZpgpGZI4AjzPBR5NoqzNdzk
         qidajtngttHtUPyuK7YlawOakynuYjsCdQNPhDkLYDufu4Ht6cp/k496P+BF7m6NvdMP
         FYhlr9H81MtY4h99SGf3XAbOikIc/wOkX4FMlSfmSEfJ6qcnk9BsRyG4ypLRLE3fUBgW
         7/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098473; x=1781703273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wusSRoPz5XHuYf/hgRAbVTth3meUxSSzw6AAFjCcAZ8=;
        b=sRAUtsU0ukreEvY1N68n9c9F/gfIGifMt7YAd6mP+rox+sTwhqNwFUJZqbgE57ycUq
         4YDBaupgc1z9Vu3BpiWYOZGGikWJ0lV9AlpuMwgCLzUdOQLrucnXsKH0I7f5c0xK2Jk0
         bUkH39FbA2FRKyjvdVGS+b5cAhHO43Ak46+vFiw5G79HvSulgzRd8ukUvAQ/bl5QE0bv
         YruxaB7UyE60+NZ3XnvgN/Y7IOagFlw1CNZF4FbpNrvayCXtGZuNW06U3xGoekK5xS4u
         YgoJiquLruWTCqabfFyi+IWDpi9HQExtdJejPbW/mEpj1idy+OK2izxh2IErDbKtteNh
         dCgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gBrHt39djAMmH1rVg40RVtBykZ1Q8rvYp+8okIreayUPYGdI9TpT+Ul/x44oBVK0PF7ksVaPXMi78MLNTlDkG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhcark85X2wezXi71Zot7Ui9naQV+of4MllPzdPl6ZlLomi1s8
	We+x6UqEkoSj4DHw4OLOdQ8211L4YWRJlWyRmbgGCJSAIyAsKJthDkMSr4Wx5abKzpCh3WuheJu
	lARGVnt+lPDAJA1j5RcNan9JfqMwVCGogrlpj/Nctqsr1DwqQufM36L8=
X-Gm-Gg: Acq92OGlq+/YwtG4I/KClIwiPY+zg5XSQCY/3072ggkFwmVtzJnIti6ER2IOmZJyGB1
	XCbmuODlqqfSAGFiLzHtavpBkp83Az0x3dHEkFt4SSKrN2CLP0SLgkDIeEY8JRt4tCGqyIBDh3m
	K4hFLUiYevWGeg1R7nEJchuSZ9mEDOxElqLsgYqeQB1dFl6Lgd0LzDIk6sN0f1pe9n76o2WB9XQ
	28eSSC0l61EgEdGhg3MfZXK7FvW8eKXuOxuM4PLVh9WkRQuGQ4Ccvwwo/RuMYROzIHhuMGlPc/w
	GuRZYpXZvPf90gR97giyM8i76psqHl8UDp2J3NNpTpoJDkOyTiML
X-Received: by 2002:a05:6402:3905:b0:68b:f026:f381 with SMTP id
 4fb4d7f45d1cf-68fa4e3140bmr11010010a12.8.1781098473183; Wed, 10 Jun 2026
 06:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 14:34:21 +0100
X-Gm-Features: AVVi8CdudhNuk1JulHq85Six9g2TTnXsPBjPVrWOLueCdeIJGpUeMcdSZ2qVZRE
Message-ID: <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_063435_207033_E0251654 
X-CRM114-Status: GOOD (  29.95  )
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

Hi Alexey,

Thanks for your patch!

On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), and
> register_reboot_notifier(). If any of these registrations fail during
> probe() routine, the driver returns 0, leaving the driver partially
> configured.

I originally made the failure non-fatal because the system still boots
without the notifiers registered (and all other Arm64 Exynos SoCs
upstream don't register notifiers and AFAICT have broken cpu hotplug
and cpu idle).

In hindsight, that seems like a mistake. I think your patch to fully
unwind everything in case of failure makes more sense.  See small
comment below about destroy_cpuhp_and_cpuidle()

>
> Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe()
> routine, for instance devm_mfd_add_devices(), the probe() lacks an error
> path and leaves notifiers and cpu hotplug states registered.
>
> Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
> struct, that should be initialised to CPUHP_INVALID by default. Check all
> return codes in setup_cpuhp_and_cpuidle(), and add an error path to remove
> registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
> helper to safely tear down notifiers and cpu hotplug states.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 57 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 9636287f6794..846313a28e9a 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -38,6 +38,8 @@ struct exynos_pmu_context {
>         unsigned long *in_cpuhp;
>         bool sys_insuspend;
>         bool sys_inreboot;
> +       int cpuhp_prepare_state;
> +       int cpuhp_online_state;
>  };
>
>  void __iomem *pmu_base_addr;
> @@ -404,6 +406,17 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
>         .notifier_call = exynos_cpupm_reboot_notifier,
>  };
>
> +static void destroy_cpuhp_and_cpuidle(void)
> +{
> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
> +       unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
> +
> +       if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
> +       if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
> +}
> +
>  static int setup_cpuhp_and_cpuidle(struct device *dev)
>  {
>         struct device_node *intr_gen_node;
> @@ -465,16 +478,42 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
>                 gs101_cpuhp_pmu_online(cpu);
>
>         /* register CPU hotplug callbacks */
> -       cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
> -                         gs101_cpuhp_pmu_online, NULL);
> +       pmu_context->cpuhp_prepare_state = CPUHP_INVALID;
> +       pmu_context->cpuhp_online_state = CPUHP_INVALID;
>
> -       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
> -                         NULL, gs101_cpuhp_pmu_offline);
> +       ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare",
> +                               gs101_cpuhp_pmu_online, NULL);
> +       if (ret < 0)
> +               return ret;
> +
> +       pmu_context->cpuhp_prepare_state = ret;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
> +                               NULL, gs101_cpuhp_pmu_offline);
> +       if (ret < 0)
> +               goto clean_cpuhp_states;
> +
> +       pmu_context->cpuhp_online_state = ret;
>
>         /* register CPU PM notifiers for cpuidle */
> -       cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> -       register_reboot_notifier(&exynos_cpupm_reboot_nb);
> -       return 0;
> +       ret = cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> +       if (ret)
> +               goto clean_cpuhp_states;
> +
> +       ret = register_reboot_notifier(&exynos_cpupm_reboot_nb);
> +       if (!ret)
> +               /* Success */
> +               return ret;
> +
> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
> +
> +clean_cpuhp_states:
> +       if (pmu_context->cpuhp_prepare_state != CPUHP_INVALID)
> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
> +       if (pmu_context->cpuhp_online_state != CPUHP_INVALID)
> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
> +
> +       return ret;
>  }
>
>  static int exynos_pmu_probe(struct platform_device *pdev)
> @@ -548,8 +587,10 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>
>         ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pmu_devs,
>                                    ARRAY_SIZE(exynos_pmu_devs), NULL, 0, NULL);
> -       if (ret)
> +       if (ret) {
> +               destroy_cpuhp_and_cpuidle();

You only want to do this if pmu_cpuhp == true, as currently only gs101
registers the notifiers.

Thanks,

Peter

