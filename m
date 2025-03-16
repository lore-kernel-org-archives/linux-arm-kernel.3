Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EABC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX6HuMB01wWAUhOciNQt+DcJpa4mtBn0KQKhBNdUTd8=; b=BQgoT29Vi4fRoybWUfHlrpESZG
	1QKTIneNKaJVF2c1Pnmms6vHc8cvkq0ecaRT/Tz7GjluSiFjexYDshutCIbTowfaNQw0ecvyxXxwl
	euRzlGVZlD6bOt2DRtPm1qXmOHc3b5rMhkX7pTuamfQCkLxu+Vb1dc/w1okBUIkHBI+YXyzqHxqcX
	AR5S7uqnGOK3xzq+bXByEjo28Mos5vtvZ1j6/RMB+S2PblVEKTIHnjFiLk+8B4HhaR+arD21KN734
	TQ2hOb/FLbCSK4Tvs7+9uNioYpvEfLXrDMGu6lC7C4/O+mQUEdcqDV0MG+nycR7/z69EAMgFenSUG
	XpyU9R4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfZl-0000000HF5D-285O;
	Sun, 16 Mar 2025 04:26:13 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGA-0000000HCGm-1z53
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso3923145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097957; x=1742702757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX6HuMB01wWAUhOciNQt+DcJpa4mtBn0KQKhBNdUTd8=;
        b=enOdna0yVBWP5aKiY+KtxDxEhdH3gf3z7YGuh4gVOjfEDQGn/ZzUgYbKWzG3RcUwmD
         VgeMp90yQKrPCNPOkdpGIqTbYHKLnsY2tNUiLhrLuytyOdDppRUz8vo6PrC1355JV+fp
         y0+RT0OYBzrxB00AEG6onYzenVPFSFm5r00dV4hHgOx4oxfXVMr2wsfW/0lkJd9+yg1j
         Kdma1o81Yv7qni7h+Py1Nw/mcdti5rcIeLQYCS0xkDRLNCV5NxwAkS35Qjie92qX0E53
         Rd+aL7oncHgwzFErS5c0su0syZDzKkSz7e4egs00WgCgM5EWCI7vkwa9ORvPGZ8rK86y
         4KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097957; x=1742702757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX6HuMB01wWAUhOciNQt+DcJpa4mtBn0KQKhBNdUTd8=;
        b=VtWEmweonhepNeTS/A7XshDCT1y7Of51iEDOVUwPZZ4mMPW7uFr4AvWMKcBth4qeCL
         hZd+PTmOeEZnMtrVYCZRXj2l93JOPbFoULj8Qw0ju/OeK4wc4Ex/lIZc+OjRMayU78ng
         QeZ+0xHOjFWxzsTJvoJa5mmEL/cuykyo/OhOM2JErCgoryNncp224Aw67FFh/AZOGXqj
         KBwfpH4aEIvMEw4QYhZ1vDVzGs/O4zOfb0yQI+j8OlLt36ywQR8TqmtcFiATOaKtBcO/
         sju0BP9nJpmH4GIumD2kStPUzMsWuYwlLZhUCvZ4Aq8Qw1+JvJ+jAmkoBb2/CHYlJ0nq
         0dZw==
X-Forwarded-Encrypted: i=1; AJvYcCWA+wxYmPcuhRjOlbFs8wOeJQdXFcu93Xc1Noawg4wkbfc/AYBV7nOmr01LmRjnr1dZfB/GWeTbQ8qp1kMCa/si@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3nqCb/mi/6a5UWpUEECN3AEMwXiSmjgL4wuojcWqHydL/fRpr
	Zp5tSwojzVVNDmP9rUshNhKvdM8PX0INHvUixi6WXtWsKqdnkWfnqmH7VsBE+w8=
X-Gm-Gg: ASbGnctUPnKzMMj2zLk8oeiw9qKLmSo/Puh8/J7Tog+Hk/eYdThww/wZ7OoMYBBwpdW
	kD6r/QCGbYRW1Z5yGMQtQ906A11L3v1rQ/26Sm/mKzBvR+4uZDhmevz0lxSLzKfm8g6hb+tFuAm
	MkTBXzdhK/2WPBzSw0SDLsIfAvcoK/h7lr1ydben4/ZA68W28YAAfjM6wNOE4vkq9CDRpf4ZbuW
	YKUAaDuR9aUiitOV8lW7fghvMeGLzHm+S5avI00PzcId/NTh9Mm3OqkTR/NdCx79SJwRcGtbHeR
	n3kF/pb9jWzaXVXQFmn7LxIth52OKirWeuIgahsI3PU2ow==
