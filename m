Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB6ED2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IAnkTbgOaJkZtCVYGrwwhpVuqICb96TvAkTWyFOUQc=; b=YbZ5UhaqcVIYfndyKcheXE04Rq
	3T+cmaen7e7IJ6iUKdyr55yLa7KGszqL13Oo122fbq6SQu5QetAehE58CYU2dTH7qHzvnNZ9KVLTO
	1Zo3fziVgZLNHeBAqRdVYAnMTcBZBEzTMJFOh7JrIpN/6HEA/G6WzEbYrWL+bduL1uq+Pulo2uTqJ
	pU2n6J+tc7jwbrAzop7lgjibqobzugcQKZFAVWWzHbda5neBuell/F66fBB1B3aQDjpVhz+DivaAt
	iarPnLAsVbc4gqqMKZOVo7vkaj9QaIGef+Nmt0FYgoLpiuXFFPFKjuvKNqjOrGhyxxBkN09EkQqlg
	L0BTXGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAel-00000003o29-1mhO;
	Tue, 20 Jan 2026 12:16:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAej-00000003o11-11p2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E330F443AD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B54C19422
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911379;
	bh=+zZx1UCGop6TYPZIxrfkSxnpM9rhdSNLbAwPt6AGnAU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=KjL3GeaZzuJ416a7GxI+F11kDaKsrYLK0V6IMppL8/mVFXv4yIPkzLLACjnXs3zJu
	 yAPWb1yuPbjMTkV5MjhigVb5P2fgp1CMxOqZdAEFoMc75UVPsFI5YPzB3oYX/1ye+a
	 QBZczAamyqfW5Z8dUucGo/bRJl16usMiTt+vdEaVLt8xzpnIkAQqmG6XPysWnFwAkK
	 pkFZlUxT09h/U5Oaj4n5IIdL3Qq7UtOGBnR5oFPASgQLkE6KxE9aKvFStC5Hicw8+C
	 zCibngRXB6CoJ4VdyqFqQ0js/x0njel6NQarfEty25OwhNJXB1JVqfdXm8gZcxXChw
	 lGHo9JLia0YBQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso5747099e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:16:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmx3IrHdaQqahg/TY56p/5eIbsM0ntLAuBjOFKRhjeUVsNQNbwF5jRQceArgGuqxNEgm8dCICxMTC0cF35IFDd@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTAIlZPVx2nBtssusQyz+vTuNuhZLkqf1egYi+cexom1ukObi
	jfUyoiUXnnP07hsV/zZxsRjcDYMoMB8+rVPODIDAA2L8cB0GYqkQkKVYxdOTUtfBv8n9n23s/ZC
	1ydPJs2qPNwzFIIs3khfVRO4TPGPOHXwToOgNA1TOIA==
X-Received: by 2002:a05:6512:2526:b0:59b:6853:f085 with SMTP id
 2adb3069b0e04-59dc8f2348fmr709971e87.16.1768911378444; Tue, 20 Jan 2026
 04:16:18 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:16:17 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:16:17 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 06:16:17 -0600
X-Gmail-Original-Message-ID: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
X-Gm-Features: AZwV_QiTyzFRnq5hh7hZRZvq1Kgy4gAD4D9HxCaMuBiHbH1GRoIc82NCrITXf6Y
Message-ID: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_041621_330875_F33024AE 
X-CRM114-Status: GOOD (  16.30  )
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

On Tue, 20 Jan 2026 12:59:22 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The `num_custom_params` was not set to 0 and the pinctrl_desc structure
> was not initialized with 0. This would result in errors when parsing
> pinconf properties from the device tree.
>

Shoudn't this come as first in the series and with a Fixes tag?

Bartosz

> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 3e0c48068f08..27ea0b44a7aa 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -1272,6 +1272,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  	s32_pinctrl_desc->pctlops = &s32_pctrl_ops;
>  	s32_pinctrl_desc->pmxops = &s32_pmx_ops;
>  	s32_pinctrl_desc->confops = &s32_pinconf_ops;
> +	s32_pinctrl_desc->num_custom_params = 0;
>  	s32_pinctrl_desc->owner = THIS_MODULE;
>
>  	ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
> --
> 2.50.1
>
>

