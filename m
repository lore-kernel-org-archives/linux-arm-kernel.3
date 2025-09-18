Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3DCAC5A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR5f/DGegjp210rMbwdyPD4vKBD/9uV5LYcxqzD4mrs=; b=gJRWtZj3X1wXVs6Le0OB4S5AhS
	bgUWYWs0FQ37C7BKfo7RgClhXqqT1mDsnCjXvT7tKdRKD1HbfOnisAIYQ1FNPHWR5/pcDJI/PMJqc
	fkWMhIGmZKYbEqio6grtXd605aUyK56JcTqcpBLKgfP/VCrWmDcG9tXRUPcgSDb5FY47blNkWbdSn
	Tswn2KoECW9jiz55RhPPqhTIAM1cxIamXjD6IGFWxoxeUsM9nr8WpN4+knIt6bGorzq5aV73Jxrl6
	Pg/RJSrrFxRj2s7LbNc0xdr1nFWXRVqjoF0yBDGQGA4SYySIx3jelvLH58caZh2mOl12DNYWg8BIb
	ckY0jjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuX-0000000H4Qy-3dAV;
	Thu, 18 Sep 2025 10:30:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuS-0000000H4LR-3e5L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:41 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45f2f15003aso4952495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191439; x=1758796239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NR5f/DGegjp210rMbwdyPD4vKBD/9uV5LYcxqzD4mrs=;
        b=kZ4fHiS8cP95iJQgBKIBbvK3tm0wRKSjHuj3YudFLtUOGBCn6KPXz/aTPd0TORI9Cp
         X4gY51nEJu1jikmuhAJkUOovAeQPSS5E2IxiL8C1F7NXfhvkV7YKOJJtai4bzbx7n0lW
         B+jtepFbyD9gq1IbGtU8AwQgWJidjq2sei2qSZw4eXrZoNamGI77BryIEqPTgMl6iAs7
         g3Bjg7UEOZcWCEL+GEHy9hUFDPOFqgVHKNlT3s38toO0AwJYvbvjn8ypgvnEy2AlcG8+
         /Z1y5JJ3aSdy4xpjKpRB420MWoOd8MlmPqp7YjGmKopSOYmo6iaoqz2xB5Ju2o2/rFL4
         Y8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191439; x=1758796239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NR5f/DGegjp210rMbwdyPD4vKBD/9uV5LYcxqzD4mrs=;
        b=jOEaJUzUM0SYcQne24Gmm4xsMOO38E0UZMcZOACPcxbh4UWeTeDJK8Dl+Lnv9oSUwS
         sxnlXZp/QPcu+NekIiy6eLhRP6EZL+oSK3/x5MZrEsDCDHmlA3tO+jK6B2SF7wokTGgr
         T+Q5Dzp7tmUedTs2gCWeFk+URb5PG60lcljFGlh6PsIIgpngCr2X53TnCrYHy7zIlxrd
         H2IIl3cmBBDOPW+kPPyMp+7RhQMgyMhVeRAftB4jYBNx64e2IHBp1sBFNo21H3Sm6q8C
         uSdDUBoOz3vavTUdXHT+ZFy/heemcx8/SIckd+mG77h3vwgSs//M1C4new1sn+iMcTg/
         pliA==
X-Forwarded-Encrypted: i=1; AJvYcCWO6MKMYuMXjqRTbrnCx/liByHqcAI+GsfRlmoN+bPOYyxYbARlYGYN0mOpAk9r8fm1XBgIX0cC3Bs8lecwe7wg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7MdJKtO47BasdNQf+hwWtGtZDAugcp8E7JhdFconGyjmpXOAT
	5Hl/oNsthEntc+bTVG5rQisbn8RGZ8zEppQ6gejk2YYJ6G/o1E0pJmdIlE+U/2eBSWqUSfgfOw=
	=
X-Google-Smtp-Source: AGHT+IGJRDEcVjOSC0x4VhiypKhaeygXXwL8oEycCf0lebIDZdWUzxAElbwqtEPvM8D7TYbl26IgU59P
X-Received: from wmbjg15.prod.google.com ([2002:a05:600c:a00f:b0:459:dac7:4ea6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e8c:b0:456:29da:bb25
 with SMTP id 5b1f17b1804b1-46205adf58emr50900465e9.19.1758191438954; Thu, 18
 Sep 2025 03:30:38 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:15 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2763; i=ardb@kernel.org;
 h=from:subject; bh=poM+J5QCFnAX0KM+dokbbxbcB3uDup+BM3HzFyYLTNo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fctrGjeLUg8v1i7zzZd+7yCZv9R4om+bjWA9q/VtS
 U81k6kdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCIGOxgZvkYvit31ctcXe14r
 63MzuU/LONUXFV0L36zL3Lud60jtXYb/vtuX/9geGc6oe+3d/UeKUz5pz7ZcX2Rr8l/0zJoVV1d /4AEA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-14-ardb+git@google.com>
Subject: [PATCH v3 4/8] arm64/fpsimd: Permit kernel mode NEON with IRQs off
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033040_923743_D9EE5CDC 
X-CRM114-Status: GOOD (  18.78  )
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

Currently, may_use_simd() will return false when called from a context
where IRQs are disabled. One notable case where this happens is when
calling the ResetSystem() EFI runtime service from the reboot/poweroff
code path. For this case alone, there is a substantial amount of FP/SIMD
support code to handle the corner case where a EFI runtime service is
invoked with IRQs disabled.

The only reason kernel mode SIMD is not allowed when IRQs are disabled
is that re-enabling softirqs in this case produces a noisy diagnostic
when lockdep is enabled. The warning is valid, in the sense that
delivering pending softirqs over the back of the call to
local_bh_enable() is problematic when IRQs are disabled.

While the API lacks a facility to simply mask and unmask softirqs
without triggering their delivery, disabling softirqs is not needed to
begin with when IRQs are disabled, given that softirqs are only every
taken asynchronously over the back of a hard IRQ.

So dis/enable softirq processing conditionally, based on whether IRQs
are enabled, and relax the check in may_use_simd().

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h |  2 +-
 arch/arm64/kernel/fpsimd.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..abd642c92f86 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -29,7 +29,7 @@ static __must_check inline bool may_use_simd(void)
 	 */
 	return !WARN_ON(!system_capabilities_finalized()) &&
 	       system_supports_fpsimd() &&
-	       !in_hardirq() && !irqs_disabled() && !in_nmi();
+	       !in_hardirq() && !in_nmi();
 }
 
 #else /* ! CONFIG_KERNEL_MODE_NEON */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..96a226316d1f 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -225,10 +225,12 @@ static void fpsimd_bind_task_to_cpu(void);
  */
 static void get_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_disable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_disable();
+	} else {
 		preempt_disable();
+	}
 }
 
 /*
@@ -240,10 +242,12 @@ static void get_cpu_fpsimd_context(void)
  */
 static void put_cpu_fpsimd_context(void)
 {
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		local_bh_enable();
-	else
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		if (!irqs_disabled())
+			local_bh_enable();
+	} else {
 		preempt_enable();
+	}
 }
 
 unsigned int task_get_vl(const struct task_struct *task, enum vec_type type)
-- 
2.51.0.384.g4c02a37b29-goog


