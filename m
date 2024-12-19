Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B454E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsMRam799y1BeBH01GzJpZAfi+0+C0lyLFmFJu0j0GQ=; b=Fb/H+7ZIjANc32WSbXdGkDE9Ov
	MbuYMnVaJZf5ZHQ6U6z6yWwWbiSpW5geTspOh1amMrBiQctXpnuN2RAcmwlimJMwsKVtdF40LmHYU
	dM+DzmRiWJjC73duHFhWvafedbrxtrPUfAuOdIVCylVNPW0xn7r9A6Sy9hZKjA+kxSUpdh2ekpsrZ
	pp1dsT7bdEYFH2Kvnw2llu/mD5v8R4I/mWMZGy4uLp8U4GDKCdFTbzTknvjx156MlmUtSwo/6MznP
	gaWT5eqayGJCFbB8oVKHB0dNWOLBkxr3r5kJQGIhBlT4ttMYmKAzi4kB08UZfMXWcf5yvsEaioYb1
	YEN765Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5bP-00000000Wof-0uhe;
	Thu, 19 Dec 2024 01:45:23 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5aG-00000000Wad-40HS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 01:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734572647; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LsMRam799y1BeBH01GzJpZAfi+0+C0lyLFmFJu0j0GQ=;
	b=sYegUbRf7LSRkXxPYu4lYNRmmJlDGJcYLjHRaZVfRpDbYcLw2M0w/AjMmAoygyOv97pGbw0NVhZPDUzyBoHR7VuffT8BJnCB0rtouN7KYhjxuylAZrZJ61NhkkvIZLN94E3206Cu3njEarb2Y3aMUWEUdT8nb7BXAfecH2pxhy8=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLoNiHx_1734572640 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Dec 2024 09:44:02 +0800
Message-ID: <a9c2ea4d-7199-4d1c-8f10-57761b50d27f@linux.alibaba.com>
Date: Thu, 19 Dec 2024 09:43:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/3] ACPI: APEI: handle synchronous exceptions in task
 work
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, mingo@redhat.com,
 robin.murphy@arm.com, Jonathan.Cameron@huawei.com, bp@alien8.de,
 rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 tony.luck@intel.com, linmiaohe@huawei.com, naoya.horiguchi@nec.com,
 james.morse@arm.com, tongtiangen@huawei.com, gregkh@linuxfoundation.org,
 will@kernel.org, jarkko@kernel.org, linux-acpi@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@intel.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20241202030527.20586-1-xueshuai@linux.alibaba.com>
 <20241202030527.20586-4-xueshuai@linux.alibaba.com>
 <20241218165331.GF1155365@yaz-khff2.amd.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241218165331.GF1155365@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_174413_537074_ACDE840A 
X-CRM114-Status: GOOD (  31.55  )
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



