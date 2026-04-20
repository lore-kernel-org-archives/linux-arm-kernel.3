Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B083CEA71B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzV1iXC7+vl6whAibS6Ur39FhY1WOB3MInBD16/Nu9U=; b=pSgOcq4sJN/B8IMEcJvWlj2m4e
	UM4bsjmZDPOhspWTxqwMr7nMktK6fZjzLJH2o6FxsHWxhaP1wz59iXhqtARyNRV4dGz1OpEwtWosT
	3Ay8eP61XJgmG2G9rCA8uOn7qk9P4EK7rv1bsaCMO1t7xYioSrLMIdoCzcW0/j4vbmctZEZ0m7AK4
	sh8KPyw8BpT9HdmvUCZcsNz8ghxqs3f0jK7koTdnXlC0DlXgtZlSsjm87SICFJh52xqUK+WKU01vn
	IkpiVZKsBBbwQ+ecRHnz8Gy13b1Lnfy2VJfoC6L2QcSaFyCGFV8Z6xtLAyg4k9P3CoDof9q4fos/l
	FiHi52Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdS7-00000006HFC-0HU7;
	Mon, 20 Apr 2026 01:29:31 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdS3-00000006HEM-2KZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 01:29:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pzV1iXC7+vl6whAibS6Ur39FhY1WOB3MInBD16/Nu9U=;
	b=y7GGsT4gaA4oL/pT6TtVfZp3VCP1EjeOtlB2HQ/zEZLLCDz1pkz0FyomH8c0QIf0P+9rbLH74
	cSuNj9u1edWEKqojD4BE7S1X099yRASuAROktIYivXz2wN3+io2THer3f3MZSXnFUrYGnOUoyZf
	9XbuYHknfM36JGra6eypOUg=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fzSR04rxHzKm4w;
	Mon, 20 Apr 2026 09:22:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id BDC4040573;
	Mon, 20 Apr 2026 09:29:15 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 09:29:15 +0800
Message-ID: <6d2b0c3d-2c59-4c6c-b86a-9c45e743a064@huawei.com>
Date: Mon, 20 Apr 2026 09:29:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <tglx@kernel.org>, <peterz@infradead.org>, <sudeep.holla@kernel.org>,
	<yangyicong@hisilicon.com>, <dietmar.eggemann@arm.com>,
	<Jonathan.Cameron@huawei.com>, <linux-kernel@vger.kernel.org>, James Morse
	<james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com> <aeOd0Ndec2rQe2J8@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aeOd0Ndec2rQe2J8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_182928_097607_FD2A4504 
X-CRM114-Status: GOOD (  17.67  )
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



On 4/18/2026 11:05 PM, Catalin Marinas wrote:
> On Sat, Apr 18, 2026 at 12:55:22PM +0100, Catalin Marinas wrote:
>> On Fri, Apr 17, 2026 at 03:55:34PM +0800, Jinjie Ruan wrote:
>>> When booting with `maxcpus` greater than the number of present CPUs (e.g.,
>>> QEMU -smp cpus=4,maxcpus=8), some CPUs are marked as 'present' but have not
>>> yet been registered via register_cpu(). Consequently, the per-cpu device
>>> objects for these CPUs are not yet initialized.
> [...]
>> Another option would have been to avoid marking such CPUs present but I
>> think this will break other things. Yet another option is to register
>> all CPU devices even if they never come up (like maxcpus greater than
>> actual CPUs).
> 
> Something like below, untested (and I don't claim I properly understand
> this code; just lots of tokens used trying to make sense of it ;))
> 
> ------------------------8<-------------------------
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index a9d884fd1d00..4c0a5ed906ea 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
>  		return *pcpu;
>  	}
>  
> +	set_cpu_present(*pcpu, true);
>  	return 0;
>  }
>  EXPORT_SYMBOL(acpi_map_cpu);
>  
>  int acpi_unmap_cpu(int cpu)
>  {
> +	set_cpu_present(cpu, false);
>  	return 0;
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1aa324104afb..751a74d997e1 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -510,8 +510,10 @@ int arch_register_cpu(int cpu)
>  	struct cpu *c = &per_cpu(cpu_devices, cpu);
>  
>  	if (!acpi_disabled && !acpi_handle &&
> -	    IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU))
> +	    IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU)) {
> +		set_cpu_present(cpu, false);
>  		return -EPROBE_DEFER;
> +	}

I have verified this patch in my local environment, and it passes the test.

>  
>  #ifdef CONFIG_ACPI_HOTPLUG_CPU
>  	/* For now block anything that looks like physical CPU Hotplug */
> 


