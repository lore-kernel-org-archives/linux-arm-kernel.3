Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD74EB4908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=; b=QDXKE5lccbaniiTOeLEw/zGg4i
	7BTfe2jZR4EJ+GtWXaYhS9Zl2KajywRDWl8uXoq+o5WiYk09wIVl5fDz+boCMmiTcL3n6F3AA6vA4
	9bpsJqJWv7/iEUunDvLdBHu0squQ3lNnoWg+nIyrjVNq+Kn1u0scNcwO3rOClzjKs66P/3dA11Oq+
	6JNlO5A6Pe/TaUGBmWhZlA/hDGN+3EZnAcNZPmyZr7ShdxgQ+3hHbhGiPet6sXOVljZoe50tQOU8e
	Ogw2y5PMuB4TG7xHTcNsMsoyWj0ioGtX6skHTd3bRM2YFh3HyZw17VAtNPNPczwlLvb5koNtLSLGy
	X6cQclaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUy7-000000020Hr-2uyy;
	Thu, 12 Feb 2026 11:34:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUy5-000000020Gl-49ik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:34:47 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59e60925251so1885525e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 03:34:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896084; cv=none;
        d=google.com; s=arc-20240605;
        b=LLKQ+3AvdlU4AO11Qg0k8P1YJffKEUSWTsaaLhSe6cJ5tEi0LdcLCwZU2n5WiwoEuw
         IUc0yui3F+ye3KjBcLGbYCdiScUmwo91OCLsPZuz4V5e5kJRkxECBOzxsVoE3h+8GPmL
         37km/ZJtZ4JXUIZ+hNwesdbM83xJLSOfgT2iiO+MhHrDdmshfkrDAgsSZHtscD7mBGn+
         V+g1mpzeVaXlrTp8ts2beWeVee4h2/mkvCS3bgM15b96LR7bBNcXc9dvZ9b1cAUtvqzv
         XsvZHua3qiDdLL/1ILPGSSc7ukrcyjoiECjfNL9lvyzBM8qEwONWKyRMJVD6tuhTArkc
         EroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        fh=gnLoPYHdv1DlS+/y+T6ySB9NQJJ/HwDwkIT5HlmvmZ8=;
        b=XqTUFK2zaAGv6FZa49FtaSlL1eHX6KQL+mZbwMi3rNfHI9TZur29NBaRIBDcw+qERD
         jkGmnazpJ587fPSNoE32Yfy0mBEVkG3cLqcb4f4/D91oN9w5S155xmui7q7XrHodHgkK
         jFVRkCo5l0Jg21K6iWmPVi08e+G6ze0OYswPFjSRutN/M3zkcVkFhMwDzkwlQfhK2fmx
         LbZ8U8p86ilVjzQYAIf1jf+BlXNEwFeMXvISZSBHOjpzzEae5l1iuIAN/ahD9Rp7vfuE
         7GPnIg7BEXOn6mv4ccy35chiExpS9rsmAKBoNYhIZIrgDPOAh96b8QRtiWG/aV9KOxp0
         xC9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770896084; x=1771500884; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=anTog9fFfMKuBGIec8jQqZvgUCIbac83No+hVmDmyRhKixRfoMKzDc5v1fAHZ5zujg
         FBK6sHzHwX6DK1j/+YEnnHJgOodJK6qU5l8ogEyRPQQNYiZ2BYRsqw2y7gHf5bLMdpOn
         ZIddcKHSRzc6BhIx/cxoxJLDalnZb9LfqQ0Yc6khoV047sgE5kcWufNA2Oq1FD72zF1J
         z6225xZ7yYGVyi6ZORflg4Kdd2wk4X97St76NtnZTwE3PHnyJ5ywKww1dnpHwfAdjifJ
         BhJhjxlS8XITwhJ8ZQwughJMcKylDx8eLb5e4M7HbKIKwAM6qa4IXo/XQUx/sUbVH0RO
         9iFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896084; x=1771500884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=NbYNK2JXHBf+7GBe7Cp8V9hLEOxqiq39EWRnWH9KvpOXvP2ybVP0xULZosbQGlfgHK
         ChIInsPukuvzpQ62PfWzWzOpMeZNgder6m84DkMdU15fYqUCkSSzo/lj8v4hdZwvalyJ
         Je2WQ7Or3U36mA926V2KqGYwRR3cZCU6/9qLsuIdRHYqPIHGLP8+svLuuCrzu4N3LgVI
         6zuWyx/KcXCbkxPpfUXAz+KtIZckCfkeGPcd6LC4ZEC435xpjq1zo1LUEdTKYZmb9/AD
         nYVuMBufe32VK5eolOk/cfseFtlt5a8kLF6WPYEO0QsS8L3/f+A0LR74U+V8GBVWIF/n
         cEgw==
