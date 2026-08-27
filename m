Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9776C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJiY7FvuPSk4vmkG+0TxlMWylcjf3Tl2Za7dTctMfp4=; b=wMPVjs/CuiEu0FoM1nM33603+C
	qytVbORm9HQFgW1AC3qCVRoTuMoTN+/ohDb464J6runejspMH2tY80tlKwHYYrO/EG2WgW2FwzH8O
	f2sWzYXlcFVGfmPsvjnoDbFEQvJbZPqrPv+DArvHEfTVYai+crnYkIZYH1d6lR45Juc16C3sx4ArR
	PPtd3WBvH+CXPap5stpAOmWUHZ7U45T6jQZAIcRvCqyw6gmXc+BJv7hMQ1kgZSdR1qMjxCK6GQpO5
	i44V1FUzkR2n4XvcGgz4WLtxyJ3OW/rv+0n4Ord2yp8cQ2WYkWW3m7y7KOw3aMHhWs+HY35NoV3r7
	tGyFHBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDb-00000004OXz-0JbH;
	Thu, 27 Aug 2026 16:44:47 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDQ-00000004OTI-32f8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:37 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-472c330e555so14732f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849074; x=1788453874; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJiY7FvuPSk4vmkG+0TxlMWylcjf3Tl2Za7dTctMfp4=;
        b=PLjjf4UK1fVLC90DsccYX83LS8yIpbbhYGqYpEohtE4TTRW43pkKVXLFY9rquNnq4d
         f0psOB8kcwjpP2SgtnnGOJyhr9M0cFfv/qjRGn0cTFkvpFLgpVUpzAmvY9fKiFm4MZKj
         bReN2V8lSO194TgPcZZioZ+BdBxnGJqybJOzGKrDs3mElq1gIE+JdZAyg2CAdbZI/nz3
         A6XeOc3S70o5W+wELioolcTwNBrWtfMFyHo7714I1dMcB2N4+OZuJi1Go7gysoxg95h6
         k93dac8/UOJ6Kxxi9HJ0McTe5So9hDOcf5wZEP03hMSPCGm6/mS0vW/wGU7Y2HaUvJSU
         wKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849074; x=1788453874;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJiY7FvuPSk4vmkG+0TxlMWylcjf3Tl2Za7dTctMfp4=;
        b=IuAtIHJ16HzHqNy/EwQcCcTy4iDpbRShiidDcfYK0slNxI+JnKWAbJiZfHp6IW/qos
         Xpcvh3AcfMofi4isPSxGYEST+HRkvsptHVKK+dt3WterXuuzPlogugN5Nax3t2B1kfDa
         DEjAifZDFFykVydEEbybbQxHWo49KwgN9REPuvNIDZZgh81Q+9uk/BXf2UYXYl6053PO
         Ynk8sg34aiwz3/2yPr1bOuqT5kfVdWR+gAmzUuDZECpb7fVJlCOr9Go0Ja/f4ul8eNUM
         54wQlUZZJV10X2tfWjMdkXrruprjM1qED48/yM6K1LXWkyWOIFCNvQIuae6qbC96WC03
         nQvA==
X-Gm-Message-State: AFuF++k7KKwguKc6/sgb9yJq0bz1v8i71LIk7D25XPs/Ii4+X8nTWYJt
	1yEGnpmy5bg1P2q9TUffT50rldnP5zwWzMK9miUZwLxF/g/IyQT/9OIEw7skd9Lu/hqsw3iWOQ=
	=
