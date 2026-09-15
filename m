Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C59C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmS0KOQurOkPmzkCa2dgz5OgvzjQL832tBLE9a7yqn4=; b=Co5tiog7KNq9w+zsswAwsoaSab
	RPozNhImMOhjGpc+Hun1r8MdR+jk32YvJy7n7DVZtqXFHYSuzkaXp0PZAp9cKdARGe92HGUU1C1tw
	KFsmvDJkmYG407dn6deMeeS8WIq8DjSPaNxkgh4zhbzpqIaZcFQtMfxFVqdOpgokMtQszB/FK2rmo
	5Io6FZVBbyDgsE6pUI4vtIMrKElWwg/2PeD4z40EbA05qG8/r1fr6Svq677/eb3+FR+QXXFV7aVyC
	ORE82ZKWfAgF4PDS8MD46rj9gvqIDt4vKZgCog/EXY76VKXBmPX0P2Sg7kOmhhoqMYujFXk0E/h9s
	Qrm4HAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QC2-00000005sn3-1vvj;
	Tue, 15 Sep 2026 10:15:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QBz-00000005smb-06Za
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:15:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8652E1570;
	Tue, 15 Sep 2026 03:15:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177D03F7B4;
	Tue, 15 Sep 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789467308; bh=tJvZkCCnnoXmiMi/FLg7xcPqRsF6Tlxz6fq1THgmJjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqlZnbgnqOuvow56NX902rF5GXO4HSTsx+Y6Evco7JvZ81KJeoA8XNNj6xXQCchRl
	 BZ2fBR3ZYATFczlt8dEHv8JCXWzN9o/56Eh8uMS5k2GVEbJ9euEiL9VkcvWn9WWnA/
	 ksBb/47YBpxB+xgl4484pLOCg8rFcdlQ4m50f0Ow=
Date: Tue, 15 Sep 2026 11:15:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Message-ID: <aqkapYE-xtS91laq@J2N7QTR9R3>
References: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
 <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
 <aqkUU-kSTOz8NntH@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkUU-kSTOz8NntH@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_031511_165020_ACB6292E 
X-CRM114-Status: GOOD (  28.47  )
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

On Tue, Sep 15, 2026 at 02:50:27AM -0700, Breno Leitao wrote:
> Hello Mark,
> 
> On Tue, Sep 15, 2026 at 09:39:24AM +0100, Mark Rutland wrote:
> > Hi Breno,
> > 
> > I think the change looks reasonable, but the commit message and comments
> > aren't quite right. More on that below.
> 
> Thank you very much for your review. I know this is not a trivial one
> (at least from my PoV), I am glad you quickly reviewed it.
> 
> I've also dropped few other lines, but kept the benchmark values I've
> collected. Does this look better now?

Yep, that looks good to me, with one minor nit below.

With that fixed up, this all looks good. I assume you'll send a v2.

> Author: Breno Leitao <leitao@debian.org>
> Date:   Fri Sep 11 02:57:34 2026 -0700
> 
>     arm64/sve: Don't zero the SVE state buffer when the SVE state is live
> 
>     Currently do_sve_acc() always zeroes current->thread.sve_state. This is
>     not necessary in the common case, and avoiding the zeroing has a
>     measurable impact on some benchmarks.
> 
>     In the common case where the task is not preempted and its state is not
>     altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
>     is clear. In such cases, only the live register values matter, and the
>     in-memory copy is stale regardless of whether it is saved in
>     FP_STATE_FPSIMD format or FP_STATE_SVE format.
> 
>     This is worth doing because the SVE state is discarded on syscall entry,
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^

That should say something like "It is worth skipping the zeroing
because". We deleted the line saying that skipping the zeroing was safe,
and so it's not clear what "this" is referring to.

Mark.

>     so userspace that mixes SVE and syscalls re-traps constantly. A fleet
>     profile of arm64 hosts running services whose memset() is SVE shows the
>     memset under do_sve_acc() accounting for 29% of the trap handling cost.
> 
>     Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
>     performance governor) with perf bench sched pipe pinned to one CPU, and
>     SVE operation on write, so that each loop also takes an SVE access trap.
> 
>             * -0.99% kernel instructions
>             * -1.38% kernel cycles
>             * -1.12% wall clock
> 
>     Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e7f1682a3059b..324c9799b0511 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>                 return;
>         }
> 
> -       sve_alloc(current, true);
> +       sve_alloc(current, false);
>         if (!current->thread.sve_state) {
>                 force_sig(SIGKILL);
>                 return;
> @@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
>                 sve_flush_live();
>                 fpsimd_bind_task_to_cpu();
>         } else {
> +               memset(current->thread.sve_state, 0, sve_state_size(current));
>                 fpsimd_to_sve(current);
>                 current->thread.fp_type = FP_STATE_SVE;
>                 fpsimd_flush_task_state(current);

