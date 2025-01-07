Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900B7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfaMZlHPI0COD+Vx8O9p1xdwXj673vcQcRJJP/RIV4o=; b=tP0ufoBhTOr+e7jkX09POVe6N2
	kMHBy9HnEByPm0PMe/Jqs2xswUmJ/uV+Gt5MsmuaYDtJtS+S90IIKms5HWbzpI4NkwM6kGOTEY91o
	mk0LlcQCojpDDjQWo3cKNOa7jQxMiBBz2Lk6KYwB8JGBgPAXFhMTQnxZ1HOJkZ8lallXYVQGimaR7
	rI6YqjTTZF80OUkvsaM0eGUnlEdpwTwKexuia0+Q5Sez39ZDcD5sa5Wt3TvYFOX5VvUu2Ah7Ytf1z
	f0Rjg5xx9jngpBjRtqJQLGWtt6tVERdhDcvzt/uO8hy7/wNds0d+tQALRxCTH7QEGTd+NZCN0eMGA
	ABrf8tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6AI-00000004CGb-0OGX;
	Tue, 07 Jan 2025 09:46:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV65b-00000004AKi-2Y3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:41:35 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so26640926a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736242890; x=1736847690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfaMZlHPI0COD+Vx8O9p1xdwXj673vcQcRJJP/RIV4o=;
        b=jzt5Bt82ly0FVUt5RBFlfd/uxnWKGbxD/qZX83vjvNNmAOSfjXNexUEbnjODY/cqQA
         8xJY/7XV9uCUgrKeY9QmvMemRMKwMMSTB2mwRMC6bj/dOEcZ74N3Jf8UfRsNG6e7dzqU
         wxceRNwtVTzJTz/RCv65zukwZaKWX+0bcZSVkn/XiTu9+vrpIdEr+TjqTmbiSdjCi3dp
         MBPTdKbByfETrqGzlYhhHbB1V3PcPG5z+VfRYbHj+lrggzVdTlLrVJH6uY9nJYnZPPWa
         2M2SGl+7S91XJHUDrNEQZzPFReDobqq1LtV5I4w8U95KHlALwUoX83zq1t4HiY/jsdmG
         2IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242890; x=1736847690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfaMZlHPI0COD+Vx8O9p1xdwXj673vcQcRJJP/RIV4o=;
        b=fR22ik/JcI0cYm69u5a+kq8O5jlrXSTDR3IhkpYLQTHMNTIPscd+5Er60hGmUkAh+n
         jfVvaqcxIcAa0R4Su2sUdlimH5hJ3XGPoRma4z29glnZvaDAJ2kc7N/wKdiKH5POuj9D
         atbyfssd8ABEDMKtHsiLlEbWisWm2C37ocHyIAYw4Ku7ejd6YGj5hSD7zIoSAh7jMoF1
         C98Cry0mGmN/Dit4lDz0I3tRrt0AYO/Si3jxU0rt7AkjjcKzPsTmz+r69wWHWITpIPuG
         zcmRrWIZLzKZw7BrHiVvV610zGCd7yTJVIrSQSUo55yhOksCB5d3UmRIhAN22O9fpK8X
         KsYg==
X-Gm-Message-State: AOJu0Yztug4mWf8mA9a41mlckgyvZej6g/K3H54lVafX0RnxYcA0/Znw
	uSFMlO++yyjBf5Tm4NNTZHjOguYyr9JTxrtG5Yx8HELIaRxlqZ+fu1WHDVYwZyo=
X-Gm-Gg: ASbGncturYtZZ61MY7Kx6/+YMsIgEVS+/kgI8nbigjcDgbolYGRaaydp7snU/2T+Gh6
	FQ9LRs0sum2Y6AaXDQUeJ7fhLwGoHh/hxUVP4oo8LqidthGL8v+P16dzXMTDHQ2jnRhTQJsl2Vr
	LsjsOyxnPMI4HY6tq6q9KdJY1zU8uMIwBPlVlDyqen8nRCjAw2dhQJBjjaXiqbAtu+cdtuTAT7u
	wU83p1LL/bqwnNJYpKajl9MIamOc6n/Zq9BuTnM6fgwskmBOs7knbSobxJvPTfao+4=
X-Google-Smtp-Source: AGHT+IGOLuMW5s2DxWSu/ld9IZ3q3TUEkPd6kSV+QxLv7icvBj7L7t/dnghaUDBa0m/DN4kHcsfcyA==
X-Received: by 2002:a17:907:6d0c:b0:aac:212d:a883 with SMTP id a640c23a62f3a-aac34451c4fmr4709173966b.45.1736242890050;
        Tue, 07 Jan 2025 01:41:30 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f012229sm2356901166b.133.2025.01.07.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:41:29 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2025 10:41:19 +0100
Subject: [PATCH RFC v3 03/30] ARM: entry: Skip ret_slow_syscall label
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-generic-entry-v3-3-4e5f3c15db2d@linaro.org>
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
X-CRM114-CacheID: sfid-20250107_014131_648752_55914045 
X-CRM114-Status: GOOD (  11.04  )
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
2.47.1


