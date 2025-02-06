Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F23C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bppDtbpuPfpz/O7JpsRY6fQstRsmaQoxcIF1IN9rk84=; b=UdlLQMuh+qe2F2vA/q2gERFj4N
	uDS6NBWB0xawoxu51HjaeC2UWc7AwxskT4mvumP+SjvL3ZpSYR0Xt6TZZICTonQpryt8y0KgHzKCA
	nGToPMdkyAOEvg4DyZoWotor6iBXjKZTMPqxqx9JJWugGRt85Q0xVZoYPt+2wnxtevyb4GnLmGQ4R
	bkmWtdpHFbBvEQm6yTZth/+hCYBzfx+001hLgt2wnYdUO0mB1j6n3VasKk+03kKnMEgtxirJwMnNa
	412ATf3RpBMoONTtEWc2Rr2DrHiE/lC8GjfPI8PEzdHzns+6XeBdJzdjY5WKsWWNDlh3Anya+H7rw
	rZ5I0ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzoL-000000065gp-36xj;
	Thu, 06 Feb 2025 11:12:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX8-000000061bq-3zqQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bppDtbpuPfpz/O7JpsRY6fQstRsmaQoxcIF1IN9rk84=; b=Huk1IpLItg6UnmweuBLluG1b2U
	Q3ORUfDj4g5OFPUIQgP6z6a0mrkAyLISWNfjQpVWN+fm1RuvG9fQxYCpB6ldFk0kv0RFY3W8PxJaI
	Mo4LeHRe6nE7edxgH8sRcH7ho5FpmexQAeW/FnpKL+QGxKZT2ZFtPk3UDg1UJbpjj2+jco0TPXvcd
	ev+HpOFKe8SVrtufwP48vVD8CVTGCcHeEWmksMwG+670k4t1Qxzn/WkVteqt8BHWJhazIyvFXhtZF
	3yjlzt1yDSA9gnb+//DaUmxbaBu+ZGWgYQ3AQDGqLxvufXTlElOzE+8OCiFIHtU1dN7rd8zfBWS72
	hmKesemA==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzX6-0000000Guu3-0XlL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:54:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso4699995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839294; x=1739444094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bppDtbpuPfpz/O7JpsRY6fQstRsmaQoxcIF1IN9rk84=;
        b=SiHYQh3jC4nKDoaBUzs78QTBVG3zfVmoPMObZFyH8NEjhlL0iciz/3KUSTRaGs5b+9
         fwaEBFTddmFSNt4dpltNYmvs6JAKuTTcKYAh8aZ+WIbMunzDrTgSUab1PonVNFy7IIwD
         kb35+BueBlxecspmz079nZ0O186mzPAgPETSkqhsILuEvM3HzJvu3hS7Tssp7wKP0uUe
         w5uJoYuoKk1N9QPQzMhghXdyiNaJX7MOKy5rvrIvyAl3ii7oLq6n7Vb7OeHD37LsySCt
         45Y2yIGloqDwuNpKgMOetZzh32D1+UrsZpbQo3lfa3n3YhWA51yOcCvaKegI3mVo2thH
         FlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839294; x=1739444094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bppDtbpuPfpz/O7JpsRY6fQstRsmaQoxcIF1IN9rk84=;
        b=CE4kuQ7omF9w+cRz0hvnvPaGhjohnvsM7d35zATxc+fMcmPD9hLY/MY3n59npIH3Al
         dilEqcGr0sNMSpMVdgZdw3NS442UV6MBYcrE4WZmlkFiA5t2gxfPwxFG2OMJG0G4091T
         goCwOoSyH3Sapigk/Baj0BOtY9g1d8siNV4JzC8knFqULNnNaK46nPWuY+kObjWEG+46
         KduBPbtoY/4c/VYyZkghYFvWNeELUZ4rPqvQSo5H0bkOn9/Ua7Bl3gBdvg/fGnUbIyHZ
         UtpcNq4K9ufM8E+1v4ajg5wxrrRLvPySGyeYMqNC0VU1XYdurFJQt4IM0LHsO4eq+MpR
         7UAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwFZmdUvBiBoEXZ1cQz7ywhm9TXAmXo9kEXrSMoBuNEm2PQFCrVqtlhNnnrbw1gbe8c+nfUgMn+e5RfW43QZgt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh7qFlm4p3l8LAWAZbRQ2vCGM8LknKt9jACSFFVvhNKHt3jqQB
	2VCFS3r1Kg0TA7w3KVBwAlbn3GnuvIxT0OmGfm3qYFMVd6cUlX1F
X-Gm-Gg: ASbGncsjTZGZ1/cc53tgc8dDsswmWOqdRS8nsmrQbNY+Hmpe8wf4hjmjmUhT9r3xlCr
	hSFs32ucLjltXuQwPH/CUqoOKJp1lhoF4OSJDZx2mT7aRtUwuMPRIiPxGXLY+hsapIPnkSrJi6k
	axUnAfbaejA2VRYOw9pPUAPqLChrKSKzmW2bnVXRjYDH/LQDQUF2Z4zw9MUAr45PQ6wH7flmcL8
	0+AdSw5lzgAzumLQ34UdQQlXKsNNqqceP5nBvNMmU68YG+A4oPnxaynVXekTESb3dEQYDRBA/O3
	qOWj
