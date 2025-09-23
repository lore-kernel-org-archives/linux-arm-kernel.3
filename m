Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B09BCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oglCBmL4B4WbAybvmqD8cJJViYSD9fzgh1Gue4gY1UE=; b=zkzJpvNv6imR+7yV8mkrbMRq5F
	SrqEeHjnyla9NDoUF9ymI5YzuoXHvnF0zuXxaFuvC55rGuMEmiSlqAIM4y6RTmN9D81OCrV7x1aoK
	fyERXZMxrV/zHM1zZbYzA38h1aJObCumGr6/+Q61jF9zp4peE5nHpzFmZ8ZbFsSE8LzfKUA9RZ/Oh
	6ltGpaeohhxNnqvRvB/PAaotgrclKwnqSHCUN/glTz1DF3pPJmxZwb3qUHFGo0BTh4TjfvhN34B36
	YA3DPmBr1m3UG7boihC6tLhy0g/MX6ff9jbh5qdz1HF8Zout1Kn+Q07AJIaRx753bCwlqp0ixFZQ7
	YVCCHlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149M-0000000DpBK-0plE;
	Tue, 23 Sep 2025 14:37:48 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149I-0000000Dp95-3qOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:46 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-eb36a143370so609768276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758638264; x=1759243064; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oglCBmL4B4WbAybvmqD8cJJViYSD9fzgh1Gue4gY1UE=;
        b=FbkrIf+eBzCLLcNQH+iMhy8FMl1hvw+RXpFbamQb5Gyqwy/fjlv9hYqobASEBCgOrt
         XD9fpkrfnMX6CTSxo/Ju5YDAEsgMMXTGimUln2RfJz6c+wTuIFfKC+irVYgouRF949Sw
         edKxCJ4xGE5l3leQxr2RiS7Dk0c+glYHUMCcCClN7pT8BQBcxuB4QBij4BQsEOZeaeKU
         02Iz8tYwNUzKlD8d4LriMZwAVhGHR4SroDeheH1J9+vtidrZWZQlw7Ahpq1UTG7BnRpp
         27AS7nKWgy0G+yByXuC+BliCUf0Y4SLxWf7uSN3JJahUSZv8qh1+96qzlViymDmzNqoZ
         ONEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638264; x=1759243064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oglCBmL4B4WbAybvmqD8cJJViYSD9fzgh1Gue4gY1UE=;
        b=DxRsJdiLn0by0mq8U4Ue4llpAgXWM6qTFW643X88rNNb+rGF7T962p8UBsjkJT217u
         s6b2zvCA7ggcRvZksQG/kMZSIRVvIt4KHSAXruc7CWMPHuIhosoRdfrrNFBrw/1f+IwS
         bsxolY6U0MkZojDZ2Ai35ik1PQIkFZxlSyR/xgUxy6IZEiL3SmbHwTXDEXEyRSH4ubyu
         pcFA4Quc1HgNlylefLNDTzXmAMPYzgcIlDWGqEdKHxBpJHcxjTscYULL1ryVeYFYZJ0U
         Jcx058JQjoPMcYdfBFtDA1m0txkGK65JK1zWrTJZ5RtO6S8lx6z5WhYxvJDclfKpFWjP
         3PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV963S1l7RYWRvQ2hL2xopSoyvQiSxH0lug6zWxIje9y3Ox+5oR6ZJiJrLRpe9Cgha8qVMep3DsV8XnLLkjKQke@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZrBAZY3Ce7yHxVdZ9F2CYfv0wHONOEwlzys0ZCfhQMUbkcyR
	a6pzkQoWgYFppS7uKQ3/0oLNiECT2YbJe2rjvE36FKtGT2fwrX6tlgmEY7ZGt9/3hfCG7exzdtS
	5FzJskp2752oYCz9B2BaPpt9nIj2sve6R+bD2FM0iGQ==
X-Gm-Gg: ASbGncu8n8RM1RDZvgb3nEr6a+KnbMu6dAjCdexkCHemciYXnxYVdxouI8A7gQcoIIG
	W1500G9UfA1eIXHQVlXH3P0mqY3cFC7N8BHLp14vEiBXERL5p9/mQ889atE2hjL2KmfiMbhx+Gw
	SNCr6YP44+8wogFV6J0nC8mzkCzygNRA5uWdsOeMUOqTvRGB4n/DbGgbQ/rwRGXjJdDjWtvNQaJ
	oEIQwiao87i
X-Google-Smtp-Source: AGHT+IEXKuzIArBc91/KA3f/YzDK175N+zTx0haFXxYxlTGRRGGJLMlWHDTe/A1+uBFUxsZwnePdVwoGLZBFbpfcE78=
X-Received: by 2002:a05:690e:42d3:b0:635:35a0:c5a0 with SMTP id
 956f58d0204a3-636045219e6mr1586791d50.0.1758638263271; Tue, 23 Sep 2025
 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-mt8195-pmdomain-audio-fix-v1-1-782190385f46@collabora.com>
In-Reply-To: <20250923-mt8195-pmdomain-audio-fix-v1-1-782190385f46@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 16:37:07 +0200
X-Gm-Features: AS18NWDFuHpbFMIzRsDGrqDtLAtiZBYWyMCQ67uXlma11BT4iPN9Gof36Ta3gH0
Message-ID: <CAPDyKFrpwZ+7202Zzs=Hh3=AYqAOPpr98CubYw8dRp5Y+ScxpA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: set default off flag for MT8195 AUDIO
 power domain
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073744_964844_8E1B0979 
X-CRM114-Status: GOOD (  19.55  )
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

On Tue, 23 Sept 2025 at 10:52, Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> In MT8195 power domain data array, set the KEEP_DEFAULT_OFF and
> ACTIVE_WAKEUP flags for the AUDIO power domain entry to avoid
> having this domain being on during boot sequence when unneeded.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> Patch tested on Mediatek Genio 1200-EVK board (based on MT8395 SoC)
> with a kernel based on linux-next (tag: next-20250922).
> ---
>  drivers/pmdomain/mediatek/mt8195-pm-domains.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/mediatek/mt8195-pm-domains.h b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
> index 9405e8f62eaf07112d52a28e6545d26a4342c7c6..1d3ca195ac75806c458db71db4538940f37128a8 100644
> --- a/drivers/pmdomain/mediatek/mt8195-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
> @@ -126,6 +126,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
>                                     MT8195_TOP_AXI_PROT_EN_2_CLR,
>                                     MT8195_TOP_AXI_PROT_EN_2_STA1),
>                 },
> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
>         },
>         [MT8195_POWER_DOMAIN_MFG0] = {
>                 .name = "mfg0",
>
> ---
> base-commit: fba389ea7aa6401d3539456123cbadfa1a87231e
> change-id: 20250922-mt8195-pmdomain-audio-fix-f7ebf2afb15f
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

