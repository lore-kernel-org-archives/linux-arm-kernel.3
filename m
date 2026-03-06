Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13F0FCB618
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=; b=4RMBRrfoTBgWTGG1tXee19KDXW
	9bn/wU58Wo8HNgCc9QkNQPv+XIJy4HhcDDhVlM76DM5Ycu/w65im946Hz9JYjofpTFKt6EU8sO3EW
	K0Up3GA/6KgLruzjAz/VOslxBPRKbYLAri6Ep80aUwpgzuglDEJjxMXyuQsf68PJ9TUktF1/yjgif
	7ulnRaxmsv6NvF/oocVzzIBfVk3QtpHATVuOCoJIFLT75C1J0yvVOflX2DPtlAicTnFhACELtDAGi
	twbD1CErhw5uL0gdRuMFfPanqygJyPuXjipacxgm6yO64SIu/zTUVqho1rQH1U3Vrt75UIyNhz0C5
	IVI9PvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXP1-000000044Z5-3QSF;
	Fri, 06 Mar 2026 15:47:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOs-000000044MS-2dhW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso59816a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:47:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772812056; cv=none;
        d=google.com; s=arc-20240605;
        b=SZ14v10SF7Mfl9vCXstFvOlgxIe1ftUdiwq6hyLKwGj5a7Gf5uXSKMQ0GTi6MYvhNz
         MLmTlBx2vANlYf3vmQwsaZCU0cQu/6dkC9w8s7NCrYJcg7DtWMKVHxqGyHPT7NbkFHtq
         LkynN6fTJYoMvKjrnlYUo2hEURQNuDO+1mD+nn7nykIAw7w2wEP4jtnFf5RIeG7AVv+/
         f2BHAENPem7/ATPRcp6j7J9L3BG89ZF2NskZAIss4BP84C4138NYuXnNx5MNADf9o5bM
         HlkL/3TguwiD5iHR/Fx8EerQUqkWkxudCx2E6C+LRYATOqcHDZ3HCP784KS7PR0O5GJX
         SvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        fh=nKNK6AXjh5vwTjFPBGuZRye+Txl/jek0MVXDZT9Y38c=;
        b=InUF8rO10cGNkOuInI3EHPpTJBZbG7B6BxqTYt07Zp9/ldTdHRQBHSh1Edp0naXgpe
         OytAqX+M7kUNWgQBtFlGPSMND+ECTNAwh9llLuywpiudCc8P+pEA6GuK67fk8AGDAPPa
         JppnxMisMAQDlax76VKzJCDyyJZ0ToUkr9p3fPeOyczJ5ek0wd8HgwFlR914HGHVxfkz
         VRreXta7fKLVc2l4d9dA645S8NLoHl/SluWQLKPWCjiTGShuW2YUt+ryMTW27PflVWnD
         XyXfyhkQ3aqnQnJXAA3uP0hoF8YNOI9awYjyNLRt5ZmTl9u5dqzHkqWgUxSqPs6+wa51
         9Adw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772812056; x=1773416856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        b=dmkL/HZvKUSb+TYK5mo2NPXao/GxxgurDgkFGcr8xsnL7Me8NEX2ZHAWH7Vx2sWTHq
         T6Dkvlv58Bhqkd5G5I6HKzxb7ORGufM2sTFMq2ULnSs5SplE8GeDgNDjJJ2uDbD/M9Ua
         p6nsxAkqt4Ox6Zbk3IkZzv1m04kTkesZ7vuKxmXrI8z80V8ZYatFzOHKziEELaXrFiUr
         oxYGvTo+VF7V0lMJw+mrGmYlCnjVHeeVRlS4T8B12yLz3pfN5c/lvThDINMEVod0t0mN
         ArQ7oHfCG+kzMOUlJhtrV/80Kl5eLAso09wdCGvHmUuaHnpQkT5aPpvnweElTpTbmz38
         JkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812056; x=1773416856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAibUuNCn/6BbfV0vtODnkSnkQDwc6wpTn7lzKFXoH4=;
        b=vJWfuq+jycxWIGy0SSMpWvh0gjvew/mNulSDHp2Qa+yqC1j7TWN62HLuOtsGDMGsq9
         vwnbwRzvw7wwDzjCrhUm3EV8vFh4vOyzChBlvHDWbvnD+O5tHGycBIRGCA1ORXF52ASm
         RVyb8GRfjUdxmZlPXel4pMVx5o0CBK62R4ihaflaiUqcnBx5Qs/SPRtiVN1z21eJ0/Cn
         f5DWzIPkp4Yi3SMSzXb+TAL916N5ECTFsRUKWx677o21MtdbavSCD6li+Du2DkjkJ0w/
         WfgMKEX0kWgNIK5eo4T06Z+qUciRQQmfkVr+JobuIqGtOdnPVipmLbnY/BsWLD6uUHjE
         6ZRA==
X-Forwarded-Encrypted: i=1; AJvYcCV6u6gXuHBYnEXz23WMJVoCY4tJD0Y/lW+AcguFH5Mk69KNZSTrplsUhu2SWsiZ+ti1D4VYISvl1Mt7F8MxUNXL@lists.infradead.org
X-Gm-Message-State: AOJu0YwI1YM87NKVCQcMUe+0JL6WHqX7//F1B3X3mOAhnl2HUVKPDAsB
	5YqTj0Kt9Od2cYBEl6ZZjMPz+I0REyeiDRaKhCpojDGtWqZ01j0Key1/R0Pitv/UMK7QLZCLhqk
	i1xeOhekVVMSC61g4rc9zr30PxJsKpqABnchlOn0wIw==
