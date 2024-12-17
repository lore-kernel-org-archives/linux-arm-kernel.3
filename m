Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp5bgamgQnxWfuok8ilXwYLyCWVqZ0QAZHqUfBvdgPA=; b=PY9w3gayZa9fSKIMT/I8NRiUp7
	4WNlWhFeDvBZLZwZu4fGxvLDZnvQzobZqf7nJmCBevH+gv0/pm1EjnnjlPp6jmk1dz+sLkclECAbn
	m577OKKwkhVk94772Gp55jsjtReFInWYo45pw9AEgozlotQ6CZ7935ncIkftYcbyuSoeUxGb0bksq
	3KXs4uLIxfDS0RiNnFDEEQcv3UiML9HYFtxYNCGKwwlTRTsZz0t7oH62UblrHL8Xm//Tp37P5bQvQ
	gJS62RVhwOTZNdB+ggpfSKp/ogIDX4Bz5X4hjai5SeuPTsiooeb3aEoHbYT+zzIgFZ8Uy0tue4PKi
	SK0BAh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMaq-0000000BtRI-3gsz;
	Tue, 17 Dec 2024 01:41:48 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMZk-0000000Bt9N-2GM5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 01:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1734399637; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kp5bgamgQnxWfuok8ilXwYLyCWVqZ0QAZHqUfBvdgPA=;
	b=BXZsrdVQ/mIdvQ2eUNyDhrwwfVm4dF7iZssxZOFMaAZ4FHJQ3jugtPHe/xLtMkmoCOv9TnRfyVKOY2ZNBaBa6hIWU663Wg1NALcTWGf7a1gfU50kKuY80BDPs5y2/rDtb/ErfFo9KxUdldEarQ1K+mHjDmK5AV8WTeV9pK6IAVE=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLgi-44_1734399632 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 17 Dec 2024 09:40:34 +0800
Message-ID: <29d80fff-f33f-4470-a345-3f8f1a46f1af@linux.alibaba.com>
Date: Tue, 17 Dec 2024 09:40:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/3] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
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
 <20241202030527.20586-2-xueshuai@linux.alibaba.com>
 <2fb8b1e5-d606-47be-a79e-a4e37a3b8f7f@oracle.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <2fb8b1e5-d606-47be-a79e-a4e37a3b8f7f@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_174041_316563_CEF98E4E 
X-CRM114-Status: GOOD (  13.91  )
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



在 2024/12/17 07:37, jane.chu@oracle.com 写道:
> 
> On 12/1/2024 7:05 PM, Shuai Xue wrote:
>> Synchronous error was detected as a result of user-space process accessing
>> a 2-bit uncorrected error. The CPU will take a synchronous error exception
>> such as Synchronous External Abort (SEA) on Arm64. The kernel will queue a
>> memory_failure() work which poisons the related page, unmaps the page, and
>> then sends a SIGBUS to the process, so that a system wide panic can be
>> avoided.
>>
>> However, no memory_failure() work will be queued when abnormal synchronous
>> errors occur. These errors can include situations such as invalid PA,
>> unexpected severity, no memory failure config support, invalid GUID
>> section, etc. In such case, the user-space process will trigger SEA again.
>> This loop can potentially exceed the platform firmware threshold or even
>> trigger a kernel hard lockup, leading to a system reboot.
>>
>> Fix it by performing a force kill if no memory_failure() work is queued
>> for synchronous errors.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> ---
>>   drivers/acpi/apei/ghes.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>> index a2491905f165..106486bdfefc 100644
>> --- a/drivers/acpi/apei/ghes.c
>> +++ b/drivers/acpi/apei/ghes.c
>> @@ -801,6 +801,17 @@ static bool ghes_do_proc(struct ghes *ghes,
>>           }
>>       }
>> +    /*
>> +     * If no memory failure work is queued for abnormal synchronous
>> +     * errors, do a force kill.
>> +     */
>> +    if (sync && !queued) {
>> +        dev_err(ghes->dev,
>> +            HW_ERR GHES_PFX "%s:%d: synchronous unrecoverable error (SIGBUS)\n",
>> +            current->comm, task_pid_nr(current));
>> +        force_sig(SIGBUS);
>> +    }
>> +
>>       return queued;
>>   }
> 
> Looks good.
> 
> Reviewed-by: Jane Chu <jane.chu@oracle.com>
> 
> -jane

Thanks.

Best Regards,
Shuai

