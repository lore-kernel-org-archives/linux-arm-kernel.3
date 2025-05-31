Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482F1C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZikM/FjXf04PXFIXPG5Sbe+plLjTcyF2qD9/0pGE2k=; b=EzpskgnzsrIOKCxX9efSj0yqqK
	LzGSr/oPumwXZCB9a5AxYfirPkStlNDVuYI5F3+YgITdNXLCfxLZnCBpPcd0ImD9h8pJ6N9eHiO2L
	+1mo85w1qWElDFNjxVMnU/6VExOEG+Y1GRQ8yYQEVBzBsAlhDcjK1b347zBs8HtEP9Jcgfstp6RX6
	7prp7A2PFcpwzF9Ox9z/x0xJoOLUUt2nX/HAkJuCIVpACuWfHZbuIQkJsCptgVF7HxAAT9kcXcDZ8
	nA6CZKs5K6QdJhwlBFyMBJSRrJUZYcTIb1FMMeVxOrGYVYJC3axtg1XVaiwUfvIU2ugn+m34o3kV2
	vAMlmQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLO1-00000003jmg-2szM;
	Sat, 31 May 2025 12:32:29 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLLr-00000003jh3-1z2Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 12:30:16 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a4ea7e46dfso1088242f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748694613; x=1749299413; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZikM/FjXf04PXFIXPG5Sbe+plLjTcyF2qD9/0pGE2k=;
        b=sSReNVeVDOWhThKeHV6Inf8cd6/9MK2AnAvyNnPbi74Q3DtqoGnRNgMDZTihNmABwk
         Cw5/6NdVoZ3D7bCV6oUjMVGvxt8goT/La3DNq0nD6GaIGV5m7wJt7hndaPEBxw7Rj3HJ
         KUwfJ3ZERA+wc/bY25a1reXPbaQLGSkslnno7cUc0LWMlpUdsNky6KxwErY41uH0q08E
         X9+IklSF7/3dMnp4cEI1m1txx7RIvntEEm7sumPi0Dynl3ZoUbn6LscXGkEEIjNQ9/Su
         XoVGn7ELUMdaRBL5lPsloq3bZ37Or6Rx2kqHugSwOBcZfNDufXOtlEni7519qDrM770S
         gRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748694613; x=1749299413;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZikM/FjXf04PXFIXPG5Sbe+plLjTcyF2qD9/0pGE2k=;
        b=bYYwbHbj97Th8GX17i0T/5HSngwCnldFpMZWngCs8YTzC7BDQMoN+IBxehUG/6LUXa
         ZVVaoana17FY8nKAlYIRFctYHTKij8wTj3wt88M0DFfhsFznwdjMrXoWwPnbZTSJdyL4
         EX0ob6wVRANLLUgIMdoqmU/KLYtUye/3HkxhzZHPzwh7z6s/f+jN8zMPDXvD5zcQXQuf
         UwG+ozWDyyJRWxumAzMackL4JDkuI8LW9I33Am6aZuGHffrXeJWd/+dpCVWV8Jia1evS
         ZCwDbJeUzWiMguaOGN7IwuJ6zEd1DgzFgPAm4ivmxVDjxy43XGp+nNtZv2pI5bobiCer
         r8+w==
X-Gm-Message-State: AOJu0YymmQSBr4yWIT+1nbUtpQCTSO7E+HiyzllpQN72D6EjgvsbUYUY
	cP3I4fkDEVl1YOUKk/IkXSp+RpmdU26dav9fUOqDKVckwtMszA+XkMjhw92246dPjbcOkqzaozD
	SW2JpFie1YmcBt3q7iQM9vtkIAGK3p6XRJuC90dM6GLbBAs/wlBDFepcBsuYncUST6Rxqr6Ty+6
	r6m0b59sTz1o8oMYpS3STIuTKMJj0MuXdlYlguzDnatNxR
