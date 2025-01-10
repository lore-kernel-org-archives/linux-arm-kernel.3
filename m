Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26936E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTlwrpnN/Mdv7Nv7w9MmLSi1lCOGIszv1xkWYWYm93s=; b=jjXpZfjAfRFXVygM7LU9lv5Zdl
	7JwRl13/jyR0QnqlZzprtMeF9iykzGKAP44x8zFNp+rNcuM3Yv3Hi9eZSY7xDnEzJaHtJPmKtKqbs
	E3Qr5Ya6DtNVHboyvgQA45tuMpWBTGvEOJ8rfXEiyqtwJiyk8SuFcTjx7aGE029D3bQkif7mAair8
	UcnuxI2RhhSXpiryQLQfY//wHWtkmnDqKF6G/U+oLXaQpFT1Zi0xDvFHSoLSwjoktP8fm8JUk9M0R
	wb3o5ye/0xnBAYCPs3fhvds7PbPLbD2dyeMbN9at5ToidmU/p+0GAXSeh9D1vFT8g2yqs/Yycz25I
	jeglizAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHFo-0000000G5WS-48VC;
	Fri, 10 Jan 2025 15:48:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGs7-0000000Fu1o-1SR6;
	Fri, 10 Jan 2025 15:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wTlwrpnN/Mdv7Nv7w9MmLSi1lCOGIszv1xkWYWYm93s=; b=DRfsQvENTxRekduvaMUiqLz11A
	MC2cdGAzZ1FYK6xAvJ9VDJ6YHm30pir/fv3caLjWJQBnwbEeFOfPmp8BlsBjRRygKxwlCgjjjGsUl
	Mc38+9Z+ZtXtKzI0kT0CMjtvI82dNkQMXPM2J5cJetZgyjxaMWWq0aTGHasAfXVkVVPfKChfSFJ+S
	6n5UEl2hPOlU2JCl7y/CJkrEVsNlIbaKu3Jd2XCJzSFaosSJcHKBwnoveP70WOVcrdK3nqs/Dam9x
	ya5vyV+Khcz9lSNr3dJor2s5so9QWL96f2SxhW1eLKstNwBCkU/hiKNMCFVMTcSX6RotiNFvixmE3
	6N3Ee9EA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGs1-00000009pJc-10si;
	Fri, 10 Jan 2025 15:24:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wTlwrpnN/Mdv7Nv7w9MmLSi1lCOGIszv1xkWYWYm93s=;
	b=nw4V9z7/hGZPSByeCTKI8H5vdRk8cSFV463S+hMSmHDM5wUVTgbPaGq2Fn+OzpxrRsHTuN
	cSLa6MxSQHZQEh9m6tQ51Dm8ld4veu2Ye2VYdkBpOwLo4K1231Lr58iv27cUh6GOXc8rEp
	NOCLFTdK4yysg1d1CVgnKgzPg/f6XrGRuOBPM469plIb9/Cx5Zti2jTZo+/lyCRw2eDgaC
	inLesQmWwHvjxdjMaj2NE+OmET7cR9J437dI+rgn0xqtGPhHMTtSzqd4U4OSJv7iauqy+R
	GUXBRpcYjLE8+5os5ol0ioEDlq21+wtU7vueoo52vM/B9PQt52+NX+rgB67HvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wTlwrpnN/Mdv7Nv7w9MmLSi1lCOGIszv1xkWYWYm93s=;
	b=WT/B9qwnuf7sYBx/35OCt9hm9ZvLbooZn1HxehyYeOcUhAilEzepaqi4NelWtuAADyQVS9
	jT56E5eydoePu5AQ==
Date: Fri, 10 Jan 2025 16:23:45 +0100
Subject: [PATCH v2 06/18] vdso: Add generic random data storage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-vdso-store-rng-v2-6-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=7434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TOR0HRUliJCIUuvHYcqOmYpJLHep6FFOCk6zZu1ILJU=;
 b=3boEYEI5Nm8k5FTdZejwZ1IkT69WAiA9aBtiQ/lcCWX4EdLOyeK+PqxfGoyMP6zfvl3hi/oIf
 nbSbyD79vz4CdFUJf2SAJi6HeklAmszTsxI2TM1q6M92hFiZeB9w/Ze
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_152422_623017_EBFF4654 
X-CRM114-Status: GOOD (  21.09  )
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

Extend the generic vDSO data storage with a page for the random state data.
The random state data is stored in a dedicated page, as the existing
storage page is only meant for time-related, time-namespace-aware data.
This simplifies to access logic to not need to handle time namespaces
anymore and also frees up more space in the time-related page.

In case further generic vDSO data store is required it can be added to
the random state page.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c               |  6 +++---
 include/asm-generic/vdso/vsyscall.h | 12 ++++++++++++
 include/vdso/datapage.h             | 10 ++++++++++
 lib/vdso/datastore.c                | 14 ++++++++++++++
 lib/vdso/getrandom.c                |  8 ++++++--
 5 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 23ee76bbb4aa728274bf9980a60b863216d88797..84efda7bede348401db2ed1c443e5ab2bc5dbd2b 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -278,7 +278,7 @@ static void crng_reseed(struct work_struct *work)
 	WRITE_ONCE(base_crng.generation, next_gen);
 #ifdef CONFIG_VDSO_GETRANDOM
 	/* base_crng.generation's invalid value is ULONG_MAX, while
-	 * _vdso_rng_data.generation's invalid value is 0, so add one to the
+	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
 	 * is ordered with the write above to base_crng.generation. Pairs with
 	 * the smp_rmb() before the syscall in the vDSO code.
@@ -290,7 +290,7 @@ static void crng_reseed(struct work_struct *work)
 	 * because the vDSO side only checks whether the value changed, without
 	 * actually using or interpreting the value.
 	 */
