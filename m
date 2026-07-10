Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C59C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OkhJ4lvYBSlyvMGGV8JRBzZugTa/eyNd9chkQsqeeQE=; b=yYEccWE4yYeeGJrcbaHgq4NXpj
	QMEKSuSa7ov4i4ONqo4Qi3V3p6G6ZVwWwchIFTA0T9hT9yLWYN0zEjN6cS/3KNGpSIEqSX/2ZsP0i
	nIQoWxAK0VhBbWoIefEr3LBh2KNK5eRU1alLZ2We7Ok2wSbJVfdkvjH3mRaqsxdCkJ0ruI5SueKjK
	svDVJNmiC5cBYhtzPonGCBsyULm40yMjRVKwwY4CoZ+DrrCe0ZQtwJMipF3Cd1K+4W2T0lCMTDMcF
	rp1vt7dhIneGulKnam5Dp1A+2Ad3K/MwNU1Ue7IKMZAEOEyEprkthoWZUY9YjKJEPxwx11j9o+ZCY
	22FKyp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEyK-00000005QsF-0Bl1;
	Fri, 10 Jul 2026 17:25:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEyI-00000005Qs0-2i7y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D684760051;
	Fri, 10 Jul 2026 17:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657101F000E9;
	Fri, 10 Jul 2026 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783704304;
	bh=OkhJ4lvYBSlyvMGGV8JRBzZugTa/eyNd9chkQsqeeQE=;
	h=From:Date:Subject:To:Cc;
	b=Zw7FjCt46TEFlpqodKHS0CLS7sAbGnOQcj2PvODD6tN1cByuvvuJ76esSivWvHOhp
	 V4V5gffZHwbTsOIUheraNtaO9ycIUf63NnxWylG5G1iamITnmP6pcFkmwuDhhpS36h
	 90xCNvtPIDx/LEWHhbqgXHDfOrF2xyi62ikh7YYVTE8nD3O8xxR2K5VvsFuqNiwOSD
	 GH+jgALNanhvgM6t6yUh2eR8uN/+Kz+f1krxVe6PQwnzfcfy9OPx0+wFEetyvFwC66
	 zFyQYmjrxau0H+nwdoanbk9D7n/GXv/gvfQjQfwcms7PrFy8fMTEGWaXDhTdiqZJdj
	 Qf0lfTHr1BZcQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 10 Jul 2026 18:01:47 +0100
Subject: [PATCH] arm64/sme: Disable TIF_SME when loading state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-arm64-disable-sme-v1-1-f47b529d6cb4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHolUWoC/yXMQQrCMBBG4auUWTuQVI3oVcTFJPnbjtgqGRWh9
 O5Gu/wW781kKAqjUzNTwVtN71OF3zSUBpl6sOZqal0b3MEdWcoYdpzVJN7ANoLTXrbBi0fMkWr
 3KOj083+eL6vtFa9Iz9+IluULj6IeynUAAAA=
X-Change-ID: 20260709-arm64-disable-sme-c5a361a1ebdb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6/AU9CfzV4O2WcKOGgIYWPlWPunDOJ6Wg+TyBf5gmYw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUSruhplfHAo3Xr41AFIOYyzSKPbt/5pPLoBAX
 bjBQtJjVkWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalEq7gAKCRAk1otyXVSH
 0APkB/9y0urezEF3FfjdwDtvsyYGHzCJW8sFGwscOYfjO+up+T2ahrOwG6eIi6ph/NS2h03qZxl
 2HqmE/HB1F+FQZpUP6hf+Q4wYz+LM1RO45D1QtxNgrnbKuRTdTmk7vgRPQKhH5SG3MrP7z4+XKj
 JRWXMmHOhjHbtRW50I/tDAMgXEKgwXOXmw9k8EjtHPZ+jFQRlAqqjZoQ22JtzgTkqOVycqUb1y5
 L2BJe0BvVXL7ezACLF1wNZu0LnnDmy03IvncoV9cHUH6Ji19/14PBDqrTIM/Ef9UWLA1YeDcq9C
 /Odb6q5qVJNspeIX28qm7hCNv6d104ctlplvovGfKyYDxTXb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Normally once we have enabled SME access for a userspace task there is no
real overhead from leaving it on, unless userspace has enabled either
streaming mode or ZA there is no additional state to load and save beyond
SVCR. For systems affected by Arm erratum #4193714 this is not the case,
we must issue additional IPIs to CPUs running tasks using SME to ensure
visibility of memory accesses.

Mitigate this by disabling TIF_SME when we load the floating point state
for a task that does not have streaming mode or ZA enabled. These tasks
will then run with SME traps enabled until the next time that they
attempt to use SME or we load SME state via signal return or ptrace,
allowing them to avoid the overhead of enabling the erratum workaround.
CPUs are only added to the set of CPUs that require IPIs while in user
mode so will not be in it while the floating point state is being
loaded.

I have not directly verified the performance impact of this on affected
systems with practical workloads, hopefully users with such systems can
assess the impact and confirm if there is any benefit or not. Tasks that
use SME intermittently will experience additional SME access traps but
will not cause additional IPIs while SME has been disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 25dc5afe9ba0..7974dad5ea17 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -204,6 +204,10 @@ static inline void sme_free(struct task_struct *t) { }
 
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+static cpumask_t sme_dvmsync_cpus;
+#endif
+
 static void fpsimd_bind_task_to_cpu(void);
 
 /*
@@ -404,6 +408,13 @@ static void task_fpsimd_load(void)
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+		if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+		    cpumask_test_cpu(smp_processor_id(), &sme_dvmsync_cpus) &&
+		    current->thread.svcr == 0)
+			clear_thread_flag(TIF_SME);
+#endif
+
 		/* Ensure VL is set up for restoring data */
 		if (test_thread_flag(TIF_SME)) {
 			unsigned long vq = sve_vq_from_vl(sme_vl);
@@ -1354,7 +1365,6 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 /*
  * SME/CME erratum handling.
  */
-static cpumask_t sme_dvmsync_cpus;
 
 /*
  * These helpers are only called from non-preemptible contexts, so

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260709-arm64-disable-sme-c5a361a1ebdb

Best regards,
--  
Mark Brown <broonie@kernel.org>