在 2024/12/19 00:53, Yazen Ghannam 写道:
> On Mon, Dec 02, 2024 at 11:05:27AM +0800, Shuai Xue wrote:
>> The memory uncorrected error could be signaled by asynchronous interrupt
>> (specifically, SPI in arm64 platform), e.g. when an error is detected by
>> a background scrubber, or signaled by synchronous exception
>> (specifically, data abort exception in arm64 platform), e.g. when a CPU
>> tries to access a poisoned cache line. Currently, both synchronous and
>> asynchronous error use memory_failure_queue() to schedule
>> memory_failure() to exectute in a kworker context.
>>
>> As a result, when a user-space process is accessing a poisoned data, a
>> data abort is taken and the memory_failure() is executed in the kworker
>> context, memory_failure():
>>
>>    - will send wrong si_code by SIGBUS signal in early_kill mode, and
>>    - can not kill the user-space in some cases resulting a synchronous
>>      error infinite loop
>>
>> Issue 1: send wrong si_code in early_kill mode
>>
>> Since commit a70297d22132 ("ACPI: APEI: set memory failure flags as
>> MF_ACTION_REQUIRED on synchronous events")', the flag MF_ACTION_REQUIRED
>> could be used to determine whether a synchronous exception occurs on
>> ARM64 platform.  When a synchronous exception is detected, the kernel is
>> expected to terminate the current process which has accessed poisoned
>> page. This is done by sending a SIGBUS signal with an error code
>> BUS_MCEERR_AR, indicating an action-required machine check error on
>> read.
>>
>> However, when kill_proc() is called to terminate the processes who have
>> the poisoned page mapped, it sends the incorrect SIGBUS error code
>> BUS_MCEERR_AO because the context in which it operates is not the one
>> where the error was triggered.
>>
>> To reproduce this problem:
>>
>>    #sysctl -w vm.memory_failure_early_kill=1
>>    vm.memory_failure_early_kill = 1
>>
>>    # STEP2: inject an UCE error and consume it to trigger a synchronous error
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 5 addr 0xffffb0d75000
>>    page not present
>>    Test passed
>>
>> The si_code (code 5) from einj_mem_uc indicates that it is BUS_MCEERR_AO
>> error and it is not the fact.
>>
>> After this patch:
>>
>>    # STEP1: enable early kill mode
>>    #sysctl -w vm.memory_failure_early_kill=1
>>    vm.memory_failure_early_kill = 1
>>    # STEP2: inject an UCE error and consume it to trigger a synchronous error
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 4 addr 0xffffb0d75000
>>    page not present
>>    Test passed
>>
>> The si_code (code 4) from einj_mem_uc indicates that it is a BUS_MCEERR_AR
>> error as we expected.
>>
>> Issue 2: a synchronous error infinite loop
>>
>> If a user-space process, e.g. devmem, accesses a poisoned page for which
>> the HWPoison flag is set, kill_accessing_process() is called to send
>> SIGBUS to current processs with error info. Because the memory_failure()
>> is executed in the kworker context, it will just do nothing but return
>> EFAULT. So, devmem will access the posioned page and trigger an
>> exception again, resulting in a synchronous error infinite loop. Such
>> exception loop may cause platform firmware to exceed some threshold and
>> reboot when Linux could have recovered from this error.
>>
>> To reproduce this problem:
>>
>>    # STEP 1: inject an UCE error, and kernel will set HWPosion flag for related page
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 4 addr 0xffffb0d75000
>>    page not present
>>    Test passed
>>
>>    # STEP 2: access the same page and it will trigger a synchronous error infinite loop
>>    devmem 0x4092d55b400
>>
>> To fix above two issues, queue memory_failure() as a task_work so that
>> it runs in the context of the process that is actually consuming the
>> poisoned data.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Tested-by: Ma Wupeng <mawupeng1@huawei.com>
>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Reviewed-by: Xiaofei Tan <tanxiaofei@huawei.com>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> ---
>>   drivers/acpi/apei/ghes.c | 77 +++++++++++++++++++++++-----------------
>>   include/acpi/ghes.h      |  3 --
>>   include/linux/mm.h       |  1 -
>>   mm/memory-failure.c      | 13 -------
>>   4 files changed, 44 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>> index 106486bdfefc..70f2ee3ad1a8 100644
>> --- a/drivers/acpi/apei/ghes.c
>> +++ b/drivers/acpi/apei/ghes.c
>> @@ -467,28 +467,41 @@ static void ghes_clear_estatus(struct ghes *ghes,
>>   }
>>   
>>   /*
> 
> The "kernel-doc" format needs an opening "/**".
> 
>> - * Called as task_work before returning to user-space.
>> - * Ensure any queued work has been done before we return to the context that
>> - * triggered the notification.
>> + * struct ghes_task_work - for synchronous RAS event
>> + *
>> + * @twork:                callback_head for task work
>> + * @pfn:                  page frame number of corrupted page
>> + * @flags:                work control flags
>> + *
>> + * Structure to pass task work to be handled before
>> + * returning to user-space via task_work_add().
>>    */
>> -static void ghes_kick_task_work(struct callback_head *head)
>> +struct ghes_task_work {
>> +	struct callback_head twork;
>> +	u64 pfn;
>> +	int flags;
>> +};
>> +
>> +static void memory_failure_cb(struct callback_head *twork)
>>   {
>> -	struct acpi_hest_generic_status *estatus;
>> -	struct ghes_estatus_node *estatus_node;
>> -	u32 node_len;
>> +	struct ghes_task_work *twcb = container_of(twork, struct ghes_task_work, twork);
>> +	int ret;
>>   
>> -	estatus_node = container_of(head, struct ghes_estatus_node, task_work);
>> -	if (IS_ENABLED(CONFIG_ACPI_APEI_MEMORY_FAILURE))
>> -		memory_failure_queue_kick(estatus_node->task_work_cpu);
>> +	ret = memory_failure(twcb->pfn, twcb->flags);
>> +	gen_pool_free(ghes_estatus_pool, (unsigned long)twcb, sizeof(*twcb));
>>   
>> -	estatus = GHES_ESTATUS_FROM_NODE(estatus_node);
>> -	node_len = GHES_ESTATUS_NODE_LEN(cper_estatus_len(estatus));
>> -	gen_pool_free(ghes_estatus_pool, (unsigned long)estatus_node, node_len);
>> +	if (!ret || ret == -EHWPOISON || ret == -EOPNOTSUPP)
>> +		return;
>> +
>> +	pr_err("%#llx: Sending SIGBUS to %s:%d due to hardware memory corruption\n",
>> +			twcb->pfn, current->comm, task_pid_nr(current));
> 
> This is basically the same as the message in kill_proc(). Was there any
> consideration to have a shared function? Maybe this could be a future
> patch.

Yep, I'd like to refactor in a future.
> 
>> +	force_sig(SIGBUS);
>>   }
>>   
>>   static bool ghes_do_memory_failure(u64 physical_addr, int flags)
>>   {
>>   	unsigned long pfn;
>> +	struct ghes_task_work *twcb;
> 
> Minor nit: A common preference I've seen is to order variable
> declarations from longest->shortest line length.

Will fix it if this patch set still misses the next merge window.

> 
> But overall, looks okay to me.
> 
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> Thanks,
> Yazen


Thanks for valuable comments.

Best Regards,
Shuai


