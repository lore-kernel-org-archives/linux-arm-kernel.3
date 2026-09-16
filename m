Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453C8C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=; b=v+x597GrtvX9BD5DKs2jEF3kTT
	2GT2UoYjIYgPNqbez7ENmX4Tzd5EzYc+5A6n0KQYOodz8Gms2wNotw4iZ4ju7btxpYNYwn2U24f9s
	PjMF+6hYamyD1eIJcKyCHQsgObfka5I/RZbz2qIrorUtFIEEO2cXNr0yDfOejfTCG8q8B8stBGMWj
	Cc4VR9YZJZ8jeoRZqsjEfy6Bqu1Ssl+GvQQJ0fe9fh6vuGwRAufYZZAZVFXQ+pbjRaewhCHE6GeQj
	4BpCDg0z++vE7XN/LAvu4oAmL7veOb8+cziuFA89nW2Q8GPPdgXF1ZZj9qRAUvi9Gk2NdfhIDqQQE
	ep53MY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ss7-00000009nUi-1xRa;
	Wed, 16 Sep 2026 16:52:35 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ss3-00000009nTf-2NKV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:52:34 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fb334ddcso9982815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577550; x=1790182350; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=gXxmY33Pia7ISriEtTdc6qghQP0MV8FTCq9Z9yCPZpyuXaIRoYUClkSyE4zjk57LFm
         7a3sPgJnaDH7TyQRG+hxGIYLmnlpOmU1OoQvn61XH+vwWL79ENXu3Vwz+bRLVZQ4cZ8X
         i/GpyOUr6MGiXVbz4xgP/qdbTnsgGyysKL+m+nMtHulRdqjfM3MwSysVDjRMCkjgzvtI
         g0zj/Iuhk/oIq+Y8V7siXVtmT+0nLo9iH9/Rx/9owntp+XibkMBU3hlSW50nfpjXTTJt
         pbjR8OwkyxShLODP80f6FyN73PTmVrmlTFVouARmR7CgDkRSibiIMI+ggcz130RC5ihA
         29vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577550; x=1790182350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1jCbTheaiSUBkfYGV3xzwMyY5fdH2jCKLwykFGBBIE=;
        b=jhw5q+dEnmor47vJGXV57gaMOTy2yHkXsBdv94n04dkNVNflYG1TxP4zf94kWC51NU
         iJIJCXseS1AN5i8/+13DI2PvWYBL+SXSY2oi8d0oKjNnVJhJfV0OprW7nv16lD1ZAUKD
         FPZElGLHgs1i5JAwOx1kC5L0B58Qxdfd2+Bs+Bw1nXTFBDQRVwg9A8CKbqaJm8s2hgyM
         j5xsmnTrIlKtqCbaYkrZRuP8XtNdUWqEw13XpFuID/4aZQgHWediVaQiFGZXl52RiruS
         WMCGJmBJOAkxq+gGFVDE0Lxa1iyg87uz2qMmA9WgD5b//usfVozhIZ+L5c5MaLCQbZBp
         NTfA==
X-Forwarded-Encrypted: i=1; AKwUvBy0hAyaw7Y6xasUhaU6vqXo+8SyruKcJGPKpyEQlM6k193SCbMnF16LjaNvATZrWuXfmwzKCnlx2vpT7NtA2NhS@lists.infradead.org
X-Gm-Message-State: AFuF++nIadk9reSRkVumtjcCT3faAs8bZcP9CEIHFyYRwEITpkPuyS6x
	Ww2VpoywGQawxyuMQTjyIhIjTU7v574LDopgcc7o6Z3/c2qosysT3LvU
X-Gm-Gg: AYBFou2M6D5oYW9b+PYjvuB4ZEkipNnMkzyU2ofpYxCMjHJ2NjNuT9e14DQh7xAML4I
	3WQnr+q/nJAJ0zPNsChpmeMT+ZUtiIUUvDNxRGKTIg6DkHPtO1amMhOnU3uoxVqv6i2i5gEs1Lu
	4Vb6Llzj7W6dRaGtuUNQ6n9pVngkliMt+6IYemtPkQwJpdybacwmuYLRsGXnJ3zUND0g9T9KD10
	cJkWJmJqjCQfVli1dXDAGAGNElUBuDlVw9Lb+DkbWp2niQtUoJy+ckgXbT+BPr2ncDICTetzwM3
	c10c8TtH7dEhXV20inKQLa96MajAQLvbqlc/mcsu5C7cb59BmtsWgDxNpY4r6w/8SAAkStzboK+
	NinoKmRrujp8wdIRa2Y17i1b7+B7QrmAgJPSws6NBoCqPEY+E0dIPfJqQIz6NqfgiCza9Ky39mA
	v3AiR73DE7sV9rgphILPY5Rqhim4OIHieRbQM2Rw0p8BZP0Ow1Z5SRv/D9DZxIUR0XdbV+i9iTr
	l5a0OWmvm+iXyR5wiZbJa7lMqzmQEOiGPLGXQ5UFPU+NdTjAg==
X-Received: by 2002:a17:902:c40d:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd8e6368a5mr67941175ad.18.1789577549942;
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd90c7b215sm12866435ad.72.2026.09.16.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:52:29 -0700 (PDT)
Message-ID: <ce80af4b-5d4d-4fdd-a4ca-3c361c542eeb@gmail.com>
Date: Wed, 16 Sep 2026 22:22:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] cpuidle: psci: Initialize the PM domains in
 powered off state for OSI
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_095231_611563_4511E4FD 
X-CRM114-Status: GOOD (  27.93  )
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

On 14-09-2026 20:31, Ulf Hansson wrote:
> At the point when the PM domain and the topology are registered through the
> genpd subsystem, it's not really known whether corresponding CPUs are
> online and thus if the PM domain should be initialized as powered on or
> not. Instead this information becomes available when the CPU devices gets
> attached to their respective PM domain through dt_idle_attach_cpu().
> 
> This is a problem when using PSCI OS-initiated mode, as we may end up with
> a PM domain that has the genpd's status indicating it to be powered on,
> while it in fact may not be the case. In the less severe scenario, this
> leads to selecting a shallower domain idle state for the PM domain than
> necessary. A more critical problem is when a non-CPU device shares the PM
> domain, leading to their corresponding drivers not being able to trust the
> status of it.
> 
> Let's fix these problems by initializing the state for the genpd's to be
> powered off and in the deepest possible domain idle state, when using
> OS-initiated mode. The support for ->sync_state() is maintained by setting
> the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.
> 
> Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---
> 
> Changes in v4:
> 	- Drop GENPD_FLAG_RPM_ALWAYS_ON.

Thanks, Looks good.
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> Changes in v3:
> 	- None.
> Changes in v2:
> 	- Fix a bug in the call to pm_genpd_init().
> 
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3..5722365b943e 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -68,9 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	 */
>  	if (use_osi) {
>  		pd->power_off = psci_pd_power_off;
> -		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> -		if (IS_ENABLED(CONFIG_PREEMPT_RT))
> -			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
> +		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
> +		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
>  	} else {
>  		pd->flags |= GENPD_FLAG_ALWAYS_ON;
>  	}
> @@ -78,7 +77,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>  	/* Use governor for CPU PM domains if it has some states to manage. */
>  	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
>  
> -	ret = pm_genpd_init(pd, pd_gov, false);
> +	ret = pm_genpd_init(pd, pd_gov, use_osi);
>  	if (ret)
>  		goto free_pd_prov;
>  


