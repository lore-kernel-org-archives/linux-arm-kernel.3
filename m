Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeKidemFHugBWvlLdngZx3GvGl5BhC7gmcxHsIeIDzM=; b=I0t92PWVed4hRK6GaXHHbJW/iX
	L5xL57vBJnEv0YGBChKXMajD/6iJHHkgc1+OIPz2CO3vNKuAoQ4aowIGB97hPs4jfkIuxzGOOyn1F
	zxF9Q+xQP2tN0WHHNa1RP+nF0Hyb/3Rz+SpsYmNs2wOwnQgaBSbBBFbvkCPMKRk+sjPxz8zODsIQ9
	48davuMSZawGVV3DnuPCSxfxz3sBNASRVSikbUpYLxy09Z8vCNshl2gduv2tlZ+hh4yz75MDzhiiM
	4fjwZP5WPNxiR8n5hKKZtGXGGu8vT3+SKt4uUbcalj/5QEhbRxJYFsaD3bKbWJPliwQKXOHCA+Od6
	d7iqiHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuX-0000000H4QS-28zL;
	Thu, 18 Sep 2025 10:30:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuR-0000000H4KW-3zyd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45df609b181so8523175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191438; x=1758796238; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeKidemFHugBWvlLdngZx3GvGl5BhC7gmcxHsIeIDzM=;
        b=PWQzv+zHxPISDO4U7neFwXgiuNAPgN/czZRnGRO3HLxu+t4o+YhfvDzgMKJihyaQaz
         ncg3Spj7jEOMIOaJ6EKzUxS5cC5y4s6pzHqtHKGcakYaECoSNpPTemiHAjmJ8gDUBpyy
         7BAnDjxaQ7Sf0QEczPn6yO1GcoL1icM2aiZ5q6gQZZtINGjZ5z/WwSCygQlCgu7k8cwb
         CHHG4sMV1J51yQtij3x9wFyjCON722z4MCzeuThgLMdb3UhWfHhPPBBPelpda3jWqRAh
         1avcWxuuMrfIKk9BO2Eje1r8MHSldmGPwarNsb7vpsbTSkIxtvvqTQFzwyxdl7RJ6Qos
         7aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191438; x=1758796238;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeKidemFHugBWvlLdngZx3GvGl5BhC7gmcxHsIeIDzM=;
        b=Xfc8WpnBcI9ZmW8bbiS3aVTCRrEqqxZfyvRz50ZDd9J/Rkerht9MRi1Zh3HuU9Hop4
         P/1z/A57bjWby12eT0DneOt+mSoTrSm2NBN508PABDb6ADqTK+sBOAEUYVKFO8OrzzJO
         IilEi+bVLbrCAjeapucQE9x9rVRS0J0Gf/vvRfaxaG1vB1LgR7Qbj4M6PPYKvXVxBSHV
         EqG370ubz3lcr1eHe6rGzq8cjRjVNcH09jPMY9Y0y+2jQb0yPPtbL+IXFcuXT1Qtzlkn
         DEtBFqGeFloq/yzaKtecZGE2rDDsFu6x9PIOgoVsFdPPxO9E2e2CbHGXKfbha5zSuNuq
         Hq4g==
X-Forwarded-Encrypted: i=1; AJvYcCUmSA/YDZjWNsGdSnPSynB4pIRxG6gH+yeyJFzLnXuCzQJjSWRjiERw1iSFSfL+Jj7xqSzVS8rT2cz8zZqNvnsm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw3b3yBAzwBV4VYWrfwNYPKCqx8VtxD+LbcO+c2mx+9hzqQlsd
	K/v8hpxbjtZK2teo4YOOC0sM5nEAdVtov5TZ6valvcbKOUcPn5bpTf5oG4fYHQny7B8fUsXVUA=
	=
X-Google-Smtp-Source: AGHT+IGO4Q3fZanqmM0wjFCsbf3Jf0mIV+3pWr1nuubcDlla09trMD8Lvrvc6pAWYylB9LlHYwGCQUbT
X-Received: from wmbhh13.prod.google.com ([2002:a05:600c:530d:b0:45d:cf67:3908])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1554:b0:45d:d6fc:24f7
 with SMTP id 5b1f17b1804b1-462074c55cfmr47460695e9.32.1758191437764; Thu, 18
 Sep 2025 03:30:37 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:14 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130; i=ardb@kernel.org;
 h=from:subject; bh=sXlqN2yq2zEV1WP5L/wE4aoN5/FR7QwPK75VLdrzA4A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fYut8ixeb+/ldwe/Zy95q5z8xOp3Z7Xn8vJFqpM+n
 gip5eDpKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNZVcnIMIF7L//dMvlJe1Wb
 rH1n/p3Hs5TR8aNi56PZO1wKtNOc8xkZvvPc4/2flPr428W+ecVz+P5FL+Ctl25R7tb+f0rg2cF oJgA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-13-ardb+git@google.com>
Subject: [PATCH v3 3/8] efi/runtime: Deal with arch_efi_call_virt_setup()
 returning failure
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033040_018978_93BD5D3D 
X-CRM114-Status: GOOD (  15.80  )
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
2.51.0.384.g4c02a37b29-goog


