Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC60DC5475C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9m/dA5u8PP12xTyLEA47VdMolfQQBYIbnFJL4eUuTIo=; b=BnF7nq4Xx8RSMoXybBBUG1HHZO
	q7rezI1UlH1/DU/69eztF5TW0fbuwjxlvhOs7pbzXLuMjZoK6Js/LjxS1uJdTEOeaD6Y4fLVJnNjg
	295/a9BHFUrMmLhXAdAguTnYFMnnaWKJFVvziVwZ1zCg9f4CECJy0ZvEK5upIMZevfCTkNUulwUA9
	R3lqSSzXJ6MRUOAjmUQ2bkeMs0ITas4UOudhrQcRB2UscDj/nGawR/FXekfTUcuCOyRs+5/9M7ITi
	7oAkXLwsvjFSxrgzuwce6J2IZ4bNoDbA8RNXXaTX4jSjQTYoaVCe93f46cSW7MQ4zPyHNG14NLnP/
	MH5lS7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvR-0000000G1y1-3f5f;
	Wed, 14 May 2025 18:33:53 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9L-0000000Ft6L-0oLV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:12 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a20257c758so34075f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244649; x=1747849449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9m/dA5u8PP12xTyLEA47VdMolfQQBYIbnFJL4eUuTIo=;
        b=pzZBn+cKcAAMN7O3vOcDH/8JaaDfFmGC7y1ubPn84rlrw4wXDWANerD/xbZcN/08G/
         GUR9eoSa5ORx2a3DWkQe/Fbxkyn8Sgcfpt9IklMmcD1Vc7E+5ZNpmgAZu4tcn3ghr/Uh
         mZmEk79X8bTYNdxeh6DJNOhprEejFipA3lgsirW2228QK6B2BtHgukTRRc4SuNbtJrFQ
         Ap4KBeU64+zHbH/HFQZ7j31BD7OZEx+cC45vplWSz5mkPmmbXVB6ukUD9wzBscBLh2Q5
         LeH7HljlfvRtFV1CDHwO3ZtyMB5CSoG8mEGjrXxD970oWJ3MoFttm98SC7cthYouWZVI
         Cvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244649; x=1747849449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9m/dA5u8PP12xTyLEA47VdMolfQQBYIbnFJL4eUuTIo=;
        b=R4EB0K5iEYqxT2spfqVH3aza2rI6T0ZfIzgJ/Eg+rHF92tuQn+JnosqbM/1eXg+GH3
         /Hs+lHzZvD+xqQ08VN3JWdkvGoL8JNDbZQZ2mvvx8Jd/xJ0OnkDrnaGkvM0GD+TMvBaS
         Ad9uJKBzqtfPpcPzFevM3mZyRAvIDdrtr1ik1L6hbbJdgHK9mwwBBI8rb+D3Lqlz9imZ
         0hS0M6lKgjn4oxeSts3HE+892kD/UWl5SJ/chNz9sCYZ37XiFY798GLR2KFtOfF3X8cp
         jrtaXj2SshxHHwGF3BwlH9zE4rTEjIKz3S/WLrx3BQXToHhIs4i157PylwjjQ/C5Pm8U
         dz8A==
X-Forwarded-Encrypted: i=1; AJvYcCUZOAdWgEIJclmvkDncedP31IttbvTTLLoM+497Mixvp7JJZSmSHM1vWQYq2Bq5FcTUO5VU31UxyjasScNYUEVO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyix4f4YD0ccQ0bC5QJKtXCStEvWTrKi9vy+Aqv9VUSMy32bt8W
	Y+eU9T8C5WWIMJJ77sCRm7xCB78MJgkh9cXVfpgMPqbqnzTEDQIV6IUJx+4jHbgAzRzW+Q==
X-Google-Smtp-Source: AGHT+IH3phkZ7ohlhjgxOaGGl2tv6LZdappybOOhIxd+mP8S8HpGAaQTtF38WgvqXaHzyraEHHalvwjR
X-Received: from wmbbe14.prod.google.com ([2002:a05:600c:1e8e:b0:43b:bf16:d6be])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40e0:b0:3a0:b807:73f5
 with SMTP id ffacd0b85a97d-3a34994b80bmr3189200f8f.41.1747244649004; Wed, 14
 May 2025 10:44:09 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:47 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=ardb@kernel.org;
 h=from:subject; bh=JjGNi4y/M2NE/6+1Wwj3Vc6eI4ogOEIDwoxo0yxqFF0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWniyzKukuNYtPWVi83+nOgoYcF7St7l2WeCP/LLzO
 Wr7m9d1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImk3mVkmHnt2ZKM6yE3I3Vv
 Ljbq2pLfmct77FIyQ2u3x8PJ5/XM/zAybGfwWlep2fBor0PGypszriS6OCo+zZojGrXHwTmjxqC NHQA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-16-ardb+git@google.com>
Subject: [RFC PATCH 7/7] arm64/efi: Call EFI runtime services without
 disabling preemption
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104411_270192_83ED043A 
X-CRM114-Status: GOOD (  15.71  )
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

The only remaining reason why EFI runtime services are invoked with
preemption disabled is the fact that the mm is swapped out behind the
back of the context switching code.

The kernel no longer disables preemption in kernel_neon_begin().
Furthermore, the EFI spec is being clarified to explicitly state that
only baseline FP/SIMD is permitted in EFI runtime service
implementations, and so the existing kernel mode NEON context switching
code is sufficient to preserve and restore the execution context of an
in-progress EFI runtime service call.

Most EFI calls are made from the efi_rts_wq, which is serviced by a
kthread. As kthreads never return to user space, they usually don't have
an mm, and so we can use the existing infrastructure to swap in the
efi_mm while the EFI call is in progress. This is visible to the
scheduler, which will therefore reactivate the selected mm when
switching out the kthread and back in again.

Given that the EFI spec explicitly permits runtime services to be called
with interrupts enabled, firmware code is already required to tolerate
interruptions. So rather than disable preemption, disable only migration
so that EFI runtime services are less likely to cause scheduling delays.

Note, though, that the firmware executes at the same privilege level as
the kernel, and is therefore able to disable interrupts altogether.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 5d188c6c44d7..1c86a891f6d7 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -10,6 +10,7 @@
 #include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/kmemleak.h>
+#include <linux/kthread.h>
 #include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 
@@ -176,7 +177,12 @@ bool arch_efi_call_virt_setup(void)
 	if (WARN_ON(down_trylock(&efi_rt_lock)))
 		return false;
 
-	efi_virtmap_load();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		migrate_disable();
+		kthread_use_mm(&efi_mm);
+	} else {
+		efi_virtmap_load();
+	}
 	uaccess_ttbr0_enable();
 	post_ttbr_update_workaround();
 	__efi_fpsimd_begin();
@@ -186,7 +192,12 @@ bool arch_efi_call_virt_setup(void)
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
-	efi_virtmap_unload();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		kthread_unuse_mm(&efi_mm);
+		migrate_enable();
+	} else {
+		efi_virtmap_unload();
+	}
 	uaccess_ttbr0_disable();
 	up(&efi_rt_lock);
 }
-- 
2.49.0.1101.gccaa498523-goog


