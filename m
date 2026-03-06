Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20110FCB61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzW86KoS/dhspR9cKdWmhAx2Hdo/lWWSD+IX2JUJRiI=; b=WT668Lyl5a8cp8v+1zp1O8fO6E
	PdFj7dQ3eTEjE6Q9obR91zZ2MDSX+tPOc34oo7OHCp9R8KPFtTIt5ZBarUY5idPLSRi7iJWefZ55b
	WlNpwmWYk3ZHAmx+NOblZbJYCwzHeqb/DkwvnOgNFg8NUoDJpAsg8ebGwdLO9V5YFgRh9KvyrjnKs
	k/ZGx+CtJJaVpvVYAmUI2GC+MwDnsG+0dGF9Xnz5m+W5w3rnJij8+piyvBy9Isd1P65b4lp/1BHwy
	TzB62gsoDajM1GMMaf1PmYvTvmMJ78x9LlF5htRQQi7gPM6hfMBUtyReMJtVJ/bqLYSiUxiLmcSXZ
	u2e5LS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXFM-00000004370-32uh;
	Fri, 06 Mar 2026 15:37:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXFJ-0000000436d-2RNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:37:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-660d2e4846cso5183526a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772811463; cv=none;
        d=google.com; s=arc-20240605;
        b=FJ2+1iuMPNy4f4n0sTSFiiFxOxLJ/l9i8wJ2ZDBk//1K76eK9N5CTbQ48PEHhY0PXl
         Eryr9UlOUfhTIfzQ8BNhSqzWZ8Rg+R4CmBPAyy4Gp0phcqyE+5BKXBl//RTVonJi/BnU
         cR5l/7vLQfnV7a712ZKua3TVtk6RuZ2MKwFb8N8xu7CLWLC9ph3OeoAQPUZEYaEs0pjv
         05mUi8tmrHB8H+/X/kz0mCmRpF9h5uCHjYt4aqLGo7l+eo4zX927CflNuhRgXIqbHKGI
         rC9XJbH9srRheYftsfGQ4z8XDqRZ+zU6GKPdAtFdB2ZmvfUvyoqWtjsWL+fwVOgTcRCS
         t0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mzW86KoS/dhspR9cKdWmhAx2Hdo/lWWSD+IX2JUJRiI=;
        fh=gYcrSTa20LK7MsZPq/cChR7IWOUYlE1lGe4/B15tR/c=;
        b=equciOMlbw9v6KUuEyjteH/IglxX9dvNNjg5kVcuboo/kZQhRwV+8CCexLCBsjZeps
         ZadaDzIYGxc2S0G8ks7GOBsloTAK32rIVH86zOM7NWf8kcWGu3U08PUSkI/wnaFhO1EI
         JHDpmqlavSuHseXW6eo1CM8Gq+9dVaQIK1TU412e8h1A+Gv9vJiYknLrSMPnXQQrfeiR
         DGanyg+oa+Mopbm1LnLzTNA+ZHCWKad+FpqLww07vCdpfh+hCETiA9wbPlPqvvIWshel
         LY4qulf6x+2LT2w8NnSgkOo2LLsP9h0CTONLOucY78jXKfKpmASxWWHkdlafrCC/a8WB
         iJJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772811463; x=1773416263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzW86KoS/dhspR9cKdWmhAx2Hdo/lWWSD+IX2JUJRiI=;
        b=cTcJxT80M3A7qDQa4nnSgXDyzS9NkuPY8F99iigxC8yeKW5Xek1v18ayP/7p9Yf9Nt
         /6ikUBWKAacEyYZ7q785bjzhEMLbTcLK6fZHaYH9hGeQcnLsbIk9/WweDIEFPMpyXPVQ
         FYNO24hBFfPbMUA622w+5Rx00HOSa6nHQarCSEjk4aLNyuaC3OEN77XlV+V1zuPj60E9
         Z6kHCPb1xID5rR0I4pMSD5GVu0VfTXDSGwW6NijTh4bC0ObFBiKFYw5wUmc1m7xBxuUT
         vdhz0nmVvOugFmN9mBpsxWNqpMl60gdpi6+6gj/Q2xUUbY2uTH/JIT/e9ck6X7RaidWq
         pspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772811463; x=1773416263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzW86KoS/dhspR9cKdWmhAx2Hdo/lWWSD+IX2JUJRiI=;
        b=lP8VqzYjA61oO1gtK2ITuni9MASDliSrh3Ydnl649rDewtEV2zzDfpvkoaWSAqZcLi
         AMGVGJ4fvS478Mb1yn/+tYT4sS6TbeKTcg7LkMvzz5dNiuRYcHhNZi1TJ9KDJSeZl+tq
         V4UpLRDpn/txsMorPBog0oWS1cqYxYywFv5qUT7bfuwONrGHRKOpuEoqum06nagbtwos
         jAPPd0URCXMUKklan6lzuOCipvkWV7mzpTXPWovHuTl7/hJ725VftgesAIKAzasI6fTn
         L0DFMdi5pFPpjPXmnLLZSMYYsG3OWJH9LfypLarUl2WLsjQogehceb4+n2VPet60fNLC
         pjmw==
