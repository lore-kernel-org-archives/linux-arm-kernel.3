Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55CC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4KdASnnyjPBe0E8JbE/B8q1tkmUaCwFOXMgt/4BU28=; b=H3HJQroYZTmZ3LdrLQT1McsFFd
	SiuCU0FUaBNAUUKP95TbYGEPqo7U2AQri+sANZ2OLYL2UaIIDwon5W+TOU8cAztOfDZSqrydwZxZd
	1G4zWiutpAKOZLpQ/iDT4mmzFQ6p1CaCuIuy5b2BvVwPYXc4TBly8t3Lk+MpSSdp5esH0dtSSwuff
	Gp08VafLHYhtiA3Ox130ABf8/axVOQQOPF5kyB6r/wqHa6KvY2fxM60bCDVLb8t4frJmlcCgRqrMl
	AfVK46i13d+daNAlZ9QIchfEvcbb+yIo5dh7YOJ03mXPt2zQ2vDFYRfZVSmJj0xqI1rK24sgLvvKe
	VlXcj1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7lE-00000001KBL-2XeH;
	Mon, 03 Mar 2025 15:31:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dW-00000001IAr-25ta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so29223295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015397; x=1741620197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4KdASnnyjPBe0E8JbE/B8q1tkmUaCwFOXMgt/4BU28=;
        b=YnGLHCCAsjkGf88yxFkgPPrrdQySvcTuN6ZthxeeSvYAgN/MW1iuCytNRqiGQDD+gd
         6SkQ8s9WbkEwCPvNhRZAn3hFk8htp05w+CeB81effqsJNPXjmasEeXCyQD/2bClgDBNC
         OtuwELd+pX4Ws6sB+XeAMc2QyBtyNwP+gO5LVXXJooTe4T+aHISv20TZttllgoJs+jiU
         Wt3ZPLcIci8TWq8EQNHrJO8oVWqOPS8wnz88AqExol9MruLiESfdza/DIZ1aRg1O/hyb
         bUojvvQ95wAPvfudRWFOOnxQ9LTt0y3lf+C9D2MKFNrYpA/F1x8VUtaYCFA9hmjGEkSo
         Wr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015397; x=1741620197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4KdASnnyjPBe0E8JbE/B8q1tkmUaCwFOXMgt/4BU28=;
        b=sa43RFN8KTH15dmE9wtUizXXtkZrCG5kUHKxiVNqMuXT2QgJr59fi0TWCG+s29gGz1
         dVx/y5l39D5QYaV4tpqu9fdXlNV+gYoD+9IGep6HjOrCmiEkFd2EAmPAEP/PpADFUWgG
         /4RTRycp2UBr3oR+ltGK4ydI1s/xwETJHrWv/FLiGwv/6ZNlWl6WoKvC0ODBzrdyhrkg
         4uAXLrWHBB05avno70WWSH9D0ny3Z6QFirQy/PK1qBvDcP8JhRSdlqu5GW/ShyimWqmn
         cfb3DIXbgLpwwBkfyKWe3orAZX9F31EqVKsNncnrR2RLaAzlRTgvl74V8pys4XsLUdcI
         98jg==
X-Forwarded-Encrypted: i=1; AJvYcCVBrblxvkyMcOsn4XMRedYyRwEAQEVKuN0hVXaBl1Mbf8D+eJhQgboZOaYS3vljKpgUGsmKJpqxmt1Ohh0GMSXB@lists.infradead.org
X-Gm-Message-State: AOJu0YwkXW+GPMBGK8tpWwTXBAnMW39hrldVol2KhNHuZATXi8mSVp3G
	hwaVWSXT0jZy8EexdlwBZH3NB6ZG9PvJHSU0nMGhST0ezalnktcp
X-Gm-Gg: ASbGncto8KnyaZIMmXI/jlhwb7xJRuqMQlRomFONpdZUOyJ7SLvGuNMo1wsxN89XP+f
	bJMkMQr7B4NvNr8bBGaIt8QjYT1NmcOgs9XA7ODdKtm3oIxY/PbGMdG3GRvwZ5G8+hVsSDqBnXz
	vP4bOdJCY/AouKRkGXHWK1UMUNFXGfmCDLc+xHE4UflruUNlx/3JMGCme0LrpXwBxxQiIKN8ol0
	4HG4WRZD9pLPbpNrRmrHoAyEe0DGGdu9ddpfvo+dZCx/WE/ckmOELRNVNcXPtWtm3onItx3jCRy
	bV44iU3CeDRSemWaLw/dMGZdeARzNU5cysI=
