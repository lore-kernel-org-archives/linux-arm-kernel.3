Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F98EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lr489qzcXalsUK5OJ8OM0VMNZiYyGTMtXZ1AW7+fvJI=; b=K3kPzSoujKFLDKLJE8PupsiP8J
	Thtf7G4uyQaqxyloosDdicIoUPLaZCVdjtRzwyNJqqgKnn8qClPh987I59fMXd8M+wcIEPJHX89oG
	IoeVeKr4uN5XwARG2VhCGnQtYSpj6pDei5TOSMBBQECtKLablsqC3tm0UoUDY/yUoiRkKwIOwat6d
	UCg2iN4ip0GsxVYHBvlK2OLybZGj0lu8/Z7ffwzIejCKlHIDDCuiNDN4iWNnCRoePY1JzFXzFtRy6
	ss62vA8Yt08yFMmJ27rrtO24tLRkpbvfXAjw+GaBNEUf7N44wcZ0/Z2nw6BcIQ64WSMC75Mxc0Fml
	XRhUSn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvP-0000000G1wH-17qy;
	Wed, 14 May 2025 18:33:51 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9D-0000000Ft2I-0K38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so445375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244641; x=1747849441; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr489qzcXalsUK5OJ8OM0VMNZiYyGTMtXZ1AW7+fvJI=;
        b=SigxOjq6bn0qI42pBQKpD9/uh5mDbok6Rxacia/r9szTcdd86/QjY+UF6ZrlXSx3d1
         oklBDWiddeQ2NUFhw4xCJSzblArVosGthk927Q0kDNxC+gpfSjTz4ySVsOAOPj38QIJ+
         Mqj8DXdB3Y2hHINbDI0z6tnYggLRhELfBp6l+9dYGCXBBXyQyouCRj82uIqrhsGdNDQn
         +YiLojnzek1C9mdodztCuux5PSdgJTr6ooddlFA+8DCpdw7EnUHNMXRZMr+4J7LjUgie
         XJLiqOlAtaV++2s5XCrcX8WIby+RM2Y3RWTLvcXR5EioyC7A4ffj8CuI6n8idZpGGtXW
         jg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244641; x=1747849441;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr489qzcXalsUK5OJ8OM0VMNZiYyGTMtXZ1AW7+fvJI=;
        b=uidGPcS/hbvMDGRJpVD+VKpBKlcx1Ou7a2apgFGAirTda2dDrONuig6UoOZZvzAy13
         OE2WEHldbrWn3Uavkwmhm12bYI7hA3RVSB830fd+EfeyVSbtj2ntPJ1wRtgCfJRTX1IL
         Q4nhU8jOQULR91k4ExxFWMY3Q8oG5bD6FD4AWM081bKbWv3eTv5krQZU0s0mLVc4UG+0
         3j77Iok+iQD3p70QTimrj72BNY8K2pUq6i8qKyv/F9KosedN4qZVItplkG/97iNRf1wt
         KazlrrXnOXlI985w36lW5E4uvDUdE2JXQt3+xZodfHGfPjUDrNuDLAn3Lnpcc4BHaFmK
         72IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuch1odMpobYSZZQ3opLp46X8CuuoW3KyShL8+y2o6Le5xFHW2A8mEenhwd0HXUUL//DknpcpYhl1t+4qizZZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxawW3dOjeQAts9lmmPheuBEX4egqpYR1BWsQLZyVaoFVeyBUqg
	OdAD9ouO7gIU9qpDBYNs7K5+toAs5R7NFSSc/6kX/dK9nHRlTadABg2K3FAD/4AbwIak4A==
X-Google-Smtp-Source: AGHT+IF4eQ+ydqWoNEayJUroHoQxAkXTja0NASjKqMSbnY/vDFIWy+Z3Ik1V29mozN3Vprxr/BZDW0of
X-Received: from wmbes6.prod.google.com ([2002:a05:600c:8106:b0:43d:9035:df36])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e88:b0:43c:ec28:d31b
 with SMTP id 5b1f17b1804b1-442f20db116mr51865765e9.10.1747244641338; Wed, 14
 May 2025 10:44:01 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:43 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4131; i=ardb@kernel.org;
 h=from:subject; bh=x0gdcnYhqzj5S3CKFvtpWSVou+0kjuvQshTcS6vWwRw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWtCHRjOVN3Oe9CUE+qgfYqgVFDYN5/fMOJG39Q1XP
 8tvod8dpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIyPxgZJr5t23bkHI+e4L/g
 /Uyb7zvXZkQffX2hPkDyibaNZsRqEUaGu6n26yx+vJ27fmLn2eryZUYT6pUyp/6Y413hmjlb0/I xCwA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-12-ardb+git@google.com>
