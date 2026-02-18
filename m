Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F182E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIm+IEOgNc9VlpqTE5y+/ppPLqEHeblG2I6SKqX1NTo=; b=tX9Ke48E/pMqeHOU1Af2qcoUUm
	vEBxKyFazIm6dZIXb528tr/qSBs8+Gk2DBz1Urrn8TJnUZ3crx9kCjuagIB8AflT/gP3iNkgUEphO
	ChC+OdWjcOtPySD90pLSLf++pfweG/7v9IgKfGta7dGMWQ7AaG52Ajc1/oCtPtmgJNXGl0aWXw04t
	woYfiFRRGR3TuGZMsWZ1LpiZR/iqy8VF37IJk1wK+9OVF70ASckXqsRpIxCnkflBat21rgboLZ/Fx
	GrNx+EKYI/CzN1G1Y1v+9VFBj2AeHgQjBXrDjlVoBm2KADSaD0A3xnDys3y9r4aGH9DACMgimHsFT
	YZQTLTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjM7-0000000A0xZ-0PWd;
	Wed, 18 Feb 2026 15:20:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjM4-0000000A0x2-2qkz;
	Wed, 18 Feb 2026 15:20:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9997339;
	Wed, 18 Feb 2026 07:20:33 -0800 (PST)
Received: from [10.57.81.199] (unknown [10.57.81.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 990193F7F5;
	Wed, 18 Feb 2026 07:20:34 -0800 (PST)
Message-ID: <8531da33-a4dc-48ac-abf3-c831d4493afb@arm.com>
Date: Wed, 18 Feb 2026 15:20:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
 <202601210752.6Nsv9et9-lkp@intel.com>
 <46c7d109-b076-4bb3-9e6e-36c34c546c20@arm.com> <aXDHSIn3hIvESjXg@J2N7QTR9R3>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aXDHSIn3hIvESjXg@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_072044_818256_85F66006 
X-CRM114-Status: GOOD (  24.40  )
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

On 21/01/2026 12:32, Mark Rutland wrote:
> On Wed, Jan 21, 2026 at 10:52:21AM +0000, Ryan Roberts wrote:
>> On 20/01/2026 23:50, kernel test robot wrote:
>>> Hi Ryan,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on akpm-mm/mm-everything]
>>> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
>>> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>>> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
>>> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
>>> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
>>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
>>>>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section
>>
>> Hmm, clearly Dave was correct not to rush this through... yuck. I'll take a
>> look, but I guess there is no rush if this won't go into -next until shortly
>> after -rc1.
> 
> Sorry, I should have checked the entry sequencing more thoroughly when I
> reviewed this,.
> 
> From a quick look, I suspect the right thing to do is to pull the call
> to add_random_kstack_offset() a bit later in a few cases; after the
> entry logic has run, and after instrumentation_begin() (if the arch code
> uses that), such that it doesn't matter if this gets instrumented.
> 
> Considering the callers of add_random_kstack_offset(), if we did that:
> 
> * arm64 is fine as-is.
> 
> * loongarch is fine as-is.
> 
> * powerpc's system_call_exception() would need this moved after the
>   user_exit_irqoff(). Given that function is notrace rather than
>   noinstr, it looks like there are bigger extant issues here.
> 
> * riscv is fine as-is.
> 
> * s390's __do_syscall() would need this moved after
>   enter_from_user_mode().
> 
> * On x86:
>   - do_int80_emulation() is fine as-is.
>   - int80_emulation() is fine as-is.
>   - do_int80_syscall_32() would need this moved after
>     instrumentation_begin().
>   - __do_fast_syscall_32() would need this moved after
>     instrumentation_begin().
>   - do_syscall_64() would need this moved after instrumentation_begin().

Thanks for the detailed suggestions, Mark. I've taken this approach, and
assuming perf testing doesn't throw up any issue, I'm going to revert back to
using the out-of-line version of prandom_u32_state() and will drop patch 2.

Thanks,
Ryan


> 
> Mark.


