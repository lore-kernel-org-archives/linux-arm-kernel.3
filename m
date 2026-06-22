Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urde0H5lw+l0w07oCZ5gmtixK9Wy1aHPm4CdpLxWffg=; b=2HVufoeNJpp+KDL889PkA1ks3f
	9rLsSkDKfLaRONyuJIbR44olCykCLHpCiRy/AeedzJwh54tQK5U4o9cCypZasCzFAaN/wVcSZlqYu
	qae20+9Pnt2GLe1Kg+ezgNmCw8VMHelFGWJ6bsbulRXQMAUKdiLySCTi2sD2NblUQCMDO08RExvZM
	87Pb1e7DM+TQDk62L1tQK6fwZ265iM4qBNSGvz9o5m1VV4do3C4UheVol8kUezyP+C5MtAN6/csAk
	XAjUEVaudR+MpahOlnX2cPAhFWgzYcU6MFSlY5O5h6SSDvE7gWZFaiadIdJEDZAP4gWIEf5QgA1Bp
	4VsN4ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZyX-00000004fR8-2826;
	Mon, 22 Jun 2026 08:25:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZyV-00000004fQY-0oYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:25:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2730075a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782116746; x=1782721546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=urde0H5lw+l0w07oCZ5gmtixK9Wy1aHPm4CdpLxWffg=;
        b=kTGQRxOa7WyT+4P7ZB91fvklF9dUtZeGdgXnPEfn8Gwp1TK5IauA0Dp0HX4t4WqLAt
         uITlfrqW0vQ32gZUVXwJRAX+dDM7szzRMLXZ/vBQWr0PudB0FnH8lS3/R0ApuRERP/Xq
         clqBcUt56fG1kKU8A8g/nPRuQXyYhpJRj1TS+cbw5CFH4tnhbmpXRTIGzxVfVrJbjTT7
         RwVZZU+wuILEiyqQJHzGpeAcHS6NwjuMOxFKwlD4Gdv6qJtXrhg5bt2gGe2QngueDBE0
         KnvZ4lctR4MWRHUD9Qp+dDwwkKVQpDUJ0tSf4hXzaJZLIPzs4B4VqJ11C4tEokIGY4KI
         y/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116746; x=1782721546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urde0H5lw+l0w07oCZ5gmtixK9Wy1aHPm4CdpLxWffg=;
        b=MqxNAgBm4qR3Bu8QmN+95Rem8hm9ytNUrFS3hqOjcjdNW/hmY9q4FInC8DE8Qxih4H
         FELjOv58t7ig2SD3z+pEG9ZvEMWdOWEPTH/Rts4MoSd1LtWJFc2Q+DBuymE19ZjHE+gg
         PzceKFxL0xSpUQhtydxnJBYxMyDGsgh4tmKkGkx9gxzqQ/yXk/V22Dz/6pghFrR23zgV
         NkF4c2GrKd74RiJ1QMyjF2aQNQIgEIk/iDumLLZ99iMs3qAdhnVUpNmwPrskqWuaShds
         ffM80ewFE+QGt7mzSpvv6FmjDA5knISejr7jbAuB8LBIgO+K+KBMeOsoQsyZy5L5Qs8W
         kQbw==
X-Forwarded-Encrypted: i=1; AHgh+Rpk2bpSFetYBQteXpe9nqgmMZjWXJttZGc1XMc74CmWyOOFWAq8GiJpFbGjp+Y1XgJIS+7S8CHKUcesgJnbF7nQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyvAHgUJK0O40fTtWaJb+T/wUlPtSCRFyvn6odkX34Go1/WeWW4
	rnh3DDA/tzaM4tF/3raFgqL9jel4ZF1rc9q8aOSSJGgeg8Bjrj2QX5BE5PmPdKl1yJ3T27u5iQm
	y4GpA
X-Gm-Gg: AfdE7cmQsQfce7dvKT50AN0mYlGKI+uY9hePi+J/iL+8lBgth1KAaISXJ9vegiAPC5b
	qrQ3Ah+A/dSsnJOYsTzrMRXmM0BCi5NCQGXQh5vkBtPDeOSXCmQKAn6ZmiiVt7i0JlhhNP/3Ezk
	fLD/lzojU42qJhikl/hwfErenLrzgVNE/i63z/MDkSSwu8tq1WKvfM/C6wihI/uZr8D8p80tJLh
	XGfyDtDY05req1fPnnJoiA8AXvP1YLMeavz91q35wRlCX+JN4ozwuRXuHnOeZ6oN2DGs+z3YIPv
	sRL2BSju7CkEgn0PeOvNVYSJgJntRjg6GhGn5T0Cp6DSDcSo1ygPYM7HFAk/8r/UlaImwEEIVr2
	pGSEcs1C+NVp5b9jDVBUjKz0Ae0ESYWzXYQ6xepYQqbiBFP8l2QpljhrCou9UlTtlEfPSWenOwz
	DzUNt+qpNWS+Gb9r01VLoUsdA=
X-Received: by 2002:a17:90b:3d47:b0:37c:18e0:90e4 with SMTP id 98e67ed59e1d1-37d4d71da02mr9453775a91.2.1782116745540;
        Mon, 22 Jun 2026 01:25:45 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af310sm71822885ad.2.2026.06.22.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:25:44 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:55:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Add missing OPP table cleanup on
 init failure
Message-ID: <p4gog5paa5czqzho6i4chgsncyjxsfau5zu3lkxwtkplk2y2f5@l3sa7gohfnqw>
References: <20260622063148.751787-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622063148.751787-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_012547_256751_B1852C64 
X-CRM114-Status: GOOD (  19.50  )
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

On 22-06-26, 14:31, Haoxiang Li wrote:
> apple_soc_cpufreq_init() adds the OPP table with
> dev_pm_opp_of_add_table(), but some later error
> paths can return without removing it.
> 
> Add the missing dev_pm_opp_of_remove_table() call
> to clean up the OPP table on init failure.
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 9396034167e5..4dae968e84df 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -260,7 +260,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
>  	if (ret) {
>  		dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
> -		return ret;
> +		goto out_remove_table;
>  	}
>  
>  	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
> @@ -326,6 +326,8 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	dev_pm_opp_remove_all_dynamic(cpu_dev);

This driver doesn't add any dynamic (non DT) OPPs, looks like this is incorrect
?

>  out_iounmap:
>  	iounmap(reg_base);
> +out_remove_table:
> +	dev_pm_opp_of_remove_table(cpu_dev);

This is also required to be done in apple_soc_cpufreq_exit() ?

>  	return ret;
>  }

-- 
viresh

