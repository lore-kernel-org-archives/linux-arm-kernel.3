Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1649DC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVzjh4CI2wdh2Lb2nY0LTHSQ875qMVuhPD3D7+BHQLo=; b=L1lEQ53Oo1BqA40Pbzj3+XMVVq
	TtRqtL2x+28+n4OPL9Q1mHynAR9+HDcfRZRurOiZRIU43MS0Kpe/Y142sufZhXAqvDwGbP4SaNlUz
	5MaeS6ysJ7/0J0wQyMrlQhexNeKAG0exS8iAtAwjqNv2BxwXimtXXUF5/Fla1XRmOsLl5KnqXSo2S
	GYtAdJhpjsTE4tAOpZ0Jvy7a9RKq+jC7DVUxfCzAOXzhNO1z7pCzXlylO/ctPlQcBjWDnCUqN4I0s
	QAiHIBZmV7E1FXGswsUCwkTIQapjVQpvpXQgqyN13uVTN1A7ssv9SKCNY2h/bS4FdwDPI1u/aQYqN
	mWvEG3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6H3p-00000001uuq-113M;
	Sat, 19 Apr 2025 22:53:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnA-00000001siW-12cf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54b0d638e86so3515424e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102167; x=1745706967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVzjh4CI2wdh2Lb2nY0LTHSQ875qMVuhPD3D7+BHQLo=;
        b=Zg9s6TF+3kCZfbiZFhcojPO2yjm642ZcXnMYu57+68Mo2ETuJhVonKgsIDb6fwOm6c
         zgXctsTZ4HhK+DLVNkA1MBw88SQy7PDMMgee1kdqM07lNTBX0/oN+jyDv9kv4oMIzuu6
         Fu8bxQCIUSxeJ87/Sve8B5etlUPtjL/+CvpYSbbRNWi/0DKBxCPU3q5dBYO4NY25iU9O
         vIHpO3uISqxoO4RajM3VErMroQ+s0ZuDh2r/GjDmn4FPDgDLiXJKPallqcE/tgq3gDtM
         YwZG8+squVG9HO1wEmNOCihewOThE7bdadiS5HY7RVlAaHMIAq3uWr7VpTT2SM+7vYcz
         ZgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102167; x=1745706967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVzjh4CI2wdh2Lb2nY0LTHSQ875qMVuhPD3D7+BHQLo=;
        b=PkuZihaOkj78xvRa5WxYCafmqbfqZOeRN1jO6T4J+AlNKtCF+/s231N5qJz2cKeNlx
         cpI5ZAgChlDo/3roBx4EkRxnDiC85vn0fA4lM3aVsmB5GQ0IBJLQAfzMk+B+WFGu7v8Q
         es4ncQvTTSR1qyJIqGns97JkJpTfmADmyyPQH32Omuk47/jbYJYY7RaBfZgsb763uRk7
         GPXyE9xpgbP1C8aJ0XvMguI5EcMUIWV3zMXF0vWxjZu8MQIF7h0VlEvjhjhcoHEbCZ0D
         cjv2NyRE9EGpy9WgwPcHa5VFtUwyMSh1+s4n4WraT0yYX1X6kMSH0ngWSkfg3JyyFPAM
         kBlg==
X-Gm-Message-State: AOJu0YxGwZKZpdwT1Oj+619HcHcq4jEtNe/CAbTFCxL+n1UToNhZtGOq
	M7Xaq055kxPnfvNx6gjrYm853cYaT0OhXiSpC0+asbS65QLMu45w00j++yD8I9c=
X-Gm-Gg: ASbGncsBzJaIO6cX7HnBjZzNXmbIAe91ST821vCqy/V6nxFmueH4zYYPP0dccTJyiPq
	1FJUGrzRCya5hfMVs0zmuGRT2KiMkePqaKxALj2noxpsWvwVhQbzqPYwkoj/3oFpe8Mg0hSNNgf
	rc49QjaXCh998Wu8eZfnimBO4hdVUPYWBJO/5w5bogV2VsW/0JTkhyI2djF0ojkB5wk01JpeJMV
	BuJu3zsKOPiGvOCdC42MPx4Bu1tbgmBVLZLsVWODY0qjOj4C5ySCGoA7Qh6TcIeLath013bSq/z
	03xqgLRUOUFuSv+lKQi0jv01+VxxFIVyEdhde2M9WwOtYbl4Iek=
X-Google-Smtp-Source: AGHT+IG1pK5ONP5zwkjmb5F3Kh3pNns2KgCXtbBbSCQoJiPI86cXUdyKSiDMdutuwP1A2HrNm1AC0g==
X-Received: by 2002:a05:6512:3d28:b0:54d:65e8:31e0 with SMTP id 2adb3069b0e04-54d6e61be01mr1979159e87.5.1745102166756;
        Sat, 19 Apr 2025 15:36:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:55 +0200
Subject: [PATCH v6 08/31] ARM: entry: Move trace entry to C function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-8-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_153608_294167_4439F1C6 
X-CRM114-Status: GOOD (  16.07  )
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

This moves over the code entering into tracing into the
C syscall invocation code. As syscall_trace_enter() will
provide the current syscall number from the regs we need
not provide the syscall number to the invocation function
any more.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h | 2 +-
 arch/arm/kernel/entry-common.S | 6 +-----
 arch/arm/kernel/syscall.c      | 5 ++++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 1d21f26ecf510ac00a878b4d51a5753ee49475f5..66067d165ba3fbbe0f840a89ae396eb1a311bacc 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -20,7 +20,7 @@
 extern const unsigned long sys_call_table[];
 
 int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 77801d039b5f6562b231a6fd4979e318c7e736a6..3cfc6d952ff99be9c4c1be4481ac3039260e3e57 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -292,13 +292,9 @@ ENDPROC(vector_swi)
 	 * context switches, and waiting for our parent to respond.
 	 */
 __sys_trace:
-	add	r0, sp, #S_OFF
-	bl	syscall_trace_enter
-	mov	scno, r0
-	mov	r2, r0				@ scno into r2
 	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
 	mov	r0, tbl
-	badr	r3, __sys_trace_return
+	badr	r2, __sys_trace_return
 	bl	invoke_syscall_trace
 	cmp	r0, #-1
 	bne	__sys_trace_return
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index d637dc74b1c70415933898fbcadbedc71df5f654..377e16c8c53c8e809e3f8b157a889ef115d5c043 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -21,8 +21,11 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
 __ADDRESSABLE(invoke_syscall_trace_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp)
 {
+	int scno;
+
+	scno = syscall_trace_enter(regs);
 	if (scno == -1)
 		return -1;
 

-- 
2.49.0


