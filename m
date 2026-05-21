Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAADACD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA9YenIjfSVg13lBoN5MU9vV2x/C7RPaeiGeIbGA2ig=; b=xN2MnkbexfOLbDCRR6IsIwZoYz
	YmEoYpqngG8zicp6Lhy9+DD2YP7RAB3SW2pZwapFvJ627OoGDsCr7bCoAKzvqwaCr3H/a1nGmFJNN
	1G9nW7Z7b5QVwSVAcWwI0ywiBP4sUC368YG1RVuoOv6ipvBxLB3QxOEpKWL2lR4TXh1AkuAFBKJby
	5+vrPaGqioby6/8+oAn44YAzFSeWgPUkWvDH1jWK6MHPcJEpKna5F0hUV6c7/r0ajc7eOFmOOzPM3
	vzJAbRxD4RpRO0eo0muzhS6//MvrW9FpUyXNnR+gti8oFamvbzIapu+19rZnjYCNn8EUaH7HbIdn1
	5sJJnDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Qc-00000007sgt-2Uo0;
	Thu, 21 May 2026 13:27:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Q4-00000007s6K-22is
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:26:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C78F32BCB;
	Thu, 21 May 2026 06:26:30 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A11CB3F7B4;
	Thu, 21 May 2026 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779369995; bh=Awmtl499rtF/0b4l3fU6t7Fxq/WplL1zCjoueMdmw1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qyeX/BCZoz3sIRW+l7kLYBx6xZLBt6AW2+bDDZIYc/Pe5YUdAVZi4YOgIl9z6zhlK
	 3/GuahmaloG1VH7nxtj7Vx3C7iU0a882gSrZbOqsRcpDUfPbAWJGFDmrSybr2DfL89
	 Yn6fXAVvwL07B1jigNO9wS6M4q/cKB5K8+W04Q6g=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 14/18] arm64: fpsimd: Use opaque type for SME state
Date: Thu, 21 May 2026 14:25:52 +0100
Message-Id: <20260521132556.584676-15-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260521132556.584676-1-mark.rutland@arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062636_603694_B064CC16 
X-CRM114-Status: GOOD (  17.72  )
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

As the SME state size can vary at runtime, we don't have a concrete type
for the in-memory SME state, and pass this around using a pointer to
void.

Using pointer to void means that it's very easy to introduce errors that
cannot be caught by the compiler (e.g. as 'void **' can be assigned to
'void *').

Improve this by adding an opaque 'struct sve_state', and consistently
passing a pointer to this.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h    | 8 ++++----
 arch/arm64/include/asm/processor.h | 3 ++-
 arch/arm64/kernel/fpsimd.c         | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 19e670ae67598..560814acc60c0 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -163,7 +163,7 @@ extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
 struct cpu_fp_state {
 	struct user_fpsimd_state *st;
 	struct sve_state *sve_state;
-	void *sme_state;
+	struct sme_state *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
 	unsigned int sve_vl;
@@ -199,7 +199,7 @@ static inline void *thread_zt_state(struct thread_struct *thread)
 {
 	/* The ZT register state is stored immediately after the ZA state */
 	unsigned int sme_vq = sve_vq_from_vl(thread_get_sme_vl(thread));
-	return thread->sme_state + ZA_SIG_REGS_SIZE(sme_vq);
+	return (void *)thread->sme_state + ZA_SIG_REGS_SIZE(sme_vq);
 }
 
 static inline unsigned int sve_get_vl(void)
@@ -218,8 +218,8 @@ static inline unsigned int sve_get_vl(void)
 extern void sve_save_state(struct sve_state *state, int save_ffr);
 extern void sve_load_state(const struct sve_state *state, int restore_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
-extern void sme_save_state(void *state, int zt);
-extern void sme_load_state(void const *state, int zt);
+extern void sme_save_state(struct sme_state *state, int zt);
+extern void sme_load_state(const struct sme_state *state, int zt);
 
 struct arm64_cpu_capabilities;
 extern void cpu_enable_fpsimd(const struct arm64_cpu_capabilities *__unused);
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 1c2ffd063baa8..7304d9cca3e85 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -131,6 +131,7 @@ enum fp_type {
 };
 
 struct sve_state;		/* Opaque type */
+struct sme_state;		/* Opaque type */
 
 struct cpu_context {
 	unsigned long x19;
@@ -167,7 +168,7 @@ struct thread_struct {
 	enum fp_type		fp_type;	/* registers FPSIMD or SVE? */
 	unsigned int		fpsimd_cpu;
 	struct sve_state	*sve_state;	/* SVE registers, if any */
-	void			*sme_state;	/* ZA and ZT state, if any */
+	struct sme_state	*sme_state;	/* ZA and ZT state, if any */
 	unsigned int		vl[ARM64_VEC_MAX];	/* vector length */
 	unsigned int		vl_onexec[ARM64_VEC_MAX]; /* vl after next exec */
 	unsigned long		fault_address;	/* fault info */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 66d880d081671..f9b3eeacf130d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -808,7 +808,7 @@ static int change_live_vector_length(struct task_struct *task,
 	unsigned int sve_vl = task_get_sve_vl(task);
 	unsigned int sme_vl = task_get_sme_vl(task);
 	struct sve_state *sve_state = NULL;
-	void *sme_state = NULL;
+	struct sme_state *sme_state = NULL;
 
 	if (type == ARM64_VEC_SME)
 		sme_vl = vl;
@@ -1645,7 +1645,7 @@ static void fpsimd_flush_thread_vl(enum vec_type type)
 void fpsimd_flush_thread(void)
 {
 	struct sve_state *sve_state = NULL;
-	void *sme_state = NULL;
+	struct sme_state *sme_state = NULL;
 
 	if (!system_supports_fpsimd())
 		return;
-- 
2.30.2


