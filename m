Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDC3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=; b=P73bYsA1FcwbCuq9YjJ0DjiB9F
	M3aQ2ZMYC4+i/QQ8xqIn0Sc/0PVg2wsBUvXaFBnuLYWiRyetFfPLjTgyg86Oh48GwkpmXhLsSkMUS
	YI/Q/vX97bac6Ts86Uf/HRrYkEVcDQKI2QMafT2buBOgCqGxwWQeFC+M1ii5fzNz8gC6VbBw4epiS
	1Y0ZqX6gfNeeuuLxnu6MPMjjQnF0ciZVwj1XWpsbSRy6ke9EKzg5uVtsnPW2c7Ynti/w3X79a1gpR
	iX4n/9MXwIvL0bTEGwYqKv5tTen0rE1xR91Y0qDQiEMkmtSOA+98ZO9L8aBswOGOTQHMWmcxWLrHn
	aWlJudlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB8T-00000007DpX-0D8Y;
	Wed, 12 Feb 2025 11:42:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAps-000000079eq-0cYv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5450b91da41so2982325e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359399; x=1739964199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=;
        b=bB3REIlQH6EeaIzGGs5zMfUVah8nRWR6uP7AC0wIFfTq4/xBhvupo0DHOt5heS8FOg
         SRgj0m1D353Y+U6pjq+OuSWKV6UD4JHdfE0jE6kgTOSKXSDDMIcBBLabfAvRv5gvX/OT
         8BK6w46tsq4DB5IsASb1VNliebdOtTF205yzmgH8228DUeHkOYuJfySCqUx3FjEALvok
         r6ABUdKTGs25ZmdVHmS/iRm/BH+5wc4Sxh57MgLisGej2kL8PYH851SG80tD/RnfuFC2
         wqGud1RdsYqDIoj1Yzh0hd15+jNkPYP/B/wOMbI6CO9wXioOF3SqxWUtK1LB1NTI+F8H
         C0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359399; x=1739964199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr2oSZFQs/khvnnGeJohJHSvChXi9NfDOygi+WZQm/M=;
        b=QvCjRl58T+hk5+16Z6rUAIYqmB9FLCSBWcPpEEzQwt2vXySaaheNwA9ker3GP8pV9d
         YKYBTMOyLp5V7h+Jds4YzZKOPH18nZ8avbSqACrn0qS/LlwTXEO76ko5VpwW3EDaT023
         eRaOUaW6t/29JCJgBUAwFReO38SZchqlxmrXG50agjsvw0CxrK+KBZ7tA+LLfuwSnp/J
         II7ocTKBsdOatJUpbbtI1EvQqBNKfmPP8NKGk7dTJTI6JBV9WRQxxyVySYiYII05/DBb
         GwdLyH2kVTukEb7WaTgyT68S3Rk49TAqCY7Nns8ee3WeR1SCaJmqf1arhxLxIQUI6bGj
         ERsg==
X-Gm-Message-State: AOJu0YwCQXqD0Yl8xojPwoExbXR2GaxRaNuM1ZBm0ZHBCWIvPh7oi9aQ
	SkxrtjyR9brUV6xu2hkqssvMjbtPwoEo8jVz2ejJDrhjqlp+CrrJLce79hnB4I8=
X-Gm-Gg: ASbGncsj0co93r1Iz5RfSEgc7Siblf0iW7UnH4NH8j77F/phq7tEULZ/N0RGVDD8jgL
	ma9Tjspf/MJUPetRecVxERTiLXEXdI2X0rniX675wZ6CqjX1ITucL/ybbzE3AOqlXVBAjhTAL6e
	ThOAJCBtePkWfec8/gctkvgnSOIcgYMv/aUNavHC/zel3FRtW54wDxfjtomSS8+YvBhx9qPc4eH
	bHsiqQPB+VVHaBdy2dU6PhQxyVCET2tFB8EK+ZIHxDukf/W1bGvVmLvS0aHQEU6vJUsa8EdFZjF
	clwn3sQCc9LiexDhVc7etHZQPw==
