Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F6E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 06:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=aloF7MkDLud0BSRnjOsxj2IOpjpppNDUaB9hMm+IoPs=; b=sv1cR+EL+UiVqbNnC4hNcpElWR
	xLS9lxNDo0o67zbA2qpJJ6W0eH7vX3LgmnDE8CkRwaaqaVpNInhYbl1tjxmKTrriSc4ey8RoXkw/7
	M6lGb7NZ6jws/taHcJPbkMBK97LGQ8YYacyj6rZDXT6G6J/4F+fRHUWjO/+BZ5EhkNJv00QZ6RBeX
	iGMDAv27NnUKC44Iqi8R/HnYAPRPOGPVk5HCGxCwx0FrFcv9yF6m7xydHNJ3BGQF2H8OeoH4wTs4y
	6t096nFJORq435+v2G46Tg2TMtXpg+MsxkaU4aXOLwmI/DxrTA/bS+hofJAQvQbNc1ZIdlPIgdhB+
	wRKYYqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxdM-0000000AyPk-2L3y;
	Thu, 19 Feb 2026 06:35:32 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsxdH-0000000AyOi-3JS3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 06:35:31 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260219063515epoutp016aea667535c8884be2aa5e22b49da4ed~VklNb1f122563325633epoutp01M
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 06:35:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260219063515epoutp016aea667535c8884be2aa5e22b49da4ed~VklNb1f122563325633epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771482915;
	bh=aloF7MkDLud0BSRnjOsxj2IOpjpppNDUaB9hMm+IoPs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qWXPew85r6IG5W3gx73mRYzHEDp0D+8g86aZEz2fBRX6ccurudJZ9C5ZRjXr4IkJ5
	 YcVHyb7QyUjFXxk38WM4NxDzenGsJSfFP1TUOWiXbnbDK/5jUZO+4pvME1MBc3zOtx
	 1jyEhPfI1puzw8V9nSXMy8pFYQmNQG5IBUinqtCU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20260219063514epcas1p19a13513456955c828a2a6ebc020ae3e8~VklNByP640223502235epcas1p11;
	Thu, 19 Feb 2026 06:35:14 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.190]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fGkC62Vv0z3hhTN; Thu, 19 Feb
	2026 06:35:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833~VklMFQLR90223502235epcas1p1u;
	Thu, 19 Feb 2026 06:35:13 +0000 (GMT)
Received: from U22PB1-0412.tn.corp.samsungelectronics.net (unknown
	[10.91.134.171]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260219063513epsmtip2e76aff6f7aa8ad043e142729f46cb468~VklMAPEV01618616186epsmtip2K;
	Thu, 19 Feb 2026 06:35:13 +0000 (GMT)
From: Seongsu Park <sgsu.park@samsung.com>
To: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, Seongsu Park
	<sgsu.park@samsung.com>
Subject: [PATCH] mm/pkeys: Remove unused tsk parameter from
 arch_set_user_pkey_access()
Date: Thu, 19 Feb 2026 15:35:06 +0900
Message-Id: <20260219063506.545148-1-sgsu.park@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833
References: <CGME20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_223529_301937_1EFF86EF 
X-CRM114-Status: GOOD (  19.93  )
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

The tsk parameter in arch_set_user_pkey_access() is never used
in the function implementations across all architectures (arm64,
powerpc, x86).

Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
---
 arch/arm64/include/asm/pkeys.h   | 3 +--
 arch/arm64/mm/mmu.c              | 2 +-
 arch/powerpc/include/asm/pkeys.h | 8 +++-----
 arch/powerpc/mm/book3s64/pkeys.c | 3 +--
 arch/x86/include/asm/pkeys.h     | 3 +--
 arch/x86/kernel/fpu/xstate.c     | 3 +--
 arch/x86/mm/pkeys.c              | 3 +--
 mm/mprotect.c                    | 2 +-
 8 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/pkeys.h b/arch/arm64/include/asm/pkeys.h
index 0ca5f83ce148..cd286d3a9c94 100644
--- a/arch/arm64/include/asm/pkeys.h
+++ b/arch/arm64/include/asm/pkeys.h
@@ -12,8 +12,7 @@
 
 #define arch_max_pkey() 8
 
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
+int arch_set_user_pkey_access(int pkey, unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9ae7ce00a7ef..3fc8566708ea 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2207,7 +2207,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 }
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
+int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u64 new_por;
 	u64 old_por;
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 28e752138996..bd20d4106471 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -143,10 +143,8 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 	return __arch_override_mprotect_pkey(vma, prot, pkey);
 }
 
-extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-				       unsigned long init_val);
-static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-					    unsigned long init_val)
+extern int __arch_set_user_pkey_access(int pkey, unsigned long init_val);
+static inline int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return -EINVAL;
@@ -160,7 +158,7 @@ static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	if (pkey == 0)
 		return init_val ? -EINVAL : 0;
 
-	return __arch_set_user_pkey_access(tsk, pkey, init_val);
+	return __arch_set_user_pkey_access(pkey, init_val);
 }
 
 static inline bool arch_pkeys_enabled(void)
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index a974baf8f327..2002331b05ba 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -335,8 +335,7 @@ static inline void init_iamr(int pkey, u8 init_bits)
  * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
  * specified in @init_val.
  */
-int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-				unsigned long init_val)
+int __arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u64 new_amr_bits = 0x0ul;
 	u64 new_iamr_bits = 0x0ul;
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 2e6c04d8a45b..06ed2cd2592e 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -9,8 +9,7 @@
  */
 #define arch_max_pkey() (cpu_feature_enabled(X86_FEATURE_OSPKE) ? 16 : 1)
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
+extern int arch_set_user_pkey_access(int pkey, unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
 {
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 48113c5193aa..0caf91a7e062 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1080,8 +1080,7 @@ void __user *get_xsave_addr_user(struct xregs_state __user *xsave, int xfeature_
  * This will go out and modify PKRU register to set the access
  * rights for @pkey to @init_val.
  */
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-			      unsigned long init_val)
+int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u32 old_pkru, new_pkru_bits = 0;
 	int pkey_shift;
diff --git a/arch/x86/mm/pkeys.c b/arch/x86/mm/pkeys.c
index 7418c367e328..1dfcfaf77e23 100644
--- a/arch/x86/mm/pkeys.c
+++ b/arch/x86/mm/pkeys.c
@@ -42,8 +42,7 @@ int __execute_only_pkey(struct mm_struct *mm)
 	 * Set up PKRU so that it denies access for everything
 	 * other than execution.
 	 */
-	ret = arch_set_user_pkey_access(current, execute_only_pkey,
-			PKEY_DISABLE_ACCESS);
+	ret = arch_set_user_pkey_access(execute_only_pkey, PKEY_DISABLE_ACCESS);
 	/*
 	 * If the PKRU-set operation failed somehow, just return
 	 * 0 and effectively disable execute-only support.
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..fea7d56f55e3 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -978,7 +978,7 @@ SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, unsigned long, init_val)
 	if (pkey == -1)
 		goto out;
 
-	ret = arch_set_user_pkey_access(current, pkey, init_val);
+	ret = arch_set_user_pkey_access(pkey, init_val);
 	if (ret) {
 		mm_pkey_free(current->mm, pkey);
 		goto out;
-- 
2.34.1


