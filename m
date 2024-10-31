Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D2E68973
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMMEeFMPWK3k1Mj3t6erHGHrl705TGgxaOatuH/c4Nw=; b=Rmm8MxkbuCZbJ7wub+2AlhajjC
	hbygOz8X5Tz1Z0Yl9be8t/lyAHuvEjjXR2psOzAqtlbyP3dqcn2bdfqMMa9WKLktIllhlCCpPHbG6
	rZ5F/22mZ3JVscutxVSBK0jU/cTS/QLcWt7Idi+H7cExjkf/l/KwCU1koCTlmAPIjTK0HGTri0ZUc
	JelbJGllpdttBP/5+sNwEH/SKN6170tWH3M4cHxo5Ur70YYh0opqFLEae7RRUIuAIeFRPCCt2OLSJ
	greQoMTRvy4uZae9LDT+D6h8KNuFyFBw2Xjcxo7C1NqPQCdQM+QCjO7tj8UKwOLyrW/j81gpdSpJC
	DylUW/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Sgi-00000003IQm-3Ct0;
	Thu, 31 Oct 2024 10:46:00 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Sdd-00000003Hi3-3Zo8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:42:51 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6ea053b5929so6051417b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730371369; x=1730976169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMMEeFMPWK3k1Mj3t6erHGHrl705TGgxaOatuH/c4Nw=;
        b=zCTliah2P+jaYqIPAr61FaCl950L5HkZbyiP2cHDMspDUNYpbOE9bMaJWv/t4b4a5z
         Rhjr3sFQhQBKbGcIadXcsBz1m8TluhG8yeH/trk7JjM6z0mpf/GtJdQXGWOQ1xHOaHa2
         9TWlOUlOgChcFN2JGvq1QBh6mZ7p2BBHkDkyMeiOxQMuIZKJqp9c9oDsu9eKFYEBd9ks
         wEVXy9B1Em+Ho44QWBkEmIUDPaPES8TgrUUWWaFuT8i9yHLRV9wSpWmtkiGgkL/Nyji1
         K0EcqHdU64L9fvvJMOx6ZyNvsfr5bv0iIAG4sJlhMGdM5088J2DR8SxECjnfb4Ft8XVV
         xNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371369; x=1730976169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMMEeFMPWK3k1Mj3t6erHGHrl705TGgxaOatuH/c4Nw=;
        b=W6l3UdKXv6eR/tgfGmRZDX0/bHifhFasg9pUzYoWEJm+D5v9kwoAqJYgzX13zVUjw2
         KZygOzJmW1f6RAbjaq75GQqqx3RagFtauR9Ik9SwqW4Iutpc969ZjShAE0XZ571r1JWW
         c4l1iS+iJB0h5tRZnamSl/JNl4sMInUIcR42sTQ+3bHeDPzrVtKklO6rs8DOEUG0Ub3p
         PtdpiMMIzC+ECnRpesj5BozpiPB+sH7ymF3vIfO6kDt8GAy2J7aYboREXLDiy9HszFhr
         ygw/NK7gQTTg9NFKoaO36Vr+6jdzaGdebk06CNzuli1ftcsJIee1mwl/oYRHjEujygkw
         K+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVg79W/JKfuWGOAmJyHkJo1pQXpjMzLBHpEG7cg9f57VghsGIeeQAKkNPqPOrh709Pue8JJkPdweDqdbEpo1kIV@lists.infradead.org
X-Gm-Message-State: AOJu0YzZjb9nF38S2SZNbZnYScQbG+7JYATDLsUm4Kx63ft7y78DuPz0
	KpqJSurCyrwaapXq6746jNm51iB6pDS5Ql1SrcEsjDuS3qmxqnk4W0vQhhtvtKoyI2Csg58OjZi
	s/cKBCagtjiFZ1Kr69V5M6s2fP1KwTEF72ib8ug==
X-Google-Smtp-Source: AGHT+IGyiL6eL7R/DPiVFZpGqii4rrnifN6ppsdutYkmenhnXdSBL9hr48zxfp3pOkfOu5iicApNUvdcgoemDUYz7Tg=
X-Received: by 2002:a05:690c:4989:b0:6db:deb7:d693 with SMTP id
 00721157ae682-6e9d8a6ce53mr203324727b3.22.1730371368586; Thu, 31 Oct 2024
 03:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241025160430.4113467-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20241025160430.4113467-1-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Oct 2024 11:42:12 +0100
Message-ID: <CAPDyKFqeibF4JAzYZgimUgRN0Lj9K8qSdorxx6DA=j_c5PE9bw@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Michael Trimarchi <michael@amarulasolutions.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_034249_934617_924B1951 
X-CRM114-Status: GOOD (  22.60  )
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

On Fri, 25 Oct 2024 at 18:04, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The patch standardizes the probe() code by replacing the two occurrences
> of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
> other error paths of the probe() function.
> Note that dev_err_probe() has advantages even if the error code is not
> EPROBE_DEFER, such as the symbolic output of the error code. Therefore,
> it should generally be preferred over dev_err().
>
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Applied for next, thanks!

Kind regards
Uffe

>
> ---
>
> Changes in v2:
> - Improve the commit message.
> - Add 'Reviewed-by' tag of Marco Felsch.
>
>  drivers/pmdomain/imx/gpcv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 963d61c5af6d..6e6ecbf2e152 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>
>         ret = pm_genpd_init(&domain->genpd, NULL, true);
>         if (ret) {
> -               dev_err(domain->dev, "Failed to init power domain\n");
> +               dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
>                 goto out_domain_unmap;
>         }
>
> @@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>         ret = of_genpd_add_provider_simple(domain->dev->of_node,
>                                            &domain->genpd);
>         if (ret) {
> -               dev_err(domain->dev, "Failed to add genpd provider\n");
> +               dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
>                 goto out_genpd_remove;
>         }
>
> --
> 2.43.0
>