X-Google-Smtp-Source: AGHT+IGdjZLS03B/i/oyj0FVCH6ak251OqqszbVDTcp6yx3FeG6rdnMDu6XNNYRan/DL0Mz7Gi3+Xw==
X-Received: by 2002:a05:600c:1548:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-43d1ecff3d0mr77112145e9.21.1742097957130;
        Sat, 15 Mar 2025 21:05:57 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:4c::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fad59sm67783415e9.26.2025.03.15.21.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:56 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 11/25] rqspinlock: Protect waiters in trylock fallback from stalls
Date: Sat, 15 Mar 2025 21:05:27 -0700
Message-ID: <20250316040541.108729-12-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; h=from:subject; bh=6ga9NaPnm2qscV5e908A787vKJcwTZL0L+jNyYJdaTA=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3cd+lc2mT7eAYTtSCeru7PXMbtZTLl1rVKe2Na zqq61WeJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3AAKCRBM4MiGSL8RymCDEA C4K937bgxXiBFwWg7wVsj1Ouwcy1m1SvtfIZLVr3xtAqcbiYKXGG0i5pXm3XBUM2mgmI9CropTshbQ dQWs7kFH1UBO0zy35y69RMSbrW+XYvOIUv+szj8w1OnAXfbt5cxjZY2oWdwBfSiPYvDI8qqWAJq92x Eu9XxhjsiU3DKxEIhABz7oovXElnhcqiaJX0bMqx1PJqHQEUx+v8FQX4j/K/bNuVyKsahTVF0QLweA VdrXkytJDmq29EvwZiID/KwMdFSAlK8imRvbwx38oDpj5kOvmKd2YPf+9yf+Q1X6A2Om6Z42ulZ+ju 44r5dNM2UD3qahjawRGUazaB+18OIHX1yD++NqUAjsQFympNzvBFjjeeC8ffwxmNJkaXt7zT43YAqL /uOkIADmjS54logpdlm10XVwYzPrtEOTELnZknQ8zGIG8h4on+rvZfgi++0tV7gs78T0qEEknIsIYB 0uXO7Y1CGP+IevSyeQ3EJvHV2IYztylGYEHyA9GKqpmo5nBFslUK7B3Y9WsiuQJFs3DzzTDWNjIOsc 8Y37rSMW+XsAoDPAbL+h6fkt5rkhyDfpkpnfY7TEZ9vp3KcnIvAS4dh/o691vcK4ZXIZx+LGjvb7WN VxSTT/cmkbB6g757jZk6EG/qXsjkzmmz6wFs7p7bSxl0HNH1488vWapQ0xWw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210558_527222_1FA9224F 
X-CRM114-Status: GOOD (  15.22  )
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

When we run out of maximum rqnodes, the original queued spin lock slow
path falls back to a try lock. In such a case, we are again susceptible
to stalls in case the lock owner fails to make progress. We use the
timeout as a fallback to break out of this loop and return to the
caller. This is a fallback for an extreme edge case, when on the same
CPU we run out of all 4 qnodes. When could this happen? We are in slow
path in task context, we get interrupted by an IRQ, which while in the
slow path gets interrupted by an NMI, whcih in the slow path gets
another nested NMI, which enters the slow path. All of the interruptions
happen after node->count++.

We use RES_DEF_TIMEOUT as our spinning duration, but in the case of this
fallback, no fairness is guaranteed, so the duration may be too small
for contended cases, as the waiting time is not bounded. Since this is
an extreme corner case, let's just prefer timing out instead of
attempting to spin for longer.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/rqspinlock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 65c2b41d8937..361d452f027c 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -275,8 +275,14 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	if (unlikely(idx >= _Q_MAX_NODES)) {
 		lockevent_inc(lock_no_node);
-		while (!queued_spin_trylock(lock))
+		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
+		while (!queued_spin_trylock(lock)) {
+			if (RES_CHECK_TIMEOUT(ts, ret)) {
+				lockevent_inc(rqspinlock_lock_timeout);
+				break;
+			}
 			cpu_relax();
+		}
 		goto release;
 	}
 
-- 
2.47.1


