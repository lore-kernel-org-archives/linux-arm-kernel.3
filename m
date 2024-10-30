Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B02ED5CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiSNJuUVqUmThi4ywhxxBlIx/VAibAab/TSDDvzR4DQ=; b=ODgmhfNqCjXwkInjcGVyPJ3MGL
	V3PqqHntqigblg7v+CB95UUVcu/4BZa/9sQvWmGe0s4u+rhKoG7bBDOFh2WkYFxiG7nSvl+Y4hUAJ
	WVWAAj7L2/BC/+eJTEEyRNrXuBHz8Dpx1gjITuD3901RYR9j0CEu9cGe/wQh/ymtMnZ5jVIyPrz/1
	webYtFxBPIbPMQIdnJxds0fIOxrtxmpbPhYcbeg/FkgWZHB1UyG09PgA0Zl5ZmiFAE/9E4TfoLEcY
	kx+cNZ1lUAmnjxcKDsdhZ985JHiXdNdn4SMlArFfHy2GQkOlxvXDN6CMsFnXejBtuwlvUQiWeVKqw
	kORiYwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65sz-0000000HXhr-2lAe;
	Wed, 30 Oct 2024 10:25:09 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65md-0000000HWWl-368K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:37 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02fff66a83so10644946276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283514; x=1730888314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GiSNJuUVqUmThi4ywhxxBlIx/VAibAab/TSDDvzR4DQ=;
        b=KUqp50YsDaJFY4/hyqNi+0BcWVv4sYmgsawb0DmiMbz6LGw89NybWA3Xgbflo9rh8J
         OYfQ3YJ1d3Lc2hOAfhyalIufWoL0fkSGLw8SIB0JEE0TjmKmP7fTmb4dSEhNZHw2BHCO
         73VN1SLPMSLRcTjMapWHW6KhF2Dlhvys4owkWpZGoJA+Dx0nzqP8UE81mVeiYbtVhyBf
         xxe+iDydAm9C9bUmUy8YpEw0T4/71kzrV7wFe9xl3lu0N3P+ufTg0PkiKIzp08aaO/Ld
         +8JFiKuvJGDYh7EXSW0nxXe7HCDUtGiq2cW0l/0Dz/g7o3NrUEUM5ux5Ndfyiq5zpft/
         tZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283514; x=1730888314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiSNJuUVqUmThi4ywhxxBlIx/VAibAab/TSDDvzR4DQ=;
        b=H0v8+6FyCNLsGcldrKEkCCVhC5MRNJQYkY30uPmlhAM6daps4U53I8CT1OW3y7O12p
         eRHSK2Ua8ko7SA3ocVGL63kPhTwXajs+hfRWuLguJLecVvugcXtl4z5jtFZ7AZCW5F5A
         MFzNk/SpVkJ1qS+2Cwvn94eKt2d7Prxj0ucMBp4EA9rkhKcE765Csz4V0gFiCQr+62dF
         QHddnJmFO70qChdfKfytJXmQ0Re4DnlhvzyF1go2bmYhsgpwvYLNidKJBuWUFgMrPVTc
         O8Pt3gAIXVunOWh6PFe1DRHtqQa2zgI/JfEqlvQ1kPzDIkCSCDnnuReBKMkm+7VJBe9Z
         PDGA==
X-Gm-Message-State: AOJu0YxTQoXe9ud57PwYGEEiVWf84uHA8K3dTnO8TqiVKAO7evcClvVB
	X3Aw7Bj1gQyBDZHs5+6JiA/fs6lQb4C92JSbOwNVRE6wQh/Bj7oqH5NgT0L2SlToXFq9zral742
	bu+yA/4xOQ3m5FLp2dmMDoqQZ49SeFgbOdhicND7fCQ04jWAJftSxjGeToq4SE/YiAwit+Gtlac
	fLI0gRqrD+NvHhl8nw7eGxboYzQ5ECeVcp9+dU7dkL
