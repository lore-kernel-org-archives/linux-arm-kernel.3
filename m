Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ECECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SF8ncrqKGZBPqJiWodPZcZtzsyty0i7Yz17S72ramgE=; b=OMg4lPv6L+7trxk3ayR1l4nIfg
	rWMnZeCqb3jFUc0xn7w0px19EZNNbUxNtzqMEnLJiyuyAMCCTAN77uxKztInZle6dl+cGvHnHyk9L
	ELsLueOTzPrRghjtMKN2G3kzc67bTYXIvUXg/92YyrSjcG66cuXCvO1tQ5TU6sj/OgbLd7wln/vKK
	menNyVPwQhUNt3AXcBGZUObZxP0YvzdaM1Df/h2XXvwbKMGaQ6xPShdThvCjLFIW6QPsxpDDr0o6w
	BHatqzFgk9peYjmX1aFCrHacRljTRKXchWTlpwWa9YOUkwMQqxF4vmhfiWsfhAjt2+kWoKlAJaqPY
	LJ9qZSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZI-00000005w15-0iLA;
	Fri, 31 Oct 2025 10:41:16 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmYB-00000005vHw-3ETF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so8102915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907205; x=1762512005; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SF8ncrqKGZBPqJiWodPZcZtzsyty0i7Yz17S72ramgE=;
        b=vyAUMkkKQlrn+GYOPd4gK+BwEzxpmXndYxJjCn4orecFnxHtdwJdqk4kcOTJU8dJ6d
         g75zk4ym1auWvcOXFnXBL0Ds2JXUtegdYOkymulcrkC2mPnCrc6kBMv7PSNy9d4z4rsa
         3T0l+m/wePEUHUCajw4/AUiiSdGS1hZSCMvVBZ4co5lb6QHTxwMJbfG+WlohGmIDSwkM
         Z49VcFPY8qR8QdjPUIcS+hsGFpqsRTZGhhLnA5Cl32lZnJs8HOR2WY/r2PuB/KwKYekK
         7yyYwtXmAaiJwdzgJgsB6XrTdcmEeITlY/DzmCoT0LT7rcvVDQTsXBQIWbuFA5KBPfuD
         iOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907205; x=1762512005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF8ncrqKGZBPqJiWodPZcZtzsyty0i7Yz17S72ramgE=;
        b=VjuBnvFTmbmKDpqAMz/WKvnmG9NtRRW+UKUw9Ej1tRW4QMdDKmSIIKDI69tw++IaDL
         wfCIq4+9UEeILdEMDXeQkrqNN7ut+j3AIwTiSi+1dHcq0/Vfbtf0Zp6PkveHFweLoSE6
         tj1cZBlCeeQgC0oaNPsjA653XDqeTPL7BdrGpl675FvH3WzvV/jDEbP26Nn3g2EmVmRp
         TpivqerG6MQJa+YqWkvlXcQFCBdklddjgCUhUl1jtdmUZmh8f7hfEd9kfBMvJl8BG0gv
         UZeMkuvkFjv5SauKSYLzkkm7qNC2pU6mwa3l2QkC7jp/FgWH3uUi+SQ2OqBLXee5ex/K
         6/XQ==
X-Gm-Message-State: AOJu0YzaBVmS4a2tm2tpQ/9KFJecSipS0RUMdL0rx1IAu7QKYi6VysWO
	Cx2eD2l9b7E4sET5yyBxAQMdf5K1UdSUaQeLeBSsQ31yXKQG0z/mlLO06zuIs+0V0nmtj/scJV+
	+dsDUBInhtGjmCrjXjG/Nq2ny6OSDNZJYkY9KY+ivxaFWrwZrmkwqFmu6laGwmrm9FJbrSSaOxb
	LRwD9bmqMcOkdUNXcA+4rSh40AOfDc0QMuTEiBhGEt7ecl
X-Google-Smtp-Source: AGHT+IEcqBxbY2AIAxAcJMsPotcWd8+1QqYVT1aVGm+VjwDxESgE8ZawF9/oIrAUJEx68xLqm7/XWK7L
X-Received: from wma7.prod.google.com ([2002:a05:600c:8907:b0:477:14b8:19f6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f0e:b0:46e:4704:b01e
 with SMTP id 5b1f17b1804b1-477305a24bcmr31060015e9.8.1761907204696; Fri, 31
 Oct 2025 03:40:04 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:19 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; i=ardb@kernel.org;
 h=from:subject; bh=QCkmJ7w8pvMSbfD6OyFFYQvX8b+Mf1wyse4VMzYa6NQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4gP+H0eZF9crby3kuR/0NfFDu3admAK3vWychkKUR
 phch0lHKQuDGBeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmEhBC8P/nEtnfS3ZXiR9vDY9
 pu4ZV2LeS23Rv09n3jGVaZy24fmjswz/Yy7EKLWZ/1XO9HrZ7r+lRMb6Z+SrY24TdVlFxV8Y6Kv xAgA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-43-ardb+git@google.com>
Subject: [PATCH v4 20/21] arm64/fpu: Enforce task-context only for generic
 kernel mode FPU
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034008_287260_FC82D8F6 
X-CRM114-Status: GOOD (  12.99  )
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

The generic kernel mode FPU API, which is used by the AMDGPU driver to
perform floating point calculations, is modeled after the most
restrictive architecture that supports it. This means it doesn't support
preemption, and can only be used from task context.

The arm64 implementation is a bit more flexible, but supporting that in
the generic API complicates matters slightly, and for no good reason,
given that the only user does not need it.

So enforce that kernel_fpu_begin() can only be called from task context,
and [redundantly] disable preemption. This removes the need for users of
this API to provide a kernel mode FP/SIMD state after a future patch
that makes that compulsory for preemptible task context.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/fpu.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
index 2ae50bdce59b..bdc4c6304c6a 100644
--- a/arch/arm64/include/asm/fpu.h
+++ b/arch/arm64/include/asm/fpu.h
@@ -6,10 +6,22 @@
 #ifndef __ASM_FPU_H
 #define __ASM_FPU_H
 
+#include <linux/preempt.h>
 #include <asm/neon.h>
 
 #define kernel_fpu_available()	cpu_has_neon()
-#define kernel_fpu_begin()	kernel_neon_begin()
-#define kernel_fpu_end()	kernel_neon_end()
+
+static inline void kernel_fpu_begin(void)
+{
+	BUG_ON(!in_task());
+	preempt_disable();
+	kernel_neon_begin();
+}
+
+static inline void kernel_fpu_end(void)
+{
+	kernel_neon_end();
+	preempt_enable();
+}
 
 #endif /* ! __ASM_FPU_H */
-- 
2.51.1.930.gacf6e81ea2-goog


