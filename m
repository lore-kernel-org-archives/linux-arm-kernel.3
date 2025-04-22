Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E432FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=; b=qk9PkX0TVCkqmFbYknJqqMzkpi
	m+IG5JFudj6AvHyE3Jc3yd1cxB+ne/Gb/wlWqpgfcDweEjPLQfm6RVRWIiw90iwvqydhaW1PNLn4n
	+XVnHX9jP+qCmeYBiWbs1/NhUri1fGN2iNZwjTRtByxDhR7N5mfpwKVZij/6JWwTwndFhRgER0xWq
	q3HVICqYt4gQLuG6t0/GHgNr3VECmfbqxWzGUrON4w58U70wCKZRrfukLd2QVsLfyq+MgVACWbYzH
	zMsle9dyujmOYSqb78ygNG3YfJ64blvTo9W0ygTdLVXdEQtUm40vKuoe8g7wPZrmqy8G47WNROeP1
	Vda2nvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G4P-00000007pDj-19Yu;
	Tue, 22 Apr 2025 16:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DlD-00000007JnM-2B40
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 13:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=; b=Azloxeoaan6JgxnEtAQuoCOqhl
	w6rs/lBQlfFFzYYO00rAJHZnhzZOnobmfvK7qKIR3AfPv4LUm/7xTl8bh28LEyZIzu8wqDCrMnPNW
	W7cIC7FbmNIysuOTPACJPD9ZSjNOWN0VXCuv7faqXPc4u/EUQ5KJt7BvofvNyS67eaaoaCx7JiA+z
	wBbeu7cbq+eJLtARG/IECFpc+/BWQ9EkCUbu99ZNXU6RpO7eJvZJK7fpKJfT50emZt3vnuQGsWVXr
	sdEMt9kBFsPte29nu7zpiKfNxTsSMu1MyuR5ZBGDKhsB7rj3LNzCA/HfJc0iW3JSb1/MJdMAe8YKc
	nGzvMhCw==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DlA-0000000BEeP-1cs0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:34:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso7970008a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328836; x=1745933636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=;
        b=q9rknPb/wSDB7xQBVctk6jLDRdnOWfMJqom3o72mnOiMgBVyKCgxrVTmqAxcxB/qBP
         gatj/NOIDH3TrKdZMRZ0GsmStZjbDgQyuab3r7XaIwvuFK9th9HqRnb1gAaARSbtoy5Y
         cWHOSFulsWvb5PBv5PlopUIACuqvnNFZ/v0zRWMrJVtyr1eASAULp1btsbhbNoYVRWHw
         bDlts8QpgvNJf/z/MQuBjBTYdtHoSei0YN7uMVMcbIG4E3bbRtN6VOlSdit4lJP2Ej5O
         eyrSNcZjHci57HMWGiri85d+srJ1UB0HNxgRvD4YhtYG4UyAnv35uTs2M6sKHsvCBcbX
         Dlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328836; x=1745933636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znQWSnBTb9MK20iC93XcIJPZPEInkl0W50tUjysy1uw=;
        b=uu1g8VeTmXyWdwTZ8bW/T7NuhMJ5ovCaXJoQE+iItunDr9ZLAuy7DKHMaVFkDVgflg
         Nsdo5x7DfQjAou8l16fi4nl4AmC+W7h4Et7gny6qULV5Pq3KqS6riqWH5LZ9h5h8KTZL
         UlqVIuzWgNIh3c1ojisIyNYELaSO+hpBZB7X5Un4/HRcJrqD339zUDbHPZLqQV4Q3ifz
         QMT2ahDwY3f0cm4NXpaEBsxGtQNJwXAoye7pKZVgYdcpeezTn/bz3Xe4g046paETxQFi
         EO/Z+gd3mM4xjW0LzXND9JO5iyVCeWw/2isvElA64FTa6Azb0pnARekV0FxyHZ15ggmN
         ZQBg==
