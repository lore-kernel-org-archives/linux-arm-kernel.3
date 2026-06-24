Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8F0CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87QgyDoyxAcN2RlRMsIzcXMwRXx5rS1IvXCP9lPgo4A=; b=ztFL4WNPJXQGB+wdm28LwLGEVH
	TIdsofeX8yPwOe6P96bxKPZ9V0d2jy5LrC3Rqdh+0ObMe7W3vr4xA5/0ZxJvQ0zi4V5kjH8sAPPgS
	cEPuLi1ry8caizqwg/H350JZ0+nkI3LhD8gkJDlRPQUGQxw8fPLy1y/O/5SQnZgR7KpNsXns3TG2w
	HYrV4irnI9y3NLfK3y0ESmJuL2PnVH/qTzJgE3ft0bCgKQJuP8jeSjPyX4p5OB++XDWQu9bjWs2ld
	uQaez9S4vaQsrS+VVrgCl8r/s0fD2d17uMooRu4EUXyQ34I95du2o0RJ3vVCOlhDHtdx65c7KJ+NM
	cYksM1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGtb-00000007DQQ-0S3q;
	Wed, 24 Jun 2026 06:15:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGtY-00000007DQ0-1d24
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:15:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c89fa656ea1so217218a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 23:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782281731; x=1782886531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87QgyDoyxAcN2RlRMsIzcXMwRXx5rS1IvXCP9lPgo4A=;
        b=qK1sfmtmZYTLrqF1Ha3CEmkpDF+XtbWQ+UDSG4FzWbz6Cwu+JX/EYTI741xki0Jb2J
         A/xkQ4axUvW2Nu0H3EKeXN/cFXPn/v3uH8BblNKlL6ia8nr5nNFOB60lbJ4W9Fa9vvIc
         z4VPeNLukrl2ewYenE+FnwxaDnm+SHJLaWJyE+mkKcFfCQnuqCr+RVuxlQOA4XYttMH+
         coR2wtuFF4QfNmrO5zfxh3xj3xFxUW25Odr6laL0FSEqwVdqDmJxtcpvrDrcTyVqBRNR
         IDSO7fyCH+wgyjkGWo3ZJT0nNCE9en++RP1BOSG9a3Zl/BGvAG5M8lifm7P+pqZtjDxd
         4HYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782281731; x=1782886531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87QgyDoyxAcN2RlRMsIzcXMwRXx5rS1IvXCP9lPgo4A=;
        b=MBo7eezhm+IpsiPYMiwi/deBs09+hk50UElNd5NSdy4jZ/o9o3teRexYaR5HIaySXc
         BFjI6cswH0618xYd7iQjWsNlQ8YAjaFf2ukimnQJ1nIZDXppRTr9RgNQWs2mk3av3dYG
         /O3t1PFcWSDoBhxrtO1ObAg3nBSX856WGgSUFXqr/9exXKDZTkmy1B+WbMQjzHdstQtV
         rDHqMANlb3QmRDSOf1glf+pSSNPlZ3r37NFBnG4IiCxEJNvrBq9gFEsggpFljEv0g25G
         gmxR9ieAV5sUJWPa5z9NRPQ4P1ka1S6i67rCfBwkMWqzGEApzRKLGoxDzlmDaiqJ8TiF
         qLiA==
X-Forwarded-Encrypted: i=1; AFNElJ9+9+I4oN2uEp1s1RXzJTvLNJB1xvQHv7ErqySnbdT4NxDZDGcJxSaT9UfFjNmLIu1r7U7XP0FPJybv7MrpoZEF@lists.infradead.org
X-Gm-Message-State: AOJu0YynzZzx2iwBpFt7fWUMP/bA6lhvbmEIqkfQi5Gg93zS2g0nTIia
	dWeYkvowooNp+9FoVApLUCoPlya8XJ3ntCFaFJzRe93FrWEhuSLQ208dxELw5j0o0m4=
X-Gm-Gg: AfdE7cmW1iKSVNXXQ441/5ChYdM86njNj2483vMpYexs0H3Q7obu3e4FIOWG8jhqnnE
	gUFMhCxZMYhA5S6ytakxkmOjvK0FciqttapHZGfs7gKMj6Na3n0hazIphozq7ULcCCaW6k2Q9gX
	YQ0aDU+edspMWdqTG6wFAoT1QsJJ7JdfBu5z2Bh+CAY3lEA2+JiAtCgDFI6nzftdAZxcepTwS5A
	NCrmWtZfje6MT3URxNtdc0Oa8XpuAeV7w8SroN57rAq16jsdvAo4Q13zsV9c0sYdxHx1yIjYJ/A
	r+q3H0hji/ju1xwRdFUeAZd17kUVplUaDdEUf669g8mTE2X+ByvTFny5sS1cwfrU73mJ1xkVNj9
	zxD50qsIzK6+qaNtEmiqSLJQ2hAHLyKayR84oYQI06O3fbQuLMkgmAss47UGwp0cU4EJvCkgjrA
	iMejNiwMy3hRea
