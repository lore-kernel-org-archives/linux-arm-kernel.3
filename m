Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFBAE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 17:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVYJ8ouxXEJ32vKRS7dpUfPVWa7BlVRd+beBSZ+Z43o=; b=zZWZVdA1vbif8mSj2P5JE+0Y9l
	4RDvT1Qn8L9WqonvyUY6DfvUqFuHoppWBlydcSz5rDwpl037j4VbT4qXCvKjHkd1wDx9CqlkipIkD
	3DO9O5nkQKqproUJvoZgXF/sXPupmUOewueXv1mjYKYZ825l2PhVlYXbjROECFI+bUw0rZJjan3H6
	WW5321KZW7S/8W/s3/YPK14EUd1E+vC2uS1+TnOkRtXVl9J0nmaMeAZz52QNK5jjKLmMIoTxTKw8t
	ENQf3THENSFtpi+R0koJyW3DlS8gYc34bDy4kmn7JBJPedebLC4WomyYw/GKrdjGLp45ZEyEt6Y06
	czhhK91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPmaF-0000000AV4k-1Yt6;
	Mon, 23 Dec 2024 17:51:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlOc-0000000APTm-2w4Z
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 16:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iVYJ8ouxXEJ32vKRS7dpUfPVWa7BlVRd+beBSZ+Z43o=; b=ftnsSan9GYl3sf399hAi546/TA
	JCldPAs98FqK8Cse9gXSxM3h+wTi2EAjpIarrgcD9iSLds5LyUvctINkXsNSrptZIfwbWZemu3BKR
	UyQmj45HoWQ2M2oPu1NH2c8ZpaD2+HeBY8PYtQ02zbG0CVIIkCfraoEOcJYDvlMwsumNppXFlqhfN
	foHw4+sY1VegITUAGA4IAItDSI2NJbp98YlIbvT1IpyJOROct8gY2Og7HhE9aTmdpRf2oWuCLhOux
	IADSnRV+jMNZq4/q+Zak9+8yhIMbTPA97CaK2VbKAy1nvgzf1s6GMxh1VB4rA8UyX58AnXUNFOiEy
	oXhRqTAg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlOZ-00000006Q0G-2QOq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:35:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3Wv2jWzz6K6jC;
	Tue, 24 Dec 2024 00:34:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 508A2140517;
	Tue, 24 Dec 2024 00:34:52 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:34:50 +0100
Date: Mon, 23 Dec 2024 16:34:48 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
Message-ID: <20241223163448.00004354@huawei.com>
In-Reply-To: <a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-2-yangyicong@huawei.com>
	<a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_163503_780744_1ED066AE 
X-CRM114-Status: GOOD (  29.08  )
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

On Fri, 20 Dec 2024 15:59:27 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> On 2024/12/20 15:53, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Currently if architectures want to support HOTPLUG_SMT they need to
> > provide a topology_is_primary_thread() telling the framework which
> > thread in the SMT cannot offline. However arm64 doesn't have a
> > restriction on which thread in the SMT cannot offline, a simplest
> > choice is that just make 1st thread as the "primary" thread. So
> > just make this as the default implementation in the framework and
> > let architectures like x86 that have special primary thread to
> > override this function (which they've already done).
> > 
> > There's no need to provide a stub function if !CONFIG_SMP or
> > !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
> > the 1st CPU in the SMT so it's always the primary thread.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> > As questioned in v9 [1] whether this works on architectures not using
> > CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
> > Architectures should use this on their own situation.
> > [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> > 
> > [root@localhost smt]# uname -m
> > loongarch64
> > [root@localhost smt]# pwd
> > /sys/devices/system/cpu/smt
> > [root@localhost smt]# cat ../possible 
> > 0-3
> > [root@localhost smt]# cat ../online 
> > 0-3
> > [root@localhost smt]# cat control 
> > on
> > [root@localhost smt]# echo off > control 
> > [root@localhost smt]# cat control 
> > off
> > [root@localhost smt]# cat ../online 
> > 0,2
> > [root@localhost smt]# echo on > control 
> > [root@localhost smt]# cat control 
> > on
> > [root@localhost smt]# cat ../online 
> > 0-3  
> 
> Tested with below code using the topology_is_primary_thread() introduced
> in this patch. Tested on an ACPI-based QEMU VM emulating SMT2.
Nice bit of testing.

Given it all seems fine. FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(for original patch, not the longarch one!)

> 
> Subject: [PATCH] LoongArch: Support HOTPLUG_SMT on ACPI-based system
> 
> Support HOTPLUG_SMT on ACPI-based system using generic
> topology_is_primary_thread().
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/loongarch/Kconfig       |  1 +
>  arch/loongarch/kernel/acpi.c | 26 ++++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index dae3a9104ca6..bed1b0640b97 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -172,6 +172,7 @@ config LOONGARCH
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_TIF_NOHZ
>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
> +	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_FORCED_THREADING
>  	select IRQ_LOONGARCH_CPU
>  	select LOCK_MM_AND_FIND_VMA
> diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
> index 382a09a7152c..e642b0de57e7 100644
> --- a/arch/loongarch/kernel/acpi.c
> +++ b/arch/loongarch/kernel/acpi.c
> @@ -15,9 +15,11 @@
>  #include <linux/memblock.h>
>  #include <linux/of_fdt.h>
>  #include <linux/serial_core.h>
> +#include <linux/xarray.h>
>  #include <asm/io.h>
>  #include <asm/numa.h>
>  #include <asm/loongson.h>
> +#include <linux/cpu_smt.h>
> 
>  int acpi_disabled;
>  EXPORT_SYMBOL(acpi_disabled);
> @@ -175,8 +177,12 @@ int pptt_enabled;
> 
>  int __init parse_acpi_topology(void)
>  {
> +	int thread_num, max_smt_thread_num = 1;
> +	struct xarray core_threads;
>  	int cpu, topology_id;
> +	void *entry;
> 
> +	xa_init(&core_threads);
>  	for_each_possible_cpu(cpu) {
>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>  		if (topology_id < 0) {
> @@ -184,19 +190,35 @@ int __init parse_acpi_topology(void)
>  			return -ENOENT;
>  		}
> 
> -		if (acpi_pptt_cpu_is_thread(cpu) <= 0)
> +		if (acpi_pptt_cpu_is_thread(cpu) <= 0) {
>  			cpu_data[cpu].core = topology_id;
> -		else {
> +		} else {
>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>  			if (topology_id < 0)
>  				return -ENOENT;
> 
>  			cpu_data[cpu].core = topology_id;
> +
> +			entry = xa_load(&core_threads, topology_id);
> +			if (!entry) {
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(1), GFP_KERNEL);
> +			} else {
> +				thread_num = xa_to_value(entry);
> +				thread_num++;
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(thread_num), GFP_KERNEL);
> +
> +				if (thread_num > max_smt_thread_num)
> +					max_smt_thread_num = thread_num;
> +			}
>  		}
>  	}
> 
>  	pptt_enabled = 1;
> 
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&core_threads);
>  	return 0;
>  }
> 


