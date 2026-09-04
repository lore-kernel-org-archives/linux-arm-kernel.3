Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0203C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=; b=29VHSmPLB8nsb9skm/w6aCeTV2
	8CjBLf/wc8lZj6LNUdSBAnHiGbTb0vwxWqWeRIcGCba4LkPc+bHwn+/f2tvOZMiyzbAv6KTleL9Wa
	+z2lzsE2x/LRb4W8N9XAs2//sSPh0UG8mHxzcNaUysCixdKFNwzNa3gOJ6i7rFXYXaLmO12VgSiol
	xg7GVtxFfh3ZiB5rxAlHymFTfOBPa5jvt5x3uNhphkYmNfO0lj4nGsYovpYSE6PEb5NukBFE0hYPq
	XWval+kTncs7OaAgtTk7cX5t0hTpXNRN8kYThNFIUpgHux8LJcCaHaiIdmO3D1MaVodUH4rIjK+xv
	u2WASN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S33-00000001oX8-3tz4;
	Fri, 04 Sep 2026 11:25:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S31-00000001oWh-234V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:25:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso778701a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521131; x=1789125931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=S6wfoLD113++c0qNnZtvtZp0Vkw0sfWGHU4BevJcHKXoRZ2bMgDwKEcrmT+iXtllLt
         vRbC5DiqGq58UdLQTXebbamVuqgPZGr89gr9Z8lThYrAZO6cPkXE42JltpievfAnb5il
         Ba0x9UdSye03XYmSU20EY2BECCWtN/JE8zaNXNw+Ojza/wRH7zqaPJEybzM8673fYAfP
         Gdd70bqscGtduv/Op3it26h41QDFUeNSR/kruFaIzN+CB+pkY0Yw1Kmo7UaiR0yVY8Zm
         a+p9Zc/RLGxy5qS9FbLyOVcleCIXX0UNHLwGYuQHGwvHjHZHT9KajStu6xRLsl70VsGY
         0wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521131; x=1789125931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=BbaV4xdcBmlqNE/vkNFjXsOCbpKU3mECtGT0CdEnchoFSnE+kU2eVDzYBaV8pzHguR
         q4aLfqItOVsdXjRPBDk/CzrqXZO4zuWCs5iiwnqJinVqgtoTkf0jIuskbZqkib8rs9Eb
         MRGIZyQKiuSttnvrB8FxXfXDCJV7cqjhxjqlK4Zv3GFfiSCAc13J+OPGJo0CehYDIgbW
         YLLxXkym7UPZv9wrSRR1XoQSe7HyORh3t8GFa01MLw0NiZ8LG/0qGM1qG/+Y5EJoR6De
         QW3js9Xp3b31/gEDMxnfMUtyG3CGEAseFHbJwkP/woZ5Zi5v7lZRtWutkDQhTpi47QAN
         eY2g==
X-Forwarded-Encrypted: i=1; AKwUvByCpKtfdjH/U1zzoE4Iqgi8djX7JOD4SaQC1cqP3lbS+TL9OuZ2WVggUWPU6M8xBz46hVzDWneN7qSpj295DbVG@lists.infradead.org
X-Gm-Message-State: AFuF++mhjW1v2T3VxvivisUSS1DQSmIMnQWT5+6q2Z2lNm3NMjKlolF/
	F7rEYo7MaaHAoCjMmR0W2Kf5TJJy/mO/Jfnfb6y2mn/xxx4gAWL8gfbj
X-Gm-Gg: AYBFou3Md0cu0Fjs4qUg0Tku19fOXCTwJJPLNljrwX645hoN4jtG3YdN1lXMiE/+qA+
	Q/nKDremJtWonq3RjcRe2OUdQV0sfvjJpPLjHORMDqR0syxUx5g6o7ukjrYhn9QEXbbQE4hA8rs
	DFD5QCLJVpUvZSZnMqGP2XJG3iHVC5uiq3gwaWL9nDYiqSXA2KZEoypC0x0GK2a99Vnt7ybganM
	/LKJsZ1jHi+YCMg76j4JvmQpUOSIKqPhJsvVt+zcu2IY0UebrBSnSBDwUzZ/Av7O7fhKTXPgdNY
	/HeZ/YK1mUzFeS/1smC5iuyp6WaBYYg4NUN7abfmWsicHB5jTvkPTX1OkUKKAzkYdHk02TloI3A
	mVKGh641t5nWxP+X3xUvdR6RYjZecbTXek37WroicVJ1/UzPV9IhfQ97AtbsG7Lg9N1t3cYPjfq
	GULnmTQpGpMqdOZEoJ/nqIfA29SQj8SR6n0/gQFsS4LpxXPqDDoYKBnGrimoxBabiqGTKKTkh0F
	f3myZCTYb5kdNA=
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr9759398a91.0.1788521130565;
        Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] ARM: fix typos in comments
