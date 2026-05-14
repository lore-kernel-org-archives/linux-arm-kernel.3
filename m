Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7EDCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gy9SfNyQq0Q8aPbZQJTjpDtQFHAiRjeYtBHKn8VswPw=; b=ZVTihlgxMOIS3GAFgvrf8LL4p9
	3kNr4koGBfRrF9wqczPhZD8etDmVtkMSP9NitkcW4sH/wighbZh8WhtaG0V3xwm2uCyxB2313bSxf
	UHQsBX5YoDZSD64q5M3Cjz4Zs274m5rGPK07Rcr0XfPJLzmLjKMpBPSpeAR/88mxlLJFNCCPATI9l
	EfZA/OH1oBk++9SbTZCbs+VX30XALCw/8ntYccv2IOJwt6/55mAMG5FnZhCKmN8U4+Vq8nG75dicb
	AKhykrc/QxsnlCJZg1gZJ8jYZ5r1niVSRolaQPJPCJBFGASgoiyKX7/Ao7z2DxpSfbpr4Qz8ddOcP
	mxv5XUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZcY-00000006AjL-1Xuy;
	Thu, 14 May 2026 17:13:14 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZcV-00000006Aib-10cx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:13:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso4120889b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778778790; x=1779383590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gy9SfNyQq0Q8aPbZQJTjpDtQFHAiRjeYtBHKn8VswPw=;
        b=rO3w8KbDGsAR78uUk+MWf/UgoKui0U5eA0wS6M2pslHEfszgjO/cQwM9hvcZh4zNmv
         oyW5GzzyywFEfhoJO1Mk3zdBTdVcFQL8mTy+ruEHMzTzTprXZzE8eS7jnkTY6sd0PmfD
         vbql1tw34PAAYFsHePo5SE4pSoNVblGie/hCc4rAOj23/fGNwugoSUVKUaDIqdHfVyUR
         a3MnWzRIx/jDoOEZJDyjdoiKBpEPcPApM8Z5tBh62ZVhlJRi+I2MB6XvhFDiEMYs5MB5
         v9J+duXj/8oHp9NzFNHyCUNmTNd90P6Ak9AGTgWjlfP4REQDmLfFR94l42g/ExGGsnaA
         IGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778778790; x=1779383590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy9SfNyQq0Q8aPbZQJTjpDtQFHAiRjeYtBHKn8VswPw=;
        b=es/q1LX/d+ByXw8KrhTRm3fB1rYd66pZ5VZqoObJoIOlzxbih7dHJZ97NUHIPEPWA2
         v+X2nhVonn/6SBjx003CnGohgDcAkqquLf+FZVlyoiTOd0eRp9/8sQfAMDwnzt+NCcmH
         n/PY6fgGsmZEQ2AVfMAndj0FAnOOKW4WnH2ICONEbWJ35S6nke+gGaFJUmfOqUeykiLr
         pfJkEWCs8y01qQ3K8Vxd+LtUj/e5/jHaC5ayUyPWdXi4dDsDbiJxMQkUvFYjwdn8gQtY
         0UAXdCT2tWxmck+zj+uB0WWnFKCMfEuR6FXFsrAyINJo+Oi8gVEqYVoYb6Huvn+V6GQc
         JcLw==
X-Gm-Message-State: AOJu0Yz8bQu3gD1HX+SHLkSXPUBxTG4eHgrND1yg6hRu5wMm8wNyAX00
	CyTdY0cKAA8fanqPzFTCGhjJCnFtlctm0hdTqP+ZI9eHkxT8VDGVSVeR
