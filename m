Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C238AC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPT2qHs8nb8woLd8l62ZcLF4l1Hy/juOm4dBzovnmEc=; b=k7YZ6bdubvgshrPTed5LSCQkTf
	+tcBw99Qq4A2wKAGxDxClROmlgx8smzig/nR9P8O3/HSADIxHVIx3DOr1QaPig8F5TX9f9EUEF5L0
	28FA0L4Bfr7h81VEExYK+2HrHt50FSLIr5HnC6r9KelZmNRGj4bHP0ZG9JmnLN9yeVLZtSvejUvDi
	F3geyMzHsgm9cR+678d66SJhwSbF7sHIliUIDbhO04rkq7LlEiuuIzgyt28S0MicVczABk5lO+ELf
	jc6Y9ekpO4mM+dtuH2BmlZKRmaQDstwBlcHbzfYSK+Bmd+BZQCO9H6OH9eWriZf7AiRB5qWyP4w90
	0PPhXLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvR-0000000G1xa-0msJ;
	Wed, 14 May 2025 18:33:53 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9J-0000000Ft5l-4Azt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:11 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a0adce033bso17351f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244647; x=1747849447; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPT2qHs8nb8woLd8l62ZcLF4l1Hy/juOm4dBzovnmEc=;
        b=HeDiBXcEUOA8mruHY9PDXOWuFTKzgnC9dy6/7RriretGxk5+DbOtULzAfzaeEuARDn
         O63x50MF71s1a8MUP/ltfEMiaUteYQFEf+Y9bVoTdO+OhRrsmyqaaVe5JnZaSE0TW3c7
         hl+3nyVeLLQ2Eras9kek3F/Axgv9gaD+o8FhttQ5+FUtAodWOJVlGnDZYChh8R3/PCki
         NluqHWmUTEhxx89jnLGfl2G4AehKZaclCFXmvqgAD7Ip8qd6DL4Ks44AJLPle4uF+jPz
         vJNY6SMMckEkhSiBpO+adgzky6QlucFmyIZGbgKuCJt7nZquLU91oS1Rj8RJk3m2AXtO
         sHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244647; x=1747849447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPT2qHs8nb8woLd8l62ZcLF4l1Hy/juOm4dBzovnmEc=;
        b=fKLPGiwiyB1dHOLxJTR63R8ujAfVgejHJV6EyErHpdzQgMViw2oBZ53+wMjf6if1+F
         gEaTtrRkFZymRZxBw4okzYTWzw/khlrXW1zJQ02Zn4SsRUajhY+eOgBG0D9ns43hTjnp
         tvJepXGBAMovY+q2iOHYKalR47M7T27upBpJc5kaHNC6KBFisjV0C8KQ+1fVKJIIrQVC
         ApTEKtvl/Wb33oxv8pWEt1a8ujdXU0Ss9BmQI96vQelF1UPo9XmTKFj5BJadQi7Otvlw
         qByctunO5bdsVT3aNiQJK/MkWvLu4GGaJrV8ozrLErFoEitQf8obGY15ZDGh7XYSeNZC
         6kZw==
X-Forwarded-Encrypted: i=1; AJvYcCUmuh/kwSn05tk2vnKxlBDJyJ4dAX1+3sNMB2WDfTdI2CF/GpNFyWc2mS+chzfL9J+lATeCCA1ZltKSsMpGABFb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+wPf1IH2S4StNhtReMysSlmes15yfz9xR2aQ0H3BVnT8OETcY
	5+1e045XTwWC0/OtKt3Fka3DqkIyqiVyYJexCVWzztncgLrf4y+c1i+QjKROKbJt94/E/g==
X-Google-Smtp-Source: AGHT+IGbwcdtxYzq8nDG7XB20QQ6m24gl78kM2NUn0+FEJqLZ7BDo2egTQqnLcfij6k5NsW+zWNEgZ3T
X-Received: from wmrs6.prod.google.com ([2002:a05:600c:3846:b0:43d:1c63:a630])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:adf:fc11:0:b0:3a2:2586:581e
 with SMTP id ffacd0b85a97d-3a3499532e2mr3010019f8f.53.1747244647113; Wed, 14
 May 2025 10:44:07 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:46 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=ardb@kernel.org;
 h=from:subject; bh=JhAXBUO5lApwzqV0/zxSwFWazHc5G4mQ1by8+P/Uv/8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWljMtpUJVZ80e6ZI9Ra1zHxSJWYQVOd6b1nCEvHUX
 3qhQjkdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJyqQz/Q+7ZXWWb8qPRVdt3
 3hqpZOWCDNay+XfdD6woEZAwjeRxZPjvHl77hpX3uNb8PJNws+OinS7mV6NZXMOPe5wSm1kYncI CAA==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-15-ardb+git@google.com>
Subject: [RFC PATCH 6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104410_033716_7134D8B6 
X-CRM114-Status: GOOD (  14.18  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/efi.h | 3 ---
 arch/arm64/kernel/efi.c      | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index decf87777f57..abe9176a3a23 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -132,15 +132,12 @@ static inline void efi_set_pgd(struct mm_struct *mm)
 			 * exception when invoking the EFI run-time services.
 			 */
 			update_saved_ttbr0(current, mm);
-			uaccess_ttbr0_enable();
-			post_ttbr_update_workaround();
 		} else {
 			/*
 			 * Defer the switch to the current thread's TTBR0_EL1
 			 * until uaccess_enable(). Restore the current
 			 * thread's saved ttbr0 corresponding to its active_mm
 			 */
-			uaccess_ttbr0_disable();
 			update_saved_ttbr0(current, current->active_mm);
 		}
 	}
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index d01ae156bb63..5d188c6c44d7 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -177,6 +177,8 @@ bool arch_efi_call_virt_setup(void)
 		return false;
 
 	efi_virtmap_load();
+	uaccess_ttbr0_enable();
+	post_ttbr_update_workaround();
 	__efi_fpsimd_begin();
 	return true;
 }
@@ -185,6 +187,7 @@ void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
 	efi_virtmap_unload();
+	uaccess_ttbr0_disable();
 	up(&efi_rt_lock);
 }
 
-- 
2.49.0.1101.gccaa498523-goog


