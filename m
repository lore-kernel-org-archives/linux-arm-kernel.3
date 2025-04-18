Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA79C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRStZ+2egg7DY4RvB22DIQ8mwU20T0KsGY9/et/qm98=; b=S12Yr4t7O+g0D0pPU5rYhoB/uH
	Ju3kMknWUp+ZVZWeaD+mDOFvqfFpZ1eoUekVBVHnrYB6DRrPH+1aZTPXg+TdMW14MPcxFggG4pedY
	FgC5xUXnsdvDUdMTOPpXpAqp3hwL4ihzvG+PXZ4UBGh543DW+cAFZg0lx1vxRBLSnPnpMucAm1cVz
	WyCgsfTBGQNBG1ICboMaVC/+AQ/8B1o/6E4/2KX7kOoUoppKA4j1UirL153dBSTodf+K1/RS8lXAx
	tH9sYeuVvNekHB9I//2A00EF8OWZWOwxyqpbrmYv495xe7gDAmfBeznkLRK4Y5cnVhETw9RBXFws3
	67vHKrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gf0-0000000FYWf-0Wxt;
	Fri, 18 Apr 2025 08:01:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gKO-0000000FUyw-37OD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:40:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2963dc379so251810766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744961999; x=1745566799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRStZ+2egg7DY4RvB22DIQ8mwU20T0KsGY9/et/qm98=;
        b=1ziW+jUJFCPVTiSb/FlIwwzrR4GVu7fhbf20I9FzhyS5YJLYvRd3iWW8VysfB77dow
         RAUoSI0HcyjgxDySW4KSNEH6m9jCzvHJ2lSi4nfP0NyZGedIwmV9UkK8OA3kairjGE8W
         auOl+zbox9dozJbuSZm+Zm40rCIBEdq43Cl/MUxDv42lEsLkxrNAm1t2Xta6hYFpe1A/
         vU1bgoVnDCobGFQdv3zolROnmZddYj2CERem9CFDqpcVEgIKuhfKOqcUkpQlNqCsENHp
         eVcN8jbsMblWnDL5CZEJUlEqJ3m9vjroH0g87d8JFNpM36InXghC6ok46okrRfB++kwp
         gFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744961999; x=1745566799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRStZ+2egg7DY4RvB22DIQ8mwU20T0KsGY9/et/qm98=;
        b=Vcpmvcjnw7MhPYce3Iyx0FdIjX2+ZyuD413Mwt+bi7XP9cUjWgvRhsup9APpaTz0V8
         cEpnJFLcjOkHWneYEuhDZYjcbQDYsG6v1dNxpKPZSdf6tdgrzQXwWHdphGTncFuuPATR
         xqDjiS8kumicDATP69wNKB4SC4LkvSd1TvKC3dx+hjqB+p2PWhyGZl9AumgEyOORTp6l
         yh3uB9RG++dY+REfI/c9dA0oLuMoG7Ecm/aTrYpb+lMNDjYhl7MGyb2YnTd//ZNoFnrI
         CHKXsbIsQKD99M1aSm6qXvNLBvm1W/oT5oi3a3+SVztRzzw/p8R5EtNKkIeofzExuYhF
         z8xA==
X-Forwarded-Encrypted: i=1; AJvYcCU9tWfAmsijF+qkIe8v9mTIdLO3WpmV7dtj+2FHpQG04MOo86HfCGqN8ZdIOU2rdkIv0WKbQYrn8aEukXna5BoW@lists.infradead.org
X-Gm-Message-State: AOJu0YyzWkbu8E1JcbCyMQYDjene7iHlY4ZE3WZfklWvKRxlRY7USKTj
	BeYPEZXDlWdkkJBaqgzOLQ5+hgFP3/K4vRr3RgshwikzXS6KGIyzo10/1hb6sE6dTHCyQzE4qhm
	puRiZTYQ4hRBJRyEtiVFJSjFrgGDxNMruMAwpmIsh+EIKhS9kdQD/
X-Gm-Gg: ASbGncvHZnHWDd1tgoB8RhtqIkanwSPpwocIFQ8OdqixTWeb/e4VemmKK7qXP2Y0L85
	sgIhdwbx37DYmE/tOjBPK0XqnY0/lnMTadlyQ0bRqpnZodgNbqmMSiCfR9gUudXt1b4NrtCyCzf
	zzRtpZnEAVN+2x/brIfMaJgPYxIA/f0KbTOSWEhOAtcrxFqq/SxjItUoTUHQ==
X-Google-Smtp-Source: AGHT+IG3XD/xd1L4getjSXyzKhJ/tUmw+zRdL3AduxLLVD1S7dldUsdPHIZT/6KW0n4GYVlVfvABqRfIZjoj9xcApZs=
X-Received: by 2002:a05:6512:4013:b0:54b:117c:1356 with SMTP id
 2adb3069b0e04-54d6e66896emr211762e87.56.1744936233589; Thu, 17 Apr 2025
 17:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-11-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-11-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:29:56 -0700
X-Gm-Features: ATxdqUGpJJVZF3u7FnJNC0M4_7BmLxu5IpIq6-Gcvk5MBvzfHTZtM4vMnuDU8VE
Message-ID: <CAGETcx8jWtGAb9CyFyBmuXjNx6XPGHQLmyr6+6S2+vyMnA6j7A@mail.gmail.com>
Subject: Re: [PATCH 10/11] pmdomain: core: Default to use of_genpd_sync_state()
 for genpd providers
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
X-CRM114-CacheID: sfid-20250418_004000_783843_646BDE07 
X-CRM114-Status: GOOD (  19.33  )
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
> Unless the typical platform driver that act as genpd provider, has its ow=
n
> ->sync_state() callback implemented let's default to use
> of_genpd_sync_state().
>
> More precisely, while adding a genpd OF provider let's assign the
> ->sync_state() callback, in case the fwnode has a device and its driver/b=
us
> doesn't have the ->sync_state() set already. In this way the typical
> platform driver doesn't need to assign ->sync_state(), unless it has some
> additional things to manage beyond genpds.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 9c5a77bf59d2..695d7d9e5582 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2671,6 +2671,8 @@ int of_genpd_add_provider_simple(struct device_node=
 *np,
>
>         if (!dev)
>                 genpd->sync_state =3D GENPD_SYNC_STATE_SIMPLE;
> +       else if (!dev_has_sync_state(dev))
> +               dev_set_drv_sync_state(dev, of_genpd_sync_state);

Do you need the dev_has_sync_state() check? dev_set_drv_sync_state()
already check for everything under dev and drv. The only think it
doesn't check is "bus", but if the bus has a sync_state() it should
call the drv->sync_state() anyway.

-Saravana

>         device_set_node(&genpd->dev, fwnode);
>
> @@ -2740,6 +2742,8 @@ int of_genpd_add_provider_onecell(struct device_nod=
e *np,
>
>         if (!dev)
>                 sync_state =3D true;
> +       else if (!dev_has_sync_state(dev))
> +               dev_set_drv_sync_state(dev, of_genpd_sync_state);
>
>         for (i =3D 0; i < data->num_domains; i++) {
>                 genpd =3D data->domains[i];
> --
> 2.43.0
>

