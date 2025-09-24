Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27298CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwWjpBWZcTXGym3noF7gHRJl5W2piBLt0KG+y6l3/bo=; b=on5QRyRc3K6cUALFGZQnZ8uMEJ
	ld5seL6Q+dl3r4AsOcQwy3CmpGdtFHhjMboLkbXeLliNu0nuhgorlEca+8hW0N5b6NLLNUWBILXAb
	qzzb5Ew3Z981hjAg9ZloLEIjv+AoxbAkPmF1Sf8qjTqPCFaiT5Ad9rxwjMgGKHrzVhf7ZbwxbE0V6
	ct7Ink0Dssyv7rhT7SbsCgGPKeMQMDXBQZEVeuVK0Lm7V3our9gqYxxApzO8egLyUDEuG/gkwXxN8
	bIYk96Ms5azj/alcGQFcqr0Xfm8+o+JdlG//308kZD7B3JRIIisITgARX0Qun2BJJJYeMz9XRI7G0
	EL+ar64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP5-00000001FLa-3JOq;
	Wed, 24 Sep 2025 15:27:35 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ROz-00000001FAV-1CEF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3efe4fcc9ccso3378530f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727647; x=1759332447; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qwWjpBWZcTXGym3noF7gHRJl5W2piBLt0KG+y6l3/bo=;
        b=fxUXqyLcs6sQ/hW0RT3vj0q+DZ1Ykw+NEudmrgXaTKS9otkS3NcbEYxyy87WVQVGge
         jMKUkGnasm5Qh6qF3JxHCDoucpO6KQD/i1IWbcrNyCJnVVDeMnssi9V3i9VSiJCfU0Y8
         4ZhCnzid4WmoS+ruF2hHZqtCU7GHs6BkHOqRwz2zLr9gjNe/xzHDKtd21H6v2sIGS9m4
         umVR2X9L0QRJSsFHwIgLnMLRwqTyaA605p7qe5A/RpWAtyHwQK+WRqyqbZHfSCowZYUR
         KD+A5a2Fr01yaq63N+k+Qo/OnU/BPLJvmFTt7RvRQQ7gdVYB0ynmeTI09cs9/HDwtUbN
         8cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727647; x=1759332447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwWjpBWZcTXGym3noF7gHRJl5W2piBLt0KG+y6l3/bo=;
        b=ikoBUoP3hFLRhM8b8By6Akr1UCLCEjkB3ZlG/VOsmHJLJqpNOpPsWCu6oe5+vJlqyL
         3vhlcnvxurQltbZ5obGRE3cyuI0riI6x7eFdcmBEKVGzxAc6/lEtVlg77FUP8uBAbuJz
         rrro0LCv0cK/AjOExBYRGhBmbM/Au4ffXelZ8TlACIct7JUvu8pqQTpUzPELszKW4c45
         VzI6cwCGwjNs8eT4AtsV126yMhs3osBQWUb/E7wSzm3szhd1IZtDyajbUDB3WRgzNPRY
         JJgRA7C+z63dWZJxQt17tHkaG/y3CltPs9eeUb2/tsKAg2SnPkidqb3QStylJkFhW3P2
         Zl5g==
X-Forwarded-Encrypted: i=1; AJvYcCVsstGOHCBqxzXwz3CtwuGgUvtkruC4Noin3YuDgHWMt1kmhNJernD5BeUS42kufLR00ApgBTy/WHAvffBrHaPO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyx0UgytOdxy74RA8gqCx6uRICGrgAM+WZ2Ufyo+7lzB6fTS3M
	mdpm4NFKok9hPYJ9vbBMx4A4cRc4UTB0R1UTqQgmuiw1v0oORJEIG8sjCVqlLyd4BB4Md3X+wA=
	=
