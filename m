Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F0DD637A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=; b=SwiTX+6g9qb/rf20SDd4T+VcUu
	coAQlUNabXxyayBPOOYY9dOBwqDPpyaF2w/0118XegHmr1GJdjnhLCQ3Un6hzBAhulh06QrHKi6GX
	1iLBY5N7+vy9LQUc0sEmKqOoXtewx2WfRNV0Y7IfoRDK+5wbROub42+E+pv8CdK2HPs9qDOLqQTI3
	7evlF//wvGVPWT7ZTeDx8Hl2Ruh9gRBLRFfSZk6UiPP25X1t2aw45WEg5o2iY87st8GVqasfa6zuN
	fLOdtdcBWApZ4gyFKqavjxvC1LsetqEF2mYhwFHLD9RSJUEN0peivTm4KnLu5FJhC3yUKz+l95z1K
	CqPBp1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBImL-00000007oWA-30Zq;
	Wed, 13 Nov 2024 19:11:49 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIcw-00000007mzo-3zsG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:02:08 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea82a5480fso130130527b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524525; x=1732129325; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=;
        b=hDzUeDHnEUt7Ok23L89R4PtBXykkFmuyhmZEeLD32DW8yqFBEPcz6PRgwfzy+TB7nB
         MdoLzOUzfmo2Zc+ZXUJy8ty4gKboQDCzUwYyXZ2bOKOhUk6aXyt4u27I8Gg+d5hMjFnu
         fBb0bfaY4aoecBv4FxSAXBEdS8QaE8h5ldq7ezy5HPiuHTrc178UFrNM7Axl7+nn/3Nh
         9PAWcknR4WVkPZglwEACeWY0E/FXXmtAIHUtOoDjOZSbF/y0cFiwGMnSDtLVqJzq3cib
         lCjruN1ONekVGxFn7RKnNxV3qPMMvamYbve1SleMAkOHl9AyML34vcpWbZT6BTdFy6yk
         VqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524525; x=1732129325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQFdXgHR/yBinKM9akC7F2JFw2+gnKw6F8HpNI5yy4Y=;
        b=MyaJscpUhWph+GxAlLuKOAf2qfcmbYrnEcxzhX0Z0ANL9bTT9zB4tN3UyEZ5vkiz5T
         4ez69/v2As/UXk82IDUDeIZJ/OsDvTk2CaDHepThyy6PAyb0UjhNRKvBgL3xWsd49o23
         cf+zwx06VORkT+W4MEku+lIJAIXIyKJXFUx6U9gmcdDJPuFK8p1pHA1jBvOPTip9yMKr
         e9MEdWbWw9GGz62kvRx4vu/iObGWKM9dUoy8m5bjHmIG5GKS4RJNcnRLNpQzKHc70D3A
         f86V3w+aM4Jsy16+GMBvvpLp2z5PKanwfCn3hGZ5Y7n3iB5ZwoxtRBxcR9ES0rrN1cXR
         9O/g==
X-Forwarded-Encrypted: i=1; AJvYcCX2XMNdbMC3hj0wJAvl5jO2wUzpis7mTIQFlouHvW/o56PdVBPaXlabXY01CPLXI4gNEV57XQvboMxoG5ptGGnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyK5vuE/LjxH2W+ffTHmQRVGu0AoUHiXvwLGQFGhwQnnq7xtR/I
	heNoQy9StoiPqi8Utf2UaoLRXxWVZ5GrKmddDBzgM82IFGPEcFg9Iix6nq3vfjwURYlJdWDF9YA
	Ve3r59Mr/xKComCQml0O9bQ==
X-Google-Smtp-Source: AGHT+IFhulDvoY0sGq7EYnbunXmF/EqPCQ3tEG2uX7XcBCI6dgYlk8NlhbbJtWap3voWbgrqyi9w6iV13kRImFawvA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a81:8a44:0:b0:6ea:e011:f122 with SMTP
 id 00721157ae682-6eae011fd7cmr1805147b3.5.1731524525438; Wed, 13 Nov 2024
 11:02:05 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:54 +0000
In-Reply-To: <20241113190156.2145593-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241113190156.2145593-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-5-coltonlewis@google.com>
Subject: [PATCH v8 4/5] x86: perf: Refactor misc flag assignments
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
X-CRM114-CacheID: sfid-20241113_110207_101115_282E97CD 
X-CRM114-Status: GOOD (  15.69  )
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

Break the assignment logic for misc flags into their own respective
functions to reduce the complexity of the nested logic.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Kan Liang <kan.liang@linux.intel.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/x86/events/core.c            | 59 ++++++++++++++++++++++---------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f39983..bfc0a35fe3993 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,27 +3011,52 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
-unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+static unsigned long common_misc_flags(struct pt_regs *regs)
 {
-	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
+	if (regs->flags & PERF_EFLAGS_EXACT)
+		return PERF_RECORD_MISC_EXACT_IP;
 
-	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
-	} else {
-		if (user_mode(regs))
-			misc |= PERF_RECORD_MISC_USER;
-		else
-			misc |= PERF_RECORD_MISC_KERNEL;
-	}
+	return 0;
+}
 
-	if (regs->flags & PERF_EFLAGS_EXACT)
-		misc |= PERF_RECORD_MISC_EXACT_IP;
+static unsigned long guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+
+	if (!(guest_state & PERF_GUEST_ACTIVE))
+		return 0;
+
+	if (guest_state & PERF_GUEST_USER)
+		return PERF_RECORD_MISC_GUEST_USER;
+	else
+		return PERF_RECORD_MISC_GUEST_KERNEL;
+
+}
+
+static unsigned long host_misc_flags(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		return PERF_RECORD_MISC_USER;
+	else
+		return PERF_RECORD_MISC_KERNEL;
+}
+
+unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long flags = common_misc_flags(regs);
+
+	flags |= guest_misc_flags(regs);
+
+	return flags;
+}
+
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+{
+	unsigned long flags = common_misc_flags(regs);
+
+	flags |= host_misc_flags(regs);
 
-	return misc;
+	return flags;
 }
 
 void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index feb87bf3d2e9c..d95f902acc521 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -538,7 +538,9 @@ struct x86_perf_regs {
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
 extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs);
 #define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
 
 #include <asm/stacktrace.h>
 
-- 
2.47.0.338.g60cca15819-goog