X-Received: by 2002:a05:6a21:1bc1:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3bc51c683c9mr19446329637.17.1782281730631;
        Tue, 23 Jun 2026 23:15:30 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c131sm13199347a12.18.2026.06.23.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:15:29 -0700 (PDT)
Date: Wed, 24 Jun 2026 11:45:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.semwal@linaro.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Fix OPP table cleanup
Message-ID: <x3lom5jew2w4i7aftjxl4qpgupggw74bsjnzqiu5pjbejztti4@j33hgft6gt3b>
References: <20260624033756.2702021-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624033756.2702021-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_231532_455192_C661F064 
X-CRM114-Status: GOOD (  18.71  )
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

On 24-06-26, 11:37, Haoxiang Li wrote:
> dev_pm_opp_of_add_table() adds the DT OPP table but not all failure
> paths remove it. The driver also uses dev_pm_opp_remove_all_dynamic(),
> which is not the right cleanup helper for OPPs loaded from firmware.
> 
> Remove the DT OPP table with dev_pm_opp_of_remove_table() on init
> failure paths and from apple_soc_cpufreq_exit().
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Please add Fixes and Stable tags.

> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -320,10 +320,10 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
>  out_free_priv:
>  	kfree(priv);
> -out_free_opp:
> -	dev_pm_opp_remove_all_dynamic(cpu_dev);
>  out_iounmap:
>  	iounmap(reg_base);
> +out_remove_opp_table:
> +	dev_pm_opp_of_remove_table(cpu_dev);
>  	return ret;
>  }
>  
> @@ -332,7 +332,7 @@ static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
>  	struct apple_cpu_priv *priv = policy->driver_data;
>  
>  	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
> -	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
> +	dev_pm_opp_of_remove_table(priv->cpu_dev);
>  	iounmap(priv->reg_base);
>  	kfree(priv);

The order of cleanup calls should match in the above two sequences and there are
other missing pieces as well.

I think this would fix it:

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 9396034167e5..150deae8c31d 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -251,21 +251,19 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
                return -ENODEV;
        }

-       ret = dev_pm_opp_of_add_table(cpu_dev);
-       if (ret < 0) {
-               dev_err(cpu_dev, "%s: failed to add OPP table: %d\n", __func__, ret);
-               return ret;
-       }
+       priv = kzalloc_obj(*priv);
+       if (!priv)
+               return -ENOMEM;

        ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
        if (ret) {
                dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
-               return ret;
+               goto out_priv;
        }

-       ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
-       if (ret) {
-               dev_err(cpu_dev, "%s: failed to mark OPPs as shared: %d\n", __func__, ret);
+       ret = dev_pm_opp_of_cpumask_add_table(policy->cpus);
+       if (ret < 0) {
+               dev_err(cpu_dev, "%s: failed to add OPP table: %d\n", __func__, ret);
                goto out_iounmap;
        }

@@ -273,19 +271,13 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
        if (ret <= 0) {
                dev_dbg(cpu_dev, "OPP table is not ready, deferring probe\n");
                ret = -EPROBE_DEFER;
-               goto out_free_opp;
-       }
-
-       priv = kzalloc_obj(*priv);
-       if (!priv) {
-               ret = -ENOMEM;
-               goto out_free_opp;
+               goto out_free_table;
        }

        ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
        if (ret) {
                dev_err(cpu_dev, "failed to init cpufreq table: %d\n", ret);
-               goto out_free_priv;
+               goto out_free_table;
        }

        /* Get OPP levels (p-state indexes) and stash them in driver_data */
@@ -320,12 +312,12 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)

 out_free_cpufreq_table:
        dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
-out_free_priv:
-       kfree(priv);
-out_free_opp:
-       dev_pm_opp_remove_all_dynamic(cpu_dev);
+out_free_table:
+       dev_pm_opp_of_cpumask_remove_table(policy->cpus);
 out_iounmap:
        iounmap(reg_base);
+out_free_priv:
+       kfree(priv);
        return ret;
 }

@@ -334,7 +326,7 @@ static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
        struct apple_cpu_priv *priv = policy->driver_data;

        dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
-       dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
+       dev_pm_opp_of_cpumask_remove_table(policy->cpus);
        iounmap(priv->reg_base);
        kfree(priv);
 }

-- 
viresh

