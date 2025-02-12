Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28863C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPAQGfBR+7S/RdiEr4MvqW7U6iju3OPPUWbdJGl/f2c=; b=2rizWmRlUh+ga8AcXwQcz52OT3
	HY+adW9YOZFz4u1iQP982ksvj+GVjTGzcnF4eYR3Tcvtz/jnxgP6iGQi6Xi6mXbJXHFspfIdQoIxs
	GvlslJHWYparxC8l5oUEzp42wbQS7iCls0Er36SyuygLTPPtUFBDKb9nLGPB1HHefywhceVHziJFb
	1P032GLSMcGZoz92tLe7K/KBryxbndxglPMmoaWluJuX0kq4cb39x6kf7s4N2Rx/QjLlSjg4Q1VdJ
	K5/QTbJtBBhudTCSxQJspELBAnY4Qo03vudUVDR+nVASwqK943KsdGp3BYMQY74R6g28DgDXTaqI9
	ntTFmzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiD14-00000007Wgp-42AE;
	Wed, 12 Feb 2025 13:43:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCzd-00000007WHb-1rYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 13:41:35 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739367692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPAQGfBR+7S/RdiEr4MvqW7U6iju3OPPUWbdJGl/f2c=;
	b=JNDd8HRVokzNTO33bNqU1bUc/i1QR+DFcOEm3uhqyR48gbfX2iGQGW9FzaSr95pJQceVD2
	yzacZMQ1BdLBqJJi+Jza6UXaeQvnJdCZymPHT/39oERnv9ppPlm7OjfFM1P24y2KqYs3Sx
	IR5sAZeWoZI7Umj3eR5I3ejOcmC0W3SBzeTnBoiGu84WcuVP15sD1Eb3wt15aRLzAjtnmw
	itjMbYTTZEeebtSCgpC8J4u3gDCUHqYV6t8nj5nIHilxxP2VJ7A4/I2nu/92hjxcg1QwuN
	LkBjE3v/ZShiJH+We+mUNXGlVfsOIe123PNnxr0qOhkCgzDebGIs1sLBcOPlAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739367692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPAQGfBR+7S/RdiEr4MvqW7U6iju3OPPUWbdJGl/f2c=;
	b=id4yU61IgYf/Oi5G8elGNQM8xDxXQjxw46D1/+eX3o02qLQVUBdAHmF5WFkn1lNNRPPbn8
	cdCeIaDSso0k4KAg==
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
Subject: [PATCH v3 4/9] arm64: Rely on generic printing of preemption model.
Date: Wed, 12 Feb 2025 14:41:10 +0100
Message-ID: <20250212134115.2583667-5-bigeasy@linutronix.de>
In-Reply-To: <20250212134115.2583667-1-bigeasy@linutronix.de>
References: <20250212134115.2583667-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_054133_612030_50B4B681 
X-CRM114-Status: UNSURE (   9.45  )
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


