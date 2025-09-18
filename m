Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93064CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd/aa+Cyw0z/Ul0/qN6NY/ef41tVXmadJuCUPt5tdFQ=; b=PgN2larOzPMuqvHrAz/fmbWb8d
	+ju5li7GmXkXjAkqMJYkpvFws3RaQJMGwc5vuFAr1UE1nMEkNjEgwWXnmvSw79ShO8E5ItKIIndcz
	0t0AsBYeo0dcmfIYON8CTGisOlOXXPowQAKkDaiy13ln84Bv3nuageaTZ8BMk/E0BpXbTpO0QPvpy
	19aIb5m8lvMP2uiE2IpkZdYHGPLZBgJlH/8gpy5aw0gnLDqewuVU+UFYeWgPKZVPtmY+nmfoEcDgC
	E/CDSrTUNco53WZpsgGl3VZ5cob2MKdfBE3jePog3KPlQrA2hXcjtpKEp5ho7KVGdwiPtDyusz+NI
	55KH2L4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fe-0000000GR1Z-2lY5;
	Thu, 18 Sep 2025 06:36:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FZ-0000000GQx6-4BVU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:15 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3e980eb1d3eso84882f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177372; x=1758782172; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nd/aa+Cyw0z/Ul0/qN6NY/ef41tVXmadJuCUPt5tdFQ=;
        b=LbWpbihQvINNbJV1X7pXG/0Pumfm63PumHBuEKK6ypBBy49HkGrCZvjGqxzirAZ41B
         3WZAt9WeXQgFU3p4MkPyT9rKelYQsQx7tmCra+YvtB4/WY9Ie+zIPARt+uWiu0LT0hd1
         BuH5Bd8p2qgH4rvQb07tY8lx2mLaMX9mHzyiFBX5qdzsfg/mfUgRM1fy1C4cp4FFLUGw
         bFHB1M8jR13PTfiigTfAjIxrtniYunIK/rFwvB5f7zrFm+PS4FXQuR/rOwTrdSIfuKi+
         q8vg/kjMqaHjU5JL+e2Ru4hqFLHJmeHFPUoYRQael2U889u0C+R5WXQSqAx4owXKx06Q
         5hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177372; x=1758782172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nd/aa+Cyw0z/Ul0/qN6NY/ef41tVXmadJuCUPt5tdFQ=;
        b=L09IyRI1ijJx58QTZAc3+dWe3J0Zv7wFtL0hATHqt47/0lQWAqw9OifLfd+HMRJbit
         atCvWMG+sEHmnRAmr3WS17FDV+vOzAVos1taM4qLApf+5HuJISoz0xV8kL6wEPO4VliH
         XaYtyREGIMbJoiRxtIpD7x0K01V+tXRw8wdQ0ltVFFLAS9ipm68ZL8o8Mb6nflZamYd9
         3wUFySBupfCUKpzDJi6H8nGZyl1+hZDrjWKW3xFOVej8VW28raI3OknIuftTcrXS8U/P
         kpdIWw1JL0Iq03LpxT/IxoqN/i8uCvlD2sCEnPSrIOYTkVuU6wW3TCfAecVrUnkajFv3
         glYA==
X-Gm-Message-State: AOJu0YyZSKGdT3QaytBNrmW6r6X66TYpWpIImDh1SpphVq/VrUj+8Q07
	qasFf+ukgQy4tBtLWQCHNfTBLySnqAZVU8ECDyopIhRGPPz5BwbjvLaAlKFVJhbEuBQYWSlchYi
	+5Zv6goHt/6DE6knLkOjEUW3WynEF5oGBaLdWGt/W7A2EOaoHS6d0jiioY3x1KimKquJKyl3F2d
	mI4l4bZxjUQDMJVOygptTdBMBFWJZ75t1endP8J9ARNRlb
