Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562FC54755
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5xC8ZFXHRFQPPNvAQ6eM6+yxFQwHsYqCLzJSlhA3po=; b=X0I/KzsUiC38HvzuPWw6mdx/AU
	BGhGu8qJf3oaPiz7Pdd/CVjhYm5AcAOzygORujpizHhilOYaME+iIwdw75ODSfINXr4c5cP+kkbQ7
	O9yIB3TSaKvaxIbxRRyuPmiKZJRRw02ZUFTtJYybsgHHr/zAnYt9CU8U97kZZZaKuBkA9eGDrQNRX
	v6fKAkXVBHIh/DxSYlNOC93KbEjkvVP6DjC/9ERtgm4EF4e6+woORLZxur25wa0vFh6s8wLu1MyQi
	U5KIdLhB2MvmNVW0XHrflZBWiRu+bczeXjpHASY32k1Qh5+CFazA9cHd5M13u/vJ1JnyYDQJRfNGV
	UqdRTAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvQ-0000000G1x1-22j0;
	Wed, 14 May 2025 18:33:52 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9H-0000000Ft44-0i04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:08 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a0b2e56da1so24277f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244645; x=1747849445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5xC8ZFXHRFQPPNvAQ6eM6+yxFQwHsYqCLzJSlhA3po=;
        b=rCf2pPIzgw+Id40ie4xQB6DiEYHHzp0VWSU/OXO5UhcNfBE4aJG9P9Z77SSD4zKqMw
         HCR2BGijSNIxRunsF7NQLbCQoPYQPcK/06+ZhJ2swbruxLpcvGWXO5A+mcc2ncsZT0W8
         h8PgUuqSGRmuxQfF3pAqKZRvG93SfQRvFyiJbirLkjBnqqoyd+jZ0RM7uRSflVVuKlC4
         d3fLvA/HjKmylnMPGDzqHuTZ14T3/JmYmiPQQejROwYFndMVOJDNDd5cdzcGDIkGspcz
         2qzGars6NBDo4493MYkPgqwkRz7BtEC75VAYg3cIN+qma4R4ext5ldWg0XnjC0LiHu1o
         92Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244645; x=1747849445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5xC8ZFXHRFQPPNvAQ6eM6+yxFQwHsYqCLzJSlhA3po=;
        b=u4uRq2hmfmpSmD1/fdwjOii5gzsyPpYEbiuLG1JCGmzkQ3bWXCbj0cLvHjJuNrE2u+
         AUKTTTGYUQ2SaEp31kdBAppArj2fRkQx+8roLvh7Y1DNZy4BttDPvkACk/d3nxjMSNIS
         WdijrnWfGZzQmUv5N04HZ0G7VVs4B0UjNfNKt0bFRi6x6e433YSfiM3Es66GgU01F8sB
         JFAxQ41ImBXdH4TUM7LD0erdC/cZds3LrH27hr6jJuDJYhYlRwNyWjK7pUX5m+q6Uh7M
         OxGbeLfUTDDlsigAYI/L0r9dlPMKqOwJsBO03e+5e0QMd0hNsd7JIHInQpXiPx1wsJCT
         1ZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4hpkTZvKqZJR3YdN+IQ/1dqFupLZZV9gFg5JJNw5Ki4RX+gfifRGGgmecQ7/jKK6/FeBDl5sML54NGsVQYK+z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcb/d91hOawGthR2c4+5kcpp+5ciyg9mxoK4ogMpP+Bj5vhnbK
	1rkSLDpNMAyZOEQxYlWzqPdo2OpMhSfy/42Rzlgg/ql1SP+gr+s/bNmkAlNwlavW+on58Q==
X-Google-Smtp-Source: AGHT+IFCeHUHZ8o9ekV/c+77/nX9iPRwbsYxu0u1T1i997Dl2Av4gPqLXFQx3wbBFDsMJ1AUDDf7weNp
X-Received: from wrbgx8.prod.google.com ([2002:a05:6000:4708:b0:390:e710:324a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2284:b0:3a0:b448:e654
 with SMTP id ffacd0b85a97d-3a349927550mr4086391f8f.47.1747244645140; Wed, 14
 May 2025 10:44:05 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:45 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=ardb@kernel.org;
 h=from:subject; bh=TxFz/hG01vyA1ZDzUGKKYj1NGAs9wXcTsurQl3x2mv4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWqiwsrlNUoHqW/v7Ui9uq92Lzc5f1aDO/jh5Sb1fx
 6+z3kc6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQCvjEyHOi68Gim9dW3Bd76
 sn/tflxf2yIwn0XwqEn4l55ZF47WMDMy3GvUDTDOz7l4UdB6wdp1hx8qN+Q/kzllfp9vf+e51Ef fGAE=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-14-ardb+git@google.com>
Subject: [RFC PATCH 5/7] arm64/efi: Use a semaphore to protect the EFI stack
 and FP/SIMD state
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104407_237024_70F7F167 
X-CRM114-Status: GOOD (  14.32  )
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

Replace the spinlock in the arm64 glue code with a semaphore, so that
the CPU can preempted while running the EFI runtime service.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 44ad5e759af4..d01ae156bb63 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -164,12 +164,19 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 	return s;
 }
 
-static DEFINE_RAW_SPINLOCK(efi_rt_lock);
+static DEFINE_SEMAPHORE(efi_rt_lock, 1);
 
 bool arch_efi_call_virt_setup(void)
 {
+	/*
+	 * This might be called from a non-sleepable context so try to take the
+	 * lock but don't block on it. This should never occur in practice, as
+	 * all EFI runtime calls are serialized under the efi_runtime_lock.
+	 */
+	if (WARN_ON(down_trylock(&efi_rt_lock)))
+		return false;
+
 	efi_virtmap_load();
-	raw_spin_lock(&efi_rt_lock);
 	__efi_fpsimd_begin();
 	return true;
 }
@@ -177,8 +184,8 @@ bool arch_efi_call_virt_setup(void)
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
-	raw_spin_unlock(&efi_rt_lock);
 	efi_virtmap_unload();
+	up(&efi_rt_lock);
 }
 
 asmlinkage u64 *efi_rt_stack_top __ro_after_init;
-- 
2.49.0.1101.gccaa498523-goog


