Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F262C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUH0tIJOVwWDFNy2+9dmZOhPrE/5Fvoqxfp+0bTHgrI=; b=BOle0M8kGfc0v/97LX3Aq0nXx6
	1Wa2hHpPAcrsZH6aHAhSo775QMgagcRRWgEUB5Au4vuKmoT3WZQJc/IaMLkBxqQMi+WKf7nzMlJ0Y
	YuycBXVW4+PxCJ3lzlfROlMzWOBn75ZgVPIMapIcwNNEosHvZ0P9pZmHUMwcJ2mVxumVdrNtEQRFx
	Nudyl2sV1+Izy3ndHpVjCeQ+S15ljpgU90eSkqxEmBRfugn3L2JRq11EnCrfvpt7cu2k/ww2m2cvI
	YpGbTLA0/H9jn8yeW+sGBOH7epAC1+ZRUKh0gwEDHpIfprfHPLDoTXKI27xjX3rwXLJcfPTXR77hv
	Ykpp6dxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFDY-0000000F5uj-2eYm;
	Fri, 11 Jul 2025 14:59:16 +0000
Received: from [2001:8b0:10b:1236:d4b0:a112:9c86:6a4b] (helo=casper.infradead.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE7B-0000000Ewn9-2sEl
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tUH0tIJOVwWDFNy2+9dmZOhPrE/5Fvoqxfp+0bTHgrI=; b=ILSyCxPbk9iapgeHlg4wA4zdDm
	lO8IwymKmEFClv4NLy7s1kVZAteH8c9eQg/Zw80qWFIqwNkSVOvx1Kcofm7oF5VOxM7OjiTMLyukj
	6CrTpwLxe2sdVRcN1KJN39vynhDYc4PPOlttlR/7/iOcMcDts42+IvYh+bLP5mVA6gvyj47/vwQdV
	hqzmPYBzqd3LWdPotluHFfUBwtgaVNc+xuZ01DVi11lGFk7LCRkNsrWHtI16FKBXjf5Aqn+lPmQKL
	07mbIPOyVpRo6s9rCf4R/I2+myctI6Os1ssVStTLFPhaXGo4DPV1QV/RzcanSRYTmPS7j71utJ33m
	uP3ltx1w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE77-0000000DBNW-3Hvg;
	Fri, 11 Jul 2025 13:48:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2C35D3001AA; Fri, 11 Jul 2025 15:48:33 +0200 (CEST)
Date: Fri, 11 Jul 2025 15:48:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [RFC PATCH 7/7] arm64/efi: Call EFI runtime services without
 disabling preemption
Message-ID: <20250711134833.GI905792@noisy.programming.kicks-ass.net>
References: <20250514174339.1834871-9-ardb+git@google.com>
 <20250514174339.1834871-16-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514174339.1834871-16-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_064837_722685_CA7448C3 
X-CRM114-Status: GOOD (  24.10  )
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

On Wed, May 14, 2025 at 07:43:47PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The only remaining reason why EFI runtime services are invoked with
> preemption disabled is the fact that the mm is swapped out behind the
> back of the context switching code.
> 
> The kernel no longer disables preemption in kernel_neon_begin().
> Furthermore, the EFI spec is being clarified to explicitly state that
> only baseline FP/SIMD is permitted in EFI runtime service
> implementations, and so the existing kernel mode NEON context switching
> code is sufficient to preserve and restore the execution context of an
> in-progress EFI runtime service call.
> 
> Most EFI calls are made from the efi_rts_wq, which is serviced by a
> kthread. As kthreads never return to user space, they usually don't have
> an mm, and so we can use the existing infrastructure to swap in the
> efi_mm while the EFI call is in progress. This is visible to the
> scheduler, which will therefore reactivate the selected mm when
> switching out the kthread and back in again.
> 
> Given that the EFI spec explicitly permits runtime services to be called
> with interrupts enabled, firmware code is already required to tolerate
> interruptions. So rather than disable preemption, disable only migration
> so that EFI runtime services are less likely to cause scheduling delays.
> 
> Note, though, that the firmware executes at the same privilege level as
> the kernel, and is therefore able to disable interrupts altogether.

Is the migrate_disable() strictly required, or just paranoia?

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/efi.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 5d188c6c44d7..1c86a891f6d7 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -10,6 +10,7 @@
>  #include <linux/efi.h>
>  #include <linux/init.h>
>  #include <linux/kmemleak.h>
> +#include <linux/kthread.h>
>  #include <linux/screen_info.h>
>  #include <linux/vmalloc.h>
>  
> @@ -176,7 +177,12 @@ bool arch_efi_call_virt_setup(void)
>  	if (WARN_ON(down_trylock(&efi_rt_lock)))
>  		return false;
>  
> -	efi_virtmap_load();
> +	if (preemptible() && (current->flags & PF_KTHREAD)) {
> +		migrate_disable();
> +		kthread_use_mm(&efi_mm);
> +	} else {
> +		efi_virtmap_load();
> +	}
>  	uaccess_ttbr0_enable();
>  	post_ttbr_update_workaround();
>  	__efi_fpsimd_begin();
> @@ -186,7 +192,12 @@ bool arch_efi_call_virt_setup(void)
>  void arch_efi_call_virt_teardown(void)
>  {
>  	__efi_fpsimd_end();
> -	efi_virtmap_unload();
> +	if (preemptible() && (current->flags & PF_KTHREAD)) {
> +		kthread_unuse_mm(&efi_mm);
> +		migrate_enable();
> +	} else {
> +		efi_virtmap_unload();
> +	}
>  	uaccess_ttbr0_disable();
>  	up(&efi_rt_lock);
>  }
> -- 
> 2.49.0.1101.gccaa498523-goog
> 