X-Google-Smtp-Source: AGHT+IH4Mj74Q6s6ESR+HQuLAWKyeMTzag9eq/JQXW9Gs5KkYpw8nRAczk2OFAZMAasQewSLnwMzRQ==
X-Received: by 2002:a05:600c:1c90:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4390d56e3admr51736725e9.29.1738839293937;
        Thu, 06 Feb 2025 02:54:53 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:3::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd36346sm1391806f8f.27.2025.02.06.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:54:53 -0800 (PST)
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
Subject: [PATCH bpf-next v2 12/26] rqspinlock: Add a test-and-set fallback
Date: Thu,  6 Feb 2025 02:54:20 -0800
Message-ID: <20250206105435.2159977-13-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3427; h=from:subject; bh=nWMxFCMQuXMGccLr9BZ8Vd2VRz48kOmVrJhLP51E7zU=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRlMFpWa3g5n8jTl6bpUsPGHtx8MXyfjnnCKJt9 AHs008SJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZQAKCRBM4MiGSL8RyvWnD/ 9ElDHw+LJcUwAOu/LB12XiFVDPKFpTcnqBAIIgWpttUZIU9wtEERsQL0IYyZVGNxKf6NjzmCa5aWjB 6dG2OM5EHYXz75cwkHfgazZPzdvgoVeDK/X6Rt2/k5eFlhkvDpaZ1RJQQbPSvRy3B4iNrYvUxPRntH 0siGNJGxXXk2/BF8QAsO0/9VyB0myTjnkvBLTYazkhPxYeGYJPOVUfjk9cl5Z2kz+zKGi7S7EVov5k EoVNvIcbjJp6aOpxZ0Cl81l9juNQk5dH73X0Y6yLqqcmxRePAdscK6ygQ0v6j5b5bZg1vt9NqzHfbx bcepMH3rFrZmAqXnSuel7pnTFM4tuaOV9SyNfh2zbTXiyWyQFXxPuGFx1+OLztjitTNulOf0KE+BUh HpLSN8XCqNmM10ErdfqRD80ZDXesuP0vqDokTCpTWKQXbVlnLiWGEwIOnyoE0LWBwqn/XvqhOIFrv4 DYsmQzW+k7QJRAtKWsWYpWOHweuglwIcQeVSluJEnfGNkaIUyHbEU8X0V7jEnkdX5De3i1bERuidMP wM5fvNrUBt5JbXAuZjfP1QaTVtQYh+Rc0k6cDl6I0PUPAi5aAglDK3T8+HJtDTOjLvWN3st8/uhyl5 rLuvZDv3ZySigXnWcS+rrjCZ06WAgFBD5LZbLsv4etjiyzSaJO4h2bT6JiIA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105456_352928_7BCF6179 
X-CRM114-Status: GOOD (  15.48  )
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

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/asm-generic/rqspinlock.h | 17 +++++++++++++++
 kernel/locking/rqspinlock.c      | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index c1dbd25287a1..92e53b2aafb9 100644
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
 
+extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
+#ifdef CONFIG_QUEUED_SPINLOCKS
 extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
+#endif
 
 /*
  * Default timeout for waiting loops is 0.5 seconds
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 42e8a56534b6..ea034e80f855 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
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
@@ -29,8 +31,10 @@
 /*
  * Include queued spinlock definitions and statistics code
  */
+#ifdef CONFIG_QUEUED_SPINLOCKS
 #include "qspinlock.h"
 #include "rqspinlock.h"
+#endif
 #include "qspinlock_stat.h"
 
 /*
@@ -252,6 +256,37 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
  */
 #define RES_RESET_TIMEOUT(ts) ({ (ts).timeout_end = 0; })
 
+/*
+ * Provide a test-and-set fallback for cases when queued spin lock support is
+ * absent from the architecture.
+ */
+int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout)
+{
+	struct rqspinlock_timeout ts;
+	int val, ret = 0;
+
+	RES_INIT_TIMEOUT(ts, timeout);
+	grab_held_lock_entry(lock);
+retry:
+	val = atomic_read(&lock->val);
+
+	if (val || !atomic_try_cmpxchg(&lock->val, &val, 1)) {
+		if (RES_CHECK_TIMEOUT(ts, ret, ~0u)) {
+			lockevent_inc(rqspinlock_lock_timeout);
+			goto out;
+		}
+		cpu_relax();
+		goto retry;
+	}
+
+	return 0;
+out:
+	release_held_lock_entry();
+	return ret;
+}
+
+#ifdef CONFIG_QUEUED_SPINLOCKS
+
 /*
  * Per-CPU queue node structures; we can never have more than 4 nested
  * contexts: task, softirq, hardirq, nmi.
@@ -581,3 +616,5 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val,
 	return ret;
 }
 EXPORT_SYMBOL(resilient_queued_spin_lock_slowpath);
+
+#endif /* CONFIG_QUEUED_SPINLOCKS */
-- 
2.43.5


