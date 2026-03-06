Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0280AF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pehl7zECjEs7dXJslXQDt3mVrT8jB5OCjTmkCK4PEyU=; b=fcAFKqH11HaJT2HwIayYK6A8LO
	SG0pycOC0GB8wVo+hEMOhEzNKnHZWDt6/qXkd6zRRREFVhvXD2AlrA3wbpyoh7a3Bwwg2SaSCsS9M
	cUglDH7SiNAGi0D7OnxJUyeXQ5d7UVEMAsuW7ecjYnLza1V1un5PJ9zjSDm9ea2SBd0r74QPT0xy0
	EL3X8TCkhxRtbP9aoZRZeZFxnD6AXNV+Up83Xv7wujx9F4r534EDrPZNlXJXbbef36Tw7J0I6unmp
	mJR0SlnmMpyYChH7gJvJ6AWK0YoRNJ+lXZUoFOUm7DGraqEAgNlVebkGdla4J58WJKezXD7o5Lmui
	nHnxHW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyU9I-00000003dKU-2Tmo;
	Fri, 06 Mar 2026 12:19:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyU9G-00000003dK9-0Vay
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:19:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0577F497;
	Fri,  6 Mar 2026 04:19:10 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADEFC3F694;
	Fri,  6 Mar 2026 04:19:14 -0800 (PST)
Date: Fri, 6 Mar 2026 12:19:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <aarGQNNi1HfrcGyy@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
 <20260302165801.3014607-4-catalin.marinas@arm.com>
 <aamT6-Mvr9nI1unq@willie-the-truck>
 <aarB3iv8963UDn5E@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aarB3iv8963UDn5E@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_041918_281406_F54FC764 
X-CRM114-Status: GOOD (  26.92  )
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

On Fri, Mar 06, 2026 at 12:00:30PM +0000, Catalin Marinas wrote:
> On Thu, Mar 05, 2026 at 02:32:11PM +0000, Will Deacon wrote:
> > On Mon, Mar 02, 2026 at 04:57:56PM +0000, Catalin Marinas wrote:
> > > +void sme_do_dvmsync(void)
> > > +{
> > > +	/*
> > > +	 * This is called from the TLB maintenance functions after the DSB ISH
> > > +	 * to send hardware DVMSync message. If this CPU sees the mask as
> > > +	 * empty, the remote CPU executing sme_set_active() would have seen
> > > +	 * the DVMSync and no IPI required.
> > > +	 */
> > > +	if (cpumask_empty(sme_active_cpus))
> > > +		return;
> > > +
> > > +	preempt_disable();
> > > +	smp_call_function_many(sme_active_cpus, sme_dvmsync_ipi, NULL, true);
> > > +	preempt_enable();
> > > +}
> > 
> > Why do we care about all CPUs using SME, rather than limiting it to the
> > set of CPUs using SME with the mm we've invalidated? This looks like it
> > will result in unnecessary cross-calls when multiple tasks are using SME
> > (especially as the mm flag is only cleared on fork).
> 
> Yes, it's a possibility but I traded it for simplicity. We also have the
> TTU case where we don't have an mm and we don't want to broadcast to all
> CPUs either, hence an sme_active_cpus mask. As I just replied on patch
> 2, for the TLB batching we wouldn't be able to use a cpumask in the
> batching structure since, per the ordering above, we need the DVMSync
> before checking if/where to send the IPI to.
> 
> For the typical TLBI (not TTU), we can track a per-mm mask passed down
> to this function (I have patches doing this but it didn't make a
> significant difference in benchmarks).

Reusing the current mm_cpumask(), something like below. We could also
scrap the MMCF_SME_DVMSYNC flag, though we end up always call
sme_do_dvmsync() and checking the mask, probably more expensive than a
flag check.

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index e3ea0246a4f4..2c77ca41cb14 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -81,7 +81,7 @@ static inline unsigned long get_trans_granule(void)
 }
 
 #ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
-void sme_do_dvmsync(void);
+void sme_do_dvmsync(struct mm_struct *mm);
 
 static inline void sme_dvmsync(struct mm_struct *mm)
 {
@@ -90,7 +90,7 @@ static inline void sme_dvmsync(struct mm_struct *mm)
 	if (mm && !test_bit(ilog2(MMCF_SME_DVMSYNC), &mm->context.flags))
 		return;
 
-	sme_do_dvmsync();
+	sme_do_dvmsync(mm);
 }
 #else
 static inline void sme_dvmsync(struct mm_struct *mm) { }
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 90015fc29722..37e215cd0f39 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1378,6 +1378,7 @@ void sme_set_active(unsigned int cpu)
 	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
 		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
 
+	cpumask_set_cpu(cpu, mm_cpumask(current->mm));
 	cpumask_set_cpu(cpu, sme_active_cpus);
 
 	/*
@@ -1398,6 +1399,7 @@ void sme_clear_active(unsigned int cpu)
 	 * With SCTLR_EL1.IESB enabled, the SME memory transactions are
 	 * completed on entering EL1.
 	 */
+	cpumask_clear_cpu(cpu, mm_cpumask(current->mm));
 	cpumask_clear_cpu(cpu, sme_active_cpus);
 }
 
@@ -1410,19 +1412,25 @@ static void sme_dvmsync_ipi(void *unused)
 	 */
 }
 
-void sme_do_dvmsync(void)
+void sme_do_dvmsync(struct mm_struct *mm)
 {
 	/*
 	 * This is called from the TLB maintenance functions after the DSB ISH
 	 * to send hardware DVMSync message. If this CPU sees the mask as
 	 * empty, the remote CPU executing sme_set_active() would have seen
 	 * the DVMSync and no IPI required.
+	 *
+	 * When an mm is provided, limit the IPI to CPUs that are actively
+	 * running SME code for that mm (recorded in mm_cpumask()), otherwise
+	 * fall back to the global sme_active_cpus mask.
 	 */
-	if (cpumask_empty(sme_active_cpus))
+	const struct cpumask *mask = mm ? mm_cpumask(mm) : sme_active_cpus;
+
+	if (cpumask_empty(mask))
 		return;
 
 	preempt_disable();
-	smp_call_function_many(sme_active_cpus, sme_dvmsync_ipi, NULL, true);
+	smp_call_function_many(mask, sme_dvmsync_ipi, NULL, true);
 	preempt_enable();
 }
 

