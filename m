Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46F6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD0cTRsfkQ0iON4YZtzctxecoLUwl3UhcnKx4hSqyjw=; b=fxdRx8e/1agKw0s1xhcVO0Op84
	dH6gDrjiMNVvIMP7Nx+BgI7mwFZuR2gSR8asAyLgvRwxcP0HeAXNsxTutPN8ZrmPeuqs/T5o4IURd
	xOnbgz0UG9tlW6mUkV40NFAlJMBoKvdSp4txQ+PgJnPFXEP02iwVkDlQaMnVRkmW4Z2+269vaS80p
	sYI4Zm8L4C1C1CQU7vPatVRhv5rOCWfQfkVND1TC4IcvBTr4g1dXGC29gVpVrezBG17osqF2oLYiT
	owNx3/BZMYtdrYDTWXtb5mBJqQd3sd5cibYb/Sd6PbR2q+SdeX+pBYlY1Be8gkrwaXoeHUGDathMm
	yDr2uQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cY-00000002tkA-2rvT;
	Wed, 15 Oct 2025 21:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cW-00000002tiC-0U5p
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TD0cTRsfkQ0iON4YZtzctxecoLUwl3UhcnKx4hSqyjw=; b=XhOzL1t0M78ie3lcvQXQFKcYhd
	lXcfdI5nxkzF3B4NEoGKT5O2Z/jqj5IY5Ps6uIZGC+XSMq7UuyKf1DZKWLzcEr5oEDY2hDDNxviED
	BWvHo1Vjz3J0pS7gUELx0V6qpJbcAkTXSt7llKNtOSO87evmJv4h11pfAAGocTD9JFpa1OeHD3aGB
	+Xb4+cWHCBFAoDCTaYnk1yLLwtNqD016HrXERY1fWpRU4MYoCuk/1Gm+f8YrfgLy8rdYRnt5jW1i9
	G/palDiZEwH4UPHpXCGns06KL4qQtMUT5b7dtuxYTxbo/4diekXSPoKsQXmv2SNuT+1VB9ahnVFZA
	Cf4UB8yA==;
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cO-00000006G8W-05Df
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:13 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-63468fe211aso8320529a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562064; x=1761166864; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TD0cTRsfkQ0iON4YZtzctxecoLUwl3UhcnKx4hSqyjw=;
        b=uWCOojO530KkVwjG1f+NYTqvW0Pgis4y4FBhT/0RaqeL+1WaILnlx8sUG6BAFnSQ/w
         8UHgw9wxMQ/KVZaEHM3C7J4lHQ0yWB7Afk3DDs5C36mU1uZPGljF+UnQK5fbh/C8RFNl
         vyi3TQE/OlH9qaWhDArAzOgt50tSTd7fZfHDEud98qPAmi4/X0znTq6BihdO7WCJDYic
         hdSleV0+dzIIwUrlIKHTEuRtjY4gO2BsluYq6K26kg0llxB/dVaRn95ZhB4okvUUCfis
         Hay72rKkTKHNnaDmkHNJedwkBW20UpTRXXPfkDQEhAGJWgdLAllWt75NB8fnry5Q2iLK
         j6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562064; x=1761166864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TD0cTRsfkQ0iON4YZtzctxecoLUwl3UhcnKx4hSqyjw=;
        b=X1vvNULpjlWuh32JoekX6FWfXz8Af0OTJ/jHrlCTwA7MS5CHvHwp41FnV/kY94k3T5
         cdBrW7OObglhXKG0wWiYkphXTdDWpYA74kh6yjDqjZKFaUrmQ5jm/TQIVA0CybpCW9Dz
         V1RbG+7hPPVUiuLUvuQpDbz/J1XtidJrEIKKMQ8oUMgebDVfo7oeKRX7ARHLXC6nx2Oj
         xJdL9q39NWA5V44dChiWOeBc1/CcyWMx1dP9M83lH2nzztakxfj4q8ni4eOQYVqzTjPp
         HL7pbR+TYG1STM0G3wxSkJu0nnxo8Jiceo5w/VB6reHEH5Bufxus7aZaxThQobNP3WHj
         SG3A==
X-Forwarded-Encrypted: i=1; AJvYcCWOxtPRvnIRUPtFankfDROb5OZKg6mWWMn7CgmoEyg5NQRn2sUygDjtNGrn7a68IuM6FAvrFL5ABIkk/uJvpZ+q@lists.infradead.org
X-Gm-Message-State: AOJu0YyRhDuX8ZXYh7Iw2vEB/r5eMlGaKp4W1dsy8ebmPuzRlCRG8u9x
	j2J2Z30MXkR94Sz2FBX6CpICDMID8gWsfzOVg1q5IpdSW322fNZx7xzVDBJtOWMdD56pUdBwNw=
	=
X-Google-Smtp-Source: AGHT+IHxb8mJwoK5rKnOiIInhvJ4q4VZQJ2QCiVbFL8msAiqQJ16/urDJrNLJku05vTcxZXu/6n/DgR7
X-Received: from edcy14.prod.google.com ([2002:a05:6402:358e:b0:63b:dac2:1b06])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:518b:b0:62f:4915:bc47
 with SMTP id 4fb4d7f45d1cf-639d5b41857mr27245561a12.1.1760562063741; Wed, 15
 Oct 2025 14:01:03 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:37 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=ardb@kernel.org;
 h=from:subject; bh=gYpYJdboczLvZzwBAFCsuy/KXaHSzTBHbFoWrECa7Dw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV1t9cQbj1TMnuX+/1C4+c5tFuobh62Xpm2btO7vfz
 Zmmm+DdUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbCv4aR4aJToYvt8st5Th+S
 nGolgoNnim0RWpP6ZF5fzOmdUoJ1ZowMixcI9ekxzvwTNP3mXMnfTRcy2o4za+5b3DPl4V3pA5f D2AE=
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-11-ardb+git@google.com>
Subject: [PATCH v4 resend 2/7] efi/runtime-wrappers: Keep track of the
 efi_runtime_lock owner
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220111_614437_1DD5237B 
X-CRM114-Status: GOOD (  15.83  )
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
2.51.0.869.ge66316f041-goog


