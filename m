Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCFD637A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=; b=YCmnvRz4ZjaRHU5GdZF9+jiEaG
	ClO0/01Uw+1kQ04NUhv6WG9n9HHZD61CWkaCyX1vC9zkDm2bEw1f0SOrqqkR1osHvFlD5/OZj553C
	P7of24fh+DygrKPalY0rNJu7rXCH04hfQbb7qwUDX8mcdd4DIRiCNLSF7rQ78zOkJxiRpfpG5GO/Y
	/6Yx25JBd3pDw5cVrnlmsbxdnVerRi3HCqY8U0g3n3Gopnorpl7GesIJwbPT7T1CYlRY/LygnoMsL
	T8C1t+mvFLXvsC0us+4HIx50cP3EDBmSQuElBlZl50o1pcpPYYx4sIqcMc1PaA9pRQO2OaUbQvaod
	strXrzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIkY-00000007oC8-03lz;
	Wed, 13 Nov 2024 19:09:58 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIcv-00000007myr-3g6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:02:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e292dbfd834so11822959276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731524524; x=1732129324; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=;
        b=KZR3z0cxjvk7UH1OeNHAxip1H8XU4atuc1W5jseczv6JFYjsXEqkj7id5KkEAxEVO6
         5meH7j14x3ETOpDge1BItjeikbRTeDBoVld6rsGMyjN8ckZD0qBUOVa6MCB+mc5AosRw
         F3scXSRktcT6MVYUu2U81ODpOSxikdUcMBHMAIpPqcbmymKZvl3wMxCV6MZHylALX8B/
         ukBL3zQkGrOb8V119soOdP0QnNTwKMegjTftd4jXXjP2zp3KfbJqrqyGS3bDzJfcQvYa
         d7WR8DObyFp1L57ASkFHXd6nldrpjm+hnB6ZlQ7Q+U+KZlqzZZKT1xcI5LZKEqiWihdl
         v8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731524524; x=1732129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgqFKvoVHXye/CyIJghap8jc4W684iliK9zLYmCZ1Zc=;
        b=kFvKywz4aHq0H9ZBV6ACaySyJZmngH2to2kBdeFI1Y8ygnTL6kzk1XGq4XXzwryQoF
         5pXnPzuLowVq5yEhkvJ1Zrl3FPKwWOBpUc8FJAp0umZ8aoLNmc3JyzxQexlD6/9nDLfb
         loA96EFyaRfCyw1jIcGIawe1a9bkaqJwvZr9uQBGQAmkBVFb+dkS0b6nEXXix7HJvdtO
         qTmwb9NsIljmJOxTVDDPnZ6ficVYdivDVMAMsoHIi2QUHP/V1k94CE0CDi+2hHJ3LPCy
         jsG7cO8M5VPqAkFGBNBTJpI9hNpFoQikQPnlc3svQEkOIevp3DFYT2SmqgSV9hf3a+FJ
         1tyg==
X-Forwarded-Encrypted: i=1; AJvYcCWoaglA5T5Ayxid1xMiDo9BDL8HQ/P3ntgfNcX0ijj74+leiWfZ83bQxe1ffkUbZj0EelPs9W8IqVFsRnxwKOxH@lists.infradead.org
X-Gm-Message-State: AOJu0YzpM6cfJcm4mhM5Nhs0RsT/Ymn6HB1HEtw1lXSyPCtQKPwoOAGc
	s138Er81CHTzb0PtXczi6nQTnm/+DLof2OE11MPYTOQeNZsCQKu7a+kUXAp9YbrQ7FDFpvHFnG7
	1GHDxJjhLUs4cTP7mx/zKvA==
X-Google-Smtp-Source: AGHT+IFNr9w/0dGnK6PRtslGYFp20zZooyO9LSsLAArex0mr+uzyM7no72zQ+L4NJiH7IrVQOwJt58oXd0jflNUvgA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:2411:b0:e38:c40:380f with
 SMTP id 3f1490d57ef6-e380c4039bfmr33947276.3.1731524524115; Wed, 13 Nov 2024
 11:02:04 -0800 (PST)
Date: Wed, 13 Nov 2024 19:01:53 +0000
In-Reply-To: <20241113190156.2145593-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241113190156.2145593-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241113190156.2145593-4-coltonlewis@google.com>
Subject: [PATCH v8 3/5] powerpc: perf: Use perf_arch_instruction_pointer()
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
X-CRM114-CacheID: sfid-20241113_110206_059406_EACE5571 
X-CRM114-Status: GOOD (  13.39  )
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
index 6b4434dd0ff30..26aa26482c9ac 100644
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
index ea8cfe3806dce..ddcc2d8aa64a5 100644
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
index 488e8a21a11ea..115d1c105e8a8 100644
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
2.47.0.338.g60cca15819-goog


