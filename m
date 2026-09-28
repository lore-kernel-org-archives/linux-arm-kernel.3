Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A890CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbjBREz9vOqId6KGSe2hfelOhYq7OUN6jgn8hmrgsOA=; b=VmNhPx0rVCq26LJgOgsxmhyRxF
	7cErunI3iO2WgpoNICdFEhwKtpC/BP8+lecOSbNvBeV82NSR3Lx5JLXAGIeBXnBXgUE1WojI4udkR
	8q1ZVmvyjuLG8j6rn4xWois4z+JvJGKfGKwx39Nkr8d3yeAIJ2sulPvCMhICgKTBKlsUsSf4NsZL6
	2uBOHCrWxwHihPiKe6NYnB3YYcsr51k3G1YXc/nQtCBPaTSYNqRzNSbxN2D63pZ8VeXjd1kL2ZnLW
	5cIHI2s686C+O6P9gIuhAByzXN11rjpyyeBvAgXcOUAy1SR/yx9gBIPFdhnpBK9UH6/AqwwUqxqYQ
	VGuGGqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMb-00000001Cj2-1Ulb;
	Mon, 28 Sep 2026 17:42:05 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMW-00000001CbA-1fEI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:01 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48879e03053so47493f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617318; x=1791222118; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbjBREz9vOqId6KGSe2hfelOhYq7OUN6jgn8hmrgsOA=;
        b=JinuZSx4nutXxcJ1prRV0uH0GkCRFFXjRKhtpYWdSpq5BNXy4UCV/KZTqvmS8G97hp
         8klH7xzhHL0CZxc5SnPNymoQxkHUSfJgEqQe1SeqqP8ReNXIWcR2nc2r4Ylqe1oIPWf0
         C68QTn3C7SPkOsx0/gCt3Cuu7D3ttgBTG6mUuLDfysC+wA9J7ZVAVKpDPH/eiaRUIhHY
         oZgAlFNLoALPLXJ+6SBf/nOE3SEtGqa2CN6V5jUvqg3vqmRRAT+4bSbnXrzf+bxPiqDV
         m5AyL+c8yCqVVAIrHp0+Q7q3rrqld4OvB3k3LF4ZW3fswQ+p8F0SyCVUwDT0uT+oUhN5
         hFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617318; x=1791222118;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbjBREz9vOqId6KGSe2hfelOhYq7OUN6jgn8hmrgsOA=;
        b=lQK8ssa5Pw7rbm1XdDtuo3wilg7/XOkFJkNRJSsP8toShRrqyY8W6MfG33nzWpU90t
         JnwVBP3I7E+ZxUU0uOcI8Wg2Dw0911wU3/811fzbWCBxbDrC0Aq/eoQsnta87B0QT0nF
         MpPRG1cym3qvdnU1GDhVRc78LPusjVSF3QpQDyxAIK31eV+ojUB8xNYn4EBeTEhuihyG
         RWkEcpXNE20Rb+MBfGyH876GptlTjsqcfQurKSluueul58alKdQbK8+BxiBKoKR0jO3v
         U1pvAT4ajHib9edZSJG73cAds0FjY8rNfqgdYUSAmQCrskl1AJlyQuxE9A8fcdyQyMYc
         Q8cA==
X-Forwarded-Encrypted: i=1; AKwUvBwGuvT5h7EB9AfeuF6p4HT00BDlajGOTEOf0JKgyjLa6RYt2Rho+HvkdzZ/2iZrbrr09ZMBf/IJo6XTAXXJbdQ+@lists.infradead.org
X-Gm-Message-State: AFuF++lfVUadrvPpkljcfEfaqDn6Ih32juWAqOMbyl8iz9J+9haFLMwQ
	Tf5f8KBxgxR3gc5GxnxXU+izxd2oHqrb5Yfsg3Sqhb7Kbi6KbOc3e4wj6xsV/fFrOLL2xnG2fFP
	rn6icfgh1VMdf/g==
X-Received: from wmdv11.prod.google.com ([2002:a05:600c:12cb:b0:4a0:8ba:ba83])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a00d778efemr1664475e9.14.1790617317905;
 Mon, 28 Sep 2026 10:41:57 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:16 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-10-smostafa@google.com>
Subject: [RFC PATCH 09/15] arm64: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104200_456458_80E3D10E 
X-CRM114-Status: GOOD (  12.20  )
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

stacktrace and panic functions assume that the kernel stack size is
THREAD_SIZE.

The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/stacktrace.h | 4 ++--
 arch/arm64/kernel/traps.c           | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index eb18d7cee62f..cbc93cf213a7 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -41,8 +41,8 @@ static inline bool on_irq_stack(unsigned long sp, unsigned long size)
 
 static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
 {
-	unsigned long low = (unsigned long)task_stack_page(tsk);
-	unsigned long high = low + THREAD_SIZE;
+	unsigned long low = (unsigned long)task_stack_low(tsk);
+	unsigned long high = (unsigned long)task_stack_high(tsk);
 
 	return (struct stack_info) {
 		.low = low,
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index ce0e213d772d..b91b154843ef 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -902,7 +902,8 @@ DEFINE_PER_CPU(unsigned long [KERNEL_EXC_STACK_SIZE/sizeof(long)],
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far)
 {
-	unsigned long tsk_stk = (unsigned long)current->stack;
+	unsigned long tsk_stk = (unsigned long)task_stack_low(current);
+	unsigned long tsk_stk_end = (unsigned long)task_stack_high(current);
 	unsigned long irq_stk = (unsigned long)this_cpu_read(irq_stack_ptr);
 	unsigned long exc_stk = (unsigned long)this_cpu_ptr(kernel_exception_stack);
 
@@ -913,7 +914,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 	pr_emerg("FAR: 0x%016lx\n", far);
 
 	pr_emerg("Task stack:      [0x%016lx..0x%016lx]\n",
-		 tsk_stk, tsk_stk + THREAD_SIZE);
+		 tsk_stk, tsk_stk_end);
 	pr_emerg("IRQ stack:       [0x%016lx..0x%016lx]\n",
 		 irq_stk, irq_stk + IRQ_STACK_SIZE);
 	pr_emerg("Exception stack: [0x%016lx..0x%016lx]\n",
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


