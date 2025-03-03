Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B733C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPO3faU0WM8oINILXvtTZEf79GJOXNtgXsPJpD8tQlM=; b=bC2GaPX50rB2oRyFnGm7jVXjMe
	+rCL9Hvyx8tSLS6n+hHQZGGoxkg1ncoHLd/t0t+yKcJz5wYtxdXyS4vUF3vs7T3o8xc99WJl4Gcgx
	bRiybaJKGj7EVZlEhwzHv0f8B28gPoB3g4aBLYF3No0McAKpIq/Q2Vw5NT95C3AVyksEt8Lusbjaw
	u5LvL7EMzipWLwfYvz/lDNQ/9IvSqVA6BJhsUkzK8rtb9TEj8AiVXObybfzKneHSMhY8HGqek79SE
	hdnCM5tbm9hW6YyIDpfCUpLXGkLCBou0vI82tL7Gi4tYxkA9AL2NisElbUFmNmnbUAMbLck9fwvO8
	EeGjX7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp71v-000000019hA-21ci;
	Mon, 03 Mar 2025 14:44:27 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6zJ-000000019B2-1eNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:41:47 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Z61bk3JkQz1GDnG;
	Mon,  3 Mar 2025 22:36:50 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EEF7180216;
	Mon,  3 Mar 2025 22:41:42 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:41:41 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 0/4] Support SMT control on arm64
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <6d83cc41-7759-c0a2-6695-01f98923ed5d@huawei.com>
Date: Mon, 3 Mar 2025 22:41:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064145_849779_03900808 
X-CRM114-Status: GOOD (  10.10  )
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

On 2025/2/28 19:12, Dietmar Eggemann wrote:
> On 18/02/2025 15:10, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> The core CPU control framework supports runtime SMT control which
>> is not yet supported on arm64. Besides the general vulnerabilities
>> concerns we want this runtime control on our arm64 server for:
>>
>> - better single CPU performance in some cases
>> - saving overall power consumption
>>
>> This patchset implements it in the following aspects:
>>
>> - Provides a default topology_is_primary_thread()
>> - support retrieve SMT thread number on OF based system
>> - support retrieve SMT thread number on ACPI based system
>> - select HOTPLUG_SMT for arm64
>>
>> Tests has been done on our ACPI based arm64 server and on ACPI/OF
>> based QEMU VMs.
> 
> [...]
> 
>> Yicong Yang (4):
>>   cpu/SMT: Provide a default topology_is_primary_thread()
>>   arch_topology: Support SMT control for OF based system
>>   arm64: topology: Support SMT control on ACPI based system
>>   arm64: Kconfig: Enable HOTPLUG_SMT
>>
>>  arch/arm64/Kconfig                  |  1 +
>>  arch/arm64/kernel/topology.c        | 66 +++++++++++++++++++++++++++++
>>  arch/powerpc/include/asm/topology.h |  1 +
>>  arch/x86/include/asm/topology.h     |  2 +-
>>  drivers/base/arch_topology.c        | 27 ++++++++++++
>>  include/linux/topology.h            | 22 ++++++++++
>>  6 files changed, 118 insertions(+), 1 deletion(-)
> 
> With the review comments on the individual patches [0-3]/4:

will fix.

> 
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> 

Thanks.


