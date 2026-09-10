Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D7C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=; b=4j/NcDwiX17hlBX5vI1neIANM+
	G8tM+ucZw/IazOpnHY4CZQgk30tr613CRwHhL/vgtBIgx8IqEWMsjnNbTvQm5Tz6HaMblvbfBctCo
	WTLCSIoLhF7LV5f2FeNrmBF7IQGFpgdr0K2n7FYx7wdKvuRaEGzToWJMMYXfspeZ2BV/OB/qouU5f
	mQxxQB1di4lcg/p34aGxuCQz6SMEUnixWj14FSAXbSSTYnIW+KS44ZC5GG8EfByaNZiRMQN880YRp
	1CJ6Wh+y1o5nFRkWai27QHVZmeY0sB9MSDD1QMIY9iRM+s4xBRCGy3iFMXj1wTpod32IVsAS8s4tA
	wACk21vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrw-0000000FByK-2k6A;
	Thu, 10 Sep 2026 18:51:32 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrg-0000000FBla-2AKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:24 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-92ed3993c1eso258485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066275; x=1789671075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=PNWaBbnwRMIL+tQwJvR07DCibgnfy0ykZq2FCHCvgLkL5Lu4/97TRB9S6MK9MjofZm
         h8Uy6nkRVgePouNNII/eT6+GtysLWPM+qDFv+1cfEkvTDUHtlslvJF0WXP2RWj+hjzhE
         1JVaHvY4gYrizuy8RjGsT4NtGHARlL11P01hukop+m1YeUXLanDMwLrAjJvgRrIRcLCJ
         vPYPap1JnYYwXqBliyNwG+FRET26yst73dS8Pt6MMzmfhRxAchaKLWWPSrlrZnyIQrPS
         sjAbYR6s0/svPEC02lXYK6PxfAufOWgx0TrC1PXD4qgLcUOVU5DmpXXI9+ydOnJm9JGX
         Pugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066275; x=1789671075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=nWyhoiGwmTUHnQs3vBbay7jZj1T0iW5GMPNs5vNPLGuqYFmKeosYSOih7YRBC2eM3S
         YaJQqXTQz4d05VKSha/WpikC0B40TJT8KRv5Fh+/+8HixWGKe7hvZpBc54TETtZljyVC
         zD50JyMyTfehLh6onX92qKmGx3L79WUWjUSeGpfnipa9bdoieFcFLODXn96MYKR2uvA4
         QZaY59FFn6Njm7lg89Hwjwk6u7vnP4eQnpPTnolezUrC4oyug+7QlmstGiIVtiqEPRNg
         KnYSuBhnO8+kG8nNseqdbloosGHcTpAc8Lllkf9qNd3bittqjf1y/+zBtxeuLZEfiSW2
         uIQg==
X-Forwarded-Encrypted: i=1; AKwUvByp8vcQvyUhqzcyfTsP0ZscVRLscGioZSiX+E/2D+IrwdZ7qkRZcSG5tQkfwT/BVJs8UJVqoAIO5bi4d5CZRAAK@lists.infradead.org
X-Gm-Message-State: AFuF++lqKskDwk8GRTTES4OJ/p5Bnvx5LrIFNj4iMW4j81dV84nfDt4Q
	NHcNo3udzv7agwNt78w9/eCJd1WezggocloeqMqvYJVSR8+SqydaJsJ1GyN/cku+W/YM0XNgLLw
	HWdftxAQ=
X-Gm-Gg: AYBFou0bjBre2KFrBd7SoBTRS6p+dqwPyRyWpPdhRozEZagAky35ZDdb7uCx8shNHCt
	yyvYyvVYgPM03wk34AMBvdtluKdaYgun/hqjcCJEV5RJRAFm/6dX5Vz4jLFBSKmtqhR/CFMuBZ/
	rf6UB8VmH9784ILnrQKDYgLXY0gR4ih9onuGbKSIsq3T1xi7BMQjGBA9UZX3Hi+Ogy8xKVGSTy+
	1E2+t4a1C55fD38C6vnlg5iFlwmNK9ON52B8/YbO+y0Q3uHwVkNTWvpjHztYpaWNW8NX5JFZDzH
	jnRIU/Y033D/m0iHAKw2KwB66wkMh+sTuzdGWnLhDIWSPtta3f9V30MsQDHoRcqkOO+T0ZmAtQs
	DlZNDQ5FS0VuFQ0FAhb1wp3y1ap52litaHZ4R59ttNU+d3vjyuCRO4t74Gju0GWLtDzzC9Zfs2R
	xo0gafZ8qEkfHSheE7NsWn8kZ7G+V/EwQbl/OezC1ZYswNQAKLR65CvTgT6L3R6ac60jTdDzlUw
	1O71Ge9MOiKY4eIDHfrDhy12+2y0vtXyioFjtdzBCbFHQH+bGKmJXO8
X-Received: by 2002:a05:620a:269d:b0:939:6de9:208b with SMTP id af79cd13be357-939ea2b3827mr16779985a.48.1789066274997;
        Thu, 10 Sep 2026 11:51:14 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f184f5sm49053285a.15.2026.09.10.11.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:35 +0000
Subject: [PATCH RFC 12/13] rcutorture: Bracket Tasks RCU readers with
 trampoline nesting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-12-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115116_607469_FD5D7676 
X-CRM114-Status: GOOD (  13.81  )
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

rcutorture's tasks flavor models a Tasks RCU reader as "any stretch of
kernel code", and rcu_read_delay() deliberately preempts inside it to
check that a preemption does not end the read-side critical section.
Once preemption outside a trampoline becomes a quiescent state that
model no longer matches what Tasks RCU protects, and the readers would
report false too-short grace periods.

Have tasks_torture_read_lock()/unlock() raise and drop
current->rcu_tramp_nesting so the reader models a trampoline, which is
the thing Tasks RCU actually guards; the deliberate preemption inside it
then continues to be, correctly, not a quiescent state.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..df6dd708cea7 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1144,11 +1144,17 @@ static struct rcu_torture_ops trivial_preempt_ops = {
 
 static int tasks_torture_read_lock(void)
 {
+	/*
+	 * Model a trampoline: with CONFIG_RCU_TASKS_PREEMPT_QS a preemption is
+	 * otherwise a quiescent state and rcu_read_delay() preempts on purpose.
+	 */
+	rcu_tasks_trampoline_enter();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	rcu_tasks_trampoline_exit();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


