Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98CDCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5LnJAE3YZc7C+MgCps2xix2Kr7DZlZm+g8SIPc04+Q=; b=3TLynfVJGbu2WJte6/Vy8xLFQp
	b03vbOOc0QNv/1LM1nYqLzL9ZgrkrkosLfyjRSeDcdvfzSdwUDXnzx+PYdYmeFLkyqchDOuV8WeIF
	8DD9drSN6T3RyaZgqGJAQGl1SyQSuT3ljEETwEwFB8Y5J4N5dmFKTbpNEcYhXgaY3jlV+wlmSwENe
	Ih71Q/Na2bXsynkmmoBO5keHfkovXb6DnnW2ldaz0yJJo4m/0uszzsUBNxEmG3vK7gvRVXEGJBRe1
	fiVWtYDe+ja31kwgIx/czV/ph0r3PLPrdlauh6VxYVFo6YqfOuehVObGFSGEVw6AA3bY0GK9LI/ki
	YLKXmRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaFN-00000003U57-27bR;
	Fri, 05 Sep 2025 17:29:13 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWk-00000001zRk-31uM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3d1fe9ecd9dso1831118f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079052; x=1757683852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5LnJAE3YZc7C+MgCps2xix2Kr7DZlZm+g8SIPc04+Q=;
        b=gR6vHKOxOX3p1TBvh8fC+YyDojx+OH6L111AV8WcGcpQNaZNxBobgI1fMeakuEQYH7
         l1Ws97Rg/25eCvocry1d/dvW0xqGGVLHzXNf/iaoiSe6w0uzE8z/Aop60Q/rvA63Dl+H
         zZKQt5GeMdoLQ0a6Qg69ws4/4v+Gx4H5Q5uRqZbvM4j4dbLQsfYVWBSVNAa+grqOxyUY
         jeF0PgiyhGLcWaEdc3/omf8BCWIcPYg2sfhR2o1c75fm3xmCu4arq9eE3hsK4XjI4kHV
         HueuRtDZaJnFo5T+Lm0Whutl7PyjZXpvRbIN8AwBHs/8fjhf45P/G1klcFCdQqQ2nxfn
         cSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079052; x=1757683852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5LnJAE3YZc7C+MgCps2xix2Kr7DZlZm+g8SIPc04+Q=;
        b=Bvpi7QpmVpjOaw3Dj7go4s7rL2WTHiMLDt758/k2m/3V2WjMGm9bkuqxt4r3k09Zxl
         WEwH2mDiXsbXsfyYf1jEMOO/6QyYtuVTER1/cC+KlOmxt86/GRVQiNJukCrdzjP/UGnq
         W/hsOEheFiPJ/09374oUH/OBtX4c+9A9leLFG3kUiSXN6c/ml5CcLEkDKPi2bnc2XnPP
         0wTPbhA0gUF29jVJ+Up3CAHkpAyaHdSWI3S0WsKRGTks7hbXZ8OnTmgnRmnNFQ8FZgjo
         lWgFgLZINn5ib/bhpkCxoSTUnYdiQ7wuTEc/vcRwspcv3Y/k4YzPTNnEWSoW/RjcyJe6
         2Neg==
X-Forwarded-Encrypted: i=1; AJvYcCVVf4H97+E3Ic+e6vivKmaXeAne9zWJUvh4OjN0GSNW6aBxU5ebqQGogngBKS0Fpz+KNIEZwn1C71NfGd6JbYK1@lists.infradead.org
X-Gm-Message-State: AOJu0YxJvvAe/mRRJ6oQDKr6mgpQGc2aXtsTdTb0Md58wForpAhWSWoV
	7t/pIgj2Hj2Uz8Ej1KdC4EfZYjX91ObPz7zPVK9UhUVZbCj8bT9/NJr4XBsPvJqsDaF7XA1cdQ=
	=
X-Google-Smtp-Source: AGHT+IHMbBeVKy4nTkbHNNXw1E6U+lB/o2tBsWIP/XOdZuFF9D5csjYK61b/Q6qJIegwb6HxvZsJhbcI
X-Received: from wmbf9.prod.google.com ([2002:a05:600c:5949:b0:45b:7262:8426])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:268a:b0:3d4:2f8c:1d37
 with SMTP id ffacd0b85a97d-3d42f8c2014mr18693666f8f.26.1757079052632; Fri, 05
 Sep 2025 06:30:52 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:41 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404; i=ardb@kernel.org;
 h=from:subject; bh=LG9z8ZfG/9lulzNu83d9OgD0HFnWetupMNmr542q5Ks=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPXM4Y7F0JYuPJPl/FPqAhOvOS/S0fsxmm5cIbmeQeWv
 /m6IntxRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI+oeMDBuXdugdkF+/+e3a
 sumKH1zmv9ZLvBy+SMj9znyFJZlnEtUY/lnIbpn4UqD00YKSc7W+PmpfbbSXM27XOuGjy3zkxZ1 oSQ4A
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-14-ardb+git@google.com>
Subject: [PATCH v2 5/7] arm64/efi: Use a semaphore to protect the EFI stack
 and FP/SIMD state
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063054_760315_B8DC33CB 
X-CRM114-Status: GOOD (  14.28  )
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

Replace the spinlock in the arm64 glue code with a semaphore, so that
the CPU can preempted while running the EFI runtime service.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 9b03f3d77a25..8b999c07c7d1 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -165,12 +165,19 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
-static DEFINE_RAW_SPINLOCK(efi_rt_lock);
+static DEFINE_SEMAPHORE(efi_rt_lock, 1);
 
 bool arch_efi_call_virt_setup(void)
 {
+	/*
+	 * This might be called from a non-sleepable context so try to take the
+	 * lock but don't block on it. This should never occur in practice, as
+	 * all EFI runtime calls are serialized under the efi_runtime_lock.
+	 */
+	if (WARN_ON(down_trylock(&efi_rt_lock)))
+		return false;
+
 	efi_virtmap_load();
-	raw_spin_lock(&efi_rt_lock);
 	__efi_fpsimd_begin();
 	return true;
 }
@@ -178,8 +185,8 @@ bool arch_efi_call_virt_setup(void)
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
-	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
+	up(&efi_rt_lock);
 }
 
 asmlinkage u64 *efi_rt_stack_top __ro_after_init;
-- 
2.51.0.355.g5224444f11-goog


