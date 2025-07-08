Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FAEC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p483o+a/v/MYPw7N8kd7x481fTKBunDI7V1ceqf1kHE=; b=R7FRqdcrKJ5lX/i8WyvBXLLhlA
	dCCuW17YfFfnkZuCjJuNXxQbRARkBr82bWAoCpxskl8Y/KOJAs3VJJHbP+BHqPd1ImZpGVI/+xpiy
	nimJhJNwLZNscRGKgxmI9pPgBwCb9ygdF78lte1GqHXnF6LXoEtB6oYICUCOfPddrl1LCRTVAh1HI
	gr8E81cQZd1c2UlOeLv4v1JzFd99TvWSJGdd9M8voNPqLANhYheVpNRLZk/AcbZOQp+OSs3cQBf+k
	UhPTQB3jX4twPVyF8AGSgH2UA8i7679pDQ30sNOAlLpaQtrJ3H8sgCphCMrywu8JmqLJalXD3OuqY
	+dV31mQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4aN-00000004t6T-0mG8;
	Tue, 08 Jul 2025 09:25:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3k6-00000004l2l-0JE9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:31:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbvT642xHz6GCjH;
	Tue,  8 Jul 2025 16:31:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DC181404C5;
	Tue,  8 Jul 2025 16:31:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 10:31:50 +0200
Date: Tue, 8 Jul 2025 09:31:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <mark.rutland@arm.com>, <robh@kernel.org>, <coresight@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH 2/5] arch_topology: update CPU map to use the new API
Message-ID: <20250708093149.00005ed2@huawei.com>
In-Reply-To: <20250707150414.620-3-alireza.sanaee@huawei.com>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
	<20250707150414.620-3-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013158_259552_C827E3B0 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, 7 Jul 2025 16:04:11 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Cleans up the cpu-map generation using the created API.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/base/arch_topology.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 3ebe77566788..88970f13f684 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -518,23 +518,23 @@ core_initcall(free_raw_capacity);
>   */
>  static int __init get_cpu_for_node(struct device_node *node)
>  {
> +	struct device_node *cpu_node __free(device_node) = NULL;
>  	int cpu;
> -	struct device_node *cpu_node __free(device_node) =
> -		of_parse_phandle(node, "cpu", 0);
>  
> -	if (!cpu_node)
> -		return -1;
> +	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
>  
> -	cpu = of_cpu_node_to_id(cpu_node);

Better I think to flip logic to exit early on errors.

So taking previous review into account - something like.

	struct device_node *cpu_node = NULL;
	int cpu;

	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
	if (cpu == -ENODEV) {
 		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
			cpu_node, cpumask_pr_args(cpu_possible_mask));
		return -ENODEV;
	} else if (cpu < 0) {
		return cpu;
	}

	topology_parse_cpu_capacity(cpu_node, cpu);
	of_node_put(cpu_node);

	return cpu;


>  	if (cpu >= 0)
>  		topology_parse_cpu_capacity(cpu_node, cpu);
> -	else
> +	else if (cpu == -ENODEV)
>  		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
>  			cpu_node, cpumask_pr_args(cpu_possible_mask));
> +	else
> +		return -1;
>  
>  	return cpu;
>  }
>  
> +

Check all patches before posting for noise like this. It sneaks in as
rebases / refactors happen so you always need to eyeball for it at the end
of development.

>  static int __init parse_core(struct device_node *core, int package_id,
>  			     int cluster_id, int core_id)
>  {


