Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB6CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y9PgfzlZAvSWVRluzRE+sTTXFHsSdjHEV58R22WBfMQ=; b=V2ji/N6yD4GKUaZHyRWdxga2e+
	HMu3rm8XQXycIhrUVm9RFjymwB3j11OK2cpxDhw1erWf1LGNtKFeeiHDVLbRbS3M9wPnMErHcJrWe
	2aDeNnu636qJ2ori/VEdrZt/2s7t0X8lu87u+3Nr5kwTJZFfuraVbU8yQaAwVQO0wfxv0p5BjyLbL
	KdiLZaELpniEUajtnrDfz2dimkrKk+k0TzLp/t6NJV5u6iQa5yPJV7TCXalnL/vl4ru5AVUMBTui7
	EDrFvl7FWinaANeBzDfwy4kSlnhSfB8mjipHxeUQvLv1L/8w4j4xznxb2M5ZxAHEkJD36Tvn9lS95
	TVROu+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG0-00000002Mx0-0RrK;
	Fri, 22 Aug 2025 11:48:32 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJBb-00000001UAI-3VEE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 04:15:33 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1401700a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755836131; x=1756440931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9PgfzlZAvSWVRluzRE+sTTXFHsSdjHEV58R22WBfMQ=;
        b=Ox/Yfc6pvdNDmpocMgP36qDtmDL5wx+brzXt4dvjNTzh30tnRG++rayr7x5dxSZVI1
         4i6jBZtrc3Sewbv/2/LDr2lcFV3rylvQCo6Cej0nEDnrBB9Ev0XMuoe2A8I03Bsrd8p/
         ZxFiIpt20HpscQz7I1kbzUx/+GcN3OeI4vH8l0A2vdiNg+A/4i9Bp1aNCE0rGUMLVBT8
         nV+jehj09ghifkw5Bv8oLUqNnVrBatlqT+nkv79hqVDI5Ci5A6Mcsm0RWlpeABPw5YVS
         J5C8yETX00D9cXdnLZAXWCZPkDpBxCHiZr0K4vcdqDuNJVjzkKOJzoEw3ItCZyEfEO08
         V5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755836131; x=1756440931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9PgfzlZAvSWVRluzRE+sTTXFHsSdjHEV58R22WBfMQ=;
        b=R7M6Pt9mF0xktyWxyaviLhhuosx67RjNWJhw4E/M4C57YNr3gQwOGR8Ofn7dt1KV/3
         BkRIg4/wf8IWwruUENhTEgBZ5JAnqsqwfTbUpZrSwh9wDP5iydBedz7OxN4Ndoj+moKv
         oKv22Zqixov2At96aDgQHBU6pztmteT7LxUFSpYutV/2sB6VSCGv0WcH8sg0hIcZpeF1
         5U5sFh25kHvPxN0qMmuofuWtA3xJBrb174Mh0mWFXZDvcxJuwMGJA+fQNbOLMGt9YxJB
         bIk5wlCLlTkhTCD3SATT+7bB8w/Oj9lvP0z4ZbEz2BgAk4mc8rASQ5zX7/hw4JgCg1yv
         ToFA==
X-Forwarded-Encrypted: i=1; AJvYcCXpnmWYgrFqwmoOtiAJo16987+Ymfk2tMytumiH1iVsJWTCurpyRfFi0OalIbBQ1S2yc39F47ygXGWBsP/T99+j@lists.infradead.org
X-Gm-Message-State: AOJu0YwpYTBLWHZ/7DKd+5IUTdmo2cGXZ3hd2laIvn5rMKIaRhRBAEeo
	p8JoDts4iPH7TZlz6QgQqRlBn0Wu/qDVPDvBpO2cJPghkkngvRTK14V0
X-Gm-Gg: ASbGncsnDZ69YAVgx4ClCVQcbWCAanw7zgrOaARU+HtdFcy4w8xQEX+iht6Y+XBIe0g
	LFY1qX4F2dYJyGCBXibsMaaSdqpbdG2YyZecNZH9LB6ei517e8YUftGqfzJDzGJReC4LPIfB0d9
	0NW22mvQGW3f4KRY0vfuKIyaDHgdAIltmztlBCaNmeMQc12Bhj3QnyYUAA3tCbfW2DCJfXH2f2k
	5HsdGJrNPuxmoEJxyJcjS2D0shcMSCHxdVKs2mZg45W4cY3Mwj14NwSlevBorcUckW3nlzMGsZe
	6EYah0K2XH0HEVBc0cbAOeF+5wUMq1Rmnk2v0x+bgFQL3H997hHCU1NbCQj/Mq3c2LTwLdeVA8r
	IrjKZAJdAee71QyybmpqAIrOTJkgqIwH4AGBKEi7dkvo+BT74nbheCSRc3X1hdHCheHmjVTCh