X-Forwarded-Encrypted: i=1; AJvYcCXHmzeQnS/OvNnLzgkQO3OwP9UwIoRUDrpj9cciNvORJ95b2CsioYIMcXs/eloz+SfbWSTwPubFhehH0LQVK1w2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo/H4vyn+3FW9AFUNKS0v2aQ0/lU+2i7ZTnvu3kJPVQlSDoqvX
	NWPhJCsFSKcpKkU88NajCgzOJkXpDreBjR6A4kVLdQ0k+7EZkJPqJqe560NiN1GqMYkF1DHy5Qb
	+f6EnwbpNGbDp25EpRQjRp16NQUlxNXyxMBSaEpXAjg==
X-Gm-Gg: ATEYQzzShB+XOeAMvVEsr92j+53zfKF0xbkjV9S4+oFxVypvm1ccD+nzgB3nHyXEkYn
	c5WVnOo/vcJKpAiQExa396pmObTDUbeVSyHMuxArmlPFRtb76BdMG5bjMN/aJNH/PHGCChM0dpK
	19Q/BQBTZXs4Bby+dru7l7Le4Bm4bCp2c8OD/N3Vt+FW6R3w24bKFMneZGs3fWc/rE1122KnKPu
	A8NaooX8wgFZs/Fo8AurwVYbHoDjj6r5mpDUJr65kYno/qd5UQ3yskh7iyHpdBFDQTfnn0YZ6Fx
	tq1rFg478jVWb+M/0pal6go1/eoYh14SvMkXQ61FKQ==
X-Received: by 2002:a05:6402:2750:b0:660:eabc:9c70 with SMTP id
 4fb4d7f45d1cf-6619d5349a1mr1530140a12.29.1772811463197; Fri, 06 Mar 2026
 07:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-9-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-9-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:37:31 +0000
X-Gm-Features: AaiRm522XKmDrnyMKuFhryCYHqBWloGFwRuAIoVET18JWhRZ9yKqJQ-aQM3kXms
Message-ID: <CADrjBPrC9de5k0tv_KK6JT2bCOk1Pbrh7m6aUHgJ85DHnZy3wg@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] pmdomain: samsung: implement SMC to save /
 restore TZ config
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_073745_682538_D1055744 
X-CRM114-Status: GOOD (  36.35  )
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

