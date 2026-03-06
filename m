Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F23EFCB61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=; b=YAZmHmoXTJc+B5XQtYXYMyf7JO
	WvSUDSeaSZWFg+GpukmTXmpdiLM6CNjHh/ARAkQgodcFBriCHd0j8uHb8lhptwawA1ZImg3XjsElM
	DulzHqgvqG+iiKKPxYiwau6TQIrU9L0RdLdf8DENHoUu424bcGR0DHaKHWsHzChcDYI0fA4tZqf8t
	HB9OeM2WmtYwzza8aDJlOz33WyogkqKWzmqHWlER/7PF2AFUk53RepwGdiYgO4DsWRbHbkNOLCFGu
	8V4Wbji7O7j3XPYpymgzE/eB3bxw8XIxeJhLv3hvOzAMJ+uDO1YcEoimdYapiR8svYdiyokzt2wM8
	flndwEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXSs-000000045cN-13xC;
	Fri, 06 Mar 2026 15:51:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXSp-000000045bC-0z2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:51:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-660d2e4846cso5208165a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772812301; cv=none;
        d=google.com; s=arc-20240605;
        b=CtY4pf+7myLi3MUr6TXZ9i5gLdBgwPQshm/iIh4vY4B7ERo2GUE6QMVoXJpkXtvsQv
         OIstlqLRMclB9n//fHEIKaJvB88Z5B7K5LZGClib0xBzoj6wtNKY90mnjSOyAZ9ota4b
         VmBiL4fKIs2Sn8n+/t7i21fhKwxMcZEoTzmDkMG7O5g/T7yndOgDd0LxcI12FW5Ks6ja
         VCyqcqrvR0fSFu20YrefRd86u+X9Z+/KGm46xntdEE+Ec0ToqSMOFjNAcRajZYJRzOqE
         M6QaoxHS1yTARpmK/L+xX8dIeSbWkcldv4cjbt5J6QUpZlfij7rU+wESBs+yOpd40DHF
         3FZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        fh=ShjSaoLo+WxnNdnocVbmwLQz2PubYuAEnLO82vc+DHo=;
        b=Az6UWDbsYiQxg830Rt4hDMOcefpzwkoSmD/alnuI1M6EWVZq+xcyLAJfUdqjKf+uNT
         0WKr7n8APlpjJKTLkBrFwko9w9wnkVqK7VpDyGMLzWYZaFgvBzRBWHgB0oKqLgv5y92G
         TM+U6ffS6wDlKSrc97+pRRK5q65Hr3wQFO4FXfniD1LUDbHRn8J417HdrtORSCS3kAkJ
         JxgZOdO7Cpsc2EqANn1PQUXu3qVCxAoCs6yKAXQfVQ8YiOYV/kzrL988XMfoHp90l953
         jwBDBSkoI8pRx6hi1S3d2iRrnTCeJAuuiMePYsNvJmmzx9zJlg+NKXLrcYr3xBoL3qsh
         rszg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772812301; x=1773417101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        b=edIx36nxQYuG9tg2eAqLUP0EurWO5Vf5b8NbIozDHaohck4GcrfHO/KfrQtZ6UtPb9
         f3yIjhjEDcdqwSDHAi4o/jelA2Pbkwp15KXXwNg3Unk2ohvqmLoqQ7prQOc4OBN5K1iW
         tnR3A1hJo66wFoRKv1GWTCLy5RrjhD7P9gB2jLl/bzv1I/nDOLr6ifg1hVl1F1qc1O+0
         TQnEJDnpo165XPBwF2o13HDmgzPyk4rDzBcgHeEIcPkyT262f9uXiAYJeqrW/IwqWAVW
         iNgxP49/3aXBD7830lGQ8Kj9k6/ncVNnY5x2OPx328fdPYq/Qd/7r+82sFHGoqCAMafH
         SG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812301; x=1773417101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzcKbGMLVorHlsZLyV1rvqs6i8R7J8sRM6aIMH0+nN8=;
        b=uzZl6HmSLx/rPJ2mUJIoPRFgJcijAAiS/EjcpKkWZ2nKZH2cqWGJ1/bguodg6kGfrU
         0U/GXNOFVEIgS+xh5N1CHZP/q245eHAOLP2ANXxa8hrwHr/GAQ86kcDkWSLfOaAEOPCj
         fipEdG1ZPxRBZ38KNXMkwrfjvDdyLMj4WL1jClkWg2wgctmyVtEfWBMCpmKhbhQpX9c2
         GGwrJ/kDoWkTK2SP0FWVvHX7+uCrC7NDuZ0FJVWUW6Bgx7GQHoZjXLuMuAi8muZ4c1LM
         Rm1XaAQXCuc7wenMwjSGsC4/SlyTwYHyDxkFxM4wzPfcd6kvQqRxvJ/GCoVUO3XPCfvT
         pt7A==