X-Google-Smtp-Source: AGHT+IGnzByXmSferZ3znjFU1DAilPqK1hmhAoXGiKFphTF4R0E903gJtI58oxzNWHclXhOgvzUE8ntq
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:9c82:0:b0:e30:d445:a7c with SMTP id
 3f1490d57ef6-e30d4450d48mr1746276.1.1730283513173; Wed, 30 Oct 2024 03:18:33
 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:07 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2846; i=ardb@kernel.org;
 h=from:subject; bh=nfmkIc8BC3bWhOA+Opu1lUMycwYGYNKNBpiB1H0YnYE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/UH+r80LJJV36/2bn/fVcbvkiewdvStu6spqL742U
 VLoXcOGjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjAR3SKGv6IZp6KznvSxqaob
 LI4S9fjedylpPveSTdkKDSy8/9+2fmRkmHzAzrl1hl3Vm5i4GR/3zr74UM1a9uafK/x/l5StPxy 3iREA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-13-ardb+git@google.com>
Subject: [RFC PATCH 3/8] arm64: Kconfig: eliminate 64k/48-bit VA combination
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031835_806423_F46C431C 
X-CRM114-Status: GOOD (  16.62  )
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

Now that the vmemmap region is sized dynamically based on the actual
size of the kernel VA space, there are no longer any material
differences between supporting 48-bit and 52-bit VA space sizes for 64k
pages, which use the same number of translation levels. And if needed,
52-bit virtual addressing can be disabled at boot on systems that do
support it but where 48-bit virtual addressing is preferred.

The only remaining difference is the size of a root level user page
table, which grows from 512 bytes to 8k when 52-bit virtual addressing
is enabled, but given that both are less than the size of a page, this
is easily fixed in the pgd_alloc init code. (In all other possible cases
where vabits_actual < VABITS holds, the effective PGD_SIZE equals the
page size, and so this change has no effect.)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig  | 5 +++--
 arch/arm64/mm/pgd.c | 9 +++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ac8e7550430b..6a73fd61b4aa 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -379,11 +379,11 @@ config PGTABLE_LEVELS
 	int
 	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
 	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
-	default 3 if ARM64_64K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
 	default 3 if ARM64_4K_PAGES && ARM64_VA_BITS_39
 	default 3 if ARM64_16K_PAGES && ARM64_VA_BITS_47
+	default 3 if ARM64_64K_PAGES
 	default 4 if ARM64_16K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
-	default 4 if !ARM64_64K_PAGES && ARM64_VA_BITS_48
+	default 4 if ARM64_VA_BITS_48
 	default 5 if ARM64_4K_PAGES && ARM64_VA_BITS_52
 
 config ARCH_SUPPORTS_UPROBES
@@ -1361,6 +1361,7 @@ config ARM64_VA_BITS_47
 
 config ARM64_VA_BITS_48
 	bool "48-bit"
+	depends on !PAGE_SIZE_64KB
 
 config ARM64_VA_BITS_52
 	bool "52-bit"
diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index 0c501cabc238..ecc4b1ec235c 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -48,20 +48,21 @@ void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 
 void __init pgtable_cache_init(void)
 {
+	unsigned int size = PGD_SIZE >> (VA_BITS - vabits_actual);
+
 	if (pgdir_is_page_size())
 		return;
 
-#ifdef CONFIG_ARM64_PA_BITS_52
 	/*
 	 * With 52-bit physical addresses, the architecture requires the
 	 * top-level table to be aligned to at least 64 bytes.
 	 */
-	BUILD_BUG_ON(PGD_SIZE < 64);
-#endif
+	if (IS_ENABLED(CONFIG_ARM64_PA_BITS_52))
+		size = max(size, 64);
 
 	/*
 	 * Naturally aligned pgds required by the architecture.
 	 */
-	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
+	pgd_cache = kmem_cache_create("pgd_cache", size, size,
 				      SLAB_PANIC, NULL);
 }
-- 
2.47.0.163.g1226f6d8fa-goog


