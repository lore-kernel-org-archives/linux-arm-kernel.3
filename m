Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF21D6ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5N5TeqIz8Hih/q2oo/F5dFMUP3Erj9K850b0DJCwPQ=; b=3KVsnpsGXV4OXAedWv8jTPAZyP
	dXsTJw8XpJteUWJZeg1xPswySTFoFeXzb4nKq0SsgcMDo3BL/2ox4yt8z12W5OgHaXSKs42KIeWRG
	QNPW0X6B09vRVCbUCfiK83U0cbwUHN/fQMigsAGVmgd3mfNmOdo71CFSHNT+3udeTbK9mlI06f650
	asxMNR9kHbHqoUdFuPNePV8M363nOXKsu+ouvMRkgItwlDlhsYt70dl415upcpInfORjJMfFdYD9t
	OBMrCLp1aRTZVRRqcG6nte0nuNWs8bnIrlkykMKogMk8QWcAvXFwp+S525fWazVrnA+qGb04phpUJ
	6swQ7dZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHt3-0000000DDF1-1RT1;
	Wed, 27 Nov 2024 13:15:21 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHs5-0000000DD9j-41cv;
	Wed, 27 Nov 2024 13:14:23 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71d4d0516e6so1797290a34.2;
        Wed, 27 Nov 2024 05:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713258; x=1733318058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5N5TeqIz8Hih/q2oo/F5dFMUP3Erj9K850b0DJCwPQ=;
        b=hPtQmMp4fGQQqJybisdAiEZSw8cFZ75f1AUlkjWra8p00fxm8psL4hpuenYkBmcOXD
         FLCQh84rupGn0JxfwQUSLMNJTAz8Vy/aQQt6qGQH0/xb79NjCKyNTyO44RcDqESXwh34
         Qx145vYnwPVZi9zvl/mky4WXmE1ze2GuqxjRb+Gjb9vX2Rve2/mbFlEezeeckkiNd1rQ
         F5g9vFK0U2XHu4NVN0nFNhmSp0sF0h9ZSNuh050GTgj9FWF85cNwwAywnf9vKYAsgITq
         EqdJY96W5hVd2OQ7RS/ziHNyzHowFKMGqX23X8phF8lwkgVJVv+M+wSDus9kxhYcIHIq
         W+gg==
X-Forwarded-Encrypted: i=1; AJvYcCWumTIkx3EKJoayHbBhpOLiwENnBVzS8RBFqK4viU57t5r12a9GRCpHOb0vJApPsKQYvd4Wt2YwrEcap+hPm8FP@lists.infradead.org, AJvYcCWyhFBRkBCc2+bAhyghimih0Nxl4PdjFFrqxX0hDC+wNWJ//E1DaOsYhRuFSR1kzJt0wrEVubvEBcgbJkvk7Mk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKULGsK/eYStZhI4hlFT2i/24rRvdkKuntOz44v5IddHA7hlLG
	iqLBxs6rlE6SlqNY2CdJSQcVb047fU/1fnyfmr6+YuxXVjRH5PG+4LNepZMTF/Y=
X-Gm-Gg: ASbGncuaP7nVOLUfD758qQBE0iRq3wJJ4/BbPD+LtelskecrAatInx2k1bp3Ml698oM
	hGuE/bkHdlyMzIttSv6MCpqGV/RMniOVjEQYG2Q5MNoxYyNP88zpXlYFG1b5F59Qz1wWcqJh/mc
	P+Bpz34neLUr+bNxIo3cNnjb0x2x2cU9Xc7giETqg4IsA2GgnYjDg8v7oMuvpsdVks37po+mhJy
	ZsgP2uA/FT3PTgmO/IFsAHgkLdQQrEoKrodRZsQjxiHBlY44K4puFLWnngLR8u0H1eMze/lH1Na
	trrSbREppR8T
X-Google-Smtp-Source: AGHT+IE+EOLm/fCWnu5Klk0Uvb8G9aQwz/SUpl/3KXPofQ6JO9JzbIdpzZrAweksBQvWMfELrO9Neg==
X-Received: by 2002:a05:6830:34a7:b0:718:a52:e1cc with SMTP id 46e09a7af769-71d65d09848mr2821770a34.25.1732713258392;
        Wed, 27 Nov 2024 05:14:18 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d42b231e8sm2541458a34.34.2024.11.27.05.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:14:17 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71d4d0516e6so1797271a34.2;
        Wed, 27 Nov 2024 05:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVnyGEwXR8dn8oyxxJXW0iKLgobPD/EgvwxVB6wwADlsHA0Zip4pX9QwV2D8JcuGo97DrJXmEREP2fSxbx4s6V@lists.infradead.org, AJvYcCWigcHaqzR6+Lon44dFbbztAzPGBMjl4nLgU+oai7uCxnfPumaNmxZwhmeqlL/htWLMmzr6KSBexm9g4t4YXn4=@lists.infradead.org
X-Received: by 2002:a05:6358:7e95:b0:1ca:a1d1:65d2 with SMTP id
 e5c5f4694b2df-1cab15dbb24mr152078355d.15.1732713256919; Wed, 27 Nov 2024
 05:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org> <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 14:14:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXUyLbypvgTrtx0mY5vF6abW8bab2poso=xn88gNqEmA@mail.gmail.com>
Message-ID: <CAMuHMdWXUyLbypvgTrtx0mY5vF6abW8bab2poso=xn88gNqEmA@mail.gmail.com>
Subject: Re: [PATCH 09/10] pmdomain: renesas: rcar-gen4-sysc: Use scoped
 device node handling to simplify error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_051421_995674_5881F24F 
X-CRM114-Status: GOOD (  24.54  )
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

Hi Krzysztof,

On Fri, Aug 23, 2024 at 2:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Revisiting an old patch (the same applies to 10/10)...

> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -303,12 +304,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
>         const struct rcar_gen4_sysc_info *info;
>         const struct of_device_id *match;
>         struct rcar_gen4_pm_domains *domains;
> -       struct device_node *np;
>         void __iomem *base;
>         unsigned int i;
>         int error;
>
> -       np =3D of_find_matching_node_and_match(NULL, rcar_gen4_sysc_match=
es, &match);
> +       struct device_node *np __free(device_node) =3D
> +               of_find_matching_node_and_match(NULL, rcar_gen4_sysc_matc=
hes, &match);
>         if (!np)
>                 return -ENODEV;

[...]

> @@ -369,14 +365,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
>                 if (error) {
>                         pr_warn("Failed to add PM subdomain %s to parent =
%u\n",
>                                 area->name, area->parent);
> -                       goto out_put;
> +                       return error;
>                 }
>         }
>
>         error =3D of_genpd_add_provider_onecell(np, &domains->onecell_dat=
a);

np is passed to of_genpd_add_provider_onecell(), which stores a copy
for later use, so I think it must not be released in case of success?
I.e. both the old and the new code are wrong?

>
> -out_put:
> -       of_node_put(np);
>         return error;
>  }
>  early_initcall(rcar_gen4_sysc_pd_init);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

