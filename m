Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8C3CFD374
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/GlMzXtKU+hfuRyLCDNMAPdT07yfV6LWnrvh0FWnOg=; b=hAiMbGFOvvQO2C/hfqlsQ6Rw9l
	yzv67pVD2BZuDpG0LUnrJ1KPUOSfaw2W6H99TJRu4Ad/Ucn+FFWlJqFercmnDWHu/ggMi7QHsfNSn
	teS38IU1a2Byrvud+iHbbokhSwvBOiuKJwIwDSs3Ngh72/n7D2faU0kKXMW3uleLhqWBCMeNnfZAG
	RIzx34fuCs391txTVL9f8UC/pBCwuh/dsjP9CIsTDqQfDmsZH6HDFtk3ggK2V2c+lsLR1m6C6NbfU
	oFNH+N6wyWy3cRLtNVeEVA7tBSU/JlqdnxVMcQeGByb7Tq7Xdhsh5L+5Ij0YoFboAegMXNk0IeQwY
	NvVogCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjeE-0000000Cfix-07bW;
	Tue, 25 Nov 2025 03:23:22 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjeB-0000000CfiR-0f3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 03:23:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N/GlMzXtKU+hfuRyLCDNMAPdT07yfV6LWnrvh0FWnOg=;
	b=hHLGhiMBs/ccMUnV96htEYVgIMJ6y8ixfclW8OTPQ0tM0A9c9FCtaFC5Z1U/98ohZBqAuaXah
	4xcWm99WxZNvCeQUWsMUXJ9HAbFuraNI+CK49Tu81ySp1VV0MGh7lPf7KMOJlZpN752dnFMMihI
	49PXO15qSzKaWsN4Zv7Pgow=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dFnyg6CjyzcZxk;
	Tue, 25 Nov 2025 11:20:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A077D1402C1;
	Tue, 25 Nov 2025 11:23:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 25 Nov 2025 11:23:10 +0800
Message-ID: <21071aac-8eaf-cfd7-6211-d119b257ef4c@huawei.com>
Date: Tue, 25 Nov 2025 11:23:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 09/11] entry: Add has_syscall_work() helper
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <macro@orcam.me.uk>, <deller@gmx.de>,
	<mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<dvyukov@google.com>, <kmal@cock.li>, <lihongbo22@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-10-ruanjinjie@huawei.com>
 <e37844e3-8810-42c1-bae1-30b2e7868b80@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <e37844e3-8810-42c1-bae1-30b2e7868b80@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_192319_699055_4DC7FCEB 
X-CRM114-Status: GOOD (  14.51  )
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



On 2025/11/19 1:13, Kevin Brodsky wrote:
> On 17/11/2025 14:30, Jinjie Ruan wrote:
>> Add has_syscall_work() helper to facilitate reuse of this
>> function in other places.
>>
>> No functional changes.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  include/linux/entry-common.h | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
>> index cd6dacb2d8bf..e0f94e937e84 100644
>> --- a/include/linux/entry-common.h
>> +++ b/include/linux/entry-common.h
>> @@ -44,6 +44,11 @@
>>  				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
>>  				 ARCH_SYSCALL_WORK_EXIT)
>>  
>> +static inline bool has_syscall_work(unsigned long work)
>> +{
>> +	return unlikely(work & SYSCALL_WORK_ENTER);
> 
> I'm not sure this is a good idea, since the generic syscall machinery
> has two separate sets of flags (SYSCALL_WORK_ENTER and
> SYSCALL_WORK_EXIT). Of course we could reflect that in the helper's
> name, but since it's only used twice after patch 10, maybe we don't need
> a helper at all.

Will remove it.

> 
> - Kevin
> 
>> +}
>> +
>>  /**
>>   * syscall_enter_from_user_mode_prepare - Establish state and enable interrupts
>>   * @regs:	Pointer to currents pt_regs
>> @@ -91,7 +96,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
>>  {
>>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>>  
>> -	if (work & SYSCALL_WORK_ENTER)
>> +	if (has_syscall_work(work))
>>  		syscall = syscall_trace_enter(regs, syscall, work);
>>  
>>  	return syscall;
> 

