Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16886C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=; b=fE2gG47A1+QlIQ6ItDfsdSqU1R
	bFfzoxyuz7zR6iVLQGjb3gbKpUl5wazBOJQURyGliSlgMbfg+gamdFwsp7cie12xarQ3OeOAUGJcS
	0v9UFGVJ+DJQOY04bI3EAsfwwCmi80RzwGqY659R/2wCoxP8ojBzJaGes0rWu4lZYufqWAKXkf/UW
	ndRF6iOjKkI6trYoi9d+ffJYl1okl2rywtQzhbhJ1SbDSidNi9ineMiCzrH/XTtVF3Jbugwvj8XrY
	MvHo5Jqzzi3VDnUn+MmNDp+2ySxs9kKGe4iAZJhVrHPsV5jsvOfo+8LKG0i3sOiC+HKe4VQJBWPDo
	2DteZeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAuU-00000007AvU-01r7;
	Wed, 12 Feb 2025 11:28:06 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiApj-000000079bT-1Zlj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:23:12 +0000
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-308ec50eb3dso33312341fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739359389; x=1739964189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=;
        b=d8Th23ZBKl9TkYOW3Yd23Q/YJaJne8iXzauoDJlrXqSwpFxp0L5gGZHOga6hx0Vkdo
         YxMAx1mcJaXb/D8JV3uakKV4AAsy8rZbp8M+JHYCLOWKa3qiDvEkpdDTRgfHdKjtGL+w
         mFeSlGaCTZtkkrEkNKvyR0ODVcKMXdbLpxLA9jol4zCaCGrh2ToWEfG9O7m7jL9hibz1
         XZ1aITNSpuoqqmSVFE5CcojAjRnSPcYV6pAUTJvu/+ceibKepUMo03LMn2NFi+NZAVDy
         LaIJoYaQ/4rC6MvmEY0hg6kkoaXlm9AXY4CbOseXIYyXkjMq5JZn9gdzd8fcyK4FGdso
         rpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359389; x=1739964189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5mhd6DszF79mgTOhWslIzEoODnT/4x94Ab5tm+ZGKw=;
        b=v4Wd4x01J6VUp6uylPKNAjtbtnX9CHGCyxaojPLPOnGBfY4v/+HQkn9TgeP5RFuXad
         2hXsJZRAloM3kWjcWfSSV4vaep3a4A5Wu4prklY6/Y6hrCOfn7m3g4vGAmZHco31q0x2
         TSV55OMsqAmWCA58PHcv7zSBANqEETpdD0ti230mqbmUmQW0k6MKk4a/TRvZizJHgWX+
         ysptvRiIO2GVYRD/dTwfecxbJw5wDhkWmw+glyLS4oqM0zGOZXr2P4I10GEhUcWdyBMl
         /BOZDwnSYyxaPoNRxyRwJpCY3VAf4wBz1+lqKGb23eKBCrH8VsWuULzzMQGBjIMxkSRR
         +yiQ==
X-Gm-Message-State: AOJu0Yy+hfsKKjkS2ch4vYGQYRtWyJY9Z5dMTRmr8F/6a9FzDdhFCtsu
	eLiJRkDhwr/7UxrAMmnBK3QtEpYDXjuzez0rOLM9iKgIQ7q2prwMZNKu3tuAaFo=
X-Gm-Gg: ASbGncv/Ptwg9TX5mEDRFkMVZoHY550bFWp5MeJhnNezWYP3lvy6/lDJun7NFCaxoIV
	C6qAEKA2Hv/V0kuNnNY8gt66Zzona769nOd341539sywsgOH+M/7NGpB7dMHd8KrxP3AWtYwrt+
	KXHiUR9GA35+j1fkxRCf2iZWKD3T4o9GIp4HpIM7eNdKVek0KcX7peXyumYPbndmwTknQegWx2R
	TNnRfH6gpAT+tH4xxKLMv+t+3TnlYJM6tZ/8Ofo7W4Ptu5icVQq7QDe5Um0YukCsGSkRrsCVmC7
	4n15QGMV4Dxtlyv+8lU3sgJUeA==
X-Google-Smtp-Source: AGHT+IHTMqYXojqkTP6hLJE6s2yoQfyjlXS0zVkP4hZmvDjU6HV8U27+O3ADPsPzDGK4vKbkksnjiQ==
X-Received: by 2002:a05:651c:19aa:b0:308:ffa1:88f8 with SMTP id 38308e7fff4ca-309036d733cmr10944651fa.23.1739359388991;
        Wed, 12 Feb 2025 03:23:08 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a6531sm18310511fa.45.2025.02.12.03.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:23:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 12:22:57 +0100
Subject: [PATCH v4 03/31] ARM: entry: Skip ret_slow_syscall label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-arm-generic-entry-v4-3-a457ff0a61d6@linaro.org>
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
X-CRM114-CacheID: sfid-20250212_032311_416132_82C8DC48 
X-CRM114-Status: GOOD (  11.03  )
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

Don't introduce this extra label anymore now that we have
a clearly defined entry point for ret_to_user.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f379c852dcb72fa5e960bba5621cc2152f0df0d3..2f93c2f6d5b8fdf6aaf3dda0192bde144fcf238d 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -102,7 +102,6 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-ret_slow_syscall:
 #if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
@@ -136,7 +135,7 @@ ENTRY(ret_from_fork)
 	badrne	lr, 1f
 	retne	r5
 1:	get_thread_info tsk
-	b	ret_slow_syscall
+	b	ret_to_user
 ENDPROC(ret_from_fork)
 
 /*=============================================================================
@@ -310,13 +309,13 @@ __sys_trace_return_nosave:
 	enable_irq_notrace
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 __sys_trace_return:
 	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0

-- 
2.48.1


