Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNOop8rzq59w9COXE0TJcaF6wh65SwL1946uo/XA0W0=; b=N2ZCzJuBiV70If5Xe8SdDMNepr
	ddJDXW0MXyo1RC+b/6GHhSAJm/G9HCdJPPY9WJI+VTn48zGac/avhqlXXPr1DoHVw1jolF7WcQbiL
	oKIer4KdhvjNZI75LkaOHbCB09LzsXiDfYccWfCDOzd19OSvpB8Nigdsb7RS8k4TDF6KIb0NHyMmk
	JkUo35Ww8X5Bp9UKcoDnZQteWwUyisgKfU2waTqPR86kkGe6jO0vy8qqmdP/cFvEw/ndvPIoW6sp/
	5VVIxc6JLg+02x46DPWS2g7/VAid9PclkMjOehk7HOnWs7nrCbmm28Hvw41r6UWsA5cNHyJK6VhXs
	60pug/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjQo-0000000CUIz-1YYS;
	Fri, 18 Jul 2025 11:39:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj2o-0000000CPcK-313S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:14:27 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk6bN1449z689xS;
	Fri, 18 Jul 2025 19:13:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 377B214033C;
	Fri, 18 Jul 2025 19:14:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 18 Jul
 2025 13:14:20 +0200
Date: Fri, 18 Jul 2025 12:14:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 3/6] arch_topology: update CPU map to use
 of_cpu_phandle_to_id
Message-ID: <20250718121419.00007bfe@huawei.com>
In-Reply-To: <20250718094848.587-4-alireza.sanaee@huawei.com>
References: <20250718094848.587-1-alireza.sanaee@huawei.com>
	<20250718094848.587-4-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041426_901706_1B1E8EDE 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri, 18 Jul 2025 10:48:45 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Refactor get_cpu_for_node to use of_cpu_phandle_to_id instead of
> of_cpu_node_to_id.

If respinning, perhaps link this to the fact it's enabled by
the cpu_node no longer being used if we fail to get the related
cpu id as enabled by previous patch.

> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/base/arch_topology.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 6fafd86f608a..72bf23cdf469 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -474,20 +474,19 @@ static unsigned int max_smt_thread_num = 1;
>  static int __init get_cpu_for_node(struct device_node *node)
>  {
>  	int cpu;
> -	struct device_node *cpu_node __free(device_node) =
> -		of_parse_phandle(node, "cpu", 0);
> +	struct device_node *cpu_node = NULL;
>  
> -	if (!cpu_node)
> -		return -1;
> -
> -	cpu = of_cpu_node_to_id(cpu_node);
> -	if (cpu < 0) {
> +	cpu = of_cpu_phandle_to_id(node, &cpu_node, 0);
> +	if (cpu == -ENODEV) {
>  		pr_info("CPU node exist but the possible cpu range is :%*pbl\n",
>  			cpumask_pr_args(cpu_possible_mask));
>  		return cpu;
> +	} else if (cpu < 0) {
> +		return -1;
>  	}
>  
>  	topology_parse_cpu_capacity(cpu_node, cpu);
> +	of_node_put(cpu_node);
>  	return cpu;
>  }
>  


