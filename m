Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psIYVnoDnyqEhuF08gdBP5C/H1dDdxXA5if0bgYSupA=; b=YC+QM4ArJdwRyZU6XM1/KJ5Naz
	sGZPoOq/5O4baqHkqXkCgwu3FPUXfLEfmQtwcc7Y7WXGbZ25zNakR3MRw73q8d/7sqnB6yxzxxuPg
	nq888FM4F8rf3M12qZQiMDD+GfsVgnTUVwEfJ6VWByD9mAKH5MRebLA52QIZh/I7w/QAfQq2sgJxf
	cQipT2ozt6oxR6IHDD6Y9C7fmVoIMjJulTqKer+mEl0FhSdIrXkkt5sO+cvNtf4cTeIULFetFtCI9
	XqReOTEAwh5ZOZlWjOradFxgTjNk9nwXfd1M9yx/3nY8zE88+gKyZgK7SKGYwkdgFEv8KvVph1C9w
	pGcFE9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzpg-000000065wS-1ip6;
	Thu, 06 Feb 2025 11:14:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX7-000000061bB-4AXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4363ae65100so8239245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839297; x=1739444097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psIYVnoDnyqEhuF08gdBP5C/H1dDdxXA5if0bgYSupA=;
        b=UTlN5P1y+h9Tn+yENmov8hqFcC5uRX9qUnN6ILA/1GoNc5PHbn+v1fnW4V5h6jA/3T
         CGLpolbV4V1FV9M3F7VI5azVGarCL89QPipIhT4ifA2j+vGdTDpoo+btp3tTJ/mSsjk1
         lVN4YCCAjFX79slhjQFVM4VMwRldP3JGcJYAMelcFadcFdmrpR4r1p6+801W1f/yjGFy
         lwKDDLUxBhymyjCj+it3T9FlYeRWARnUAlLvLuoMcHynNwvhDtShaOG1ikc4CsMPRtS/
         Nwa+F7r34XODF2KVgzIRoHzLoF6GmZ8bnGd2Ym905yrWri1/wou0TZoegeK7kcnk79o3
         ZB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839297; x=1739444097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psIYVnoDnyqEhuF08gdBP5C/H1dDdxXA5if0bgYSupA=;
        b=pFBmnBcKUlZUxP1xSfM8PA8VEc42MJdeNEmawHH2HaqQtTIwySaTt5EzFv2kG+vZIS
         JiY+QrfdZvHLdeoKJ3RYZ+EO4P+rDzwoWOHXhuKXjcF5JGkHWPsKb7MvkmT9R6yuQmXa
         XC6Yx39x8ACev1m8ate3f2pRmXhGtTgLnm50rc/AQc33J+oNWBlgWd/4n8l8rnXpD9yd
         V9w6ZJvdom0HSzqsRihNb5c7pFtqADK3rCQCr8rc/Dqbbv53lmFiaOCnmK0pOfoxN/Lf
         rfTrh8Vex3eoX3ys3vu8Zt9Nnb2lgSRZzFir+K+9axtX7YBI4c1Kwg7sA5RC2H1vDGKG
         9iUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVrX2ZbONtNuh12tierKTHt9xfg5JlumSpXjhH2WQ9V23avcUNm1RtB1z/HbTForLfcXuGawocvU2QpZkyGqgv@lists.infradead.org
X-Gm-Message-State: AOJu0YyPbNtkzQOkcxPunxP/oPbDL719lOcZf5Sb/HOieEJLQx0Ge31c
	EMnknw4iv4v5U1Qo7vimJNkShUOFfw7KP4Im+SC9B5ZX78t5+dW8
X-Gm-Gg: ASbGncvBfyOGrWIhBHv6OziQJuz9FBvHyjqHrnhDnTLSx3uxds40k/u/PR+1Fx0/73R
	IxqpJiGKrZzRb0wXyziwoPQLpw+Yb6yH0/lXt+34E6KlxBHAdpCJ6Ii9McKeELt0SovQv89LuOF
	a4fOZ8u3RxfOXYSz8JdOcc5DQ3KnA2BSRz5Rauo+E6HPxtTNhtaGQ8bsi0053dO3dbj+malgXH8
	pejQfFVGNNnbp+Csm/v3wgP374NwK+ci25/6+tZWd7YpAD1hY4C9GbLKvF8YQPVVPjLjj2X0XWu
	4sKppw==
X-Google-Smtp-Source: AGHT+IHkl/GEUHcQkAbl0ON/0qgQ/ymyQ9ZF0yYfkBQadmGYwFrDVox65cPqH2Wp5hAeoi4jk/bRwg==
X-Received: by 2002:a5d:584f:0:b0:38d:b907:373a with SMTP id ffacd0b85a97d-38db9073983mr3633804f8f.18.1738839296552;
        Thu, 06 Feb 2025 02:54:56 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:14::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8a4asm15277955e9.32.2025.02.06.02.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:56 -0800 (PST)
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
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 14/26] rqspinlock: Add helper to print a splat on timeout or deadlock
Date: Thu,  6 Feb 2025 02:54:22 -0800
Message-ID: <20250206105435.2159977-15-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; h=from:subject; bh=KNh5avXGN/NKqBUPvLsxJm4kx32ENpJMvZqaG5TMnX8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmRlXvwB1hx8++BclgtcXSkYsvJvj0epYaDAgR caKTzLKJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8Ryj/lEA CdyUwdOkuj69uW28N+HkwHcaKyNpxRWOwDuMUKnremt3PTIi1hrZRLDZ5EgKKnQdyKZY6t2nVrL373 lmuwFahN438dpl8Bk5tQbOhm6+4w+dE7fWr/DTpAuKuKYVZtr1/yiqqRdODy8wjoomvIzmS/in2A7C GF9o2x9dBdDcZ/k+DSqPjPQoebLQSloS3NlGu/AxxXu/YnaY7wvkbdiNj1GGZSKLX0Mf2zlShJbi46 v7mgNoevomx5zGXDhazsdU2klCu0ipaQUiKQlAbHB4LDaCfTJiw/FKqtjY4bmTlnVienNuoZwdcWqE BqCt7T9md4IJP+jH9aw6PAXZYlPYe/DGYUuOtCberxn54FV6sgZnEH03zTBFmJXKMxHisr9eXNr1zy /ciQUgfbnR0+tgIbFm8LWRpA1Wy+nerC5gB6EHuAIp0GJW/NIs85l39vDGshVBpbkh3T/NgrQOVYRc A+kNcL2FSKEXxRtiVw9nzH+exDCaJdx9Fb30gd31OENMeXf/QgUBlRKVdcyt9rD/H5L/01hPbSpwTq AxHFQVwdMLBxGzxGfpTUCDZHXq1BCR+fw5VT6cC3LSVeBC6Y7lEDJ0PPAdEPbxJe7DzjHFblZdRlsq EJfnrO5HAk3JyRiiqL+AbJN/On7peWMsf6ZNiz+g4rLFY2+PreoqERHpbkvw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025458_032886_09635D39 
X-CRM114-Status: GOOD (  14.79  )
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
 kernel/locking/rqspinlock.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 13d1759c9353..93f928bc4e9c 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
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
2.43.5


