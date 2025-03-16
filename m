Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7953C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUCAEDGBHb6/0D9rNwLR8XLz0vdrsmnhtv+wLj43xrw=; b=0uRIyzUFTDB9/CIMBrwXxMjsBc
	uewXjCTNTYh8ETJZJjvtrh65JVWrVNlcOMM2YWKT+kEFtRxzGddZOsI4o2EM9wukn/nSDuwsk/8fO
	7+hqtMpSMpOEmiGQu7pDjzB/0rQcj2zHhqoFIHg9YKjQAsyBh9+ME+P57ByNQMwnC3QSCFeFNRjD7
	j/RCLcCYkEc2jEb9NaKXmLQLP+nFhL2sYNjaeF060L49SvOF47BjIBBHaPnQ8Wj1eEtGbfNs2imwW
	dEb3blM8Y9P1SgLrRtH5O8h380mC5uALLSXm7z+eRzpqsmiXrT0tSeFgbp3nO4uOfWFpvEZydb5kP
	dHWNyNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfgM-0000000HGEw-3T0B;
	Sun, 16 Mar 2025 04:33:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGG-0000000HCJs-0hNx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-3912c09be7dso2191607f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097963; x=1742702763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUCAEDGBHb6/0D9rNwLR8XLz0vdrsmnhtv+wLj43xrw=;
        b=lhXUWbqHIfgvILUC2IolMkn36ghtLAMTpS8QkzfwJntTa3hwLqqWeFWCLb2S2dDTF1
         BT9Mk9VBJnJxY2ALX/uuun/ZhpqQQ24ocTP53qqAxWLg2GawgUYwKL3qQoXZODaK3SnB
         xCXyipWClo/wkNpokhwpvgJtbfxZHNCpd8yIg+O6kSJJB2MKUNRQemhrrQIXjVHivkMA
         CNOOF6R99bARsSx8wP2cXmnuQfPRGYoMChC8NNDgwXTmtMJBoD7A5ghzqrqwUtuESJYe
         p0xgk5nqQFo/zIMbK8cXMu9auAV21urp7wPF89LgICOLCyBZQ0bn+HABvfKTO7sRU//F
         QW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097963; x=1742702763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUCAEDGBHb6/0D9rNwLR8XLz0vdrsmnhtv+wLj43xrw=;
        b=Fik2bZYSUmQXg/KORM9TmX23M3id2ricM3LPW3y4/kW1Q0flfI8jIvZfbdPUVvOWiK
         b+9/ffFOtuYBQOUdBKcfkgsCdnt8Ol0S6PTG3Rhv5wliItfb8G8H0axJrzM6vynbWHB0
         NoNCmaNC/3OX9K4YXLyfnYQuEyXXBnWsWtybwAf1EqcPCim5FBgpQfydLxCntBCZ5vrl
         AAQhogk+5msxbxW8NB08H9eGKwjaaRSGQgyYEpzBWr9voJyN1GAJkyW+FfzMxQ0sMZm3
         VoIRMOdRNR4kHKPaV0aGYhZknH1lXJxL5cst/hJVBXwO1ZcYuyqmafEyMkn4ajrWC3dQ
         oVBw==
X-Forwarded-Encrypted: i=1; AJvYcCVE7AFw+rehyJIr7jKsgTcU/9BBUmcuQc24azpF1tw9ml2io9h//ulwU8Mr5d8jDpk7y/OLuVp92stSsvVcTm+h@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuzu6/NfNTLzKnazIAMq2Ak+Vb+xi6+o6AH5vELmsN22bqI2w3
	zFG9l9gQpUt40Fek2/aClTgRHFcZqrOWyfDiQKYbBnuLFR0JAzC6
X-Gm-Gg: ASbGncsufPI2iFia35hFBStVffbh/myZDL5ttWZfmC2KzJuf0fYy57SpG+akWzyts3h
	BiN1k9KkgBZYC7lMNJKArUCxndCGzXvTnMaP83yBNM/y2GeTX/x4gY9dWR5OK9hGzIpsMfDg0fG
	FzW8y3bQbaiMArlMHnRf0ErcVdPTRKbVrJ3CEmoBGRqcXCpZwftX2Y3AM5vtZFEQ6EJ1Iag2a6I
	R0Izp8qchOKk5uIlGWT6uID4eTtk5dbTcf4VVrqF7E8UaEVMOaGgkZsNXdNx5clH1V+HBCThVmj
	eZ737GiRxZDn3P+pVxy/4svWGw5ewDqUDJ4=
