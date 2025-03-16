Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClBpfryF0l26LJucqaea+hnSd7y5tppZSgQBloKDt3A=; b=MGnhYh5wH8UrbzzWoi5IicaRDx
	tsTqrwPTch2dSHEG14T8CtNH01uvuEUusHRZ5wEQ4bVfug/beM3aMGvDF+IIu9R+bg5vUPRsPgjMU
	2bqN79/wwh0nX1k1NJPcb7dYJP4uPIzvjYuSAa51Md0j4yDQBTC//Rkph4a4c3fz8ENCfIjEJ63bM
	Nz8btP2R3hk/NjLJ8tCtNRbWkGKBvteRE8tSoDzGvGiXvx6e+KyGX3Ss8/9Tz04EWFPB4eoO0UgyU
	kunC0fZ5gmenQZutDpuoGk+Tt1ZxU1FWOdjYDE0M/FAq+QREZQcN23PhVR0Fx86KgBUzk8z7raloU
	82Cswo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfd4-0000000HFUw-0VGe;
	Sun, 16 Mar 2025 04:29:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGD-0000000HCIL-1lhe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:02 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so5252345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097960; x=1742702760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClBpfryF0l26LJucqaea+hnSd7y5tppZSgQBloKDt3A=;
        b=UJfaO4QDK/3TRriW65ZaZFNL11A/1/j1Q++M0CwRFxRXQJ6eLYdS5VVwMYxbn8+gJS
         zSYw1wKmfVpBuhN7RkKHt6kujQ9EFZiKBF0y7mNblgF4PpQKpAY48cJ1Hdnt67iZJbSo
         VTYwPcOMBCWVwwF+YUjAlgTe/f5oQVIR5MclLMGDLzezOnep/Ct1a7b1pr1FkpxHLhY0
         x3GPTaMUV/BWl/SADUUM0fOJYmwd7fAaWOVw/eykOPAw3NemnFTH71KLjnX5alGTRCpN
         nqJI6AKbNdukwmTyLXogSKhzVGyp9sZyMH0DmNSr1X2xssgKMfQsAqIFcY1QBt+GeDij
         83mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097960; x=1742702760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClBpfryF0l26LJucqaea+hnSd7y5tppZSgQBloKDt3A=;
        b=U04ivbI6/fGhSkHwYZyJVRLLM8JquSU79vhmi+/TFf2FE5IzD5/jpMXEsI2GBTKgBn
         lPD8Yk0zGQI4i29sjFFxcKnE48mKHSFSGmto/VlypcVgfWpNdor8l9mefkrz9m+U1n7M
         4+cfdipWMD1o9fJvwhVJSo4jWwI2YWacnVBD4LZ62p551M2ZJmiTeSgErf+h2daAb5kv
         McKVIGC1fs5K7qgXBkAJmBkc+qJO04FbbYfcm9+BYY7GkMEvNGMqoI3wSn5PwLduB0D8
         JRxO7wgJCzXVQzn5gDtOJ+XLEfK1MUlQ8aPufeKJlCHl/l/8KBkUCkM8MSbfQb0uhjsL
         47kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6+pRnQBWSYXMYS9nxoSAr4+gP3jk1vX61LxKHJXImlVwT2ypcdHUX39BqAbyT+v0l8vqxKBEuwnS+2ZtlFPC@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOZGvzlBBMk8uH7uzu5XWu2EbHYBeMO+ysP5368YMcDSnGpPr
	xJtOFxgBSfwKqQXrPOb+FZleSImhB+lzy0CPBOTfnWMtZ8DNOaIh
X-Gm-Gg: ASbGncv45GVAU2vlCEHCaXD+h53yGxN5OVb2bpzFsUyPn7PDhr4ZZkUO0zIw/AHXy5E
	YeMSat8e7p7tZisOL8+giEUa3nHK1Ni+PcDSOOJtUelZPep45E3dnJ1/UcNj9TSMonMV20Uszzk
	K3B1eIRAK21CtF0t6xh8Lnzm+F8dXKGFMytDmpSjvIGX5xLzjsQiE53XDaOqFRI+pu0PweNA5TD
	xC18GZdy5Ngyeb5scdtRnUwGeo8+EmH7IH6kVmo1/8WbdRH4GgMWfGyqBJWiYYwRz0tRw4idpAy
	HyjvdaGO2sIZeV+fxomUMAw1Xn7rz/Qxk0Y=
X-Google-Smtp-Source: AGHT+IH/e6sr7Q8NtaxNCMMeZqQ+z9X8uI7I1YSl5ZwD64++FRmjeUrFOkqAexRXD/7ze8hpT1OmbA==
X-Received: by 2002:a05:6000:1562:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-395b70b7668mr13114610f8f.4.1742097960004;
        Sat, 15 Mar 2025 21:06:00 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:4f::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda30esm68369765e9.5.2025.03.15.21.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:59 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 13/25] rqspinlock: Add a test-and-set fallback