X-Google-Smtp-Source: AGHT+IHGECinJiUKwmBsi2i5BTL/1XrbB4XlOrXgcycBFFmPNfL7f9tj5b7kh5fqUrWtiXSAzRu4Fzs/
X-Received: from wmqe18.prod.google.com ([2002:a05:600c:4e52:b0:46d:e5bd:371f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:290c:b0:406:87ba:99a3
 with SMTP id ffacd0b85a97d-40e4ece583amr246427f8f.30.1758727647232; Wed, 24
 Sep 2025 08:27:27 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:54 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=ardb@kernel.org;
 h=from:subject; bh=/a2nMupg28rYcZeL2r8+05MdHmb6xlpT3ZB1lHKuOFY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK7wGW9nWOU/SWMWa5sy8KmnlCS0r+vlOl0ZF2Qeb6z
 b5uq293lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkcZGBkmGdv6Z/kzxv/8rjk
 7oifV7r3lF7pMahmvnru29nw3lun/BgZFpQv6Nu6YoZp9KOJ7Mos3D0adiHflhsI/Dm+f9PKZF4 ffgA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-11-ardb+git@google.com>
Subject: [PATCH v4 2/7] efi/runtime-wrappers: Keep track of the
 efi_runtime_lock owner
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082729_344877_73B1E3F0 
X-CRM114-Status: GOOD (  15.89  )
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

The EFI runtime wrappers use a file local semaphore to serialize access
to the EFI runtime services. This means that any calls to the arch
wrappers around the runtime services will also be serialized, removing
the need for redundant locking.

For robustness, add a facility that allows those arch wrappers to assert
that the semaphore was taken by the current task.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/runtime-wrappers.c | 17 ++++++++++++++++-
 include/linux/efi.h                     |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index 708b777857d3..da8d29621644 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -202,6 +202,8 @@ void efi_call_virt_check_flags(unsigned long flags, const void *caller)
  */
 static DEFINE_SEMAPHORE(efi_runtime_lock, 1);
 
+static struct task_struct *efi_runtime_lock_owner;
+
 /*
  * Expose the EFI runtime lock to the UV platform
  */
@@ -219,6 +221,8 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 	efi_status_t status = EFI_NOT_FOUND;
 	unsigned long flags;
 
+	efi_runtime_lock_owner = current;
+
 	arch_efi_call_virt_setup();
 	flags = efi_call_virt_save_flags();
 
@@ -310,6 +314,7 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 
 	efi_rts_work.status = status;
 	complete(&efi_rts_work.efi_rts_comp);
+	efi_runtime_lock_owner = NULL;
 }
 
 static efi_status_t __efi_queue_work(enum efi_rts_ids id,
@@ -444,8 +449,10 @@ virt_efi_set_variable_nb(efi_char16_t *name, efi_guid_t *vendor, u32 attr,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
+	efi_runtime_lock_owner = current;
 	status = efi_call_virt_pointer(efi.runtime, set_variable, name, vendor,
 				       attr, data_size, data);
+	efi_runtime_lock_owner = NULL;
 	up(&efi_runtime_lock);
 	return status;
 }
@@ -481,9 +488,11 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
+	efi_runtime_lock_owner = current;
 	status = efi_call_virt_pointer(efi.runtime, query_variable_info, attr,
 				       storage_space, remaining_space,
 				       max_variable_size);
+	efi_runtime_lock_owner = NULL;
 	up(&efi_runtime_lock);
 	return status;
 }
@@ -509,12 +518,13 @@ virt_efi_reset_system(int reset_type, efi_status_t status,
 		return;
 	}
 
+	efi_runtime_lock_owner = current;
 	arch_efi_call_virt_setup();
 	efi_rts_work.efi_rts_id = EFI_RESET_SYSTEM;
 	arch_efi_call_virt(efi.runtime, reset_system, reset_type, status,
 			   data_size, data);
 	arch_efi_call_virt_teardown();
-
+	efi_runtime_lock_owner = NULL;
 	up(&efi_runtime_lock);
 }
 
@@ -587,3 +597,8 @@ efi_call_acpi_prm_handler(efi_status_t (__efiapi *handler_addr)(u64, void *),
 }
 
 #endif
+
+void efi_runtime_assert_lock_held(void)
+{
+	WARN_ON(efi_runtime_lock_owner != current);
+}
diff --git a/include/linux/efi.h b/include/linux/efi.h
index a98cc39e7aaa..b23ff8b83219 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1126,6 +1126,8 @@ static inline bool efi_runtime_disabled(void) { return true; }
 extern void efi_call_virt_check_flags(unsigned long flags, const void *caller);
 extern unsigned long efi_call_virt_save_flags(void);
 
+void efi_runtime_assert_lock_held(void);
+
 enum efi_secureboot_mode {
 	efi_secureboot_mode_unset,
 	efi_secureboot_mode_unknown,
-- 
2.51.0.534.gc79095c0ca-goog


