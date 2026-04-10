Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D1F44852
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iW0Oo2aQRVWsQ+KWRJUXjD4J1PF0F2a9N+D1rSRgV5Y=; b=XPNqBX1vjVkXTl3B5ejntfyUfN
	tweF4gCBnT/9+qgxkK68rnAu705fq+sTJzyC12AAmUqyATuaEemUanaRkxeRHrYGkpvhuCbuJdF1d
	RYuIIbmniPxpeS0/j0TMeROo6SuvEO88O2wrbySbd5sYTmN3mo5jPx0oUsIJZVzrrsfrlOO10cguu
	BOTZJ0zJx2/A8ancBohh7dxmxgE26y2DhhwEXovbVgWu2Da6MS+o3OtjN6itSnqM9QV4/mSawLVhU
	LJRWx0DmtRf9mtS13uSTaY7FlnLX2JGzBIZAdDPYExIMopcdCsOS6FHTrpCyYuppeNbOJsYyv9Ddu
	Z/Osfu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBOv-0000000CHF0-1J8u;
	Fri, 10 Apr 2026 12:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBOs-0000000CHEf-3KsC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92FFF2682;
	Fri, 10 Apr 2026 05:55:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D0343F632;
	Fri, 10 Apr 2026 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775825753; bh=EgtBwMlpyhfM8ZfymPNKAwWg1Gmr8wIYYbKMCE5HI7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B163r15tUe0QKU3ATwxo1U4H9n2y1NU+HKxcQKQDAJXlJiPK1bH3fk0fuJ+KgO627
	 KioUVJuK0kpwckx39uUgR8urd3G+bwUZm6boljVwzgBbNXQIf2BOhLcYzm1flLAjut
	 FgKizL99xLGx6QBbSwRWpZiymLmXpvytS/1LUaeI=
Date: Fri, 10 Apr 2026 13:55:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 4/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <adjzVTjEOz7DGmW4@arm.com>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
 <20260407102848.2266988-5-catalin.marinas@arm.com>
 <adjohQBfrHVc1HIh@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjohQBfrHVc1HIh@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_055554_955693_05545821 
X-CRM114-Status: GOOD (  21.54  )
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

On Fri, Apr 10, 2026 at 01:09:41PM +0100, Will Deacon wrote:
> On Tue, Apr 07, 2026 at 11:28:44AM +0100, Catalin Marinas wrote:
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index 489554931231..4c328b7c79ba 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/reboot.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/init.h>
> > +#include <linux/cpumask.h>
> >  #include <linux/cpu.h>
> >  #include <linux/elfcore.h>
> >  #include <linux/pm.h>
> > @@ -339,8 +340,41 @@ void flush_thread(void)
> >  	flush_gcs();
> >  }
> >  
> > +#ifdef CONFIG_ARM64_ERRATUM_4193714
> > +
> > +static void arch_dup_tlbbatch_mask(struct task_struct *dst)
> > +{
> > +	/*
> > +	 * Clear the inherited cpumask with memset() to cover both cases where
> > +	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
> > +	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
> > +	 */
> > +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> > +		memset(&dst->tlb_ubc.arch.cpumask, 0,
> > +		       sizeof(dst->tlb_ubc.arch.cpumask));
> 
> nit: use cpumask_clear() instead?

I tried to explain in the comment above. The memset() is on purpose to
avoid #ifdef CPUMASK_OFFSTACK. When enabled, cpumask_var_t is a pointer
and we want it set to NULL (for later lazy allocation) rather than
clearing the parent's cpumask. I had the diff below initially but it
looked uglier. Or we make the erratum dependent on !CPUMASK_OFFSTACK but
it won't get compile coverage with defconfig.

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 4c328b7c79ba..9294cbd35cce 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -345,13 +345,18 @@ void flush_thread(void)
 static void arch_dup_tlbbatch_mask(struct task_struct *dst)
 {
 	/*
-	 * Clear the inherited cpumask with memset() to cover both cases where
-	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
-	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
+	 * Don't inherit the parent's tlbbatch cpumask.
+	 *
+	 * With CPUMASK_OFFSTACK=y, cpumask_var_t is a pointer. Reset it so
+	 * that it will be allocated lazily in sme_dvmsync_add_pending().
 	 */
-	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
-		memset(&dst->tlb_ubc.arch.cpumask, 0,
-		       sizeof(dst->tlb_ubc.arch.cpumask));
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
+#ifdef CONFIG_CPUMASK_OFFSTACK
+		dst->tlb_ubc.arch.cpumask = NULL;
+#else
+		cpumask_clear(dst->tlb_ubc.arch.cpumask);
+#endif
+	}
 }

 static void arch_release_tlbbatch_mask(struct task_struct *tsk)

-- 
Catalin