X-Received: from wmbz8.prod.google.com ([2002:a05:600c:c088:b0:493:d1ba:af39])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8581:b0:499:a760:722f
 with SMTP id 5b1f17b1804b1-49b91c47bf8mr2996215e9.13.1787849073998; Thu, 27
 Aug 2026 09:44:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:13 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860; i=ardb@kernel.org;
 h=from:subject; bh=99CV4XPf1Je/vZyhxqcfc6DlqZHXzUdS1hB8ZXFmVcM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZtyKEpF9jaJhbA6KjNMV+X7sWlpw42m3Y2rLLr6CZ
 65/VmV3lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlc2c7wP25nM5+wTNEvn7/T
 0o0Vp62N/qPHaDNpi5/dLeX3l+zi4xn+Z2mUsya0F9QwvRRpyU87wZA/88cZ0YzQtSvq/mbLrJn CDQA=
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-9-ardb+git@google.com>
Subject: [RFC PATCH v2 3/4] arm64: mm: Create r/o page table region that
 permits updates
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094436_831641_4644012D 
X-CRM114-Status: GOOD (  15.93  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Generalize the handling of swapper_pg_dir, and apply the fixmap fallback
for page table updates to all page tables in the .rodata..pgtbl section.

Currently, this holds only swapper_pg_dir, but this will be expanded in
subsequent patches.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 -----
 arch/arm64/kernel/vmlinux.lds.S  |  6 +++++
 arch/arm64/mm/mmu.c              | 26 +++++++++++++++++---
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 799cd9d52c28..de0a07dae83a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -817,12 +817,6 @@ extern pgd_t reserved_pg_dir[];
 
 void try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval);
 
-static inline bool in_swapper_pgdir(void *addr)
-{
-	return ((unsigned long)addr & PAGE_MASK) ==
-	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
-}
-
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
 	__put_kernel_nofault(pmdp, &pmd, pmd_t, fault);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..2cda0b7c41d4 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -243,9 +243,15 @@ SECTIONS
 	reserved_pg_dir = .;
 	. += PAGE_SIZE;
 
+	__rodata_pgtbl_start = .;
 	swapper_pg_dir = .;
 	. += PAGE_SIZE;
 
+	.pgtbl.ro_after_init : ALIGN(PAGE_SIZE) {
+		*(.pgtbl.ro_after_init)
+	}
+	__rodata_pgtbl_end = .;
+
 	. = ALIGN(SEGMENT_ALIGN);
 	__init_begin = .;
 	__inittext_begin = .;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b97e4bf99ca5..dad482d66f17 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -65,17 +65,27 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
 
 static DEFINE_MUTEX(fixmap_lock);
 
+static struct range kimg_ropgtbl_range __ro_after_init;
+
 void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 {
 	static DEFINE_SPINLOCK(lock);
+	bool is_lm = __is_lm_address(ptvalp);
+	u64 pa = is_lm ? __pa(ptvalp) : __pa_symbol(ptvalp);
 
-	BUG_ON(!in_swapper_pgdir(ptvalp));
+	if (!range_contains(&kimg_ropgtbl_range,
+			    &DEFINE_RANGE(pa, pa + sizeof(ptval_t))))
+		BUG();
 
 	/*
-	 * Don't bother with the fixmap if swapper_pg_dir is still mapped
+	 * Don't bother with the fixmap if .rodata is still mapped
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
+		/* no fault should have occurred for a kimg address */
+		BUG_ON(!is_lm);
+
+		ptvalp = (ptval_t *)__phys_to_kimg(pa);
 		WRITE_ONCE(*ptvalp, ptval);
 		dsb(ishst);
 		isb();
@@ -83,7 +93,7 @@ void noinstr try_set_readonly_ptval(ptval_t *ptvalp, ptval_t ptval)
 	}
 
 	guard(spinlock)(&lock);
-	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, __pa_symbol(ptvalp));
+	ptvalp = (ptval_t *)set_fixmap_offset(FIX_PTVAL, pa);
 	WRITE_ONCE(*ptvalp, ptval);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
@@ -1177,6 +1187,14 @@ static inline void arm64_kfence_map_pool(void) { }
 
 #endif /* CONFIG_KFENCE */
 
+static void __init record_ropgtbl_phys_range(void)
+{
+	extern const char __rodata_pgtbl_start[], __rodata_pgtbl_end[];
+
+	kimg_ropgtbl_range = DEFINE_RANGE(__pa_symbol(__rodata_pgtbl_start),
+					  __pa_symbol(__rodata_pgtbl_end));
+}
+
 static void __init map_mem(void)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
@@ -1189,6 +1207,8 @@ static void __init map_mem(void)
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
+	record_ropgtbl_phys_range();
+
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
 	 * the linear region is only possible if it is guaranteed that no table
-- 
2.55.0.887.g758fc8c411-goog


