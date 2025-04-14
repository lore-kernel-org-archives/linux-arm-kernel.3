Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42130C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XP1wiJKn79M25SDS7QDbse457FmVwidLJBCVM8ARXV4=; b=nTBM0K6mJE3ij0r6s5+IFt5Mvu
	24fW4g6/Dio1atfxm4sQa88gZZGEmBMiQj2isBmaOt9465peLRxQ/CqZ2hm+hOl9K+tQVZD1WXc4J
	ydj3HFtoz9VxocX/TfyVhJr4x8folm5kwcC4BKbuNdDQBk0K43celCG5b5MCDzkKnR5z7X51Ol1Up
	jk5rzfXyPZ2p8h0+jWgukimr0xl/mC8CSLIu4y3EXPMcqsVWdUTcUlvsA6a7L6n69rMG4rc10jADi
	1EfRjiyB2VwGrbZqd3z63r569kI7H2tUyzEXl6WjvMuc16Vqtc7JELShhsPrGBpZJNYfRpIyLUUhk
	JjWctLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Lfv-00000002cAx-2OXd;
	Mon, 14 Apr 2025 15:24:43 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LKQ-00000002XJs-1mTC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744642946; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XP1wiJKn79M25SDS7QDbse457FmVwidLJBCVM8ARXV4=;
	b=UvlFGofenDdImfQeLr5Sh8ng0nkVi9DsWxYbgeLBPcq/DM0mhRucAt+bv7EYME38PM6ZoFenkQhYBJFcdMQSr6o/DMewsX/S9Q6N9BHnv0bAz4tkcYo/AFHBM1UvMY5B1ZVzdSHBdpqY7fq7qrKXE/1IuuUYL3qHyhRhVM2mgrI=
Received: from 30.246.161.79(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WWsd0xB_1744642940 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Apr 2025 23:02:22 +0800
Message-ID: <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com>
Date: Mon, 14 Apr 2025 23:02:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: Hanjun Guo <guohanjun@huawei.com>, catalin.marinas@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org, linux-acpi@vger.kernel.org,
 yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
 robin.murphy@arm.com, Jonathan.Cameron@Huawei.com, bp@alien8.de,
 rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com,
 tony.luck@intel.com, linmiaohe@huawei.com, naoya.horiguchi@nec.com,
 james.morse@arm.com, tongtiangen@huawei.com, gregkh@linuxfoundation.org,
 will@kernel.org, jarkko@kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, linux-edac@vger.kernel.org, x86@kernel.org,
 justin.he@arm.com, ardb@kernel.org, ying.huang@linux.alibaba.com,
 ashish.kalra@amd.com, baolin.wang@linux.alibaba.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
 robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
 zhuo.song@linux.alibaba.com
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com>
 <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_080230_879067_BF732ACE 
X-CRM114-Status: GOOD (  17.75  )
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



在 2025/4/14 22:37, Hanjun Guo 写道:
> On 2025/4/4 19:20, Shuai Xue wrote:
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
>> Reviewed-by: Jane Chu <jane.chu@oracle.com>
>> ---
>>   drivers/acpi/apei/ghes.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
>> index b72772494655..50e4d924aa8b 100644
>> --- a/drivers/acpi/apei/ghes.c
>> +++ b/drivers/acpi/apei/ghes.c
>> @@ -799,6 +799,17 @@ static bool ghes_do_proc(struct ghes *ghes,
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
> 
> I think it's reasonable to send a force kill to the task when the
> synchronous memory error is not recovered.
> 
> But I hope this code will not trigger some legacy firmware issues,
> let's be careful for this, so can we just introduce arch specific
> callbacks for this?

Sorry, can you give more details? I am not sure I got your point.

For x86, Tony confirmed that ghes will not dispatch x86 synchronous errors
(a.k.a machine check exception), in previous vesion.
Sync is only used in arm64 platform, see is_hest_sync_notify().

> 
> Thanks
> Hanjun

Thanks.
Shuai