X-Google-Smtp-Source: AGHT+IH1QUcBVLxG3+dHXNVouxh8ZnGD/jGRFx3laH54pFhC0UFA/apB3TrLa3WvvXdMcVjhfYlapw==
X-Received: by 2002:a05:6000:1789:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-3971fadef12mr8962187f8f.49.1742097962702;
        Sat, 15 Mar 2025 21:06:02 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:74::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df344dsm11217081f8f.10.2025.03.15.21.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:02 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 15/25] rqspinlock: Add helper to print a splat on timeout or deadlock
Date: Sat, 15 Mar 2025 21:05:31 -0700
Message-ID: <20250316040541.108729-16-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105; h=from:subject; bh=mHarWyQwszN5GN3f/z3j87BhPIW1TR13hflSsKwjB3k=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3dhiQsKeYiA7FvlWbRSOujsyykBVeLrqG6gNLF YBDPA3+JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3QAKCRBM4MiGSL8Rynm4EA C7H/n0q49/3AIp2C9KPljoZUU6s3o4IV5coN6RHcn0nxNkwVlUMUqOmO9viCbAZR7x0xMkUUmESdVT d6RNwHM/sq7WZtekq1OVAesNrzsND00uiegqn4MdL6uYpmvesuXJil3K3FhyYPLgN1JEHEqn3q3PBv xEs6tpCRF2FogvO8Tfpo6OUlBQnqsAMOrv/J8wqR1Gx7BEvoiegfsOIGmpZAokPBs4GJs6KAPSQClK HxiqImv6qIUN2ImtcFSFuFx06FDW/ZuZn9aAOOuM6yq2wUZRxJdk8jnj4FSWZ07IPxAyPRIP2+TY/n 0PxAmhbVU6mwE2FD91sqm9V8TimYDCc4sNi992SQfyyqJjkx/kGNPQtDvAdPwpyBgxyyzjdR95KB+e BFMmApqGZMvfh6jlwMum3F21CCRWHLRpNkz5ljBnZMAjdTg89tJD5sv4Ou6blclSsNG2BCuW8lf3lA 7ZB2YghW4IzPDw26l5e8nshAHdm5PjP4WKtdJIn0qnNsB5Ola4jYzwK17AyivSL0eKjEJJ/w+R6zJ5 KgZ0wYVgXs+bAMtfs3VFbCbhWwu/+hDk1SvRy5bdwaGvHJO+1LyPBdOPEIJFkP1mI+vfxEE/9UTaJs 7wEdv4wf2t1oJZEUzmrqwj+FYMxpA5vyu9CskwLFQ1+b395NhYuHMPNuVNCA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210604_198206_4F61AE3B 
X-CRM114-Status: GOOD (  14.74  )
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

Whenever a timeout and a deadlock occurs, we would want to print a
message to the dmesg console, including the CPU where the event
occurred, the list of locks in the held locks table, and the stack trace
of the caller, which allows determining where exactly in the slow path
the waiter timed out or detected a deadlock.

Splats are limited to atmost one per-CPU during machine uptime, and a
lock is acquired to ensure that no interleaving occurs when a concurrent
set of CPUs conflict and enter a deadlock situation and start printing
data.

Later patches will use this to inspect return value of rqspinlock API
and then report a violation if necessary.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/rqspinlock.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index ed21ee010063..ad0fc35c647e 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -196,6 +196,35 @@ static noinline int check_deadlock_ABBA(rqspinlock_t *lock, u32 mask,
 	return 0;
 }
 
+static DEFINE_PER_CPU(int, report_nest_cnt);
+static DEFINE_PER_CPU(bool, report_flag);
+static arch_spinlock_t report_lock;
+
+static void rqspinlock_report_violation(const char *s, void *lock)
+{
+	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
+
+	if (this_cpu_inc_return(report_nest_cnt) != 1) {
+		this_cpu_dec(report_nest_cnt);
+		return;
+	}
+	if (this_cpu_read(report_flag))
+		goto end;
+	this_cpu_write(report_flag, true);
+	arch_spin_lock(&report_lock);
+
+	pr_err("CPU %d: %s", smp_processor_id(), s);
+	pr_info("Held locks: %d\n", rqh->cnt + 1);
+	pr_info("Held lock[%2d] = 0x%px\n", 0, lock);
+	for (int i = 0; i < min(RES_NR_HELD, rqh->cnt); i++)
+		pr_info("Held lock[%2d] = 0x%px\n", i + 1, rqh->locks[i]);
+	dump_stack();
+
+	arch_spin_unlock(&report_lock);
+end:
+	this_cpu_dec(report_nest_cnt);
+}
+
 static noinline int check_deadlock(rqspinlock_t *lock, u32 mask,
 				   struct rqspinlock_timeout *ts)
 {
-- 
2.47.1


