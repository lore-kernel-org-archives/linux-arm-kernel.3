Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4CECA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yThsMOzk6Z0BWjxXLqu+GMM5gml9j+cHqxJDPj/OiDo=; b=BhvY/XxRN13q5KrwzcGRMPMOgs
	CZBZew3pau18o1DVcKlvkz1PCSm/8oQLv0ktivhrJEJu7LS7uL9JyjpHJ8AEcay3kq5AGQiTgiXnV
	BXZNtlYxhyDQd4AORf4dc59IWUGUdlP/orLIGuKhd0XJogsW0PW9IljSO9XqkbORdjrBLhq9JiaBV
	XnRCkLBfJzrG8cplBmLIrfmEZLwna0zXPotD6UuNILUMcpQQGqDQtYLeUxFcKU8yUQlMt8rsmRC80
	UxyupILYfPSVw++DNZWVYvvhQHW4tIZXjIELGuQSaO32izScgGDnvqKFZiEG1h+4yCWjZVizUy4/X
	frVre5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j5m-0000000AwRL-1N8W;
	Mon, 22 Sep 2025 16:08:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j5j-0000000AwQt-3oqn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052771424;
	Mon, 22 Sep 2025 09:08:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F13CA3F694;
	Mon, 22 Sep 2025 09:08:35 -0700 (PDT)
Date: Mon, 22 Sep 2025 17:08:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: shechenglong <shechenglong@xfusion.com>, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stone.xulei@xfusion.com, chenjialong@xfusion.com,
	yuxiating@xfusion.com
Subject: Re: [PATCH] cpu: fix hard lockup triggered during stress-ng stress
 testing.
Message-ID: <aNF0gb1iZndz0-be@J2N7QTR9R3>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <aMvsxd8nHb5roC0o@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMvsxd8nHb5roC0o@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_090840_074817_038645CB 
X-CRM114-Status: GOOD (  32.20  )
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

On Thu, Sep 18, 2025 at 12:28:05PM +0100, Catalin Marinas wrote:
> On Thu, Sep 18, 2025 at 02:49:07PM +0800, shechenglong wrote:
> > Context of the Issue:
> > In an ARM64 environment, the following steps were performed:
> > 
> > 1. Repeatedly ran stress-ng to stress the CPU, memory, and I/O.
> > 2. Cyclically executed test case pty06 from the LTP test suite.
> > 3. Added mitigations=off to the GRUB parameters.
> > 
> > After 1–2 hours of stress testing, a hardlockup occurred,
> > causing a system crash.
> > 
> > Root Cause of the Hardlockup:
> > Each time stress-ng starts, it invokes the /sys/kernel/debug/clear_warn_once
> > interface, which clears the values in the memory section from __start_once
> > to __end_once. This caused functions like pr_info_once() — originally
> > designed to print only once — to print again every time stress-ng was called.
> > If the pty06 test case happened to be using the serial module at that same
> > moment, it would sleep in waiter.list within the __down_common function.
> > 
> > After pr_info_once() completed its output using the serial module,
> > it invoked the semaphore up() function to wake up the process waiting
> > in waiter.list. This sequence triggered an A-A deadlock, ultimately
> > leading to a hardlockup and system crash.
> > 
> > To prevent this, a local variable should be used to control and ensure
> > the print operation occurs only once.
> > 
> > Hard lockup call stack:
> > 
> > _raw_spin_lock_nested+168
> > ttwu_queue+180 （rq_lock(rq, &rf); 2nd acquiring the rq->__lock）
> > try_to_wake_up+548
> > wake_up_process+32
> > __up+88
> > up+100
> > __up_console_sem+96
> > console_unlock+696
> > vprintk_emit+428
> > vprintk_default+64
> > vprintk_func+220
> > printk+104
> > spectre_v4_enable_task_mitigation+344
> > __switch_to+100
> > __schedule+1028 (rq_lock(rq, &rf); 1st acquiring the rq->__lock)
> > schedule_idle+48
> > do_idle+388
> > cpu_startup_entry+44
> > secondary_start_kernel+352
> 
> Is the problem actually that we call the spectre v4 stuff on the
> switch_to() path (we can't change this) under the rq_lock() and it
> subsequently calls printk() which takes the console semaphore? I think
> the "once" aspect makes it less likely but does not address the actual
> problem.

Agreed; I think what we do here is structurally wrong, even if (in the
asbence of writes to the 'clear_warn_once' file) this happens to largely
do what we want today.

We really shouldn't print in accessors for kernel state.

> > diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> > index edf1783ffc81..f8663157e041 100644
> > --- a/arch/arm64/kernel/proton-pack.c
> > +++ b/arch/arm64/kernel/proton-pack.c
> > @@ -424,8 +424,10 @@ static bool spectre_v4_mitigations_off(void)
> >  	bool ret = cpu_mitigations_off() ||
> >  		   __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
> >  
> > -	if (ret)
> > -		pr_info_once("spectre-v4 mitigation disabled by command-line option\n");
> > +	static atomic_t __printk_once = ATOMIC_INIT(0);
> > +
> > +	if (ret && !atomic_cmpxchg(&__printk_once, 0, 1))
> > +		pr_info("spectre-v4 mitigation disabled by command-line option\n");
> >  
> >  	return ret;
> >  }
> 
> I think we should just avoid the printk() on the
> spectre_v4_enable_task_mitigation() path. Well, I'd remove it altogether
> from the spectre_v4_mitigations_off() as it's called on kernel entry as
> well. Just add a different way to print the status during kernel boot if
> there isn't one already, maybe an initcall.

I agree; I think we want to rip that out of spectre_v2_mitigations_off()
too.

We print a bunch of things under setup_system_capabilities(), so hanging
something off that feels like the right thing to do.

Mark.

