Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80F0C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qplivatb2MRZBFdV/LxlRMkcnhpA0+4rgWTKN2DYmSE=; b=ZK+bqvsDunvTCPHgK5FANWfmbn
	s95fgJFxIAn4sLCLQIhHlwiJ1cN83xZzRSnvoF2N2oqjtELzIiqG/ZujCg9OYnmVHvoAOuugNMxVy
	1hqvKbnpHehB2qGBcwWewTAqWPYSvoFXFyikyPY4L+IIXT9UofLNCKvECxCqP6ee4ZUgAwXSDhEMf
	YjP4i+6OzlxJVHxA8E2YUJyu7PbDb7jRc9R1f6G9l+PMRvuBBuPoZHEM2w7OTAtNIEbSCP3ujfaRk
	FF87wCioj3e7q379chE+tHgbT2cSjeuPbBqIjec+l5fZSy8OmzdG7nIBMKf9bByGpyDUnA+tehour
	3y3WbH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHuH-0000000B8At-2oGd;
	Thu, 03 Jul 2025 11:15:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH9e-0000000Az7M-3TM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87987450E3;
	Thu,  3 Jul 2025 10:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DFBC4CEE3;
	Thu,  3 Jul 2025 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538418;
	bh=x0UjezfsoOH38t7iWo4VW4qdmeF50w/ZyH4r588go9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GNdALS296jUJIu7ceSIkUHb/w594jhgeYc7AbnXCo+C+DQvNoNATs/YyFkcl3KC7b
	 BHR2qNYFWsrOR5tN28sL3TiLE/TXyYkUwL9DmJFiW47xLNd8rtXI9kRpz7XfxPHqK4
	 YyrxsL854AevKx+mUZs9v4ajI/rvf/dwHL5+wvoAbscLceuCkDWhbV7jAbIHDblfZn
	 C7qjFUhbWYGFf6my6/Tws3YpUc/catrk/lMdnhBMwlpYV/s11mjGZD6tZwD1vV4Zjb
	 X2VZ3RJ/TqKANflRZ3g11964g32jwdjG3IOo3YrzedG4mwYO0g41+7YtrTTggXtGoi
	 B5tKUngUIXC8g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:09 +0200
Subject: [PATCH v7 19/31] arm64: Add support for GICv5 GSB barriers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-19-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032658_911914_490690DB 
X-CRM114-Status: GOOD (  11.78  )
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

The GICv5 architecture introduces two barriers instructions
(GSB SYS, GSB ACK) that are used to manage interrupt effects.

Rework macro used to emit the SB barrier instruction and implement
the GSB barriers on top of it.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/barrier.h |  3 +++
 arch/arm64/include/asm/sysreg.h  | 10 +++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 1ca947d5c939..f5801b0ba9e9 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -44,6 +44,9 @@
 						 SB_BARRIER_INSN"nop\n",	\
 						 ARM64_HAS_SB))
 
+#define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
+#define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
+
 #ifdef CONFIG_ARM64_PSEUDO_NMI
 #define pmr_sync()						\
 	do {							\
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..9b5fc6389715 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -113,10 +113,14 @@
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
 
-#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
-	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
+#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
+	__emit_inst(0xd5000000					|	\
+		    sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
+		    ((Rt) & 0x1f))
 
-#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
+#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
+#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
+#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
 
 /* Data cache zero operations */
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)

-- 
2.48.0


