Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73BFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrwuML1z2twiI5Q1nEGmeclGfRZJCdzNfx8loT/6B/0=; b=zzE58Fq8znsWUXcNGdYzx5LmbD
	6T7to0gd1wwYLSEJSZIkNv8yUrw63JZhe26WyEU03ouwtE1kBZPd2A1WlFqs3aX1k4oi0iNwu1+UD
	jgBX7W2DzPm1i4xPM0jFZS0vkzGawoGJHRd6S/28CkOnthNnVxZSN0DxK1JEvIXGCscqPQAMQjNRE
	qPbrxwtO+MCGl8cw6D9YbUz8YqDHWhM+Wajh56SYrOuDzI08gFjTXb8EKcm1T6rnBY92LpP6NjJhL
	gFdvzQ760X03j/2WEDwcLPuIy2I5Wy5rFeOl62+a/Lnz2JfVzo5mtYHScRP1O/c2qS1OXrBgQCSfx
	ZmifuqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7gh-0000000EiBg-0mSG;
	Fri, 14 Mar 2025 16:15:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7a5-0000000Eg8t-1R61
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:08:19 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741968495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrwuML1z2twiI5Q1nEGmeclGfRZJCdzNfx8loT/6B/0=;
	b=aMFZNY90Z0dXVUWrnA1h5MtmXPZonTKvrxZ26VS6PzBDzM3GopweafZyKULHQUFXVJrwm9
	BSq6p46jeOijyzXP2X11epJ+bymVgF/Qzr6f8s0GlO9ZZmkRDz9s78Hpf9xTeh2LNe2Mkz
	qSP20ur7M9+oq/4dhmc9xPHCJG81LFORMD+4IJ5wcjF9JNiHlD65RfGTfoYJycDIvLjvpp
	HGdO6tu5RrtSb0QJLyAnFFTSFuHKLnSh7jupe8aAoJch12azCn847CU9kU/OKMvQwaGarQ
	hdsvD8G3BpycSfQr3sftwWQN9NL/AJXp9Xb4HdxM/d26+R2jYYmaJURljyP/HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741968495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrwuML1z2twiI5Q1nEGmeclGfRZJCdzNfx8loT/6B/0=;
	b=85Z5yYFKpXEcc7cTMq9arCtQDW4e2BjP5BL83TyQES2bWnCHqGaFuImRqDpM+corO94Gee
	v07KEql9v+Wd25Bg==
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
	linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v4 3/9] arm: Rely on generic printing of preemption model.
Date: Fri, 14 Mar 2025 17:08:04 +0100
Message-ID: <20250314160810.2373416-4-bigeasy@linutronix.de>
In-Reply-To: <20250314160810.2373416-1-bigeasy@linutronix.de>
References: <20250314160810.2373416-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090817_581977_75B17FB7 
X-CRM114-Status: UNSURE (   9.17  )
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


