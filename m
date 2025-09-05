Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A23ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAF98sQpATPhOILk8yZBv19jRmRkto76vQZwCOx0WtQ=; b=Xut9FMvSSC0Xm+oo+x8/IHy1M7
	jz6mQ+Y92k60comGziYSfyZvZhKP/a69+SXf4CGeODC4awjaSGVfXUSuT3bZLvBtthO/kRTYUsBv1
	XaZgbPbpm3XT+Ln/5BZHKjzbW3Hr8yWMABbLP7hLs8FsKQlp9pDQ+221ovRxpKK4AnxyfsjbKEAUZ
	dxg/7x+XYjg6c47ZWnfSg52m3NslcjL4jR3RDY/g1d6cB33t9zDU4n9TCyY+f20X9xY0SKL1cLtNW
	JXgCjqb11hln0swBDGEL+F++HN3Oiq5YOAzVDiKm3d2KsxtuH7pEWIvd5gAVsuUYKGWlGj4aKoGpv
	rWfyIHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaID-00000003V6F-1Aaf;
	Fri, 05 Sep 2025 17:32:09 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWWm-00000001zSu-27PW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:30:57 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e3b77972cbso482692f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757079054; x=1757683854; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAF98sQpATPhOILk8yZBv19jRmRkto76vQZwCOx0WtQ=;
        b=gCWU88jaO5lh4hOGGPcmwuOzaqEjMCHsG6OwH8eDwKWPbbp3WBP/Dwl8KIBvXk3Lup
         5a1gKn5Bck0gGzp1H9lCKtTQC0zPR9zpOEAjjkhtowlvc9doH8kmpAiVXylmcHxX3VKI
         nrd95pVfHCDjNAGvtn29J7msv0P25P2maehAS2urOITsj0LvYjBkYsceAVONZ8FC0skE
         XbLWKGupRekNU4ErPSRfDWNb5EN7F3g60J6YAVnrOASZJ5LTfOeyP0v/V3IisOoR3wIp
         4zjRwCuovY5bjBrZ551by7Rz2iQTEMSswLdvjWcNiXe1BbV0bRK/hdqpPtEB7tQX+e/X
         g4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757079054; x=1757683854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAF98sQpATPhOILk8yZBv19jRmRkto76vQZwCOx0WtQ=;
        b=wIwWcnRhzAN/fubPGj2I5n9tgISD77JJapKzKhgXD42oCgYN/BCRdrynjCFKR2Pxyc
         CQHaHhElf7z1Axmgfo5A9NfgSlPo8eum6p2TUYDzQT1svqGbFKYnSXBFPw3slYreM1Xs
         kIRfBjzWiKGKleohLeuFTKk8XpaUqdQo+VhpUeXAdELZ87Q4dFHjqDj/NIreLIxOqr/X
         isHIWVIXZGIwV76StylOa0N0VaN4lRtfuOWmvAOCfroXAuyqsQHGwwP9isvKbE26LYyM
         ljpyD1Zkt3w6sGcvcytpZt4UyDMd7ITBcoI+C2YgVWMyL04BmRQLL8AQWZRZDEJH7qHr
         csng==
X-Forwarded-Encrypted: i=1; AJvYcCWPCZ5ip/tNpqciyltQkIxL8nGNNYHOyoUO1hEDErwNgEUuboCwRprlPmudQoKbreRbu6hoRSm61K7IwytUYGzQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQS1WJkbUtpmttj9IEVEyb6wZ2Y3+HFYH90QQcMQpzxajIlNAS
	cUmmfjWDKeLK3Mc51h8fpf58CAKUaStHMDbHL+6XqW1bZVbbxn6TwA6a066AWW6lVHe35GEOLg=
	=
X-Google-Smtp-Source: AGHT+IHLpO7vPeIPvV0hzS6kpc52u4CYIVWVnX+yyG4DktDXavuZLD82XV3iPv6GN2Z2q98RRymwXSY0
X-Received: from wmbds17.prod.google.com ([2002:a05:600c:6291:b0:45d:cf67:3908])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:65b:b0:3d4:a64:6758
 with SMTP id ffacd0b85a97d-3d40a646c13mr15248912f8f.3.1757079054348; Fri, 05
 Sep 2025 06:30:54 -0700 (PDT)
Date: Fri,  5 Sep 2025 15:30:42 +0200
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250905133035.275517-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2686; i=ardb@kernel.org;
 h=from:subject; bh=EAF0+F/3qCMp7xJeOjrqAiIGXMepd3zxzLCGJhcn/30=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWPXM8YdJe3LeJP4vwf3THd6ylR4S3rtYu34UmZbxSsJR
 pLrjm7qKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOpO8/IsO1P5uV/fr7rn8sb
 HFA07HxQLGpdHLL5R/aHORPLOqddXszwhytGu7NGZYpawm6jP93C5XNWqF49PV9rVtz7Q79O/bN YxQkA
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905133035.275517-15-ardb+git@google.com>
Subject: [PATCH v2 6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_063056_543207_A00A255C 
X-CRM114-Status: GOOD (  16.61  )
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
 arch/arm64/include/asm/efi.h | 13 +++----------
 arch/arm64/kernel/efi.c      | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index decf87777f57..09650b2e15af 100644
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
index 8b999c07c7d1..ece046bcf0db 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -178,6 +178,15 @@ bool arch_efi_call_virt_setup(void)
 		return false;
 
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
 	return true;
 }
@@ -185,6 +194,15 @@ bool arch_efi_call_virt_setup(void)
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
 	up(&efi_rt_lock);
 }
-- 
2.51.0.355.g5224444f11-goog


