Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA0DD5D685
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=; b=Qbmx32sfyRlO+OJxl19mlWBLnc
	vcksAO89K6TCTeGvFekGsndvAV9RRtIKh1gQH6D4ABqcojyJNjsJcPjTwfI2xXR5JzI5pZ24Me58N
	2JSZfrLmnXPCsKDUUYJccMFJ7qvZs0gZPqvPMDScNYxMfQ4+uDddgPbyaPTUMcM5qO33YRbEVAeOK
	u4pS+0Hl6uqpm9g3F78ACfpJEWIvjsWTauTRDSiFccIF8EUFKBN6v5IosKl/nLQtdG5+kK2R7wsfg
	P2mXLjjP0B5qDT8QFDw76uzfOx5w1g8Dslif2+uqp5fUqM5ReJvTWL3MTAmj/F11quQ/TRLGTg7hN
	Y37/CBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97tE-000000081Tj-3eWw;
	Thu, 07 Nov 2024 19:09:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97nx-0000000803o-3BCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:04:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea6aa3b68bso23454387b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 11:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006268; x=1731611068; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=;
        b=Mg5vDABeD5jqLHyVq0GxOnPS+uWq5BKfIKLMeEg+xTG0QjGyIoof8KBD5IC1+vzxfn
         zs8j/eR9BdV7Dr3sWAosnszbWmqsEXCcOILSMf+2VXb2EvIMvZoirfbBB+JZtzYUQT20
         Xu31giH5jg1RmRpkxF2PNn6PeF6zxmZOtMUoEntNNhSZDaG0pdqY1se9ISBe3CF/2jwa
         TbfxQoYGnn/aQ4zfBnNdabZO5vg293qktaXMxwuV/PRAKthboCV1OuwfJsuuI3eBDCuD
         ZliK7pYywevDEk/mCC5KR8Ks5w1UR46yvP3vTm+W55kFhmiH3zbMEzI9tSIuukqC5S8t
         GqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006268; x=1731611068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmIA3zzAwF29Of1RGzzoKivdDO9cfxtkZLWZ4k8wrj4=;
        b=c5pw97wip1Ymyderreh0fSTaQCYCEmtm4QVrdH1lj5GFlAJGB/FFAm7bhByG/62YRi
         pxf+6q1oQIVgMT5svBu1Ry03cbYiec0swKC3a6fIv+d/hnW6FRv0ieJEb/9xW2Shb5yG
         slr5hYi6pdtFZL4z7+D7tew7xNafvAWxKkSlrh38GCWKtESiNJh6RgkLtTjKIy12LM4t
         UzYncGB9JlWj2S9jDVbMLBZsE1+flmljZjmqQjwxRu2JuHxmPbxYwLIgW3J9Dyuo+AIT
         B/Hk4BHATrtA3P5Le9O45Xqps5qm07O+If5A0AO6jeRfev/jcBQlkhWtra0Tg+zhthVw
         1jKA==
X-Forwarded-Encrypted: i=1; AJvYcCXBz7HLpPjidyIEf4zoHCmwtDfEkcp2URkdHqfAwdasLA4+7MR2uJKzbLOgKv41wkpCrX3ZM4Sl7AGG/8TcFtpF@lists.infradead.org
X-Gm-Message-State: AOJu0YwR3YS7Dc7L9x7uyoNC637A7q4jeuTDoZloSj4BVKiuJ7no7xlu
	FjtoiTNdpMf4xWjGA7lNCxuRyTrH1IpeD77lK6gps+L060IHd/QwUll4UHroEJNTCskRFb3rx4t
	1CDzsKbkyjlRSJggkodxwZA==
X-Google-Smtp-Source: AGHT+IEPatL83aR4PMUsob9OXifW5dvDcVQBE6blGQgqqGrE/g3o0tifuLtLw5ypjY27t+StHZULk6h1q6SQXWXUfw==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:968e:b0:6ea:34c5:1634 with
 SMTP id 00721157ae682-6eadb3f8a54mr13007b3.8.1731006267878; Thu, 07 Nov 2024
 11:04:27 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:35 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-5-coltonlewis@google.com>
Subject: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
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
X-CRM114-CacheID: sfid-20241107_110429_818847_030E9387 
X-CRM114-Status: GOOD (  15.38  )
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
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/x86/events/core.c            | 32 +++++++++++++++++++++++--------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f3998..9fdc5fa22c66 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,16 +3011,35 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
+static unsigned long common_misc_flags(struct pt_regs *regs)
+{
+	if (regs->flags & PERF_EFLAGS_EXACT)
+		return PERF_RECORD_MISC_EXACT_IP;
+
+	return 0;
+}
+
+unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+	unsigned long flags = common_misc_flags(regs);
+
+	if (!(guest_state & PERF_GUEST_ACTIVE))
+		return flags;
+
+	if (guest_state & PERF_GUEST_USER)
+		return flags & PERF_RECORD_MISC_GUEST_USER;
+	else
+		return flags & PERF_RECORD_MISC_GUEST_KERNEL;
+}
+
 unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
+	unsigned long misc = common_misc_flags(regs);
 
 	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+		misc |= perf_arch_guest_misc_flags(regs);
 	} else {
 		if (user_mode(regs))
 			misc |= PERF_RECORD_MISC_USER;
@@ -3028,9 +3047,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 			misc |= PERF_RECORD_MISC_KERNEL;
 	}
 
-	if (regs->flags & PERF_EFLAGS_EXACT)
-		misc |= PERF_RECORD_MISC_EXACT_IP;
-
 	return misc;
 }
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index feb87bf3d2e9..d95f902acc52 100644
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
2.47.0.277.g8800431eea-goog


