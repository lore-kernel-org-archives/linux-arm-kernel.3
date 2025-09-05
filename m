Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62118CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDKXrL0Sd+jc7yUVi0cwM9FBHGodTSjdC989v4akiH0=; b=xjNnvmEp+U5ETYKxYjVia2SsPS
	+sZOUlFCi6RTa6ee3Nk93sIRPpAqgOdrpEz4M8xXYtEGld3EEqiiCRyC0N9ZCY/W6Qun6duyO/pbV
	i/BIR5wRZNpI5GP7vuPbYGBjNizNq27/DbtbNBL2xOTJZ1jH9Stx0hDdQ/Q/NQTENlS0aOgbQIZLA
	U5z8wSBNSGoEIo1LHbHCqGT/whtBwNys4gQkLQXRJh+1Zxu8miRzGjYIfHIjNaL1HI2NsDkBgNsQK
	V0mwP+8ypOYNYy8qHtSEJAGybjS5MgUT1b5I1kjkRDXPW+OOfdEwuMXlzwvcILAtF3N534aJXYkJ5
	qvoEVDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWk-00000002MSp-0F05;
	Fri, 05 Sep 2025 14:34:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTGF-00000000udd-2ogl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:01:41 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBg91Jm0z6JBRj;
	Fri,  5 Sep 2025 18:00:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8815E140145;
	Fri,  5 Sep 2025 18:01:35 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 12:01:33 +0200
Date: Fri, 5 Sep 2025 11:01:32 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
CC: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham
	<myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, "Jani Nikula"
	<jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, Eduardo
 Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan
	<ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui
	<rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba
	<lukasz.luba@arm.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
	<festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, "Sumit Gupta"
	<sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
	<linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/10] PM / devfreq: Use scope-based cleanup helper
Message-ID: <20250905110132.00003987@huawei.com>
In-Reply-To: <20250903131733.57637-6-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-6-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_030140_002758_62BED297 
X-CRM114-Status: GOOD (  24.61  )
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

On Wed,  3 Sep 2025 21:17:28 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>

This falls into the mess of mixing gotos with cleanup.h usage.

The guidance in cleanup.h IIRC say don't do this.  It isn't (I think) buggy here
but it does make things harder to reason about and generally removes
the point of doing __free.  So I think if you are going to do this one
you need to do it fully which is a little more complex.
Need to deal with parent_cpu_data which isn't that hard.

If you mix the two, Linus may get grumpy!

> ---
>  drivers/devfreq/governor_passive.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index 953cf9a1e9f7..a035cf44bdb8 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c

> @@ -256,7 +253,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  	struct device *dev = devfreq->dev.parent;
>  	struct opp_table *opp_table = NULL;
>  	struct devfreq_cpu_data *parent_cpu_data;
> -	struct cpufreq_policy *policy;
>  	struct device *cpu_dev;
>  	unsigned int cpu;
>  	int ret;
> @@ -273,23 +269,23 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  	}
>  
>  	for_each_possible_cpu(cpu) {
> -		policy = cpufreq_cpu_get(cpu);
> +		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
> +
>  		if (!policy) {
>  			ret = -EPROBE_DEFER;
>  			goto err;
Return directly here (and after changes below, in all error paths.
>  		}
>  
>  		parent_cpu_data = get_parent_cpu_data(p_data, policy);
> -		if (parent_cpu_data) {
> -			cpufreq_cpu_put(policy);
> +		if (parent_cpu_data)
>  			continue;
This is the first use of parent_cpu_data. If it's set at this point
we don't use it at all.  So step 1. Rename this to split this
use from the one that follows.


> -		}
>  
>  		parent_cpu_data = kzalloc(sizeof(*parent_cpu_data),
>  						GFP_KERNEL);
This one needs to be
		struct devfreq_cpu_data *parent_cpu_data __free(kfree) =
			kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);

		
>  		if (!parent_cpu_data) {
>  			ret = -ENOMEM;
> -			goto err_put_policy;
> +			goto err;
>  		}
>  
>  		cpu_dev = get_cpu_device(cpu);
> @@ -314,7 +310,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  		parent_cpu_data->max_freq = policy->cpuinfo.max_freq;
>  
>  		list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_list);

then here we need to ensure we don't free parent_cpu_data. Hence

		list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
			      &p_data->cpu_data_list);

That that point we have passed ownership of the data to the list.

> -		cpufreq_cpu_put(policy);
>  	}
>  
>  	mutex_lock(&devfreq->lock);
> @@ -327,8 +322,6 @@ static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
>  
>  err_free_cpu_data:
>  	kfree(parent_cpu_data);
And all this error block goes away.

> -err_put_policy:
> -	cpufreq_cpu_put(policy);
>  err:
>  
>  	return ret;


