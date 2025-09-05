Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD8CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+gwoCjWfTju3sP/jVtuc7/g8X3wct7nCOhB3h1yVAQ=; b=VesU+x5og97OeFqX3NHO1Ukn4/
	JxC7LSe2Qv+TyB3NthhJqTjkguz+MazCvFyqj9uEw9+79ccfEe+dWYWGSjhZhiUZ7ypqyMTvbbMwF
	Mv+2ObECRotSRt8pqYZPmEwInjc+c1xiPMjulJV+irO9/96LQmAr/4sdFKUXC0zaKKM7uQvwvnc7S
	vUyMtboRmJLmvZuBO71Oi+vkTMZLkMz8RUu5+vpS0L/rUWjiSPOAGrOTvrCdF2ueZ+gu5qUxJkKBj
	6aYfkTNkZu2l7eDKCYQIuAzOppdZfxk7NOQnYS59ONnFXpsu8Pl7X7ZKSU5FlkYwy5fJlnXvA0UVt
	wfMhjVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc52-000000046tM-1Ngf;
	Fri, 05 Sep 2025 19:26:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWg-00000001zPP-1VhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45b9912a07dso15339365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079049; x=1757683849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+gwoCjWfTju3sP/jVtuc7/g8X3wct7nCOhB3h1yVAQ=;
        b=UPW3izUUAHbU8zEBnMscX73UYMfH096FqJQe11i7okcJUNC0bPvTxeUktxmMpbQQWy
         rCBlz5W0v0bHCvpv/EwPz2yvtbdle2znkgeZydih1hAAj7SHxZ1Le5OuwYz2U6bNV+Qx
         M3AeUmcYxAOEw1jSWL7Ne15c2PBdXsruim+011SG4EWmtCo6fQkw5oeCAcmdCRTBeF2z
         appLTuXTLcvsLVMCs1AgX5N1YGt3r/BSLJZRxC4N3NjXl3s3tgMAmMN1PF9JyZOPxTOt
         BIhj2RlXQuKmF5sxZqgQf16mt0PuurR95CELlhnFopmddUEHwjNlO7pIC8MrujdRCzu/
         x1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079049; x=1757683849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+gwoCjWfTju3sP/jVtuc7/g8X3wct7nCOhB3h1yVAQ=;
        b=esMxUh+AP9SHuZ1ix7aapKa1EE3AXklXDOyZVWYEh28oAHX4NnM3taCgwg8Bcc2TlM
         sIgZd0cgpzgX7USYNTPvjmnAYpU9BE51Ba0/JU2e42z6rzlDGuYdH8O6eb3Hi0LJ4mCR
         lwvAcsO7c5WWijAgATSkVWnG8d8cjxSQFq9/JSwAYD6kSRA1mS1H9xkB21y8CFtEHY2o
         +fefm8LWxWM19omzl/TC2UUy/gZgkIeaIYvcM/Oy49PFWEuMc89F3sEZLiclxMCVgUq9
         5l+h+XEC1vp/E/aFevDAytN/1sqBQJVTmf98+E29FBizdROYFTeGurx40auxqasiT47W
         TMcg==
X-Forwarded-Encrypted: i=1; AJvYcCVjeEsTkA1fCVFRpIApjKJikuGGHq6EC6pBOLI8qAAJLlPKPUonRMP4toAwdD5xMWl7DjLJpgVEbQA5fN0rLOle@lists.infradead.org
X-Gm-Message-State: AOJu0YwcPbX7jbsUik0CoYrgVngbUPO0ezX8pdwasEe6rvSMimdjp0vq
	3m/VYy3NXS6i1wqdg5Vx8WsRRpYqdRPyLhE17QZqgkknVXQ1B1M4NssgYCfSOR5Qnb4LsfC10A=
	=
X-Google-Smtp-Source: AGHT+IFopEjOcoNJYtItMHOege0+1Lpxw3R3ZwN0yI0iXz4fJJsgWwvzjjGw2Y/Y7xXxRt/ZprPJuGNY
X-Received: from wmqd18.prod.google.com ([2002:a05:600c:34d2:b0:459:d8e5:ae9d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e87:b0:45b:47e1:ef68
 with SMTP id 5b1f17b1804b1-45b855bec6emr184837055e9.35.1757079048728; Fri, 05
 Sep 2025 06:30:48 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:39 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130; i=ardb@kernel.org;
 h=from:subject; bh=zNP081W6ZhtW0flsDQ3N/BMuwKS0QOlu9XU/sv9Pxgo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPX03+yk0xKTJwl38T/f51SZBqVXMC0s9Fo/qwXrmWqL
 PG3gzd3lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIloZjP8FXQxVZrZNXWLnZXB
 Ow1ze94vX/Zzz2VK+c92/LwAi+f1BQz/q3YrzN9To71e2LlDVqzuLIftb65dFrlRy2baqk/8tUa YDQA=
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-12-ardb+git@google.com>
Subject: [PATCH v2 3/7] efi/runtime: Deal with arch_efi_call_virt_setup()
 returning failure
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063050_398782_DA5D1962 
X-CRM114-Status: GOOD (  15.44  )
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
index a98cc39e7aaa..325d892e559b 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1181,19 +1181,19 @@ static inline void efi_check_for_embedded_firmwares(void) { }
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
2.51.0.355.g5224444f11-goog


