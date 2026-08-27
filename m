Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0237C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43iLPgD5M5R/GHwUlmehT6b7nY+XiShZxegudQN2h98=; b=HHSnqQyOUsEJUpPVwX55RN9iqt
	1THdPJgToukoyDzhUnha8TZYyjOlqIIeekEKXu98CQEGKhTIBDjD5YYbps06b9QxYdf5LwIPS6r7h
	WeR7lQfT+/TmoKutJExD9e9uMY7SF6bX2c5lEx/SbLdbG4BunuFKJW6zUPcVf9WbyK8xV+yVMotEv
	jXWKHBjdoRIbpvMZbngTnuibjsbtKeyvoNBh+40h62wXlN5YVlgTgGTKFqKH8FpV3Hew4eF8sIrNP
	pkvriDhdgDpAt/yfwdcik2rPRAMQd6gzwMEHSQ/SnE1c49u30B8eVooDqwHOxi+cbhLp1nubuWZql
	sC+NhgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDb-00000004OYP-1FhL;
	Thu, 27 Aug 2026 16:44:47 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDR-00000004OTi-3VNU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:39 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-499a7993a9bso17934145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787849075; x=1788453875; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43iLPgD5M5R/GHwUlmehT6b7nY+XiShZxegudQN2h98=;
        b=BGAhlLzyglNcjPUcNuc21zU5Mkb0G6LnAsEZhz8Ss6CZ97tFuQTP+tLq1bfHToT0sR
         yIltf+GC0M1uF7ono7axHQliqrwNmkmWFFT2lXnSWxvB/Q0Jd+JK3YGpMF/14Zr82WZj
         IleMwNa7QKC6VD/8lm1GN82usU88BXiovMPHgbndhiYOlp8xSqshLnwdi/yANs6F/8FM
         5gG7JQqDagTcmB0uKUlMU2InEpJoNevenNeVSh7TjmHSusUbi4iuT590Xw7TBcrIM+gF
         jhxdVSlOirKOUpvKUG1y7FkM4zy3Fbhqd6MytxpCiyV6vvIJFcGrexlofFY2mN6CJ25u
         vPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849075; x=1788453875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43iLPgD5M5R/GHwUlmehT6b7nY+XiShZxegudQN2h98=;
        b=N3QRzXTJGYMfxZTqFnhkFw7wMXLyjt+/evn562Qa8MPKlv1F/rLUnBYtUs3sV5rXgt
         qG51ISunBCtzIRldQpvJdf2db5oRFXEwa6ysdG+rRaTy9L/noX/yZzNoWehhlZxiM25b
         4zyYwvVA6CVulswkhVjox9kPaNnYm24CYbgNazcFcj02BE+pcKF5/5CKiUXP16cYLkzI
         5xHOk6R4bO0s57DnGofNxL4BZ1GHwW8blH0LX6ZRePL6ypcO2CdK1rCQI+kkeXNls5ok
         IFqa5P0jMPqP1jL2lQ3bO0Fkdh1LkaZ3lGiUsRTRmeYNRaf3mR/YijFboGwVILJDFD5D
         QLiQ==
X-Gm-Message-State: AFuF++k/TcF57rAi0wzu5Hjlifw+C50UqqdxRDOTZW+YREf1hWE8b0Zl
	43NSYxTtILePGo0z2Xb5W+/14oj8q1MaNiM6S4kv+mTmz8HLfw4D7Nv64gaC3VsrQjLqm2X8Gw=
	=
X-Received: from wrod1.prod.google.com ([2002:adf:ef81:0:b0:47f:93e7:6c8c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c178:b0:499:872b:abd4
 with SMTP id 5b1f17b1804b1-49b91c21b86mr3254375e9.6.1787849075235; Thu, 27
 Aug 2026 09:44:35 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:44:14 +0200
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260827164409.3421848-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=ardb@kernel.org;
 h=from:subject; bh=iWvmUytrCQAfIl3uYQyfQdqp2tLg/jsjNdw7eZtuwd0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWtCZny0jfFXyRPr6kztSk5KTjo11/i5XetD2xOzdr/7G
 G+1bWJmRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI0niG/yVp86bI9mTdPJ2/
 7slZ67LSlMfBb4xPn25vNBcuj2xLL2FkmLDqohFn5pQSo3qWIqvZt4S6f7iXrQ9NKtfmP9f4YX4 TFwA=
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827164409.3421848-10-ardb+git@google.com>
Subject: [RFC PATCH v2 4/4] arm64: mm: Move fixmap intermediate page tables
 into .rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094437_913151_6836A546 
X-CRM114-Status: GOOD (  12.39  )
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

The fixmap intermediate page tables are allocated statically, are
installed into the kernel's page table hierarchy early during boot, and
control a slice of the kernel's virtual address space that is not
subject to KASLR randomization.

Combined with the lack of randomization of the linear map, and the
tendency of some Android bootloaders to place the kernel image at the
base of DRAM in the physical space, the placement of these page tables
produces a vulnerability that is comparatively easy to exploit.

Avoid this, by moving these intermediate page tables into .rodata, so
that they cannot be manipulated directly via the linear map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/linkage.h | 1 +
 arch/arm64/mm/fixmap.c           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index d1f7a16729d2..00963e11ebf0 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -45,6 +45,7 @@
 
 #define _THIS_IP_ ({ unsigned long __ip; asm volatile("adr %0, ." : "=r" (__ip)); __ip; })
 
+#define __rodata_pgtbl __section(".pgtbl.ro_after_init") __aligned(PAGE_SIZE)
 #define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
 
 #endif
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 3a8cf6de6a7d..ab0f9ba7b712 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -32,8 +32,8 @@ static_assert(NR_BM_PMD_TABLES == 1);
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
 pte_t fixmap_bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
-static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
+static pmd_t bm_pmd[PTRS_PER_PMD] __rodata_pgtbl;
+static pud_t bm_pud[PTRS_PER_PUD] __rodata_pgtbl;
 
 const size_t fixmap_bm_pte_size = sizeof(fixmap_bm_pte);
 
-- 
2.55.0.887.g758fc8c411-goog


