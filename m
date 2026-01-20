Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2DD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DisFyYzCfDclVFt+G5bXfi51CtJOBrgzoZTg+744NWw=; b=bPky+RQkWatHAvK1z9I18//Wdd
	Qse4H41fPvtdzAk8iw4IDtoyAYQ5B6aKdEwlZNOLulM10ZdauNnWBJ44SdJOcGgdjYyVZjIJ430Hi
	2VWHPmznpxr3ySvpmVjstigI7etbBA/uRX2iH9IsOujrIcp6HQmNAjyVrpLOq7ygj73ifatz/+38K
	Ts6NOx7r6uycON6ECwGWRLxcBRRVUiCnO6i7ZP92CDrHvXA3OkkX7hWwioECXWRiA51rIhfUC+opy
	mj5JWzwHMt84A40/xlvPxzMCTa2N2ssIuF0r7YwxBgk2OE//TY8WSwVbrLLsO5ZCdmBiOGkmjlnIp
	NIfyLVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAew-00000003o5B-31q0;
	Tue, 20 Jan 2026 12:16:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAev-00000003o4f-0E00
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6626860149
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084D8C4AF13
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911392;
	bh=f4SQu8TLteMQk418u5SbKNfQe6oAUTEfS0S5lAZ0Tcs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=AuytESB2Xc8VnlYLiGZm6f1MxLdOcO5e2ZaGni9VfyIpTVcVQ+pqKu4le1BPzq7L1
	 OQi29y/l4piWKUEFQzvXZ9ZSXaayloVXq5QyeX6DIlMb64DRaOcrcwPC/LOVo186v4
	 0TEqQARXpwKS6oUgQt1vMmFncfjOseTlLzIo9X+jo2OPfdQ4uhRp9XUxPOgv2s39ja
	 Q8Jbb4N4u1WMGuggYxYycMTPhdRbt+EuExDfubWYpNv00pfrPtCEzS1OTqvZfGbzSG
	 aNdaYmErsowI9QdECdiC5a68+fGnicuzof3qZ8dDAC/uwPF1IsnNqU7mttg5g4+kRz
	 nuE/i7zLeAF6A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so6522503e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIfEaUqfp3vncNhPZHaL7n3hoouarkWX1RTMI3q6+WWIbwiAATEl0hVgLWJWGAnff+DPODGdfehWDRMiX69AS6@lists.infradead.org
X-Gm-Message-State: AOJu0YwGDtvuPTPBAqm/K0C2oDp/7EgJVUv+YDzXrUOPX+hfErTKtoJ9
	COtDW02q0qE+BNrc65x2gH+SElueOX150mUB6o19ADG7AFTEIsuG6BEHItygzNpZk8iQKF3bfoZ
	9KUUtHGsJUjuTmpCRr4htkzjLIWOr1DiItk8zv8yoTA==
X-Received: by 2002:a05:6512:2398:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-59baef01bf5mr5299465e87.46.1768911390457; Tue, 20 Jan 2026
 04:16:30 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:16:28 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 12:16:28 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 12:16:28 +0000
X-Gmail-Original-Message-ID: <CAMRc=Md7+SWMpF20y-+-+Hn7ymkzuMeTxT2EsE3Cnb=B6YUG0w@mail.gmail.com>
X-Gm-Features: AZwV_QiewUw2Hjrv10M89S0t63JoJsu7jxaj9pA-T120txrnOoBROFqPAhkrEn8
Message-ID: <CAMRc=Md7+SWMpF20y-+-+Hn7ymkzuMeTxT2EsE3Cnb=B6YUG0w@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] pinctrl: s32cc: skip syscon child nodes when
 parsing funcs and groups
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 20 Jan 2026 12:59:19 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> The SIUL2 node contains child nodes for syscon
> instances (SIUL2_0 and SIUL2_1) to expose register
> ranges for SoC information. These nodes are not
> part of the pinctrl configuration and should not
> be treated as pinctrl functions or groups.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index cdd3a1cd4fe5..50d5a01107eb 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024-2025 NXP
> + * Copyright 2017-2022,2024-2025-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -832,6 +832,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>
>  	dev_dbg(info->dev, "parse function(%u): %pOFn\n", index, np);
>
> +	if (of_device_is_compatible(np, "syscon"))
> +		return 0;
> +
>  	func = &info->functions[index];
>
>  	/* Initialise function */
> @@ -941,7 +944,8 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  		return -ENODEV;
>
>  	for_each_child_of_node_scoped(np, child)
> -		++nfuncs;
> +		if (!of_device_is_compatible(child, "syscon"))
> +			++nfuncs;
>  	if (nfuncs <= 0)
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  				     "No functions defined\n");
> @@ -962,6 +966,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  		return -ENOMEM;
>
>  	for_each_child_of_node_scoped(np, child) {
> +		if (of_device_is_compatible(child, "syscon"))
> +			continue;
> +
>  		ret = s32_pinctrl_parse_functions(child, info, i++);
>  		if (ret)
>  			return ret;
> --
> 2.50.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

