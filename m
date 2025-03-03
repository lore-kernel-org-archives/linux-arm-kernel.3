Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C65AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyFmoPLxI3Bt/mKH+4GGVhiV4FqREb8L/Cp19+HR3OY=; b=zY0fx5ahZAdMhh093+WV/suM/k
	I0JISRklZzzE0HHi6GPjMJRUm5OeZEnWvVRFAPJtB96LN1dDydiXNcDCghQgd88Zj2gXGvLxuA094
	duLW+QjP5wKOvqPSu1xMF1lDBfBYvZVHrwrRT6QHc+dey3VBB6bOAmhsJ+Bz42Q3fVW7zD7MiI4dg
	eZOXBbUEb7CtgWp1agy7yMnPt/r0JdoZNDkCtpPPS+oZUGNcVTfuul+071WI9FEQ9kUosm7xNVjhJ
	7FV7AKSNmJZSgC9w64cOEYm5+NVLBttL2EFR841zQ4hzxRbmTHxWk8LUM56vrw1zOWSn2o2npELaL
	pPpue44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp70N-000000019QX-3Ihr;
	Mon, 03 Mar 2025 14:42:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6ym-00000001944-39We
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:41:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Z61Zl13Y8zwW49;
	Mon,  3 Mar 2025 22:35:59 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3682E1402C8;
	Mon,  3 Mar 2025 22:40:51 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:40:50 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Sudeep Holla <sudeep.holla@arm.com>, Pierre Gondois
	<pierre.gondois@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com> <Z8WPiOweOjFZqTwN@bogus>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <32e572d6-dedd-d8a3-13be-6de02303a64d@huawei.com>
Date: Mon, 3 Mar 2025 22:40:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <Z8WPiOweOjFZqTwN@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064113_003514_2E81B3CB 
X-CRM114-Status: GOOD (  15.68  )
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

On 2025/3/3 19:16, Sudeep Holla wrote:
> On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
>> On 2/28/25 20:06, Sudeep Holla wrote:
>>>>>
>>>>> Ditto as previous patch, can get rid if it is default 1.
>>>>>
>>>>
>>>> On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
>>>> cpu_smt_num_threads uninitialized to UINT_MAX:
>>>>
>>>> smt/active:0
>>>> smt/control:-1
>>>>
>>>> If cpu_smt_set_num_threads() is called:
>>>> active:0
>>>> control:notsupported
>>>>
>>>> So it might be slightly better to still initialize max_smt_thread_num.
>>>>
>>>
>>> Sure, what I meant is to have max_smt_thread_num set to 1 by default is
>>> that is what needed anyways and the above code does that now.
>>>
>>> Why not start with initialised to 1 instead ?
>>> Of course some current logic needs to change around testing it for zero.
>>>
>>
>> I think there would still be a way to check against the default value.
>> If we have:
>> unsigned int max_smt_thread_num = 1;
>>
>> then on a platform with 2 threads, the detection condition would trigger:
>> xa_for_each(&hetero_cpu, hetero_id, entry) {
>>     if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>>         pr_warn_once("Heterogeneous SMT topology is partly
>>                       supported by SMT control\n");
>>
>> so we would need an additional variable:
>> bool is_initialized = false;
> 
> Sure, we could do that or skip the check if max_smt_thread_num == 1 ?
> 
> I mean
> 	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)
> 

this will work for me. will launch some tests.

Thanks.



