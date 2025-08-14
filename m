Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39273CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1Ih+GxrJlx9WnOtqCehCJ3Lo5kUOBdBINzHA4pU3lA=; b=O55tjx5oAaUS2qN5A/c5LlWn0x
	S1hpJEgJ06hAbYsdZgvBjrqd1RB1jX6jhr9t4TfmUDJhC1ROP29q2LVGr+nn0zaxgrn1WFsKDG80z
	BzVGXcqWryfeujZyEoXfcwjMkWtmrHCNQxFgNZEuwcHhVJlDx7cyBHOilZRrU4uGaJny/GspPmho0
	H5Jl4PzvafkvgqtdY1uWsxycgDhVXi6xOBAp9mmdhUmGIr+2qyNxgVKHZpFZ218ceeXDMCT9hAcOW
	ljy6g4cI+4wyDXXl4OGFbRGcCLi0z5C5l8QpjOV11b6aQJe7JIes9SQncs9gXl+YeskwNkUBcgBpR
	UTfxxAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTFk-0000000GENF-3XBs;
	Thu, 14 Aug 2025 08:24:04 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSlf-0000000G9jU-1UKM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:53:00 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50f88cd722bso273040137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 00:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157978; x=1755762778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1Ih+GxrJlx9WnOtqCehCJ3Lo5kUOBdBINzHA4pU3lA=;
        b=cK9i//MaB4HBXATA1GAV/VdSd4L/9jyuDND2RHe8tRvzG+qboPI3zaoXX5EzXoyXFf
         0Eg76J0R4ie0Sbo9c/aZiFQPvrg8i9FdlIuzYVF4sZ0Hf4eYfL4HoUjaWi52yYPaMfYU
         aUjTGYsD3YeAH2o9NQO+cA0vX5qE9lQWqJV2QFPE8XKP7YSyPn818YaCFPeKLovv/Wtp
         /M8xaDAsS6+P0hmAuIkVmaQafrQ1A0+Pju3o6DJQ2ye/mDXtNIx3L8CdzBNjZ4nAut1n
         Q9xQfingH78QmOh1QPv/sjuOj71jFZuF6lbFgBBerDi+1Pb434aJWBxuaqKdjnK8j5Ox
         I3NA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tZADqeFJ9kTGHBq1rEVcdMqo4Chl6KsvWwI1up56VF1ULowWGdeIRLwvd+q9OFbq2oRG323hyqO+i3t9cQz/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk2DZa2xG+2CJOMu313i0jewskKTWszUuOZ4j7FlvGxNr8wjhG
	Rfiak+9AVgYyvqx/2PCgh56llBK7nOGrmUjGCM3GWbFvEB1h43fnehYm48tOI5GJ
X-Gm-Gg: ASbGncvC3YKsNmCja4PGJgidmU2h4CmQjKj5YvCc6sYzyovIyWgXOCmHPgcYC59jZtR
	+mAKH+y9yt4x16Ht6OJkiNcm+Gdw/yHPI874imVvfyP3u6q/I7KbjTKxYUM1o3eDRwziD/kDwFw
	y2NWVjYZKLjy/kZU9hAqCBSS/hu3KaO7BLn3epq4iPjUBGxrvsgwEeh+Go1D5FBuUnnYd4wxPmq
	zrUDLUEb1eHcrZ2g7+Dt5TVCrR/lwcNY1AYHkUkN+MxngNC60llN+rLq+BgHShxGBJLmK4xKeXX
	gduoVOJ8JeAL4OkgGhZS2cT2YPApCr+gHudDK6eolN4UZvY8O5/X/7J+u6UQKJphIwn4m1+TIby
	SRBc26iQXlHSMR+o2TjDdxhN71I85F5KDysu9dCY6zV7OQDciB7py9LCczEU8
X-Google-Smtp-Source: AGHT+IFJ4lcea0lNkC1+ctG9SH3NQRC9A2NK9IrTeQO2uWKu43x+bN1xOTnTmevBmtrk5ymIkwObsQ==
X-Received: by 2002:a05:6102:6a90:b0:4fd:35ca:6df5 with SMTP id ada2fe7eead31-50fdfaddb71mr692653137.7.1755157977497;
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e026e8c19sm3183975241.7.2025.08.14.00.52.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f88cd722bso273033137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVLNj8iCcCsZjjWq+9RVZvp+gNNl2Y9ysVeXFgXo+MGPiyfv+g7SdrELMt9tNE4vXSxocU5TU7y2QY9mHEnnwF@lists.infradead.org
X-Received: by 2002:a05:6102:8011:b0:4fb:def3:d27c with SMTP id
 ada2fe7eead31-50fea4aa249mr676943137.22.1755157976795; Thu, 14 Aug 2025
 00:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org>
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:52:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
X-Gm-Features: Ac12FXx9pwnYSd00OxlZFeC1ex7P8HZ3DAupd0C5lnYndVT3t4qqLZV8fVUeU-Q
Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_005259_413388_C45A6181 
X-CRM114-Status: GOOD (  31.87  )
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

Hi Rob,

On Wed, 13 Aug 2025 at 23:48, Rob Herring (Arm) <robh@kernel.org> wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

One nit below (which applies to most drivers).

> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -52,41 +52,33 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>         struct device *dev = rproc->dev.parent;
>         struct device_node *np = dev->of_node;
> -       struct of_phandle_iterator it;
>         struct rproc_mem_entry *mem;
> -       struct reserved_mem *rmem;
> +       int i = 0;
>         u32 da;
>
>         /* Register associated reserved memory regions */
> -       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -       while (of_phandle_iterator_next(&it) == 0) {
> -
> -               rmem = of_reserved_mem_lookup(it.node);
> -               if (!rmem) {
> -                       of_node_put(it.node);
> -                       dev_err(&rproc->dev,
> -                               "unable to acquire memory-region\n");
> -                       return -EINVAL;
> -               }
> +       while (1) {
> +               struct resource res;
> +               int ret;
> +
> +               ret = of_reserved_mem_region_to_resource(np, i++, &res);
> +               if (ret)
> +                       return 0;
>
> -               if (rmem->base > U32_MAX) {
> -                       of_node_put(it.node);
> +               if (res.start > U32_MAX)
>                         return -EINVAL;
> -               }
>
>                 /* No need to translate pa to da, R-Car use same map */
> -               da = rmem->base;
> +               da = res.start;
>                 mem = rproc_mem_entry_init(dev, NULL,
> -                                          rmem->base,
> -                                          rmem->size, da,
> +                                          res.start,
> +                                          resource_size(&res), da,
>                                            rcar_rproc_mem_alloc,
>                                            rcar_rproc_mem_release,
> -                                          it.node->name);
> +                                          res.name);
>
> -               if (!mem) {
> -                       of_node_put(it.node);
> +               if (!mem)
>                         return -ENOMEM;
> -               }
>
>                 rproc_add_carveout(rproc, mem);
>         }

The "return 0;" below (out of context) is now unreachable.
It may be wise to remove it, so the compiler will complain when someone
ever adds a break statement, and people are forced to consider what
is the proper value to return.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