X-Gm-Gg: Acq92OE/W5Zx6iKrQCcYTE2u+Zc+aYliXDbxy1BEpipkOuC5lse2VyRTwWZV+P1IE8E
	c5RiuEYTSwXhmfDBrBsDEo200WSyYIIhFJbFPfpyh7s4CLwjJwyd32CGc3Xsu3gWyy+eD/u8uHc
	/XJY0gLcamk8NKrwPTDN5+1na961Of/Sx4keoqTVj66GjXi8c6oZXXHj01AKNJSS+0pVCex4+kY
	oqgMSFZwj7dWcsomGSnKfz8dBCQoaKpdxOdYGDbHXZ3RXyUVZJiQwbBmNoyvnlhLVwy0QCVqZPj
	BjiQaXK/K+ZYU2cAtjvSoD0VxfPDmDBVYzVu4uNnJxuwz5S101bxR9Vv11fpq5oNpVzZQrkyeQz
	LKBKXakDSnrAg8CyQ2zoXZVHn7NmTBPhCmnQNACkDeIcXNOaJAEbW7ObOaJouHw4Yu9qrobGz1b
	BuUCkkRAOZWVwu9fpBjA==
X-Received: by 2002:a05:6a00:2908:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-83f33f1bafcmr411085b3a.48.1778778789812;
        Thu, 14 May 2026 10:13:09 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm3160380b3a.35.2026.05.14.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:13:09 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH] arm64: mm: use u32 for FDT size in fixmap_remap_fdt()
Date: Fri, 15 May 2026 02:13:04 +0900
Message-ID: <20260514171304.2034930-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_101311_282348_22CF4B8A 
X-CRM114-Status: GOOD (  14.64  )
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

fixmap_remap_fdt() uses a signed int for the FDT size, so a malformed
totalsize bigger than INT_MAX wrongly passes the MAX_FDT_SIZE check.
Then create_mapping_noalloc() is called with a huge size and triggers
a BUG_ON() in the MMU code, with no diagnostic about the malformed FDT.

Change the FDT size from int to u32, which is the return type of
fdt_totalsize(). So a malformed totalsize no longer wrongly passes the
MAX_FDT_SIZE check, and setup_machine_fdt() prints a pr_crit
diagnostic for it, not a BUG_ON in the MMU code.

Fixes: 61bd93ce801b ("arm64: use fixmap region for permanent FDT mapping")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm64/include/asm/mmu.h | 2 +-
 arch/arm64/kernel/setup.c    | 4 ++--
 arch/arm64/mm/fixmap.c       | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..a6b388ef4c3f 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -68,7 +68,7 @@ extern void create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
 extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 			       unsigned long virt, phys_addr_t size,
 			       pgprot_t prot, bool page_mappings_only);
-extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
+extern void *fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
 extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
 extern void linear_map_maybe_split_to_ptes(void);
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..7cabac0546dc 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -169,7 +169,7 @@ static void __init smp_build_mpidr_hash(void)
 
 static void __init setup_machine_fdt(phys_addr_t dt_phys)
 {
-	int size = 0;
+	u32 size = 0;
 	void *dt_virt = fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
 	const char *name;
 
@@ -182,7 +182,7 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 	 */
 	if (!early_init_dt_scan(dt_virt, dt_phys)) {
 		pr_crit("\n"
-			"Error: invalid device tree blob: PA=%pa, VA=%px, size=%d bytes\n"
+			"Error: invalid device tree blob: PA=%pa, VA=%px, size=%u bytes\n"
 			"The dtb must be 8-byte aligned and must not exceed 2 MB in size.\n"
 			"\nPlease check your bootloader.\n",
 			&dt_phys, dt_virt, size);
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..c692e6ac2405 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -134,11 +134,11 @@ void __set_fixmap(enum fixed_addresses idx,
 	}
 }
 
-void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
+void *__init fixmap_remap_fdt(phys_addr_t dt_phys, u32 *size, pgprot_t prot)
 {
 	const u64 dt_virt_base = __fix_to_virt(FIX_FDT);
 	phys_addr_t dt_phys_base;
-	int offset;
+	u32 offset;
 	void *dt_virt;
 
 	/*
-- 
2.43.0