Subject: [RFC PATCH 3/7] efi/runtime: Deal with arch_efi_call_virt_setup()
 returning failure
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104403_121942_F39D6B7D 
X-CRM114-Status: GOOD (  15.39  )
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

Deal with arch_efi_call_virt_setup() returning failure, by giving up and
returning an appropriate error code to the caller.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/uv/bios_uv.c          |  3 ++-
 drivers/firmware/efi/runtime-wrappers.c | 20 +++++++++++++-------
 include/linux/efi.h                     |  8 ++++----
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/x86/platform/uv/bios_uv.c b/arch/x86/platform/uv/bios_uv.c
index bf31af3d32d6..a442bbe5b1c2 100644
--- a/arch/x86/platform/uv/bios_uv.c
+++ b/arch/x86/platform/uv/bios_uv.c
@@ -32,7 +32,8 @@ static s64 __uv_bios_call(enum uv_bios_cmd which, u64 a1, u64 a2, u64 a3,
 		 */
 		return BIOS_STATUS_UNIMPLEMENTED;
 
-	ret = efi_call_virt_pointer(tab, function, (u64)which, a1, a2, a3, a4, a5);
+	ret = efi_call_virt_pointer(tab, function, BIOS_STATUS_UNIMPLEMENTED,
+				    (u64)which, a1, a2, a3, a4, a5);
 
 	return ret;
 }
diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index 708b777857d3..82a27b414485 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -219,7 +219,10 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 	efi_status_t status = EFI_NOT_FOUND;
 	unsigned long flags;
 
-	arch_efi_call_virt_setup();
+	if (!arch_efi_call_virt_setup()) {
+		status = EFI_NOT_READY;
+		goto out;
+	}
 	flags = efi_call_virt_save_flags();
 
 	switch (efi_rts_work.efi_rts_id) {
@@ -308,6 +311,7 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 	efi_call_virt_check_flags(flags, efi_rts_work.caller);
 	arch_efi_call_virt_teardown();
 
+out:
 	efi_rts_work.status = status;
 	complete(&efi_rts_work.efi_rts_comp);
 }
@@ -444,8 +448,8 @@ virt_efi_set_variable_nb(efi_char16_t *name, efi_guid_t *vendor, u32 attr,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
-	status = efi_call_virt_pointer(efi.runtime, set_variable, name, vendor,
-				       attr, data_size, data);
+	status = efi_call_virt_pointer(efi.runtime, set_variable, EFI_NOT_READY,
+				       name, vendor, attr, data_size, data);
 	up(&efi_runtime_lock);
 	return status;
 }
@@ -481,9 +485,9 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
 	if (down_trylock(&efi_runtime_lock))
 		return EFI_NOT_READY;
 
-	status = efi_call_virt_pointer(efi.runtime, query_variable_info, attr,
-				       storage_space, remaining_space,
-				       max_variable_size);
+	status = efi_call_virt_pointer(efi.runtime, query_variable_info,
+				       EFI_NOT_READY, attr, storage_space,
+				       remaining_space, max_variable_size);
 	up(&efi_runtime_lock);
 	return status;
 }
@@ -509,12 +513,14 @@ virt_efi_reset_system(int reset_type, efi_status_t status,
 		return;
 	}
 
-	arch_efi_call_virt_setup();
+	if (!arch_efi_call_virt_setup())
+		goto out;
 	efi_rts_work.efi_rts_id = EFI_RESET_SYSTEM;
 	arch_efi_call_virt(efi.runtime, reset_system, reset_type, status,
 			   data_size, data);
 	arch_efi_call_virt_teardown();
 
+out:
 	up(&efi_runtime_lock);
 }
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 7d63d1d75f22..13aff30be3a9 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1179,19 +1179,19 @@ static inline void efi_check_for_embedded_firmwares(void) { }
  *    Restores the usual kernel environment once the call has returned.
  */
 
-#define efi_call_virt_pointer(p, f, args...)				\
+#define efi_call_virt_pointer(p, f, busy, args...)			\
 ({									\
-	typeof((p)->f(args)) __s;					\
+	typeof((p)->f(args)) __s = (busy);				\
 	unsigned long __flags;						\
 									\
-	arch_efi_call_virt_setup();					\
+	if (!arch_efi_call_virt_setup()) goto __out;			\
 									\
 	__flags = efi_call_virt_save_flags();				\
 	__s = arch_efi_call_virt(p, f, args);				\
 	efi_call_virt_check_flags(__flags, NULL);			\
 									\
 	arch_efi_call_virt_teardown();					\
-									\
+__out:									\
 	__s;								\
 })
 
-- 
2.49.0.1101.gccaa498523-goog


