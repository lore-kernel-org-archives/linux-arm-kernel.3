Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95876C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=; b=e5qH0sgYHuDYpdRvce6NE6sZ+j
	loQ1ZuXpgqah0YfixhHvh1rRhCYc/mchxqA0EIh49vZJPVLJQ+EqZt4UfilakYrfcOY6zU7yASjn2
	CeH9d+3O/fMUXGyF2+sYX/f/OP/XT5gRD8ubyAjlcOGMRkkRV4Oxq+bafh7vMwq5qRmcnS0AN6clb
	Xp/F5suLRMU3vlnkRG0wccoOn/kiT9uNBKteUF8yKfFh3sh8UIYjrIEpHNXhstwbkjr/hETIrSdHQ
	+Mszuk9Hi2i36Enn3NgtPj29JdDCfv+JvQx67BkOmvJBCUz2kpeOZOA5YDQLxH28dkMrsAppOBDhF
	siDdyQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB2v-00000007Czt-2kgn;
	Wed, 12 Feb 2025 11:36:49 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApo-000000079dE-3NJb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:17 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30737db1ab1so61503211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359394; x=1739964194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=;
        b=se0Q7+u4cVQiBRIPHrb5UQ7EfvU7IMz0eLYvWAHJCxqzPtsXUwllvzOMloJimeXT5A
         i71oGDUet26z/YWDkvJkgd5WWTuz8wHovDPrc4Vrj//6UdefUh5TeNMXxG8Mztcfr1FD
         pSvpp4n2M1rdNSOLH7+MFUmJkLRRIZpIAthI3TrOmuloNhrzO5bkUFyHvW8I2eL/Vd32
         Iz3GEAVePIlaDG9Hp2J4uInKIE8Y7Dn7sd2+QoFBghPxnnFsyCVVWyZz2HsTc/RGiXL8
         8VHbRhhyF6XtmdlhBrKEuyOG+khSgyE4kYvsxVVLbLMSfI+N3n6lC4etd4WV8OzD6xwd
         yf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359394; x=1739964194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCv9qyhC7Wn0x41/PmaNXNh/X9H9ffqS+9z2MGX0UwA=;
        b=DLnickrrHEt13r0Ei6Z1b0Xiyb/yAXJNqMmclZPjCELoHfFM7ay9xR2Q0pyAagBlYo
         WtfzKhaYTVxQWny5HD7QxV1NwjMJSaWml2zvPYcXrWGduwOo/m+US8PFBgFQNhyIDhxU
         +nxULRaSoMgiC2CDon/TdEQ4iPZDbNnvG2TM0PZKJF9827dFQ+belCMo/Ip7LS3TXp50
         84Pg9T2NQHTPi5vaNWVa5dLg8kXNu1kjQeRBKtQjG6hLYHJd2cRrM7hkNf7RpGyGUYXn
         1RdbsaJAtK/TLGUUgpfPrzd5frwgWBJAC1tvFSDa/ti8UIPuZu4f5+DylDY337/tpOgP
         rsIA==
X-Gm-Message-State: AOJu0YyXcR+C+9ZUprhjiQ1wnZ0kEVdvzU2clqlUy/pb8TGHVTyQfaXf
	TEPBh4KG1WsG+2Tt3cEcNFQRuGkXnPt5teKxz39ULVeRHefVpJaJGE9GUqS1xlkY5NUhzMOQeYH
	z
X-Gm-Gg: ASbGncve2/02cnmaxsOrObkkxmKfwiVV2OnSuAproo19WXGYtTDmzkEDmS3PmrblAnH
	sTp1R8JXKbYuYhjKNC5/tmw2oQLAJxW9DmaXhFlbdR/LXYoXBYcdqfCPloO0dQ3fX2jm2GITjhK
	95Qf/KRwE8ZSzDWsNZFZtdOnAxzBI5IoHPuJTKftId7eii7d6Lw8zvspR5HwDMEnNXZceyrYnBN
	6YUv72Y4aPSD44KW/fJoen6Z3rUbZThEZSrK2lpRvKt7EKzymmWtNtMdZA29iabAUDiaL54K37T
	wxXqK96MYQvsNPC/2FxIceDkSg==
X-Google-Smtp-Source: AGHT+IFfP7os8MQ1u1YZSNkqYKfZSgb/vW3ksTMdEyemTkz16qCj36YkFgGny3jWjjj/tutrgWjYQw==
X-Received: by 2002:a05:651c:19aa:b0:302:3534:1d68 with SMTP id 38308e7fff4ca-309037abe6fmr8480831fa.4.1739359394471;
        Wed, 12 Feb 2025 03:23:14 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:23:02 +0100
Subject: [PATCH v4 08/31] ARM: entry: Move trace entry to C function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-8-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032316_852210_1748B6F7 
X-CRM114-Status: GOOD (  15.27  )
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