X-Gm-Gg: ATEYQzygiqoG/5KMSXAOmMYT2+ijeom2szz3ScE5ggchrEbPRvXycx9p8wnvVz43C3u
	YcQSxxqe8bOCCwz8iE1eKpGl2nEbXDzbDfz9C6CYj6QSY5zRR3gflnD9hvkr+BHTME+jlHwq5Ga
	YGFNarDO6aJZcPwE9b/NvZj9zea5eEzOKCf1jkgG7D6rXLTPD2yAwWZO3KN036unpmVXHK1cEB9
	aLKSl4JX34Fk5zqc/CrJ1Ik4Uy1DvjvllyU7pQSR6zNLHMp5ryHMbNz+NEWCzZPo8YZsFR7mjL4
	KkfBTV3wG1VS7hDxRReOS72AyzVCx4abVYi+opJmKw==
X-Received: by 2002:a05:6402:278d:b0:659:4295:96e with SMTP id
 4fb4d7f45d1cf-6619d45c877mr1269842a12.1.1772812056473; Fri, 06 Mar 2026
 07:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:47:24 +0000
X-Gm-Features: AaiRm50ckxtcAQiHBaxvyD5wpcj-AQFCGJHbC5hh7xV8KbjQj7W4u1kNphkwgtU
Message-ID: <CADrjBPr1jGX_-G0H2s8yKSNJYLawvdkYKZqQRwFhV+jy8cZWVA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] pmdomain: samsung: implement domain-supply regulator
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
X-CRM114-CacheID: sfid-20260306_074738_768320_48414EC9 
X-CRM114-Status: GOOD (  28.86  )
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
> Some power domains on Exynos are fed by a regulator rail and therefore
> regulator control needs be implemented for Exynos power domains.
>
> On Google gs101, HSI0 (USB) is one example of such a power domain.
>
> While at it, add a to_exynos_pd() to avoid direct use of
> container_of() in various additional places, and update existing code
> to use it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 53 ++++++++++++++++++++++=
+++---
>  1 file changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index f59986b56213..ed7a5807555b 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -20,12 +20,15 @@
>  #include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>
>  #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF                0x82000410
>  #define EXYNOS_GET_IN_PD_DOWN                  0
>  #define EXYNOS_WAKEUP_PD_DOWN                  1
>  #define EXYNOS_RUNTIME_PM_TZPC_GROUP           2
>
> +#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domai=
n, pd)
> +
>  struct exynos_pm_domain_config {
>         /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>         u32 local_pwr_cfg;
> @@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
>  struct exynos_pm_domain {
>         struct regmap *regmap;
>         struct device *dev;
> +       struct regulator *supply;
>         struct generic_pm_domain pd;
>         const struct exynos_pm_domain_config *cfg;
>         u32 configuration_reg;
> @@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct e=
xynos_pm_domain *pd,
>
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
>  {
> -       struct exynos_pm_domain *pd;
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
>         u32 timeout, pwr;
>         int err;
>
> -       pd =3D container_of(domain, struct exynos_pm_domain, pd);
> -
>         if (!power_on) {
>                 err =3D exynos_pd_access_controller_power(pd, power_on);
>                 if (err) {
> @@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain=
 *domain, bool power_on)
>         return err;
>  }
>
> +static int exynos_pd_regulator_enable(struct regulator *supply)
> +{
> +       return supply ? regulator_enable(supply) : 0;
> +}
> +
> +static int exynos_pd_regulator_disable(struct regulator *supply)
> +{
> +       return supply ? regulator_disable(supply) : 0;
> +}
> +
>  static int exynos_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return exynos_pd_power(domain, true);
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
> +       int ret;
> +
> +       ret =3D exynos_pd_regulator_enable(pd->supply);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D exynos_pd_power(domain, true);
> +       if (ret)
> +               exynos_pd_regulator_disable(pd->supply);
> +
> +       return ret;
>  }
>
>  static int exynos_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return exynos_pd_power(domain, false);
> +       struct exynos_pm_domain *pd =3D to_exynos_pd(domain);
> +       int ret;
> +
> +       ret =3D exynos_pd_power(domain, false);
> +       if (ret)
> +               return ret;
> +
> +       /* Ignore regulator errors - the domain was disabled after all. *=
/
> +       exynos_pd_regulator_disable(pd->supply);
> +
> +       return 0;
>  }
>
>  static const struct exynos_pm_domain_config exynos4210_cfg =3D {
> @@ -283,6 +316,16 @@ static int exynos_pd_probe(struct platform_device *p=
dev)
>         if (ret)
>                 return ret;
>
> +       /* get the domain power supply if required */
> +       pd->supply =3D devm_regulator_get_optional(dev, "domain");
> +       if (IS_ERR(pd->supply)) {
> +               if (PTR_ERR(pd->supply) !=3D -ENODEV)
> +                       return dev_err_probe(dev, PTR_ERR(pd->supply),
> +                                            "failed to get domain supply=
");
> +
> +               pd->supply =3D NULL;
> +       }
> +
>         /*
>          * Some Samsung platforms with bootloaders turning on the splash-=
screen
>          * and handing it over to the kernel, requires the power-domains =
to be
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

