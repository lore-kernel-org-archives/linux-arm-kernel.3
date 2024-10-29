Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9FAD2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2OP9NgXP8OYjhdkePmH5sP15xkO/BVCD1VA0/cLgTg=; b=vzt0Jmctn+9o87mMJSR7yeQHeh
	Mmfjs3U4Y8c0pSTV8Ht4+eNJ+bnJRDvHNkjM3gvo3CPKkCGCJ/bFdOOkIdaLK7jNe6uA8MAkn7sgi
	raVCmhWlvBuKDcwdnsqTpKV8uZjS2m+NfDZIA6bpfc0rhlSHhaZ9ol3sMyi32QosZZSuOYQZ/09ra
	o4/TpKZy+igw9iHWlcLr8AswHBxN5WHF31gzreywot15OuQqNIbxEi7Bsn1DHk2lPF1kk1BepSVOi
	KD3IUPNyJ5PJ6RhOO02CSWgGEq7B2qYF3yB2io3uXwzSwdBOL27Y7KUJTreiYR2Xw/s10ak4wyMOC
	Iw0hawnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kbo-0000000EGQi-2SLm;
	Tue, 29 Oct 2024 11:42:00 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jqo-0000000E7ST-0USk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:53:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so6476625e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730199205; x=1730804005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2OP9NgXP8OYjhdkePmH5sP15xkO/BVCD1VA0/cLgTg=;
        b=P/LqQ+HCejdyGCc4GFCd4AQHRNECb5e1drua/aC1fGD4GvDOjT85FkJsieaE35PoIF
         R6fnr6ItNRP+7UXX7Co1JPb+Et9K0fNg6NSQh3IRtbW/Ok30cnaoenT15Al5bt4rgolA
         sPeJLNpGaKh0wXKMYtoFaW2f4z8kQ0b94VOg5a6xf4SEzatSrXJR4IZsUVJzwfpNayjG
         Ny+r+/KbrdFlGjFdIfmpybCSrPuWmjkC/ttD1eeV02psuNGBvWaF6YTnRcf2ix82A9kE
         VBF9uOxUyQIchtHVf3gvVnBA0Ldb8V3bglTWrtutNh0LPXGmvkYPcpE3ugdRBzCbiyPm
         YEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730199205; x=1730804005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2OP9NgXP8OYjhdkePmH5sP15xkO/BVCD1VA0/cLgTg=;
        b=ZIOsY9wbBbB6EAr4gEu5kWmoL7eWdeHnSEXcK6et26pFTSPanVfh+RWmmhwJAZPC2T
         0I1dBKbJSmapslFebqCcZUyhZPVbUesq+2V3DsAnCZ4d/JzcTWj1IjHZn2wbVKDUKEUs
         +s55BFw/9G4SgaWfA3ip0/tM/MgdBEDM/H0GMufggIszokcBGoxF40ojaiqe47Pfp5i6
         WvTI87nxO8fR3aggczEAJcfWPTvdQPHDO5md8skU7SYfFwUiA0sxNld8VrHWguUvEziQ
         nAsxJNpa+H3LHKdgTdPfwTbiB8l+1ZUf/6YDHwo6PikXyTdX2+M464/xVgbXZH3WD97y
         ABNA==
X-Gm-Message-State: AOJu0YxpELe2Qb8IEPjdIADCx16Whn+vJYIvwQMlaLCCSMg4oLehOH0Y
	Qf0leAlk5Q6BVdoADNY+dtDZxoDPZcwum17x209s1AciV8IJPlgNo/X3niJvdJ9igI+pcI8CarE
	N
X-Google-Smtp-Source: AGHT+IFllmxwh7EKDe/a3WvQfs+EHBA3khsZLhUnL3Z+I/JP6m6A/TkF2H92CKvNJpKEWjTk3WNgUA==
X-Received: by 2002:a05:6512:4022:b0:539:fbfd:fc74 with SMTP id 2adb3069b0e04-53b3491cccdmr5480123e87.40.1730199204557;
        Tue, 29 Oct 2024 03:53:24 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm1351307e87.73.2024.10.29.03.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:53:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:53:01 +0100
Subject: [PATCH RFC v2 21/28] ARM: entry: Do not double-call exit functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-arm-generic-entry-v2-21-573519abef38@linaro.org>
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
X-CRM114-CacheID: sfid-20241029_035326_248571_4EB14396 
X-CRM114-Status: GOOD (  17.51  )
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
index ece921571714..33bc9e7c5b32 100644
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
2.46.2


