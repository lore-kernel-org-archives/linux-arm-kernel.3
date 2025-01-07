Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FE3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMg93yBwVVTokRKyzFlWLmvMqpyEbrII8V8DSY/WZf4=; b=q6qT3XzCD719mtLZahc0+8ab1b
	Ab8fWIqW6DU9aJSsezIyYjczf4mhaYVqlcDny/CClpOaSzZKelY8LDIOzvCXTZwAaTBDTQLMQmzVs
	f8JhMosCgpVDl/u/p4eIXbV7FZKTB5aaCmGnJHDwiNal98rT9/OuAZuW8Q39cXW9UQCGqYOUqT+MQ
	//lCeOHNUPmuR9LY0iVag8M2zDvZap1VWKfFk8EbkMJYmEdamkQaKaSDmelSyYaIy3Pcf4R9kyULY
	TKhE+8y4d/QXQyHHvtVwVPGRbbftV27jMl1uk25bP+AMB+b9XXs2vERyqkGbdLu31exJe9ErP+PaN
	nFoq147w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6G4-00000004Dfh-2LPN;
	Tue, 07 Jan 2025 09:52:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65i-00000004ANX-0Hx0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:41 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaec111762bso2491393666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242896; x=1736847696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMg93yBwVVTokRKyzFlWLmvMqpyEbrII8V8DSY/WZf4=;
        b=lju2eRTCCCWpcKfLPYQ1gPWHCWoKH4s/Vnh38TxRrag6uLcHZhV2eBP3tG4J62R27J
         L6d1ffCKol/L3NnKW9yhpe0+5Rg6xvwYjhl6zT8yebWRxmgDi8UuNafDZF2RPhdfxdxz
         7Y9nj+Rpy0AWLBvFSp5mrkzROA7InN9e7v5sTEkZvScERcLFVIIrvJjoPtgXUB0zAbe1
         W1i3aa0K4ESqQgIk4K2BekB5/IlGjumpuo0BbPwAJwtcHiioCzhNvyyNfDpiXvf72+nI
         RsVxuZjm179pdrvoBH701m/ocz+o+t7hcXxWToaNvrXfPIccSWbTOJ10RZ9hMxAQI8iA
         LNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242896; x=1736847696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMg93yBwVVTokRKyzFlWLmvMqpyEbrII8V8DSY/WZf4=;
        b=dstRH/iDN5w433vWwVJ1Z7PxVFetjQes56poKpY/RlgynPJx5/3hNyGwYAG3tcA09N
         AYOjJeY5t0l6KWmQw/UZyUCqnClREesnFOkIMlyVR9XtC5XKwoWx9rMnovOu1JBorpCn
         quK3wTlFwwmamrvIBFvA2fxFh9mP1gjKjgDW4h/CaXjPjl1ARi+GHhYl5rrTA8D2d93+
         fqo2lwiBmjhILUcKE2IewEHrz5RzCfPY6wwrhOvOsNCvMoa+2Qxx1V5sXlNqsxO19vHo
         WsGc8+yUitGFXqF17a1btiDOKcH0sojJ+ve3luKcSJpi2f22YYXgQ0bl9Wb2EbT9Is3+
         juqA==
X-Gm-Message-State: AOJu0Yy2KY44580OaByRGAOy92uVEGNbw0tRxz2p6myhsIoKe3jMD45x
	eOsu1a+ncm61OAx9JfXrLW27fNta2tMkCE5dpjHzf5Mq8EvIjb+R+1e2isyN5Vw=
X-Gm-Gg: ASbGnctJof0zjINX0fc5TBPDGI0aiHAIk07hWEcwB1S3CoJ4wwkr+7KLAFTyhVNlq7+
	H/cD5ob87oVHnGBIiFdJsYiidMXbxm3cw6CPgg6cVXtDEGrqe41EBcrlpkp9fKpIqeRfK0lqMha
	ZIRdbLmm7oCc6EvgeW2sScNQ5ThCS7MJfbg5alr8d7dCapbxB9XS+2dW4YyKaFFHdYZ9MmssfIV
	g4yIgOqX8MYPBPqOtvWrVWpWCBTimoKYtoXnP40IM98ypppjzg+N5hAsEkusWcSnjc=
X-Google-Smtp-Source: AGHT+IGWBlZrGMzIZx/5MGyqW+jdyguusLjBOk7dr/oDrWgqG28clwNqww9qx9LhDjGwhVlgBeZiHg==
X-Received: by 2002:a17:907:7208:b0:aa5:43c4:da78 with SMTP id a640c23a62f3a-aac33685dfemr5301778966b.51.1736242896331;
        Tue, 07 Jan 2025 01:41:36 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:24 +0100
Subject: [PATCH RFC v3 08/30] ARM: entry: Move trace entry to C function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-8-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014138_109436_7DFE02E8 
X-CRM114-Status: GOOD (  15.17  )
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
2.47.1


