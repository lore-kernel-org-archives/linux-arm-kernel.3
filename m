Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D22C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4ulFTvDAefqAdJc6TUbpR3GW4CR8A3NjhobBVG3Dsg=; b=V+1poi/h1DEYe2PRq4xZtLPQWh
	I5woD7g9MLBfwad5zOaV3rJhfYWfEhMeKKRn5Ov52k79EmRiB5NwT2oM1AgMtdTm4nx2g6e/Pp3S0
	yoQ7tJ/vAW2kLHJKn9rjs6eaoxSwMOouTePbtezdyiY/EY4hCge8KQRDpr4trVJ0vkMvHbZsMrW07
	itFB0Gkn9evYe7ExblIApEYMwcmT8SBV6AB540qupI3emkc3oRq2Xkq1ZAVg6I7ob30iL5pLy2Fh2
	WZWC4Yp6zUTaR9jMsGrF2DiQs4TDc2fIOPU3ORvmZEok82R/mp0aomp3KvfPaKWPcvOzws4ez4C5J
	AVI2PuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texH8-0000000FdgV-1dZM;
	Mon, 03 Feb 2025 14:18:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texFm-0000000FdMk-40mf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 14:16:48 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4ulFTvDAefqAdJc6TUbpR3GW4CR8A3NjhobBVG3Dsg=;
	b=qolkE9Wo1YEPfFcnO64QkD+SJyUvuAh/21nheTEdSJz1Aqc1+H7HDJ1/LwAbmD6R3kT0fz
	NSuJbmEnfOYwxmy2MOga9jbOkPg39EBpryO5d7HZCnTx6KJteeY2Kw2LowkhkQ6MqkiSTP
	zAYkVC1JQGc+E7kFBIZ5Y6m6ZV12pK85U84MyvsSy9tbf4+HIJGmaVqfeFIAgroW9iLDdT
	ffDETyunDXAHTDDyeqxVsYv5WBFNntOuzId4ftexMqb6O8cOXLuskiEqpUm3d1t/lOuWzB
	PdgAFi1PTvF1xEi7HHC4Z+DIHL8ze/fRiv6bKwQMac6LpdJM0xVZZM9xhwhYsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4ulFTvDAefqAdJc6TUbpR3GW4CR8A3NjhobBVG3Dsg=;
	b=XCGcyddBg5I1tIU9Y/XRDUleszWy0XkjidrAz2iNusl1veVDgUwbxRAj5j58BW479NuOAZ
	lqraoF4mk2MWsSCg==
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/9] arm: Rely on generic printing of preemption model.
Date: Mon,  3 Feb 2025 15:16:26 +0100
Message-ID: <20250203141632.440554-4-bigeasy@linutronix.de>
In-Reply-To: <20250203141632.440554-1-bigeasy@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_061647_138305_8D5DB333 
X-CRM114-Status: UNSURE (   9.91  )
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

__die() invokes later __show_regs() -> show_regs_print_info() which
prints the current preemption model.
Remove it from the initial line.

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
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


