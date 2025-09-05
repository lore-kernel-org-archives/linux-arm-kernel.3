Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15BACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZRjwvYd2kR1+eHnoX/XoTY11O6bDfzKSNBqHcg6KTI=; b=f5Ma8yA32fEYC2rbUvyg9f6q1W
	vyum1tO8SNNw0hMDlkgcMvXEw+5EDMgts01HkNkRGAcwsETavIkeDegnQV8OYTTdAjFQFhwjJV8Vz
	Cv/yI2K/XEUINJhTsfwdNkLbAgdLdv9PLq6kvLKw2/dVCtfokNOgvv0/Vp/q5gQviJ4A8l9wBIXR/
	mTivbkIIm9CXlHd8zx4QYPB/H7kv1priImpXAde5qJdhjA6i7XvE4HwTZrOfDXyiPyQjfSzCqebQj
	jR7i6hPHaCIz2A/GGG7EctjawqWFQc6u/2YaDekwctZkKjSxIuQfj/V9C4z0XOUB8cmJkoQSfAP2B
	CDUZbW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWx-00000002Mm7-2lFJ;
	Fri, 05 Sep 2025 14:35:11 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTKW-00000000w96-24uy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 10:06:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBhn0xyXz6L5ly;
	Fri,  5 Sep 2025 18:02:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 03F6A1402CB;
	Fri,  5 Sep 2025 18:05:55 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 12:05:53 +0200
Date: Fri, 5 Sep 2025 11:05:51 +0100
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
Subject: Re: [PATCH v4 08/10] thermal: imx: Use scope-based cleanup helper
Message-ID: <20250905110551.00006588@huawei.com>
In-Reply-To: <20250903131733.57637-9-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
	<20250903131733.57637-9-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_030604_826327_76C60174 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed,  3 Sep 2025 21:17:31 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>

This radically changes the lifetime of the reference to policy.
If that is valid, then I'd expect a lot more description of why!

> ---
>  drivers/thermal/imx_thermal.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 38c993d1bcb3..cd1d9d419275 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -201,7 +201,6 @@ static struct thermal_soc_data thermal_imx7d_data = {
>  
>  struct imx_thermal_data {
>  	struct device *dev;
> -	struct cpufreq_policy *policy;
>  	struct thermal_zone_device *tz;
>  	struct thermal_cooling_device *cdev;
>  	struct regmap *tempmon;
> @@ -541,22 +540,20 @@ MODULE_DEVICE_TABLE(of, of_imx_thermal_match);
>  static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
>  {
>  	struct device_node *np;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
>  	int ret = 0;
>  
> -	data->policy = cpufreq_cpu_get(0);
> -	if (!data->policy) {
> +	if (!policy) {
>  		pr_debug("%s: CPUFreq policy not found\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
> -	np = of_get_cpu_node(data->policy->cpu, NULL);
> +	np = of_get_cpu_node(policy->cpu, NULL);
>  
>  	if (!np || !of_property_present(np, "#cooling-cells")) {
> -		data->cdev = cpufreq_cooling_register(data->policy);
> -		if (IS_ERR(data->cdev)) {
> +		data->cdev = cpufreq_cooling_register(policy);
> +		if (IS_ERR(data->cdev))
>  			ret = PTR_ERR(data->cdev);
> -			cpufreq_cpu_put(data->policy);
> -		}
>  	}
>  
>  	of_node_put(np);
> @@ -567,7 +564,6 @@ static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
>  static void imx_thermal_unregister_legacy_cooling(struct imx_thermal_data *data)
>  {
>  	cpufreq_cooling_unregister(data->cdev);
> -	cpufreq_cpu_put(data->policy);
>  }
>  
>  #else


