Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0CACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rTAxnX2kPCvVjSV1Z9d0MDskdOa8h5diPJciFh9K6Q=; b=wSrwOltJ3D43OUYtkLaLvXjF2j
	o/RSXBJ6w3+uJYafS8f6R+mS9MwJX8S0ap5PoUCMamKGGLrEX9FhY+fhtbfF7B2Dg/uwXCDeWHT3j
	YkVe4Ui9gOWdFWtF9vN+6FPH6sEyL5mLJgKqdONKHYO0TiMXPoC0I1rPQPiUM03S3ugqThUXQG/S2
	4i6KxQKf5ZTmOPkqkoqXnCfEZhh7aNtXfsRvVaTMe6HK6PzBpuD+Fg71B/QY6hRnPPFUoSJqPsNOV
	BLVM25oR4ZDBpuzSswClEfCeZ6OgBhWtEcGEihw6XnzdXzUbSbXGVmudbxcegImtX+UUz4ktV/AQ5
	33eh4Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVzI-000000007pI-33MY;
	Thu, 11 Sep 2025 01:20:36 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVzF-000000007nw-0rNX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757553629; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=6rTAxnX2kPCvVjSV1Z9d0MDskdOa8h5diPJciFh9K6Q=;
	b=v8G33zXYqjyKqImV/vn5uo5oqsAkg6lxAXt3/Rh3q5dMGaskEM8QbCyObM5ECv/Wf3BuV0fCy6AXZdkpdBoUpQ0H0QwJAmoIRMerYnO0EyP+XdcgjigHzep3S/BJ6A1tw+HZx2wOkC36RV6d2JmPAl9sJquS8VkNqqjfaOmkWGs=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wnjxwc0_1757553626 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Sep 2025 09:20:26 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  James Morse
 <james.morse@arm.com>,  "Christoph Lameter (Ampere)" <cl@gentwo.org>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] arm64: tlbflush: Don't broadcast if mm was
 only active on local cpu
In-Reply-To: <dcc3b52d-0b86-47fc-8297-a6abc8af4c38@os.amperecomputing.com>
	(Yang Shi's message of "Wed, 10 Sep 2025 16:58:25 -0700")
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
	<20250829153510.2401161-3-ryan.roberts@arm.com>
	<dcc3b52d-0b86-47fc-8297-a6abc8af4c38@os.amperecomputing.com>
Date: Thu, 11 Sep 2025 09:20:25 +0800
Message-ID: <871podlr8m.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_182034_077741_5E32FEE2 
X-CRM114-Status: GOOD (  25.31  )
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

Yang Shi <yang@os.amperecomputing.com> writes:

> Hi Ryan,
>
>
> On 8/29/25 8:35 AM, Ryan Roberts wrote:
>> There are 3 variants of tlb flush that invalidate user mappings:
>> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
>> would previously unconditionally broadcast their tlbis to all cpus in
>> the inner shareable domain.
>>
>> But this is a waste of effort if we can prove that the mm for which we
>> are flushing the mappings has only ever been active on the local cpu. In
>> that case, it is safe to avoid the broadcast and simply invalidate the
>> current cpu.
>>
>> So let's track in mm_context_t::active_cpu either the mm has never been
>> active on any cpu, has been active on more than 1 cpu, or has been
>> active on precisely 1 cpu - and in that case, which one. We update this
>> when switching context, being careful to ensure that it gets updated
>> *before* installing the mm's pgtables. On the reader side, we ensure we
>> read *after* the previous write(s) to the pgtable(s) that necessitated
>> the tlb flush have completed. This guarrantees that if a cpu that is
>> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
>> entry cannot have been seen by any other cpu and we can flush only the
>> local cpu.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   arch/arm64/include/asm/mmu.h         | 12 ++++
>>   arch/arm64/include/asm/mmu_context.h |  2 +
>>   arch/arm64/include/asm/tlbflush.h    | 90 +++++++++++++++++++++++++---
>>   arch/arm64/mm/context.c              | 30 +++++++++-
>>   4 files changed, 123 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>> index 6e8aa8e72601..ca32fb860309 100644
>> --- a/arch/arm64/include/asm/mmu.h
>> +++ b/arch/arm64/include/asm/mmu.h
>> @@ -17,6 +17,17 @@
>>   #include <linux/refcount.h>
>>   #include <asm/cpufeature.h>
>>   +/*
>> + * Sentinal values for mm_context_t::active_cpu. ACTIVE_CPU_NONE indicates the
>> + * mm has never been active on any CPU. ACTIVE_CPU_MULTIPLE indicates the mm
>> + * has been active on multiple CPUs. Any other value is the ID of the single
>> + * CPU that the mm has been active on.
>> + */
>> +enum active_cpu {
>> +	ACTIVE_CPU_NONE = UINT_MAX,
>> +	ACTIVE_CPU_MULTIPLE = UINT_MAX - 1,
>> +};
>> +
>>   typedef struct {
>>   	atomic64_t	id;
>>   #ifdef CONFIG_COMPAT
>> @@ -26,6 +37,7 @@ typedef struct {
>>   	void		*vdso;
>>   	unsigned long	flags;
>>   	u8		pkey_allocation_map;
>> +	unsigned int	active_cpu;
>
> Any reason why you don't use bit mask to mark the active CPUs? And
> mm_struct also has cpu_bitmap to record the active CPUs which the
> process has run on. Why not just use it? x86 uses it to determine
> which CPUs kernel should send TLB flush IPI to. I understand this
> series just check whether local cpu is the active cpu or not, but bit
> mask should not make things more complicated. And it also can provide
> more flexibility. We can extend this, for example, use IPI to send
> local TLB flush if the number of active cpus is quite low. AFAIK, x86
> added TLBI broadcast support too, and fallback to IPI if the number of
> active cpus is <= 3. IIRC, Christohper's series did the similar
> thing. He should be interested in this series too, cc'ed him.

Agree!  One possible disadvantage of this series is that the benefit
will gone after the process is migrated to another CPU.  This is quite
common if the process isn't bound to a CPU on a system without many
CPUs.  A cpumask will be helpful for this situation.

>
>>   } mm_context_t;
>>     /*

[snip]

---
Best Regards,
Huang, Ying

