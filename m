Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF62C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJrR2JxkMMZwCpTNb/tpAEcXKA5Fk1cxT8LzYQjHkvI=; b=AlCqKvQdRWsbmNZxIInIwXvoKK
	vPQlr8i1MN+Mb56jmsH1wIvthA0ONVClWieTT5JBDF5rL8OEFvLACv5ofDdn+8I4tYEHDgudFtqOO
	EZgEvRZXB4XtFO1YkKTjR34AkQREQtsh85vUXnuoHjxrfPn0d7Hx0JQ8eDFdf76YGUvlHPB5OOCWO
	Ye5/HgQSTe067ra7VyL6FaA1HMec3Bc52Du7t1WZfVSG1PcnPvEZZdya1wM0D2v+g6kpea7M3zyED
	5pZF4YqcCwGO1plXqZa9hob7nMnE0nALHqA621j3rQ9Oy0LQjT87+GSTLJAYHzeNdBSiukZmkcJG0
	dx8ZyCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7F7H-00000007bmO-22bC;
	Tue, 22 Apr 2025 15:00:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dg4-00000007IdF-3qeA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:28:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ace333d5f7bso70158066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745328523; x=1745933323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJrR2JxkMMZwCpTNb/tpAEcXKA5Fk1cxT8LzYQjHkvI=;
        b=VwV1IjeAp0erUPXsS0spNwIL/c0C+MYMi4rn7D+tv2y2ZTolj1qf0rP10DWU9W7O6f
         uU/RaMEpNQELZwATdQ327zaRPEodQ4A+b/5FdCwxZQHrK6LvBUF7vBOqArmu1fMaQVyY
         /nmO9BFI9B8i5rv/d0s8ld1bxfkdEpsas7X+p5cy0c7vgOM0ZqWt2d3ceGptkGSBNZSW
         DSHukSpyL3h0khPFs0I9pkQD5rppMlhalWzlp54ra7+Y9QH4uldpmTUf3zBSmR014f8O
         JqN8HrSzw6ivROF3MJGoSJCvB9wAJAy5cX3akqgD3xIAve8ISkGIEpMwD8gl6v9mD7l2
         XB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328523; x=1745933323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJrR2JxkMMZwCpTNb/tpAEcXKA5Fk1cxT8LzYQjHkvI=;
        b=qDe4zc6oRvuVpHqJ6FosgiPo2VSFuv0WwIIQGy8+eurJnwhFNpBEKzhZdMY54OMkJs
         25eqgV9tpGi82Poy2LSP/wfclOpEtvdWAXCS2EuXTlbBx7IF3bbCgwSFnQWdHmsXJ7TP
         2/G87bhmotB0tGzm74xqeMzwbk/iVnlkE0EjiW6h540LMrvhTbOsyYIb7jmO8uIPPNHt
         zIg/LI2wP84n91FiUmyHzoKHMhyBO6IPF2z5X7gcfInKaWsPUi7g11MSwGa+yygRrRs6
         m2HXIWoG8Fb+zAHrSpBy49fkEXNKyhXl9dQi4MM1zC4yNcZhUG3LutxkTTlol8M66Opr
         vg4A==
X-Forwarded-Encrypted: i=1; AJvYcCU2UeaG3UcLe8i2JvCohmDI/sZdc9JUg85JS5Q/erTG/b6lH2szDhS2hSdc3jGqFO2+OhGPA4DIGlkPgYKvfJx4@lists.infradead.org
X-Gm-Message-State: AOJu0YzZjcVKaFbCixDxbQnQZbzQTkoF+OCE7Scc7EF1rO50tu+MTLgY
	mYFP292UIHlO/AACPrxEeKjffVMM1379y2dcFIj3wS86Y+RbcnuGWM4JQCPwAT4=
X-Gm-Gg: ASbGncv/b+aVJEbeVqOcwApB2X0La7/UFAG3X5yIbK1JuLlDsIJHiwszY6Qyi4FTKGc
	ljTTlzqFpIs1vsc8WG6fTs/5aVnZPrQANR4cipMeVXc3MWVHKRIjEL3jg12JPXimTZAFSMKiCOj
	4cgP4eOlHRv/iF4RCGF0GqQy0PHN99WG5lcmIr1TTPxnBNtkI5w3LRLeLXplsh4fzWgI40O3Qdb
	19ghX6v+UG6U8hiWJDvjdDjIJ64Et824R3Za9DPhlF+/alnN/YkHuAKGDrUjKpenV+jegcHiVWg
	qWBWUCS7fIeXAEMFxdG9uDo5qVshFpMHwgXaNA==
X-Google-Smtp-Source: AGHT+IGBZS9qAdq9W3YkRDXdH/Hs9bjK7HcuVeE81Ft+GPykI97oKk1Nc4VkNoyA40tEDn0sMITw8A==
X-Received: by 2002:a17:907:da3:b0:ac4:76d:6d2c with SMTP id a640c23a62f3a-acb74dba1e2mr1407490766b.40.1745328523115;
        Tue, 22 Apr 2025 06:28:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace3175d95esm78875166b.173.2025.04.22.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:28:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:28:40 +0300
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
Subject: Re: [PATCH 02/11] pmdomain: core: Simplify return statement in
 genpd_power_off()
Message-ID: <aAeZiIE9URMmf3JE@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-3-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-3-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062844_964936_2875B510 
X-CRM114-Status: GOOD (  20.22  )
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

On 25-04-17 16:25:00, Ulf Hansson wrote:
> Rather than using two if-clauses immediately after each to check for
> similar reasons to prevent the power-off, let's combine them into one
> if-clause to simplify the code.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pmdomain/core.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 574a0de1696a..34a85bf347ad 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -917,20 +917,14 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  
>  	/*
>  	 * Do not try to power off the domain in the following situations:
> -	 * (1) The domain is already in the "power off" state.
> -	 * (2) System suspend is in progress.
> +	 * The domain is already in the "power off" state.
> +	 * System suspend is in progress.
> +	 * The domain is configured as always on.
> +	 * The domain has a subdomain being powered on.
>  	 */
> -	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
> -		return;
> -
> -	/*
> -	 * Abort power off for the PM domain in the following situations:
> -	 * (1) The domain is configured as always on.
> -	 * (2) When the domain has a subdomain being powered on.
> -	 */
> -	if (genpd_is_always_on(genpd) ||
> -			genpd_is_rpm_always_on(genpd) ||
> -			atomic_read(&genpd->sd_count) > 0)
> +	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
> +	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> +	    atomic_read(&genpd->sd_count) > 0)
>  		return;
>  
>  	/*
> -- 
> 2.43.0
> 

