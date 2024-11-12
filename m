Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4FAD42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnJQV6SIrBEYfUH3huctmXM4bbWNUyEeoT62a05aBcE=; b=RG9BRbygd5uYNCy0kutHEWyP31
	gl0m8FBl3bdfy6ZgGwUvvbNEwD4fH+zmoQVpZbJHbhl+Z+6t9HGGnP3tIQyMyCDgekwbsOO2neXts
	u+STx3BaYbFBN0NmIBesyx9MmVywLQzr0ekg5jO2XbRyhftYTmKOuWpvtp8wCKWfaJRhLQKi9P/3i
	zFZpmRwS4xQOKugT8ootXBteQtL2IkbbKKTDe3E8LKS0d6h5badRRucZeWmMr2DLzlxJGvPFWo/3f
	bwu8EuF5PAEHIbIpaXJGmzp1ntnTOoKRC4cIYB+o6ib4sTMeCCVVnwfbqbGHjMBnEITf5nqtW1Epr
	kxzSlB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvyA-00000004cFi-3g7c;
	Tue, 12 Nov 2024 18:50:31 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvsF-00000004b6k-3p7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:25 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6eb0e90b729so25983997b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437063; x=1732041863; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnJQV6SIrBEYfUH3huctmXM4bbWNUyEeoT62a05aBcE=;
        b=jfW6/b+m8wkpr3F8hPOwDYO2b4A2h+7oYRozjFB6dl3BlX4WklbI1NRgnWGa4u0bzD
         1dDgdnlK5HmeE03llEpx4h8ETgfAWwJzTvjY9Qd3nRUXTTnYj+vrlpbirw+f8fcZ0e9Z
         uTV57BEs8EWLGs1daP2UiESaVjZiTAiAgz5Kwass7j9O6tPqMW/74/UeM0ZsurgV93aw
         eHNVD4ggR2ulJMrXGe+bzOU5a7Hb0HhuTFoI/+0VQodLCE4Cz3fGgHdIy9HPSA2DQtp3
         nCaYf6uQwg8nAxSJ5wkXmZKxogdvEjM877J+mMfTT0WhiN74oibgGmSnN3PL0uxGQdho
         Eohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437063; x=1732041863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnJQV6SIrBEYfUH3huctmXM4bbWNUyEeoT62a05aBcE=;
        b=uqGo5sdWeUkjMyCXYaCcKOegvbAFWXDEioFwBTPWkd7FZao71gvT5cMxfOtxVKmB0z
         Szz84izFKgK7WegrOuQTtsvQcM+Sat2pAttcwnOgvCVjIOBOVfb7qycOhYeEggirFXtw
         pJ+4+C8j+xczjeuKxuJn/2AcO/lH99hN1J6BD7mjlpOxIo0EmkAdL5TPCfbQOJmpDUBD
         UQWCEQ+qsIxBOJq1L8EBhsfeO4uIQu5BKwzMa6j9EMsd7nQ4GwEHqD2BufVeq7r92x5e
         wWuQkdM+nJc1GNQLPSwjHPAUL3BokV2RrP52ZTGkWF3V0CNhW5+UZ5NFZhFWZSOJHj1i
         ZEBg==
X-Forwarded-Encrypted: i=1; AJvYcCW7ubp54v+qibK9CvJgIkFkqcXBg2CHcr/4I5OW6eJZbBfKbzJNy4IJr5WI/nUunxTDmvDuX4l2q3jOcQF40g9R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6J7cNBT5Zk6+OlmWs/y/SUz1ybrGuEJlK4eRQU60BWvnZamsz
	DNf2sg5FCaQOwjds8N2GA31SnvqjxiTtomyDenlUjgY/ClT0GbT6RmBLs5rYfJpHFm7y5TZWVPE
	ZbUh7tmHEGO+gjQKs0y+6JcdykNb2nF+Pe/qhPg==
