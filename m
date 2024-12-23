Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D850BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlwxU9yU5UoX8moS94KBcUEK1tmdXrMY1Z1yZrD4Gl4=; b=f97MMjvJ0RR+OMHkQqD0mc+GBB
	C6uHLUAkESzA6O/Z/G0DZQm6nyevLsl7WO/rQZBSct2hxhru0YKhiPL5WzzVzDhCvdKK3LZZQ33Rs
	8lcjNuRHBkGWNjpmW+TU2NyI8YvYZh5/en/McOKgMIUOfvQbZYqsIPhjwppw028vNYMk936d8NEmK
	5B901YV0rQg7ATBb12JyDIlXAXDG3TeH6xEZxKy9RgEC0UCOTgctaXteQtu12NSGJOd4iI1OQUUe3
	lMPhaOXag59azgz9thkolcT0d3HdiR5qMKDNycXUqd9konTI+JKp3m+2pfifBQ0KX/ltjZam+ROPB
	kO2braLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPmLk-0000000ATvD-2rDP;
	Mon, 23 Dec 2024 17:36:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlMz-0000000APJc-056q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:33:27 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3V50KhNz6K75k;
	Tue, 24 Dec 2024 00:33:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E7597140517;
	Tue, 24 Dec 2024 00:33:17 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:33:16 +0100
Date: Mon, 23 Dec 2024 16:33:14 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <20241223163314.00006fed@huawei.com>
In-Reply-To: <20241220075313.51502-3-yangyicong@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-3-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_083325_357377_CA4C9CCD 
X-CRM114-Status: GOOD (  26.64  )
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

On Fri, 20 Dec 2024 15:53:11 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already
> gotten the SMT thread number of each core. Update the largest
> SMT thread number and enable the SMT control by the end of
> topology parsing.
> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Hi Yicong,

Apologies that I'm late to the game on this one.

A few comments inline.  Only important one is whether to bail out early
on error from parse_cluster()

Thanks,

Jonathan


> ---
>  drivers/base/arch_topology.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 3ebe77566788..9e81060144c7 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
> @@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
>  #endif
>  
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +
> +/* Maximum SMT thread number detected used to enable the SMT control */
> +static unsigned int max_smt_thread_num;
> +
>  /*
>   * This function returns the logic cpu number of the node.
>   * There are basically three kinds of return values:
> @@ -565,6 +570,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		i++;
>  	} while (1);
>  
> +	/*
> +	 * If max_smt_thread_num has been initialized and doesn't match
> +	 * the thread number of this entry, then the system has
> +	 * heterogeneous SMT topology.
> +	 */
> +	if (max_smt_thread_num && max_smt_thread_num != i)
> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
> +	if (max_smt_thread_num < i)
> +		max_smt_thread_num = i;

Maybe more self documenting if you use min()? I'm not sure...
	max_smt_thread_num = min(max_smt_thread_num, i);


> +
>  	cpu = get_cpu_for_node(core);
>  	if (cpu >= 0) {
>  		if (!leaf) {
> @@ -677,6 +693,16 @@ static int __init parse_socket(struct device_node *socket)
>  	if (!has_socket)
>  		ret = parse_cluster(socket, 0, -1, 0);

Is it appropriate to check ret before setting num threads?
	if (!has_socket) {
		ret = parse_cluster(socket, 0, -1, 0);
		if (ret)
			return ret;
	}
...

	return 0;

>  
> +	/*
> +	 * Notify the CPU framework of the SMT support. Initialize the
> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
> +	 * number of 1 can be handled by the framework so we don't need
> +	 * to check max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (!max_smt_thread_num)
> +		max_smt_thread_num = 1;
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);

Trivial but I'd put a blank line here.

>  	return ret;
>  }
>  


