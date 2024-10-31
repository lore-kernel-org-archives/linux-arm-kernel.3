Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9D3D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZFHYS3RLQVBCEyFhBjpblkzuBhfsjCvMeSCBEdE1Kg=; b=1Boa0Xn7ytKshIpKSbVJlak7pb
	F30os94abNJC/E07Lvf70x21xVLkEfQmyhgCaSwGYbAy07nxWs5LxaOVq2cNLuet5OGpnaw2OGl0N
	ZM+r3rjZVncgXt7L9UMYmykHZ52ijInaGN7fkb9uhql+ATfkSA/CX4YL7wPegW0YgmK1j0JHHLS4Z
	+xwZSqMvjqs8EjBqpP4l4SRZM072P4fwmkHmlvpQd1+GLgjDtOi1ON4Urwg956zqrKYTuv18t0Lc8
	mkepMefXoz6YiiFI/eIbNjMN50cG9zZ3WjQYwxTMpae7sIZYh+eLgycPzDQvH4ckaeopY/p8XRUTL
	tvKhZRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UAe-00000003Vf8-20np;
	Thu, 31 Oct 2024 12:21:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U7q-00000003VMk-3ypC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:18:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XfNHJ4SqXzdkPl;
	Thu, 31 Oct 2024 20:15:24 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id B2FC918009B;
	Thu, 31 Oct 2024 20:17:58 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 31 Oct 2024 20:17:57 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Thomas Gleixner <tglx@linutronix.de>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Date: Thu, 31 Oct 2024 20:17:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87ttcty71m.ffs@tglx>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_051807_169126_DE0DE359 
X-CRM114-Status: GOOD (  11.74  )
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

On 2024/10/30 22:55, Thomas Gleixner wrote:
> On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>>  
>> +#ifndef topology_is_primary_thread
>> +#define topology_is_primary_thread topology_is_primary_thread
> 
> Please do not glue defines and functions together w/o a newline in between.
> 

sure, will add a newline here.

>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>> +{
>> +	/*
>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>> +	 * Architectures do have a special primary thread (e.g. x86) need
>> +	 * to override this function. Otherwise just make the first thread
>> +	 * in the SMT as the primary thread.
>> +	 */
>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> 
> How is that supposed to work? Assume both siblings are offline, then the
> sibling mask is empty and you can't boot the CPU anymore.
> 

For architectures' using arch_topology, topology_sibling_cpumask() will at least
contain the tested CPU itself. This is initialized in
drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be empty here.

Besides we don't need to check topology_is_primary_thread() at boot time:
-> cpu_up(cpu)
     cpu_bootable()
       if (cpu_smt_control == CPU_SMT_ENABLED &&
           cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
         return true; // we'll always return here and @cpu is always bootable

Also tested fine in practice.

Thanks.