X-Google-Smtp-Source: AGHT+IEXzqJkS/D47SGG6s47BNUvrMNCFfD+WCo/Ixy2e0y3ir/cTpzrdXL3Bgt5bdvzEI6kv6bwOQ==
X-Received: by 2002:a05:600c:3ba9:b0:439:a155:549d with SMTP id 5b1f17b1804b1-43ba66e74f8mr113912555e9.12.1741015396488;
        Mon, 03 Mar 2025 07:23:16 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:50::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc18452c3sm41377135e9.25.2025.03.03.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:15 -0800 (PST)
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
Subject: [PATCH bpf-next v3 05/25] rqspinlock: Add rqspinlock.h header
Date: Mon,  3 Mar 2025 07:22:45 -0800
Message-ID: <20250303152305.3195648-6-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297; h=from:subject; bh=C0ciCNeduyvvQFAO0DwlqwtcddwN6zNDgdODlI5CgNw=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWWmeJIFZGQqQJ9zuXTndNKetm3e9meOOzs99f5 56FqOzGJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlgAKCRBM4MiGSL8RyoR+D/ 0VwsuuvPBO31kFGb0t61y+N4gbFPQVPDJBrXCTRuRgO0fOw5WCQWwcpin+e1kMbSgYKAZzVwfLS3fl USxgEUjPhUFvS788CF15UqpS6n/tM0irZYhiD/4t5EWU0g0ioKfKj6gj6yBwqsSMBTsIRoIbfdAtpW A1sQkzl5Q8TKau41XUFL5/fRetjHPVeJCUKabg5SUIG5I9iY6ZjqHLHvD+LFUnOo8bFfHwkb1uWXh3 hFp6LuX4Ip5Q0OVOMs+ec1b0966SfNEsHIk3+Z8XY4f0eqnk7Ez83Zc/Hjz7csGn6uh8bcb6eG7ZYC +/A6aSKaqeZbUC4ssfb84IHdHW7hVWFUk4czo8NMacOAr3Qy1tlY/IIaFasBI7NmhQiZgLc8EPbgHi 7TMVD7hKBCP+NHjd0dPY2vu1dxsGHJ7glfhHL4X9QrkiqZi5/Mkl3n7BQmfN/AKLVD7Azctv4JBglx VxQbreb1HGCpiW2R+/1KbXrT472iuSH/6kefuuYYh1hQbdVrvkEdNJfBXlKOJBdRGO9hA4i5b/tbBn 1CQPYg9cYRVAZ147OeK3geUwV37j9ZjgLrI0+k1TkwXMQtUgriZg5GETC7ZgO+AO2BGZkTI4gFTPr6 Jo2JmjrdfCTWQ/LMn3yeXbbAnc4me8NdPXySZtWjaqKhp7V4WbNvPwwg8qPw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072318_529971_4F8AABC2 
X-CRM114-Status: GOOD (  15.25  )
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

This header contains the public declarations usable in the rest of the
kernel for rqspinlock.

Let's also type alias qspinlock to rqspinlock_t to ensure consistent use
of the new lock type. We want to remove dependence on the qspinlock type
in later patches as we need to provide a test-and-set fallback, hence
begin abstracting away from now onwards.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 19 +++++++++++++++++++
 kernel/locking/rqspinlock.c      |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/rqspinlock.h

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
new file mode 100644
index 000000000000..54860b519571
--- /dev/null
+++ b/include/asm-generic/rqspinlock.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Resilient Queued Spin Lock
+ *
+ * (C) Copyright 2024 Meta Platforms, Inc. and affiliates.
+ *
+ * Authors: Kumar Kartikeya Dwivedi <memxor@gmail.com>
+ */
+#ifndef __ASM_GENERIC_RQSPINLOCK_H
+#define __ASM_GENERIC_RQSPINLOCK_H
+
+#include <linux/types.h>
+
+struct qspinlock;
+typedef struct qspinlock rqspinlock_t;
+
+extern void resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+
+#endif /* __ASM_GENERIC_RQSPINLOCK_H */
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 143d9dda36f9..414a3ec8cf70 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -23,6 +23,7 @@
 #include <asm/byteorder.h>
 #include <asm/qspinlock.h>
 #include <trace/events/lock.h>
+#include <asm/rqspinlock.h>
 
 /*
  * Include queued spinlock definitions and statistics code
@@ -127,7 +128,7 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
  * contended             :    (*,x,y) +--> (*,0,0) ---> (*,0,1) -'  :
  *   queue               :         ^--'                             :
  */
-void __lockfunc resilient_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+void __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 {
 	struct mcs_spinlock *prev, *next, *node;
 	u32 old, tail;
-- 
2.43.5