X-Forwarded-Encrypted: i=1; AJvYcCXGy2C+an5dnUHdOQ1NM68R0pDTXvajDnVTNnyTQ8452tHGXWxOmyTtQzhSBsYYZ41xaBfJHGLcqhibpOXqrB9x@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJGINWmH3qlw8xf6xsbWFvBINODSzIEBJ0zhy0Tu4lm2XN6wx
	do9Jkl9LePo5MST5ENUJzP8D+Cn2kiO+z5Wp42hehJmeMXlDo+objsVum96OUys=
X-Gm-Gg: ASbGncvJ7fcdSOQzjHofo2LhtdlbHrPU9Xhbxs/fuGGYtR+54AdQ/2uDSqyGIMPcZtR
	ldqKrXvBezD8PGfHLHdPL3J1Bd1EmFOZNVrwoC8qiDKm0gZQHix72IeJlBLIWdO4/EWVdjRuX9Y
	uHvnPDITxrGE+b8FstModOmk1D4vzzHtQTHtXrhsJx4tms05m1K9OCb6o3lz76AjDnQEekHNPkE
	zCfAO10aRz8/CzqL+fZvl1H+KEU20d+nT/uoBIAqD5T1QRaVDJCUBpuUZ0cSG/x2avn2hFsbxHn
	lcoofTkyc/+fu1xDNoOx/0PPiq09QYXp48ViGA==
X-Google-Smtp-Source: AGHT+IE1EtI1OOrrlbCcIfrU7oXR5x9XYZy6CrWuNjgB3jJjWKKJ4o/3rgwpzceFXX9Gk9S9IWierA==
X-Received: by 2002:a05:6402:4404:b0:5f3:f04b:b5d7 with SMTP id 4fb4d7f45d1cf-5f628578024mr14149274a12.18.1745328836222;
        Tue, 22 Apr 2025 06:33:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625a3f7dfsm5892419a12.79.2025.04.22.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:33:55 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:33:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] pmdomain: core: Use genpd->opp_table to simplify
 error/remove path
Message-ID: <aAeawWlODYM2w+xm@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-4-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-4-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_143400_557749_A6C72C67 
X-CRM114-Status: GOOD (  18.34  )
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

On 25-04-17 16:25:01, Ulf Hansson wrote:
> While we add an OF-provider we may, based upon a specific condition, also
> assign genpd->opp_table. Rather using the same specific condition in the
> error/remove path, let's check genpd->opp_table instead as it makes the
> code easier.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 34a85bf347ad..035b65563947 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2343,6 +2343,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>  	genpd->provider = NULL;
>  	genpd->device_id = -ENXIO;
>  	genpd->has_provider = false;
> +	genpd->opp_table = NULL;
>  	genpd->accounting_time = ktime_get_mono_fast_ns();
>  	genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
>  	genpd->domain.ops.runtime_resume = genpd_runtime_resume;
> @@ -2617,7 +2618,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
>  
>  	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
>  	if (ret) {
> -		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
> +		if (genpd->opp_table) {
>  			dev_pm_opp_put_opp_table(genpd->opp_table);
>  			dev_pm_opp_of_remove_table(&genpd->dev);
>  		}
> @@ -2697,7 +2698,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
>  		genpd->provider = NULL;
>  		genpd->has_provider = false;
>  
> -		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
> +		if (genpd->opp_table) {
>  			dev_pm_opp_put_opp_table(genpd->opp_table);
>  			dev_pm_opp_of_remove_table(&genpd->dev);
>  		}
> @@ -2729,11 +2730,10 @@ void of_genpd_del_provider(struct device_node *np)
>  				if (gpd->provider == &np->fwnode) {
>  					gpd->has_provider = false;
>  
> -					if (genpd_is_opp_table_fw(gpd) || !gpd->set_performance_state)
> -						continue;
> -
> -					dev_pm_opp_put_opp_table(gpd->opp_table);
> -					dev_pm_opp_of_remove_table(&gpd->dev);
> +					if (gpd->opp_table) {
> +						dev_pm_opp_put_opp_table(gpd->opp_table);
> +						dev_pm_opp_of_remove_table(&gpd->dev);
> +					}
>  				}
>  			}
>  
> -- 
> 2.43.0
> 

