Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C530FD8FC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqFzZJ1WfdLG87BIWiz5e/64pmC2OI12YstsxpDM5LU=; b=xcgbJCFekh2wJCq8XzF7vnBuAt
	/F7Iq3q60AULur9D9x6kqjbFmBgs7HiqBI+oFrGzisD9vDgP606wgU+Wzb9Lnhuq8OThykwv60DLc
	7jE8//sKVA7MwmqiEe1L1rss3IICjGn5/Ahs537MfmA8BHtjUGscKJ05xIxcOZfvdrpceunu8d+Xf
	6cAStWTrCE4yVnaB9lRTB8lnnNojk1K93JdXZMEGPS7FQP+lys30HYm+GwNgglh9FLba80sNbc0rJ
	dPhUSaDiho5Mu/+ijFhVea6ZzEFGm8bU2871qfXuebcGVXcPvAezrjycZ1jO5pIjFAPKcwX5sNecT
	F0xuxmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcjZ-00000006Nt1-3oib;
	Thu, 26 Feb 2026 14:52:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcjW-00000006Ns9-3iuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:52:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8BA497;
	Thu, 26 Feb 2026 06:52:44 -0800 (PST)
Received: from [10.57.73.122] (unknown [10.57.73.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8A003F73B;
	Thu, 26 Feb 2026 06:52:48 -0800 (PST)
Message-ID: <ec3fc327-042a-4672-ab39-88cd1ce41065@arm.com>
Date: Thu, 26 Feb 2026 14:52:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/8] KVM: arm64: use CASLT instruction for swapping
 guest descriptor
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
 broonie@kernel.org, ardb@kernel.org, lpieralisi@kernel.org,
 joey.gouly@arm.com, yuzenghui@huawei.com
References: <20260225182708.3225211-1-yeoreum.yun@arm.com>
 <20260225182708.3225211-8-yeoreum.yun@arm.com> <867brzah6g.wl-maz@kernel.org>
 <aaBTM3C2MbIvtUn8@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aaBTM3C2MbIvtUn8@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_065255_138907_1E373F07 
X-CRM114-Status: GOOD (  27.16  )
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

On 26/02/2026 14:05, Yeoreum Yun wrote:
> Hi Marc,
> 
>> On Wed, 25 Feb 2026 18:27:07 +0000,
>> Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>>>
>>> Use the CASLT instruction to swap the guest descriptor when FEAT_LSUI
>>> is enabled, avoiding the need to clear the PAN bit.
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>   arch/arm64/include/asm/cpucaps.h |  2 ++
>>>   arch/arm64/include/asm/futex.h   | 17 +----------------
>>>   arch/arm64/include/asm/lsui.h    | 27 +++++++++++++++++++++++++++
>>>   arch/arm64/kvm/at.c              | 30 +++++++++++++++++++++++++++++-
>>>   4 files changed, 59 insertions(+), 17 deletions(-)
>>>   create mode 100644 arch/arm64/include/asm/lsui.h
>>>
>>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>>> index 177c691914f8..6e3da333442e 100644
>>> --- a/arch/arm64/include/asm/cpucaps.h
>>> +++ b/arch/arm64/include/asm/cpucaps.h
>>> @@ -71,6 +71,8 @@ cpucap_is_possible(const unsigned int cap)
>>>   		return true;
>>>   	case ARM64_HAS_PMUV3:
>>>   		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>>> +	case ARM64_HAS_LSUI:
>>> +		return IS_ENABLED(CONFIG_ARM64_LSUI);
>>>   	}
>>>
>>>   	return true;
>>
>> It would make more sense to move this hunk to the first patch, where
>> you deal with features and capabilities, instead of having this in a
>> random KVM-specific patch.
> 
> Okay. But as Suzuki mention, I think it seems to be redundant.
> I'll remove it.
> 

No, this is required and Marc is right. This hunk should be part of the
original patch that adds the cap. What I am saying is that you don't
need to explicitly call the cpucap_is_poissible() down, but it is
implicitly called by cpus_have_final_cap().

Kind regards
Suzuki