X-Google-Smtp-Source: AGHT+IFiiQqDfgehRW2p/Ynj19Xx4klQulVoyUpFrW1uBiQziwl5ywH19ZL539RQ8/xYwEKTdZU1kjOu
X-Received: from wmbes12.prod.google.com ([2002:a05:600c:810c:b0:44a:b793:9e40])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:381:b0:3a4:eb0c:4087
 with SMTP id ffacd0b85a97d-3a4f89c006dmr4732286f8f.25.1748694613212; Sat, 31
 May 2025 05:30:13 -0700 (PDT)
Date: Sat, 31 May 2025 14:30:05 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=ardb@kernel.org;
 h=from:subject; bh=titZkyxnMquRHah83pPDTJD3x+zdVJfZhb05A3gXZhw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIcPqm69SqOnnipZJ5VnBfYqbZ/tHa7C8Efd+cjzxlcH9/
 7M9Ird3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkEuTH8r3p0YI7yl2vmF//8
 5Fj/+m/08+xN8ktTWV59css4atCrO4Phf9Df/ITfEgGrBHL3PXj/L+50jVj3Dr91ZS6bec2y1R/ t4wAA
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250531123005.3866382-2-ardb+git@google.com>
Subject: [PATCH] arm64: Work around convergence issue with LLD linker
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, llvm@linux.lists.dev, 
	nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_053015_535233_94CEDE68 
X-CRM114-Status: GOOD (  13.52  )
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

LLD will occasionally error out with a '__init_end does not converge'
error if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this
results in a circular dependency.

Counter this by dimensioning the initial IDMAP page tables based on a
new boundary marker 'kimage_limit', and define it such that its value
should not change as a result of the initdata segment being pushed over
a 64k segment boundary due to changes in INIT_IDMAP_DIR_SIZE, provided
that its value doesn't change by more than 2M between linker passes.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/kernel-pgtable.h |  2 +-
 arch/arm64/kernel/image-vars.h          | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kernel-pgtable.h b/arch/arm64/include/asm/kernel-pgtable.h
index 9e93733523f6..74a4f738c5f5 100644
--- a/arch/arm64/include/asm/kernel-pgtable.h
+++ b/arch/arm64/include/asm/kernel-pgtable.h
@@ -58,7 +58,7 @@
 #define INIT_DIR_SIZE (PAGE_SIZE * (EARLY_PAGES(SWAPPER_PGTABLE_LEVELS, KIMAGE_VADDR, _end, EXTRA_PAGE) \
 				    + EARLY_SEGMENT_EXTRA_PAGES))
 
-#define INIT_IDMAP_DIR_PAGES	(EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, KIMAGE_VADDR, _end, 1))
+#define INIT_IDMAP_DIR_PAGES	(EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, KIMAGE_VADDR, kimage_limit, 1))
 #define INIT_IDMAP_DIR_SIZE	((INIT_IDMAP_DIR_PAGES + EARLY_IDMAP_EXTRA_PAGES) * PAGE_SIZE)
 
 #define INIT_IDMAP_FDT_PAGES	(EARLY_PAGES(INIT_IDMAP_PGTABLE_LEVELS, 0UL, UL(MAX_FDT_SIZE), 1) - 1)
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 2004b4f41ade..61a1a10aea2f 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -139,4 +139,15 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 _kernel_codesize = ABSOLUTE(__inittext_end - _text);
 #endif
 
+/*
+ * LLD will occasionally error out with a '__init_end does not converge' error
+ * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
+ * circular dependency. Counter this by dimensioning the initial IDMAP page
+ * tables based on kimage_limit, which is defined such that its value should
+ * not change as a result of the initdata segment being pushed over a 64k
+ * segment boundary due to changes in INIT_IDMAP_DIR_SIZE, provided that its
+ * value doesn't change by more than 2M between linker passes.
+ */
+kimage_limit = ALIGN(ABSOLUTE(_end + SZ_64K), SZ_2M);
+
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
-- 
2.49.0.1238.gf8c92423fb-goog


