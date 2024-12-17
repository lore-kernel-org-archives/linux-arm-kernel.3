Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wr8aDe7GjDB5Kp4DGPjbGDaTM/a+mrqZeQFmnsgb9s=; b=3GXwP3WsdLa7g7P/hL36bZ8d+X
	SOHX4vySrnrfNvw5EeYDk7b9JuBXbyEsx+0flYEYg8i2XS9uI7/gIuvMrINQ8Nu9VG1z4ZeR0BeXH
	wrHLo5CVCldTi1xHbF3ZXBxjYwSp7X2Gj2gZMHpcWsV2wMGS+L+iHHSZvAX1JeBcagLs0fRvAhyF4
	9o5oKVbia3QGe1ktqEDjg9/LVeyJDEFgQ8i+zKOH+eNjPwPvNk6zWE3Wdbr7mY3a4e0zUZ6L7YmbR
	lxW97Afs3r40ptwkCIu23QLHPQRqB3Xyn8oG3X5vC5KD/AtboN8D7FDpgwY8nsohl1bFmfuYuL9Y3
	ugFwc+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMbu-0000000Btd2-1xP0;
	Tue, 17 Dec 2024 01:42:54 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMaU-0000000BtJE-0avt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 01:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734399683; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1wr8aDe7GjDB5Kp4DGPjbGDaTM/a+mrqZeQFmnsgb9s=;
	b=kpx2+MP33bh4hW5Lf059rV3nke9jxUcqFs08/j4f1CVMAl+DujXAqxHaUD2Sp0ZHhr1J2pjKYVO0LNON+OkXYqSFSRt/gJVD07m+DsX1xFdjBAw/jGl9QPQ/qFPT9ZtDCaUXE3YlP5Dz7w9KU16phDA6Aohm5gqCJtwGEMizIgw=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLghEcF_1734399677 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Dec 2024 09:41:19 +0800
Message-ID: <8a8511f3-ace1-4187-8030-55a72573c63d@linux.alibaba.com>
Date: Tue, 17 Dec 2024 09:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 3/3] ACPI: APEI: handle synchronous exceptions in task
 work
To: jane.chu@oracle.com, yazen.ghannam@amd.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, mingo@redhat.com, robin.murphy@arm.com,
 Jonathan.Cameron@Huawei.com, bp@alien8.de, rafael@kernel.org,
 linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 tanxiaofei@huawei.com, mawupeng1@huawei.com, tony.luck@intel.com,
 linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com,
 tongtiangen@huawei.com, gregkh@linuxfoundation.org, will@kernel.org,
 jarkko@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
 ardb@kernel.org, ying.huang@intel.com, ashish.kalra@amd.com,
 baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20241202030527.20586-1-xueshuai@linux.alibaba.com>
 <20241202030527.20586-4-xueshuai@linux.alibaba.com>
 <d7adcb58-7a1d-4f0b-a55d-40c12ca60b02@oracle.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <d7adcb58-7a1d-4f0b-a55d-40c12ca60b02@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_174126_478062_8564E950 
X-CRM114-Status: GOOD (  27.45  )
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