>>
>>> diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
>>> index b579e9d0964d..6779c4ad927f 100644
>>> --- a/arch/arm64/include/asm/futex.h
>>> +++ b/arch/arm64/include/asm/futex.h
>>> @@ -7,11 +7,9 @@
>>>
>>>   #include <linux/futex.h>
>>>   #include <linux/uaccess.h>
>>> -#include <linux/stringify.h>
>>>
>>> -#include <asm/alternative.h>
>>> -#include <asm/alternative-macros.h>
>>>   #include <asm/errno.h>
>>> +#include <asm/lsui.h>
>>>
>>>   #define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
>>>
>>> @@ -91,8 +89,6 @@ __llsc_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>>>
>>>   #ifdef CONFIG_ARM64_LSUI
>>>
>>> -#define __LSUI_PREAMBLE	".arch_extension lsui\n"
>>> -
>>>   #define LSUI_FUTEX_ATOMIC_OP(op, asm_op)				\
>>>   static __always_inline int						\
>>>   __lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
>>> @@ -235,17 +231,6 @@ __lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
>>>   {
>>>   	return __lsui_cmpxchg32(uaddr, oldval, newval, oval);
>>>   }
>>> -
>>> -#define __lsui_llsc_body(op, ...)					\
>>> -({									\
>>> -	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
>>> -		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
>>> -})
>>> -
>>> -#else	/* CONFIG_ARM64_LSUI */
>>> -
>>> -#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
>>> -
>>>   #endif	/* CONFIG_ARM64_LSUI */
>>>
>>>
>>> diff --git a/arch/arm64/include/asm/lsui.h b/arch/arm64/include/asm/lsui.h
>>> new file mode 100644
>>> index 000000000000..8f0d81953eb6
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/lsui.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef __ASM_LSUI_H
>>> +#define __ASM_LSUI_H
>>> +
>>> +#include <linux/compiler_types.h>
>>> +#include <linux/stringify.h>
>>> +#include <asm/alternative.h>
>>> +#include <asm/alternative-macros.h>
>>> +#include <asm/cpucaps.h>
>>> +
>>> +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
>>> +
>>> +#ifdef CONFIG_ARM64_LSUI
>>> +
>>> +#define __lsui_llsc_body(op, ...)					\
>>> +({									\
>>> +	alternative_has_cap_unlikely(ARM64_HAS_LSUI) ?			\
>>> +		__lsui_##op(__VA_ARGS__) : __llsc_##op(__VA_ARGS__);	\
>>> +})
>>> +
>>> +#else	/* CONFIG_ARM64_LSUI */
>>> +
>>> +#define __lsui_llsc_body(op, ...)	__llsc_##op(__VA_ARGS__)
>>> +
>>> +#endif	/* CONFIG_ARM64_LSUI */
>>> +
>>> +#endif	/* __ASM_LSUI_H */
>>
>> Similarly, fold this into the patch that introduces FEAT_LSUI support
>> for futexes (#5) so that the code is in its final position from the
>> beginning. This will avoid churn that makes the patches pointlessly
>> hard to follow, since this change is unrelated to KVM.
> 
> Okay. I'll fold it into #5.
> 
>>
>>> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
>>> index 885bd5bb2f41..fd3c5749e853 100644
>>> --- a/arch/arm64/kvm/at.c
>>> +++ b/arch/arm64/kvm/at.c
>>> @@ -9,6 +9,7 @@
>>>   #include <asm/esr.h>
>>>   #include <asm/kvm_hyp.h>
>>>   #include <asm/kvm_mmu.h>
>>> +#include <asm/lsui.h>
>>>
>>>   static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
>>>   {
>>> @@ -1704,6 +1705,31 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
>>>   	}
>>>   }
>>>
>>> +static int __lsui_swap_desc(u64 __user *ptep, u64 old, u64 new)
>>> +{
>>> +	u64 tmp = old;
>>> +	int ret = 0;
>>> +
>>> +	uaccess_ttbr0_enable();
>>
>> Why do we need this? If FEAT_LSUI is present, than FEAT_PAN is also
>> present. And since PAN support not a compilation option anymore, we
>> should be able to rely on PAN being enabled.
>>
>> Or am I missing something? If so, please document why we require it.
> 
> That was my origin thought but there was relevant discussion about this:
>    - https://lore.kernel.org/all/aW5dzb0ldp8u8Rdm@willie-the-truck/
>    - https://lore.kernel.org/all/aYtZfpWjRJ1r23nw@arm.com/
> 
> In summary, I couldn't make that assumption --
> PAN always presents when LSUI presents for :
> 
>     - CPU bugs happen all the time
>     - Virtualisation and idreg overrides mean illegal feature combinations
>      can show up
> 
> So, uaccess_ttbr0_enable() is for when SW_PAN is enabled.
> 
> I'll make a comment for this.
> 
> [...]
> 
> Thanks!
> 
> --
> Sincerely,
> Yeoreum Yun