Date: Fri,  4 Sep 2026 16:55:17 +0530
Message-ID: <20260904112522.1426-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112522.1426-1-hemanth.selam@gmail.com>
References: <20260904112522.1426-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_042531_536001_6499C15D 
X-CRM114-Status: GOOD (  25.42  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/boot/compressed/head.S     | 2 +-
 arch/arm/include/asm/uaccess.h      | 2 +-
 arch/arm/kernel/cpuidle.c           | 2 +-
 arch/arm/mm/cache-l2x0.c            | 2 +-
 arch/arm/mm/context.c               | 4 ++--
 arch/arm/probes/decode.h            | 2 +-
 arch/arm/probes/kprobes/opt-arm.c   | 4 ++--
 arch/arm/probes/kprobes/test-core.c | 2 +-
 arch/arm/xen/hypercall.S            | 4 ++--
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6..e117f2b4dea9 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -955,7 +955,7 @@ call_cache_fn:	adr	r12, proc_types
 		/*
 		 * On v7-M the processor id is located in the V7M_SCB_CPUID
 		 * register, but as cache handling is IMPLEMENTATION DEFINED on
-		 * v7-M (if existant at all) we just return early here.
+		 * v7-M (if existent at all) we just return early here.
 		 * If V7M_SCB_CPUID were used the cpu ID functions (i.e.
 		 * __armv7_mmu_cache_{on,off,flush}) would be selected which
 		 * use cp15 registers that are not implemented on v7-M.
diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 1593cf3b9800..9805001f9d72 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -24,7 +24,7 @@
  * These two functions allow hooking accesses to userspace to increase
  * system integrity by ensuring that the kernel can not inadvertantly
  * perform such accesses (eg, via list poison values) which could then
- * be exploited for priviledge escalation.
+ * be exploited for privilege escalation.
  */
 #if defined(CONFIG_CPU_SW_DOMAIN_PAN)
 
diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb03b5..784457ac7b2b 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..0eaaf99d3d11 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1381,7 +1381,7 @@ static void aurora_pa_range(unsigned long start, unsigned long end,
 	unsigned long flags;
 
 	/*
-	 * round start and end adresses up to cache line size
+	 * round start and end addresses up to cache line size
 	 */
 	start &= ~(CACHE_LINE_SIZE - 1);
 	end = ALIGN(end, CACHE_LINE_SIZE);
diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
index 4204ffa2d104..95d477cab0f5 100644
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@ -76,7 +76,7 @@ void a15_erratum_get_cpumask(int this_cpu, struct mm_struct *mm,
 
 #ifdef CONFIG_ARM_LPAE
 /*
- * With LPAE, the ASID and page tables are updated atomicly, so there is
+ * With LPAE, the ASID and page tables are updated atomically, so there is
  * no need for a reserved set of tables (the active ASID tracking prevents
  * any issues across a rollover).
  */
@@ -243,7 +243,7 @@ void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
 	check_vmalloc_seq(mm);
 
 	/*
-	 * We cannot update the pgd and the ASID atomicly with classic
+	 * We cannot update the pgd and the ASID atomically with classic
 	 * MMU, so switch exclusively to global mappings to avoid
 	 * speculative page table walking with the wrong TTBR.
 	 */
diff --git a/arch/arm/probes/decode.h b/arch/arm/probes/decode.h
index facc889d05ee..b09c44ba1030 100644
--- a/arch/arm/probes/decode.h
+++ b/arch/arm/probes/decode.h
@@ -250,7 +250,7 @@ enum decode_reg_type {
 	REG_TYPE_NOPCWB,   /* No PC if load/store write-back flag also set */
 
 	/* The following types are used when the encoding for PC indicates
-	 * another instruction form. This distiction only matters for test
+	 * another instruction form. This distinction only matters for test
 	 * case coverage checks.
 	 */
 	REG_TYPE_NOPCX,	   /* Register must not be PC */
diff --git a/arch/arm/probes/kprobes/opt-arm.c b/arch/arm/probes/kprobes/opt-arm.c
index 966c6042c5ad..a3aed8c01c98 100644
--- a/arch/arm/probes/kprobes/opt-arm.c
+++ b/arch/arm/probes/kprobes/opt-arm.c
@@ -210,11 +210,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *or
 	 *
 	 * So the maximum forward branch should be:
 	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backword branch should be:
+	 * The maximum backward branch should be:
 	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
 	 *
 	 * We can simply check (rel & 0xfe000003):
-	 *  if rel is positive, (rel & 0xfe000000) shoule be 0
+	 *  if rel is positive, (rel & 0xfe000000) should be 0
 	 *  if rel is negitive, (rel & 0xfe000000) should be 0xfe000000
 	 *  the last '3' is used for alignment checking.
 	 */
diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index 2de28088dac8..531fec3621b8 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -125,7 +125,7 @@
  *	.byte	ARG_TYPE_END
  *	.byte	TEST_ISA	@ flags, including ISA being tested
  *	.short	50f-0f		@ offset of 'test_before'
- *	.short	2f-0f		@ offset of 'test_after2' (if relevent)
+ *	.short	2f-0f		@ offset of 'test_after2' (if relevant)
  *	.short	99f-0f		@ offset of 'test_done'
  *	@ start of test case code...
  *	0:
diff --git a/arch/arm/xen/hypercall.S b/arch/arm/xen/hypercall.S
index f794dac9859a..b8b6192e310e 100644
--- a/arch/arm/xen/hypercall.S
+++ b/arch/arm/xen/hypercall.S
@@ -32,9 +32,9 @@
 
 /*
  * The Xen hypercall calling convention is very similar to the ARM
- * procedure calling convention: the first paramter is passed in r0, the
+ * procedure calling convention: the first parameter is passed in r0, the
  * second in r1, the third in r2 and the fourth in r3. Considering that
- * Xen hypercalls have 5 arguments at most, the fifth paramter is passed
+ * Xen hypercalls have 5 arguments at most, the fifth parameter is passed
  * in r4, differently from the procedure calling convention of using the
  * stack for that case.
  *
-- 
2.48.1


