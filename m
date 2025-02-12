Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4FBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOJ6enYCkPU22iOJZTCJZqAozur0MLmISBOza/iKcGo=; b=3eRDRzQSqJAWR1hBMt3ZnRkqdA
	0MM9kKwpzfKWR7AvazNZbDrMhw/te3RmMFBRccjqpsKaCt41QgtB89jeyjmt0wO2sLcXUyj4t9dKI
	Z9w3mPJBM6Cl/W+ukmc0XuFSBcb9uEnsBBgnQZsrp3mjZMK5/gTn3wCyOnPSb/njVQuBe8rFyw7tl
	S3seVLfsC3I72BC6niD9LO5QsS/fryr4QTU0wDYIuaqTNjCCUQ+hPOps2KrZBqjaiVrlEY7/tcoGP
	HVcYyPfhqU/Quqz3V+1vmUyeSYb88fPrVmaEntp24c2RfvtcMOX8T40V2IYLXkZ9Zv1TT/PAv4Zxy
	jqfXRvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiD2T-00000007X1J-2e44;
	Wed, 12 Feb 2025 13:44:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCzd-00000007WHY-2UlI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 13:41:35 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739367691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOJ6enYCkPU22iOJZTCJZqAozur0MLmISBOza/iKcGo=;
	b=Rv8r6wmrUoO/pZer34XKpr1kCCbgu2Rt4MjHLuft/CEk7gDDI32OjCLwKWJkP0WOA0lamu
	X47YYHP2JLK4lIxLA2666WlybKCGKI61YcwqxLm6SQMtShwy0fFBNi9x9UbeRBh5FeGbJ2
	7G93jGhDw43KI7oADe5AwEul+kL09pLyERM9leGY5svdvV6VxG6y0yyIm1iVttf0ubc7zC
	U6KaWcpyDNfTR4ZKWOoRhU2uip0HcqEXTie6T0edpAw7krwpMtEStbNyFq4yQ6v0l7gAxw
	muthreaqUu4GuzMAy5ZKOMZxjJuO5swtk8CVkdr0XiK4X2WryVZgEcT8yDnzjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739367691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOJ6enYCkPU22iOJZTCJZqAozur0MLmISBOza/iKcGo=;
	b=MIBZJlexFvikmZxiu8No9u3DMBGhsxLAZpuLGCPy1nMydc/U7rwu2B9x0p9wLDdlV1hh0l
	VvElXthLzczEbhCg==
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
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v3 3/9] arm: Rely on generic printing of preemption model.
Date: Wed, 12 Feb 2025 14:41:09 +0100
Message-ID: <20250212134115.2583667-4-bigeasy@linutronix.de>
In-Reply-To: <20250212134115.2583667-1-bigeasy@linutronix.de>
References: <20250212134115.2583667-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_054133_769132_6B7FEA5A 
X-CRM114-Status: GOOD (  10.02  )
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

__die() invokes later __show_regs() -> show_regs_print_info() which
prints the current preemption model.
Remove it from the initial line.

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/kernel/traps.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 6ea645939573f..afbd2ebe5c39d 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -258,13 +258,6 @@ void show_stack(struct task_struct *tsk, unsigned long=
 *sp, const char *loglvl)
 	barrier();
 }
=20
-#ifdef CONFIG_PREEMPT
-#define S_PREEMPT " PREEMPT"
-#elif defined(CONFIG_PREEMPT_RT)
-#define S_PREEMPT " PREEMPT_RT"
-#else
-#define S_PREEMPT ""
-#endif
 #ifdef CONFIG_SMP
 #define S_SMP " SMP"
 #else
@@ -282,8 +275,8 @@ static int __die(const char *str, int err, struct pt_re=
gs *regs)
 	static int die_counter;
 	int ret;
=20
-	pr_emerg("Internal error: %s: %x [#%d]" S_PREEMPT S_SMP S_ISA "\n",
-	         str, err, ++die_counter);
+	pr_emerg("Internal error: %s: %x [#%d]" S_SMP S_ISA "\n",
+		 str, err, ++die_counter);
=20
 	/* trap and error numbers are mostly meaningless on ARM */
 	ret =3D notify_die(DIE_OOPS, str, regs, err, tsk->thread.trap_no, SIGSEGV=
);
--=20
2.47.2


