Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A40CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ln86/emlRW++8jlfCD8OhBzg2NppL+NIQ42e5m1YOIw=; b=u+4coASAFlJqvPRPHj2BXLU5LS
	/5si6vn/BNSUGrdHCEOdXc10gZ3ABRVeeg1sB/5vj6RfiRQ/F4Pd2XK2vswTRkh7W6AfTG9gCTceg
	7BjEh8qROH030QUlaBiKPbEp0kXZ8kQ2g3gfOJV1HsouXyIJ7jlxHMgB5Psqh/tWxOqaN2s9KKoUO
	3D2S4vpcKMHjEyunmWRTKvdu2ofl2PQE5TsxJ1re7SUDrdh2tYfIa4CeC+2j4tedWgQ8sTIfjb34n
	4e2y9yYWms2mYwf2KkURcbkmPNt9k4ous9x14ToCDxlSDF/dFEeYl80cgumYAMXR6Sy3sRDsm6TLJ
	DxKcHWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RPP-00000001Fjo-07fm;
	Wed, 24 Sep 2025 15:27:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP2-00000001FE4-0qKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e1ac7110eso17371655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727650; x=1759332450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln86/emlRW++8jlfCD8OhBzg2NppL+NIQ42e5m1YOIw=;
        b=pnZlKZq05H6Ji9HHz1n6gwdyqf9D8DKDC6dlENFN+lZAE51SFVOamXIMR4U0JaT2JS
         81sS2YjAhTdLW1h7/sSEBLUrM5Lr8k1xO7+AV4AZZTWbssFu05/Td1phux8C9szTEm2W
         Vub9q1RH1kQ8NfB9JmH6tZd8MkMS7dxUnlW1CoKLACqfBnJCNmsP9ZnotA/PENQg8C6y
         P8QAuqR4JgHLjg2lFMEaUnxMP91yUuSZntdiRZl+NF4Y91rXEYTC+RykZp5CKmwwCTXH
         5Z7+PwCXKchVhmAfECXCMrxEIyrv0oKmgoHnyw0oKdkyq0WVXGZm8zOTSwHb+vFJTAyM
         Mtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727650; x=1759332450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln86/emlRW++8jlfCD8OhBzg2NppL+NIQ42e5m1YOIw=;
        b=hlCAMPXo1jDQ3SN6Kt1qxULtw6IDlg2rqlou5SKFQLxmKH2ajHAe4U2eApvje+OYSc
         UwoJZk8mRm1cfJvvQ/U/fFz8xSbdhU0wdOzzELuytslfs/Srdg+NM+QE+D+eCnSGSr8P
         bPKNZyKNy8x6rmzayOgpCScbtxc+ZIacVCuOAv4B6ugqGCOIFKQw8gsi0druP2KFZtYl
         L/xFPjv8GbaDjcv9DpwKDqb3/sjfhmY+K6ca/Uz657PWWleg10LNsfJcLgB+BLMj+5bs
         NVIP1yGKH8/kPoger7D0BqlleSVJHwXXznMcJzSyr8dEP/pm478t41IflHDhfXvrCxWY
         xDCw==
X-Forwarded-Encrypted: i=1; AJvYcCWTYvML//TeyBRx8FnmOjZq4bGsNY/VVXAp+MPT8N4KVNBNNLMAOHoi/LlZJpFTp+1lGpwhvKqJ1zVaZd57r4eQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlj+yjYBnrsX06RW6C3Bsu2QY+T01zTGipH0/gKvpUCZwMOZzn
	3JUihuLtU1A+2Pxqg+3aGoRWi1KKROMyUPN4nqnSbm6zPKEvQPSvTjoErjaHnVeCwL+RL7xBwg=
	=
X-Google-Smtp-Source: AGHT+IGr/1cFTXgZdf6e+4nFNkNXF1/DJFBlumid+5SATHB0yGSyBfu3Vnrf7sHmr+Jznes2hE6aM/Tb
X-Received: from wmbdp9.prod.google.com ([2002:a05:600c:6489:b0:46c:aed0:23f3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:181c:b0:46d:996b:826f
 with SMTP id 5b1f17b1804b1-46e32a02d46mr1753225e9.25.1758727650446; Wed, 24
 Sep 2025 08:27:30 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:57 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252; i=ardb@kernel.org;
 h=from:subject; bh=7GLyY2hmHXPr1fnp3jZiXNoyuiFGpy/XlEGtkndi7cg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK77F5kmrJ6gpp09KjLf7kCq57KHzvnUQ6ly6DaarJ4
 dkMqvIdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJX0xj+cLs+DtS2evBhqtKS
 ToszsruDvl5fGmZ+fYaHWNzEvrSWK4wMPZHRT7eHcv+1bu1WnOzmLvZxjqFf/JqNdr9/twpE7az nAgA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-14-ardb+git@google.com>
Subject: [PATCH v4 5/7] arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082732_387981_522E3741 
X-CRM114-Status: GOOD (  12.60  )
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

Since commit

  5894cf571e14 ("acpi/prmt: Use EFI runtime sandbox to invoke PRM handlers")

all EFI runtime calls on arm64 are routed via the EFI runtime wrappers,
which are serialized using the efi_runtime_lock semaphore.

This means the efi_rt_lock spinlock in the arm64 arch wrapper code has
become redundant, and can be dropped. For robustness, replace it with an
assert that the EFI runtime lock is in fact held by 'current'.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 6c371b158b99..0094f5938ba6 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -165,19 +165,16 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
-static DEFINE_RAW_SPINLOCK(efi_rt_lock);
-
 void arch_efi_call_virt_setup(void)
 {
+	efi_runtime_assert_lock_held();
 	efi_virtmap_load();
-	raw_spin_lock(&efi_rt_lock);
 	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
-	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
 }
 
-- 
2.51.0.534.gc79095c0ca-goog


