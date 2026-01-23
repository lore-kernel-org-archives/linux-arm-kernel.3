Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC829D77886
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ4ZonbyVjovqrO5qX6sNrxA3Ipd29wys44PweTQTmc=; b=3/rFP1IUuy3N1MabtnbSjNoRyw
	4jJkQLrtnFFOQVQ/MaWfdsUx62A2a+Sh1KTsR8WzEgqefTwkPLpSn9oaLS84Wo33uIUb0ayWWQZcI
	Rdncdb3BxyK8rThGuEZkO4sAftm/HdcOI8lO3zvxF8DGtHk3QTi2AT2/jj7R8o6DxsjnuxjW7bGyi
	T2rRGyr/G0/Talt1y9D10EB2oEsD32YXfsivuJf/q9CpXIwAyb0jzFySKDIVLNYSp6eXT6OHvRx59
	gHjVFaBnL1+j5dtYUdn6qJtAX0PSLmUI9o13U3XljwhipqX0wllNcwZiG0BRC/bBKnxw9+oQDMCrj
	uTq5mImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNn-00000009ENr-3wSi;
	Fri, 23 Jan 2026 16:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNV-00000009E8d-2uwp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9992B1688;
	Fri, 23 Jan 2026 08:51:14 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C7313F694;
	Fri, 23 Jan 2026 08:51:19 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 11/14] arm64: run at EL2 if supported
Date: Fri, 23 Jan 2026 16:50:50 +0000
Message-Id: <20260123165053.2250754-12-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085121_785488_215483A0 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

If VHE is supported, continue booting at EL2, otherwise continue booting at
EL1.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 arm/cstart64.S         | 21 +++++++++++++++++----
 lib/arm64/asm/sysreg.h |  5 +++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arm/cstart64.S b/arm/cstart64.S
index 2b93f234..49cf8ed6 100644
--- a/arm/cstart64.S
+++ b/arm/cstart64.S
@@ -15,10 +15,14 @@
 #include <asm/thread_info.h>
 #include <asm/sysreg.h>
 
+/*
+ * Initialise the EL used for running the tests.
+ * If started at EL2 and VHE is supported, EL2 is used, otherwise EL1 is used.
+ */
 .macro init_el, tmp
 	mrs	\tmp, CurrentEL
 	cmp	\tmp, CurrentEL_EL2
-	b.ne	1f
+	b.ne	2f
 	/* EL2 setup */
 	mrs	\tmp, mpidr_el1
 	msr	vmpidr_el2, \tmp
@@ -41,17 +45,26 @@
 	msr_s	SYS_HFGWTR2_EL2, \tmp
 	msr_s	SYS_HFGITR2_EL2, \tmp
 .Lskip_fgt_\@:
+	/* check VHE is supported */
+	mrs	\tmp, ID_AA64MMFR1_EL1
+	ubfx	\tmp, \tmp, ID_AA64MMFR1_EL1_VH_SHIFT, #4
+	cbz	\tmp, 1f
+	ldr	\tmp, =(INIT_HCR_EL2)
+	msr	hcr_el2, \tmp
+	isb
+	b	2f
+1:
 	mov	\tmp, #0
 	msr	cptr_el2, \tmp
 	ldr	\tmp, =(INIT_HCR_EL2_EL1_ONLY)
 	msr	hcr_el2, \tmp
 	mov	\tmp, PSR_MODE_EL1t
 	msr	spsr_el2, \tmp
-	adrp	\tmp, 1f
-	add	\tmp, \tmp, :lo12:1f
+	adrp	\tmp, 2f
+	add	\tmp, \tmp, :lo12:2f
 	msr	elr_el2, \tmp
 	eret
-1:
+2:
 .endm
 
 
diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index ed776716..f2d05018 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -80,6 +80,8 @@ asm(
 #define ID_AA64MMFR0_EL1_FGT_SHIFT	56
 #define ID_AA64MMFR0_EL1_FGT_FGT2	0x2
 
+#define ID_AA64MMFR1_EL1_VH_SHIFT	8
+
 #define ICC_PMR_EL1			sys_reg(3, 0, 4, 6, 0)
 #define ICC_SGI1R_EL1			sys_reg(3, 0, 12, 11, 5)
 #define ICC_IAR1_EL1			sys_reg(3, 0, 12, 12, 0)
@@ -116,9 +118,12 @@ asm(
 #define SCTLR_EL1_TCF0_SHIFT	38
 #define SCTLR_EL1_TCF0_MASK	GENMASK_ULL(39, 38)
 
+#define HCR_EL2_TGE		_BITULL(27)
 #define HCR_EL2_RW		_BITULL(31)
+#define HCR_EL2_E2H		_BITULL(34)
 
 #define INIT_HCR_EL2_EL1_ONLY	(HCR_EL2_RW)
+#define INIT_HCR_EL2		(HCR_EL2_TGE | HCR_EL2_E2H | HCR_EL2_RW)
 
 #define SYS_HFGRTR_EL2		sys_reg(3, 4, 1, 1, 4)
 #define SYS_HFGWTR_EL2		sys_reg(3, 4, 1, 1, 5)
-- 
2.25.1


