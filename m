Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D516EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SJ4rKlnRTNLC7EmgTg9GusoyyGplCB9SKvBAwvhMho=; b=QfZbQX1zekUyZdNqwZ6+2JjbFB
	KO2xK+CuLQ8oNB8zriwExj5ot161HU9uf/WRlsRVdfyw5nh3vDRbmbGoahKYyOTe+11PgYYrrJl27
	PeJebTsztjhwAtSNwhDB2pd+clC7IF/PSV1gxqa2kuSwkVr88z9qiY4vhQbkBRjr9/aCGudrfzw1q
	G8J3IxlfLUbNIST5Ij2XXdV+7wfGI/I3YQohrFXgWJ/KQY4Nrwcrr4Up7e3pY2XRRw878isve66lT
	4Cexk6fe0RLKUAhp9Fa33yDLkTd3zE+WmP9NtBDzOokARINs/Q7ShW4JWcwXKtI8Lud6jmQIq6Sjv
	8JYfkpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfei-0000000HG0B-3q5x;
	Sun, 16 Mar 2025 04:31:20 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfGF-0000000HCJF-0Lfe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:06:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so5089765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097962; x=1742702762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SJ4rKlnRTNLC7EmgTg9GusoyyGplCB9SKvBAwvhMho=;
        b=WCeXW5ugTKckp1EO5XXkpb7joOKwJbhMYupici7E/4/hyHXIZ17lI9Rnddy8mCLHy+
         jETCr7EqH6WLgzA9z339ujGCXtGDbpRvXmDToZB5mEUyos+y2fP2fRNnaBTKA2FbwKAL
         Vb6Kk3kFp+xZgbgZ7J5IK1Md3CBsTIEFni7TMjTb1mbKMBbkXWP91KNzFn60Z7ryeBQX
         DA5uP0m0+tlcdauV1hgquGkfwjo2Z2VsyAFBbEoYLTewI0pctj0pDYtMEd3XA+Cay/Ea
         m8WzcyCmeke7udW5m7z3Baxh8vzfL9d2VFbvISDpR8RIDoN+e43430l+yfBvW+dgGeXb
         xVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097962; x=1742702762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SJ4rKlnRTNLC7EmgTg9GusoyyGplCB9SKvBAwvhMho=;
        b=md0TtHVQKFmOPkfpRfHCutbngga+0b2c6iOz+9hpC2+TGjwbC3xNFnHPIxsJVvw6vH
         7s+5kS1tuoVIEfTu/SaCMKbg4Gdt4JENatZR1uRiIjOvoySC/0bPN80t9jxiWHZcBNxq
         cIh6Zb4YsLS+q7QeAGwc2MtS8yiwZM4TwO0IpwqsM+IEVPEAPD+eb0sa9+qZPgKErT2/
         19/y1MDRT/ehUzh95dNQDVFnWFFxYK0EpLOLVVvjJbpp31quk0gFZlSlodzoZE3N6Yei
         yp5do+xI6R2SXw+WH/xvTNXIeKBPaFV8taRoxZU5uqM86l5XfPo/fHxEgPb4I0zLUpIZ
         fVgg==
X-Forwarded-Encrypted: i=1; AJvYcCXiSH+onDEVEmGjqSGaD7+2LMICGrYPKnrmwpYj6sH/6FDao9msDPL4rh5qk5QpcOsZs5vUCS52mv9TMoEfIxGH@lists.infradead.org
X-Gm-Message-State: AOJu0YytEDlic6j/bDltI55ITANsqiDG/5Fi0XECW8TZnu2SvhMRjLB1
	/4TkO6vh+paMFLK4FgsrSMNuNH2Nk6xKwLEtjwWZ3CssqIxQ3QdX
X-Gm-Gg: ASbGncuM9zOvOD1jYsFHi8NMIgEGcUV162OqccNh8iiEIECZa6tCMK8i2bYXRFe4Kof
	ZU75dC3CUhbCkVtMQmGaF9orgS9WEvff3UXyjjx4SThOWmhhNVoAte8jTitbdTjm+IGyiBcesa/
	LCbk+b+xHZo3G8KuoejnsQf6oHMGa+Kf48hb5q+RHAredDNJTbvMkaLWTu0tQSvkXo5a1qO6QKn
	98jTvUsKH2IUlx1FjhufqC4VUd6QdUQkqPIbDf5FHGcqaxoF3YpjChxeWE96N2To+qc4pf9yzAp
	3waeFv2w9PbGG8OXZKDdjGI6ZbQPamgZcmM=
X-Google-Smtp-Source: AGHT+IEG8+7fAz+0OnMkkxzP6+jI+ColvkT10MRmYk8Gri8AF6ZxFi7vPhA4DMmTFfNK0LsRQARGzA==
X-Received: by 2002:a05:600c:1d1a:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43d1ec87be2mr100575065e9.15.1742097961450;
        Sat, 15 Mar 2025 21:06:01 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:70::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609dasm66578265e9.28.2025.03.15.21.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:06:00 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 14/25] rqspinlock: Add basic support for CONFIG_PARAVIRT
