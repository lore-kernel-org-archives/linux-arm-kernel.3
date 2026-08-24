Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DC6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnnChx9iCPsiFb6C13+bXpD7uMgqURtwnyfYPAvxctw=; b=XHD/ZoAs2o/6TsBILvPxxAPjao
	nNQQhrUPg2+hPUNWJXefaMsrExLoUVBIUpfBznz4QEbIOZc2oCVFHxMzLUjs8yplwpngdlGrJKhVe
	iBMjMY0J7ZNT0oDbly/Rgw4T0L2L2TYJ3Wk+wYNqIW3HpOWyiZRb5g0AYDJEeWOpdZd4X7DQ3qDba
	kfokdp9Y2xrsaq/WlBk/jKu8hrJ6KD42PCVyAGgj+M3EURKLx7ILNGY3E1fnaO8722F7F5HOIEfxx
	wkqtBsDikLtBl5HEnpsoB1W/olHQpOAcFmRub3J5fGQwt6Bv5ZdFjuv0Ef6e9sVJxSaPIUB5Lato0
	OQ4QgqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBN-0000000H0Br-3ilK;
	Mon, 24 Aug 2026 16:05:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXBH-0000000H09k-1TlZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:05:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C63FC1756;
	Mon, 24 Aug 2026 09:05:46 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67FFE3F85F;
	Mon, 24 Aug 2026 09:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787587550; bh=z3HgR5JrV87UUef5omwF+7GRZHLLMVnWFEywPKlYZN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzfdHSGUI4MR4hpSZEjGYjwit9tca6UiDVjwbEHbeT9dUPE7UHQ86d+HRFpo98vex
	 uwdglyCvZ9EqcSEXQhaNrCFd3FdwW9vV37RTPRQ7R85BMRMoAFvajoPp1TuM/0tmJ7
	 7w742yIUkmItIqYVPtE8QtBTxCTTT7GLQC3vNQVc=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	bpf@vger.kernel.org (open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - CORE)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 1/7] arm64: uaccess: Add batched kernel nofault accessors
Date: Mon, 24 Aug 2026 17:04:46 +0100
Message-ID: <20260824160523.3907021-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090551_468775_7511E19A 
X-CRM114-Status: GOOD (  14.18  )
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

With Hardware Tag-Based KASAN in asynchronous or asymmetric mode, arm64
sets and clears PSTATE.TCO around every kernel nofault load or store. A
loop pays that cost for every access even though tag checking can stay
disabled until the operation finishes.

Separate TCO management from the fault-tolerant access and add begin and
end hooks for callers that want to batch several accesses. Keep the
existing accessors self-contained, and provide aliases and no-op hooks
for architectures that do not need special handling.

A context switch re-enables tag checking, so a batched region must not
schedule. Continue to evaluate accessor arguments before overriding TCO,
as those expressions may block.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 arch/arm64/include/asm/uaccess.h | 71 ++++++++++++++++++++++++--------
 include/linux/uaccess.h          | 16 +++++++
 2 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 9f5bd9c69c249..1a14eb2a51dce 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -270,28 +270,43 @@ do {									\
 #define get_user	__get_user
 
 /*
- * We must not call into the scheduler between __mte_enable_tco_async() and
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
+ * Nofault load without TCO management for use inside a
+ * __begin/__end_kernel_nofault_bare() region.
  */
-#define __get_kernel_nofault(dst, src, type, err_label)			\
+#define __get_kernel_nofault_bare(dst, src, type, err_label)		\
 do {									\
 	__typeof__(dst) __gkn_dst = (dst);				\
 	__typeof__(src) __gkn_src = (src);				\
 	do { 								\
 		__label__ __gkn_label;					\
-									\
-		__mte_enable_tco_async();				\
 		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
 		      (__force type *)(__gkn_src), __gkn_label, K);	\
-		__mte_disable_tco_async();				\
 		break;							\
 	__gkn_label:							\
-		__mte_disable_tco_async();				\
 		goto err_label;						\
 	} while (0);							\
 } while (0)
 
