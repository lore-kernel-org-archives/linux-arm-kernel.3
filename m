Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E893C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClkE+3sE7+kWf5twKe62RSOxAn4PaMKVpn27pL4jQgU=; b=BzULZhaEyLSs9lQGb6FP62oUvD
	i7DBiL1ASgRRRZvV7OUTaTLQNstNWTrYHsiTvBp/lAmQ5UyfhLde9I8L2V5v78285WE+DqtN31wC5
	jlGEH3lOzsJLnltk8ljGfH+vFPJ5QT4c98IYBdnVR4iFMmnOmrFHEpPSuBmlwPR92xpFdYmd2mwGe
	cFEQDxUEJ7Vc1cYvB23ntePz+eHreS05lxbZFxdBLgIUmi1SlaejxdBJPdshsPAurSm7ZR2b2UOXR
	iQQl4Xn9pWTrHUkDOMHXol4kln8iJ8KPc8+CMuxMM8ze14MwGYiXOYrZ5QrhfjVB4JkTFzn5GoGez
	WLstH+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rAy-0000000DA8y-3bjk;
	Sat, 05 Apr 2025 00:14:20 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0r7W-0000000D9Tz-2FPM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:10:47 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85ed07f832dso252682139f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 17:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743811845; x=1744416645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ClkE+3sE7+kWf5twKe62RSOxAn4PaMKVpn27pL4jQgU=;
        b=Q+x1MUEb3e/o2lDEcibukkRyV3jPaGTn1lblnbzbDiQ5DfH29fMwQrJpbwWhzDB09p
         ARuH7SX6BuuVxTvUqVSFRhxh8hkIsSMIuBQRC7VRzDh2pOBLOfRRhV614sNjFUCp08vD
         jmpssbWOtLS8F/Z873iff3MNhR8KrTt+BPTjm0PGsiwusPqBzdNto75MMxK/yEQrEjEP
         LSUcG5MuFik+U2yOOIdJcKCIkJ75qTwQ+MfZSbhBUWpgr9Q/+TWKV8HvZcR6wBVJ+cCq
         qGeWc93wDGquAYvYCKX5JY7M2pHO7BjyKW0aNF8P4OmARTG9FRl8YE/LLr53v54LHMHg
         wJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811845; x=1744416645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClkE+3sE7+kWf5twKe62RSOxAn4PaMKVpn27pL4jQgU=;
        b=R/A4tyT7n/PHEAxaJSy/Vq+Nch8U2yJH94m6qkD994BUGsXjc9PoYmu93yytbPez2H
         hcdjYgQzCeVpmGc8Th+VxP71u3ImOdVGT85hH+G9hBcs0+u/NboX+E1eY+n1+H74XGrr
         WXNV4wX6oKCXFrawR+rue/nJq0ljhyHGHaM1y/2jkSE8Cp9VFtnkPDwWKpp/ZnrEmx7+
         4/QpU+lXcDEAumyzYL4o4wEb2EgcZxqJqM6cU22hoKUE4C9KddRFJn+u63qOu+wgHlN6
         2OvEOmAfKhu0bAJB4Ufg7WdOSpRPJGhyLmMEazf1yDXoSGnkbeaXbfrA+RY6yhtnoSrq
         dEPw==
X-Forwarded-Encrypted: i=1; AJvYcCVOGpNbFHR9f+QZLnuHjivfTdVjFWuVOemnOq2tjBLjlGGXvKa4IRVO1zM6KyhhjnQlGmOHtdq0AzvOm9bxjG28@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4akLAeUX419nURnc03vEAvnWGgw96Tnprs58VfxQ96Vr4U47d
	5WZ3kskOUmjoQy+Y1hy2MPcUvqo5zGWGGM4f6eCTUqEBDFPsK6jYPdaE6t13BzNp08yCmSp/uit
	4SN0wyQ==
X-Google-Smtp-Source: AGHT+IFEzmu31Uxv85/V+P1AR0jWlTmxgY/d6+j9O8XSeTzHg8/BNrhKvi96jcabZLHsWj6TArg5/rVTxVZf
X-Received: from ilbbb4.prod.google.com ([2002:a05:6e02:4:b0:3d3:fe6e:97b4])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1542:b0:3d5:d743:8089
 with SMTP id e9e14a558f8ab-3d6ec5336fdmr15573115ab.7.1743811845390; Fri, 04
 Apr 2025 17:10:45 -0700 (PDT)
