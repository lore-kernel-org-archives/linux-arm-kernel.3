Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4A5E63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2RT5jnzXsR27IYjmO1J2u0D5FIBNDGHaUBVullIGaQ=; b=DbE6WZwAUH0UDYk305tBYnusLV
	e0T+B6q87ZdKau4HRuEca8s9W063pu2IPMtGSVkxL1o/IWSh0v+T+caBtwmVvGvrM9xxw+gr/KvZu
	QSLnYBcsgkjpak0HnTsqg34AKEZFUARN6eC+rO+2CVVkd5/yr+NKu3TA5l4QFAFYhBcMOhaXZi53p
	z6xJHv1d/gYmtX54UHelUBeQJtiYbwK25KqLd8rvTve+NRoH5VnCHoI19533q4TXkUxcFDEvpkvlS
	BKlBV6sVBr3CZPAKOlSb6QCQAgFHlCwWCCTrr3h/7/82/99f1QqiU1hw9/1lksed5yvYJTgVHsnab
	rw5r/ARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Ad-0000000BJzU-1EXu;
	Sun, 25 Jan 2026 16:41:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Aa-0000000BJyu-1m3W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so28576225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359260; x=1769964060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2RT5jnzXsR27IYjmO1J2u0D5FIBNDGHaUBVullIGaQ=;
        b=UC58NjOdI9k9Kk01ZdrI6aNVTpo7Lk6Sh4h1166UhJCo3IsRGmUUBIbf5nYhVqEmtD
         vXj5QpVjdNoTMcgvISxJrmKidSMM+exaIMMhi/uEx+JVoDOBRxRzMi0Sal8SG6CPw5Wg
         BApQX1NsFJv5GM8LDqRxjQ+EILdaI6e/QE5Nm2bPdfQcXLIv/DEFOaUpyrMtX6JS9Qzi
         GVTmj9ReLbteC157pY5RxIT0sB8KBCvk+6fUUlw32ZhjOt/6lZKoJDJimBlt5HmTiU3H
         NZgoVjTM+LiQhl8Q+qym+PnrzqLxB/r4TFKt5G2wIioMIBsXLNWGleQXesmhRvMyAg6F
         fu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359260; x=1769964060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2RT5jnzXsR27IYjmO1J2u0D5FIBNDGHaUBVullIGaQ=;
        b=JN3lUJ+9+RExSaVGowY/Qu3oxgBjPrVXZHP5n35ZkwZCaTdK8VZQWy/wRCxUeVBEUD
         XQPIzRejCNs3FOyh+IbpYgvceHFw6w19eM7RKdr8DHgG7z6DI/PaJgEFFcuvgpEYr+xI
         vQmkKrF8U8Bzjpg0Es+1nhiSCXEn3SKeXnX49bwyC6laKLd4BvOCUHjrE6xsJ69o6Pvt
         GTWlHnY7RDjjkzZs38G+m4MNtLad4TGhw5H6qwHp0vThVktJ+1YlX6YbB/7YdGAXbv+C
         KzwV5Y6liHjZOHbeqi/jy4S1so/ypZhZJq6H8uyDeECs+9rBiLJaOOpmtrNSOgPpbQhW
         0MnA==
X-Gm-Message-State: AOJu0Yxh+5+f27gPF++XRvLG/GxmLJSgIFd4tY4Zo5BL/ZBruZi8SmG+
	GMbYPCa+5FcXB/Wp2olZbKe2lPoM65HtaxTmgikE3+rc2ifdVQNOVgWM
