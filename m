Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F52C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbiXkX+sz+mKWhiZ2JD9Yjh7XLLMoN8o2kVSbNXCy0Y=; b=myM9v3CY38IRYLcPJTtxH4qKoQ
	WLXpL1S9zIxMC2ezkyOeXS5xUepaOpvkDNQbYVspV5izyIZzoQqO89LQQgcADBAY49zV/e5412ss7
	GuwlTMIHXD8JlkFfhz6FQAeB1v/lUwdNwDGT2qjrRN0jXSQL7l00NCR58Z6tuZ49TJb/UVryTz2UO
	ZI9sXnASOhiJe6taw2nj3ykD/V5PqaA/hnQisVpEYk1gro9uZmKO+OHFYQoByf8AI3y02UqCtXWUg
	BXWYiGVX52Lf8P2N4RZrePu1pllxA19xrSPtY/t/iaIRYEF09BuYfuYuqE5Q2An39LDJc2xpF32nN
	Efhyx8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp83q-00000001O2B-0jbF;
	Mon, 03 Mar 2025 15:50:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dl-00000001IL2-3oGA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Mar 2025 15:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hbiXkX+sz+mKWhiZ2JD9Yjh7XLLMoN8o2kVSbNXCy0Y=; b=OjJX0Eu8UOalTZ25uaJsoQqaqM
	1lCAhxwIzxbHkGAENxszzVK5oMmNZ0qHQOetS4YOiGsGpd3VFPTe/HDW9jxxkqSUXK17U+/dIm0yZ
	idpZVfJ8XhI92tdhQFivR9nP03dcrylRAkEAkw70yoUi0LnhjH7i843TQ9N9GHJCSBHkCvngtF/B/
	tary/G0sfoOi2+VrXgt/DxaTbz0MwsjW3CWFwam2wwBM/F5bdxow7TIMsp3KIXu5lU1R48xPpJmPQ
	jFmr273mADVVZCmtoYV24IkIuY12AfGTsYfPjIOtbIipMxiCK5zkjfzd9xUsecz01dQZmEGoVx2AU
	gm5ElKUA==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7di-00000004Zzb-3VJj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so13970075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015408; x=1741620208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbiXkX+sz+mKWhiZ2JD9Yjh7XLLMoN8o2kVSbNXCy0Y=;
        b=jN5EfvZJBcO+blCOpiqFDWAOJ5tjQGL1HjR4Asj2/t9FHgcUMKlobVxTSXj/dCv3mh
         +NqBp2/7xkL7SKRhLstAw6iUkqtISMTg0qjJgfkzgKbrh0oeFZmxdGsLPvmeB2AOPsfq
         wqN1rZZQQZJML++X72doaB+k7BpvimSuOFiwbdUIu66S8Upt4+7sw21PWXvuLxEcIhn/
         Yv/jGC9oNNs/mqbegr8AqyVWKOdjklg4HJyIANQBc4/JAcpMWbdYSteNKdjavrfKy4Sn
         HoJRZD0UM66BgSotiObEsyqEMMsU5acdtlYtdqOZwODbOjKx80E8uGVFRajf/Duudnya
         wO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015408; x=1741620208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbiXkX+sz+mKWhiZ2JD9Yjh7XLLMoN8o2kVSbNXCy0Y=;
        b=fgXohOgIMO63X8N5vZGP3K1LzJ7wwse1BZqj6l/KnQoUJ2nawX8zQHZLqyHg5Eh+/5
         8Uw/Qy44G6pceI1K4BBlrAQu0IVecqlHy0MfI17Bm9RJs+KlrgWRJBsyxQ4nG/HpIPKV
         GNgUXWCuGeaqo0V1lM1cEGQd/L/WlUcNrpNWV9Cnm2VUqnAnTJBkFK7XRZnzfEiiugYS
         6D1HtS2SlQ+pD6B8502cfyKmo9Acf/O9gcTUlCd2GbIH9CUKfwCQ98OZj7o4Vz9xHNJY
         pPmD0ZTp7vljlsNktIC74qzcn0F9Qi+jFKoT9aOi6AGGi+31/moNxToEScyIGIMTxe5O
         UNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWdQq2UkGft7zTe7VtIF3lbCwpIOwKtjXArHbHfTYz8k0QTmqjH3KWPG79H7mZNJVkQ2Oyj2VgazQzloYNp7jmH@lists.infradead.org
