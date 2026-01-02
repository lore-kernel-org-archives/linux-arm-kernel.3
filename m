Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D84FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgv5S66Ie8+n0Hayw6veg0xLVopWHz7Ycfk1ruKCVqc=; b=2P+9v8AaQelePaQMGjEyxPMLQ4
	oXTJojqKIZlLEWkWkj+owZnRVUDUQom24xGybO+mZIe3DQ1HNm4pQdJraFg7CYNDTQvYKpH+rGh3x
	a5BaciQS6vsS4VHA76qcpD1DPoSAaRFo0w4ndajVjq3zSJw8Zu8rQD5keNKjYoc0sbORypDXVc0+4
	L/zBsGj2S1WFizCg9TD5ZELo9EcEbmoqNKI0hT73gFtJk/XscGDiwWLibPdCOyegBXhNWKX0kHqSq
	f/MOaIMymaytmu/kgrjACE0ZgfqtF7VZH19A7QifvwAm/bBuC0kJ1bh7288Kqm6PWAQ0WVpg8S70z
	36bvS2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbejr-00000008G4f-1aj5;
	Fri, 02 Jan 2026 12:58:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbejp-00000008G4F-08ZO;
	Fri, 02 Jan 2026 12:58:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81774497;
	Fri,  2 Jan 2026 04:58:31 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9905D3F5A1;
	Fri,  2 Jan 2026 04:58:33 -0800 (PST)
Message-ID: <581a0fac-7891-4644-af65-0354e22b9311@arm.com>
Date: Fri, 2 Jan 2026 12:58:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>,
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
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251215163520.1144179-4-ryan.roberts@arm.com>
 <202512170038.vJZdUhEN-lkp@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202512170038.vJZdUhEN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_045841_198770_A102750E 
X-CRM114-Status: GOOD (  17.31  )
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

On 16/12/2025 16:31, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on akpm-mm/mm-everything linus/master v6.19-rc1 next-20251216]
> [cannot apply to kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/prandom-Convert-prandom_u32_state-to-__always_inline/20251216-013546
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20251215163520.1144179-4-ryan.roberts%40arm.com
> patch subject: [PATCH v2 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512170038.vJZdUhEN-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> arch/x86/boot/startup/sev-startup.o: warning: objtool: section .discard.addressable has absolute relocation at offset 0x0
> --
>    In file included from include/linux/device/driver.h:21,
>                     from include/linux/device.h:32,
>                     from include/linux/blk_types.h:11,
>                     from include/linux/writeback.h:13,
>                     from include/linux/memcontrol.h:23,
>                     from include/linux/resume_user_mode.h:8,
>                     from include/linux/entry-virt.h:6,
>                     from include/linux/kvm_host.h:5,
>                     from arch/x86/kvm/svm/svm.c:3:
>>> include/linux/module.h:132:49: error: redefinition of '__inittest'
>      132 |         static inline initcall_t __maybe_unused __inittest(void)                \
>          |                                                 ^~~~~~~~~~
>    arch/x86/kvm/svm/svm.c:5509:1: note: in expansion of macro 'module_init'
>     5509 | module_init(svm_init)
>          | ^~~~~~~~~~~
>    include/linux/module.h:132:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
>      132 |         static inline initcall_t __maybe_unused __inittest(void)                \
>          |                                                 ^~~~~~~~~~
>    include/linux/module.h:125:41: note: in expansion of macro 'module_init'
>      125 | #define late_initcall(fn)               module_init(fn)
>          |                                         ^~~~~~~~~~~
>    include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
>       86 | late_initcall(random_kstack_init);
>          | ^~~~~~~~~~~~~

Oops, this is due to having put late_initcall() in the header file. I'll move
this to a c file for the next version.

Thanks for the report!


