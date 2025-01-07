Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABABE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sy/qewi5QTr4eGa8bqumB+Ls2VPcx0iOCdO37ReQs8=; b=bqqdDKS5JGUI2BadX7pLupTEm0
	s/h6eRUJfQ7Oc9loWymz2MENIe6040coCdP48r9xm9kGr/GHWULE40ar5BHGrulPqZl/0yYjHqAma
	bVeZZFl2AbQuNN6QryPi+xktFpjF8FIJVP77ehq1oG1KzNc/IM550XiDSaEg09efQteyimG1MFNmD
	dgqDzF5vr6Ckk0+xYvBohSQBNs+SGqksCh5IkLGkFSmQ1L261G+X6TiqayRNHl2vI/1E94zriVv2a
	YtWRPiw6GTRGA22ijUKiFUYStXg1tpO0N5iYc6zWeMHD5+8Mr1WB95DGGn7p1CpMGyK+2Jc8nRlnk
	nwovaRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV67x-00000004BBg-3EMI;
	Tue, 07 Jan 2025 09:43:57 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65Y-00000004AJl-3cA2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9e44654ae3so2555684966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242887; x=1736847687; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sy/qewi5QTr4eGa8bqumB+Ls2VPcx0iOCdO37ReQs8=;
        b=CcUjLT7v9/rzOp8AD34nxZY0RRc0NeqrrLWRlfeGW2wcZ7uFG5WQFuDC0iwRLtbAjZ
         dNgvk29RFy6qFj7oSt8eD3M7EGXTGULp+B7mQy+43am8IDu/7CwGpdciS6sIpv2Am0jm
         MuwEpuoHFk9GCK4h5aszNJ7hI664Qva2feYn9o/46vJ74PVouXqx+ZoUxcf8gT5BZHva
         uGf/0nLaKdDTVauGf1ocFitjK8QWCCd7FKVzsIJIpxpDWZ6miaxWPfVe92Ab4VWCiUkK
         297eQSiL9Do+PlFMbEGTsdYHJt0uvfPpztuH/nXm9zarmnZjspOgh/LcUCJiPc9JRUx5
         gCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242887; x=1736847687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sy/qewi5QTr4eGa8bqumB+Ls2VPcx0iOCdO37ReQs8=;
        b=BXUJy+4wA4UjwAK3YZ2xvp1+evU2SUVxF0p/Jd51mBA1k0nF6aZdY3lNu+4bzsEfmE
         6qTl0CfyrpUtDSB9BsfxAtQyL6Hb/dByEL99pfOiFVF5qL/qrWxv9OUJbjlzOy2GETPt
         C0Poqhm3LRctBZ5dOog+9Mib3q/zpqBhh+NqIen+KQ4FYtCK906i2cJwC0qlOGJFhG0G
         +k0kNTNLKgqFtwWJeI2A560MFqyHWoi/Zhsk6IVYVAf3OBS6vnuE2hHtPvsVTUnDl9yQ
         jIM28njCV5xa1HA9kATdfnFphE0lGtcWfDnncaq6IFNm75xCoK9qPZyblRSgczNIp8SX
         c+fA==
X-Gm-Message-State: AOJu0YyQIW5XcPZHEDbvHHgwlFhftfghcgyvwwPbAPsgOU3dtHBOIZMy
	vgZVKWdyWF6GmphF4S68iBpxf0WZR81Sg4KzEIYggCnVc/6xI2qkHTx9ODtMCLM=
X-Gm-Gg: ASbGncuOXpkMAd8/UqFsc2YAi9vRSXdouLrSzy2No9+FFTsMg/5BX7LYrdKNdInGy71
	uLkKO/lF1acY4hzh4elP6R0Yziipj/R+DyY9HL4AZaH3SrBOcPR8Q2Zm2j7MTHPBozAOjl9Iyjb
	bwkTKoFxbF1qPpPy877VdtGjxS1U2c9Ynrjmn4WjGQgHwyB687sItCvX42RA/xH7ndZBwNmHlgo
	qfButmi85YM2rlPNP/Fut+Hxzog60gq/JfvnYzrCRwF+gayBqfKGLl/CD0LSXdSzmA=
X-Google-Smtp-Source: AGHT+IHFAMDNG0ODw2AINJ6wybX6ZQoPMSvIxzZsPDK4VOdkYw3p0VNup/SMUF/w5GkNHETSOyyRrg==
X-Received: by 2002:a17:907:94c2:b0:aa6:19c9:ad08 with SMTP id a640c23a62f3a-aac334f31e9mr5172979766b.48.1736242887317;
        Tue, 07 Jan 2025 01:41:27 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:17 +0100
Subject: [PATCH RFC v3 01/30] ARM: Prepare includes for generic entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-1-4e5f3c15db2d@linaro.org>
References: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
In-Reply-To: <20250107-arm-generic-entry-v3-0-4e5f3c15db2d@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_014128_902009_279FE69E 
X-CRM114-Status: GOOD (  13.84  )
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

The generic entry code needs a static inline function for
regs_irq_disabled() so add this, in further requires the signature
of on_thread_stack() to be __always_inline so add this as
well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/ptrace.h     | 5 +++++
 arch/arm/include/asm/stacktrace.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da06fa393f8be7caec8d997637a88b2..a01c66f0ad907882af2a383e53de8aca68c551e5 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -52,6 +52,11 @@ struct svc_pt_regs {
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
 
+static inline int regs_irqs_disabled(struct pt_regs *regs)
+{
+	return !interrupts_enabled(regs);
+}
+
 /* Are the current registers suitable for user mode?
  * (used to maintain security in signal handlers)
  */
diff --git a/arch/arm/include/asm/stacktrace.h b/arch/arm/include/asm/stacktrace.h
index f80a85b091d6c4ff365e15ae7100af1c3aed597f..815b5f256af164daa053f3bfd6cb2f54042a8d2b 100644
--- a/arch/arm/include/asm/stacktrace.h
+++ b/arch/arm/include/asm/stacktrace.h
@@ -26,7 +26,7 @@ struct stackframe {
 #endif
 };
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	unsigned long delta = current_stack_pointer ^ (unsigned long)current->stack;
 

-- 
2.47.1


