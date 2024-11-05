Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AE4D36121
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=; b=Bm0faihHkWQG6A2zClIlZ+/Gdt
	LObfeVcTJZiNua0wVXKtJo9L0rpjiH0+kbmpjl3DN7O2u/2m5f85QyhKYV0J1Jbfu8Nny+RCNIHZq
	G+4Wv22HX6qPLIoa6RhNznDALUEcW9VNTlONKhf7ryvNeWXA9vjZ1x0PzAxKK2qlQAeigvg9Op9+V
	KuUq+SkWUrKdzyggJvgGgW2Ftg7IxOS6H7H7p2JRYjKG7klGmXIjlmEaD73ps+ax0iQ8i4rFoTCLq
	3JasBaZG5mPX2/R1r5nybthgv58fQ6xZ2fxJEuuymdQdiJ9B+AIRKz1NuDMlGzCt0PFw6Vjnnt33X
	UucJWqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PmH-00000000eIT-24KU;
	Tue, 05 Nov 2024 20:03:49 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PfG-00000000cVn-1jWZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:56:35 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e38fabff35so103802877b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836592; x=1731441392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=;
        b=NI5klDlu+GAhWUq3wX5doN7MqFWuF5dmZj5O5N7E/Y5LKHaYQmUxDThmRr+t/2bMoH
         0HlsByLQh3mFLAJMP3KFdrm0m5YjFVajNKOvx6h3qrSHC1ZJoIC0AcJpKEzuvg9u1jTX
         bUtiiBCvww2NNTx89snwvpfiohj7sjCkZ+4bhFMvq7bN0e3f66PC7kwz+wVxy399zkxo
         ZG+PL2y9d3EgmEKvsGa9C2rNpgt5oUOUg1FUcFH5pXWApTjTfkNjdUpAuOhoR6Wi66zo
         ooQ6xl66GBbXSwILLm+r50mykuRCywvwaEorEF153hIY7NVmrRxkGmTw17OXGr+MksiH
         yKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836592; x=1731441392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW1pAHD8RX7fvQhBgDL/ivZoJ4MMiFBudzlwbhbqZhM=;
        b=X+/GjQ7g+1k8GHqZtN7jSeLuF47wAj+2a5vxIlTO7ywSfKBCchA9HThoM3nUSQAWAc
         gbdbzRQNIoqtiEzpr5MRtC/2Z4u9QHI6RNFb4x7e6lp2o3fs+l8PWUF7DEl3D7ZewSp7
         +JYYAW8+qpDAXV/3I1pUoxVarLDrc8tSpp27S4Ds5j73ctcUErqYtwH+ptWnAL2sjmZG
         35Ovccjroj/T8dutPMu6+qp+3Pslsg7i3VDhn59/Y5TiyG4clP3/ZBW474YvUvA2D6i4
         4cGnPoYHIeTnQoN18sVMqXJPi1byxkvDoyn9oeloit+o8PSKmgbHSmesLzXFwfleTI1P
         fwuw==
X-Forwarded-Encrypted: i=1; AJvYcCUGUudpgRBlPZ9RIC4RXUi8jSHoIUn1bOjYPGKFgmdcVEINFCkTcTfyA1fhV0CP6F7P8Fw0zefJS2NkliXIBc+1@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjr4OkLNwruTU5fGTrpnBiiUCOYJvV4GlI4ZZsFCeicub75E5
	BimAkRYbE+2+rLY1vI52bUhDVBVTYbO6Lzl/zi9EphjzIaVDcfExhnhcqo9CzGA+xjQWieN68RN
	qNxXSQJ4smNHijTJOn4FZ5w==
X-Google-Smtp-Source: AGHT+IFe5esZfmV8PpNtTKhf67GNSznritdlgCuivBreGx7Lwrw/eQ/PIB8HLPh/Mq6jxCM85J+7ZrWnfVuJw3jbsg==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:690c:4489:b0:6db:c6eb:bae9 with
 SMTP id 00721157ae682-6e9d898f08bmr17263797b3.2.1730836592357; Tue, 05 Nov
 2024 11:56:32 -0800 (PST)
Date: Tue,  5 Nov 2024 19:56:00 +0000
In-Reply-To: <20241105195603.2317483-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-4-coltonlewis@google.com>
Subject: [PATCH v6 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
X-CRM114-CacheID: sfid-20241105_115634_535665_61EE23B5 
X-CRM114-Status: GOOD (  13.66  )
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
2.47.0.199.ga7371fff76-goog


