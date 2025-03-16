Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C725C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beVjeo/VucQmznYM//yRk+lY9Xj8BUazd5x3dTjfvms=; b=BYzm+qEb8EWHrj/efeNBwogymS
	bw6qORP96UNfSlmp8JLvq6GrRVznYsQC2GMNxInl5ZezHvIvfTt3K3PGt9XldwNP8SbZLmeniv6RI
	hHRBXG4+y4DQm8fIkkQ8Q7yeysPzUfYzSPkKvANX/2YxdxmBFR6ph1SAlJuj5H18DcII0yERNG7I5
	9bOoeKyZN0xmrjfZgUg+swjFxNclF+J1V4Ko9wTT/fOaErQSQOUnDmUEwe2viNuqUEKVy/Mw7hBKS
	oH1sprGI2SK8PlWRcQN/MwNVaWyljrbENmkxVgLT5SzkKqKXninTHZKvhWaD015z4Z3VbYJk19nDW
	66AvMZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfPu-0000000HEIX-0Y8x;
	Sun, 16 Mar 2025 04:16:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG2-0000000HCBs-3kyD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so4664555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097949; x=1742702749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beVjeo/VucQmznYM//yRk+lY9Xj8BUazd5x3dTjfvms=;
        b=gzJQM8WZgXfHWlKoaPeaxztFOjvH54A7iVEM41UBeVCZGG3lqYtP1bHBe3W+yDBE6C
         mMR2xzcdxSQ48dUYjty1JzZZJdnpk12lK1kDELORlduQLVYd0Jo3O/ZWJ2tWfRnlrT96
         GQ6l5VzL7m4KnDCsUQVJCp6uvBmF3EP0HdOsli1NrQfyqmS/W9fbeBlFN7v7EoJQ5DIp
         E0c/OBr2OD41c7krIzssE/LZEEmw22a3HmBmaq0TDT6osGIOYIGU5ZFfUBlzBIKYYv9o
         cKeqp8PpfK1k02azlKbK1z5niPz9ZoIOpa5PSvjUagblpZpkld04Bh37yQ+9+FRAVXKL
         5PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097949; x=1742702749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beVjeo/VucQmznYM//yRk+lY9Xj8BUazd5x3dTjfvms=;
        b=QJVAGQbXKWcBwj9Sqlm49XuhdcLvOsaS3M8elDmJ8vldUCAf1pLEAI6R0EYBIMpoFi
         J/Zi4QxObJL3RsaEsGW3IK24r/k+9vU3WOPXZny55Aurle0hiWVO5ojkEjZ9vI5NvXX+
         7qkyV8/QjHUkLxB52vc7hf1Jn+BawVFOt+hW54kchiES1hHICmTNJJ4+gEkB5JDE6zkZ
         FvNRlQn6x0BzW+jcsRfZzAQSwgZTw7LH0wBRGMgHitV07igk9OqKheZYBPSZV+v5Q5eA
         pEvlcw0/+PX87S5ku4EpRP3b0uKQ+VWbkzL6vb0WVaNrKF3UIzyAuNC0THQCx8B2uVXu
         GRLA==
X-Forwarded-Encrypted: i=1; AJvYcCXSr3bHjE0FfCwnjhuKPCWhFaL7PMMDdII4Bc+mLDabXKB8a4zQyY+BkhyMbwC/OBuwKoKlJnQaVohOK10Thbhf@lists.infradead.org
X-Gm-Message-State: AOJu0YwGnMeMhWIVh3ykgpXPHCEVAHzRVGWpxKuMDcRx+qlNiMoXvEPh
	XuXAquCkZWbWvRw0SzCHHjSR6yamzpI7hxBMNWrz79ZnEaKXbX1j
X-Gm-Gg: ASbGncv4dnQRQYCBoBLWNdd4+mrJhbN3++Lg1gzgrENsNWa6ea+pORdxp1HD6ZcEE92
	TCcUgv6MmGyoGaFxBFV02UneCabmOfEAwRZaBZWjblodHNfdBhQ0TWgoEMxiXmvm1u5bT35Yf5T
	wRvkHf7fcwV0sc5J78h4ahPAubHLNvk6UnQ4d4fMYzKHGKZf+TQ4bP+9ZS6RE/ZaHHfxpR8PCqh
	09gLK101I+/xV5LqZeko4IfuLTWLgzCfaGfxTTJ+LsPMN8i0BjooUmtMdrWjVI59Hy/MifCfQYy
	jbdYeBnTWA88BhbDWHEMV4fftL2Rjkai3A==
X-Google-Smtp-Source: AGHT+IHr2XBo0Zj7lg7uqlYGSFDV9q6POPhHGxARC6AThdf9jY9aY0L+6DWSNr/0NWU8352lQtntYA==
X-Received: by 2002:a5d:6da3:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-3971d03eeb0mr7839110f8f.4.1742097949466;
        Sat, 15 Mar 2025 21:05:49 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:9::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60b91sm67303265e9.31.2025.03.15.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:48 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 05/25] rqspinlock: Add rqspinlock.h header
Date: Sat, 15 Mar 2025 21:05:21 -0700
Message-ID: <20250316040541.108729-6-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286; h=from:subject; bh=J879+EgbuyTebrgMR7yNECE6EUzDiFxlkQMxluMZnf4=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3b9elCAd3YQ236M81hMVLjSuOppZtbhch+VA6/ +rsNVFWJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN2wAKCRBM4MiGSL8RyshkEA CCv98+4lY1p9/sFVO0M2tPH7eTtOTASKJhakQbPqh1VQV36TyCzSaQMxrKctCpN8C7owWTC01bHGqc uI+Z9UudyPSj0Cm7RYxCrP93Lb3Uayvcj3YxfZ4ECgMrBwLS3EOpGMhRJd60Dcb6XFtUQOMUQvrve4 cuGnRz6yfsa+vQNLSW1t0H2BODbKRzlFEu1WGD42YiEzjN4knrh/owAlZ1Av8cUPJpxMNzueQASucb eGyQ18wsYNVZjVcc/wp4dif0cQLiLc7c+6E9bxeuTzbgRHtAxzROq9WCxfhDOPYLlZe5m/aFW2HojL 7ilY58wpGW0Rhs3XUzv4sGUT9tj3GcDBl0dm7dPpLB4d0JrX4YkowIj4b/07SIASKj3ovG7wFW+o0m 5qe+QjTAhKQ1RgSIfkCaRVQGQBhPFqBL5Zf1/JTJ1VmHf0uuxx8/7CvgRM+p5KETo8myeIC5Tt9//M B+5VUrfWUAdSF6KWRzKCTFpqBHuJS6T+4JbZX2he0aHaQZOHxX2qn3lDC6VzuHL5BR5XX5LdizGzBV f/EiK7VPNweuCM6BurIbBqvfKkiq86dQe15jvoRriwpQuGOlaOaeUayhNQDPOQpAlufShTTNKO/MiT z5CdzlZbqINK5Uj9m28uAQkGmSkxfPYss0RS+pN4X5EuZINLNuJyoxi2UMzA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210550_946620_005AB190 
X-CRM114-Status: GOOD (  15.45  )
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
 kernel/bpf/rqspinlock.c          |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/rqspinlock.h

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
new file mode 100644
index 000000000000..22f8094d0550
--- /dev/null
+++ b/include/asm-generic/rqspinlock.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Resilient Queued Spin Lock
+ *
+ * (C) Copyright 2024-2025 Meta Platforms, Inc. and affiliates.
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
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 762108cb0f38..93e31633c2aa 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
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
2.47.1


