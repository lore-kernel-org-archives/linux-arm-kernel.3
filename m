Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC97C54795
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3joKKQQeIZmQE4kJSA51zMSWECAKvTydbD+tuMEGFg=; b=SUZ9YALO6jS7pGQt24nOSeDFLk
	yDf3CCuCLBnYCqjkXPUYYeCL98BWDNHZ/elzQjCJg9P2rOHs2RUX4kR/Lc81EzXXd6eN8jx8zAoQk
	e4M1T5QtoTvasY4j59pnOFw8ht/tT5JpxumRPPc63738NgcfNW0QXwvnz5g7mDMEmdsCuC4DaJrdR
	dQwA3R3q0CFAKwCfZpc76iKqCMnhGlZLo5uhV6wxt0XAnD1dmvk1rP+HIFUswoUell62wlkzsG0+p
	A9iMOLPEg4rSNnmQRZjR71WYpz4FCefnY4zRJfpNSBDJQkUPJiSmhjKzL5hlzE71E0vuaGTbHuU/f
	6a3Y/GcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvP-0000000G1wg-3WF2;
	Wed, 14 May 2025 18:33:51 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG9E-0000000Ft2p-3Gn7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:05 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442dc702850so477255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244643; x=1747849443; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3joKKQQeIZmQE4kJSA51zMSWECAKvTydbD+tuMEGFg=;
        b=jOBYME0AMwbIDBfOCx42YYVfqummRAHvlYDK6T4s50h30bH8qicQrDSikYANkMEf4x
         cMl3tO8JT4ipTvHj9LYNPSWi1S0nk8rl9B5g4Gx9CvOm+RmsqUc8qQcy1iSjZVefCSUH
         ghWrw4v8iMLilxh4Z3SnQ8TWE8wlwoPgqr5qJlPxEKz/OZlyPBZO4H3wrJra0twdMP57
         YSw/PPrZ4CynwBbPtoI20wdrIDEokXw0xOwYED29adFh/sqNOvhGkP6lRniA/6JGMetR
         rgMCy9e6ClDpI0Sq57+XBDM061br7X8kk1BbMO0RBWcikLz3UiRYVa6b+LAtwVzWzPvc
         MF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244643; x=1747849443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3joKKQQeIZmQE4kJSA51zMSWECAKvTydbD+tuMEGFg=;
        b=JqxBe0XnDRSUiyRqoeVaEsw+rmqs9Q7xDob3SQi5dUPBmkGkORxJya4uNxxdZ3cH38
         v7WFc+9xYHXFVCU7EUXEPvILzkLCDhpvK7LofR+Rh8PrWITVRqnS2KMRO88vxJiXHS8v
         GTn+oQP7bkuOn7b89gYKcrKg7sRnHbzVqZcWdt75dfgj4W2e6s5SsEU+zvMV6e5k7muH
         C5MwCCBVhwqXTNznzBMLcukjAOZoNPvWwgIKPzyXWxqn5B0Hvfuo+xZU78RmDL2YjOoK
         rOPWHy2y6y6QUx2JWWUE7woCbDsHUicO+cKjPxqa5uEvUZIJ6o9bNNSHb1uyDtDsD3W9
         pAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj4QfL8OAgLuC/EWNEqoAC41QwdSrDjkVoUyC0EwehKLXV9QnwccVkP3ZrMmtOuoLrHhOjDORPv4xWLdaSrSrM@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHmPq0TXqEq9McPm2b1TdCoyEP/3TMX6isOf/Vk6lm9xcniHo
	pBp7UdUbqlwppix4TkcdNfOqOjhG47Jy3j0jpigVVWgXb6WQlYdBJYBiLnbafFSmuTrSRA==
X-Google-Smtp-Source: AGHT+IEb+8/c9BiVGl1VreAZ1QbOIrYHfFd06gIJ4WYvdQgg+dQ9aQ2nVaMRaSnJ1H83VLXljFnK3HOA
X-Received: from wrgb2.prod.google.com ([2002:a05:6000:3c2:b0:39d:7be5:b8fa])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:420c:b0:3a1:fcd9:f300
 with SMTP id ffacd0b85a97d-3a3499224cbmr4177122f8f.39.1747244643209; Wed, 14
 May 2025 10:44:03 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:44 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=ardb@kernel.org;
 h=from:subject; bh=B/kHgdOpjuIm/yGgjP0zTXGcP6XnGaz+vciWyr3djVs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWkj9BO3u3gnr2ypE5E2uvsxuvTddxnHDnQ7TowlXD
 uj/FmPqKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOZo83wT9ddzsGtYhv3rz/7
 NOWs9zVYcR/I3iEhJNXOMquLS2aWN8P/rHDfI4ztPNuVmsOTZFLuFfz8f7KhK/XA42jhh4384g+ ZAQ==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-13-ardb+git@google.com>
Subject: [RFC PATCH 4/7] arm64/fpsimd: Don't warn when EFI execution context
 is preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104404_824967_7AFF4DD0 
X-CRM114-Status: GOOD (  13.16  )
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

Kernel mode FP/SIMD no longer requires preemption to be disabled, so
only warn on uses of FP/SIMD from preemptible context if the fallback
path is taken for cases where kernel mode NEON would not be allowed
otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index ae2ea0196030..47a8706e26b7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1975,11 +1975,11 @@ void __efi_fpsimd_begin(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	WARN_ON(preemptible());
-
 	if (may_use_simd()) {
 		kernel_neon_begin();
 	} else {
+		WARN_ON(preemptible());
+
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
-- 
2.49.0.1101.gccaa498523-goog