On Fri, 6 Mar 2026 at 10:30, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Newer Exynos platforms have a Distributed Trust Zone Protection Control
> (DTZPC) linked to each power domain. It controls the access permissions
> to various registers from secure and non-secure world. An SMC call is
> required to instruct the firmware that the power domain is about to be
> turned off and again once it was turned on. This allows the firmware to
> save and restore the DTZPC configuration. Without, register access to
> various registers becomes impossible from Linux (causing SError), as
> the PoR configuration doesn't allow access.
>
> Neither the requirement for the SMC call, nor its arguments appear to
> be specific to gs101, as at least Exynos E850 also uses the same as can
> be seen in [1], hence prefix the new macros simply with EXYNOS_.
>
> At least on gs101, this SMC call isn't implemented for all power
> domains (e.g. it's missing for HSI2 (UFS)), therefore we issue a test
> SMC to store the configuration during probe, and if it fails we mark a
> domain as always-on to avoid the SErrors and to avoid unnecessarily
> retrying for each domain on/off.
>
> Link: https://lore.kernel.org/all/20230308233822.31180-4-semen.protsenko@=
linaro.org/ [1]
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 96 ++++++++++++++++++++++=
++++--
>  1 file changed, 90 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 41a232b3cdaf..f59986b56213 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -9,6 +9,7 @@
>  // conjunction with runtime-pm. Support for both device-tree and non-dev=
ice-tree
>  // based power domain support is included.
>
> +#include <linux/arm-smccc.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -16,12 +17,19 @@
>  #include <linux/pm_domain.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>
> +#define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF                0x82000410
> +#define EXYNOS_GET_IN_PD_DOWN                  0
> +#define EXYNOS_WAKEUP_PD_DOWN                  1
> +#define EXYNOS_RUNTIME_PM_TZPC_GROUP           2
> +
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> +       u32 smc_offset;
>         bool use_parent_regmap;
>  };
>
> @@ -32,11 +40,28 @@ struct exynos_pm_domain {
>         struct regmap *regmap;
>         struct device *dev;
>         struct generic_pm_domain pd;
> -       u32 local_pwr_cfg;
> +       const struct exynos_pm_domain_config *cfg;
>         u32 configuration_reg;
>         u32 status_reg;
> +       phys_addr_t ac_pa;
>  };
>
> +static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd=
,
> +                                            bool power_on)
> +{
> +       struct arm_smccc_res res;
> +
> +       if (!pd->ac_pa || !pd->cfg->smc_offset)
> +               return 0;
> +
> +       arm_smccc_smc(EXYNOS_SMC_CMD_PREPARE_PD_ONOFF,
> +                     power_on ? EXYNOS_WAKEUP_PD_DOWN : EXYNOS_GET_IN_PD=
_DOWN,
> +                     pd->ac_pa + pd->cfg->smc_offset,
> +                     EXYNOS_RUNTIME_PM_TZPC_GROUP, 0, 0, 0, 0, &res);
> +
> +       return res.a0;
> +}
> +
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
>         struct exynos_pm_domain *pd;
> @@ -45,7 +70,17 @@ static int exynos_pd_power(struct generic_pm_domain *d=
omain, bool power_on)
>
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
>
> -       pwr =3D power_on ? pd->local_pwr_cfg : 0;
> +       if (!power_on) {
> +               err =3D exynos_pd_access_controller_power(pd, power_on);
> +               if (err) {
> +                       dev_err(pd->dev,
> +                               "SMC for power domain %s %sable failed: %=
d\n",
> +                               domain->name, power_on ? "en" : "dis", er=
r);
> +                       return err;
> +               }
> +       }
> +
> +       pwr =3D power_on ? pd->cfg->local_pwr_cfg : 0;
>         err =3D regmap_write(pd->regmap, pd->configuration_reg, pwr);
>         if (err) {
>                 dev_err(pd->dev,
> @@ -60,7 +95,7 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>                 unsigned int val;
>
>                 err =3D regmap_read(pd->regmap, pd->status_reg, &val);
> -               if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
> +               if (err || ((val & pd->cfg->local_pwr_cfg) !=3D pwr)) {
>                         cpu_relax();
>                         usleep_range(80, 100);
>                         continue;
> @@ -72,9 +107,21 @@ static int exynos_pd_power(struct generic_pm_domain *=
domain, bool power_on)
>         if (!timeout && !err)
>                 /* Only return timeout if no other error also occurred. *=
/
>                 err =3D -ETIMEDOUT;
> -       if (err)
> +       if (err) {
>                 dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
>                         domain->name, power_on ? "en" : "dis", err);
> +               return err;
> +       }
> +
> +       if (power_on) {
> +               err =3D exynos_pd_access_controller_power(pd, power_on);
> +               if (err) {
> +                       dev_err(pd->dev,
> +                               "SMC for power domain %s %sable failed: %=
d\n",
> +                               domain->name, power_on ? "en" : "dis", er=
r);
> +                       return err;
> +               }
> +       }
>
>         return err;
>  }
> @@ -99,6 +146,7 @@ static const struct exynos_pm_domain_config exynos5433=
_cfg =3D {
>
>  static const struct exynos_pm_domain_config gs101_cfg =3D {
>         .local_pwr_cfg          =3D BIT(0),
> +       .smc_offset             =3D 0x0204,
>         .use_parent_regmap      =3D true,
>  };
>
> @@ -126,6 +174,38 @@ static const char *exynos_get_domain_name(struct dev=
ice *dev,
>         return devm_kstrdup_const(dev, name, GFP_KERNEL);
>  }
>
> +static int exynos_pd_get_access_controller(struct exynos_pm_domain *pd)
> +{
> +       struct device_node *ac_np;
> +       struct resource ac_res;
> +       int ret;
> +
> +       ac_np =3D of_parse_phandle(pd->dev->of_node, "samsung,dtzpc", 0);
> +       if (!ac_np)
> +               return 0;
> +
> +       ret =3D of_address_to_resource(ac_np, 0, &ac_res);
> +       of_node_put(ac_np);
> +       if (ret)
> +               return dev_err_probe(pd->dev, ret,
> +                                    "failed to get access controller\n")=
;
> +
> +       pd->ac_pa =3D ac_res.start;
> +
> +       /*
> +        * For some domains, TZ save/restore might not be implemented. If=
 that
> +        * is the case, simply mark it as always on, as otherwise a power=
 cycle
> +        * will lead to lost TZ configuration, making it impossible to ac=
cess
> +        * registers from Linux afterwards.
> +        */
> +       if (exynos_pd_access_controller_power(pd, false) =3D=3D -ENOENT) =
{
> +               pd->ac_pa =3D 0;
> +               pd->pd.flags |=3D GENPD_FLAG_ALWAYS_ON;
> +       }
> +
> +       return 0;
> +}
> +
>  static int exynos_pd_probe(struct platform_device *pdev)
>  {
>         const struct exynos_pm_domain_config *pm_domain_cfg;
> @@ -195,10 +275,14 @@ static int exynos_pd_probe(struct platform_device *=
pdev)
>
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
> -       pd->local_pwr_cfg =3D pm_domain_cfg->local_pwr_cfg;
> +       pd->cfg =3D pm_domain_cfg;
>         pd->configuration_reg +=3D 0;
>         pd->status_reg +=3D 4;
>
> +       ret =3D exynos_pd_get_access_controller(pd);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * Some Samsung platforms with bootloaders turning on the splash-=
screen
>          * and handing it over to the kernel, requires the power-domains =
to be
> @@ -212,7 +296,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to read status");
>
> -       on =3D val & pd->local_pwr_cfg;
> +       on =3D val & pd->cfg->local_pwr_cfg;
>
>         pm_genpd_init(&pd->pd, NULL, !on);
>         ret =3D of_genpd_add_provider_simple(np, &pd->pd);
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

