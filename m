Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F8C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAAkrxbNhSnw0VmwOT1mFPOMUAh9jgzv4DOv5jdm4R4=; b=fGxQo6pJoqD+DaaeKvxOd3CRW0
	OOwm/U4b8bUvCghD3UfHct/V8ZDdGzwoN+p9Oo2y9qNemis8u5KUOjb8G3jUyv5ULagUTnByFDdBu
	0NWKr2+pD2AXVibaDrmj2yL7cT1BMHjSM45dAfSxlUqcfSB/c39swWzKY4CBnmId+YXKQCLxCTuQk
	p0HG61s1vaMHQrwbsqpkWrQjPX7Z5SwOZ7zRxvPe+dzQqjvkRapBHNvvYyR1Xsufmx+VlHSQB3uyj
	v1g3RySO/mPyR7rnuX/PrLln+q0MKV+/a5e1bHiTOgoWcx+Djjx3fb/DHfQd662K3htRz7JuXc7sp
	b7licOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRHm-000000098kf-20Dh;
	Tue, 18 Feb 2025 17:21:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRC6-000000097iv-391N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:15:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C113152B;
	Tue, 18 Feb 2025 09:15:57 -0800 (PST)
Received: from e126864.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 724893F59E;
	Tue, 18 Feb 2025 09:15:36 -0800 (PST)
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 3/3] arm64: lib: Use MOPS for usercopy routines
Date: Tue, 18 Feb 2025 17:14:30 +0000
Message-Id: <20250218171430.28227-4-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218171430.28227-1-kristina.martsenko@arm.com>
References: <20250218171430.28227-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_091538_878542_7A944804 
X-CRM114-Status: GOOD (  15.28  )
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

Similarly to what was done with the memcpy() routines, make
copy_to_user(), copy_from_user() and clear_user() also use the Armv8.8
FEAT_MOPS instructions.

Both MOPS implementation options (A and B) are supported, including
asymmetric systems. The exception fixup code fixes up the registers
according to the option used.

In case of a fault the routines return precisely how much was not copied
(as required by the comment in include/linux/uaccess.h), as unprivileged
versions of CPY/SET are guaranteed not to have written past the
addresses reported in the GPRs.

The MOPS instructions could possibly be inlined into callers (and
patched to branch to the generic implementation if not detected;
similarly to what x86 does), but as a first step this patch just uses
them in the out-of-line routines.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/asm-uaccess.h |  4 ++++
 arch/arm64/lib/clear_user.S          | 25 +++++++++++++++++++++----
 arch/arm64/lib/copy_from_user.S      | 10 ++++++++++
 arch/arm64/lib/copy_template.S       | 10 ++++++++++
 arch/arm64/lib/copy_to_user.S        | 10 ++++++++++
 5 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
index 5b6efe8abeeb..9148f5a31968 100644
--- a/arch/arm64/include/asm/asm-uaccess.h
+++ b/arch/arm64/include/asm/asm-uaccess.h
@@ -61,6 +61,10 @@ alternative_else_nop_endif
 9999:	x;					\
 	_asm_extable_uaccess	9999b, l
 
+#define USER_CPY(l, uaccess_is_write, x...)	\
+9999:	x;					\
+	_asm_extable_uaccess_cpy 9999b, l, uaccess_is_write
+
 /*
  * Generate the assembly for LDTR/STTR with exception table entries.
  * This is complicated as there is no post-increment or pair versions of the
diff --git a/arch/arm64/lib/clear_user.S b/arch/arm64/lib/clear_user.S
index a5a5f5b97b17..de9a303b6ad0 100644
--- a/arch/arm64/lib/clear_user.S
+++ b/arch/arm64/lib/clear_user.S
@@ -17,14 +17,27 @@
  * Alignment fixed up by hardware.
  */
 
-	.p2align 4
-	// Alignment is for the loop, but since the prologue (including BTI)
-	// is also 16 bytes we can keep any padding outside the function
 SYM_FUNC_START(__arch_clear_user)
 	add	x2, x0, x1
+
+#ifdef CONFIG_AS_HAS_MOPS
+	.arch_extension mops
+alternative_if_not ARM64_HAS_MOPS
+	b	.Lno_mops
+alternative_else_nop_endif
+
+USER(9f, setpt	[x0]!, x1!, xzr)
+USER(6f, setmt	[x0]!, x1!, xzr)
+USER(6f, setet	[x0]!, x1!, xzr)
+	mov	x0, #0
+	ret
+.Lno_mops:
+#endif
+
 	subs	x1, x1, #8
 	b.mi	2f
-1:
+
+1:	.p2align 4
 USER(9f, sttr	xzr, [x0])
 	add	x0, x0, #8
 	subs	x1, x1, #8
@@ -47,6 +60,10 @@ USER(7f, sttrb	wzr, [x2, #-1])
 	ret
 
 	// Exception fixups
+6:	b.cs	9f
+	// Registers are in Option A format
+	add	x0, x0, x1
+	b	9f
 7:	sub	x0, x2, #5	// Adjust for faulting on the final byte...
 8:	add	x0, x0, #4	// ...or the second word of the 4-7 byte case
 9:	sub	x0, x2, x0
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 34e317907524..400057d607ec 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -52,6 +52,13 @@
 	stp \reg1, \reg2, [\ptr], \val
 	.endm
 
+	.macro cpy1 dst, src, count
+	.arch_extension mops
+	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
+	.endm
+
 end	.req	x5
 srcin	.req	x15
 SYM_FUNC_START(__arch_copy_from_user)
@@ -62,6 +69,9 @@ SYM_FUNC_START(__arch_copy_from_user)
 	ret
 
 	// Exception fixups
+9996:	b.cs	9997f
+	// Registers are in Option A format
+	add	dst, dst, count
 9997:	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
index 488df234c49a..7f2f5a0e2fb9 100644
--- a/arch/arm64/lib/copy_template.S
+++ b/arch/arm64/lib/copy_template.S
@@ -40,6 +40,16 @@ D_l	.req	x13
 D_h	.req	x14
 
 	mov	dst, dstin
+
+#ifdef CONFIG_AS_HAS_MOPS
+alternative_if_not ARM64_HAS_MOPS
+	b	.Lno_mops
+alternative_else_nop_endif
+	cpy1	dst, src, count
+	b	.Lexitfunc
+.Lno_mops:
+#endif
+
 	cmp	count, #16
 	/*When memory length is less than 16, the accessed are not aligned.*/
 	b.lo	.Ltiny15
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 802231772608..819f2e3fc7a9 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -51,6 +51,13 @@
 	user_stp 9997f, \reg1, \reg2, \ptr, \val
 	.endm
 
+	.macro cpy1 dst, src, count
+	.arch_extension mops
+	USER_CPY(9997f, 1, cpyfpwt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 1, cpyfmwt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 1, cpyfewt [\dst]!, [\src]!, \count!)
+	.endm
+
 end	.req	x5
 srcin	.req	x15
 SYM_FUNC_START(__arch_copy_to_user)
@@ -61,6 +68,9 @@ SYM_FUNC_START(__arch_copy_to_user)
 	ret
 
 	// Exception fixups
+9996:	b.cs	9997f
+	// Registers are in Option A format
+	add	dst, dst, count
 9997:	cmp	dst, dstin
 	b.ne	9998f
 	// Before being absolutely sure we couldn't copy anything, try harder
-- 
2.34.1


