Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAAEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tzxFsnLSLWQZCHI+iQIMYg54lueLiq7qLk7zBhjN8k=; b=kKoVI1a6VItt2eifc7W1Bpp2Cq
	R65TyG7sBQl2m9/5C+OQD427h5XsCWiEfmRExGmT2Xpy10RMVh1NMyRbl39fSz3LK/ZlC7xOtBV9b
	0RwZXRpcW5HEqj1xejCUHTtuj74D5+GX9f9vFwvVAxCErnrlENmOcg9O4ekz0r1bnmhbtHhmRG+ym
	YP9tyTcUR1y9406agJ2OEDRRAQJpUJEsKd2fKXzzAk04Y5ePs5GDg8+qtxPsru/ElBn6HlkIRoO6y
	mKCQaAXTLjnox70qhg99KQ1dfbA3RrfJ00Pp2TMESsLpdpxwcuK4HCuDGlLyjGwTbp4hHx5rdz6f3
	BZ5w3XKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKadl-00000007Cxt-0ROd;
	Mon, 09 Dec 2024 10:05:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPr-000000079RM-1oF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF5B113E;
	Mon,  9 Dec 2024 01:51:25 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27463F720;
	Mon,  9 Dec 2024 01:50:55 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 08/14] selftests/mm: Ensure pkey-*.h define inline functions only
Date: Mon,  9 Dec 2024 09:50:13 +0000
Message-ID: <20241209095019.1732120-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015059_556880_59FCAED0 
X-CRM114-Status: GOOD (  11.83  )
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

Headers should not define non-inline functions, as this prevents
them from being included more than once in a given program.
pkey-helpers.h and the arch-specific headers it includes currently
define multiple such non-inline functions.

In most cases those functions can simply be made inline - this patch
does just that. read_ptr() is an exception as it must not be
inlined. Since it is only called from protection_keys.c, we just move it
there.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-arm64.h      | 4 ++--
 tools/testing/selftests/mm/pkey-helpers.h    | 8 +-------
 tools/testing/selftests/mm/pkey-powerpc.h    | 4 ++--
 tools/testing/selftests/mm/pkey-x86.h        | 6 +++---
 tools/testing/selftests/mm/protection_keys.c | 7 +++++++
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index d9d2100eafc0..9897e31f16dd 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -81,11 +81,11 @@ static inline int get_arch_reserved_keys(void)
 	return NR_RESERVED_PKEYS;
 }
 
-void expect_fault_on_read_execonly_key(void *p1, int pkey)
+static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
 {
 }
 
-void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
+static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
 {
 	return PTR_ERR_ENOTSUP;
 }
diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 84376ab09545..bc81275a89d9 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -84,13 +84,7 @@ extern void abort_hooks(void);
 # define noinline __attribute__((noinline))
 #endif
 
-noinline int read_ptr(int *ptr)
-{
-	/* Keep GCC from optimizing this away somehow */
-	barrier();
-	return *ptr;
-}
-
+noinline int read_ptr(int *ptr);
 void expected_pkey_fault(int pkey);
 int sys_pkey_alloc(unsigned long flags, unsigned long init_val);
 int sys_pkey_free(unsigned long pkey);
diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
index 3d0c0bdae5bc..1bad310d282a 100644
--- a/tools/testing/selftests/mm/pkey-powerpc.h
+++ b/tools/testing/selftests/mm/pkey-powerpc.h
@@ -91,7 +91,7 @@ static inline int get_arch_reserved_keys(void)
 			return NR_RESERVED_PKEYS_64K_3KEYS;
 }
 
-void expect_fault_on_read_execonly_key(void *p1, int pkey)
+static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
 {
 	/*
 	 * powerpc does not allow userspace to change permissions of exec-only
@@ -105,7 +105,7 @@ void expect_fault_on_read_execonly_key(void *p1, int pkey)
 /* 4-byte instructions * 16384 = 64K page */
 #define __page_o_noops() asm(".rept 16384 ; nop; .endr")
 
-void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
+static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
 {
 	void *ptr;
 	int ret;
diff --git a/tools/testing/selftests/mm/pkey-x86.h b/tools/testing/selftests/mm/pkey-x86.h
index ac91777c8917..f7ecd335df1e 100644
--- a/tools/testing/selftests/mm/pkey-x86.h
+++ b/tools/testing/selftests/mm/pkey-x86.h
@@ -113,7 +113,7 @@ static inline u32 pkey_bit_position(int pkey)
 #define XSTATE_PKEY	0x200
 #define XSTATE_BV_OFFSET	512
 
-int pkey_reg_xstate_offset(void)
+static inline int pkey_reg_xstate_offset(void)
 {
 	unsigned int eax;
 	unsigned int ebx;
@@ -148,7 +148,7 @@ static inline int get_arch_reserved_keys(void)
 	return NR_RESERVED_PKEYS;
 }
 
-void expect_fault_on_read_execonly_key(void *p1, int pkey)
+static inline void expect_fault_on_read_execonly_key(void *p1, int pkey)
 {
 	int ptr_contents;
 
@@ -157,7 +157,7 @@ void expect_fault_on_read_execonly_key(void *p1, int pkey)
 	expected_pkey_fault(pkey);
 }
 
-void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
+static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 pkey)
 {
 	return PTR_ERR_ENOTSUP;
 }
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index fcbebc4490b4..82ece325b70c 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -54,6 +54,13 @@ int test_nr;
 u64 shadow_pkey_reg;
 int dprint_in_signal;
 
+noinline int read_ptr(int *ptr)
+{
+	/* Keep GCC from optimizing this away somehow */
+	barrier();
+	return *ptr;
+}
+
 void cat_into_file(char *str, char *file)
 {
 	int fd = open(file, O_RDWR);
-- 
2.47.0


