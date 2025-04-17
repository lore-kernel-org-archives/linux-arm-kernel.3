Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C11C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Fv+1SPiZIDJMfYYyVTz9JfiGK8xQsdvl6qvFoYBv9E=; b=pQPECuKSA69tSvdc9Cb+diysR2
	9YXQakvasaipp70cgqPvQiQ6+/exV55oDbJw+fQzrK+3y59v+AZOjUcR13Jq1Au4HYxH2E4f6+Lza
	ryXoSzWHsJGI/QjEDAuSJK1b9oWc2uRVgCFZe6NUvx1lbOTKIggFWUjQLEk5NmZk7kgqGEAbq9iYq
	DiHCrx7Hc2Dhkg54fvQgzcVUdKZMvYjf2rZlz2FajwqebHX7AoK3xiV57IF2zKYviMU8/xxS2d+dU
	oZPT7GcoJ6UqOUWvD9rqnMJdMEMSvek5gTXVmUv5ZcXDeKD/6od37iuuukkEh3DvNvx6as9xm9Nwh
	kObVPwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gdN-0000000FXjR-2duJ;
	Fri, 18 Apr 2025 07:59:37 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5g7M-0000000FT3V-24ug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:26:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so1614524e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744961190; x=1745565990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fv+1SPiZIDJMfYYyVTz9JfiGK8xQsdvl6qvFoYBv9E=;
        b=CuON+oXQ3lJmjxreafF+5HXE/GhM2MGNsYhtdLrridjYS0/AOxvTkXLuruYaMISOts
         2hE692il5vQk+JKnsaeP2H3/nNtgsn0Poa5bripkV/9Se6DhojrXdlP9K48h6l6S6B4a
         4ALehNTexL0sxMBTkbGOyV+/JLSfNiZw56aR1xoEL9HSGhBK+JB8jVjyIpbYObA6Uh2b
         yabytoDbCzGL/yFmWpvfeP6wZgxLdEcj0Zhme69HIZ7pUOU7Q6yYYBFbGMAontgfHJ98
         vIvna2raofxSU95gIVbH6dD7kYURD1hQTpu6Ppse+w25ijsnvsa2I725R7TIv2rNtdPs
         8T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744961190; x=1745565990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Fv+1SPiZIDJMfYYyVTz9JfiGK8xQsdvl6qvFoYBv9E=;
        b=gED6dpcA4etGB+oxdmyIkMvxRIkr1SABz1WQHlakAth9C+A0n3l1fD/CEK09xmG9t3
         z2rgUWSn838744z0AOK7YfW1k+FfFn8m/C1W4ra1gIsWAysioEku/7w/Rg6d+xsLaYwJ
         zjySUeEkj8WZDnyqy5o7GUodio2DMS0xc7iA3sFGlCdyy0bFfBWpRQS7dyPH2enDXDbB
         U3Hz+a7TEuwnU+LJa7YPjUyQp++1fXuxoSkmN15noRJBmvlAdefZ0nARqgkQE3LaxL3l
         ih9t5lJYEV/PFzXRMP8GI97fl14odnYGffRPB8mz7D+hkbC2NP8p25NuDSoaDZRVqHNT
         zauQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWtvfGl8KyhQWr/WAA1f328AoA1CXeEOPOPxigFzMPfReNuNUDs4p4aJhgvAmbaKnniW5Td/E9NnkAsS5pswnN@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcgd5zV5GhaDS3fym2ZIpG9ipzWdW+exLjk3ZsjRawiebUaX6
	60PiV3uyf+4bjEeUulfaiMRfpYZT8t0I66rNVftP6Wc3dwebcDhSfMwRYDDsr7fk59ycWDTBt+f
	erUw7Nh98QJnXYP5dHBd2uqzLjtJpojY25arMebRhnxfKQMZZ/XG/
