Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E8D5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syaFfjwerqR8utu0oNjnVZRq4peXobeHGKBHeZI/wa8=; b=XW9+TdQDNc4yiUsBVeBSIre6ef
	YS3gKj4xGpOOt/dSNTeaZ4k4llGp+mNQTZv0AeZly53Epf6cs1QqG9wTs3dfZ4QPc5uAdeqI5n9I1
	shDNkVlNSgYrm448z1vGr8GQdL49Xuq2i3/uizXcvzekje1NFFRW4h1h3XxplfAG+6jp4ZHqjYxMV
	g5YXwbkKApC/D/7EBd5GsQSvUBzWRhcweEDqUuSFrJHY065jGTFd3i8CRV6ri2ylU7lTiA8Mg3Cq3
	IZM4Css5XDDuToHdmsbVsqLt2vy0En7u404AG4ntXauEGhNLY8QpOWV7V0UljJfIcY080kv74fZGI
	/wXZvBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9K2x-00000009ilv-27bw;
	Fri, 08 Nov 2024 08:08:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9K1A-00000009iRa-1KSu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:06:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XlBL52N1bz1T9sv;
	Fri,  8 Nov 2024 16:04:29 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id BB09B1800D9;
	Fri,  8 Nov 2024 16:06:51 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 8 Nov 2024 16:06:50 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v7 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Pierre Gondois <pierre.gondois@arm.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-4-yangyicong@huawei.com>
 <63792865-46ad-44a5-a1f2-9a17da5b4bfc@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <93a8b799-dfd9-5ffa-37ca-e7cd4a82e70e@huawei.com>
Date: Fri, 8 Nov 2024 16:06:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <63792865-46ad-44a5-a1f2-9a17da5b4bfc@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_000656_725928_F9CE4958 
X-CRM114-Status: GOOD (  20.59  )
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

On 2024/11/8 1:20, Pierre Gondois wrote:
> 
> 
> On 10/30/24 13:54, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system. If a homogeneous system's using ACPI 6.2 or later,
>> all the CPUs should be under the root node of PPTT. There'll be
>> only one entry in the xarray and all the CPUs in the system will
>> be assumed identical.
>>
>> The core's SMT control provides two interface to the users [1]:
>> 1) enable/disable SMT by writing on/off
>> 2) enable/disable SMT by writing thread number 1/max_thread_number
>>
>> If a system have more than one SMT thread number the 2) may
>> not handle it well, since there're multiple thread numbers in the
>> system and 2) only accept 1/max_thread_number. So issue a warning
>> to notify the users if such system detected.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 57 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>

[...]

>> @@ -67,6 +106,24 @@ int __init parse_acpi_topology(void)
>>           cpu_topology[cpu].package_id = topology_id;
>>       }
>>   +    /*
>> +     * This should be a short loop depending on the number of heterogeneous
>> +     * CPU clusters. Typically on a homogeneous system there's only one
>> +     * entry in the XArray.
>> +     */
>> +    xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +        if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +            pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
>> +
>> +        if (entry->thread_num > max_smt_thread_num)
>> +            max_smt_thread_num = entry->thread_num;
>> +
>> +        xa_erase(&hetero_cpu, hetero_id);
>> +        kfree(entry);
>> +    }
> 
> I think you need to check that max_smt_thread_num !=0,
> like in the DT path. Otherwise on a platform with no SMT,
> max_smt_thread_num = 0 and I hit:
> 
> kernel/cpu::cpu_smt_set_num_threads()
> WARN_ON(!num_threads || (num_threads > max_threads));
> 
> 
> ->
> if (max_smt_thread_num)
>     cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> 

sorry for this silly mistake. yes we should do the same like in the DT path.
I'll get this fixed. thanks for testing.

>> +
>> +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>> +    xa_destroy(&hetero_cpu);
>>       return 0;
>>   }
>>   #endif
> 
> .

