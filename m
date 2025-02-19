Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C83C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xe0n90tbsq5x/xPm1Llh+2RuD6r7msq/tuY+Ym3TsA=; b=iuOmpktm+wBF84qrqEF4dYkvRD
	j/pwNMbNLLBEm54+sQV2cdpuiAg5jfEX0DOmvE/r7K6DPuO2FJMCImx6ELTLYLU3/zqGR3tKzo/X4
	PXtuWcTMCXhqSpNRYIY3lr6QprZY3PIWmN3IuWWw19CPXyUwl0cpPX/k5g8DhpEfM62qunlj2OTWl
	QcM4EwD3I3J/1J0e6O+AdyVapVJvTMbSlDkUZdryPlzfxkFeZCKr8iAAZ7ULw64D/cm78WcFK5l/D
	NBAjEOjTPZIqkMl+pCF3gtvKc4GtcVS5fdS8/c4u9YqTRo1cLPvDwjONDgA+L6NCPY0TdfO/M3lss
	fULs3qKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiod-0000000CZey-3c1N;
	Wed, 19 Feb 2025 12:04:35 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkilo-0000000CZ9e-2ean
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:01:41 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e5dab9cd918so696912276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966500; x=1740571300; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xe0n90tbsq5x/xPm1Llh+2RuD6r7msq/tuY+Ym3TsA=;
        b=zuhWGnU/YogNKucqBzvYDYB1lQGxUcBDSUh/aLHp181zzD8MlNDEmOKubLReXuT+ZL
         08KOx9IV+itbkT1OElRI3aw2L/RoLHW6KdZ1FXRuPSLtYO5wfw69cWuC+x+iSMBpS5zp
         jrHMxhOW4ezpILRRv4uYMvW/Qqg6XHAURT73ySF359kE8Mt/N7tbf5mBXjyfvhTBjgYA
         4GuGjv9+Wdxv4lsawZXB1pIHJWiBAKX1Gx6zn+cane6LTuy/dBUiPM3nEbB9YQtpeBm4
         ET0VVIDPnc7cvwt+Kiw3k2tuizsPs6HwQnK1QvlO9Rmub8iPz9R65cCxBq6EvP/a57sa
         akqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966500; x=1740571300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xe0n90tbsq5x/xPm1Llh+2RuD6r7msq/tuY+Ym3TsA=;
        b=XX8ZHchUTppgCG1OxCvtcG/BcWqwtpdnAIa4a2m6PESICA7XPbDsVCEkcIsxdOYfgv
         48857WbfS7zsvN+ck2VWAwsk8eKjeZUyveu324PfPcWFFENoYiqhwzpaYZPPCDw23Ak3
         yFEZHubRbUiko8j9AgKDJNO1HlYQyE1Z5MuVlcMtoouXFIHojGi+nJ7wGI+xppgwCMPD
         4djk/TlewI1QglT8jD5EhTN11LeoTGSzTQ7JLfZwDl/bd33sEKH0Pz7qC7hHCcW6ua63
         RL++MX4KjNyp9fmLrJsImZj25DidaxcPEDGbJLZf4zCIKMqwmCGWlq1vNfFvQo/KPOQM
         tgfA==
X-Forwarded-Encrypted: i=1; AJvYcCVkngdcyBrCMdnOvbVneMXG6P8ks+HIUYKo/mXB42vDEeDqFi2V5QMdya889q47AcIkGK9Kd7ys7kOeiE/Vn6hY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/lPy6HnFhP/K+wXp4iUX0nQC9a4Nfw9wbRN1XuhWjCkP6DR2
	TicxRX7UuRJyZ1qj2nWN14Tz0TKMyJCUcdcpx6G0vA7noljCEQI6wW36JKCS3pRIXqj6sukHkWM
	lCtVACmmE+qTw62iXc70GrZkAPR0m/mAiEcZtwA==
X-Gm-Gg: ASbGncv2B1Ka8ejGH98hEIq7WJen7UlszbWgSYOIJDMhkJ7Do3r7BAlU7UOVAzIAxuW
	GK1t284c19GVqOB4akhSD0sSBvbha+svVh5DK5NwmEqOnpS/QqH8K2sOYLo/s2NwkFI+WrqKbZw
	==
X-Google-Smtp-Source: AGHT+IGZ/+8xQ6gwL9boFRNAF7KVM22iCnqEax+j9Sk0drg1U/1wYEwbpzOiKk0ZPA6neRnIXD7xoQxd3GTjDpsqxfA=
X-Received: by 2002:a05:6902:1027:b0:e5d:f98f:6f33 with SMTP id
 3f1490d57ef6-e5e09a34021mr2671796276.10.1739966496117; Wed, 19 Feb 2025
 04:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de>
In-Reply-To: <20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Feb 2025 13:01:00 +0100
X-Gm-Features: AWEUYZkq7YJtxfAEssq6nuztkZ1WzoS_qm-UMarQYj6y8mBUO7XjlBb-t9JXEpQ
Message-ID: <CAPDyKFrEHXhb42rnpjv0KqaUtRzKhX11w70ZoTM8+u9rYDJyuA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: use proper helper for property detection
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_040140_669672_1709D360 
X-CRM114-Status: GOOD (  19.57  )
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

On Tue, 18 Feb 2025 at 20:18, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Starting with commit c141ecc3cecd7 ("of: Warn when of_property_read_bool()
> is used on non-boolean properties"), probing the gpcv2 device on i.MX8M
> SoCs leads to warnings when LOCKDEP is enabled.
>
> Fix this by checking property presence with of_property_present as
> intended.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 958d34d4821b1be68d730ad345037b8f0a56c45a..105fcaf13a34c787b2d568bc64e7fee9bfc23393 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1361,7 +1361,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>         }
>
>         if (IS_ENABLED(CONFIG_LOCKDEP) &&
> -           of_property_read_bool(domain->dev->of_node, "power-domains"))
> +           of_property_present(domain->dev->of_node, "power-domains"))
>                 lockdep_set_subclass(&domain->genpd.mlock, 1);
>
>         ret = of_genpd_add_provider_simple(domain->dev->of_node,
>
> ---
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> change-id: 20250218-gpcv2-of-property-present-158f8dbfe2dc
>
> Best regards,
> --
> Ahmad Fatoum <a.fatoum@pengutronix.de>
>

