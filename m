Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2BDD637A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=; b=YLNxv8Jl4MXZzH65LsKeNLgHns
	GuYXsVbzN8qjsXXhSJh4sF6bxZ3eTLEk5aqDiXgbt5InGEUmEmS5M1ROQBMp8Jqg/QAPYlR+h7xKi
	fvgr87KWqzMudBysclmiAW0m6TWGYnsGA+0vYBYnTSAQDxDDP7dJ69OoizO0rltcy6nS/ObYowv3h
	gj07FG2+OwkLOQNZTd+CxYfc3RuehZQJ12hTKHu8kDCdJFRlIB+F7ry8UM2CkgfI4JvLeqYlF94nJ
	v3fEarSlgF0H/6Tmnuc4iktZBY6OsYA+croEV4WRGBGXfQIOtZr6WYCvW/3ygI4GidU4LX69e+MrR
	4w/rFNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIgz-00000007niZ-3O3e;
	Wed, 13 Nov 2024 19:06:17 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIct-00000007mxw-04vu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:02:04 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e35a643200so123743987b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524520; x=1732129320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=;
        b=ZOTE1HaBmt5qxFX6tz3lru+hIgU8nG3fAQstkhn0q7B1l0B4O5+RFEh7H+H3xwciEY
         YeLyCA2Bwq75VBgumV/KQkS3kjdjbp1yc9sbp9QvQXJZuv2370hmWQ2037cKFO95x0W8
         h82asHks5kERZ/LMH0w4hBsIdyesgmd2FR21Zpz4kA2E8S/+MP3kiRv6ILuz25JHhT8W
         k86kugjO3LwdkEz6Pqu38u6gqJP+2jrtgJnCtV6KYip06Fx04/xi5qvWlNb8nzmrXuPU
         9qV+v3+y+vKnC0ndo96eLW4LIrDIA3icjfRasTQ3Jhl11YDxLOoM6sr/1bBEs2e8y0H4
         8Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524520; x=1732129320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps8myr2QRGzBkspMaTCSz6a/NGAbW5KYOWNi6Q8v63A=;
        b=KrRSQG/610d51d3PLWzlwKOf4CqTpyd3XBJgZQNTwlMGPJAMZpD0EIEXL54zCrLgm1
         27IH84aR8qe6hi1p5LzR8YZM8nU5JigWdX3VwxvFv2VaVGsp84QD0/JVwSq2+fPwP75H
         yOf8mBk4rKB/M6kmXBUjkVCAQvRd/F2Lz1q9+s/uRbC+3wRyd4Wo/GJipt1gRzhcbC8k
         oqrAPOsVKYrf1n7j/R2qEhHNdB8+0Gvm90CXYiDDpH3xKtcziONjraB31BnC6tc60xLL
         p4LwB+YuQJcI7+5DS4frNwHuEmgDs3rbM6RVcbFP4IzLiLErMskvYYSotYatiYBAV1UN
         e92g==
X-Forwarded-Encrypted: i=1; AJvYcCWxMTi90CWE0pITaIUhP1svxInoiFf4rSxoyWKslnLlTuUWQZsVsTyPeaI5F4LnHv/70kAUDo+3goqI4VJGO1IF@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEUYC4ywsuCRpA9dKZSQldC+rAjU/6DZM3UCfUJ+teIpQqFKP
	7lbolCl6rLM4qictihZr45wHwipDHue5SnORdjhI6VAlc43sPQSRORr7oQ1vuapcHi6rY/zVMhM
	828H0Iqt7TCdFN7im1l2P7Q==
X-Google-Smtp-Source: AGHT+IGMwJxojcrbV2XaWtAxjGZhIMKLD/TWp2TYO47jqONg2YGViPdlhPH/gu+8jwib2jMpO8Gmgpa+P/L1ZLf8OA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:3349:b0:6e3:d670:f62a with
 SMTP id 00721157ae682-6ecb343d0b9mr2033797b3.3.1731524520358; Wed, 13 Nov
 2024 11:02:00 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:51 +0000
In-Reply-To: <20241113190156.2145593-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241113190156.2145593-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-2-coltonlewis@google.com>
Subject: [PATCH v8 1/5] arm: perf: Drop unused functions
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
X-CRM114-CacheID: sfid-20241113_110203_088248_36EEABF4 
X-CRM114-Status: GOOD (  11.34  )
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
index bdbc1e590891e..c08f16f2e2435 100644
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
index 1d230ac9d0eb5..a2601b1ef3182 100644
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
2.47.0.338.g60cca15819-goog


