Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C65C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=; b=qkVT5XQBoapNW0d6MJKHqWYN44
	nNc7+NXh6p0jDEtJKQ8in8aEDU7TYIOFaBwEXQrmQYBvDyM1TIq4x1rZPT0+4TEV79LbSR01wlHIn
	9RnB/rkmEt/5SNsWL3/3X9YUEJNNvKnJho/NNiKnSYqOKsDHfaRlWlbz7Pe0iv8/f2HcMJybmc+SL
	9B805P/HkywifacLHUgp+R6CC9uFI1VFjrtdW7ftK2Ax/KCCsNMI+2RSOETfCataDc+kTH5odRuEM
	nlTEW6qbOGLDE0lkxmZwBVHAqu9hvBgB1DZau40Gwr0+kSdUfI4jcoDwplQhOj3IcS24l8UBLyNDe
	jISilypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tms3b-0000000GnjY-0Cd0;
	Tue, 25 Feb 2025 10:20:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmref-0000000GhdQ-3rCy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5461cb12e39so5193492e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477308; x=1741082108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=;
        b=NQHKDL5vEo21vXoO4Db/YPX09CjA2vAzyBfydrevx8XqXH2upgH76kPtlGJdHhHbmm
         mPfhVDFzUdX8tlO+P9pLkvgie8OZO//2g3/APrMSJbq1Ys+6HeHzTR8IsaNqLKsl0co3
         UPBR1l/Go5CIqMxNiyCVClE0sWWPx5Onv2nrV5lmUQx0x5W92bn0UQlbDEVAi0Agp72S
         AAhtAZcQdSYY2FBQn66W/oPpNbE5PeXN210dsG5L9SqZ8/x2+oTJAF0Uk09NFnNGUt2B
         48YuTNMH9fBKnGZkappI4xfTes9pnz9LfiBdYyPAHOLZ98CXBC7aLdP3PBohHdZ2J7hc
         YBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477308; x=1741082108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=;
        b=fAX+3ngZMDUEatLoX+n0j1mnyCDzvBaIADjiRRI0pmBZidaWvhLbz+Xz6iroHnuAqq
         FzoH8KrEWwwxl/th4bw1HBU3B3VFx5lRpm4OsN8b8wT/oCQBAvUmx7AD1ajVVgdh59/b
         b0jkB0glCQxSVFfrxsHJSrwzJ302YmLPLZwEB9FR1wf1GG0tQywoVZoefZMDUaC9Ga+8
         F8+0WRtUcsJvTk6SN0R4rhshMwBCKbn5jXyxgY5sKMLS9eOnI7v5ClH2caNUD5eqXP78
         F7MKFUkTKgYKRj+VesEG6+DXZ0S7LU2UU6m+nZ+FPwXlST+cXLepCoXeY/N0FY0xFnF4
         t0dw==
X-Gm-Message-State: AOJu0Yw6lJ6tDAlkTbDkJNpeQi8XdtBkuQCva35fPBROQIPIGCPvRqtV
	48jsdOgpDHC1rGNVWUWGcMF7kGX0426qUDIXA+LLlMJwsYgHfNLuF0B4ltTzgAg=
X-Gm-Gg: ASbGncvlwQGBMi8zgvgELYS2yKW+8ZRufRryA6NC6sYp5l9mM4KlQC8zSEMFoaQHoVl
	SH0QH6xVo3BHPcIj0lVMbIerrEl1nHr+iYsuJ8RGjJnWWQbhISDsVoL2fJy6V3urp0KBjJ8YBb6
	Ys8kLvA8mWkak+hQhE/EwEibrmDhRghkEw5NR4eUZAAqf87BwAF+VEnac12mmvNvBT6GWi1D3v9
	jfPH4410TfbzfPfNr9kRxVqLQI625GVXk4IWWpJP/Puxr9WPjCvqgeSFeCPBRDoW61wX6ZXqKbL
	KeYuQxVtoIHouyMdRNxcALyebLpJ9jxHvN/T
X-Google-Smtp-Source: AGHT+IH/i15/+svDVlzRmeCj49N+7fLYS0nSEMx6zNrdg8fMuOZRZIVmoIl+m7ZLFVdJmllqsHEC6Q==
X-Received: by 2002:a05:6512:3049:b0:545:3031:b4d7 with SMTP id 2adb3069b0e04-54838edda6fmr5696766e87.6.1740477308397;
        Tue, 25 Feb 2025 01:55:08 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:54:55 +0100
Subject: [PATCH v5 08/31] ARM: entry: Move trace entry to C function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-8-2f02313653e5@linaro.org>
References: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
In-Reply-To: <20250225-arm-generic-entry-v5-0-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015509_967381_F6ED29A9 
X-CRM114-Status: GOOD (  15.33  )
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
2.48.1


