Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A5BC44521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqEAV4XNbENaQF1wnfbJbCZQX0jG6pyPPVu7PJw5gtY=; b=IDPCadi9lRQb5oLSGEmhZgECYU
	mttNEbNU7xd05AS7w9ms6aoMNwJw/OKTy8XpIm+FXNXnJ4eNh0uVHgFSQGoYZVov5bh47JQCBOnhZ
	o07PAY4Q+0fWCLTlM3evNqscy8ELyRTYCpa2iOaYMaiWRRidhFIWYtUSciLByn6lOIL3nWcVgJGb6
	8o9wEhqDEZsQ7t9XTQ5Lj1jTvtEK5wkI9pYHZlKQL+tA0qtRdhZmBwcr4ZHdbrg9YZrzlLaCVo37p
	4g3k34tOM0bHpE5ctpIymomQnPL61ZE19TZmlL0o9eU5968iAtMMPRLxehxhGysLBOFlIPOejRD+o
	nZUTIxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXNo-00000005Q7f-3cwP;
	Wed, 21 Jan 2026 12:32:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXNm-00000005Q7G-0XY2;
	Wed, 21 Jan 2026 12:32:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D87A81476;
	Wed, 21 Jan 2026 04:32:12 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16A163F740;
	Wed, 21 Jan 2026 04:32:13 -0800 (PST)
Date: Wed, 21 Jan 2026 12:32:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel test robot <lkp@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <aXDHSIn3hIvESjXg@J2N7QTR9R3>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
 <202601210752.6Nsv9et9-lkp@intel.com>
 <46c7d109-b076-4bb3-9e6e-36c34c546c20@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46c7d109-b076-4bb3-9e6e-36c34c546c20@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_043222_292359_A1E11A88 
X-CRM114-Status: GOOD (  24.90  )
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

On Wed, Jan 21, 2026 at 10:52:21AM +0000, Ryan Roberts wrote:
> On 20/01/2026 23:50, kernel test robot wrote:
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >>> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section
> 
> Hmm, clearly Dave was correct not to rush this through... yuck. I'll take a
> look, but I guess there is no rush if this won't go into -next until shortly
> after -rc1.

Sorry, I should have checked the entry sequencing more thoroughly when I
reviewed this,.

From a quick look, I suspect the right thing to do is to pull the call
to add_random_kstack_offset() a bit later in a few cases; after the
entry logic has run, and after instrumentation_begin() (if the arch code
uses that), such that it doesn't matter if this gets instrumented.

Considering the callers of add_random_kstack_offset(), if we did that:

* arm64 is fine as-is.

* loongarch is fine as-is.

* powerpc's system_call_exception() would need this moved after the
  user_exit_irqoff(). Given that function is notrace rather than
  noinstr, it looks like there are bigger extant issues here.

* riscv is fine as-is.

* s390's __do_syscall() would need this moved after
  enter_from_user_mode().

* On x86:
  - do_int80_emulation() is fine as-is.
  - int80_emulation() is fine as-is.
  - do_int80_syscall_32() would need this moved after
    instrumentation_begin().
  - __do_fast_syscall_32() would need this moved after
    instrumentation_begin().
  - do_syscall_64() would need this moved after instrumentation_begin().

Mark.