Date: Sat,  5 Apr 2025 00:10:41 +0000
In-Reply-To: <20250405001042.1470552-1-rananta@google.com>
Mime-Version: 1.0
References: <20250405001042.1470552-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250405001042.1470552-2-rananta@google.com>
Subject: [PATCH v2 1/2] KVM: selftests: arm64: Introduce and use
 hardware-definition macros
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_171046_576430_57646863 
X-CRM114-Status: GOOD (  13.09  )
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

The kvm selftest library for arm64 currently configures the hardware
fields, such as shift and mask in the page-table entries and registers,
directly with numbers. While it add comments at places, it's better to
rewrite them with appropriate macros to improve the readability and
reduce the risk of errors. Hence, introduce macros to define the
hardware fields and use them in the arm64 processor library.

Most of the definitions are primary copied from the Linux's header,
arch/arm64/include/asm/pgtable-hwdef.h.

No functional change intended.

Suggested-by: Oliver Upton <oupton@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
 .../selftests/kvm/include/arm64/processor.h   | 66 +++++++++++++++++--
 .../selftests/kvm/lib/arm64/processor.c       | 57 ++++++++--------
 3 files changed, 92 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
index ec33a8f9c908..dc6559dad9d8 100644
--- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
@@ -199,7 +199,7 @@ static bool guest_set_ha(void)
 	if (hadbs == 0)
 		return false;
 
-	tcr = read_sysreg(tcr_el1) | TCR_EL1_HA;
+	tcr = read_sysreg(tcr_el1) | TCR_HA;
 	write_sysreg(tcr, tcr_el1);
 	isb();
 
diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index 1e8d0d531fbd..7d88ff22013a 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -62,6 +62,66 @@
 	 MAIR_ATTRIDX(MAIR_ATTR_NORMAL, MT_NORMAL) |				\
 	 MAIR_ATTRIDX(MAIR_ATTR_NORMAL_WT, MT_NORMAL_WT))
 
+/* TCR_EL1 specific flags */
+#define TCR_T0SZ_OFFSET	0
+#define TCR_T0SZ(x)		((UL(64) - (x)) << TCR_T0SZ_OFFSET)
+
+#define TCR_IRGN0_SHIFT	8
+#define TCR_IRGN0_MASK		(UL(3) << TCR_IRGN0_SHIFT)
+#define TCR_IRGN0_NC		(UL(0) << TCR_IRGN0_SHIFT)
+#define TCR_IRGN0_WBWA		(UL(1) << TCR_IRGN0_SHIFT)
+#define TCR_IRGN0_WT		(UL(2) << TCR_IRGN0_SHIFT)
+#define TCR_IRGN0_WBnWA	(UL(3) << TCR_IRGN0_SHIFT)
+
+#define TCR_ORGN0_SHIFT	10
+#define TCR_ORGN0_MASK		(UL(3) << TCR_ORGN0_SHIFT)
+#define TCR_ORGN0_NC		(UL(0) << TCR_ORGN0_SHIFT)
+#define TCR_ORGN0_WBWA		(UL(1) << TCR_ORGN0_SHIFT)
+#define TCR_ORGN0_WT		(UL(2) << TCR_ORGN0_SHIFT)
+#define TCR_ORGN0_WBnWA	(UL(3) << TCR_ORGN0_SHIFT)
+
+#define TCR_SH0_SHIFT		12
+#define TCR_SH0_MASK		(UL(3) << TCR_SH0_SHIFT)
+#define TCR_SH0_INNER		(UL(3) << TCR_SH0_SHIFT)
+
+#define TCR_TG0_SHIFT		14
+#define TCR_TG0_MASK		(UL(3) << TCR_TG0_SHIFT)
+#define TCR_TG0_4K		(UL(0) << TCR_TG0_SHIFT)
+#define TCR_TG0_64K		(UL(1) << TCR_TG0_SHIFT)
+#define TCR_TG0_16K		(UL(2) << TCR_TG0_SHIFT)
+
+#define TCR_IPS_SHIFT		32
+#define TCR_IPS_MASK		(UL(7) << TCR_IPS_SHIFT)
+#define TCR_IPS_52_BITS	(UL(6) << TCR_IPS_SHIFT)
+#define TCR_IPS_48_BITS	(UL(5) << TCR_IPS_SHIFT)
+#define TCR_IPS_40_BITS	(UL(2) << TCR_IPS_SHIFT)
+#define TCR_IPS_36_BITS	(UL(1) << TCR_IPS_SHIFT)
+
+#define TCR_HA			(UL(1) << 39)
+#define TCR_DS			(UL(1) << 59)
+
+/*
+ * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
+ */
+#define PTE_ATTRINDX(t)	((t) << 2)
+#define PTE_ATTRINDX_MASK	GENMASK(4, 2)
+#define PTE_ATTRINDX_SHIFT	2
+
+#define PTE_VALID		BIT(0)
+#define PGD_TYPE_TABLE		BIT(1)
+#define PUD_TYPE_TABLE		BIT(1)
+#define PMD_TYPE_TABLE		BIT(1)
+#define PTE_TYPE_PAGE		BIT(1)
+
+#define PTE_AF			BIT(10)
+
+#define PTE_ADDR_MASK(page_shift)	GENMASK(47, (page_shift))
+#define PTE_ADDR_51_48			GENMASK(15, 12)
+#define PTE_ADDR_51_48_SHIFT		12
+#define PTE_ADDR_MASK_LPA2(page_shift)	GENMASK(49, (page_shift))
+#define PTE_ADDR_51_50_LPA2		GENMASK(9, 8)
+#define PTE_ADDR_51_50_LPA2_SHIFT	8
+
 void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init);
 struct kvm_vcpu *aarch64_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 				  struct kvm_vcpu_init *init, void *guest_code);
