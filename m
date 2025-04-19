Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C563C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzY2xOh4ktNlX/Hf1UnvL25R4SqMvTbsJsIcKtlm9vA=; b=bURewL835vNxFy7vznAZmVF25T
	0zRsVS9cOPDGB7+/RYCklPID+4AFcPh/x7P1hKDhCgeGTeiuLuuCN3WxCK1XFycJT2VyVI9MkmJFn
	DdB65zCjsvl2jx6Bh3ShRIdlNkStg0jcN4EJX+7BRpGwpLai/FQTC0DKGfslzyEKF0AixFYZKXzEm
	EG9cjAQmp/FdEzId7RaM9eCUVrfSOoE7RRssS9AUkNfAA9HJOs/96wM2I7YIS2ILDeVPJ2ppW5ItO
	yRrdatOMkeJabF/HRxPnoqYwNVLbZ9lCjmvMzRBns7hwVQyJXnb5proBpPeNalTHhpBeG8JN+sWLv
	icdeYFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6GuW-00000001uFQ-2P68;
	Sat, 19 Apr 2025 22:43:44 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Gn4-00000001sgr-1rhj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 22:36:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so3101508e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 15:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102160; x=1745706960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzY2xOh4ktNlX/Hf1UnvL25R4SqMvTbsJsIcKtlm9vA=;
        b=orh6UHGswfoXwFWu6EocA7FdlA5dtWPyUo7CZE8D2DoOQvlbC2UbyCxQuV3iXj7sbd
         /Sby6k+TuVDMDF0agNyGhd7qJuijZ58fkT+iobHX9NbUcQDYVgDfLSmPW4gYP9Hfxrxe
         tUZwhYz331tgTyzF+qJlBPcs6GwppE74rR3aqBzT0h2kfaIlrL9aztcDTUnhjeSwIlos
         L9nNQUJY/R1nlk19BzyZy6lNwsl+TdYzeHroergyt3lGaBxWUqPnDixzzsrmwPdGw0rO
         Xo0c9Wy6eB3n5GIWwLbuOIY4N7nXT3b5rKTOwJBal2y1DgyVRvQb8o8xiibcEttkc9z+
         wlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102160; x=1745706960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzY2xOh4ktNlX/Hf1UnvL25R4SqMvTbsJsIcKtlm9vA=;
        b=YkOhiRIYfDBqC3vdNaycj5L6NIt1K20vEQOAWs1p1Tn445cEb9NNLEQbYe/Ma8C2Er
         YusTK2XS2+4tbPrO/UsP0w1UCx1FdWu8rNsnDfzkeNm/B4N3B9aQpGkJQUBbfgRKl1vx
         8EUQE07OB2Z2NyLwaKevFgtL4TseJoYf12gq9cQ4JJMSopIa/V2eysIpXcII+nCK6qxm
         bTqB4bX1jtJeIxaWFknYPjINrki7RXOuziX8fSeJzYUSBMf7La7MUCI1ptP8xzZRgk72
         wHQkZwpsNTORqNMJkQaKqPRZgyZKJehFV0pKxvA9WtW4ZJdbpqNZVweX19TtvtVqij43
         oGmw==
X-Gm-Message-State: AOJu0YwQ+guvRWstuM3Qm1bufIJ8yN6DYy/N8M3KSN1JA6yJJX/ewtWZ
	+UObNKRaqeZPmDSjEZfZgE9TvcWiO9qHltZHlDbS2Gut96lcBOvvxBgC3bh3Clc=
X-Gm-Gg: ASbGncto0muEdM/4CU5z6Scl3PFCARdCjt6dV3tTnO3nNIajVs1ib2nYMOqHjlLIQg+
	RFYjvXhuYTYK4xoNN73cQkoj7fZxBGwpgwtBf29TK7qRRKoU2gNEA5FIR269zhabR3nRfS8O1Sc
	keuuUw2y4w23e4BaOgLaSlR3sZKtjV42aewT91pQ4qGX/3HA++7dhhSBGWkLVUyTfMZ9G7a73PY
	7IN6RZ2n1mLDwwK8qGks+cLEH9Jw9dDKLuTYes4dEypwZkdM8YoZOmGLDi0APFRNCN6pQyhuguS
	w/vL4gN+01GE19bfjygSxmoc4/6kWcqNeEKOxxjqWdbBKQpIsYM=
X-Google-Smtp-Source: AGHT+IFH9xGcTNIlSs+IadMVQj6+iIYdg0THeCQHNZBemp4bp++lCg0nA15nRYVihEO1x52fF5YrhA==
X-Received: by 2002:a05:6512:318b:b0:54a:f757:f8ac with SMTP id 2adb3069b0e04-54d6e61c168mr1950777e87.8.1745102160571;
        Sat, 19 Apr 2025 15:36:00 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:50 +0200
Subject: [PATCH v6 03/31] ARM: entry: Skip ret_slow_syscall label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-3-95f1fcdfeeb2@linaro.org>
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
X-CRM114-CacheID: sfid-20250419_153602_489108_7BE6C3DB 
X-CRM114-Status: GOOD (  11.73  )
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

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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
2.49.0