Date: Sat, 15 Mar 2025 21:05:29 -0700
Message-ID: <20250316040541.108729-14-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4142; h=from:subject; bh=6EUILfgiZohkAPsyvtNzcRk40CzXPZuYHAK+ukHSlzU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3dWZVH4cGT4jygyYaRMgYBKoSMntnk4oFzqRKP +TJ3LmiJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3QAKCRBM4MiGSL8RyhmDEA C1zcUyxSUagfAmjyxuovyTwYJTtWqoL5BpkcoMeatgpoXvSFS4tL7BP+3f57t/dG51OVYvBhT2RXN3 nhHuP1IuXSpAdZG+q3swIHEVfIED9SS3PCn0geldDUhkAzxMkpbZqWPwJhh4IcqZB+IWBsN7BZYtW+ eiq/JKntCpyChduNnwrkkDRMWiws3F5N+JllmYp8XC54/J48uYmiFyJaYYEUR7ONy+IL/f21dHKQrT 8xCYRQblvr2tXiLe/rj9uJrq5h9J1j+Qw16WsNZ8WDBUWx52xoX1xV1UdOS/8vQX9HCEOJ8KDbo/db spk5jmSQFHBWJjYK39tihe0CXejyi/J+FpiRzMRNopnL44+efFbw10U5IgaVjMEP9LkozIVmnowmrI jCZ5a0OfO+eZf6xAeHlknuB9N5Zl0SNEZhWh3ayRtPeF/OpHs9sZrE+CaTsjnHnh2g8vIQt/VzzuU9 bJyTo/zGSOiYSFmfYQPN3JfpgR58GeJTqb15WlpNy21ivZWR9dptXHGTECX7xeEoJ7ns+MuNnYAC9e miR4qDevVacWqmiWfTKfc8CbfAmZI//+1NKlJgfhOomrfHwGNvSEeKxTnMs0pANCDx/wKI/kHLuWqC rR72s0G1l2FIBNETNQNhbftHp/sZqx1oEyYMlCsrRgBNyzGuhAHxNLnCg7Ww==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210601_467976_486A4966 
X-CRM114-Status: GOOD (  18.39  )
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

Include a test-and-set fallback when queued spinlock support is not
available. Introduce a rqspinlock type to act as a fallback when
qspinlock support is absent.

Include ifdef guards to ensure the slow path in this file is only
compiled when CONFIG_QUEUED_SPINLOCKS=y. Subsequent patches will add
further logic to ensure fallback to the test-and-set implementation
when queued spinlock support is unavailable on an architecture.

Unlike other waiting loops in rqspinlock code, the one for test-and-set
has no theoretical upper bound under contention, therefore we need a
longer timeout than usual. Bump it up to a second in this case.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 17 ++++++++++++
 kernel/bpf/rqspinlock.c          | 46 ++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 34c3dcb4299e..12f72c4a97cd 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -12,11 +12,28 @@
 #include <linux/types.h>
 #include <vdso/time64.h>
 #include <linux/percpu.h>
+#ifdef CONFIG_QUEUED_SPINLOCKS
+#include <asm/qspinlock.h>
+#endif
+
+struct rqspinlock {
+	union {
+		atomic_t val;
+		u32 locked;
+	};
+};
 
 struct qspinlock;
+#ifdef CONFIG_QUEUED_SPINLOCKS
 typedef struct qspinlock rqspinlock_t;
+#else
+typedef struct rqspinlock rqspinlock_t;
+#endif
 
+extern int resilient_tas_spin_lock(rqspinlock_t *lock);
+#ifdef CONFIG_QUEUED_SPINLOCKS
 extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
+#endif
 
 /*
  * Default timeout for waiting loops is 0.25 seconds
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index bddbcc47d38f..714dfab5caa8 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -21,7 +21,9 @@
 #include <linux/mutex.h>
 #include <linux/prefetch.h>
 #include <asm/byteorder.h>
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #include <asm/qspinlock.h>
+#endif
 #include <trace/events/lock.h>
 #include <asm/rqspinlock.h>
 #include <linux/timekeeping.h>
@@ -29,9 +31,12 @@
 /*
  * Include queued spinlock definitions and statistics code
  */
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #include "../locking/qspinlock.h"
 #include "../locking/lock_events.h"
 #include "rqspinlock.h"
+#include "../locking/mcs_spinlock.h"
+#endif
 
 /*
  * The basic principle of a queue-based spinlock can best be understood
@@ -70,8 +75,6 @@
  *
  */
 
-#include "../locking/mcs_spinlock.h"
-
 struct rqspinlock_timeout {
 	u64 timeout_end;
 	u64 duration;
@@ -263,6 +266,43 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
  */
 #define RES_RESET_TIMEOUT(ts, _duration) ({ (ts).timeout_end = 0; (ts).duration = _duration; })
 
+/*
+ * Provide a test-and-set fallback for cases when queued spin lock support is
+ * absent from the architecture.
+ */
+int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock)
+{
+	struct rqspinlock_timeout ts;
+	int val, ret = 0;
+
+	RES_INIT_TIMEOUT(ts);
+	grab_held_lock_entry(lock);
+
+	/*
+	 * Since the waiting loop's time is dependent on the amount of
+	 * contention, a short timeout unlike rqspinlock waiting loops
+	 * isn't enough. Choose a second as the timeout value.
+	 */
+	RES_RESET_TIMEOUT(ts, NSEC_PER_SEC);
+retry:
+	val = atomic_read(&lock->val);
+
+	if (val || !atomic_try_cmpxchg(&lock->val, &val, 1)) {
+		if (RES_CHECK_TIMEOUT(ts, ret, ~0u))
+			goto out;
+		cpu_relax();
+		goto retry;
+	}
+
+	return 0;
+out:
+	release_held_lock_entry();
+	return ret;
+}
+EXPORT_SYMBOL_GPL(resilient_tas_spin_lock);
+
+#ifdef CONFIG_QUEUED_SPINLOCKS
+
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
  * contexts: task, softirq, hardirq, nmi.
@@ -616,3 +656,5 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(resilient_queued_spin_lock_slowpath);
+
+#endif /* CONFIG_QUEUED_SPINLOCKS */
-- 
2.47.1


