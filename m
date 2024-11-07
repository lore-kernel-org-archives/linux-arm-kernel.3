Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A0D5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhIcSe1txNfkCnP7MPXpnY6tOWGMY/4eAudpBxJaXiU=; b=SVyYSsGZDs4G8EKPFxZqgmtLdl
	ypA+1e79sAjTaWR17jO7x3hnEbHn+2CFdzuWbSfnLTpE+p7wjsTtm4vKegtEWNowjd6/k4o8BLvwl
	h4iATaBt0AunO/VFH7gCD0lQsYzPvy5Cf47Q6MTLpcjxyzlwd9rql2ceAQiWOOFFjmwVavWw3nwgO
	2QFrqVZsU0dpUbQX0zC4J5NltNWBvjZMrpp3dZdUUG6fDRkju0T7Dtz9nhWOIMrllkAD+CMIzsJ2u
	wONQdrIfGFHHNSs8QQ2UvjttRWTbfRjMySl832I7vYi54e2KM/fW4uGYd9FU7oEKMJyZCjkS6G0Tu
	+60o9tZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t998K-00000008F7j-0RzL;
	Thu, 07 Nov 2024 20:29:36 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zo-00000008E4s-2Txv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e30daaf5928so2627245276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010847; x=1731615647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KhIcSe1txNfkCnP7MPXpnY6tOWGMY/4eAudpBxJaXiU=;
        b=qokIMZUC8wxmxLdV80Mbm6qZwESzoieGm/ObC3zkh+2x/SOzv8mRvwiDYVgq6RP+2i
         dWz4D5O9EwOMBd9/box7RqaUAcEUl20dJLSV28k71QbL9WOU1xmdK8/oJ0Hwg6bBRogW
         XBmf7e5sgXUYZ/NHBQSUEzCHEVQJ1MpXFvtcefCOaBBPFBefuZt/Qo455131lYOJeLod
         CzX3Oh2SufAa5w/zkdT0xS6Tzo2n1B9uPvgMg0G/+/C2ZWylOAP0p/Kxrtf0pVddRXcD
         n+yOdT1jJzHOI98kVPbV464odyukU/ZESsSIkxFVONQDVQzU7jkRtE4I3sBU+A5/x9lc
         G75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010847; x=1731615647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhIcSe1txNfkCnP7MPXpnY6tOWGMY/4eAudpBxJaXiU=;
        b=rYAeqt+Rj+s0ejfxdtEGO0mG2pwBCq+t/hPPu9BX3rOk+WLxjnXvzaOMrqXohYdsaL
         18/w+6+9BxO3C54014kYiGED9iEBPfAYC08oCRSfEMGpSFvp6O2hZgJGAQIgXICMzoa/
         +ko8g+TwChonGqIkyQJLIWz2+33xThzt+byPsuhIENQzgFg2/uLBVEHtMA9S2rgKlvrs
         JUY9GuWWo5sxaR3CeE0X3oTLAATQwd6s4HxUzmkkUWuChtd911nWeyM5uQls/gq6cx+x
         ADahCgDigYc4VcJkfEXOADpgdbV3YwMndaMCuFD7t3Ci+5tYFWhWGWhuGJvSpSEYJelu
         QW/w==
X-Forwarded-Encrypted: i=1; AJvYcCXccqwvjxgNekKjMib7xkwb6E1uQQk05V99Fo0fNLk8PZJVFtiNv233ZccHHSYwwWMVz91iRLSI3TG4Ygzk1493@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6psFu05g2vnEd0OEeD2UezxT0rv63WfYtk3IjCPh7QRNf7Ph9
	y1vENFPPKp2Nwg+g8crDW3dYAV0TN9G9k+9rjFYiT9uYRsBZYb3L22M4DlDj6uQAbba0n/cE9V+
	M/w==
X-Google-Smtp-Source: AGHT+IEnJ0e357/3OotzjsP9lexlQ5CBUwlEpVYwPI3w1zjYPdS8y4hVyHrOYLJ8xSQLJ2NE0kbCcYElb98=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a25:bc84:0:b0:e2b:d0e9:1cdc with SMTP id
 3f1490d57ef6-e337f908f8dmr320276.10.1731010847379; Thu, 07 Nov 2024 12:20:47
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:31 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-5-yuzhao@google.com>
Subject: [PATCH v2 4/6] arm64: broadcast IPIs to pause remote CPUs
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122048_762582_5378C383 
X-CRM114-Status: GOOD (  22.80  )
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

Broadcast pseudo-NMI IPIs to pause remote CPUs for a short period of
time, and then reliably resume them when the local CPU exits critical
sections that preclude the execution of remote CPUs.

A typical example of such critical sections is BBM on kernel PTEs.
HugeTLB Vmemmap Optimization (HVO) on arm64 was disabled by
commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the folllowing reason:

  This is deemed UNPREDICTABLE by the Arm architecture without a
  break-before-make sequence (make the PTE invalid, TLBI, write the
  new valid PTE). However, such sequence is not possible since the
  vmemmap may be concurrently accessed by the kernel.