X-Google-Smtp-Source: AGHT+IEaYfwr01ZjRAssGnsJ1gUGd1rN8g5Gj0e5CjahKJgyizByZHhPk8uuPViunThk6UOOlyd5IgyT
X-Received: from wrbbs28.prod.google.com ([2002:a05:6000:71c:b0:3eb:6104:3eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2284:b0:3ea:124c:8fc7
 with SMTP id ffacd0b85a97d-3ecdfa1434dmr3783151f8f.39.1758177371854; Wed, 17
 Sep 2025 23:36:11 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:44 +0200
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=ardb@kernel.org;
 h=from:subject; bh=fbTmP4aG6tbBHGWrU82oUT6Reb9I9nyA/9uuGWnWHsA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0Cqcpcmo3s9lOdcud6TTT/3/e+Haah27JoTmrPn36k
 qtkYXWuo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEykPJyRYc9Ujxln1/M8UN0U
 srST+emhX57lN5vdFz69bBItdNUs9xHDP1OjzLYvG7QqeQXWeDWfFnstxjJ5Zu7xFo5XF1s+H1P byAcA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-11-ardb+git@google.com>
Subject: [PATCH 4/5] arm64/fpsimd: Require kernel NEON begin/end calls from
 the same scope
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_233614_061264_FA689C8D 
X-CRM114-Status: GOOD (  16.12  )
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

In preparation for making kernel_neon_begin() allocate a stack based
buffer for stashing the kernel mode FP/SIMD state on a context switch,
redefine kernel_neon_begin() and kernel_neon_end() as macros, in a way
that requires them to be called from the same scope, and therefore,
running from the same stack frame.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/neon.h |  7 +++++--
 arch/arm64/kernel/fpsimd.c    | 12 ++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
index d4b1d172a79b..4e24f1058b55 100644
--- a/arch/arm64/include/asm/neon.h
+++ b/arch/arm64/include/asm/neon.h
@@ -13,7 +13,10 @@
 
 #define cpu_has_neon()		system_supports_fpsimd()
 
-void kernel_neon_begin(void);
-void kernel_neon_end(void);
+void __kernel_neon_begin(void);
+void __kernel_neon_end(void);
+
+#define kernel_neon_begin()	do { __kernel_neon_begin()
+#define kernel_neon_end()	__kernel_neon_end(); } while (0)
 
 #endif /* ! __ASM_NEON_H */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..d7eb073d1366 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1833,7 +1833,7 @@ void fpsimd_save_and_flush_cpu_state(void)
  * The caller may freely use the FPSIMD registers until kernel_neon_end() is
  * called.
  */
-void kernel_neon_begin(void)
+void __kernel_neon_begin(void)
 {
 	if (WARN_ON(!system_supports_fpsimd()))
 		return;
@@ -1875,7 +1875,7 @@ void kernel_neon_begin(void)
 
 	put_cpu_fpsimd_context();
 }
-EXPORT_SYMBOL_GPL(kernel_neon_begin);
+EXPORT_SYMBOL_GPL(__kernel_neon_begin);
 
 /*
  * kernel_neon_end(): give the CPU FPSIMD registers back to the current task
@@ -1886,7 +1886,7 @@ EXPORT_SYMBOL_GPL(kernel_neon_begin);
  * The caller must not use the FPSIMD registers after this function is called,
  * unless kernel_neon_begin() is called again in the meantime.
  */
-void kernel_neon_end(void)
+void __kernel_neon_end(void)
 {
 	if (!system_supports_fpsimd())
 		return;
@@ -1902,7 +1902,7 @@ void kernel_neon_end(void)
 	else
 		clear_thread_flag(TIF_KERNEL_FPSTATE);
 }
-EXPORT_SYMBOL_GPL(kernel_neon_end);
+EXPORT_SYMBOL_GPL(__kernel_neon_end);
 
 #ifdef CONFIG_EFI
 
@@ -1936,7 +1936,7 @@ void __efi_fpsimd_begin(void)
 	WARN_ON(preemptible());
 
 	if (may_use_simd()) {
-		kernel_neon_begin();
+		__kernel_neon_begin();
 	} else {
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
@@ -1985,7 +1985,7 @@ void __efi_fpsimd_end(void)
 		return;
 
 	if (!efi_fpsimd_state_used) {
-		kernel_neon_end();
+		__kernel_neon_end();
 	} else {
 		if (system_supports_sve() && efi_sve_state_used) {
 			bool ffr = true;
-- 
2.51.0.384.g4c02a37b29-goog


