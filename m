Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67509E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9gWcnGbM9p5D0ak7vJHUxszZShK1nQ9isvrX6RkWiI=; b=MZbwlCOF4wlRDOEyWl9DCUZR+B
	w2RhUGxlK8vBCUiPVWGT7/9fAejSTByUBkUXJ/Ti4OsYlBzhD8iRDzYHodp91X2V8bEvvKCCt5taq
	lXDbOZWGLqdguJDa6wpzPzw02SfqIMlRwWXQMdd0z1Zlfl6yHcit6qTRlxcDY4BR0/R3BBYZCvdd3
	Nm9VruoVJ9aTNUJlQFNzBrorhXbfXTQaoZgAThjA/J8q8zu4gbDsaRw6vZuK6ofJO2VsQV0fUOBEQ
	Nh8v3xB2azCM45H+7GYwCrKjMAIbnOs/UxnL+B1m/DdGklU0tZLlu/qTB3sdU3MtW3/Y9CjKXLlcE
	MvSxRIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6V6-00000004GnX-0Hgb;
	Tue, 07 Jan 2025 10:07:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV660-00000004AXz-05Hi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:42:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aabfb33aff8so2739369266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242914; x=1736847714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9gWcnGbM9p5D0ak7vJHUxszZShK1nQ9isvrX6RkWiI=;
        b=Y90REn3cIlEX+pvLYpmzVTkvbkc1fs5gzVi0rUf4gyBgMBrd7OsztuP1s7480tZshA
         lcG+d9zQwYX9uX7Bb3uIXCyhpv7AYm/a/qweX++LlaE4pST+1z3F2MkI02o/S7G4Rymx
         y4cIhI+5RLbS6Ic74LiqcuCjcJX2dBm+cdHo/CbI1dskG0HQ6uXkifd3+mF4gkl3DYVz
         q3ZtRG8I24ECBpJ0z5ef+E6wxsd5jhJvejZ4oDwb7sx6m4IPB7zjz2vqhcTVAgAM5Uyd
         d6tA9EvEC6/4lVWUYGPDEeHI6zPPJ11PYKWl1SHfpq01j6VGhLk/F5/DSMxR6QaOylo3
         7OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242914; x=1736847714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9gWcnGbM9p5D0ak7vJHUxszZShK1nQ9isvrX6RkWiI=;
        b=o2MFpRBmQVt06Sp4F1Q9AoDL976dRAsro4U+2v96qiOGQZPK8r3heIbsgm/SH2o1M4
         s0DJdzdN8GJzoVrSCk61x2A9OmndyL2ouUh8ymd6Gz2O8pat9lsHTre4f3MT24/FA33W
         SyFUgelBCBu32vkfUpNCKVnCgz3c4k+eOIYJ9I8dAo5uQFBN5zjBKsMhHRF/LvMEPc2m
         S0LQ1ZSheHyL3dU+HQkrAGabCh/x67Fbdppnqiqmn6hX6JNPi9a3zxipQwyHOlOqJ92g
         w4tTQnRA+ECcMVSq+7xTBhmBH6r/2MKOAh9914lLCh3Oa4DVGYncINzzVAixcYBg/pfU
         XQmg==
X-Gm-Message-State: AOJu0Yz6I4LVJlx4Iw7/OV+nHsMj+6al3Rf09okSiEOts4vTDabhuymy
	puOKaLQv+yLUVvAiMycHOD/Rt0ePlys+q86NhPrwNLfABryhpqXyt5+YmD2Nt2E=
X-Gm-Gg: ASbGncver4qqdFjIdxnHcimLEo0xZD/KtKexD6UomiIXbtVY0AQf2RBCX+K0OTmmvEY
	Ah6yGw5MQpMAcO+FLM+B0MbhVMH7zFxuYZIEENe9QPFn2lmp7mwmpdIB+Pt5YkPvG2fgGi61I6z
	04xJT+r2rqD5f/WN3kEJWo7/EVJxiQEol+01YKjvo2SvNU9KP51I54pnU7FPZOPqIDPAwiHOonN
	1sLEH+EYkEbGOnlE8HOTVhawKB+IJMaRzEtQ+M/iG6u/kPgoqp7UunlPXGvJA6iGkA=
X-Google-Smtp-Source: AGHT+IEHxw4mJqEFIqYXG/sglqgavssOFXM+rzspDasKvBGAFEnARnh+FvuNyCDWBSoQ/jKx1bXiCw==
X-Received: by 2002:a17:907:1b05:b0:a9a:6c41:50a8 with SMTP id a640c23a62f3a-ab2910990f2mr261206866b.17.1736242914486;
        Tue, 07 Jan 2025 01:41:54 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:54 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:37 +0100
Subject: [PATCH RFC v3 21/30] ARM: entry: Do not double-call exit functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-21-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014156_060384_0A70DA0F 
X-CRM114-Status: GOOD (  17.42  )
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
2.47.1