X-Google-Smtp-Source: AGHT+IF2iOxGEWh6lnAwzbIYm3vEYhNMhGnrxwiHW2mktl6Jf+S+uzXvJvANfSUHzslgaQzZWAH6DQ==
X-Received: by 2002:a17:903:2282:b0:242:abc2:7f1e with SMTP id d9443c01a7336-2462ee02c31mr22915745ad.22.1755836130612;
        Thu, 21 Aug 2025 21:15:30 -0700 (PDT)
Received: from luna.turtle.lan ([2601:1c2:c184:dc00:ba38:b533:dcf5:1e7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325123e4751sm1189587a91.1.2025.08.21.21.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 21:15:30 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
Date: Thu, 21 Aug 2025 21:15:26 -0700
Message-ID: <20250822041526.467434-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_211531_876539_1F0E2E17 
X-CRM114-Status: GOOD (  18.21  )
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

In early boot, Linux creates identity virtual->physical address mappings
so that it can enable the MMU before full memory management is ready.
To ensure some available physical memory to back these structures,
vmlinux.lds reserves some space (and defines marker symbols) in the
middle of the kernel image. However, because they are defined outside of
PROGBITS sections, they aren't pre-initialized -- at least as far as ELF
is concerned.

In the typical case, this isn't actually a problem: the boot image is
prepared with objcopy, which zero-fills the gaps, so these structures
are incidentally zero-initialized (an all-zeroes entry is considered
absent, so zero-initialization is appropriate).

However, that is just a happy accident: the `vmlinux` ELF output
authoritatively represents the state of memory at entry. If the ELF
says a region of memory isn't initialized, we must treat it as
uninitialized. Indeed, certain bootloaders (e.g. Broadcom CFE) ingest
the ELF directly -- sidestepping the objcopy-produced image entirely --
and therefore do not initialize the gaps. This results in the early boot
code crashing when it attempts to create identity mappings.

Therefore, add boot-time zero-initialization for the following:
- __pi_init_idmap_pg_dir..__pi_init_idmap_pg_end
- idmap_pg_dir
- reserved_pg_dir
- tramp_pg_dir # Already done, but this patch corrects the size

Note, swapper_pg_dir is already initialized (by copy from idmap_pg_dir)
before use, so this patch does not need to address it.

Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm64/kernel/head.S | 12 ++++++++++++
 arch/arm64/mm/mmu.c      |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d..0c3be11d0006 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -86,6 +86,18 @@ SYM_CODE_START(primary_entry)
 	bl	record_mmu_state
 	bl	preserve_boot_args
 
+	adrp	x0, reserved_pg_dir
+	add	x1, x0, #PAGE_SIZE
+0:	str	xzr, [x0], 8
+	cmp	x0, x1
+	b.lo	0b
+
+	adrp	x0, __pi_init_idmap_pg_dir
+	adrp	x1, __pi_init_idmap_pg_end
+1:	str	xzr, [x0], 8
+	cmp	x0, x1
+	b.lo	1b
+
 	adrp	x1, early_init_stack
 	mov	sp, x1
 	mov	x29, xzr
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34e5d78af076..aaf823565a65 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -761,7 +761,7 @@ static int __init map_entry_trampoline(void)
 	pgprot_val(prot) &= ~PTE_NG;
 
 	/* Map only the text into the trampoline page table */
-	memset(tramp_pg_dir, 0, PGD_SIZE);
+	memset(tramp_pg_dir, 0, PAGE_SIZE);
 	__create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
 			     entry_tramp_text_size(), prot,
 			     pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
@@ -806,6 +806,7 @@ static void __init create_idmap(void)
 	u64 end   = __pa_symbol(__idmap_text_end);
 	u64 ptep  = __pa_symbol(idmap_ptes);
 
+	memset(idmap_pg_dir, 0, PAGE_SIZE);
 	__pi_map_range(&ptep, start, end, start, PAGE_KERNEL_ROX,
 		       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
 		       __phys_to_virt(ptep) - ptep);
-- 
2.49.1


