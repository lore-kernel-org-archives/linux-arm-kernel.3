Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DDAD5D685
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=; b=sB0ds2Yp/zfE6f+kO9OjbwrSoO
	K97reh11droh680GDqGd/KjwVSSds/Yu3tQlwu7idk3+lxOd70aEk1p5qEqQtlGklCYlgNhtMz4wj
	xR9PayQITI6vd7uZa5e4hdMR7jwkAT+R3xl5ySBLjW5Q76P2ll9dIPhdChEjyGVbQB7+R03ZCznbU
	lilCfgk4ru+AsufUPO0B9Md6Sqbs7gXUkc7q0kcnTZK8AVc8DbIkmW2Md2uX643sw8FDxFINYyEIv
	ixhhsRC9RZK+Xt9ioCBRALkwZbNwtBdbNL0Gkh8dFBVo2UjNwhl8tYRQqTI+sBZkT2w656vqbYDtn
	mGQfyehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97uy-000000081x3-372e;
	Thu, 07 Nov 2024 19:11:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97nx-0000000803e-3u9L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:04:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso2114901276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 11:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006265; x=1731611065; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=;
        b=fSojYoTjtJHTPoAXfGb9x1VvyGqviwxAPUnL8A4GrBzpgaFov6tKR3g9ZrbA0A4Ywh
         wWbzELx557pKmev9pGgdDYf7kuYJOPA+lyaPBoWIP5YyH59N8KSyJSRv2WpszdCVasBT
         Frm2jIZrRFR2Dkyr0YAAwLMp1bHne/2d7rtcSpRrYz8sF+Ldz/LaEK/9+442TctrVrqv
         oPHg5+llSPgaCic3SsYypPctZtbfYQ8EsaJQii4O4K5vYUPCeX8iIyeM2jCNJF8MYVsa
         N5tZr9RFzTjHtVLgSl3W0ZgozDbCxooZ1mqrIoKfzozXVf+hIellIuI7+B+pppTrV0uV
         N5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006265; x=1731611065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9gi3l/lEEfoRFVijXJDElnYTy8kzLmpCkQO/xthe0=;
        b=t9E+Jr2WQn3zZ/bbSajTQ0/ARjzowp13wucv6GQBvbBA7tn3PY1lWFC5rXGN8BeoLN
         /sBJUgRUIIz3WhyKhAiVZmEeaOtCejEQ64VR/U2pdfv2aqbj0ji9QPK/7vPmiP3cNLgn
         jOIsZDN5LmrZMbYv8mWVZsCHnZVEjiWuqKfGuM/wCM8vavA7VtEVcGilh1vCziSvZ2FB
         LsaIRCb1LR85G6tnAL9ei8nJ3k29uYBfYYvKed229N8ywJ2kr0AhIVPdRbt6U43Wb0fn
         SaxXpJOongMapKKMfKCX9shSRKmK6aE1NuI4Qtq+t6OWaTzq6raKbfiFGySQ0uEY2pPB
         DNSg==
X-Forwarded-Encrypted: i=1; AJvYcCXIeUej6N5xIAC8Y7yspPw6IGaRQTSwl7t/wYfVAhH08U9OYb5AjZaSauxHE21iq4CSyd52LEWAC0UfirqK7/TU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxxq1ZixeKaNUXtpmSTSuox/G/hY6Q79M0N742v/2f/pN35m98
	kp7WKCLVf+XiaooZhNw9qkYcgao53kZj7XrrUvThH5ER9VFglbERLVi9ZgaIp1ICXb9eJhom6+p
	OW8nZcAibUAP02Un/0of4RQ==
X-Google-Smtp-Source: AGHT+IEKv6NpZXqhvRfRHQ47kqAQcfmWLHCmkCefMOP8XuPLyyw7HdRAVBxL41mFzSkxgn/PcAHTCxi3L5lNVg+5sw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:2905:0:b0:e28:e97f:538d with SMTP
 id 3f1490d57ef6-e337f8ca9famr44276.6.1731006264559; Thu, 07 Nov 2024 11:04:24
 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:32 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-2-coltonlewis@google.com>
Subject: [PATCH v7 1/5] arm: perf: Drop unused functions
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
X-CRM114-CacheID: sfid-20241107_110429_995330_71051B53 
X-CRM114-Status: GOOD (  11.13  )
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
Acked-by: Will Deacon <will@kernel.org>
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
2.47.0.277.g8800431eea-goog


