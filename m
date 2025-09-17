Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27169CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=; b=NtXcE+aKdIkSg+3/rup8I+MDUI
	H9RtePziyvioG6793LhjyNJM9CuFXXsmPQNsIKSsKSOY4XFeIWpTZ/Ir5LWEn7xGqvRyFZuxHTQM0
	1qBiOQOaXsd21er758C8zkm2MioEx/6Ki30D73hbiMMkFESpobN4/YbkPAV9KJasjlf34y382EKCr
	paEH36KoymBnbLjWmjqUFnZ4K6zcD9vqxJygaqJlfVhbLii+ovsM7jZSjdX8Yobg5c81wJFwPpXGr
	RmwZZCxThNw8/D/lnBzfpl4papOF1dBSssgT7MkTiQeMFHmLQmXKSUvjSIwp4zF3C41mYQNxDnKGe
	DTADhZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskR-0000000Bycl-3caj;
	Wed, 17 Sep 2025 14:03:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjd-0000000BxNG-2V8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=;
	b=zzcQj+H+wV5XHh7JlmQgfczb/SrRXVkOy25S1jepBvRY1OvCDzb0SJCkznPomBX9mcgfqF
	/ZYOkCYJis4p6VSLvvhey+9FR+llhxD/ioegVLEy6q2nsdjOJRDj4L92e+gfwsHHc7aLBT
	WAxmW2WVLQrlrl+9xqJ0YeplQxUmBwwooT1LSX0mDpGzhqX0Lg5TzIYdtLFydRxNHAyZjR
	9wlheU8BHYcKkSSJZ18mF61aXUDCQ1AIhdN3YbwX7YvjwoTE5S4BQeWZuh7g4M9/Rb1I43
	HyEVJiFPQMWc0/bsduhYPPqU5u6dFf0GXivewKKUYVBT8UeBOecHV2X5jKUB8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gpmb9cDwEzk02Y+DfJzHKrCKqKqd+Vk47vVVsRIqy1A=;
	b=GTuw+m+wQOSdJ2yMAXigPYcPa71hWYh+ILRSyBQvDKyMeYS8Wfje/LSrijnvlSXpaQR3m/
	wxvLNd6jekFY0BDQ==
Date: Wed, 17 Sep 2025 16:00:26 +0200
Subject: [PATCH v3 24/36] vdso/datastore: Allocate data pages dynamically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-24-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=4686;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QgZWh2CTRuRkVkUn1WW0CJWymakhf5V9YWE5DyFtGgI=;
 b=pOWKEqrLPj1SLyPcTKi14JdVomBv9bCCXIehSogW2jrTVnFtKz2E7s3mSIq15X4wwIsu4UKkw
 rJVX1dAWNHLA5UUNnHFOZ/ONopbJqhLqNpaKXm/JddK/gB3KKSSLbi2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070213_852765_AEC55104 
X-CRM114-Status: GOOD (  15.96  )
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

Allocating the datapages as part of the kernel image does not work on
SPARC. It is also problematic with regards to dcache aliasing as there is
no guarantee that the virtual addresses used by the kernel are compatible
with those used by userspace.

Allocate the data pages through the page allocator instead.
Unused pages in the vDSO VMA are still allocated to keep the virtual
addresses aligned.

These pages are used by both the timekeeping, random pool and architecture
initialization code. Introduce a new early initialization step, to make
sure they are available when needed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/vdso_datastore.h |  6 ++++++
 init/main.c                    |  2 ++
 lib/vdso/datastore.c           | 44 ++++++++++++++++++++++--------------------
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
index a91fa24b06e09321fdff8c2c7bdfbc1b206db574..0b530428db711e58660e797d9d3cf5dce60217fe 100644
--- a/include/linux/vdso_datastore.h
+++ b/include/linux/vdso_datastore.h
@@ -2,9 +2,15 @@
 #ifndef _LINUX_VDSO_DATASTORE_H
 #define _LINUX_VDSO_DATASTORE_H
 
+#ifdef CONFIG_HAVE_GENERIC_VDSO
 #include <linux/mm_types.h>
 
 extern const struct vm_special_mapping vdso_vvar_mapping;
 struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
 
+void __init vdso_setup_data_pages(void);
+#else /* !CONFIG_HAVE_GENERIC_VDSO */
+static inline void vdso_setup_data_pages(void) { }
+#endif /* CONFIG_HAVE_GENERIC_VDSO */
+
 #endif /* _LINUX_VDSO_DATASTORE_H */
diff --git a/init/main.c b/init/main.c
index 0ee0ee7b7c2c0a7aceb6f428f8ee61edeead60ec..0d4510a7a5c21a47a040c05da1db919211706a7e 100644
--- a/init/main.c
+++ b/init/main.c
@@ -103,6 +103,7 @@
 #include <linux/randomize_kstack.h>
 #include <linux/pidfs.h>
 #include <linux/ptdump.h>
+#include <linux/vdso_datastore.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1007,6 +1008,7 @@ void start_kernel(void)
 	srcu_init();
 	hrtimers_init();
 	softirq_init();
+	vdso_setup_data_pages();
 	timekeeping_init();
 	time_init();
 
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 6e5feb4a95b85f5a1cbdced7cdeddc593fcbad40..67799e8919c202e0800cb78ff70919f9604ac492 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -1,41 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/linkage.h>
 #include <linux/mm.h>
 #include <linux/time_namespace.h>
 #include <linux/types.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
 
-/*
- * The vDSO data page.
- */
 #ifdef CONFIG_GENERIC_GETTIMEOFDAY
-static union {
-	struct vdso_time_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_time_data_store __page_aligned_data;
-struct vdso_time_data *vdso_k_time_data = &vdso_time_data_store.data;
-static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
+struct vdso_time_data *vdso_k_time_data;
+static_assert(sizeof(struct vdso_time_data) <= PAGE_SIZE);
 #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 #ifdef CONFIG_VDSO_GETRANDOM
-static union {
-	struct vdso_rng_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_rng_data_store __page_aligned_data;
-struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
-static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
+struct vdso_rng_data *vdso_k_rng_data;
+static_assert(sizeof(struct vdso_rng_data) <= PAGE_SIZE);
 #endif /* CONFIG_VDSO_GETRANDOM */
 
 #ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
-static union {
-	struct vdso_arch_data	data;
-	u8			page[VDSO_ARCH_DATA_SIZE];
-} vdso_arch_data_store __page_aligned_data;
-struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
+struct vdso_arch_data *vdso_k_arch_data;
 #endif /* CONFIG_ARCH_HAS_VDSO_ARCH_DATA */
 
+void __init vdso_setup_data_pages(void)
+{
+	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
+	struct folio *folio = folio_alloc(GFP_KERNEL, order);
+
+	if (!folio)
+		panic("Unable to allocate VDSO storage pages");
+
+	if (IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
+		vdso_k_time_data = page_address(folio_page(folio, VDSO_TIME_PAGE_OFFSET));
+
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		vdso_k_rng_data = page_address(folio_page(folio, VDSO_RNG_PAGE_OFFSET));
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
+		vdso_k_arch_data = page_address(folio_page(folio, VDSO_ARCH_PAGES_START));
+}
+
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {

-- 
2.51.0


