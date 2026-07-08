Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE9CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=; b=q0+s48GezFqOXV1OD7gayjEriJ
	5WCi1+ZuqDOwgGXEdJkPpaPMTJcMzok+k0LqWiQCgb778pBuT9OYMohBM3MBKIciEh5RGQf/I7exA
	mtOXwCRJJvBDcwKAshz8rV+rL6+gIBYF7CcFDCDitsrrcM+QSylmOWIzON+QZLjnF55P39Xl5azWs
	uRWKbhIUZ0CCIbV/LoWokhGJhDB/CXB+a9jBY/JHlGgNCEVqi9SH5oqa6FK3/lDqyapWAJRAgkj6U
	tQ1ROMKZna1VW+PQI00KybQDnSFlN3LF1ccwqyZuWT1+UGEdyYVu1jAgHBlKPtL0No1McLrB00Ump
	fjXT1SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVU3-000000001fG-3aNI;
	Wed, 08 Jul 2026 16:50:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVU0-000000001eD-3oV8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783529446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
	b=OW3qO8fbKM/sApYx/A9l26ruVnL+hTHbbdGjCW6uUXfuHCD+OiMkNHfoSQfDrhk50OAk/f
	z+fBPLS98L03ZvfSAqi2WANwwI7tGFUYFJ2jb9+MHyX7ImzdTSTp2Sn8/T1c7ESdNiv6R9
	NlV5uWQJSMWS5j6uELtYRfxydkWUODc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-QogUGKrMM92OCdmasXq2vQ-1; Wed, 08 Jul 2026 12:50:45 -0400
X-MC-Unique: QogUGKrMM92OCdmasXq2vQ-1
X-Mimecast-MFC-AGG-ID: QogUGKrMM92OCdmasXq2vQ_1783529444
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7ea35baee37so26450347b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 09:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529444; x=1784134244;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKgh5ApTuCOuav59S8TO2YqC8DCsibHGOqh1KF7QsrM=;
        b=WfKyShVzAELG8kAKYIDmzTcafH1xP9DmjCP2ZMQH27AATqixSNR2lIlopdmZ4f8vAX
         yGfjpZ/gEPL1vHtkAnoQWh8CVn2izOCoLL2Ts6AllB5BRVsZWvfZ85ADPn4vob5TuRUC
         Thdb+OWOgQW8OCtspB/+XqnI1VK+Y1FBPTteKAJr9arWbQky3ptRo4ljFuXHw6oXSyvP
         lOJpXABVmqrymHJrsjEtuMg4ezgi8+B9bXKH0QGR50Yc1cQU85VXc5fF/KTW8C4vRjbx
         IhlpT6unM4ga9e4VuH9qPgSIbZUUdBY7H/1/mZ3kdD8hSchtbBolI4xRXwhYrnjwml9q
         O2Rg==
X-Forwarded-Encrypted: i=1; AHgh+RrUSlD/Tcx3qx+8IPZkOErL2uudYVlBwVx2/il4DzXMN4P7nc3YqVgBpzXuEa05RVkpq1MKver3GhKSesJQa23Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5O8lDVMkUZP3e/sbe4JP2nxb4iY2QaMdWApsF2pag43Rf6DKX
	cZi5/OxAnp6clSwPedEY8QLQJuB3QQbj8xRfqFcEaMVbgrvxejMz8A/g31cNBJ3zJIt/2GApLkV
	rUyF365ch768UADWv2CVGADwcUrQPAfL/PTd2MQ+QbNpNABkv78qgcHyjc2oEY2d/KFcQ/zP5cF
	xE
X-Gm-Gg: AfdE7ckU+4TPJsZrAnduy2+tfK+zdrx3cQF8k1GzMeiN98swioTdO7Dcc8/Mwx7cWCT
	S2RhOTHHErRGjOs6b6n3CXHf+PM05wwkzTNEvsByvvj5puoPQlcMwiXFsZ2j0MtgA+CxEtL64mk
	IdhvTly45p/2ik7DpN2plQA7CHMMmDfXXPmnSRDlaUBXUnyPrIW3EZ10Cszv6BpMdSMPYmXFnT9
	aj0OQqlRZg6H6X+4KXvwmyV4o/M2bWn169o8D6kWLEJi0YjP9RTecAklTH3mM4WcqQT0tVDoK1K
	MG9xao9ToSbcrPivU1CJSYzyYFfPN6PgZ0TMXjbq0GwUgAIkOzKjsxiRGfc6VupJM4qM8wv37ez
	a5X+o19Iw4BQ8XkIoPeA4vup/Kg6NasNlJ0D0mhIaMHrSKg==
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866617b3.17.1783529444314;
        Wed, 08 Jul 2026 09:50:44 -0700 (PDT)