X-Gm-Gg: ASbGncvxBSnoXlSkRah6HALDMmJY1/sASbEB7kwst19Vb17cE1c+6e6os7r1ZJaDkRh
	DZXPdiJyoOca6ri3/ShvcDiHKptxXyiBxIzJV0bu7Fkj9Cc0fCamNWyE9EPAYdAHf0T3zd+kgg0
	9xBwgJQgxriqYo1MxEvlAWToouTfCzS3kV4jCt5r0R6I70NUKC/w==
X-Google-Smtp-Source: AGHT+IF0A2qLak23h90FXemjjq1QSkYxyUlJpX0SxLY+jGfQkwpWy77tDR0Zm8B6OSQfWtCedekDAXvMVmWnr/eLmso=
X-Received: by 2002:a05:6512:15aa:b0:545:576:cbca with SMTP id
 2adb3069b0e04-54d6e61d361mr87421e87.8.1744923382449; Thu, 17 Apr 2025
 13:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-6-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-6-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 13:55:46 -0700
X-Gm-Features: ATxdqUFg-9XKLQu-Jp_yqmPhQEY6HN_legQJia2_mCP7a2s8KIX0565-yrMa0hQ
Message-ID: <CAGETcx9bHGuJ_J6yF14x0NJJXGWgoDn_X_ScBKaGdD4aTBvo5w@mail.gmail.com>
Subject: Re: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign the
 fwnode too
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_002632_554116_A6050722 
X-CRM114-Status: GOOD (  19.38  )
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

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> Rather than just assigning the dev->of_node for the genpd's device, let's
> use device_set_node() to make sure the fwnode gets assigned too. This is
> needed to allow fw_devlink to work correctly, for example.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index da51a61a974c..3911d3e96626 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2627,6 +2627,7 @@ static bool genpd_present(const struct generic_pm_d=
omain *genpd)
>  int of_genpd_add_provider_simple(struct device_node *np,
>                                  struct generic_pm_domain *genpd)
>  {
> +       struct fwnode_handle *fwnode;
>         int ret;
>
>         if (!np || !genpd)
> @@ -2635,7 +2636,9 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>         if (!genpd_present(genpd))
>                 return -EINVAL;
>
> -       genpd->dev.of_node =3D np;
> +       fwnode =3D &np->fwnode;

Use of_fwnode_handle() please.

> +
> +       device_set_node(&genpd->dev, fwnode);
>
>         /* Parse genpd OPP table */
>         if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state=
) {
> @@ -2661,7 +2664,7 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>                 return ret;
>         }
>
> -       genpd->provider =3D &np->fwnode;
> +       genpd->provider =3D fwnode;
>         genpd->has_provider =3D true;
>
>         return 0;
> @@ -2677,6 +2680,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                                   struct genpd_onecell_data *data)
>  {
>         struct generic_pm_domain *genpd;
> +       struct fwnode_handle *fwnode;
>         unsigned int i;
>         int ret =3D -EINVAL;
>
> @@ -2686,6 +2690,8 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>         if (!data->xlate)
>                 data->xlate =3D genpd_xlate_onecell;
>
> +       fwnode =3D &np->fwnode;
> +

Use of_fwnode_handle() please.

-Saravana

>         for (i =3D 0; i < data->num_domains; i++) {
>                 genpd =3D data->domains[i];
>
> @@ -2694,7 +2700,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                 if (!genpd_present(genpd))
>                         goto error;
>
> -               genpd->dev.of_node =3D np;
> +               device_set_node(&genpd->dev, fwnode);
>
>                 /* Parse genpd OPP table */
>                 if (!genpd_is_opp_table_fw(genpd) && genpd->set_performan=
ce_state) {
> @@ -2713,7 +2719,7 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>                         WARN_ON(IS_ERR(genpd->opp_table));
>                 }
>
> -               genpd->provider =3D &np->fwnode;
> +               genpd->provider =3D fwnode;
>                 genpd->has_provider =3D true;
>         }
>
> --
> 2.43.0
>

