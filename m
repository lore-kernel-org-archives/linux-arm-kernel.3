Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772FAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUmCwmW08CUlGez91ObC9mBwhMIwUpRmBhCO7ubM414=; b=Phs2d6hEKA0kI/Zr1jQGtFBFqz
	5wA7IBOZNB/cSspMvXQC9q7oMy+MW+hr8M6GrkAvEv9FIkvG1WOGZr0N9t049gaiegbO4vdqwmBhk
	mrLbjJcfnc0L9CqKbQlD5oTnHdZowyv5uLQuAZYpuNmxG/y/F6OxfXHgizAiq1pOFWuAR2h7Q2UoT
	CvkOnILqEEtBilB12rDbJhhfyTftHesUbLV7eOCbujLHYfbtbkMGEStQhybydFtKeQnI/QkAeNXAh
	Pz941ygB579QyJM3kul4eKebZjgwxt6v7sFyjnQmYN3dVzOjrRUkGsEHmcDtvZ7iR2we/k2uw7ajz
	lMkEsQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7f2-0000000Ehnd-1tQh;
	Fri, 14 Mar 2025 16:13:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7a5-0000000Eg90-15wP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:08:19 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741968496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUmCwmW08CUlGez91ObC9mBwhMIwUpRmBhCO7ubM414=;
	b=CRDy1lqAGtDW+JG/zhQo2hI2v/UAgh3ORFOgjKP45KwnFP1rT49KzKY/J3crWLpN4yHLxU
	BTL5F51HQCU7M1YMo9VuWVy5wyJ72MCnfio7/olA/BBM7p65uJ4IUQHDS8d5maX3ck5JgY
	iVw49MwhAUb2LGq4x5SSThekSLuCUk6Gkqh0/C5l+3ohrpt5ejZU9X8THoEg+YwBosqnx8
	1Yj5ntUWibetqA30qK3Nc3248MmUnBqV+BuoZUg4q4Pw81kMJLMbJHEqTffkWlIM7qwFWX
	j9R7xLusIUUW0QBYwho1ZhCvAynOc7YEEF2nW2hhMjKbqYC1MFGXVG6fto4l+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741968496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUmCwmW08CUlGez91ObC9mBwhMIwUpRmBhCO7ubM414=;
	b=A/TyYnpxt9kTOXU5xGGtNrsvn3uyfHMkD6NKJsuf0LNWc4Kb0oD+2I0R0xphQWcIqym4xU
	XdUUWguOXGWBp0BQ==
To: linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/9] arm64: Rely on generic printing of preemption model.
Date: Fri, 14 Mar 2025 17:08:05 +0100
Message-ID: <20250314160810.2373416-5-bigeasy@linutronix.de>
In-Reply-To: <20250314160810.2373416-1-bigeasy@linutronix.de>
References: <20250314160810.2373416-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090817_443641_E006058F 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

__die() invokes later show_regs() -> show_regs_print_info() which prints
the current preemption model.
Remove it from the initial line.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm64/kernel/traps.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 4e26bd356a482..529cff825531c 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -172,14 +172,6 @@ static void dump_kernel_instr(const char *lvl, struct =
pt_regs *regs)
 	printk("%sCode: %s\n", lvl, str);
 }
=20
-#ifdef CONFIG_PREEMPT
-#define S_PREEMPT " PREEMPT"
-#elif defined(CONFIG_PREEMPT_RT)
-#define S_PREEMPT " PREEMPT_RT"
-#else
-#define S_PREEMPT ""
-#endif
-
 #define S_SMP " SMP"
=20
 static int __die(const char *str, long err, struct pt_regs *regs)
@@ -187,7 +179,7 @@ static int __die(const char *str, long err, struct pt_r=
egs *regs)
 	static int die_counter;
 	int ret;
=20
-	pr_emerg("Internal error: %s: %016lx [#%d]" S_PREEMPT S_SMP "\n",
+	pr_emerg("Internal error: %s: %016lx [#%d] " S_SMP "\n",
 		 str, err, ++die_counter);
=20
 	/* trap and error numbers are mostly meaningless on ARM */
--=20
2.47.2


