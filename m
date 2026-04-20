Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA68F36C20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJ5CdXSzLkVwwaN2gkjigUMa98BbQG4sZbq6fGjnjvg=; b=y0kRB5Ek5P7hFtPjuumje66BKJ
	cX9k82WejxY2pqLirbi8TlbQgLFaEVsRZVEV/6JXcCWh3WAok9t5eSmOqJsrfGrrgAyaj4tOsXiVN
	KTHXNaolTeTqSd1ET4Sk63TWS/SGGmKK8icXqxXArvJSRMRhla0zJ32X+kmkMBcHxwVHyquDmn9OV
	rsy9BbqG6cQdf4XmT2cqdc/JmSjF1+RsAFh2zDZmHNn8li1NGGMKOwltbjKQcXUgglcgYHxc3MdZK
	PtAE+XMrxrRKppLlqwyJDUxv3QC68f+NanJ6BNASRCHsvUHWRsKY1Y/ommIW8rzsMoaH0NMLkT97c
	F75LPodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEi1U-00000006UO1-1qgi;
	Mon, 20 Apr 2026 06:22:20 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEi1R-00000006UNe-0RWA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 06:22:18 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63K6Lj2B066789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 15:21:46 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=FJ5CdXSzLkVwwaN2gkjigUMa98BbQG4sZbq6fGjnjvg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1776666106; v=1;
        b=Fab4JszZTcVq1Wcnn3GPi67jiAAuyi0vN2G2vLUb9wiEHaXeyWOJkP8k6OKIG/Bc
         MSLW8jYjzMErRS7+BPGAzAQj37qGFNtOApRCwgTMTfkhtKcrAVGud92dlFVeUf3M
         waOVb7QFgWsztepP+AjxR8oCG+yuABP9noUYDjyPUIuNlXuFXLU2Ufakz/L5MeEi
         5dnVj6poWbruKOBnHfQR3bWRS5xFuBh/fEVbPRwR3kCe8bA9K93Cc1OFqoB6KHfI
         fT64THxfBFME0MahSZA486qwy7PBjndEm7kgZ+ygWf59mGkv/qAIE7bYBie4RBIi
         J84VxqyKbF5pYOy69uV7tg==
Message-ID: <483e5cf2-a54c-4781-ac6d-49f5bc7128ba@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Apr 2026 15:21:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] KVM: arm64: PMU: Protect the list of PMUs with RCU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <20260418-hybrid-v7-2-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <87mryzauib.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <87mryzauib.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_232217_899395_248BAEE3 
X-CRM114-Status: GOOD (  26.69  )
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

On 2026/04/19 23:34, Marc Zyngier wrote:
> On Sat, 18 Apr 2026 09:14:24 +0100,
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>
>> Convert the list of PMUs to a RCU-protected list that has primitives to
>> avoid read-side contention.
>>
>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>> ---
>>   arch/arm64/kvm/pmu-emul.c | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>> index 59ec96e09321..ef5140bbfe28 100644
>> --- a/arch/arm64/kvm/pmu-emul.c
>> +++ b/arch/arm64/kvm/pmu-emul.c
>> @@ -7,9 +7,9 @@
>>   #include <linux/cpu.h>
>>   #include <linux/kvm.h>
>>   #include <linux/kvm_host.h>
>> -#include <linux/list.h>
>>   #include <linux/perf_event.h>
>>   #include <linux/perf/arm_pmu.h>
>> +#include <linux/rculist.h>
>>   #include <linux/uaccess.h>
>>   #include <asm/kvm_emulate.h>
>>   #include <kvm/arm_pmu.h>
>> @@ -26,7 +26,6 @@ static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
>>   
>>   bool kvm_supports_guest_pmuv3(void)
>>   {
>> -	guard(mutex)(&arm_pmus_lock);
>>   	return !list_empty(&arm_pmus);
> 
> Please read include/linux/rculist.h and the discussion about the
> interaction of list_empty() with RCU-protected lists. How about using
> list_first_or_null_rcu() for peace of mind?

list_first_or_null_rcu() is useful to replace a sequence of list_empty() 
and list_first_entry() that is protected by a lock, but this function 
instead requires the invariant that nobody deletes an element from the 
list, and list_first_or_null_rcu() does not allow removing the requirement.

The header file says:
 > Where are list_empty_rcu() and list_first_entry_rcu()?
 >
 > They do not exist because they would lead to subtle race conditions:
 >
 > if (!list_empty_rcu(mylist)) {
 >	struct foo *bar = list_first_entry_rcu(mylist, struct foo,
 >					       list_member);
 >	do_something(bar);
 > }
 >
 > The list might be non-empty when list_empty_rcu() checks it, but it
 > might have become empty by the time that list_first_entry_rcu()
 > rereads the ->next pointer, which would result in a SEGV.
 >
 > When not using RCU, it is OK for list_first_entry() to re-read that
 > pointer because both functions should be protected by some lock that
 > blocks writers.
 >
 > When using RCU, list_empty() uses READ_ONCE() to fetch the
 > RCU-protected ->next pointer and then compares it to the address of
 > the  list head.  However, it neither dereferences this pointer nor
 > provides  this pointer to its caller.  Thus, READ_ONCE() suffices
 > (that is,  rcu_dereference() is not needed), which means that
 > list_empty() can be used anywhere you would want to use
 > list_empty_rcu().  Just don't expect anything useful to happen if you
 > do a subsequent lockless call to list_first_entry_rcu()!!!
 >
 > See list_first_or_null_rcu for an alternative.

However, kvm_supports_guest_pmuv3() locked a mutex when calling 
list_empty() and unlocked it immediately after that, instead of 
re-reading list_first_entry(). This construct inherently had a race 
condition with code that deletes an element; when the caller of 
kvm_supports_guest_pmuv3() decides to enable guest PMUv3, the host PMU 
may have been gone. But it was still safe because no one deletes an element.

The same logic also applies when using RCU. As the comment says, we can 
use list_empty() instead of the hypothetical list_empty_rcu() macro 
because we don't expect it to magically enable something like 
list_first_entry_rcu(). This function instead keep relying on the fact 
that no one deletes an element of the list.

Regards,
Akihiko Odaki

