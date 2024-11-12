Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50266D32D81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=; b=dTrCOQxiGOG8Ek+ggeVfPwP1v8
	+IsDC4EMWmBp+I/t4w4ikU5KfDrDIYAamytTOnLAWW9f2f58CkTkeCW3v/RA19xZKcqbcT66KGaD7
	O13zEVF8ztLebz47bz48XW8/I77EUFL4ORBQzldSnwMPOedLiwB7aaYT9vjP2FER2XhTPf3cVAk3V
	pTag9uTH1ozrVOX3eISjDi38kTTV7XdvL0jww2WZhPv2UB18ttpr9CojzK5K+qxBu/Uj6hz9/ci4L
	oucbHPs4yET/JX/ZVE8UkjExZjHW236tXYzqdeUcCpFcfohh9WpquTm+3C3jgLCwcbRceip7gDykF
	4VVMBb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvzv-00000004cWq-2r2I;
	Tue, 12 Nov 2024 18:52:19 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvsK-00000004b8O-452J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:30 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ea7c26e195so62075357b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437067; x=1732041867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=;
        b=M8TRGJ5sxnbJTCaCYcASKMsJ/pU7u0E+q/Thr3c41tJU+cx6Xuu0EPpXuTF4INCp4v
         aVzfQdpP1ACqhJ9NbVSZ2AFcZxBEtsuPGm+wA89J8nN1PHY/a/ScTKpczKPYWyZMf23c
         AnCXPG0DkLPBf3cROi4u3UBY19yeAiXaBaNeZl2ZDwM+GqqpMGJOxsC8kEdYpLn60jjA
         2QpSafh34vw63dIelN0yvxZubVcov6OeC/XtkXiHW7wS9qQ0vfIl4DRPAbDgMhLp+NM6
         SIAhP/7+zC6ilSpn3Af9uKPTdbu5M8h1ccvXzFAtfx2k0trVneJ6Kba0OBAlnfBkd9qF
         FWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437067; x=1732041867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxgsDspc5q1Jni5adG0LIm1mb6Zw1UKHydszhDw5eao=;
        b=ubtu6CpT3WKZq5pPIFR1Y/BRuYP1AF63Qo7O17aNg0Bhq9ZqTDYQhQEw57oKSoMAhG
         2pLKtawnZDDtRVlWrALDxU3hYQmNlOw6WhN40p+/u7LUsod+zdI8HoVj52ck10dnwaKp
         uXDya6glYd7eR7pXUeB6jwL/MY5cNP6iJrr3V/fobvm1S24yfZlLSvhPdATXcvdqWkQ1
         UmtOkl5yzvf8nlmCPcqLlVwF4A1A/MBBy1pJ8fMqYdjUuTHH5Vk+rSCbbgra3rVRhp3G
         OoaCojhuBr0kioyrEAxnhaAqqIqpy700Na6ekWMgvXxahJF58FoNc99EsnBpzUNipUy6
         nbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnkna3qX/i9K9pvWPk4dJ7uEB9Aeq4KetcRCTpuUtSf8QFwFruzqN3CrYkQiTNaUAeGa06QptaAADjyn0Jh/6p@lists.infradead.org
X-Gm-Message-State: AOJu0YwPec/7PxVNyTZFv5IlNxzr+5lsThxy0LFPWuzVLFir7SnMqYyM
	seaL3FyU1OMSXXuJ2IvWQLJKNCVvUBrRq4U/GBZQSMSEikDbxpHWXYbZDLxkMSugFK/aElkU40P
	tprG5krNej/iKbW4Xeo4iGSRnQptEWEki3YUHFg==
X-Google-Smtp-Source: AGHT+IFMWgRdxZRJtK+Lo3CBpB+VX1bBIjkAiyKqAQn28lKpDNF2wtZFNkKRtCi41qnWunWXbKSXnRp5CfqY5x5v/NA=
X-Received: by 2002:a05:690c:887:b0:6ea:7e37:8cc3 with SMTP id
 00721157ae682-6ecb31b89b0mr847947b3.2.1731437067438; Tue, 12 Nov 2024
 10:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20241111085039.26527-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241111085039.26527-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:51 +0100
Message-ID: <CAPDyKFopLrZ2Pn66m-CtjDGOEZyiZ+_i8TnnD4KSHpFqCTN7eg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: Fix MMC_CAP2_CRYPTO flag setting
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, mengqi.zhang@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104429_038728_A19C0E99 
X-CRM114-Status: GOOD (  20.90  )
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

On Mon, 11 Nov 2024 at 09:50, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> Currently, the MMC_CAP2_CRYPTO flag is set by default for eMMC hosts.
> However, this flag should not be set for hosts that do not support inline
> encryption.
>
> The 'crypto' clock, as described in the documentation, is used for data
> encryption and decryption. Therefore, only hosts that are configured with
> this 'crypto' clock should have the MMC_CAP2_CRYPTO flag set.
>
> Fixes: 7b438d0377fb ("mmc: mtk-sd: add Inline Crypto Engine clock control")
> Fixes: ed299eda8fbb ("mmc: mtk-sd: fix devm_clk_get_optional usage")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

This didn't apply on fixes the branch, but only on next. That said, I
have queued this up for next and added a stable tag.

Note that, this means that the fix needs to be backported manually,
but I leave that to you or someone else to take care of.

Thanks and kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 022526a1f754..efb0d2d5716b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2907,7 +2907,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 host->crypto_clk = devm_clk_get_optional(&pdev->dev, "crypto");
>                 if (IS_ERR(host->crypto_clk))
>                         return PTR_ERR(host->crypto_clk);
> -               mmc->caps2 |= MMC_CAP2_CRYPTO;
> +               else if (host->crypto_clk)
> +                       mmc->caps2 |= MMC_CAP2_CRYPTO;
>         }
>
>         host->irq = platform_get_irq(pdev, 0);
> --
> 2.46.0
>

