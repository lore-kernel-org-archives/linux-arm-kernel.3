Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7045BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu+kxl7Rbpa3NX2YfJtjBR/kWuGjgp/o98oaquTywBQ=; b=NTzylMW5xeCI6lbCMMugOEKlqu
	si+lOCvdD1TBQAdxxgtgIVbUda9Osrteq7jzw/CeDS18Jq2DSvHTGRCw/G9sxqkVFuPsxyw6l3D5H
	nv1xN2E/5A3F2lX69+XfscpjNsA+97NcaOsIzazn4acOMb7wR/86GW0o/GQVWD1uXKpF0WSP4OVmn
	ggMCgJgF9oesbKBvxaFihrbc6yVa3fd55rvWWrfyfnIxDCmR6L0vnaqYemYrKa4Sgnth/yEbUKdIK
	NvWXvcbs3qUMADgpK927BQebO/ColLaHDCbm2mKg9XqcN+zvB+nbiB/sP5jnQJB2Jh8C4D8tUGJX0
	/oIVkivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAmZ-0000000EScc-0ZYR;
	Fri, 11 Jul 2025 10:15:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaABl-0000000EKle-3UNJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:37:07 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdmmj4y7Fz67kgS;
	Fri, 11 Jul 2025 17:36:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 288A71402E9;
	Fri, 11 Jul 2025 17:37:00 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 11:36:59 +0200
Date: Fri, 11 Jul 2025 10:36:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <krzk@kernel.org>, <robh@kernel.org>, <coresight@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 5/5] perf/arm-dsu: refactor cpu id retrieval via new
 API of_cpu_phandle_to_id
Message-ID: <20250711103657.0000059c@huawei.com>
In-Reply-To: <20250708151502.561-6-alireza.sanaee@huawei.com>
References: <20250708151502.561-1-alireza.sanaee@huawei.com>
	<20250708151502.561-6-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_023706_015241_DE9E42BD 
X-CRM114-Status: GOOD (  17.74  )
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

On Tue, 8 Jul 2025 16:15:02 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Update arm-dsu to use the new API, where both "cpus" and "cpu"
> properties are supported.

I'd gloss over that and just not mention support of "cpu" as
it never applies here and we just queried the number of phandles
for cpus a few lines up.

> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/perf/arm_dsu_pmu.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
> index cb4fb59fe04b..1014b92c0fd2 100644
> --- a/drivers/perf/arm_dsu_pmu.c
> +++ b/drivers/perf/arm_dsu_pmu.c
> @@ -591,17 +591,13 @@ static struct dsu_pmu *dsu_pmu_alloc(struct platform_device *pdev)
>  static int dsu_pmu_dt_get_cpus(struct device *dev, cpumask_t *mask)
>  {
>  	int i = 0, n, cpu;
> -	struct device_node *cpu_node;
>  
>  	n = of_count_phandle_with_args(dev->of_node, "cpus", NULL);
>  	if (n <= 0)
>  		return -ENODEV;
> +
Stray change - it's a valid one for readability but not in this patch.

>  	for (; i < n; i++) {
> -		cpu_node = of_parse_phandle(dev->of_node, "cpus", i);
> -		if (!cpu_node)
> -			break;
> -		cpu = of_cpu_node_to_id(cpu_node);
> -		of_node_put(cpu_node);
> +		cpu = of_cpu_phandle_to_id(dev->of_node, NULL, i);
>  		/*
>  		 * We have to ignore the failures here and continue scanning
>  		 * the list to handle cases where the nr_cpus could be capped