在 2024/12/17 07:53, jane.chu@oracle.com 写道:
> 
> On 12/1/2024 7:05 PM, Shuai Xue wrote:
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
>>    - will send wrong si_code by SIGBUS signal in early_kill mode, and
>>    - can not kill the user-space in some cases resulting a synchronous
>>      error infinite loop
>>
>> Issue 1: send wrong si_code in early_kill mode
>>
>> Since commit a70297d22132 ("ACPI: APEI: set memory failure flags as
>> MF_ACTION_REQUIRED on synchronous events")', the flag MF_ACTION_REQUIRED
>> could be used to determine whether a synchronous exception occurs on
>> ARM64 platform.  When a synchronous exception is detected, the kernel is
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
>>    #sysctl -w vm.memory_failure_early_kill=1
>>    vm.memory_failure_early_kill = 1
>>
>>    # STEP2: inject an UCE error and consume it to trigger a synchronous error
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 5 addr 0xffffb0d75000
>>    page not present
>>    Test passed
>>
>> The si_code (code 5) from einj_mem_uc indicates that it is BUS_MCEERR_AO
>> error and it is not the fact.
>>
>> After this patch:
>>
>>    # STEP1: enable early kill mode
>>    #sysctl -w vm.memory_failure_early_kill=1
>>    vm.memory_failure_early_kill = 1
>>    # STEP2: inject an UCE error and consume it to trigger a synchronous error
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 4 addr 0xffffb0d75000
>>    page not present
>>    Test passed
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
>>    # STEP 1: inject an UCE error, and kernel will set HWPosion flag for related page
>>    #einj_mem_uc single
>>    0: single   vaddr = 0xffffb0d75400 paddr = 4092d55b400
>>    injecting ...
>>    triggering ...
>>    signal 7 code 4 addr 0xffffb0d75000
>>    page not present
>>    Test passed
>>
>>    # STEP 2: access the same page and it will trigger a synchronous error infinite loop
>>    devmem 0x4092d55b400
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
>>   drivers/acpi/apei/ghes.c | 77 +++++++++++++++++++++++-----------------
>>   include/acpi/ghes.h      |  3 --
>>   include/linux/mm.h       |  1 -
>>   mm/memory-failure.c      | 13 -------
>>   4 files changed, 44 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>> index 106486bdfefc..70f2ee3ad1a8 100644
>> --- a/drivers/acpi/apei/ghes.c
>> +++ b/drivers/acpi/apei/ghes.c
>> @@ -467,28 +467,41 @@ static void ghes_clear_estatus(struct ghes *ghes,
>>   }
>>   /*
>> - * Called as task_work before returning to user-space.
>> - * Ensure any queued work has been done before we return to the context that
>> - * triggered the notification.
>> + * struct ghes_task_work - for synchronous RAS event
>> + *
>> + * @twork:                callback_head for task work
>> + * @pfn:                  page frame number of corrupted page
>> + * @flags:                work control flags
>> + *
>> + * Structure to pass task work to be handled before
>> + * returning to user-space via task_work_add().
>>    */
>> -static void ghes_kick_task_work(struct callback_head *head)
>> +struct ghes_task_work {
>> +    struct callback_head twork;
>> +    u64 pfn;
>> +    int flags;
>> +};
>> +
>> +static void memory_failure_cb(struct callback_head *twork)
>>   {
>> -    struct acpi_hest_generic_status *estatus;
>> -    struct ghes_estatus_node *estatus_node;
>> -    u32 node_len;
>> +    struct ghes_task_work *twcb = container_of(twork, struct ghes_task_work, twork);
>> +    int ret;
>> -    estatus_node = container_of(head, struct ghes_estatus_node, task_work);
>> -    if (IS_ENABLED(CONFIG_ACPI_APEI_MEMORY_FAILURE))
>> -        memory_failure_queue_kick(estatus_node->task_work_cpu);
>> +    ret = memory_failure(twcb->pfn, twcb->flags);
>> +    gen_pool_free(ghes_estatus_pool, (unsigned long)twcb, sizeof(*twcb));
>> -    estatus = GHES_ESTATUS_FROM_NODE(estatus_node);
>> -    node_len = GHES_ESTATUS_NODE_LEN(cper_estatus_len(estatus));
>> -    gen_pool_free(ghes_estatus_pool, (unsigned long)estatus_node, node_len);
>> +    if (!ret || ret == -EHWPOISON || ret == -EOPNOTSUPP)
>> +        return;
>> +
>> +    pr_err("%#llx: Sending SIGBUS to %s:%d due to hardware memory corruption\n",
>> +            twcb->pfn, current->comm, task_pid_nr(current));
>> +    force_sig(SIGBUS);
>>   }
>>   static bool ghes_do_memory_failure(u64 physical_addr, int flags)
>>   {
>>       unsigned long pfn;
>> +    struct ghes_task_work *twcb;
>>       if (!IS_ENABLED(CONFIG_ACPI_APEI_MEMORY_FAILURE))
>>           return false;
>> @@ -501,6 +514,18 @@ static bool ghes_do_memory_failure(u64 physical_addr, int flags)
>>           return false;
>>       }
>> +    if (flags == MF_ACTION_REQUIRED && current->mm) {
>> +        twcb = (void *)gen_pool_alloc(ghes_estatus_pool, sizeof(*twcb));
>> +        if (!twcb)
>> +            return false;
>> +
>> +        twcb->pfn = pfn;
>> +        twcb->flags = flags;
>> +        init_task_work(&twcb->twork, memory_failure_cb);
>> +        task_work_add(current, &twcb->twork, TWA_RESUME);
>> +        return true;
>> +    }
>> +
>>       memory_failure_queue(pfn, flags);
>>       return true;
>>   }
>> @@ -745,7 +770,7 @@ int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, CXL);
>> -static bool ghes_do_proc(struct ghes *ghes,
>> +static void ghes_do_proc(struct ghes *ghes,
>>                const struct acpi_hest_generic_status *estatus)
>>   {
>>       int sev, sec_sev;
>> @@ -811,8 +836,6 @@ static bool ghes_do_proc(struct ghes *ghes,
>>               current->comm, task_pid_nr(current));
>>           force_sig(SIGBUS);
>>       }
>> -
>> -    return queued;
>>   }
>>   static void __ghes_print_estatus(const char *pfx,
>> @@ -1114,9 +1137,7 @@ static void ghes_proc_in_irq(struct irq_work *irq_work)
>>       struct ghes_estatus_node *estatus_node;
>>       struct acpi_hest_generic *generic;
>>       struct acpi_hest_generic_status *estatus;
>> -    bool task_work_pending;
>>       u32 len, node_len;
>> -    int ret;
>>       llnode = llist_del_all(&ghes_estatus_llist);
>>       /*
>> @@ -1131,25 +1152,16 @@ static void ghes_proc_in_irq(struct irq_work *irq_work)
>>           estatus = GHES_ESTATUS_FROM_NODE(estatus_node);
>>           len = cper_estatus_len(estatus);
>>           node_len = GHES_ESTATUS_NODE_LEN(len);
>> -        task_work_pending = ghes_do_proc(estatus_node->ghes, estatus);
>> +
>> +        ghes_do_proc(estatus_node->ghes, estatus);
>> +
>>           if (!ghes_estatus_cached(estatus)) {
>>               generic = estatus_node->generic;
>>               if (ghes_print_estatus(NULL, generic, estatus))
>>                   ghes_estatus_cache_add(generic, estatus);
>>           }
>> -
>> -        if (task_work_pending && current->mm) {
>> -            estatus_node->task_work.func = ghes_kick_task_work;
>> -            estatus_node->task_work_cpu = smp_processor_id();
>> -            ret = task_work_add(current, &estatus_node->task_work,
>> -                        TWA_RESUME);
>> -            if (ret)
>> -                estatus_node->task_work.func = NULL;
>> -        }
>> -
>> -        if (!estatus_node->task_work.func)
>> -            gen_pool_free(ghes_estatus_pool,
>> -                      (unsigned long)estatus_node, node_len);
>> +        gen_pool_free(ghes_estatus_pool, (unsigned long)estatus_node,
>> +                  node_len);
>>           llnode = next;
>>       }
>> @@ -1210,7 +1222,6 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
>>       estatus_node->ghes = ghes;
>>       estatus_node->generic = ghes->generic;
>> -    estatus_node->task_work.func = NULL;
>>       estatus = GHES_ESTATUS_FROM_NODE(estatus_node);
>>       if (__ghes_read_estatus(estatus, buf_paddr, fixmap_idx, len)) {
>> diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
>> index be1dd4c1a917..ebd21b05fe6e 100644
>> --- a/include/acpi/ghes.h
>> +++ b/include/acpi/ghes.h
>> @@ -35,9 +35,6 @@ struct ghes_estatus_node {
>>       struct llist_node llnode;
>>       struct acpi_hest_generic *generic;
>>       struct ghes *ghes;
>> -
>> -    int task_work_cpu;
>> -    struct callback_head task_work;
>>   };
>>   struct ghes_estatus_cache {
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index c39c4945946c..aa4246c7c23e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3936,7 +3936,6 @@ enum mf_flags {
>>   int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index,
>>                 unsigned long count, int mf_flags);
>>   extern int memory_failure(unsigned long pfn, int flags);
>> -extern void memory_failure_queue_kick(int cpu);
>>   extern int unpoison_memory(unsigned long pfn);
>>   extern atomic_long_t num_poisoned_pages __read_mostly;
>>   extern int soft_offline_page(unsigned long pfn, int flags);
>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>> index 14c316d7d38d..e0adb665d07b 100644
>> --- a/mm/memory-failure.c
>> +++ b/mm/memory-failure.c
>> @@ -2499,19 +2499,6 @@ static void memory_failure_work_func(struct work_struct *work)
>>       }
>>   }
>> -/*
>> - * Process memory_failure work queued on the specified CPU.
>> - * Used to avoid return-to-userspace racing with the memory_failure workqueue.
>> - */
>> -void memory_failure_queue_kick(int cpu)
>> -{
>> -    struct memory_failure_cpu *mf_cpu;
>> -
>> -    mf_cpu = &per_cpu(memory_failure_cpu, cpu);
>> -    cancel_work_sync(&mf_cpu->work);
>> -    memory_failure_work_func(&mf_cpu->work);
>> -}
>> -
>>   static int __init memory_failure_init(void)
>>   {
>>       struct memory_failure_cpu *mf_cpu;
> 
> Looks good.
> 
> Reviewed-by: Jane Chu <jane.chu@oracle.com>
> 
> -jane
> 

Thanks.

Best Regards,
Shuai