X-Gm-Message-State: AOJu0YxLVsTFS5BhqoHl6lLonUAtGw2oJvj+j7FYQVx6apTQsOsUwydx
	PXKxCKWlw5X57TcYWPipyzWDKf6+lNd/dDvsQ1Ttr1GRDe0W4OSb
X-Gm-Gg: ASbGnct2IEcZp7m3RkhW0vXGXWpA6RaBmbWI/P6V3pfCzGkQDETFsfWrYCReGxgT9UI
	Rqu3/QDdx2zIU04OBBpVTH1npOXqRpZaZ8pyAnqPkkoJ0QBS/m/Vhpzc7I2BKa3ao8jnQhUUUWH
	RcXycrSA+kF+zsY9mjoms41BK3xiSOl4wj5gQ9Ced3hoSBvrwN3Jt58vj5/FaaBdn/erbqFQrTg
	wZ5ODIiF4+sWg6eTbi+YmL8uirbzsy0YGGu8oPGLqM4O6ipyF4geoofkuzifNgZO4cUG6w6i9LQ
	ULsEGdkRH6mjq5S7orMllWed6r16wH9hSJE=
X-Google-Smtp-Source: AGHT+IGKz1oo1UHRACNo+L3weWdPcL06paS7sy9ejxox0qqfekJgP8kl/qKZCrzxii+jUg8vEiUMxA==
X-Received: by 2002:a05:600c:4685:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ba67045camr146732535e9.14.1741015408419;
        Mon, 03 Mar 2025 07:23:28 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:74::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d8e4sm14531679f8f.85.2025.03.03.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:27 -0800 (PST)
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
Subject: [PATCH bpf-next v3 14/25] rqspinlock: Add basic support for CONFIG_PARAVIRT
Date: Mon,  3 Mar 2025 07:22:54 -0800
Message-ID: <20250303152305.3195648-15-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277; h=from:subject; bh=SCTiw9WUUkbOGd1OOljQ8eDMmea9HElqFJBZYwx5dAE=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWXfTMwb5GMWPgrjqrFJA/0gyw9UdNiWN2qmLrL O0hijiGJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlwAKCRBM4MiGSL8Ryu1NEA CTUuGHPTrmc3ouIq7xk/7vEotpGLUGgeucb8GQwgQo6rcM9OI5bBvMW9JZfYy/los+WuIlwT/5IdCo AYY6qGCzJtoH464Llu8bFT1g6BAyOhZoDkX30C4FLyMD7aeKOCsD4w4X1KQJ0ITOJjLgSiO02ZBcsk G+vSU3qCtMZHbeLI9Q3/47WprV1GDIVEhOPmoC4z80iJULvFyEEv1KPAsKo+TyvXw2oYlSbxG+1gBi 1wmztdcoMQy6Y25bbcqgDlSLphn/5jKPVmwA/PqJCSlHPCcKKDENr5iG+htXq3ifKoKap5E/XN3j1P jGGqMu1j7i2P7YfUmNzvcqd+995DkNkOql0XTtz5YXJU70HWgDDjw2yhkdCHu8HgF+xp8nM1Y5yZHx UhdzTefDYMPL5JVyOInrepgDvHYQkN52ytGBNLKZt6tBQmXSeSSKJxhmpHya3TBUlZ78CPzq9vCVut qCdY7gXM8RU5a13RYFgs3bRptzVLJiuo+wnUZRwM7Cob+PtqcIIrMV1tm6IdmQBmSY8EzRJM447VxP ERz7W85ZSGfHanbBjbzfofA1Q57J4Au8euTPc7e/mx0ZR2sk/gqk632LbaDQKoQcxFXXSO+DEafFhX F8BMJap/MTZa0kNF5S+kGk3gqFtzwIqXvRBWM8HCOLgpW8KCnOFSK/bHk0mw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_152331_321650_1206E663 
X-CRM114-Status: GOOD (  16.95  )
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
 kernel/locking/rqspinlock.c       |  3 +++
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
index b30a86abad7b..f8850f09d0d6 100644
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
diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 27ab4642f894..b06256bb16f4 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -345,6 +345,9 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
+	if (resilient_virt_spin_lock_enabled())
+		return resilient_virt_spin_lock(lock);
+
 	RES_INIT_TIMEOUT(ts);
 
 	/*
-- 
2.43.5


