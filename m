Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB7FC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3E+XhQ30UlSW21cfmh1kLGlFL8sP6bIE+ExxMayVkkE=; b=tNrq6Dtg7BsEhb
	LTU29rfTfHgnmnyEUAhDznvD4bPOE6+B8JDDSv/LGhNl0LlNAMj0SkoRRVbuoZ2Z5XJVWlClUQdtC
	RaJBPTYsoieQfJU++8BAgc/9cxHB7vdHaBLDM3gA6N0rAE6pkO4HUZJYa18q2KKnV33MfwVzXWO2W
	qHcX1ZBmGpnj2CmAGhh3qnl7o7KwwT36OZ3FzQaAZo/F+Vfwgfs+kv2ELdAd2Cyg7lL0Rug5QmTTG
	pKq8ySpRVNeGOR15EYvqm13UTn5CqEzcpt6tPdqjEENPb+fDbKJibjFDyKrfGQc8rGPY3i/0IWddt
	Idcaa5VBqqUJcHNyJMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cS6-00000007NxW-1vgx;
	Mon, 07 Sep 2026 16:44:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cS1-00000007NsS-0uhj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:44:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4DF3601DE;
	Mon,  7 Sep 2026 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8816F1F00A3A;
	Mon,  7 Sep 2026 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799448;
	bh=3E+XhQ30UlSW21cfmh1kLGlFL8sP6bIE+ExxMayVkkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AV+pENzpNe27jKIRoaSpGRhj+K6DyKrFuqwdK17SPFXT/5AnsIBfBSBdwOfMzKxpc
	 fusF7opzvBzOf7cEAO6mmO7nv5qm4yVYIEcgBdRBcjlL31LxlCCQpO0WsjYxFTg13+
	 lVmir353ArSW6V665gZcFE65Gk3hwLNY+jUcI5V/6CsMsrd4+o9PmeowL3qS17szVs
	 /Lxe197LqGIm0k6NR0uwjgf7XBhAoBlUoAoJZP98KSunln7jRO/oO3NtbJ/AN6HSf9
	 x1eGknKxlfOcI0XbD87xwF5z5nnEdEFNmeHbZyMYLYckUfcINTLyIZb1UYb0nhsJ37
	 hY9RTEhQGMqtg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 20/21] arm64: tracing: Advertise a mode of EL1t in synthetic kernel regs
Date: Mon,  7 Sep 2026 17:42:45 +0100
Message-ID: <20260907164247.17223-21-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When synthesising a kernel regs structure for ftrace or perf, advertise
a mode of EL1t to reflect the mode in which the kernel runs for the vast
majority of the time.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/ftrace.h     | 4 ++--
 arch/arm64/include/asm/perf_event.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 1621c84f44b3..d55a019cdf0a 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -153,7 +153,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	regs->pc = afregs->pc;
 	regs->regs[29] = afregs->fp;
 	regs->regs[30] = afregs->lr;
-	regs->pstate = PSR_MODE_EL1h;
+	regs->pstate = PSR_MODE_EL1t;
 	return regs;
 }
 
@@ -161,7 +161,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 		(_regs)->pc = arch_ftrace_regs(fregs)->pc;			\
 		(_regs)->regs[29] = arch_ftrace_regs(fregs)->fp;		\
 		(_regs)->sp = arch_ftrace_regs(fregs)->sp;			\
-		(_regs)->pstate = PSR_MODE_EL1h;		\
+		(_regs)->pstate = PSR_MODE_EL1t;		\
 	} while (0)
 
 int ftrace_regs_query_register_offset(const char *name);
diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index ee45b4e77347..b3e7c24a5aab 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -17,7 +17,7 @@
 	(regs)->pc = (__ip);    \
 	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
 	(regs)->sp = current_stack_pointer; \
-	(regs)->pstate = PSR_MODE_EL1h;	\
+	(regs)->pstate = PSR_MODE_EL1t;	\
 }
 
 #endif
-- 
2.55.0.979.g7e5102b832-goog


