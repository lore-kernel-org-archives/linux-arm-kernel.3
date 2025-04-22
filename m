Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C011C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzfHkHHg9aFgClvuNUEbYziAa2wcOAWz+w7IrA4na60=; b=GJYwiufOP02oMRRL11VfJghcz7
	nRBXJaKWhSGFAtxNVdmm3PXEkwY0Hf1zAqTthRBA1Y/nS7mLBNVBdix1I3/NBIVTd6h7NppL6ac7k
	tFVJUaQM5PAIvd+efhGwiAyFzyA1UbczZaOFTchfHJyYQi3zMVubeP4QGreX8WR8thTF/4t6tSdcp
	LCS6nhEuarTf6PyslKMkDRa7SFWr0fpt321CbBHXSmdODQF94dPMU19aQDgq/smFeJGTuZYyLZdM2
	5FHUY992gVhX+TDQ//sDXaPqeOew0N+XIIa/B7YrK+NAyTj3k0A62PlFBqvWrMlEzf2pOW5MXzj7+
	6DOt0JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7F5Q-00000007bHg-49qi;
	Tue, 22 Apr 2025 14:59:00 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Df4-00000007IRR-1liC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:27:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac29fd22163so771863766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328461; x=1745933261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzfHkHHg9aFgClvuNUEbYziAa2wcOAWz+w7IrA4na60=;
        b=fph5qss0PDnyBYvraRC+Jc56a1YZscVbwh0oFUkGhzfjs0DhNySdQPXCAtgGpRDXEM
         96guhNWTlQoWzmQWuzuPka3cOWjx1eg1h6UTtTyvFpnn2siTUJxeUIrVCKqIAqWpOzth
         OHJdJr7+LXTELNYPhcQ/JFX9IIIa72CBsH/0UClPi+Ac6Bg5ouVj0+Pz7XOF/tgqxvNy
         ZNnf7l8UbyeFQQnAl9lmk71ZTiay9/cyiHXz4mXabx6b08Gg5CrOtrqYmR/EzK3HRJYp
         EQIOGYOtaIBmVGqRLoMT0E0+7RvWk3T7pEC8Jd1ozG+E88qwJS+Ai/kHQo4oqqqAnTlq
         r9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328461; x=1745933261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzfHkHHg9aFgClvuNUEbYziAa2wcOAWz+w7IrA4na60=;
        b=WS45BToOjEmtllRzhJGGFJsY9Nq6UYw0edN5fiigxuUtcH2I4O0SvU2KUFLDVc5BSK
         QuHpiglA+glmlFVXXWbhp/mV3aoEZkpcpnIW3/zMyQ5UN2F+ACK3ni/ppzUUv8us8r98
         ec6gqgj7apDvZy5DabBSHxJklESgHqHlq7HsuDI5wHIWgSCBlVENgvGezFBQRQCx57D3
         83DGXiLrhf0c06Xr19zyCRgYZxn0oUjHBemoNY8qtlgHVn7k04X6fswvA36Wochdpm4H
         HO2ukq5hIC2Goyh1lrXtBLUIXDzqFUZIVHw1brbBWkFlS2yKvSv+wsIhZpKlm0N4uVbn
         pakA==
X-Forwarded-Encrypted: i=1; AJvYcCVkMlRQowK7lf4spPgALiNLcnkkvAdxwcZZal4l96nzpE6DTEVe27ASVs38eh/HTvnbeNVbfreXTXV24x6PzvS9@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4V3hEn75LWHon/ofu7QYUpk7S3rNzXdiBVima0JKicTj5kUJ
	7h/YE0HrB62hRww+HlKbmH2pyLCpnK0kNjzDRxHYK9+7ZCjX8DLPu3lzI2rofrk=
