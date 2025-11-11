Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C0DCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74Fz3VpW2sF+xa0T2S1zFCJ5keUlw0qm4nLxz7YJmcw=; b=Jba44wrMNiV16UzI5S7U6NnHpl
	W16ZMtN0+DgneVZE/y7C8Y28bnShEPzoUxkX8L/zgPn+eBv/I1lcB1tW9ULA8rrh34+cU3iWJ5+ey
	e9OIsZyTFl5A2C8lrAG4p8oyVMIpMTfe/rf44mTmQbxf7JwiiBkmQgC90chwuKiOnvgih6Elc5MFZ
	p+QYf7qmQP45oBbtoY4TBo0bTwh0vdNrbv8fqF8CkraQtMI6A94kkelDgfhYCbiPl1mD01TQk8nmr
	ZKOALnOLTXuiElSIkaC1TdSs6M7LDffPL47UG8/86LDAEwOLvB9fIj8oiVJkUszKLRxW/or+f8fhv
	7Ak34zcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIukl-00000007iwg-2idk;
	Tue, 11 Nov 2025 20:14:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuke-00000007iwJ-3LaQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC9D40114;
	Tue, 11 Nov 2025 20:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7308EC113D0;
	Tue, 11 Nov 2025 20:14:02 +0000 (UTC)
Date: Tue, 11 Nov 2025 20:13:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] arch/arm64/mm/fault: Implement exceptions tracepoints
Message-ID: <aROZB_ri49OexJqX@arm.com>
References: <20251013035532.1793181-1-balbirs@nvidia.com>
 <aQjlzbkdzzYL2xJR@arm.com>
 <8f0722c5-203f-4f2b-8654-e77811aee7d3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f0722c5-203f-4f2b-8654-e77811aee7d3@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121404_882292_1E354538 
X-CRM114-Status: GOOD (  29.52  )
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

On Wed, Nov 05, 2025 at 11:27:18AM +1100, Balbir Singh wrote:
> On 11/4/25 04:26, Catalin Marinas wrote:
> > On Mon, Oct 13, 2025 at 02:55:32PM +1100, Balbir Singh wrote:
> >> x86 and riscv provide trace points for page-faults (user and kernel
> >> tracepoints). Some scripts [1],[2] rely on these trace points. The
> >> tracepoint is useful for tracking faults and their reasons.
> >>
> >> Adding the tracepoints is simple and straight-forward. For arm64
> >> use esr as error code and untagged memory address as addr.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: Paul Walmsley <pjw@kernel.org>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> Cc: Albert Ou <aou@eecs.berkeley.edu>
> >> Cc: Alexandre Ghiti <alex@ghiti.fr>
> >>
> >> [1] https://www.brendangregg.com/FlameGraphs/memoryflamegraphs.html
> >> [2] https://taras.glek.net/posts/ebpf-mmap-page-fault-tracing/
> >> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >> ---
> >>
> >> Tested at my end with a kernel-compile and running a user space
> >> program to check that the trace points are indeed reported.
> >>
> >>  arch/arm64/mm/fault.c | 9 ++++++++-
> >>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> >> index d816ff44faff..9d7b86e92434 100644
> >> --- a/arch/arm64/mm/fault.c
> >> +++ b/arch/arm64/mm/fault.c
> >> @@ -44,6 +44,9 @@
> >>  #include <asm/tlbflush.h>
> >>  #include <asm/traps.h>
> >>  
> >> +#define CREATE_TRACE_POINTS
> >> +#include <trace/events/exceptions.h>
> >> +
> >>  struct fault_info {
> >>  	int	(*fn)(unsigned long far, unsigned long esr,
> >>  		      struct pt_regs *regs);
> >> @@ -572,8 +575,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >>  	if (faulthandler_disabled() || !mm)
> >>  		goto no_context;
> >>  
> >> -	if (user_mode(regs))
> >> +	if (user_mode(regs)) {
> >>  		mm_flags |= FAULT_FLAG_USER;
> >> +		trace_page_fault_user(addr, regs, esr);
> >> +	} else {
> >> +		trace_page_fault_kernel(addr, regs, esr);
> >> +	}
> > 
> > This has come up before and rejected:
> > 
> > https://lore.kernel.org/all/aG0aIKzxApp9j7X0@willie-the-truck/
> 
> Thanks for the pointer, since it's been five to six months since the
> discussion, I don't see the kprobe handler being merged with the trace
> point.

I was hinting that whoever needs these tracepoints can do the work ;).

> The real issue is that while we fix the issue some scripts are broken
> by default on arm64, see [1] and [2] above and a simple search for
> exceptions:page_fault will show up many more. It's just hard to be
> have all of those break and fix them as and when needed.

Does Steve's proposal in the earlier discussion help with fixing these
scripts:

https://lore.kernel.org/all/20250519120837.794f6738@batman.local.home/

-- 
Catalin