Supporting BBM on kernel PTEs is one of the approaches that can make
HVO safe on arm64.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/include/asm/smp.h |  3 ++
 arch/arm64/kernel/smp.c      | 85 +++++++++++++++++++++++++++++++++---
 2 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 2510eec026f7..cffb0cfed961 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -133,6 +133,9 @@ bool cpus_are_stuck_in_kernel(void);
 extern void crash_smp_send_stop(void);
 extern bool smp_crash_stop_failed(void);
 
+void pause_remote_cpus(void);
+void resume_remote_cpus(void);
+
 #endif /* ifndef __ASSEMBLY__ */
 
 #endif /* ifndef __ASM_SMP_H */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..54e9f6374aa3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -85,7 +85,12 @@ static int ipi_irq_base __ro_after_init;
 static int nr_ipi __ro_after_init = NR_IPI;
 static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
 
-static bool crash_stop;
+enum {
+	SEND_STOP,
+	CRASH_STOP,
+};
+
+static unsigned long stop_in_progress;
 
 static void ipi_setup(int cpu);
 
@@ -917,6 +922,72 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
 #endif
 }
 
+static DEFINE_RAW_SPINLOCK(cpu_pause_lock);
+static bool __cacheline_aligned_in_smp cpu_paused;
+static atomic_t __cacheline_aligned_in_smp nr_cpus_paused;
+
+static void pause_local_cpu(void)
+{
+	atomic_inc(&nr_cpus_paused);
+
+	while (READ_ONCE(cpu_paused))
+		cpu_relax();
+
+	atomic_dec(&nr_cpus_paused);
+
+	/*
+	 * The caller of resume_remote_cpus() should make sure that clearing
+	 * cpu_paused is ordered after other changes that can have any impact on
+	 * this CPU. The isb() below makes sure this CPU doesn't speculatively
+	 * execute the next instruction before it sees all those changes.
+	 */
+	isb();
+}
+
+void pause_remote_cpus(void)
+{
+	cpumask_t cpus_to_pause;
+	int nr_cpus_to_pause = num_online_cpus() - 1;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_preemption_disabled();
+
+	if (!nr_cpus_to_pause)
+		return;
+
+	cpumask_copy(&cpus_to_pause, cpu_online_mask);
+	cpumask_clear_cpu(smp_processor_id(), &cpus_to_pause);
+
+	raw_spin_lock(&cpu_pause_lock);
+
+	WARN_ON_ONCE(cpu_paused);
+	WARN_ON_ONCE(atomic_read(&nr_cpus_paused));
+
+	cpu_paused = true;
+
+	smp_cross_call(&cpus_to_pause, IPI_CPU_STOP_NMI);
+
+	while (atomic_read(&nr_cpus_paused) != nr_cpus_to_pause)
+		cpu_relax();
+
+	raw_spin_unlock(&cpu_pause_lock);
+}
+
+void resume_remote_cpus(void)
+{
+	if (!cpu_paused)
+		return;
+
+	raw_spin_lock(&cpu_pause_lock);
+
+	WRITE_ONCE(cpu_paused, false);
+
+	while (atomic_read(&nr_cpus_paused))
+		cpu_relax();
+
+	raw_spin_unlock(&cpu_pause_lock);
+}
+
 static void arm64_backtrace_ipi(cpumask_t *mask)
 {
 	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
@@ -970,7 +1041,9 @@ static void do_handle_IPI(int ipinr)
 
 	case IPI_CPU_STOP:
 	case IPI_CPU_STOP_NMI:
-		if (IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop) {
+		if (!test_bit(SEND_STOP, &stop_in_progress)) {
+			pause_local_cpu();
+		} else if (test_bit(CRASH_STOP, &stop_in_progress)) {
 			ipi_cpu_crash_stop(cpu, get_irq_regs());
 			unreachable();
 		} else {
@@ -1142,7 +1215,6 @@ static inline unsigned int num_other_online_cpus(void)
 
 void smp_send_stop(void)
 {
-	static unsigned long stop_in_progress;
 	cpumask_t mask;
 	unsigned long timeout;
 
@@ -1154,7 +1226,7 @@ void smp_send_stop(void)
 		goto skip_ipi;
 
 	/* Only proceed if this is the first CPU to reach this code */
-	if (test_and_set_bit(0, &stop_in_progress))
+	if (test_and_set_bit(SEND_STOP, &stop_in_progress))
 		return;
 
 	/*
@@ -1230,12 +1302,11 @@ void crash_smp_send_stop(void)
 	 * This function can be called twice in panic path, but obviously
 	 * we execute this only once.
 	 *
-	 * We use this same boolean to tell whether the IPI we send was a
+	 * We use the CRASH_STOP bit to tell whether the IPI we send was a
 	 * stop or a "crash stop".
 	 */
-	if (crash_stop)
+	if (test_and_set_bit(CRASH_STOP, &stop_in_progress))
 		return;
-	crash_stop = 1;
 
 	smp_send_stop();
 
-- 
2.47.0.277.g8800431eea-goog


