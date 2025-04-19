Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B27C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq3qR1Ach5OqeKvTWWzJNPs8Dto2cBMzy0K+AAmOlZ8=; b=HgNoeEMVpLAbtlJq8pbTXP5q2k
	ZQX+Fzuc2zpeh1AGfdVBEAORA2S4CwwZETXCjgheJimXqLIBy83OJNRRXm3FRptDJnImpiKSXzil+
	mPVI4etQhfqnEjYNWXoh2ttQjgvHKB1BgDc2Vaq0Fymm8G8thONNbdJSJLlyLPlJZ0Qgd/OM6rwgO
	ZjnCBo2I54lzw/KrEzcOznx38bUUkGXNKGxOkARGSGx30yFWFhk7Gs+jdI5Q39in9tGIyaULMalBE
	XvV6MVO4KjxL5rdc5/IZaprxpEFEI5W6vzd55aKMY/Ia6YBxz06p2BV8aAsDz9c8ExhzUDzbKcjUp
	373OFN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6HS1-00000001wl3-0AX3;
	Sat, 19 Apr 2025 23:18:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GnS-00000001srE-0LdC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:27 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54998f865b8so2880043e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102184; x=1745706984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq3qR1Ach5OqeKvTWWzJNPs8Dto2cBMzy0K+AAmOlZ8=;
        b=WQx7lM5UdgjBhZsvx2q+2q4zFv4Wg95e9ouxlY94075cALo/LNvAOvZopTfCF8VLeS
         yDmgqdpj51UR/RML3m8VDXRCjdbZheaQCd17D6tlWzIN4fYYdlecEJ0XjSU0v4ghUjvh
         qdPqThYc5KIYUrkrgNzUUbBua60gpz0it7V0sq0PuqaU67FulZlVQyXW0NM+hCFvtXnG
         Vzgibbx5j1+7zSPvFbrIOKDBJs9z6WWHhI/QClrYJeMhd3YNBPEseYZm85aQH0/jMqZw
         EuMmtS/5vIj+DRhVcHy7WmMIi2P4VVa2t24u/PSwzKE7A/Q5OL9c/zTiiL9c3pkinSCW
         KEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102184; x=1745706984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq3qR1Ach5OqeKvTWWzJNPs8Dto2cBMzy0K+AAmOlZ8=;
        b=DMjNYpcx7TGTOhUwIuVDmANq8VE0QDkIALMxctal9GOx0lZHMlJeRgP5hCRP52h5+n
         L31bvOreHw6Go22M6Ku5UkulUJQQTgHaD8bvtyJTWlZVO2DaGF/GnaxwV8UNo7OrCNyq
         4wQ7HQSEN8juNFhMOXD6jDc3rq/zgro/S8Aci2x3PbPPZzqRf+dDvwBEdxMVTzDwjJWD
         LLuVdNkZurh8uEl1nBFTzubAhHMFsX+W7piqUmjHwrcpd0PRyvD2KKIS+8csYW9DkCad
         IuTkp1EAVfEpsawb0y4ZOU8NxHlZGcZMH29SIKCtZFjTX03FFf2vZci7gUGVkF+goCki
         PbGA==
X-Gm-Message-State: AOJu0YwZoFoFkaGqRprHrAZfiGtzL5DQencK+nt9eA7hf38QBknzDeKM
	tcKFvLBRIHwnzZN8gWMf7l16IdMdEjFF7NzvXlLkNLo8m8By35FK150NYwDoLgU=
X-Gm-Gg: ASbGnctjx68SkFn4TCfJg2CIgDfT4QJqZESLnewrdl8EYNIE0zDXwyX9caENeW7tVIn
	W7bjV6nMh7CDTaxecRnDdh1y+oGi1LkZge4dZ5tXZR+PsxPsC7KWSXAZxbSpzNnCD4VLwP7kX67
	aOTatO4UZ4GIW2RX4Nu8I2FMb8g+U/Tx/BDsHwMo/xJVYMh2EsZbLcRI33HiumSSQoGn4jnmaj3
	UqCUh82vJArkHnSZvXL6RZgW5MzC8mI4qWcMneq/xPF3Nv3Jg3nEyy5cKejKb5raKbwBhGsPiBZ
	HXp6Uql9nVXjbTSpEZNwucvYB1FHUvxDPzPGQAv7t+0x1MMOkdU=
X-Google-Smtp-Source: AGHT+IFNvDhheUhAKpDcu0lfhPrHRPwqRw7FFmLwPqgAooC3jEkoxPnI3ZkuWls+okhqWh9k8jmbkA==
X-Received: by 2002:a05:6512:1309:b0:545:5d:a5ea with SMTP id 2adb3069b0e04-54d6e619700mr2291214e87.3.1745102184594;
        Sat, 19 Apr 2025 15:36:24 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:08 +0200
Subject: [PATCH v6 21/31] ARM: entry: Do not double-call exit functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-21-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153626_129271_3B75CD3C 
X-CRM114-Status: GOOD (  18.31  )
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

This is a semantic change to ret_fast_syscall: if there is no
work pending the function used to jump to ret_to_user, instead
we proceed to return from the syscall.

If we jump to ret_to_user, IRQs are enabled and we call
syscall_exit_to_user_mode a second time; at this point a
this just means a second call to rseq_syscall(), but it
seems wrong and we want syscall_exit_to_user_mode to be called
exactly once.

Apparently the ARM kernel has under some circumstances called
rseq_syscall() twice on the exit to userspace without side effects.

ret_to_user also checks for pending work a second time under
ret_to_user_from_irq, but this isn't even needed any more on
the fast return path: this was needed because the syscall
invocation enabled interrupts when doing syscall tracing, and
all tracing invocation has been moved over to C in earlier
patches.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index ece9215717143427de7572a18a6dbe620a9193e9..33bc9e7c5b32f62474724f1d47f97af24dba53bf 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -49,7 +49,7 @@ ret_fast_syscall:
 	tst	r1, #_TIF_SYSCALL_WORK
 	beq	1f
 
-	b	ret_to_user
+	b	2f
 
 1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending

-- 
2.49.0