@@ -102,12 +162,6 @@ enum {
 			   (v) == VECTOR_SYNC_LOWER_64    || \
 			   (v) == VECTOR_SYNC_LOWER_32)
 
-/* Access flag */
-#define PTE_AF			(1ULL << 10)
-
-/* Access flag update enable/disable */
-#define TCR_EL1_HA		(1ULL << 39)
-
 void aarch64_get_supported_page_sizes(uint32_t ipa, uint32_t *ipa4k,
 					uint32_t *ipa16k, uint32_t *ipa64k);
 
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 7ba3aa3755f3..da5802c8a59c 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -72,13 +72,13 @@ static uint64_t addr_pte(struct kvm_vm *vm, uint64_t pa, uint64_t attrs)
 	uint64_t pte;
 
 	if (use_lpa2_pte_format(vm)) {
-		pte = pa & GENMASK(49, vm->page_shift);
-		pte |= FIELD_GET(GENMASK(51, 50), pa) << 8;
-		attrs &= ~GENMASK(9, 8);
+		pte = pa & PTE_ADDR_MASK_LPA2(vm->page_shift);
+		pte |= FIELD_GET(GENMASK(51, 50), pa) << PTE_ADDR_51_50_LPA2_SHIFT;
+		attrs &= ~PTE_ADDR_51_50_LPA2;
 	} else {
-		pte = pa & GENMASK(47, vm->page_shift);
+		pte = pa & PTE_ADDR_MASK(vm->page_shift);
 		if (vm->page_shift == 16)
-			pte |= FIELD_GET(GENMASK(51, 48), pa) << 12;
+			pte |= FIELD_GET(GENMASK(51, 48), pa) << PTE_ADDR_51_48_SHIFT;
 	}
 	pte |= attrs;
 
@@ -90,12 +90,12 @@ static uint64_t pte_addr(struct kvm_vm *vm, uint64_t pte)
 	uint64_t pa;
 
 	if (use_lpa2_pte_format(vm)) {
-		pa = pte & GENMASK(49, vm->page_shift);
-		pa |= FIELD_GET(GENMASK(9, 8), pte) << 50;
+		pa = pte & PTE_ADDR_MASK_LPA2(vm->page_shift);
+		pa |= FIELD_GET(PTE_ADDR_51_50_LPA2, pte) << 50;
 	} else {
-		pa = pte & GENMASK(47, vm->page_shift);
+		pa = pte & PTE_ADDR_MASK(vm->page_shift);
 		if (vm->page_shift == 16)
-			pa |= FIELD_GET(GENMASK(15, 12), pte) << 48;
+			pa |= FIELD_GET(PTE_ADDR_51_48, pte) << 48;
 	}
 
 	return pa;
