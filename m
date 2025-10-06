Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31926CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lt6ePQrXgPXV+hBsiUhoIfKpMSEuFV1a1dMSD3yvhs4=; b=C8GyPj4Y2uRkIqMWCS8wTaGYz1
	0HMc7+y6wQCpoxWkte8AQdA2vlIpFlaUDArMgHIEYIsNQNcNTzzjfYkHmUe6I+eH7FTLvsx40zKm+
	6gZCTzq8cgKlgGisJiE1kpaUnXJwjeVkocNReBrKcNnPfBtDL+L+kjhJgjIza2kICERwhfTtoauG2
	a3KlHdh3iia/KBrSKIkahI/XiewuP189wcltunitwufY3b+qx9sda42V3tySa2Jjp8bYAJD5m+HhE
	u10udQOXrf8JvJpV58XaFLLEAqq/dBASj6CLkYCxpQKJjlGEWbRuzTxdsR3RWaeV55Fa/bqhwnYW9
	/H/K6asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i8V-0000000HKFb-2B4N;
	Mon, 06 Oct 2025 10:08:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5i8T-0000000HKFH-3C7h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46E2A43D02;
	Mon,  6 Oct 2025 10:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AFDC4CEF5;
	Mon,  6 Oct 2025 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759745284;
	bh=yRLuRvSqNxRCoKpZgC18r1nsEo2iGgy1PGy9x3yoNKI=;
	h=From:To:Cc:Subject:Date:From;
	b=R3SeeOeEX0mw6fPNzNHmd2hVZ1+/kUWP5tI/qIvW7Xos753YpKdIcg9+klsq3ZRoP
	 8ME3luTv3VUiLvyOApc/56/GVXmvxZbxpFairA2LL2xREqNtrQR7TBJNl/4rWh08gV
	 ugVjufPzfo+r9iTQ5dY/xfEKcFj2gAL4nh5ArnZur2WovUNc4ugGqCa8q8aD+Ek6F3
	 UmobD65cT+neYyBmKko6865XOqidae0FBn9sgpaNp0dR1NAbBVKdArSeWQGbKhRh1Y
	 ipC9AQ9TyWP392TQRB/m2qPv3jIsY4TB/+Q1s8zcB2XcfuQ4ZaSAOQ8u5FUCjqMilX
	 3TqSiZsRG5bUg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Fix GIC CDEOI instruction encoding
Date: Mon,  6 Oct 2025 12:07:58 +0200
Message-ID: <20251006100758.624934-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_030805_942837_0FF96ED1 
X-CRM114-Status: GOOD (  15.65  )
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

The GIC CDEOI system instruction requires the Rt field to be set to 0b11111
otherwise the instruction behaviour becomes CONSTRAINED UNPREDICTABLE.

Currenly, its usage is encoded as a system register write, with an immediate 0
value:

write_sysreg_s(0, GICV5_OP_GIC_CDEOI)

Whilst this might turn out to work if the compiler encodes the immediate 0
value into an XZR register in the MSR operation (ie that corresponds to
Rt == 0b11111), it is not reliable and actually it does not work when the
kernel is compiled with LLVM that does not yet understand the asm inline
constraints enabling direct XZR usage for system instruction encodings
(in write_sysreg_s()).

Rename the __SYS_BARRIER_INSN macro and use it to generate the required
GIC CDEOI encoding instead of relying on write_sysreg_s() with an immediate
0 value, fixing the issue.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 +++++++++++++++-----
 drivers/irqchip/irq-gic-v5.c    |  4 ++--
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 6455db1b54fd..6cf8c46ddde5 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -113,14 +113,14 @@
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
 
-#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
+#define __SYS_INSN(op0, op1, CRn, CRm, op2, Rt)				\
 	__emit_inst(0xd5000000					|	\
 		    sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
 		    ((Rt) & 0x1f))
 
-#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
-#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
-#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
+#define SB_BARRIER_INSN			__SYS_INSN(0, 3, 3, 0, 7, 31)
+#define GSB_SYS_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 0, 31)
+#define GSB_ACK_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 1, 31)
 
 /* Data cache zero operations */
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
@@ -1075,7 +1075,6 @@
 #define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
 #define GICV5_OP_GIC_CDHM		sys_insn(1, 0, 12, 2, 1)
 #define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
-#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
 #define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
 #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
 #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
@@ -1129,6 +1128,17 @@
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
+/*
+ * GIC CDEOI encoding requires Rt to be 0b11111.
+ * gic_insn() with an immediate value of 0 cannot be used to encode it
+ * because some compilers do not follow asm inline constraints in
+ * write_sysreg_s() to turn an immediate 0 value into an XZR as
+ * MSR source register.
+ * Use __SYS_INSN to specify its precise encoding explicitly.
+ */
+#define GICV5_CDEOI_INSN		__SYS_INSN(1, 0, 12, 1, 7, 31)
+#define gic_cdeoi()			asm volatile(GICV5_CDEOI_INSN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 #ifdef __ASSEMBLY__
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 41ef286c4d78..b607c943c47d 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -218,14 +218,14 @@ static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
 
 	gic_insn(cddi, CDDI);
 
-	gic_insn(0, CDEOI);
+	gic_cdeoi();
 }
 
 static void gicv5_ppi_irq_eoi(struct irq_data *d)
 {
 	/* Skip deactivate for forwarded PPI interrupts */
 	if (irqd_is_forwarded_to_vcpu(d)) {
-		gic_insn(0, CDEOI);
+		gic_cdeoi();
 		return;
 	}
 
-- 
2.48.0


