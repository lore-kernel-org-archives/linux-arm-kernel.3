Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B5D36121
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=; b=x/RgupM5Nm0Bsrm6Q4MqoeUNKo
	o/hR4SUOfUoUL9n/BHYB8Z7/6SoGJyfimzgpB63PnLIl3LU6wLXGOKVu+RLndPXuLlzhX1nuqCFTh
	MX4YbjLC+yecQIolOlkK9Crg6qQIkcOZZcVlr9+1bMpakPmdwEemEfM5O8rK1Dt7LUHpbwOvcL8QA
	ltnmcuPHoKWIXkmv7mL/geq3kSvMzZR+Oa3zRvkfCzRhLwX1Vq3Ws2h4QpLLntUHDvlORMjaPDFs+
	/VKAccy6i52Nv8a0Dy8s5LeHTm+0eJPfSbjRAuhqFhCJu6NsPfJbli8kCvWLIEsq+VwJTjV7Z0+Zp
	9wTKOvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Pil-00000000dZQ-0i4y;
	Tue, 05 Nov 2024 20:00:11 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PfE-00000000cV7-0Bpj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:56:33 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3a3c5a6c5e1so76049855ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836590; x=1731441390; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=;
        b=LVf7hQsLmrMSD+AskhkSkN3QLEGHXA1cDzVKqRc8NN188DU9uCTACj/bPOcCoXtXET
         HoD4Io1EY+SZSFd7lrNuxm26A9dqS/1y2uyWJriO7LwpfApB+8VvtXtExqFO9kVzOvUu
         1jUu1w3IhxjWdqOXq0vJYWl1yOSLPUjH/luiwFoEagFSBed1ubLWaKy3Sxrp0EvwRULq
         17mKRyswr9s7Eyfek5SBsg4i0AQOBKIgmII5y34nqh5TfYYiXzOQBNH0auwdFOnP7NHD
         uDZUgZqQTWipFa7g7tmXSZsAAAPgF3QzoGUOLdE5587T/pYYlfXcVjh/AOVuJmFZ7xlU
         dbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836590; x=1731441390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPb0hqOBb6kblWxXXARI3ocpeztWq9KwTirxTPs2l4Y=;
        b=XdqRyV+B81xKW75sEsLGyCvqiJz68hboeW12ICUvkzknn4mCkPSQQjYwssP+eonrH3
         ndgS9Rg6jyMziHDErjdC+rdWkyoChvGgFHLAjrDZpFo8jNgS0jKBcbHghdfbUkC7U32u
         iZ8D3ZsvQMet/VoOTEDx+YmV7s7E1ig/EieInWenoqJ4bnQe2mVeti65Rkns8KriAyQl
         5LWqrRAr1o8kXqa6TDNVHS+u2yXzk5fC9GRKra0KonVDwhr75TLGLZF2hcqsXJQqetNL
         w211aem3qSdD2p+bcu7UtTBYam1R8OYkyEe59HhPpYdiovMSjLbzb7NPbWwV75+kjRMA
         FoEA==
X-Forwarded-Encrypted: i=1; AJvYcCWGD5vlZC8u/KWMAntlY2JMpNBXDhRAF4AKja3iEMk20ZtbpJ82DcjqjakeVogDzmp8Vu+xolF9ekE5IkbtAU+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yxen5kWtG/4jJNcGa63uE67Nfqs9dNTC524LZZKy46O4chcMU6Z
	bzOwvcKN+DxbgAmBuvgnwucWtIhpQrtAh25FrZ0w+d4cZEXCNc+RsAiTVOw4uixiahbMnWmWqpr
	kTeMXuN92bCubrJoxzZ0Dzw==
X-Google-Smtp-Source: AGHT+IHah6Nqgqq9N69ws0DKUP/HTUx1alzkcwBsGSQWk19UCQk0MEnTOVuN0lF159yK8HSXoS8zbdDz2TvwiOw9WA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a92:d702:0:b0:3a6:ca09:6d48 with SMTP
 id e9e14a558f8ab-3a6ca09715emr1563885ab.2.1730836590276; Tue, 05 Nov 2024
 11:56:30 -0800 (PST)
Date: Tue,  5 Nov 2024 19:55:58 +0000
In-Reply-To: <20241105195603.2317483-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-2-coltonlewis@google.com>
Subject: [PATCH v6 1/5] arm: perf: Drop unused functions
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
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_115632_366285_E8167334 
X-CRM114-Status: GOOD (  11.51  )
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

For arm's implementation, perf_instruction_pointer() and
perf_misc_flags() are equivalent to the generic versions in
include/linux/perf_event.h so arch/arm doesn't need to provide its
own versions. Drop them here.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm/include/asm/perf_event.h |  7 -------
 arch/arm/kernel/perf_callchain.c  | 17 -----------------
 2 files changed, 24 deletions(-)

diff --git a/arch/arm/include/asm/perf_event.h b/arch/arm/include/asm/perf_event.h
index bdbc1e590891..c08f16f2e243 100644
--- a/arch/arm/include/asm/perf_event.h
+++ b/arch/arm/include/asm/perf_event.h
@@ -8,13 +8,6 @@
 #ifndef __ARM_PERF_EVENT_H__
 #define __ARM_PERF_EVENT_H__
 
-#ifdef CONFIG_PERF_EVENTS
-struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
-#endif
-
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->ARM_pc = (__ip); \
 	frame_pointer((regs)) = (unsigned long) __builtin_frame_address(0); \
diff --git a/arch/arm/kernel/perf_callchain.c b/arch/arm/kernel/perf_callchain.c
index 1d230ac9d0eb..a2601b1ef318 100644
--- a/arch/arm/kernel/perf_callchain.c
+++ b/arch/arm/kernel/perf_callchain.c
@@ -96,20 +96,3 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	arm_get_current_stackframe(regs, &fr);
 	walk_stackframe(&fr, callchain_trace, entry);
 }
-
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
-{
-	return instruction_pointer(regs);
-}
-
-unsigned long perf_misc_flags(struct pt_regs *regs)
-{
-	int misc = 0;
-
-	if (user_mode(regs))
-		misc |= PERF_RECORD_MISC_USER;
-	else
-		misc |= PERF_RECORD_MISC_KERNEL;
-
-	return misc;
-}
-- 
2.47.0.199.ga7371fff76-goog


