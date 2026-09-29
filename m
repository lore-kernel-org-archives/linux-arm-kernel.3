Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B53CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10AkfjFtGJtRfJ5s0PO0ROrjcvpMjCKxs/Q3/9Rbmqw=; b=M/KfVwdteEV9AT5nJKByVY9Udi
	W+oBHUU1fjwtsAm9rLQWRggQCrLQCyxngEQ/3tN8/Nw7Hg8FiOFKntJoVtQeBSUiQXpZhc6zS0YAj
	ASzW0YLsYL1W2VtuYYjFogn04ZVHCgS4u+5Y99hK75domJZ12ighxeEU/xGoZEVPVCAe3tt5xxtrF
	zgu9K6v9pUiy/Lw5oeiJBt2m4Zjvj0yCV0qA6cdv6BSIwg9NMbwl/RqNMZq2UHomxkJP1nXbtHXoP
	4Sc/8abZBuGdoIx8jc/loyjoLJsg0+sdoRZtnNRkGJBEGxOpSYCQ28BF35Xc/n+OKfxxov2ULt2H2
	A9X6jO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbKL-000000048dH-1cfe;
	Tue, 29 Sep 2026 17:09:13 +0000
Received: from mail-qk2-x0c.google.com ([2607:f8b0:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbKJ-000000048cl-3Dfp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:09:13 +0000
Received: by mail-qk2-x0c.google.com with SMTP id af79cd13be357-93c5f63c54eso268169985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701750; x=1791306550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10AkfjFtGJtRfJ5s0PO0ROrjcvpMjCKxs/Q3/9Rbmqw=;
        b=HUWNlqIZeUi7uIWfccKoDvgm0fJfKfOP4H6WpGwHohZgQvGFsq/8kCjM/I1znqdsO4
         pdkcSYQLoHvcV+oSi1gf/BlGc/iPbBkAlDquWP2TBywPMmZOA6SvRO7+a2XIZr/rmTLs
         SD7QtJ7HGPhxypljyOc/1RTYwAycorY9OGg6FQoJiklmF4TmuoN8Wlxt/7+ZYaaVCHRm
         KY92x/mm81bYEmMy0JAvycg94qx2l+vjp2PYJu+xP1GCFD3vkCJzyEWoqgjttrqZOT3Q
         +27TNHEk7HlZ+P3uvbUULZbUJ8i/+5FpeBLJDif22csyg2F5DiXXtDJL0V8jIvKgfmtG
         Ri+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701750; x=1791306550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10AkfjFtGJtRfJ5s0PO0ROrjcvpMjCKxs/Q3/9Rbmqw=;
        b=0gIxZrWVFgO3UFUlGGs2WmyPqYTQ0OpYdjoXBBHiAKtYA0Il+T443mMhPWzRbm1e2V
         zi/P+nWx5iZKaV6BPEXcwcq0ZKGjuWEiAkATvjAU2yxCAaEv93i55NFLUtUbUwvMtAw5
         lKMzTINltceee2SRnSnBplz5hQjXjx/pc5qm/vhL8G22GRx2ZxGFa1y1stoKOuQkoCL3
         tHCYODj8zS9xnwadmECP0oEN7fp+BDybBasrVoKk9qkYDf8cDrUbvz0eiJ+r8jzq24Za
         ycPhfmdq7YOCg1jSNP0u5x2ZdSOYsM/X29R8BVIWFCQhLOdA75FNc7Hwj3NQPeZfsWj5
         Qeqg==
X-Forwarded-Encrypted: i=1; AKwUvBxrNaHCS8QI+ttnDWCkSp2XAZwL2XbvpDr4zd8oXlDifqR4FQhD3Xb1qulacDLpynhKSXgIrcdZ8/mtkFaHV57f@lists.infradead.org
X-Gm-Message-State: AFuF++k1cjIQWYzB1fvFthH6JO6+M8q2IcVAViQtHsTm36sGfJO62Yv3
	1+HNflp/V5bAsguZws4CDKmr/W5JearTiapBfYD5IobQrDtzB+sJ+IV0VbVcQfC+Ulo=
X-Gm-Gg: AYBFou1BkVt0c1E/LtMxGws3wfsBzETEahF8O9zTFZmjeomctd0F4zuIr2jC9UudQke
	v/AYyZyIbavC+TKtFCyQ8ov6rAU51IBmX8xqnhkLVwgGeXzz37wGMFAsYciTWn3EbpH6ZYSWI6z
	TFIVOwqr8kFOz40sA30IfQT7sjnCtKT/veb9+KrFdOMswWHMGFOKQTZ7bT9J8vS2TnqB32wcMHL
	m4qRyU+GASgEdCe+4Zv6a/QNwtU/gf2UwsvIkwYKoTT+dSjcbAbMXKskUXLPTI/hAMhW6LWLvkT
	Q/JasU8/rh/vo2fF5Yviw4LPmxqtqfDRvKhcis+cHaTZOr+cYIl/p7pDj7cDL6yzvMh4hwJP4h9
	miF4PdwRspZczp7ULF8IunePSXN0BPs0OJIFRtUydtbVyyQLweATnyMZ/Lx+x38LACPm3EGf9U7
	WkwUO2QR+HtoDv4Vc+2B9fyg2N8bG4Hx2Y3qqcOYbq98cLrXinOp/7SYvAd6PCFkdrH/JBhSp9U
	nYx6msUBR3UUZ2gML9yDJreTQ==
X-Received: by 2002:a05:620a:688d:b0:93c:771e:b672 with SMTP id af79cd13be357-93c9f9976demr30255585a.54.1790701750321;
        Tue, 29 Sep 2026 10:09:10 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f546693sm15090785a.40.2026.09.29.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:09:09 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:18 +0000
Subject: [PATCH v6 01/14] rcu-tasks-trace: Let TASKS_TRACE_RCU_NO_MB
 default on without RCU_EXPERT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-1-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=1628;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=y1u2xRxOth8hjZX7WrDCv5jvFeXG8f2oIpSNUGi916M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLjB1n/ZEukW4eoCSq390Xy4zsK+XCVJ6PlHFVN7oC6nXmdURQGOs8r7RRxAT7C/fG4vCy5xkt1
 w73J5aAOT2gk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100912_015088_F73CB215 
X-CRM114-Status: GOOD (  15.91  )
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

TASKS_TRACE_RCU_NO_MB defaults to ARCH_WANTS_NO_INSTR, on the grounds
(see 1a72f4bb6f3e) that architectures with noinstr entry code only ever
run tracing where RCU is watching and so can dispense with the read-side
smp_mb() in rcu_read_lock_trace() and friends.  But the option also
depends on RCU_EXPERT, and a Kconfig default is not applied to a symbol
whose dependencies are unmet, so on an ordinary RCU_EXPERT=n build of
such an architecture the option is simply absent and every Tasks Trace
reader pays for two full barriers that the architecture does not need.

Keep the prompt behind RCU_EXPERT, so that overriding the default in
either direction remains an expert decision, but let the default itself
apply unconditionally.  On x86-64 and arm64 defconfig this turns the
barriers off, as intended; architectures without ARCH_WANTS_NO_INSTR
are unchanged.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 332df7a7a634..e3cfe1fe5592 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -142,8 +142,8 @@ config TASKS_TRACE_RCU
 	default n
 
 config TASKS_TRACE_RCU_NO_MB
-	bool "Override RCU Tasks Trace inclusion of read-side memory barriers"
-	depends on RCU_EXPERT && TASKS_TRACE_RCU
+	bool "Override RCU Tasks Trace inclusion of read-side memory barriers" if RCU_EXPERT
+	depends on TASKS_TRACE_RCU
 	default ARCH_WANTS_NO_INSTR
 	help
 	  This option prevents the use of read-side memory barriers in

-- 
2.55.0


