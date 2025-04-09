Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EB8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/PesWFiFWYwPkZ2EjD1UNDJj9JOpGyOHc1Nt710qb4=; b=OBMcRDxnaEbKWjgysYgcKN5hJo
	YWsGUmFs6iJwmWmTXr3MQits3DltxkySiCNWSacsqGFixPG1BHiEqgvx/5c/eKrlN3rUz0+VR3SUw
	sTyo2EekkhySo7G/PaVh9coLy5DhrI2rA3DBPP3a/0c526uv8TE7p7CP+E3rX8hoFh1PlooiUu6iL
	AIpq7KiA5NfM8XNyAFBaB6bjAvMuEuYlevkuPP4Cl0nMuPhyUUZcpRJ5E3J9SQZXR1ZDpMMB9ORU1
	1jTyuVV9GxRGtHtQ9MINBQPBGiTaRanIEGMCGYbGwQtEKBn6YYpTGATtcPw8VMGxgu28gIzXlbVg5
	ZQLvUGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ymf-00000007yBw-0ztS;
	Wed, 09 Apr 2025 17:00:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTo-00000007uxh-0uks
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F761C25;
	Wed,  9 Apr 2025 09:40:48 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A04FF3F59E;
	Wed,  9 Apr 2025 09:40:46 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 10/13] arm64/fpsimd: Add fpsimd_save_and_flush_current_state()
Date: Wed,  9 Apr 2025 17:40:07 +0100
Message-Id: <20250409164010.3480271-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094048_297966_A0EA096A 
X-CRM114-Status: GOOD (  13.57  )
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

When the current task's FPSIMD/SVE/SME state may be live on *any* CPU in
the system, special care must be taken when manipulating that state, as
this manipulation can race with preemption and/or asynchronous usage of
FPSIMD/SVE/SME (e.g. kernel-mode NEON in softirq handlers).

Even when manipulation is is protected with get_cpu_fpsimd_context() and
get_cpu_fpsimd_context(), the logic necessary when the state is live on
the current CPU can be wildly different from the logic necessary when
the state is not live on the current CPU. A number of historical and
extant issues result from failing to handle these cases consistetntly
and/or correctly.

To make it easier to get such manipulation correct, add a new
fpsimd_save_and_flush_current_state() helper function, which ensures
that the current task's state has been saved to memory and any stale
state on any CPU has been "flushed" such that is not live on any CPU in
the system. This will allow code to safely manipulate the saved state
without risk of races.

Subsequent patches will use the new function.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 9c3e88ec873ab..1a18f851b6144 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -96,6 +96,7 @@ struct cpu_fp_state {
 extern void fpsimd_bind_state_to_cpu(struct cpu_fp_state *fp_state);
 
 extern void fpsimd_flush_task_state(struct task_struct *target);
+extern void fpsimd_save_and_flush_current_state(void);
 extern void fpsimd_save_and_flush_cpu_state(void);
 
 static inline bool thread_sm_enabled(struct thread_struct *thread)
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 11f21809d3b7d..ea07c4577f17e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1819,6 +1819,17 @@ void fpsimd_flush_task_state(struct task_struct *t)
 	barrier();
 }
 
+void fpsimd_save_and_flush_current_state(void)
+{
+	if (!system_supports_fpsimd())
+		return;
+
+	get_cpu_fpsimd_context();
+	fpsimd_save_user_state();
+	fpsimd_flush_task_state(current);
+	put_cpu_fpsimd_context();
+}
+
 /*
  * Save the FPSIMD state to memory and invalidate cpu view.
  * This function must be called with preemption disabled.
-- 
2.30.2


