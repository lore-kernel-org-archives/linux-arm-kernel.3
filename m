Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDBDC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=; b=gi4zYp6KBGr4qZy5rq8LRpxBAR
	UXE0LtGsLashpl+RxsVB7KdJSlDATsvAIDa5GM+PDEEuYkNnnb65OoyIQ24d1zYwzy+fMg2fMRaCc
	Q04lXm5oZjoE94pH6dXEt5mVeh6BtducODAzsZodGm+JPAsbyO9dZsGpq1m5Rk4eT0jGZ4PjFFWQe
	aBjvC2N6oYKB62EzGlmfJXa8w+ZJqpfBJR3end9R1FvA0u9jEJExDZix32Kq6OR5UbmHgAbjhC3Sx
	NEXR74ulqM4c0uKjhMDT3gDuQkgKdpNG4n0rtSAN/rqgrK5Cp+sml/whtYqB+VweY4QGTIm8w7B4T
	73a8xCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xp-0000000GrjW-3GW3;
	Fri, 11 Sep 2026 14:10:49 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xO-0000000GrQb-2gk5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:24 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafddso76693785a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135821; x=1789740621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=gRUALtkyRndTcxOeKGRjYVr2Mw/0U2aCGNGPqUtKofM56Q3U34xFBL4KD7x0rArM1a
         BK4rpigao4nUk2Rpdd+7to2RnoJ2WqY1vazKkDnJ02gxxd9qWFa/boF+LAc47h32Dy//
         gnG0W/rwqtnQoVw4zBno+MXxfxgS0OEchpvtdo6QnGM+LYj5V2WnGzLAHeHqHWGDZ4C5
         alQywEYXMe0YP+y16oCku3+7jyh2i0xoN0IEN9cVVULbw8zl0Yge3niG34ppMaY3J0BD
         6cuFC2yMcWZXuyNwasPUhXz+iorZPJfRvLoCHo+gLpLeZK0FGy+uDB++AyRGYpZTB0jF
         aFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135821; x=1789740621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=nfjeHoeNVH7PWGSgJUg+p9E+2/mvMg3rsWhqUjt2snFyGA1bO8npsp0KBSC0SVl64w
         RiPPwBrA1fcnXGtLgi0nUyB51cO3IkDCThA81Plkieocfy0wopfRTdIpDQNerTyJflT5
         yye0IZnCXScNPJcAqr7uf1sb3XkyFR4k4XcS+qaXfB6D1iNDwlQxQySrg8zc32wBX8Y1
         vHzmRMHIDL5ZSnIvSqsE3IZdGrXpUn3QbRdxnfs1qnxeuEOT6seHZNDcM4eo43po8sQO
         JaKz9Svb5+dohEBGioNfGwQKokK5ttimRrRs/DL0SHwNyY0f8TQ23ekOD275z21Zpnqx
         Nw1A==
X-Forwarded-Encrypted: i=1; AKwUvBxOEWg7MP/wV4yGiwoNP2AmjdqUSkS8e9BHTjrhy7YTPIlECiFJRmAkf1dmPAoLRjLjMnJK4BqqFxqFHqWuhbw8@lists.infradead.org
X-Gm-Message-State: AFuF++ncn/7gi4rFuUewWc8EyA2gWc20JYx45v3HOvgx138Ioc1TJglS
	2IC0GrBz43KVVPdhIq/GA0fbZXv+H2VK9qqc4szpLgw8qj+Z5ea3EOKhyYvNX7yeNJ8=
X-Gm-Gg: AYBFou2G0r+BMBLbl0zJHT6IWGc0ZqkQVP97bfFVHhabA+vGuWpRXA1PTPugkBKmegU
	5Qt7FWJlddjpLgRNzrg4SHGk8e0eqBgADBb4vtkqr98wy5w08EjsHpia4mDk/BKWRwzqSZClxEm
	/TzkxDskHBVLfJXeqJEIxsI4IIFIq1PCdrgRkdvfk81n3nW+Y1LdsnkGY+BQYsIaD0eOQ5vIWZ1
	JSYY8v9yxKybwywiPmod32ze70fd7fZQveQGeY8+oyK1Y/2++/kEIreC4Y8cCUvAdw4abbb3WUT
	ODJI/U+/UZ11VMra5bje0ocNbF8zx69zURKEbYEDC6q0Mmp9/KExaBLo9dwSsjY4wLuEVCUUABK
	9FYLRz4mTHHW7IwbddHXvHSgdWHYYuA+vO8LbCocujQhTHhxsSfZYwvj6KsikCZGDoRbhviVjxK
	v+k8uBoJlY1OvDMa9BRV9y75kEHnICIocH6S6lJuiMwMu7NqK5V7t9wfcIPzFYmeyxBt4r9OU9M
	CGT80fGZizUu8tqehXarKvqQn9B20gbJJIMCnMhwrFvMvSnm1HQLP/r
X-Received: by 2002:a05:620a:690e:b0:939:639b:2e1f with SMTP id af79cd13be357-939ea04922amr525733885a.7.1789135821311;
        Fri, 11 Sep 2026 07:10:21 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80dc002sm248697485a.39.2026.09.11.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:20 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:50 +0000
Subject: [PATCH RFC v2 12/15] rcutorture: Bracket Tasks RCU readers with
 trampoline nesting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-12-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=1492;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=c9hUQ9kAAl2b2IbncqDZq1k2ejJxuc1g83EyvfAIkis=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDpeCdAsuDTbsWwi8oqAy5KN1IjS7Ye/ysM/qLEJAJ0SGsvHuCkttXUFQ2AlX09A0IwbwXmGUQ4
 qHaGMzc7/Vgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071022_689906_889FA8AA 
X-CRM114-Status: GOOD (  13.52  )
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