X-Forwarded-Encrypted: i=1; AJvYcCUUJ4uxaJR2nl2VGHkodwWSFggPg3JFM0UieriFQYokGfDP/OyKZ/xb6xQzwCw4vattoCK6sGiujKBZRGUsSBGU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6o/SLJFDlhMN1Xe1u2Nv/96+FKy/z+uxsiywbCsuk/tjxn12Q
	NXgxrAz8/LQjpeekOy7Rm0OwhLXA/JPylKFpFKXGPYimPiCrYPdth4SjieqpTjHZIcV/k0x9qWE
	WRIrqSlBn62peAr5yWe0zI5sbbqYMiU584HR8Socr0g==
X-Gm-Gg: ATEYQzzORznMEXRrQl73uejSexq0srpaN7FmG3azGYTMtQXx7F+oHYLIT8hTQ5y1XvE
	XbVL27hnRl+vXW3/EAC7CMMi6uBiAauSQNq/73B2rFxLdIUpbmO7/knpMf0Gz037o/nr5rre+fl
	BxIuldsHCNgl5wjfxB3V5SNx2k+2BH+JCFMUWG87dMQVGf12BTzZBfybA8r966HJqMgJ8pDWwTS
	RvhA8py4GxKrdCOQq4ip3sPRkGyvmtPI6uShejm0PDvgzeM0vuz2hovTqabn70f2URB7n+65hWi
	Ka13qFt9REvxB6EowwY59M8KUsDtTgmjqEAxnqNe3w==
X-Received: by 2002:a05:6402:440b:b0:65c:354e:94f0 with SMTP id
 4fb4d7f45d1cf-6619d467bf2mr1553000a12.8.1772812301052; Fri, 06 Mar 2026
 07:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-6-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:51:29 +0000
X-Gm-Features: AaiRm50XSyJAhZxudj29YJ-AfLARk18pjf_9-ZTH2qd-aJZzO76tWKTXAR6KLlw
Message-ID: <CADrjBPqB60UtWpZjBdsGtijw+OSq76vfBaiKoJg8We2na-ixhQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075143_304348_E40C17F7 
X-CRM114-Status: GOOD (  23.03  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On platforms such as Google gs101, direct mmio register access to the
> PMU registers doesn't necessarily work and access must happen via a
> regmap created by the PMU driver instead.
>
> When such a regmap is used it will cover the complete PMU memory region
> rather than individual power domains. This means the register offsets
> for the configuration and status registers will have to take the power
> domain offsets into account, rather than unconditionally hard-coding 0
> and 4 respectively.
>
> Update the code to allow that.
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdom=
ain/samsung/exynos-pm-domains.c
> index 3bcba7d38ac1..8df46b41f9bc 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -30,6 +30,8 @@ struct exynos_pm_domain {
>         struct regmap *regmap;
>         struct generic_pm_domain pd;
>         u32 local_pwr_cfg;
> +       u32 configuration_reg;
> +       u32 status_reg;
>  };
>
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_=
on)
> @@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         pd =3D container_of(domain, struct exynos_pm_domain, pd);
>
>         pwr =3D power_on ? pd->local_pwr_cfg : 0;
> -       err =3D regmap_write(pd->regmap, 0, pwr);
> +       err =3D regmap_write(pd->regmap, pd->configuration_reg, pwr);
>         if (err) {
>                 pr_err("Regmap write for power domain %s %sable failed: %=
d\n",
>                        domain->name, power_on ? "en" : "dis", err);
> @@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *do=
main, bool power_on)
>         while (timeout-- > 0) {
>                 unsigned int val;
>
> -               err =3D regmap_read(pd->regmap, 0x4, &val);
> +               err =3D regmap_read(pd->regmap, pd->status_reg, &val);
>                 if (err || ((val & pd->local_pwr_cfg) !=3D pwr)) {
>                         cpu_relax();
>                         usleep_range(80, 100);
> @@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>         pd->pd.power_off =3D exynos_pd_power_off;
>         pd->pd.power_on =3D exynos_pd_power_on;
>         pd->local_pwr_cfg =3D pm_domain_cfg->local_pwr_cfg;
> +       pd->configuration_reg +=3D 0;
> +       pd->status_reg +=3D 4;
>
>         /*
>          * Some Samsung platforms with bootloaders turning on the splash-=
screen
> @@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pd=
ev)
>             of_device_is_compatible(np, "samsung,exynos4210-pd"))
>                 exynos_pd_power_off(&pd->pd);
>
> -       ret =3D regmap_read(pd->regmap, 0x4, &val);
> +       ret =3D regmap_read(pd->regmap, pd->status_reg, &val);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to read status");
>
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