X-Google-Smtp-Source: AGHT+IH+IdKt2FT6tNPNoUo8a9kRuj3wtpUX5pKBXA/WPHTi8mdjHVXpF8+ZHzJO2eM+nciMsumGwg==
X-Received: by 2002:a05:6512:3b99:b0:545:cd5:84ce with SMTP id 2adb3069b0e04-545180de56dmr819224e87.8.1739359398590;
        Wed, 12 Feb 2025 03:23:18 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:06 +0100
Subject: [PATCH v4 12/31] ARM: entry: Rename syscall invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-12-a457ff0a61d6@linaro.org>
References: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
In-Reply-To: <20250212-arm-generic-entry-v4-0-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032320_191064_8D0FC1A5 
X-CRM114-Status: GOOD (  15.85  )
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

Now that we do not have a separate trace syscall invocation
path, rename the invocation functions to be generic.

This can be squashed into the previous patch, it is just done
here for the previous patch to be easier to get a cleaner
diff and be easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h |  2 +-
 arch/arm/kernel/entry-common.S | 10 +++++-----
 arch/arm/kernel/syscall.c      |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 9c664d8c5718f58034f442c20a030b59faf65dd9..b94fd7ce17f82f0baf06b74800245112e1f13002 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -19,7 +19,7 @@
 
 extern const unsigned long sys_call_table[];
 
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno);
+int invoke_syscall(void *table, struct pt_regs *regs, int scno);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f0f1f8723965313b287158fb2a238908db72fcd2..f1e48002bd3075ea67b5883178583127fa0055c6 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -260,7 +260,7 @@ ENTRY(vector_swi)
 	stmdb	sp!, {r4, r5}			@ push fifth and sixth args
 	mov	r0, tbl
 	mov	r2, scno			@ syscall number from r7
-	bl	invoke_syscall_trace
+	bl	invoke_syscall
 	cmp	r0, #0
 	beq	ret_fast_syscall
 	/* This path taken when tracing */
@@ -390,7 +390,7 @@ ENDPROC(sys_mmap2)
  * r1: regs
  * r2: syscall number
  */
-SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
+SYM_TYPED_FUNC_START(invoke_syscall_asm)
 #ifdef CONFIG_CPU_SPECTRE
 	csdb
 #endif
@@ -400,17 +400,17 @@ SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
 	/* Make space to copy the two syscall stack arguments */
 	sub	sp, sp, #S_OFF
 	mov	scno, r2
-	badr	lr, __invoke_syscall_trace_ret	@ return right here
+	badr	lr, __invoke_syscall_ret	@ return right here
 	ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
 	stmia	sp, {r4, r5}			@ copy stack arguments
 	ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
-__invoke_syscall_trace_ret:
+__invoke_syscall_ret:
 	/* Drop the copied stack arguments */
 	add	sp, sp, #S_OFF
 	pop	{r4 - r10, lr}
  ARM(	mov	pc, lr		)
  THUMB(	bx	lr		)
-SYM_FUNC_END(invoke_syscall_trace_asm)
+SYM_FUNC_END(invoke_syscall_asm)
 
 #ifdef CONFIG_OABI_COMPAT
 
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index 36330023b5484399a4ca2fdb5727b410e2c74b6f..6f518ec3870fb36a64d1b671b20f96d63a52bf78 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -8,10 +8,10 @@ static inline bool has_syscall_work(unsigned long flags)
 	return unlikely(flags & _TIF_SYSCALL_WORK);
 }
 
-int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno);
-__ADDRESSABLE(invoke_syscall_trace_asm);
+int invoke_syscall_asm(void *table, struct pt_regs *regs, int scno);
+__ADDRESSABLE(invoke_syscall_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
+__visible int invoke_syscall(void *table, struct pt_regs *regs, int scno)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -23,7 +23,7 @@ __visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno)
 	}
 
 	if (scno < NR_syscalls) {
-		ret = invoke_syscall_trace_asm(table, regs, scno);
+		ret = invoke_syscall_asm(table, regs, scno);
 		goto exit_save;
 	}
 

-- 
2.48.1