X-Gm-Gg: AZuq6aIskk8bgjqWo9nC1KuAif4E69M58OU9gTzvIEHKRx18UKhwqNxBgsZTNuhPRWC
	p7bS877WdJsir5OWAoVvbgDYpWo1U76gEtkizHrwh+viLkvpxklHHW+HHHa1D8+m5QP6i8Uo7XZ
	CVpNLeHGfrRlGaTPnmu8JkI938wSqWM2S+izjRbbSB/V+UQdCAOSdrVOpPpzqPmvG7oPKlxSO/L
	zorKHnm2+Yj2z4ovQSPrrcMuxBdPcs+/W+CFQcPQp5KVz6EpZW2e2wjQhpHVrkncbaPLApSc/Zr
	kSDQ6FD0qMjixCZRq3Q7P+uK3vyLDzXZ2nYOkJUwuQzQ+uunwU3Ck7RvX0G9G/SEVkfEhMP0DVy
	U6WhNsZqKzsvZI//MFzMFBvunldlovFxnDCT3p0hWStqqod2HOWdv0Bn21w+sJHgWi/OzlS82L3
	IAC3nj/5FZZja84TFu1izpC1/kmwqWwYw=
X-Received: by 2002:a17:902:ef48:b0:2a7:afb2:ce1c with SMTP id d9443c01a7336-2a8453580d3mr16824805ad.61.1769359259546;
        Sun, 25 Jan 2026 08:40:59 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:40:59 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 2/9] ARM: entry: remove macros ct_user_enter() and ct_user_exit()
Date: Mon, 26 Jan 2026 00:40:09 +0800
Message-ID: <20260125164016.331257-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084100_472653_5EEDAB70 
X-CRM114-Status: GOOD (  11.64  )
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

The macros ct_user_enter and ct_user_exit have only three calling points,
and the 'save' argument is always 0.

Expand the calling and delete the macros.

Preparing for subsequent commits, nothing changes on vmlinux.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry-armv.S   |  4 +++-
 arch/arm/kernel/entry-common.S |  8 ++++++--
 arch/arm/kernel/entry-header.S | 28 ----------------------------
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index ef6a657c8d13..7f8781666a44 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -406,7 +406,9 @@ ENDPROC(__fiq_abt)
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_off
 #endif
-	ct_user_exit save = 0
+#ifdef CONFIG_CONTEXT_TRACKING_USER
+	bl	user_exit_callable
+#endif
 	.endif
 	.endm
 
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..f579770fab71 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -117,7 +117,9 @@ ENTRY(ret_to_user_from_irq)
 no_work_pending:
 	asm_trace_hardirqs_on save = 0
 
-	ct_user_enter save = 0
+#ifdef CONFIG_CONTEXT_TRACKING_USER
+	bl	user_enter_callable
+#endif
 
 #ifdef CONFIG_KSTACK_ERASE
 	bl	stackleak_erase_on_task_stack
@@ -190,7 +192,9 @@ ENTRY(vector_swi)
 	alignment_trap r10, ip, cr_alignment
 	asm_trace_hardirqs_on save=0
 	enable_irq_notrace
-	ct_user_exit save=0
+#ifdef CONFIG_CONTEXT_TRACKING_USER
+	bl	user_exit_callable
+#endif
 
 	/*
 	 * Get the system call number.
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa91350..fd62112e1e6e 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -361,34 +361,6 @@ ALT_UP_B(.L1_\@)
 #endif	/* !CONFIG_THUMB2_KERNEL */
 	.endm
 
-/*
- * Context tracking subsystem.  Used to instrument transitions
- * between user and kernel mode.
- */
-	.macro ct_user_exit, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_exit_callable
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	bl	user_exit_callable
-	.endif
-#endif
-	.endm
-
-	.macro ct_user_enter, save = 1
-#ifdef CONFIG_CONTEXT_TRACKING_USER
-	.if	\save
-	stmdb   sp!, {r0-r3, ip, lr}
-	bl	user_enter_callable
-	ldmia	sp!, {r0-r3, ip, lr}
-	.else
-	bl	user_enter_callable
-	.endif
-#endif
-	.endm
-
 	.macro	invoke_syscall, table, nr, tmp, ret, reload=0
 #ifdef CONFIG_CPU_SPECTRE
 	mov	\tmp, \nr
-- 
2.51.0


