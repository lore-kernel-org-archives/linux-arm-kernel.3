Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE76CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEt2p85UGlC+p8GUov8Q7etScVc1d7g2fHJIJNEvYEo=; b=oFxTs56sOrdK6xbIhEx2XOZo2B
	2EoK+ahIjGDNBozM0R2Dt+Y7hr2Y1ntp6G3Ohhiswn21OKxsQeQ54iS1aPhrG5q2ZeIrID68NfZGI
	AFx6XBmDtlp7E0j5UHljBDof4FgsxhlZTydV8yfvMy+vbY7ybxbBaStyfmQ2GelLcuc64Q0tlEo+C
	m7/IeNpxE58QJz6DUGJVfSOkrIkYLYmWgRFlL56L9+2vjFGB33Vp7CBFAs3uCpGGpEIqVm/FXcaVA
	I/kHTVnhJ144f0N+McDSZ4XACxf3xjHX6oWlS0Uu520oG4kGgeHD2pEsW2dd8wY2wf6bxYCFLgYzf
	73NRrfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEttV-00000006cd9-1ZC2;
	Fri, 31 Oct 2025 18:30:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEttU-00000006ccy-0dq8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F0C4602BB;
	Fri, 31 Oct 2025 18:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A64C4CEE7;
	Fri, 31 Oct 2025 18:30:33 +0000 (UTC)
Date: Fri, 31 Oct 2025 18:30:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQUAR9MRxP6_qtEH@arm.com>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
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

On Thu, Oct 30, 2025 at 03:37:00PM -0700, Paul E. McKenney wrote:
> To make event tracing safe for PREEMPT_RT kernels, I have been creating
> optimized variants of SRCU readers that use per-CPU atomics.  This works
> quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
> srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
> per-CPU atomic operation.  This contrasts with a handful of nanoseconds
> on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).

That's quite a difference. Does it get any better if
CONFIG_ARM64_LSE_ATOMICS is disabled? We don't have a way to disable it
on the kernel command line.

Depending on the implementation and configuration, the LSE atomics may
skip the L1 cache and be executed closer to the memory (they used to be
called far atomics). The CPUs try to be smarter like doing the operation
"near" if it's in the cache but the heuristics may not always work.

Interestingly, we had this patch recently to force a prefetch before the
atomic:

https://lore.kernel.org/all/20250724120651.27983-1-yangyicong@huawei.com/

We rejected it but I wonder whether it improves the SRCU scenario.

-- 
Catalin