@@ -128,7 +128,8 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 			 uint64_t flags)
 {
-	uint8_t attr_idx = flags & 7;
+	uint8_t attr_idx = flags & (PTE_ATTRINDX_MASK >> PTE_ATTRINDX_SHIFT);
+	uint64_t pg_attr;
 	uint64_t *ptep;
 
 	TEST_ASSERT((vaddr % vm->page_size) == 0,
@@ -147,18 +148,21 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 
 	ptep = addr_gpa2hva(vm, vm->pgd) + pgd_index(vm, vaddr) * 8;
 	if (!*ptep)
-		*ptep = addr_pte(vm, vm_alloc_page_table(vm), 3);
+		*ptep = addr_pte(vm, vm_alloc_page_table(vm),
+				 PGD_TYPE_TABLE | PTE_VALID);
 
 	switch (vm->pgtable_levels) {
 	case 4:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pud_index(vm, vaddr) * 8;
 		if (!*ptep)
-			*ptep = addr_pte(vm, vm_alloc_page_table(vm), 3);
+			*ptep = addr_pte(vm, vm_alloc_page_table(vm),
+					 PUD_TYPE_TABLE | PTE_VALID);
 		/* fall through */
 	case 3:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pmd_index(vm, vaddr) * 8;
 		if (!*ptep)
-			*ptep = addr_pte(vm, vm_alloc_page_table(vm), 3);
+			*ptep = addr_pte(vm, vm_alloc_page_table(vm),
+					 PMD_TYPE_TABLE | PTE_VALID);
 		/* fall through */
 	case 2:
 		ptep = addr_gpa2hva(vm, pte_addr(vm, *ptep)) + pte_index(vm, vaddr) * 8;
@@ -167,7 +171,8 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 		TEST_FAIL("Page table levels must be 2, 3, or 4");
 	}
 
-	*ptep = addr_pte(vm, paddr, (attr_idx << 2) | (1 << 10) | 3);  /* AF */
+	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
+	*ptep = addr_pte(vm, paddr, pg_attr);
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@ -293,20 +298,20 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	case VM_MODE_P48V48_64K:
 	case VM_MODE_P40V48_64K:
 	case VM_MODE_P36V48_64K:
-		tcr_el1 |= 1ul << 14; /* TG0 = 64KB */
+		tcr_el1 |= TCR_TG0_64K;
 		break;
 	case VM_MODE_P52V48_16K:
 	case VM_MODE_P48V48_16K:
 	case VM_MODE_P40V48_16K:
 	case VM_MODE_P36V48_16K:
 	case VM_MODE_P36V47_16K:
-		tcr_el1 |= 2ul << 14; /* TG0 = 16KB */
+		tcr_el1 |= TCR_TG0_16K;
 		break;
 	case VM_MODE_P52V48_4K:
 	case VM_MODE_P48V48_4K:
 	case VM_MODE_P40V48_4K:
 	case VM_MODE_P36V48_4K:
-		tcr_el1 |= 0ul << 14; /* TG0 = 4KB */
+		tcr_el1 |= TCR_TG0_4K;
 		break;
 	default:
 		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
@@ -319,35 +324,35 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	case VM_MODE_P52V48_4K:
 	case VM_MODE_P52V48_16K:
 	case VM_MODE_P52V48_64K:
-		tcr_el1 |= 6ul << 32; /* IPS = 52 bits */
+		tcr_el1 |= TCR_IPS_52_BITS;
 		ttbr0_el1 |= FIELD_GET(GENMASK(51, 48), vm->pgd) << 2;
 		break;
 	case VM_MODE_P48V48_4K:
 	case VM_MODE_P48V48_16K:
 	case VM_MODE_P48V48_64K:
-		tcr_el1 |= 5ul << 32; /* IPS = 48 bits */
+		tcr_el1 |= TCR_IPS_48_BITS;
 		break;
 	case VM_MODE_P40V48_4K:
 	case VM_MODE_P40V48_16K:
 	case VM_MODE_P40V48_64K:
-		tcr_el1 |= 2ul << 32; /* IPS = 40 bits */
+		tcr_el1 |= TCR_IPS_40_BITS;
 		break;
 	case VM_MODE_P36V48_4K:
 	case VM_MODE_P36V48_16K:
 	case VM_MODE_P36V48_64K:
 	case VM_MODE_P36V47_16K:
-		tcr_el1 |= 1ul << 32; /* IPS = 36 bits */
+		tcr_el1 |= TCR_IPS_36_BITS;
 		break;
 	default:
 		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
 	}
 
-	sctlr_el1 |= (1 << 0) | (1 << 2) | (1 << 12) /* M | C | I */;
-	/* TCR_EL1 |= IRGN0:WBWA | ORGN0:WBWA | SH0:Inner-Shareable */;
-	tcr_el1 |= (1 << 8) | (1 << 10) | (3 << 12);
-	tcr_el1 |= (64 - vm->va_bits) /* T0SZ */;
+	sctlr_el1 |= SCTLR_ELx_M | SCTLR_ELx_C | SCTLR_ELx_I;
+
+	tcr_el1 |= TCR_IRGN0_WBWA | TCR_ORGN0_WBWA | TCR_SH0_INNER;
+	tcr_el1 |= TCR_T0SZ(vm->va_bits);
 	if (use_lpa2_pte_format(vm))
-		tcr_el1 |= (1ul << 59) /* DS */;
+		tcr_el1 |= TCR_DS;
 
 	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1), sctlr_el1);
 	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1), tcr_el1);
-- 
2.49.0.504.g3bcea36a83-goog