X-Received: by 2002:a05:690c:b03:b0:7dc:7764:3e83 with SMTP id 00721157ae682-81dbf597344mr25866277b3.17.1783529443859;
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8143dfebd55sm86860117b3.0.2026.07.08.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:50:43 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:50:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
Message-ID: <ak5_4aTPwWPdczms@redhat.com>
References: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260708-clk-mediatek-pllfh-fix-v1-1-2cfc2d6b258e@collabora.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7-E8lvfZiIybxcj57nCeXV-KyGQ6BeW1kWA1e3YjeTE_1783529444
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_095049_025482_7597EE47 
X-CRM114-Status: GOOD (  35.01  )
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

Hi Louis-Alexis,

Thanks for the patch.

On Wed, Jul 08, 2026 at 11:18:59AM +0200, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> This patch aims to fix a issue, detected by Sashiko
> during another series review ([1]), regarding the use of 
> mtk_clk_register_pllfhs function.
> 
> The patch is based on linux-next tree (tag: next-20260707).
> 
> [1]: https://sashiko.dev/#/patchset/20260701-mt8189-clocks-system-base-v1-0-2b048feea50a%40collabora.com?part=6
> ---
>  drivers/clk/mediatek/clk-pllfh.c | 87 ++++++++++++++++++----------------------
>  1 file changed, 39 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> index aa95cd9197b3..7463aa35d7e3 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -197,6 +197,43 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
>  	kfree(fh);
>  }
>  
> +static void mtk_clk_cleanup_pllfhs(const struct mtk_pll_data *plls, int num_plls,
> +				   struct mtk_pllfh_data *pllfhs, int num_fhs,
> +				   struct clk_hw_onecell_data *clk_data)
> +{
> +	void __iomem *base = NULL, *fhctl_base = NULL;
> +	int i;
> +
> +	for (i = num_plls - 1; i > 0; i--) {

It looks like this should be i >= 0

> +		const struct mtk_pll_data *pll = &plls[i];
> +		struct mtk_pllfh_data *pllfh;
> +		bool use_fhctl;
> +
> +		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> +			continue;
> +
> +		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> +		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> +
> +		if (use_fhctl) {
> +			fhctl_base = pllfh->state.base;
> +			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> +		} else {
> +			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> +						    pll);
> +			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> +		}
> +
> +		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> +	}
> +
> +	if (fhctl_base)
> +		iounmap(fhctl_base);
> +
> +	iounmap(base);

When use_fhctl is enabled for all PLLs, base will be NULL.

Brian

> +}
> +
> +
>  int mtk_clk_register_pllfhs(struct device *dev,
>  			    const struct mtk_pll_data *plls, int num_plls,
>  			    struct mtk_pllfh_data *pllfhs, int num_fhs,
> @@ -238,24 +275,7 @@ int mtk_clk_register_pllfhs(struct device *dev,
>  	return 0;
>  
>  err:
> -	while (--i >= 0) {
> -		const struct mtk_pll_data *pll = &plls[i];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl)
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		else
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	iounmap(base);
> -
> +	mtk_clk_cleanup_pllfhs(plls, i, pllfhs, num_fhs, clk_data);
>  	return PTR_ERR(hw);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_register_pllfhs);
> @@ -264,38 +284,9 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
>  			       struct mtk_pllfh_data *pllfhs, int num_fhs,
>  			       struct clk_hw_onecell_data *clk_data)
>  {
> -	void __iomem *base = NULL, *fhctl_base = NULL;
> -	int i;
> -
>  	if (!clk_data)
>  		return;
>  
> -	for (i = num_plls; i > 0; i--) {
> -		const struct mtk_pll_data *pll = &plls[i - 1];
> -		struct mtk_pllfh_data *pllfh;
> -		bool use_fhctl;
> -
> -		if (IS_ERR_OR_NULL(clk_data->hws[pll->id]))
> -			continue;
> -
> -		pllfh = get_pllfh_by_id(pllfhs, num_fhs, pll->id);
> -		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
> -
> -		if (use_fhctl) {
> -			fhctl_base = pllfh->state.base;
> -			mtk_clk_unregister_pllfh(clk_data->hws[pll->id]);
> -		} else {
> -			base = mtk_clk_pll_get_base(clk_data->hws[pll->id],
> -						    pll);
> -			mtk_clk_unregister_pll(clk_data->hws[pll->id]);
> -		}
> -
> -		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
> -	}
> -
> -	if (fhctl_base)
> -		iounmap(fhctl_base);
> -
> -	iounmap(base);
> +	mtk_clk_cleanup_pllfhs(plls, num_plls, pllfhs, num_fhs, clk_data);
>  }
>  EXPORT_SYMBOL_GPL(mtk_clk_unregister_pllfhs);
> 
> ---
> base-commit: b3a87fbe738f19cbe19411cf749f3d8c09c04de4
> change-id: 20260708-clk-mediatek-pllfh-fix-7e9ca35989e2
> 
> Best regards,
> -- 
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 


