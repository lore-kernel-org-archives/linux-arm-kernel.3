Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63964C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=; b=iMWxtshe0C6xtwBhnJe60oMokO
	hdEw1UW+irbxhGXSAf74JpvmH5HNF+nkuvWhXIlPtYxYPsFKjHHkh33dhqKLOclwh5oawlUWqQ2hh
	3e4gjIq9C3J6So6gyabXHbevEeXTDM0q3xikkOUYDLIgvzPsIDcHAE6Hf2SNWQy0gpFllYGh8sttm
	ooIk28F2Utap6TXD1q9rgznxznhp1qwLzP52e/QHzZ4FvIwKRXEoZdjKydwL9EG9zgB9geZFK3MWp
	z78MY1CTcNKCVj8G3Sy6NZ4rMlL4VPwDSgzRSIBoPRootjPPAKLxYztiePFTNLO4NFCh6WDsZADPn
	r4aoXGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrS-0000000FBYM-11Bf;
	Thu, 10 Sep 2026 18:51:02 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrL-0000000FBVp-3pkt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:50:57 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-90cc39e06bdso569056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066255; x=1789671055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=BauBWKsoy7T3rNVvGEasalZa9VM1+o3D+2e1bbkauoOS4noWP84wl/bIiQhyrkT8pU
         Lh5CXKi97umwW6TQICsqKcJBHSOMZtZ4rfFXfeo5YmZQTvLgEDOi0ClHpFft9Z0C53mK
         y0GOeNRmsPwZgxFVNFm+Adqa5VTKXzfh6gPieFpv/88+p7U+K3LW87oC/6HQfaKdBnvR
         Xe8eo5Lf5wY9qbI+NEuMHZBRSFwcTGFAG/UEQ+WYQpRkQksAxzXikE/m4F0vOqElKN+7
         5dpL9Wqvlxg0zKs2puLNwzrKpjdL+cCxbteigurPXguDxqCs0w2SV6wcLIZwHZewLfgh
         Eynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066255; x=1789671055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=ARn2PCZET6bHUhn4e/0QKuUHvTwEp0r6gmwTSaRNVYwLU8YajRa/JsTslbwKwpNawo
         ycX+fio+VIk6Mdg8LAAiVY3FKQCqoHxarA3DieMwjdZ7/UURIhks4z43PLwOZWtAs3gt
         DjJO+BKfnIcj2gIKsPG71cKOJDHiIctxDyGFkGj3Bhs/7jGcCGiBMODDhNiuuzmDLQpk
         YUDUTj4GUVsBhVZBjm8WXcBe+O5sXbT667W9XB17ZTQl8WQos+l8j3RDoarbTsIKVucC
         APqlV3eHQVY3UbHBWvALiqMVo5z049e5y2YYNWZPILxGt1fhYhClpsxKmNWdX7y8vog7
         J9sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcjee79Gxh/75ycK0sLSmznB/ssiGvpAK4SkTUWE81IBUeKOL/6W+twEaE/UHMYW2FiWb0C/Y5cqq4fRdsF8p5@lists.infradead.org
X-Gm-Message-State: AFuF++knD9TJf64om6Phs661l4PowearrXyXHbH4KlPDJVIKMCJxufIP
	S2tjR4KODkT6OgHglvAgc63HYIFoC1EJuOe9QLQEzyE93+vf8wwST9XMhcu48yn2c9I=
X-Gm-Gg: AYBFou2irYzaMJRnSgRfDY/N5F66v2Araoky6bUkduYYtL/2+uXBtOkwU8Ykx9Zxsc4
	mBueANWGOONjurIU6q4P3ymgZ1nZPARssLcAQ96Cahvmnv10rcCgzx5aeQzhXgMfzBobQfQsCM1
	wrcl3jJbdmp8N4lA0fjuKrMwDWY3bQy2isMEnNLlA75ueitNaJjttYLqKgGVUV6ZTsAtvb52QSz
	UZZojS/t4TR/1yVPuj3OenpFJbzs0tNWnnJnxqtNNhCJ3av99gfuMRWw9f3mcHkhQ6Gm86hdTwo
	nzwEN2hpThsM+yzidEedaLTduBeBjRHr1aXOiw9bBuW7t/hTo/YAkaoaZKz7iJY9DG6Q3PnLo8+
	ha+NDIBR7OjxbZkRvHuddRaF/PZAxqx2rSmWYGjYGbpRMOIpfNLxdxouapjrRC3V2+hKncF4LwP
	u0Kcl2OmJUUaOHg5DlbjiXlLGNHs2sjbey6CjUZRfTc1B4hO9luXjyK9HWlfV5i0CpmfR0plgqw
	Lz+pBuatP1YmYYOgYgHdm4Zpi2mLFLPBIdbWM4hhA4kNflfePqJzEt9
X-Received: by 2002:a05:620a:280d:b0:939:78ab:3c5f with SMTP id af79cd13be357-939ea0137a8mr26249085a.9.1789066254480;
        Thu, 10 Sep 2026 11:50:54 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8bf9d51sm34965885a.14.2026.09.10.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:53 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:25 +0000
Subject: [PATCH RFC 02/13] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-2-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115055_969888_F1F2F000 
X-CRM114-Status: GOOD (  14.87  )
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

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 12 ++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 8da571622000..fc04725ae46b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -348,21 +348,21 @@ typedef struct irqentry_state {
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -467,7 +467,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0


