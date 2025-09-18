Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8771CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNHqAVLlhLv5W0htkEcz0OII/0HvpQvRWJKki7ay4x4=; b=cnO4TqS+7vZrt7fqUQT7DfNHgG
	rBKV7GQmePRxznjOgL8WDwQiZWEEpUQa2aG3uZI4PkQX1MIiNJSFeQGWUTqFBJovbTQduOiw4/Evp
	9kzupQQJuO4B55ZImwDEN/uDM4FLkbG0zIh2e92BHwQAcuaIIVKkthNC/NpVx8gyXsWBsiGtBP+mr
	nANHv2QmjwhUug89YrwsSZKqIJ6d0T9X/iX3tkPjGTohYJC1o8ufodLIQaYOBcoBZckt7iwijNUuo
	1nVDChjplJu5nxqEQ/Y1bNJPBqh1tWqEbnLiZTC3lXn1xYKpMcM6BOUSECaqgmCdsyKc7sDJmdaES
	Nwk0c6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuq-0000000H4fC-3VjG;
	Thu, 18 Sep 2025 10:31:04 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuV-0000000H4NA-2Ck7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:44 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b0438a5f20fso68528666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191441; x=1758796241; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNHqAVLlhLv5W0htkEcz0OII/0HvpQvRWJKki7ay4x4=;
        b=WzArCOxqNtzdgbW/AHxKsWjlro/ulzdvd5dDTsM6xR3QOQSqbQrR+fY/Tuy4ReEiTj
         07K55uf+aSSDnCt1jr0kc48F5Fj3PPFoma1v3td/2jas+CASmP7/QOJzLUGOdPlaPwKN
         e+mQeTv7w7hl3T2IY/uotteQ5zejbsXSsvgdd3TwfAzXXbAvh08jKGEfd5KA52sM5txk
         vqZqEJZdMXRo/T9CxJcaUjmpm/tTADQebIyn+DH70+ZTLudgBHm5GJT3JA9n4kT9VAug
         L83NP4HyakHEbPrUFiXk21iwhOXFs265orHIZobk+BGjrucxkBr8lumSVYPUhyPrd/sJ
         1TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191441; x=1758796241;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNHqAVLlhLv5W0htkEcz0OII/0HvpQvRWJKki7ay4x4=;
        b=UoU+npxF8eWX4lXW3QoReUs8vrS9w8P+a32rpFxTx++LNkWv/xID9p+g8p6kL5twLf
         rXHYYSI1wsfspcUthAH6fXZ4eH5XGQ4pkDgKkFTvjqNz0whHYxTz9nVTaOhm1um3Druq
         gLUiLJ3SA007LOfvWmGM6qRcrHgM/T0igYhGGqBbfTFFNC/L+vgAas0eReaxDeepnAnC
         etFAdT8ksAr92UT+e4je8Ip1QB/8fFapYld09bpUm5Gmgg13L3uI0WXlc86DMK2dtLox
         BoL9O5fJ0WL3tqonJTPtRcMrN4j486w7Pn9V2xxZgAmG0XzDgm6XI0KwVAu4jBL6JLSr
         TTDA==
X-Forwarded-Encrypted: i=1; AJvYcCUikcPV3i0hjld0hUs66E0rk0pHC8HyIM840OUkEAEiSr0FrEkSr1WDHW8J3stgHnja2YhmIAOtLgBsKoXkrrWn@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/p7UK78yDma/IY2m5251LxuLHFPA0GYSF7Q5rGYOtWZBp8Ur
	YKiPiEgBNwM+2VW/+ZtUvK1JOfEDMr0SF0YLTf8EiYefOZddWT5vCH3b/XaKuJaP3sMdbUP6lg=
	=
X-Google-Smtp-Source: AGHT+IFgHxWIDqP1JG9dsjSf5woDKGTvu3LMMfMFqln2zd5f55mk3oKmQw/5olbKzpy9I1HA/uIxbJPg
X-Received: from edbio10.prod.google.com ([2002:a05:6402:218a:b0:62f:4a87:a86b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4788:b0:b0f:a22a:4c60
 with SMTP id a640c23a62f3a-b1bb17c8ca5mr633978966b.11.1758191441397; Thu, 18
 Sep 2025 03:30:41 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:17 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=ardb@kernel.org;
 h=from:subject; bh=CzllZySlu7Zzk+9rgGtZjOjjeEN/aeVWkoZifxpGWQo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fZur/x7YPo49KfFPamHLRgWB3fKCD7LceAUfLt13j
 mFqzDSujhIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARp3cMX8U+BHJpr9zO6v9t
 xoPLDTu/XVfqvcBlKTTHQzN893PmFob/pTUOLdXPImb8152s75qsuTMpV8O3NPLvZo3OTz2Tkw6 xAgA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-16-ardb+git@google.com>
Subject: [PATCH v3 6/8] arm64/efi: Use a mutex to protect the EFI stack and
 FP/SIMD state
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033043_579778_7014D2DF 
X-CRM114-Status: GOOD (  14.69  )
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

Replace the spinlock in the arm64 glue code with a mutex, so that
the CPU can preempted while running the EFI runtime service.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 0d52414415f3..4372fafde8e9 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -166,15 +166,22 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
-static DEFINE_RAW_SPINLOCK(efi_rt_lock);
+static DEFINE_MUTEX(efi_rt_lock);
 
 bool arch_efi_call_virt_setup(void)
 {
 	if (!may_use_simd())
 		return false;
 
+	/*
+	 * This might be called from a non-sleepable context so try to take the
+	 * lock but don't block on it. This should never fail in practice, as
+	 * all EFI runtime calls are serialized under the efi_runtime_lock.
+	 */
+	if (WARN_ON(!mutex_trylock(&efi_rt_lock)))
+		return false;
+
 	efi_virtmap_load();
-	raw_spin_lock(&efi_rt_lock);
 	kernel_neon_begin();
 	return true;
 }
@@ -182,8 +189,8 @@ bool arch_efi_call_virt_setup(void)
 void arch_efi_call_virt_teardown(void)
 {
 	kernel_neon_end();
-	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
+	mutex_unlock(&efi_rt_lock);
 }
 
 asmlinkage u64 *efi_rt_stack_top __ro_after_init;
-- 
2.51.0.384.g4c02a37b29-goog