-	smp_store_release((unsigned long *)&__arch_get_k_vdso_rng_data()->generation, next_gen + 1);
+	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
 #endif
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
@@ -743,7 +743,7 @@ static void __cold _credit_init_bits(size_t bits)
 			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
 #ifdef CONFIG_VDSO_GETRANDOM
-		WRITE_ONCE(__arch_get_k_vdso_rng_data()->is_ready, true);
+		WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 #endif
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index ac5b93b91993224da245e80031b9f51e0c083f3c..a5f973e4e2723ef1815c88a7846f7c477e3febd9 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -13,6 +13,13 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 }
 #endif
 
+#ifndef __arch_get_vdso_u_rng_data
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_data(void)
+{
+	return &vdso_u_rng_data;
+}
+#endif
+
 #else  /* !CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_get_k_vdso_data
@@ -25,6 +32,11 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 
 #define __arch_get_vdso_u_time_data __arch_get_vdso_data
 
+#ifndef __arch_get_vdso_u_rng_data
+#define __arch_get_vdso_u_rng_data() __arch_get_vdso_rng_data()
+#endif
+#define vdso_k_rng_data __arch_get_k_vdso_rng_data()
+
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_update_vsyscall
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b3d8087488ff35fbbc4d5058ae21e2c6cc58ed9c..7dbc8797e3b8923c06f4b6b34790766e68b2abd2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -144,8 +144,10 @@ extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("h
 extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
+extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));
 
 extern struct vdso_time_data *vdso_k_time_data;
+extern struct vdso_rng_data *vdso_k_rng_data;
 #endif
 
 /**
@@ -161,6 +163,7 @@ union vdso_data_store {
 enum vdso_pages {
 	VDSO_TIME_PAGE_OFFSET,
 	VDSO_TIMENS_PAGE_OFFSET,
+	VDSO_RNG_PAGE_OFFSET,
 	VDSO_NR_PAGES
 };
 
@@ -184,9 +187,16 @@ enum vdso_pages {
 
 #else /* !__ASSEMBLY__ */
 
+#ifdef CONFIG_VDSO_GETRANDOM
+#define __vdso_u_rng_data	PROVIDE(vdso_u_rng_data = vdso_u_data + 2 * PAGE_SIZE);
+#else
+#define __vdso_u_rng_data
+#endif
+
 #define VDSO_VVAR_SYMS						\
 	PROVIDE(vdso_u_data = . - __VDSO_PAGES * PAGE_SIZE);	\
 	PROVIDE(vdso_u_time_data = vdso_u_data);		\
+	__vdso_u_rng_data					\
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index d3181768424cc3ee2e980bd537ac5ca14dfcb304..9260b00dc8520af109bd9dd05ac7f7504eafbea0 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -17,6 +17,15 @@ struct vdso_time_data *vdso_k_time_data = vdso_time_data_store.data;
 static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
 #endif /* CONFIG_HAVE_GENERIC_VDSO */
 
+#ifdef CONFIG_VDSO_GETRANDOM
+static union {
+	struct vdso_rng_data	data;
+	u8			page[PAGE_SIZE];
+} vdso_rng_data_store __page_aligned_data;
+struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
+static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
+#endif /* CONFIG_VDSO_GETRANDOM */
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
@@ -53,6 +62,11 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			return VM_FAULT_SIGBUS;
 		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
 		break;
+	case VDSO_RNG_PAGE_OFFSET:
+		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+			return VM_FAULT_SIGBUS;
+		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
+		break;
 	default:
 		return VM_FAULT_SIGBUS;
 	}
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 938ca539aaa64bc46280ef6dd17aa661126699eb..440f8a6203a69a6462aafee4ad8d5670cef6a353 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -12,6 +12,9 @@
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 
+/* Bring in default accessors */
+#include <vdso/vsyscall.h>
+
 #undef PAGE_SIZE
 #undef PAGE_MASK
 #define PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
@@ -152,7 +155,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 
 		/*
 		 * Prevent the syscall from being reordered wrt current_generation. Pairs with the
-		 * smp_store_release(&_vdso_rng_data.generation) in random.c.
+		 * smp_store_release(&vdso_k_rng_data->generation) in random.c.
 		 */
 		smp_rmb();
 
@@ -256,5 +259,6 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
 static __always_inline ssize_t
 __cvdso_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state, size_t opaque_len)
 {
-	return __cvdso_getrandom_data(__arch_get_vdso_rng_data(), buffer, len, flags, opaque_state, opaque_len);
+	return __cvdso_getrandom_data(__arch_get_vdso_u_rng_data(), buffer, len, flags,
+				      opaque_state, opaque_len);
 }

-- 
2.47.1


