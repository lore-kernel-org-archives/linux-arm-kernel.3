Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7614CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hU3NU+EE/1FuOChBH3loy566bJ/0QuhejdT7NEwC48=; b=HSwhwm/urKHMLdYOqhNjK6ROYm
	0MtLnj+cuaf8S8OPPzQrONV1/FOxNeae/2ntqvWSXvoSIcU2fNBfPg/FrSDZwTNJxMLAYyHNLcANi
	PdXXzJck+EAwI29Ohd01ccXNu9vYcPufFN9jeABUkAtkJGLmCMQOp/3L3F166/9n5/o+rdraz0//z
	kRSOjQL94p4Dl9la/s/OzPtEryUsYfTLvGvLBS67BnZzuqcQgbD2TtwQrUvp6Nv7n03haRYgDg+fq
	DGrHopqmGhL9mL50jEoWOdnrC3zDQQthksr8CAXsxx7sFP6xl4JN/8QyOvOPwxy4it72REU8mG15q
	8zkIVFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RPP-00000001FkO-1qJN;
	Wed, 24 Sep 2025 15:27:55 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP3-00000001FFl-3L3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:35 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b335fbe7c0dso83653566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727652; x=1759332452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hU3NU+EE/1FuOChBH3loy566bJ/0QuhejdT7NEwC48=;
        b=etZJJHyfqxzKZPzeG3RMSMek7UcArYfP08CjNLV8mYy9WkLYG8y48W4uqii0/TOHB8
         Ntk6brXPSK0C+H4rzDRkawaDK/k4DY2FmzKfiq1Xsmw/LDRBoxHR5hSwCudRThB7NtRw
         VofUcxW2TzC/OxQkYW6xzX7ffREUE5BU9jpg/As2ZctqiTrykaer2vqPw6kLaVh8/Hvu
         eyLH7aK5sAD1wCmvA0k0sF7lCwyUQfierwJ2cXU85FSOwAHuGESm9lFlobtlv38KBi3a
         aZ1Bx/jbTagCH9jqCDdCmd7IIbQjWnPZTxv6Y6D2SLRVjb/3Z8t4Mt6O3MRVBLu743D2
         EKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727652; x=1759332452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hU3NU+EE/1FuOChBH3loy566bJ/0QuhejdT7NEwC48=;
        b=i6nXYIi4GCSdoVtYFlXwrlVahQDtpOtSpEKlsqpWKODGGXCv5LFJlimqdZuO6liRnc
         c/llf12CGkwr5dQxxTPnXfbPe7VMiBfbdMd4GFZMA5RA596MzCMAblPEyb0wOy3q86VQ
         EGrbklqx0LdCfBYSocO3eYnXO7K/ftN6tqLiDJK6XHshPiQjfCmU8RCFHpBAZbdBI5nC
         jGuGM8SfoDM5GOdl6B+3S2DbcsrUTxdnXaj1J+bI2U/QE2ujsU1QLe7Uc8xa6mZKskz5
         AO2S51J6Rg40Xq6flzyCJT3lxowhALoFGePNmEJUxOV8OD7WHMSwhfp0VAN89acb1rZv
         +Kkg==
X-Forwarded-Encrypted: i=1; AJvYcCWpENLh+oSYJ9nTeTl84QyobsiKDIdK7E/MNR4I9+FcEd6ZLCn4HqTVZV/64dv1ogiP/ECn33QThGfj9gMsYcBX@lists.infradead.org
X-Gm-Message-State: AOJu0YwJJxkX/LVM1yJVp74it9FYjUfTdBGZM8ghR0d9g56mQCge6Uth
	QaMtHGUYJfZ/DBQT4/qbTm2dZlIx/i0colXeoLwxb39+3MNkPmIhQNea+7Nljj8VlJYVJHh+/A=
	=
X-Google-Smtp-Source: AGHT+IFZ2iwstoaHBb3YCwWIateYZTWtxaliteUts4ieGmp+JuUAeae4kOh4NCMKe4l2erWoMG1yxlHU
X-Received: from edqs17.prod.google.com ([2002:aa7:d791:0:b0:634:6ced:4ca9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:c14c:b0:b33:d2f0:d1b6
 with SMTP id a640c23a62f3a-b34bad21acdmr24393666b.30.1758727651707; Wed, 24
 Sep 2025 08:27:31 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:58 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=ardb@kernel.org;
 h=from:subject; bh=v8PXoWY9U3MlvdKFdHLzUBgWgUos6+58xgUiDJkn3es=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK7/HmaafKmd+mXNZxST4s7RjcunHJj3apO1PvLZ526
 M2RXwpCHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BeAiaQx/eJ3bJMQY1x39Zb7w
 yPJ+pWeGwd6STwtF9yyVPbNWm6ldk+F/iONEzTbRl6sZE1zPWk/XmzFTrIDluco3W+WH3/bPrNn NCgA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-15-ardb+git@google.com>
Subject: [PATCH v4 6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082733_915459_B707AD73 
X-CRM114-Status: GOOD (  17.14  )
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

efi_set_pgd() will no longer be called when invoking EFI runtime
services via the efi_rts_wq work queue, but the uaccess en/disable are
still needed when using PAN emulation using TTBR0 switching. So move
these into the callers.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/efi.h | 13 +++----------
 arch/arm64/kernel/efi.c      | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index bcd5622aa096..aa91165ca140 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -126,21 +126,14 @@ static inline void efi_set_pgd(struct mm_struct *mm)
 		if (mm != current->active_mm) {
 			/*
 			 * Update the current thread's saved ttbr0 since it is
-			 * restored as part of a return from exception. Enable
-			 * access to the valid TTBR0_EL1 and invoke the errata
-			 * workaround directly since there is no return from
-			 * exception when invoking the EFI run-time services.
+			 * restored as part of a return from exception.
 			 */
 			update_saved_ttbr0(current, mm);
-			uaccess_ttbr0_enable();
-			post_ttbr_update_workaround();
 		} else {
 			/*
-			 * Defer the switch to the current thread's TTBR0_EL1
-			 * until uaccess_enable(). Restore the current
-			 * thread's saved ttbr0 corresponding to its active_mm
+			 * Restore the current thread's saved ttbr0
+			 * corresponding to its active_mm
 			 */
-			uaccess_ttbr0_disable();
 			update_saved_ttbr0(current, current->active_mm);
 		}
 	}
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 0094f5938ba6..85f65d5c863c 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -169,12 +169,30 @@ void arch_efi_call_virt_setup(void)
 {
 	efi_runtime_assert_lock_held();
 	efi_virtmap_load();
+
+	/*
+	 * Enable access to the valid TTBR0_EL1 and invoke the errata
+	 * workaround directly since there is no return from exception when
+	 * invoking the EFI run-time services.
+	 */
+	uaccess_ttbr0_enable();
+	post_ttbr_update_workaround();
+
 	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
+
+	/*
+	 * Defer the switch to the current thread's TTBR0_EL1 until
+	 * uaccess_enable(). Do so before efi_virtmap_unload() updates the
+	 * saved TTBR0 value, so the userland page tables are not activated
+	 * inadvertently over the back of an exception.
+	 */
+	uaccess_ttbr0_disable();
+
 	efi_virtmap_unload();
 }
 
-- 
2.51.0.534.gc79095c0ca-goog


