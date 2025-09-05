Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMhp8J72yITKfzOtPi4DB3UD3FJrfEyrpQ4ZI8FSlps=; b=GTkUyoEmXGCHMLSmKc92600/ym
	x9c8ijPYwRwmhfle7W4puFr6wgpLT3EFTltGCn3ek9OrqyLe68iLJSerbh2IuiHTFDxbPvqJKLq2m
	FayhZJQNA7AlkO6WGB2c4NlutKvSPq4ZgGUqBlnrwby65vZMKocIDiTXBJgVoS6OWWq6wMEtRrd7V
	+I1rOq5LC0Rt2lHOfqVIyGcOl7jk96+xzbNOXxTCzXCAmAzJmMpULNzTxVWP2i8ABBobvo9ha2hyk
	l2Exa8O9cM/feS1o5ETtDhMtXZWUUhoPRU2uS6Dk++SV3H8mGcEJ2TRQBA+ahDbs7TBMGXEG4j31u
	9EAWsJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRam-00000000HND-39gy;
	Fri, 05 Sep 2025 08:14:44 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQOZ-0000000HQbR-3YOD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UMhp8J72yITKfzOtPi4DB3UD3FJrfEyrpQ4ZI8FSlps=; b=3H9p/Vkvxt4XbLhqCSP9aF+To1
	PztEyON86OQi9PDNd1ceEUJxtwdxP8kfhfwhJsFQCpc05baWPVxWZGjg7opX2gYK2WIvJOe9zaGxI
	t1GjVNq312NK5FM6wxYvOK7xHeRcBlZ7DvQNdzrNE74gtjS6ycrbgz9Gz3oDC2fnJm/+BYHCrYZqe
	z3F+cmE+jwq5XWgZ+duo5Zpgb84hlUrrT5p8vOy3tqh9xZzhopHfUHuZpO6PnjBzxRCn0X20BnYgc
	3sDAk1C2TxIs6tj7Oexhrej49YHa7H2oqGuA9FmUUbjg3rqCJrtaGj5ZEtOjhNwA5eJUszaVWNk4z
	U2CnHU+A==;
Date: Fri, 5 Sep 2025 08:57:26 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Keerthy
 <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, zhenglifeng
 <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown
 <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit
 Gupta <sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang
 <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/10] thermal/drivers/ti-soc-thermal: Use
 scope-based cleanup helper
Message-ID: <20250905085726.2bc6fcb4@akair>
In-Reply-To: <20250903131733.57637-10-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-10-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235803_890093_501C6DD1 
X-CRM114-Status: GOOD (  21.93  )
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

Am Wed,  3 Sep 2025 21:17:32 +0800
schrieb Zihuan Zhang <zhangzihuan@kylinos.cn>:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 0cf0826b805a..37d06468913a 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -27,7 +27,6 @@
>  
>  /* common data structures */
>  struct ti_thermal_data {
> -	struct cpufreq_policy *policy;
>  	struct thermal_zone_device *ti_thermal;
>  	struct thermal_zone_device *pcb_tz;
>  	struct thermal_cooling_device *cool_dev;
> @@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  {
>  	struct ti_thermal_data *data;
>  	struct device_node *np = bgp->dev->of_node;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>  
this looks as it changes the lifecycle from the device lifetime to just
this function...

>  	/*
>  	 * We are assuming here that if one deploys the zone
> @@ -234,19 +234,17 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  	if (!data)
>  		return -EINVAL;
>  
> -	data->policy = cpufreq_cpu_get(0);
> -	if (!data->policy) {
> +	if (!policy) {
>  		pr_debug("%s: CPUFreq policy not found\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
>  	/* Register cooling device */
> -	data->cool_dev = cpufreq_cooling_register(data->policy);
> +	data->cool_dev = cpufreq_cooling_register(policy);

and it is passed on to something living beyond this function. I see no
_get(policy) in cpufreq_cooling_register().
Am I missing something?

Regards,
Andreas

