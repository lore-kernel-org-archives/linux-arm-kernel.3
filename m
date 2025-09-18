Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED31CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnlbipUC3BtCqbOzytdCCPdPTAzXEzDZ9KbLPbjkFP8=; b=Ki6QBBOJLvHCjtcSXcYsAPZmHA
	Wjzz7awFFHzQk+zh8jtaJOX+ltCGJ/RyX6ehrdqIdG2d+V2h9t+O3+jn7HNovo6xraTiHmbjo//GD
	LQH2QmTL2cUxTZktkQOmgu6w3WVnk35Ef+w0UxIaCSIaOg3OS0Ob25/NAU+i0Nq/IXudetXKqL7Lw
	5wyusZgBRuJ7Bk4Lf2JCIkbQ0hyxF6LlapK3WMO/La1OSKcD5Nl2DVVtOrlaHrniWWhoPgS5xFqhQ
	rswTf7/Ge5FBHF7yHnzQVdGMoUKmTLwNpk4Aw2pQ2Uz2ZZWblMjZ1TNi1s0nCFzcy5XDo8Zgsu//N
	+Gmd0qYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCo8-0000000HDVl-0CqR;
	Thu, 18 Sep 2025 11:28:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCo5-0000000HDUT-3vfx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F27843CBA;
	Thu, 18 Sep 2025 11:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E27C4CEE7;
	Thu, 18 Sep 2025 11:28:07 +0000 (UTC)
Date: Thu, 18 Sep 2025 12:28:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: shechenglong <shechenglong@xfusion.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stone.xulei@xfusion.com,
	chenjialong@xfusion.com, yuxiating@xfusion.com
Subject: Re: [PATCH] cpu: fix hard lockup triggered during stress-ng stress
 testing.
Message-ID: <aMvsxd8nHb5roC0o@arm.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918064907.1832-1-shechenglong@xfusion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_042810_013575_B65284C2 
X-CRM114-Status: GOOD (  25.93  )
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

On Thu, Sep 18, 2025 at 02:49:07PM +0800, shechenglong wrote:
> Context of the Issue:
> In an ARM64 environment, the following steps were performed:
> 
> 1. Repeatedly ran stress-ng to stress the CPU, memory, and I/O.
> 2. Cyclically executed test case pty06 from the LTP test suite.
> 3. Added mitigations=off to the GRUB parameters.
> 
> After 1–2 hours of stress testing, a hardlockup occurred,
> causing a system crash.
> 
> Root Cause of the Hardlockup:
> Each time stress-ng starts, it invokes the /sys/kernel/debug/clear_warn_once
> interface, which clears the values in the memory section from __start_once
> to __end_once. This caused functions like pr_info_once() — originally
> designed to print only once — to print again every time stress-ng was called.
> If the pty06 test case happened to be using the serial module at that same
> moment, it would sleep in waiter.list within the __down_common function.
> 
> After pr_info_once() completed its output using the serial module,
> it invoked the semaphore up() function to wake up the process waiting
> in waiter.list. This sequence triggered an A-A deadlock, ultimately
> leading to a hardlockup and system crash.
> 
> To prevent this, a local variable should be used to control and ensure
> the print operation occurs only once.
> 
> Hard lockup call stack:
> 
> _raw_spin_lock_nested+168
> ttwu_queue+180 （rq_lock(rq, &rf); 2nd acquiring the rq->__lock）
> try_to_wake_up+548
> wake_up_process+32
> __up+88
> up+100
> __up_console_sem+96
> console_unlock+696
> vprintk_emit+428
> vprintk_default+64
> vprintk_func+220
> printk+104
> spectre_v4_enable_task_mitigation+344
> __switch_to+100
> __schedule+1028 (rq_lock(rq, &rf); 1st acquiring the rq->__lock)
> schedule_idle+48
> do_idle+388
> cpu_startup_entry+44
> secondary_start_kernel+352

Is the problem actually that we call the spectre v4 stuff on the
switch_to() path (we can't change this) under the rq_lock() and it
subsequently calls printk() which takes the console semaphore? I think
the "once" aspect makes it less likely but does not address the actual
problem.

> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index edf1783ffc81..f8663157e041 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -424,8 +424,10 @@ static bool spectre_v4_mitigations_off(void)
>  	bool ret = cpu_mitigations_off() ||
>  		   __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
>  
> -	if (ret)
> -		pr_info_once("spectre-v4 mitigation disabled by command-line option\n");
> +	static atomic_t __printk_once = ATOMIC_INIT(0);
> +
> +	if (ret && !atomic_cmpxchg(&__printk_once, 0, 1))
> +		pr_info("spectre-v4 mitigation disabled by command-line option\n");
>  
>  	return ret;
>  }

I think we should just avoid the printk() on the
spectre_v4_enable_task_mitigation() path. Well, I'd remove it altogether
from the spectre_v4_mitigations_off() as it's called on kernel entry as
well. Just add a different way to print the status during kernel boot if
there isn't one already, maybe an initcall.

-- 
Catalin

