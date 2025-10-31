Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BE3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/RaERATIracn7UtSwS5tFdTv/dEoSriJN9vedmIsxs=; b=ijAFokebDYnfhQyddFfj3rjTBd
	IBaWKdTXZH54vyx0qx4N6dPN+sEjutTAcF1D75/UCfFqRXv+Ph0LGtoyEoeinEyy1/HrD88glKEeL
	CNsJu80moKQ2dwWt3dMc1idl1pzehuHIih18xxbIWRftLY7Z30t03TMhacmkrhY5f/t2WJMo3axkG
	76xcEI9VCDOgWUXDDlNfrGqYg8h7i0bnPZx0EBBv170JeMIBTjmlC+YuPN0w06j+sVPPwAu7pGVV0
	MIbxscBRBADB1CqEQ+WxH8NjPamTq36O2efQ64ctC+9hPYKgW5FQAFaVxTba6De4tHbDfFWaiR8NH
	GbiX6lOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY7-00000005vEi-1UsB;
	Fri, 31 Oct 2025 10:40:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXw-00000005v60-3CtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4773a7dc957so1016855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907191; x=1762511991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/RaERATIracn7UtSwS5tFdTv/dEoSriJN9vedmIsxs=;
        b=TrWNmC7xnX0nFjpWllsJBH2g/Nb3h6+jLoC/cqiu0seIgbi/FuRnKGW4YSfpkbfzF+
         UFi2Ui00EPRaajGTteCT1P7YLSBPZ9cPEZVyVXw3gdeSSTa4ezAqGu1+FnwwTIQg58BM
         R61aTkOZGyYw+otzrI+mD+q3rZ+LD3rkjWw8V9RhSDyPrDWGs9vy54+MGh9bh6wX68Bz
         h/7UQBbOiMvioFZOaXbeXuPgUbZ1YLsMMD4iKYFe2GRxAkRnyLvROiw9Ib5SzhULwMwQ
         XtfkDbAIErsDnnwMDh6SwyqbJa1RRpjKOFsDNUkmaFLvUu3DqC0KOOgzODQfbIoc6gEQ
         6H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907191; x=1762511991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/RaERATIracn7UtSwS5tFdTv/dEoSriJN9vedmIsxs=;
        b=GtkIAykCawmMWY+VJZ2QhH3ZP2ue1ar1y3DhyEZ+wAxPldI5fAzSb1igNVU5x7GboF
         XmeHbOmg4x+8tg4UoPVRscHf/2KsoPs53GS6d++YTs0Yr3TZhUCQ+EHyHu4jUD4Dw66W
         BqjJqMH2SED4nnLknlrMaPNkhQCx75V4HCQ8qypc1aDcSKDjUZDghode5ABEiNR9SQLY
         zcNm6ldk9ExXN+51VolbbCi+oieXxQ+lAZEpWgPn3E6CwPQbsDObqyAWqpSkmTG8SKtN
         w9eeSxQni0OC6WOnQ0llwzm/AyWlKDl5D2oQYNJEwM6F4SAh73+4x+6I8f/6w1rfbM/6
         c4tQ==
X-Gm-Message-State: AOJu0YzfqBHHnD7xUBdhkTNip/Zv3SbResMAZwKE2s3LOjJWeNjBL75k
	8nCoRTa1RIkpAsW6awNGxXOA2Ijtk/rHwUSaZlzn9FvhgOc6WqlZu2s8+frf+07CU+tLXsxDjIi
	6rBctkz+ZWdXsSN0g7nAe1UN/CyK7LqdkF+qce1aB5S86q+vvcGu5HDPQr8MF9S2lRNLnOniiyF
	0Ts0cCmX/4cf/alGz2jzLTHnYTyA+KWoEjAUBaf9CMxlpZ
X-Google-Smtp-Source: AGHT+IEhDOZqTYQN6JCsrWCZR21DjrXOlbXVaNqUWcCfWzjZpQ00/Tqc6oq9nYRZhpYSEno0TxL2X/Vx
X-Received: from wmwp6.prod.google.com ([2002:a05:600d:8306:b0:477:9e6:88bf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3146:b0:46f:c55a:5a8d
 with SMTP id 5b1f17b1804b1-47730802df6mr26621535e9.4.1761907190616; Fri, 31
 Oct 2025 03:39:50 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:04 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=ardb@kernel.org;
 h=from:subject; bh=M/7s7wcn0cdKhOhqASUBxonxhz5yy2SsKjo9N/ZpQ7w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4qnyS8sPKb69IFY1+c0PRoPgI+G1QUYH3jPN7vrGE
 6knvD2no5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEykLJHhN0tBTKn6F6d2/Y0J
 FcET91VJ/rMuz/7h8zTBUu/D4nWvvzP8U13ef0Rt2iy/1D9zLa/cenzYpJVfaIUx26dve6cuSHw YxAQA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-28-ardb+git@google.com>
Subject: [PATCH v4 05/21] ARM/simd: Add scoped guard API for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033953_127080_E21B3621 
X-CRM114-Status: GOOD (  10.19  )
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

Implement the ksimd scoped guard API so that it can be used by code that
supports both ARM and arm64.

Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/include/asm/simd.h b/arch/arm/include/asm/simd.h
index be08a8da046f..8549fa8b7253 100644
--- a/arch/arm/include/asm/simd.h
+++ b/arch/arm/include/asm/simd.h
@@ -2,14 +2,21 @@
 #ifndef _ASM_SIMD_H
 #define _ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 static __must_check inline bool may_use_simd(void)
 {
 	return IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && !in_hardirq()
 	       && !irqs_disabled();
 }
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif	/* _ASM_SIMD_H */
-- 
2.51.1.930.gacf6e81ea2-goog


