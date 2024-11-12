Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A9D42BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBk1KBzwEOHZKuHnC3LcVYLaBvifyeSlS2dX2zuDsKo=; b=hxPEVeZtotEZ5xIiLcTN/50X8i
	HhqQvfctG4qIKkDExXg6T6BJ9gPEsaFh7pf4aDZNDfm2eaf6b+eNNCpACwVoofn/hNleW7KVzzegw
	XVjqHuCF/+54MxPvxVQ6Gike6xOwGgH4WPQOWNTaGFtnCLYgGPjwUdNPYejltc3fgjEBjABoANKM/
	egzi6pJN4sf2RrOpOWRxmGPUcP/td2OXbkqdYF5EJVo3gO14PEUZaxfB0xLuNXmoGNUtdkNI1R0z1
	EW7IRNKeLnpRlN0Y9pnvH0/VBdLUuoCJWkrbbH8uMzwHd9oK6fKHuuEeYu/kJ+v53R1Ge42Hfg30Z
	ncq5mSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtKK-000000043LZ-3QO5;
	Tue, 12 Nov 2024 16:01:12 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtGP-000000041zT-428m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:57:12 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6e2e41bd08bso59109327b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731427028; x=1732031828; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBk1KBzwEOHZKuHnC3LcVYLaBvifyeSlS2dX2zuDsKo=;
        b=dfbkxsUz0IkiMBvna/HWCVcQ2AErkUdLkdNhKzmFzMZ22H54N+x6T7HbJxaE8cCgE7
         J8qwBSw+cZGr6tgLoHMDaurCmlkT8TIB7RUGokizZAon6PppuLJuLtOi6jli7Duu4/nN
         Q7hUCnHYBoFEsOdi+mcpHHA1jTYr44wLXn/hWmUimWDqChEGCd7MunlnpJfby6pTDi7I
         H+UrMUjnG7B18AE5PfgtWOuZc4RfsKrJ802X0aa38OUmj77z7ziF2Clqo3c2WhfLaecS
         TbhlDUmOL+zw+iqoeZ4yWUJvSKqaUO4q8L4EZWSqDfcQaFg78CtSCnXYogwvzq9ihp3g
         Gb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427028; x=1732031828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBk1KBzwEOHZKuHnC3LcVYLaBvifyeSlS2dX2zuDsKo=;
        b=cflLyl7auIboz2WsQPuhA7x4fP8gssAiEJi6+kWuuWQ4qr27KnT+lgi16bYHW7TO8P
         OMqMlrgxJUrcNUdM6O8tdjxLvNVO/GrNhSP9ESbjMakFwaACtQRq+0fR8FWJIFyYayDM
         y8O3aIVYkUS/9Ao7ZY6LzmJMUDWKdUbdzTyxTGZ7pSH35QluRZ7sECg1e/vD0z/0RGmA
         JZKoGUxTtVTqapF96Qziu8rQjOqdzlGK53t3shKUGX/cWgXf0X4qtJyBjxofE6cOuHUc
         QzB1pberhiuWTbvPuszjLzcN4nhR9pf9s5g1gZ81wg8aiR1Ml70uoB4v8vNy35LOeUtR
         rK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv0K4SJVDzjeWwGxMdRd8GpFZ1kwFwEehhzgPy2VIaFb5xsdbo+cHGTJI+/1D+kvRHH3WQzOMd3LxE+3LUjZ+C@lists.infradead.org
X-Gm-Message-State: AOJu0YyrAdH/TCYYjSpCQuQaZFvxCRYkJQgI27EeHbw6VAAx9jEXy896
	xEmVpMwEh5GUQBr9cwtzV0rEh8JigS6v4a5bQlB1pFsVGEe+HQQHxNjUEWJ3xK7ND50dfethOLY
	hj9P1EWH8evwETRvVc1Gml4ErkHZXTgr8ebPyEw==
X-Google-Smtp-Source: AGHT+IEbIXuO/FqYjARrZep3wROIZJT+00STOjU9kzztmEI5hpPneiVqw/DMdVTNmBDXF4I7LbrGsgy3l8sZTRamFzM=
X-Received: by 2002:a05:690c:700e:b0:6d4:4a0c:fcf0 with SMTP id
 00721157ae682-6eadddbcfd8mr154933787b3.20.1731427028254; Tue, 12 Nov 2024
 07:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20241104190742.276710-1-robh@kernel.org>
In-Reply-To: <20241104190742.276710-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 16:56:31 +0100
Message-ID: <CAPDyKFreU6wVnsOwz9nstiQ=0sSKN=xtGOaqotwES5UByxQeKw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075710_034880_73ECE934 
X-CRM114-Status: GOOD (  17.60  )
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

On Mon, 4 Nov 2024 at 20:07, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 80a4dcc77199..fbb4c90b72c4 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -411,7 +411,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>         pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
>
>         /* bail out if DT too old and doesn't provide the necessary info */
> -       if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
> +       if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
>                 return 0;
>
> @@ -511,7 +511,7 @@ static void imx_gpc_remove(struct platform_device *pdev)
>         pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
>
>         /* bail out if DT too old and doesn't provide the necessary info */
> -       if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
> +       if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
>                 return;
>
> --
> 2.45.2
>

