Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303C8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asdtHyOxrsyIEJE6QOHklaoHZ3HZdrzK5ArDDfPwtbc=; b=vTRkItRHjfgzxLpjKSc8vFcyzE
	OkfBZC6t0K8JfetBMuTyHw3aO3AFCLzfF8HjoQk2uBDD87CFPvI4pvDwYhaKsrgy2L9CplimDVFF6
	1gTdibNvBLt0+b563pWNuusR23Hf1xXMszaRy/dZJC/tC6svaf3K1cb6ELaL98xFNlZ7Mnm5iPX0G
	ifuUjoETrteLGEYKREjK9BDS+UweWKtBTio6iLhLv1NKzrFn6XbjGoRKuAQfZQDNiPIJoAQqB9yvn
	NSvJH5Na/05MpnjOGTbm8+PBC+fB0sy2btopeG58BDYeX5MHuOHZtTWu4yUJrsWCEgtX+yJMMS+sR
	dq+KUWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGh73-0000000E8yK-1YRm;
	Wed, 05 Nov 2025 17:16:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGh70-0000000E8xl-0wpB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:15:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3437C169C;
	Wed,  5 Nov 2025 09:15:47 -0800 (PST)
Received: from arm.com (unknown [10.1.26.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 513D83F63F;
	Wed,  5 Nov 2025 09:15:54 -0800 (PST)
Date: Wed, 5 Nov 2025 17:15:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQuGR1fx2qBrJSA-@arm.com>
References: <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
 <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_091558_308694_6B4ACA1A 
X-CRM114-Status: GOOD (  17.94  )
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

On Wed, Nov 05, 2025 at 08:25:51AM -0800, Paul E. McKenney wrote:
> On Wed, Nov 05, 2025 at 03:34:21PM +0000, Catalin Marinas wrote:
> > Given that this_cpu_*() are meant for the local CPU, there's less risk
> > of cache line bouncing between CPUs, so I'm happy to change them to
> > either use PRFM or LDADD (I think I prefer the latter). This would not
> > be a generic change for the other atomics, only the per-CPU ones.
> 
> I have easy access to only the one type of ARM system, and of course
> the choice must be driven by a wide range of systems.  But yes, it
> would be much better if we can just use this_cpu_inc().  I will use the
> non-atomics protected by interrupt disabling in the meantime, but look
> forward to being able to switch back.

BTW, did you find a problem with this_cpu_inc() in normal use with SRCU
or just in a microbenchmark hammering them? From what I understand from
the hardware folk, doing STADD in a loop saturates some queues in the
interconnect and slows down eventually. In normal use, it's just a
posted operation not affecting the subsequent instructions (or at least
that's the theory).

-- 
Catalin

