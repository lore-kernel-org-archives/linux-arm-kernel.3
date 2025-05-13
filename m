Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE73C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbrwsripFpNms7HGXlhrB59phb6ctF9lbnOGW0gEFxE=; b=RfdCo2CKbKyjbydw5eHBA/LUDN
	hT+HwSR5RDR18KmXNp2RFH07pXJyRWRcrqYGu73Gtsqty3njqb0mDk05hngey2SFzkDRusJNIfdg5
	im56dB+C73+DBXwqYINHJX6miv+gP5A1wbiP7S6hP3tYC1BBK7Lx+QzonoerZNlqu7yDcDe+YxWWx
	lBU2J6+ooM+MOhEzaKASLo3kjSmpPQc9C+azJzRwjoV5k4jxS8SxkDAYSBRO98YakxVdtICCMfCsN
	MGVJaArf4Zmu8hndtn2QnpJD/3rA1qEs/UlhmfMbr3DuuSBaJkQnwoPqNflzgphMe4A9m7flHRvhn
	XPqd+osA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuUO-0000000DFiM-1p0Y;
	Tue, 13 May 2025 18:36:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtlL-0000000D9Rh-3k3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FE6E44A90;
	Tue, 13 May 2025 17:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1068C4CEEF;
	Tue, 13 May 2025 17:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158595;
	bh=LkJPqDgTcvITvCjal2jF9oi6QEuwQiB0J4qVejeTgGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kYLQShDXqzKfLh77o8pLTteAI0g4a3bTDQrlRxL9L7Gtu6QFb/5SSXGX3qAPjkiLU
	 60jZH0pBAxU07aRLFRhoeQ/BEOGoadMG1K3D4bCiS4QEpMf5HzIHG+LaCpOmqtHZHg
	 /V4ck7hbRVHXKRfXik2nzvETDSrXO5ulZ16jg4gTlroIsmYLKt0Kci6W/qlE2wMfhH
	 SId2iQs2yszkd1TO1wVQwyob/tU63Bjew74VuchTBbIq/0/mo7g/Io4VJG55Vbh/s4
	 XBYwTTvc8GhNtDf6hlJfBJ1Aj3BENoKKKzQA0A4hRqdKyP8A29QFdsIK/oxmgeQvlf
	 q9/XOQKQg1vqw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:12 +0200
Subject: [PATCH v4 19/26] arm64: Add support for GICv5 GSB barriers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_104955_979503_4D3FDCA4 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/barrier.h |  3 +++
 arch/arm64/include/asm/sysreg.h  | 10 +++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 1ca947d5c93963d33fe8fb02d6037fc71bd9fd7a..f5801b0ba9e9e7e0433f16ffedf0ec7dfb3e358e 100644
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
index 2639d3633073de10f5040a7efff059021f847530..e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -112,10 +112,14 @@
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
 
-#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
-	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
+#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)		\
+	__emit_inst(0xd5000000				|	\
+	sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
+	((Rt) & 0x1f))
 
-#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
+#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
+#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
+#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
 
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
 #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)

-- 
2.48.0


