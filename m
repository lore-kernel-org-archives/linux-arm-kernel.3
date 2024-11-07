Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1474D5D685
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=; b=jDUq9IKF11UZWdqdMexnt9iJEH
	NHjDGR1B1H0qX6oDAID2TA5WDfVFnTSeh9OavZDX91gx1XLlT2pnXiO5y/M8mDDHM2+zgbCkXuKvo
	Dn8zzRUHe4bLF4/Yu5Q0QUTroP4ri6jvS6ZOk0voHaHYrO6SP1pz2a+0NPMJ/ZOnGpPsGHabwhyrL
	AaOtxarFkg1WYdFGfQepvG9N9Qdl13PsrnwGUcBoGuUNO6dgXFDgLwUXY6wJNW97xPCMQP4a9EGpY
	1pC3cl4sTaRvL2Kz2tZk9CW5jd1NKqvRnWzvWIaHMxhflECZtwWi7dMAMiDlFl4sC05Dh2L3fWInB
	ano6kLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97rT-000000080yy-3FEc;
	Thu, 07 Nov 2024 19:08:07 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97nx-0000000803l-23Nm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:04:30 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-83a8c0df400so142190339f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 11:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006267; x=1731611067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=;
        b=OzLIwPrpqxbwo5lfRy3xUTG7dvV2i1Ay7nhH5YxUhNc1m0PsqcCILK4Jvf9Mny0cDs
         n8waAbU8qwGCVut79SH2GGq0DeA9jLLjuliuUkqkMfByJfzMguUBKDBDC0ZAK/HQX5rl
         FgfrrhptvMVkr9dNZsh0bGJFtAfAadsUopC7uVocGWFR4duwWPXwddlr2ZVrLXuqw3P1
         AM1f8oSpqRMKsrrL8T8wlsP42ihVAmtiUHpzJDUPoASUpBQ/K1yULsMMQtTCv0l+esMB
         KOrjDPmk7RyV7r5Ee379hMxi1rygNydNQKVEcKmFHLNoxDJl+flRZyAccNYF4hx/7WUw
         oxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006267; x=1731611067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8sUtURqCyFCOn8JOOFBrrh4KEoVslcfr90vq+LFgUg=;
        b=aMLbQWkZqX9NE/eOypyRsDS71RVcdvpCd3rfjtqSInJ2FLWNMLn0tyFhIEKLyy3SH5
         6Xe3qbCSJd6aaFryDPDIDuMMCgVRiVGDcCwp3dxB/j0d8XcXgXHSWrVJ/KgP77Vl8OpJ
         3oMs5bQvETSaddFc9MbR6X3KhpZsw7+wmBDrTzjLqDEqF6WmMp8firry74PXNG1R5M5P
         7Y0Ym9PcujMKURqOXR8CP+uq+8rTg1E17tdvsI3RJTgfYdzFaXk4Duut18VEm3V+WLl4
         kXZ0PswpJuHaIocX/+t8EHuKmpsl+U/GUY9NJPsRDb6h7il95MDjwRQA1meTNKSuZtvw
         X6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWK6OQ9Qh3QAuQuGhxYJ1e8+tihYY5EjOiDUD+21bxLgexLS8iKw9rKSnpXuUkejTaCnyB9TKsTMntj8eJ3byrG@lists.infradead.org
X-Gm-Message-State: AOJu0YzA0Z/nPfhrkAkySZvyLNFsirSph56TpRuiYA1JNlBBie8Vyu5s
	tzdd6z7eJUAqbPbMJ3I16uTzkx+WI5AZzS/EogJH8VEAzeQwFlRs0ErQ988/osvXCtze759gw/J
	FzGVgPM8br3kTO0pXZA2QTA==
X-Google-Smtp-Source: AGHT+IEPRr/IQdodyqcpTfvB5PFu6DqvhssHdY7ZGS0GFH2h0T2KiHTqbilJA81LBD/MlyV7/G5K+PfGhK0HNCVbEQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:890d:b0:4db:e85c:f17 with
 SMTP id 8926c6da1cb9f-4de6a5fdc31mr24173.4.1731006266688; Thu, 07 Nov 2024
 11:04:26 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:34 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-4-coltonlewis@google.com>
Subject: [PATCH v7 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_110429_549423_7A7FA8F6 
X-CRM114-Status: GOOD (  13.18  )
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

Make sure powerpc uses the arch-specific function now that those have
been reorganized.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/powerpc/perf/callchain.c    | 2 +-
 arch/powerpc/perf/callchain_32.c | 2 +-
 arch/powerpc/perf/callchain_64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..26aa26482c9a 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -51,7 +51,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 
 	lr = regs->link;
 	sp = regs->gpr[1];
-	perf_callchain_store(entry, perf_instruction_pointer(regs));
+	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
 
 	if (!validate_sp(sp, current))
 		return;
diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
index ea8cfe3806dc..ddcc2d8aa64a 100644
--- a/arch/powerpc/perf/callchain_32.c
+++ b/arch/powerpc/perf/callchain_32.c
@@ -139,7 +139,7 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
 	long level = 0;
 	unsigned int __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
index 488e8a21a11e..115d1c105e8a 100644
--- a/arch/powerpc/perf/callchain_64.c
+++ b/arch/powerpc/perf/callchain_64.c
@@ -74,7 +74,7 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
 	struct signal_frame_64 __user *sigframe;
 	unsigned long __user *fp, *uregs;
 
-	next_ip = perf_instruction_pointer(regs);
+	next_ip = perf_arch_instruction_pointer(regs);
 	lr = regs->link;
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, next_ip);
-- 
2.47.0.277.g8800431eea-goog