X-Gm-Gg: ASbGncsP3eBWAi+3uWKYKC6MzxvldGhcu6AK+1B3l1uZxDi+hGf45jPnSkYteg5QkPv
	VwgPRG/rE5aIA8cCC7AczGNXHCGFDTilfvb3DGW4qQAKqP27uqea73wNdsuIYYTD4A6AF1qD/8j
	Ii7rEjax+UzackdlQwbqG+ZQAOSFfdHOAH0uiLzB5ttkUHofPkYoE/YJsomT3N0bF0GgIdDuuqr
	vbZJ3pipIOVW+oKE0OCS7jSLChVBtn01awVjE6f8E/36qw1Et0rOdJr9gS9D/PMT3OHc3z8FaX1
	ght9kekLxh3RP2VQMC5EriCWjo5YuB8Plgertg==
X-Google-Smtp-Source: AGHT+IGPMYljpeD4pnIPV4e6hdEW1ZBRPTLVTE817N1JQkweURcQG3ISuVkVno8eIM9O75BdqoVnPg==
X-Received: by 2002:a17:906:15d4:b0:ace:3105:afcd with SMTP id a640c23a62f3a-ace3105b6damr170970066b.4.1745328460550;
        Tue, 22 Apr 2025 06:27:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec50607sm657364666b.71.2025.04.22.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:27:39 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:27:38 +0300
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
Subject: Re: [PATCH 01/11] pmdomain: core: Convert genpd_power_off() to void
Message-ID: <aAeZSmRtVyxEzqvC@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-2-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-2-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062742_469252_4D631325 
X-CRM114-Status: GOOD (  26.18  )
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

On 25-04-17 16:24:59, Ulf Hansson wrote:
> At some point it made sense to have genpd_power_off() to return an error
> code. That hasn't been the case for quite some time, so let's convert it
> into a static void function and simplify some of the corresponding code.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 3523d0331cec..574a0de1696a 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -908,13 +908,12 @@ static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
>   * If all of the @genpd's devices have been suspended and all of its subdomains
>   * have been powered down, remove power from @genpd.
>   */
> -static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
> -			   unsigned int depth)
> +static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
> +			    unsigned int depth)
>  {
>  	struct pm_domain_data *pdd;
>  	struct gpd_link *link;
>  	unsigned int not_suspended = 0;
> -	int ret;
>  
>  	/*
>  	 * Do not try to power off the domain in the following situations:
> @@ -922,7 +921,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	 * (2) System suspend is in progress.
>  	 */
>  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * Abort power off for the PM domain in the following situations:
> @@ -932,7 +931,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	if (genpd_is_always_on(genpd) ||
>  			genpd_is_rpm_always_on(genpd) ||
>  			atomic_read(&genpd->sd_count) > 0)
> -		return -EBUSY;
> +		return;
>  
>  	/*
>  	 * The children must be in their deepest (powered-off) states to allow
> @@ -943,7 +942,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
>  		struct generic_pm_domain *child = link->child;
>  		if (child->state_idx < child->state_count - 1)
> -			return -EBUSY;
> +			return;
>  	}
>  
>  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
> @@ -957,15 +956,15 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  		/* The device may need its PM domain to stay powered on. */
>  		if (to_gpd_data(pdd)->rpm_always_on)
> -			return -EBUSY;
> +			return;
>  	}
>  
>  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
> -		return -EBUSY;
> +		return;
>  
>  	if (genpd->gov && genpd->gov->power_down_ok) {
>  		if (!genpd->gov->power_down_ok(&genpd->domain))
> -			return -EAGAIN;
> +			return;
>  	}
>  
>  	/* Default to shallowest state. */
> @@ -974,12 +973,11 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  	/* Don't power off, if a child domain is waiting to power on. */
>  	if (atomic_read(&genpd->sd_count) > 0)
> -		return -EBUSY;
> +		return;
>  
> -	ret = _genpd_power_off(genpd, true);
> -	if (ret) {
> +	if (_genpd_power_off(genpd, true)) {
>  		genpd->states[genpd->state_idx].rejected++;
> -		return ret;
> +		return;
>  	}
>  
>  	genpd->status = GENPD_STATE_OFF;
> @@ -992,8 +990,6 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  		genpd_power_off(link->parent, false, depth + 1);
>  		genpd_unlock(link->parent);
>  	}
> -
> -	return 0;
>  }
>  
>  /**
> -- 
> 2.43.0
> 