X-Forwarded-Encrypted: i=1; AJvYcCX/og1cYjKnbJYTBs/uTKCcP5UaMEzUn3HVJCZ1IuBGLCfIX9aLp1PYyyCY6ApEt0dTz+E575qPvTs/SgtSTLDj@lists.infradead.org
X-Gm-Message-State: AOJu0YzNNvd+PqYlR+ZSKOHQc4w9E4rWMa9wgam46TnGDELTbXQX21Db
	LLhHDJH8Hd1mS0/dOYbNtjmiw1srTZIgpqEnmz0dbxl2YY09XRWO26NxUT1rOAPBhaMrIUD93GK
	jbUkZ3yotQFJ3F8OP/e6mD/0xRwS3nv23TBS4Jq26gw==
X-Gm-Gg: AZuq6aJ3e8HHDFLtwjy/8/Dhsrcfr2GF4mYkb7ozP6mcWzB6PRZJyXz1KjGE/b37fmt
	SvlIMkIFH/urSvLzKb4vTuQe4AA5bWNUvn8V+bqvQO3708zyY0HyyX1OuA3HjusIl2OnZcKGHMG
	CwtnaJ5TVlwgVXsvAIVwAQGpl8CMfIldfIe8IwIgeVplc8V07jky8kGKmHh373WU9XC0rkXd6TK
	4gubCDY1v3t1jISc8oo5iycMGSAmMnFE+dt25K9aMsv+iFi38nX4zc3Ye12onS8MxmvYSZzthy2
	woY7e8aK
X-Received: by 2002:a05:6512:22d5:b0:59e:5d0c:e2 with SMTP id
 2adb3069b0e04-59e6414e8bemr537633e87.30.1770896083713; Thu, 12 Feb 2026
 03:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com>
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Feb 2026 12:34:07 +0100
X-Gm-Features: AZwV_QgO3Ow5QyeJg9yfF4esWqYhwcZC_L0GtKjw3_i47HZRQkNGD5zGxr2FDM4
Message-ID: <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Adam Ford <aford173@gmail.com>, angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_033446_082982_22CED06C 
X-CRM114-Status: GOOD (  20.71  )
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

On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
>
> The wrong value of the number of domains is wrong which leads to
> failures when trying to enumerate nested power domains.
>
>  PM: genpd_xlate_onecell: invalid domain index 0
>  PM: genpd_xlate_onecell: invalid domain index 1
>  PM: genpd_xlate_onecell: invalid domain index 3
>  PM: genpd_xlate_onecell: invalid domain index 4
>  PM: genpd_xlate_onecell: invalid domain index 5
>  PM: genpd_xlate_onecell: invalid domain index 13
>  PM: genpd_xlate_onecell: invalid domain index 14
>
> Attempts to use these power domains fail, so fix this by
> using the correct value of calculated power domains.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

We should have a fixes tag for this too I think:

Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
Voter power domains")


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 58648f4f689b..d2b8d0332951 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
>         scpsys->soc_data = soc;
>
>         scpsys->pd_data.domains = scpsys->domains;
> -       scpsys->pd_data.num_domains = soc->num_domains;
> +       scpsys->pd_data.num_domains = num_domains;

Not sure this is the complete fix, as scpsys_add_one_domain() seems to
be using the wrong value of "num_domains" too, no?

>
>         parent = dev->parent;
>         if (!parent) {
> --
> 2.51.0
>

Kind regards
Uffe

