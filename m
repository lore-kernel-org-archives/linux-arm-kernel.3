Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C29FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzNyR2HlMXOukF/3S2pr1XErr8UIrfUNIWZTRw+D88M=; b=u2OtO4T8xMdmeVFEvRQJZt8NJf
	nsh19P3kWDZJT9OD4x5vfcCZKV0lUru+UCgVFVwA/Hyq0h2XfYgLw+HmfafKgzgSGprKnRuEJP8Em
	fm3EGmnhW8HwqpdROtBM5TvytVs662F2df63fvU5N6W9enPijx9wxLhOc04LDhrQngMTWRQMGypC1
	wue8NZRTjLYyYsWdG8GNWebkTSaf4ZWgDeO/Clh+jDMVbw7uqQAJd/33wRnezHY5jG+yNPw4SP36r
	idMoMOtgcl5lKvr+IVWMxCtQoMow+CSglGH8FVXmiC3HaxsXGS6kanDn2H2CMCxdTfeYKOZOY/PqP
	jPT5CbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbGS-000000054wU-0CLS;
	Thu, 30 Oct 2025 22:37:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbGP-000000054w9-3IfU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 22:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B758D4403F;
	Thu, 30 Oct 2025 22:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946CBC4CEF1;
	Thu, 30 Oct 2025 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761863820;
	bh=zPLbyBjuhlb7zrOEJrIU3GfHrz9PQnUP8iomadO4QU8=;
	h=Date:From:To:Subject:Reply-To:From;
	b=ktpRNUCDGUsM7XXHYLY3f0hMRZZreNLwqoEQEImTj9YFFVm2VSjfRHLqQT94e5FcF
	 jw2Akmu+o7jZWwelNqbzfjog4sD3QefJBDT+pUtGx+bs2loyq2a7hMHEcBzgGkRp3v
	 cnNUUrlMQzLrtoixj4AuKD3jbf9AzWynvX4Kx1T12VtRMeSJ6erBlpS1odL/AlFxbZ
	 qewa6puVtM4M4EQqjIJlSGxHv71F0xCGKPqguOsWd4XQRGcN0OofwAAq1W1gPJ/nVj
	 InqPyrw2IsV4uAXbxxTkdOD+yQEeOEkv6Qrr2NUX5rP59s3c1tuumkKVRMd+Nlcxdp
	 nFurUnEHoXsUg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2E387CE0CB5; Thu, 30 Oct 2025 15:37:00 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:37:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_153701_890696_6A8C1D7E 
X-CRM114-Status: GOOD (  16.51  )
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello!

To make event tracing safe for PREEMPT_RT kernels, I have been creating
optimized variants of SRCU readers that use per-CPU atomics.  This works
quite well, but on ARM Neoverse V2, I am seeing about 100ns for a
srcu_read_lock()/srcu_read_unlock() pair, or about 50ns for a single
per-CPU atomic operation.  This contrasts with a handful of nanoseconds
on x86 and similar on ARM for a atomic_set(&foo, atomic_read(&foo) + 1).

In theory, I can mess with SRCU's counter protocol, but I figured I
should check first.

The patch below shows the flavor of the change, but for the simpler
uproberet case where NMI safety is not required, permitting me to
simply disable interrupts across the non-atomic increment operations.
The overhead of interrupt disabling is not wonderful, but ~13ns is way
better than ~100ns any day of the week.

I have to do something like this for internal use here because we have
real hardware that acts this way.  If I don't hear otherwise, I will
also push it to mainline.  So if there is a more dainty approach, this
would be a most excellent time to let me know about it.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

commit 1eee41590d30805ec4f5b4e96c615603b0d058d9
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Oct 30 09:25:09 2025 -0700

    refscale: Add SRCU-fast-updown readers
    
    This commit adds refscale readers based on srcu_read_lock_fast_updown()
    and srcu_read_lock_fast_updown() ("refscale.scale_type=srcu-fast-updown").
    On my x86 laptop, these are about 2.2ns per pair.
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index 7429ec9f0092..07a313782dfd 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -186,6 +186,7 @@ static const struct ref_scale_ops rcu_ops = {
 // Definitions for SRCU ref scale testing.
 DEFINE_STATIC_SRCU(srcu_refctl_scale);
 DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
+DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
 static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
 
 static void srcu_ref_scale_read_section(const int nloops)
@@ -254,6 +255,42 @@ static const struct ref_scale_ops srcu_fast_ops = {
 	.name		= "srcu-fast"
 };
 
+static bool srcu_fast_updown_sync_scale_init(void)
+{
+	srcu_ctlp = &srcu_fast_updown_refctl_scale;
+	return true;
+}
+
+static void srcu_fast_updown_ref_scale_read_section(const int nloops)
+{
+	int i;
+	struct srcu_ctr __percpu *scp;
+
+	for (i = nloops; i >= 0; i--) {
+		scp = srcu_read_lock_fast_updown(srcu_ctlp);
+		srcu_read_unlock_fast_updown(srcu_ctlp, scp);
+	}
+}
+
+static void srcu_fast_updown_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
+{
+	int i;
+	struct srcu_ctr __percpu *scp;
+
+	for (i = nloops; i >= 0; i--) {
+		scp = srcu_read_lock_fast_updown(srcu_ctlp);
+		un_delay(udl, ndl);
+		srcu_read_unlock_fast_updown(srcu_ctlp, scp);
+	}
+}
+
+static const struct ref_scale_ops srcu_fast_updown_ops = {
+	.init		= srcu_fast_updown_sync_scale_init,
+	.readsection	= srcu_fast_updown_ref_scale_read_section,
+	.delaysection	= srcu_fast_updown_ref_scale_delay_section,
+	.name		= "srcu-fast-updown"
+};
+
 #ifdef CONFIG_TASKS_RCU
 
 // Definitions for RCU Tasks ref scale testing: Empty read markers.
@@ -1479,7 +1516,8 @@ ref_scale_init(void)
 	long i;
 	int firsterr = 0;
 	static const struct ref_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcu_fast_ops, RCU_TRACE_OPS RCU_TASKS_OPS
+		&rcu_ops, &srcu_ops, &srcu_fast_ops, &srcu_fast_updown_ops,
+		RCU_TRACE_OPS RCU_TASKS_OPS
 		&refcnt_ops, &percpuinc_ops, &incpercpu_ops, &incpercpupreempt_ops,
 		&incpercpubh_ops, &incpercpuirqsave_ops,
 		&rwlock_ops, &rwsem_ops, &lock_ops, &lock_irq_ops, &acqrel_ops,

