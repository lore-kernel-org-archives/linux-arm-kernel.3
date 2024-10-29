Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6AD2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kAN7grhcUpbCDFoKucfYZVBg7IClr2vppXay/MPoLQ=; b=hYuw2HeAAQXRYLKMU+qu/0B12f
	3MDQ/Ew1Im6cDI1J8bTeTOy3r8FkFsVafoKybNOF34VEQPM+93SOqsfsVVMqqHO3C4LVJfrpPv30Q
	NHyEPNIN5iAaCXv5yVMlUpGPfM+f5SZYpJ7mAGdx6nU9w11VM4SRDNaoG7fG35TNb6u/+Nd/AfyF5
	L9n5bQT9iyU0ElkrQ/pAi0+6Ss/vhLHJ3DfoJjGXW1fIDuXCuw5w+n5wdta/cEoAQkWrJpKUYl3tl
	NeCujAnCLebRDrWRBjoiuu90JreTmfR/ce4zlSRUqt4Yvhbgs2zjwM/iIjzPe89UCtWZ0OaUrkIgo
	ShPKvEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kGq-0000000EDcg-1y3Q;
	Tue, 29 Oct 2024 11:20:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqP-0000000E7Hp-3Zzh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so56722481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199180; x=1730803980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kAN7grhcUpbCDFoKucfYZVBg7IClr2vppXay/MPoLQ=;
        b=zEPZpwrAoEIdW7rjRu57gRW1GFTO56dsWoVWIwlhQgUySkM20SffmIH8r0HdM/umbw
         hNAKs6RZz+pnhc+Su4t/MnZCKIhgcosKNonOD0oEmqVdGg5I60AikaGl0TeYs0Rjra2z
         ISSpqRcFbMl6B4jy+dA3015jWdY0wOmxiPlwMv/JQN90N/Pq9yVDmcAL8C/xIqDOK6jO
         B/xl5UCAJti7Z0rFvT6h1J1MXFXAoDfWryK9nTbV7gDpJnxw+7ZCO393FTb6YyFrS2pS
         hTw29JZUBzKoEpLPLl+80rgIlUsQndNrm9kNEPYBgCrDW0WRXQeBtl4RjZQ4mXGnHjBF
         ogjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199180; x=1730803980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kAN7grhcUpbCDFoKucfYZVBg7IClr2vppXay/MPoLQ=;
        b=I3Xsn1DbXrliSuCVRoqQq8OS9JtdwLX7XH0IGo0f67rWWffMUnwajccry8i95kkKpT
         cvCTs+bR15wUy1daSdh1hoDxHT6MXmLZNXXvUt2byGF7bSUwQibv2b4BgeIjfBqaMcF6
         c7hC3OxthChjxYTLtdGjnu5c2KykNsPpLxje8iZctyP/Zq4DcctqyTH4sVDkqHbEEnpi
         j1KgFmecxrHuVC/VZkuPfTOXS4xA8Q5nRWzdhRauQsc9lps+6zo8EG30EQsa91wKbork
         zZk+7ZD4w+aEe1A/QErCe/FY9In0CLXNgjj7jSOI85o3LogxYAl37x4+dZ6+X8SInIFl
         Yf7Q==
X-Gm-Message-State: AOJu0Yw/phFX2A+ODozVkGT6tvyRLNq1qLj7WIaSL7I34Df+XSmAl6Bx
	DdA0g1TlQRS0Cr8rRPmGAGQkZ0KAKHaFD0QM7imwm8mhnZCoBw7MYPlTiCUtS74=
X-Google-Smtp-Source: AGHT+IE+BAtVqBrWdYhrt5vvhzxjJUA1tOK/oyMlifKXwIMsOAQXf/e2P1Qd8xMaKhzFGR4sJKMkaA==
X-Received: by 2002:a05:6512:4012:b0:539:e263:331c with SMTP id 2adb3069b0e04-53b4944ffd6mr614860e87.17.1730199180265;
        Tue, 29 Oct 2024 03:53:00 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:52:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:52:48 +0100
Subject: [PATCH RFC v2 08/28] ARM: entry: Move trace entry to C function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-8-573519abef38@linaro.org>
References: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
In-Reply-To: <20241029-arm-generic-entry-v2-0-573519abef38@linaro.org>
To: Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_035302_041455_AE97FF78 
X-CRM114-Status: GOOD (  15.29  )
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
index 1d21f26ecf51..66067d165ba3 100644
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
index 77801d039b5f..3cfc6d952ff9 100644
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
index d1259c6d2805..815312f7b254 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -19,8 +19,11 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp)
 {
+	int scno;
+
+	scno = syscall_trace_enter(regs);
 	if (scno == -1)
 		return -1;
 

-- 
2.46.2


