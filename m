Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E5CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=; b=LZqc8D6RbBHz0EbxKiN5bc4c7C
	j+wl8U15JMYzjDxfT5QmDz6LluQ0TkVbDNGPRIWBtzdFxm5YasRoAMO+i5cdwiu1KEbbbdDY1ECZv
	76kuSS16fZqkYuG1DSOo65lEt9jyAuamW/iYjNrqF336GBrGmK7NuKMZE3InglrCXTAvYGM0ImiC8
	ltxuO5vXJApduvEBXOY//6HDgsPm6mh1mlwknt2FsChW10Vc2IyDyA66n9aa7pTvTUcDEgsJ51A2P
	Z6Rpi8svkt/PJDbJkrP+pzw5qsgrNsArfh7HpGR624pZpBkskf+SNtEA5+2XeLZKFHUnSUdE3MC46
	Jlj+8HaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskR-0000000Bybe-126k;
	Wed, 17 Sep 2025 14:03:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjc-0000000BxKa-2nmI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=;
	b=ez6n5UPpSQ6ZNmJCDfByMelo2B56twKfod8kCsWJQ7H0Rg0ZW0/Ul0dS2w0TX1HFZvYyJM
	mEusXN/bf0OLci8Tv/czFl+DWKUDKkEiNSC3oI7sU9+X9C4qrR2RTy//iNi6xTAGeWhR+8
	N6HtEWYvlhpISUAf+PatIXLh47z14HottZvBLFYMLSlcUhulpHR9adRvn5VAMASBw6fC3J
	1jqyzvLJKD+NC5UDF/wKQb4Ft7QAkt+cUiiwUG2z9Oamo3QHUzJJMkbOU+1wCEYo3W4/6S
	4HdadsAXQrjt8cZPWE106Y3qZG9+ZxNyQoJ8u6ecTOpbRMpzjOyh6juy4dr3NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDshTHDdyOS+4oK6msGdvXtwIDG3+AYYE2weZr1dlWw=;
	b=rwGdc1qsu5S5j65PJ7t2hIXwy/yfQ7c2e3ZkcHB66LdLp6bgVTNqEuT/ekKgkLImxxJ9a2
	y8SM6YWr76MjHxCQ==
Date: Wed, 17 Sep 2025 16:00:25 +0200
Subject: [PATCH v3 23/36] vdso/datastore: Map pages through struct page
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-23-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=3281;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h36fVH5emtVkv73ZElXIXZ6NtrpKkOFLq+ychKgkihU=;
 b=1Q87PG88XCaYX4KGyp+D/lWyMrgzA9tTWURtmpJ3RbXmhrluuZY5yKr1xn7icSsFx1nd1JDK8
 Kfy4uo7mq3hB2beBjRr5EjdOngk6IDs5iYv4FiU/CAfCeAodj3ikfdB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070212_921180_EA5487AD 
X-CRM114-Status: GOOD (  15.73  )
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

An upcoming change will allocate the datapages dynamically instead of as
part of the kernel image. Such pages can only be mapped through
'struct page' and not through PFNs.

Prepare for the dynamic allocation by mapping through 'struct page'.

VM_MIXEDMAP is necessary for the call to vmf_insert_page() in the timens
prefault path to work.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/datastore.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 7377fcb6e1dfe31d02ffcae371fdf9da069ae4c1..6e5feb4a95b85f5a1cbdced7cdeddc593fcbad40 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -39,14 +39,15 @@ struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
 static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
-	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long pfn;
+	struct page *page, *timens_page;
+
+	timens_page = find_timens_vvar_page(vma);
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
 		if (!IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
+		page = virt_to_page(vdso_k_time_data);
 		if (timens_page) {
 			/*
 			 * Fault in VVAR page too, since it will be accessed
@@ -56,10 +57,10 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			vm_fault_t err;
 
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
-			err = vmf_insert_pfn(vma, addr, pfn);
+			err = vmf_insert_page(vma, addr, page);
 			if (unlikely(err & VM_FAULT_ERROR))
 				return err;
-			pfn = page_to_pfn(timens_page);
+			page = timens_page;
 		}
 		break;
 	case VDSO_TIMENS_PAGE_OFFSET:
@@ -72,24 +73,25 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		 */
 		if (!IS_ENABLED(CONFIG_TIME_NS) || !timens_page)
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
+		page = virt_to_page(vdso_k_time_data);
 		break;
 	case VDSO_RNG_PAGE_OFFSET:
 		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
+		page = virt_to_page(vdso_k_rng_data);
 		break;
 	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
 		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
 			return VM_FAULT_SIGBUS;
-		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
-			vmf->pgoff - VDSO_ARCH_PAGES_START;
+		page = virt_to_page(vdso_k_arch_data) + vmf->pgoff - VDSO_ARCH_PAGES_START;
 		break;
 	default:
 		return VM_FAULT_SIGBUS;
 	}
 
-	return vmf_insert_pfn(vma, vmf->address, pfn);
+	get_page(page);
+	vmf->page = page;
+	return 0;
 }
 
 const struct vm_special_mapping vdso_vvar_mapping = {
@@ -101,7 +103,7 @@ struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned
 {
 	return _install_special_mapping(mm, addr, VDSO_NR_PAGES * PAGE_SIZE,
 					VM_READ | VM_MAYREAD | VM_IO | VM_DONTDUMP |
-					VM_PFNMAP | VM_SEALED_SYSMAP,
+					VM_MIXEDMAP | VM_SEALED_SYSMAP,
 					&vdso_vvar_mapping);
 }
 

-- 
2.51.0