Date: Sat, 15 Mar 2025 21:05:30 -0700
Message-ID: <20250316040541.108729-15-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261; h=from:subject; bh=9lJX2DtyRTnUplpFVsYE5ziAxwiiosjb1D9cDEXkG+8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3dEsMhP+74YqrqyvnIh88VKcNnAxL0cvJ1gkJa n7xGLWyJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3QAKCRBM4MiGSL8Rynp7D/ 9jwO0LqsAd6i0H1M1SNcFjzNyEgzms+NwhZBtBuTdTvqAT3wwJj/F4EEK9EJQFykdau+00yKY/pgkR PEVdRrxlAgs2crbDzjqJYh+q9G8WNGP+ThpQ+Zt+aw/TVeYukHpS1pR9iEmD9srnDE2dwebiAGPgMM vTFWGqOETpp80HUL8s2G0XCRaH0zfVXr66xapYIetDVzQF3xUHsS3DDcFORGeinrUfxhoMZBRNkRpt xHq2rF0Oll2LPziNq1W4U5lK75qNdpx3oRkhj+J0GxrLo2VYmf1jZjs1Pu6Tjls7sPAuCKGc1sNfpS IDLbiiBhtgpaN8QlAzXc1TliiueghupnCo+aVENDvLEHG4QQhpeyGROKQPIJ0/cABmhk8YeMQ6eg1t NBNIZblT+x0GbPMC1SZ6cVNewgGcNju7EedsTRHf/SrbrIuDhXY0XZ2aZOzt8gKa4kk1obC3tFP+GE k1ddu1M9BmjHiqEhAX6NpIf1U2Rwsg3tljPLO06eQOH/TWhlonNlZYWV4s35e2UG0C3gGcj5Uk7p1E h5WyV089i3EAdv/Bmul3PVl64TmvbJSqqDNMSyPFFUS3n3IjFeEhF6GX8NEeNGPNzpYJAgQvnGibRB k7tvZ6agwzjq0rg4VW9szOQG84Ei1XQvpZiRUTuhGSeEo0cdLmuN9TNcntsA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210603_196041_CB651241 
X-CRM114-Status: GOOD (  17.19  )
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

We ripped out PV and virtualization related bits from rqspinlock in an
earlier commit, however, a fair lock performs poorly within a virtual
machine when the lock holder is preempted. As such, retain the
virt_spin_lock fallback to test and set lock, but with timeout and
deadlock detection. We can do this by simply depending on the
resilient_tas_spin_lock implementation from the previous patch.

We don't integrate support for CONFIG_PARAVIRT_SPINLOCKS yet, as that
requires more involved algorithmic changes and introduces more
complexity. It can be done when the need arises in the future.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 arch/x86/include/asm/rqspinlock.h | 33 +++++++++++++++++++++++++++++++
 include/asm-generic/rqspinlock.h  | 14 +++++++++++++
 kernel/bpf/rqspinlock.c           |  3 +++
 3 files changed, 50 insertions(+)
 create mode 100644 arch/x86/include/asm/rqspinlock.h

diff --git a/arch/x86/include/asm/rqspinlock.h b/arch/x86/include/asm/rqspinlock.h
new file mode 100644
index 000000000000..24a885449ee6
--- /dev/null
+++ b/arch/x86/include/asm/rqspinlock.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_RQSPINLOCK_H
+#define _ASM_X86_RQSPINLOCK_H
+
+#include <asm/paravirt.h>
+
+#ifdef CONFIG_PARAVIRT
+DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
+
+#define resilient_virt_spin_lock_enabled resilient_virt_spin_lock_enabled
+static __always_inline bool resilient_virt_spin_lock_enabled(void)
+{
+       return static_branch_likely(&virt_spin_lock_key);
+}
+
+#ifdef CONFIG_QUEUED_SPINLOCKS
+typedef struct qspinlock rqspinlock_t;
+#else
+typedef struct rqspinlock rqspinlock_t;
+#endif
+extern int resilient_tas_spin_lock(rqspinlock_t *lock);
+
+#define resilient_virt_spin_lock resilient_virt_spin_lock
+static inline int resilient_virt_spin_lock(rqspinlock_t *lock)
+{
+	return resilient_tas_spin_lock(lock);
+}
+
+#endif /* CONFIG_PARAVIRT */
+
+#include <asm-generic/rqspinlock.h>
+
+#endif /* _ASM_X86_RQSPINLOCK_H */
diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspinlock.h
index 12f72c4a97cd..a837c6b6abd9 100644
--- a/include/asm-generic/rqspinlock.h
+++ b/include/asm-generic/rqspinlock.h
@@ -35,6 +35,20 @@ extern int resilient_tas_spin_lock(rqspinlock_t *lock);
 extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val);
 #endif
 
+#ifndef resilient_virt_spin_lock_enabled
+static __always_inline bool resilient_virt_spin_lock_enabled(void)
+{
+	return false;
+}
+#endif
+
+#ifndef resilient_virt_spin_lock
+static __always_inline int resilient_virt_spin_lock(rqspinlock_t *lock)
+{
+	return 0;
+}
+#endif
+
 /*
  * Default timeout for waiting loops is 0.25 seconds
  */
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 714dfab5caa8..ed21ee010063 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -352,6 +352,9 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
+	if (resilient_virt_spin_lock_enabled())
+		return resilient_virt_spin_lock(lock);
+
 	RES_INIT_TIMEOUT(ts);
 
 	/*
-- 
2.47.1