+/*
+ * We must not call into the scheduler between __mte_enable_tco_async() and
+ * __mte_disable_tco_async(). As dst and src may contain blocking functions,
+ * evaluate them before overriding TCO.
+ */
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	__label__ __gkn_tco_err;					\
+	__typeof__(dst) __gkn_tco_dst = (dst);				\
+	__typeof__(src) __gkn_tco_src = (src);				\
+	__mte_enable_tco_async();					\
+	__get_kernel_nofault_bare(__gkn_tco_dst, __gkn_tco_src, type,	\
+				     __gkn_tco_err);			\
+	__mte_disable_tco_async();					\
+	break;								\
+__gkn_tco_err:								\
+	__mte_disable_tco_async();					\
+	goto err_label;							\
+} while (0)
+
 #define __put_mem_asm(store, reg, x, addr, label, type)			\
 	asm goto(							\
 	"1:	" store "	" reg "0, [%1]\n"			\
@@ -366,28 +381,48 @@ do {									\
 
 #define put_user	__put_user
 
-/*
- * We must not call into the scheduler between __mte_enable_tco_async() and
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
- */
-#define __put_kernel_nofault(dst, src, type, err_label)			\
+/* Nofault store without TCO management; see __get_kernel_nofault_bare. */
+#define __put_kernel_nofault_bare(dst, src, type, err_label)		\
 do {									\
 	__typeof__(dst) __pkn_dst = (dst);				\
 	__typeof__(src) __pkn_src = (src);				\
 									\
 	do {								\
 		__label__ __pkn_err;					\
-		__mte_enable_tco_async();				\
 		__raw_put_mem("str", *((type *)(__pkn_src)),		\
 			      (__force type *)(__pkn_dst), __pkn_err, K);	\
-		__mte_disable_tco_async();				\
 		break;							\
 	__pkn_err:							\
-		__mte_disable_tco_async();				\
 		goto err_label;						\
 	} while (0);							\
-} while(0)
+} while (0)
+
+/*
+ * We must not call into the scheduler between __mte_enable_tco_async() and
+ * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
+ * functions, we must evaluate these outside of the critical section.
+ */
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	__label__ __pkn_tco_err;					\
+	__typeof__(dst) __pkn_tco_dst = (dst);				\
+	__typeof__(src) __pkn_tco_src = (src);				\
+	__mte_enable_tco_async();					\
+	__put_kernel_nofault_bare(__pkn_tco_dst, __pkn_tco_src, type,	\
+				     __pkn_tco_err);			\
+	__mte_disable_tco_async();					\
+	break;								\
+__pkn_tco_err:								\
+	__mte_disable_tco_async();					\
+	goto err_label;							\
+} while (0)
+
+/*
+ * A context switch re-enables tag checking, hence the no-scheduling
+ * requirement for a bare nofault region.
+ */
+#define __begin_kernel_nofault_bare()	__mte_enable_tco_async()
+#define __end_kernel_nofault_bare()	__mte_disable_tco_async()
 
 extern unsigned long __must_check __arch_copy_from_user(void *to, const void __user *from, unsigned long n);
 #define raw_copy_from_user(to, from, n)					\
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index eddbbb65ccc4f..7ae1854673471 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -637,6 +637,22 @@ do {							\
 
 #endif  /* !__get_kernel_nofault */
 
+/*
+ * Architectures may use the begin/end hooks to establish state shared by a
+ * sequence of bare nofault accesses. Every path out of the region must call
+ * the end hook. The region, including expressions passed to the bare
+ * accessors, must not call into the scheduler.
+ */
+#ifndef __get_kernel_nofault_bare
+#define __get_kernel_nofault_bare	__get_kernel_nofault
+#define __put_kernel_nofault_bare	__put_kernel_nofault
+#endif
+
+#ifndef __begin_kernel_nofault_bare
+#define __begin_kernel_nofault_bare()	do {} while (0)
+#define __end_kernel_nofault_bare()	do {} while (0)
+#endif
+
 /**
  * get_kernel_nofault(): safely attempt to read from a location
  * @val: read into this variable
-- 
2.47.3