X-Google-Smtp-Source: AGHT+IF6cpXW9+0uAdL1AcqfGK/UqMHI+Wl5nRA87bwUhFwtmph6r68HcLuRG/ke7CBRwoAUdGOvA7rO7EOcH7M2vUo=
X-Received: by 2002:a05:690c:6f8f:b0:6ea:7c46:8c23 with SMTP id
 00721157ae682-6eaddfb0191mr188491367b3.35.1731437063141; Tue, 12 Nov 2024
 10:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20241107121215.5201-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241107121215.5201-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:47 +0100
Message-ID: <CAPDyKFoe3rv49oQ+qAF9fq41S3XwKO6dhg7uhgb1ho7nApDrbw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mtk-sd: Fix error handle of probe function
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104423_977680_20B151DB 
X-CRM114-Status: GOOD (  24.39  )
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

On Thu, 7 Nov 2024 at 13:12, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> In the probe function, it goes to 'release_mem' label and returns after
> some procedure failure. But if the clocks (partial or all) have been
> enabled previously, they would not be disabled in msdc_runtime_suspend,
> since runtime PM is not yet enabled for this case.
>
> That cause mmc related clocks always on during system suspend and block
> suspend flow. Below log is from a SDCard issue of MT8196 chromebook, it
> returns -ETIMEOUT while polling clock stable in the msdc_ungate_clock()
> and probe failed, but the enabled clocks could not be disabled anyway.
>
> [  129.059253] clk_chk_dev_pm_suspend()
> [  129.350119] suspend warning: msdcpll is on
> [  129.354494] [ck_msdc30_1_sel : enabled, 1, 1, 191999939,   ck_msdcpll_d2]
> [  129.362787] [ck_msdcpll_d2   : enabled, 1, 1, 191999939,         msdcpll]
> [  129.371041] [ck_msdc30_1_ck  : enabled, 1, 1, 191999939, ck_msdc30_1_sel]
> [  129.379295] [msdcpll         : enabled, 1, 1, 383999878,          clk26m]
>
> Add a new 'release_clk' label and reorder the error handle functions to
> make sure the clocks be disabled after probe failure.
>
> Fixes: ffaea6ebfe9c ("mmc: mtk-sd: Use readl_poll_timeout instead of open-coded polling")
> Fixes: 7a2fa8eed936 ("mmc: mtk-sd: use devm_mmc_alloc_host")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

This didn't apply on fixes the branch, but only on next. That said, I
have queued this up for next and added a stable tag.

Note that, this means that the fix needs to be backported manually,
but I leave that to you or someone else to take care of.

Thanks and kind regards
Uffe



> ---
> Changes in v2:
> - Add the relevant fixes tags.
>
> ---
>  drivers/mmc/host/mtk-sd.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a2750a45c1b7..022526a1f754 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -3007,7 +3007,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>         ret = msdc_ungate_clock(host);
>         if (ret) {
>                 dev_err(&pdev->dev, "Cannot ungate clocks!\n");
> -               goto release_mem;
> +               goto release_clk;
>         }
>         msdc_init_hw(host);
>
> @@ -3017,14 +3017,14 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                                              GFP_KERNEL);
>                 if (!host->cq_host) {
>                         ret = -ENOMEM;
> -                       goto release_mem;
> +                       goto release;
>                 }
>                 host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>                 host->cq_host->mmio = host->base + 0x800;
>                 host->cq_host->ops = &msdc_cmdq_ops;
>                 ret = cqhci_init(host->cq_host, mmc, true);
>                 if (ret)
> -                       goto release_mem;
> +                       goto release;
>                 mmc->max_segs = 128;
>                 /* cqhci 16bit length */
>                 /* 0 size, means 65536 so we don't have to -1 here */
> @@ -3064,9 +3064,10 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  end:
>         pm_runtime_disable(host->dev);
>  release:
> -       platform_set_drvdata(pdev, NULL);
>         msdc_deinit_hw(host);
> +release_clk:
>         msdc_gate_clock(host);
> +       platform_set_drvdata(pdev, NULL);
>  release_mem:
>         if (host->dma.gpd)
>                 dma_free_coherent(&pdev->dev,
> --
> 2.46.0
>

