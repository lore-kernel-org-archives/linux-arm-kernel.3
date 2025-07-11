Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A30CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/bOB8uUyDhxggUbutsKJ/Ll7jylc14tMrbTiF4QJLg=; b=aPrXYU0loqP130kKTo6l52F/Dl
	H5iuEECHuo0rvnbkk5ekk6YFJAMmP4SOgXtRk1X+2GDf7k0WxklqhVlBoI3/bQIuVjvJGgv50moaq
	gyHOuqKZa1CSitlSz/27OdzS0XDkEMDhU2iFSMnjToY6tdyjdzxKTl80hkOZER8JI+4zis9Ry3Q/E
	oo9dG2yTcz9d6L1Wei/lg/vk2cJCGCJGQ4H2VAUPowQhNxvrmY1JprxwqoTEIFhd/MaFp1gFF4ImQ
	BQlRafk/1fjPBQzaGMAzhrBiyxL+YKRdibLFz7b97GX0PvSGP/73NW0M5sY8ohfSDe9zEkUacnhKD
	qsoHLLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBNh-0000000EWn5-0j80;
	Fri, 11 Jul 2025 10:53:29 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaA0p-0000000EIbl-3zX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:25:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdmSw4Xb7z6L4yC;
	Fri, 11 Jul 2025 17:22:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 546F21402CB;
	Fri, 11 Jul 2025 17:25:42 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 11:25:41 +0200
Date: Fri, 11 Jul 2025 10:25:39 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <krzk@kernel.org>, <robh@kernel.org>, <coresight@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 2/5] arch_topology: update CPU map to use the new API
Message-ID: <20250711102539.000065b6@huawei.com>
In-Reply-To: <20250708151502.561-3-alireza.sanaee@huawei.com>
References: <20250708151502.561-1-alireza.sanaee@huawei.com>
	<20250708151502.561-3-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_022548_133833_C71B5629 
X-CRM114-Status: GOOD (  18.84  )
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

On Tue, 8 Jul 2025 16:14:59 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Cleans up the cpu-map generation using the created API.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/base/arch_topology.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 1037169abb45..ccc73bfae90d 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -473,19 +473,19 @@ static unsigned int max_smt_thread_num = 1;
>   */
>  static int __init get_cpu_for_node(struct device_node *node)
>  {
> +	struct device_node *cpu_node;

Initialize to NULL.  Whilst we can see that it will always be initalized
static analysis tools and compilers probably can't.

>  	int cpu;
> -	struct device_node *cpu_node __free(device_node) =
> -		of_parse_phandle(node, "cpu", 0);
>  
> -	if (!cpu_node)
> -		return -1;
> -
> -	cpu = of_cpu_node_to_id(cpu_node);
> -	if (cpu >= 0)
> +	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
> +	if (cpu >= 0) {
>  		topology_parse_cpu_capacity(cpu_node, cpu);
> -	else
> +		of_node_put(cpu_node);
> +	} else if (cpu == -ENODEV) {
>  		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
>  			cpu_node, cpumask_pr_args(cpu_possible_mask));
> +		of_node_put(cpu_node);
> +	} else
> +		return -1;

I'd be tempted to make this more conventional with error path out of line.

	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
	if (cpu == -ENODEV) {
  		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
  			cpu_node, cpumask_pr_args(cpu_possible_mask));
		return -ENODEV;
	} else if (cpu < 0) {
`		return -1;  /* to keep ABI - it's odd but not something we should touch! */
// note this avoids need for the helper to return -1, it can return -EINVAL to indicate
// an invalid parameter.
	}

	topology_parse_cpu_capacity(cpu_node, cpu);
	of_node_put(cpu_node);

	return cpu;
	

>  
>  	return cpu;
>  }


