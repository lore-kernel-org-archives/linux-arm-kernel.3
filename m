Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0CBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=; b=ZWLY2QN0FZmHEjN3axejJrtjWG
	QghXRVkYurfDvONLj5usq/tFEDY9svQGf4sQjuHsqAWSL88bfvF06KvFs3t4YOemQbTInF256zCsY
	0IjgyKuctNUx5tqtl25h6BfFEwz2aKkuDBUS/oV2NaWq2x0eHj3ERyVr4s/oAlS9yHjl3LLoZApvw
	i+cJp99egBdrHyOklzjk9hw6wfu8yuRfYa2gX8Ls5ZRMrrZJb9ddDFIPGr15muhmltBD8yYx2qTPF
	0Cv9l0eXgcz5EE0nv3YaajLrMKPw3yL6EWoif0yPq2OeX0Wn1M+meWFlQZm+aqitvlFoOQMgqx+an
	2c6qqd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsNO-0000000Grsz-18xD;
	Tue, 25 Feb 2025 10:41:22 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrev-0000000GhlI-3pUz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:55:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5484fa1401cso1187358e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477324; x=1741082124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=;
        b=jQQUH2coHZJOElb/v/4RwhPiDlM4ahiJ4vU5JZ4m5E6qjmCiGq849UVPaokSaiZzJk
         B3JzUFE6vZ4EcEwtp51Az89OVVSAaGe8ZhTDNpOLLuuNbnGoeVOsKICNh51+dcDLlYiM
         wuO9Ov8K61uoevRbwbI6Zjbs7hd/SX+TdtdcdSCMjoiVklxDGddQXtmCuD/n+nqQAhzE
         yRvH5Zpq9s2WnmWsALBdaLjdchPGUB8DUgBqO63mRw/i6yu+YAfAQhNczZzBq+Lw7TX3
         7QqHnOy7x29Aa4L1FTffjWIwULspTiOP8qzsbkYyVW+r+ps3ZPqmeoKXlbhPfYpntX9f
         C3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477324; x=1741082124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFYj8M8sWUilipZ79moNvoJmNP0x1CtymAnRzXm2Cm0=;
        b=m/tatdHrSxkWAUlcBmDz/Dt9aJAUxl8HW9Mzy+5Q7HbShT4afoYTPmI/w1XY3PTJkQ
         1Id8ROmF+DrNqfViDv5AASKlInl7kNYtXkF3rVxXuns8QRotZPcJJ8Iju3P7NMuWhnh+
         1fRsbEJqHY1juxMz8MM58lSL1FdmQXcrI5qKftfPd1/1UQXOdLY8qZvyqL2OgcEXT4DG
         rcYTxuQjYuPmTqujnsqKF9TjmgM6eAd8qcRfI9WKNnm4xp+wSEIlX5ePm4MzIhjnyUb2
         LDMDqUTzKyKxkcNHvYa904dO61sKRyNrBwqKJ35X8NUXNJhqMW9rDCHKPmm4B6HfJ0cn
         u2aQ==
X-Gm-Message-State: AOJu0YzAsxwPbeMvBqDA98WxdqaCZpYR8EetvVAqp4ErE+N/9MGcCMw5
	w2+L+KyK1HylIiqs5TYsWhIpq+4tosVHeJynbqUFr/TTM5xK5zsRDJtrMMyf9mM=
X-Gm-Gg: ASbGncubm9bCId1SzGDoOUmmZ9wct1+OllMhQSd9hJWES4+kgFjE2fGKDpJmv6SdhZh
	w/G5ukygUPKN490Dux5ZNEKo4LTEPnRx6e4OmoEu5kg3bu92F7Z5W87ZgtEzQ03tBIqby0JrIiw
	v2Zw0SL8QyigBNeRsgFPn4VlXY54QA1L+MMWKk7zK9T8SGiVB2QMKOSmt5OG4/pBo6mNt3hRfJH
	Q/BQLg7LTXORfh29HPYS1lLQx71rYc12h/PjyM+ZUK5CciwCLLXvQ5cjCDD+LJ2Jw4dfInFXGPs
	KFK17cGAy1SJAlttR7WUIGw4PNdQinPLNpfw
X-Google-Smtp-Source: AGHT+IEXZnOHohV1r4Mfp6ZZX3DbBx2GvFu2h5njrZLMFHCmGZ4MEwYftDaVvCGo6wOkCls5ru72YA==
X-Received: by 2002:a05:6512:3e0d:b0:545:a89:4dc7 with SMTP id 2adb3069b0e04-54838f5ecf5mr6710865e87.52.1740477324315;
        Tue, 25 Feb 2025 01:55:24 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b261esm132867e87.24.2025.02.25.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:55:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 10:55:08 +0100
Subject: [PATCH v5 21/31] ARM: entry: Do not double-call exit functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-arm-generic-entry-v5-21-2f02313653e5@linaro.org>
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
X-CRM114-CacheID: sfid-20250225_015525_975494_18ABA99C 
X-CRM114-Status: GOOD (  17.57  )
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
2.48.1


