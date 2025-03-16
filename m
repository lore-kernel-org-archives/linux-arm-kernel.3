Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D1EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFK9QP2ryp6S9vfpdoBhpsIqnMqrZRtjhBu2k3+ZF1k=; b=ZqXjwa0p94o/M4JB58IHKyl+Tq
	xijpGQTXGxAXDrAYISR5p5Ly0OX6PihC9ACd1m+ktwcy4LJl3fsSllypfyAitXl7AnEhwXJudiD1C
	WcQgVCSWaWdJBRGiTVdROMFJQkvUvpOh+AOydCCmLemiGEhHXt2GtuuftthKZ9CxXmpvR8RwZ+XDu
	yy1NXbT89YdtdECHA159z6vReYhwzAfDudRR/jVKHCB1QdnWDM6huaaewlkDxHFdBwUx5eWVpcJNP
	wMGRM9UmTPmu1CgZCqME5vfUmYHiud8625vQs0qmlA0dw1L1Ea/asgGK07ltfeywf87nycdaKBHa4
	Nbwb/Avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfUp-0000000HEgU-1UaC;
	Sun, 16 Mar 2025 04:21:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG6-0000000HCEF-2kFw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:55 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-43d0618746bso7043455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097953; x=1742702753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFK9QP2ryp6S9vfpdoBhpsIqnMqrZRtjhBu2k3+ZF1k=;
        b=ID+IbasKIgqcjFt12ywQWhWm0yila5OC+eiup4IrP1rIjInejv+RH4y9dN1w6fbJ8k
         mvqYBnto/B0H2GnNT5LHFSBiQgLm8bTlUbfzWhar6/13MvgvT2S98xz+t5bJAxf+PDvr
         tclnHF1NYPUwBgPqatnHIfuT5H3W1NSt0U8p4AIuIL7WP0UXJKPk9rbvWYbNgHzzG4SY
         IZBsOqlLenC4oIqS1hT+AoXnNVigkOVAE7SfHhcaGXPBvRermKVtSxG4teFmdJdrwFOu
         Zxujax7O1OErVrXT4Mj7wiSGlq81MGlwrD9OtmnJRdhd+cjrzMQACTX3F0S2M0E1YT2j
         tS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097953; x=1742702753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFK9QP2ryp6S9vfpdoBhpsIqnMqrZRtjhBu2k3+ZF1k=;
        b=veElZ4ZOqHtwHKDp5fxQobLe8gMWVBHToi46j1fxhZ+wO5rOj+c15+n+NwxBawwQtz
         QfXuyysAdFC0RSrZbzM6hjQII3XmrHBdTJKWAiZgS4NYb5A8bGiRQ0y8ddzTJ+u1DkGp
         C0bJhZ+sPjo2zzYIHBkEkuTZOl+MF1FaG9Dx2aM2TRfgJmoHpdTujpn22wyudlPOhpn+
         /FWD/z76tFsVwmK8AWxJKtsJ4UhdceDVmACU6EmTl4WPm10MOddatvUChorEzwHSefHZ
         obScHrEBCQsADdVkcrgcu/pgrQDeRQOje1ZodUhYV7Ad0//mD/JzmNrv6GtBkzDFtQCI
         DliQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAoe5n05REndS+AoFCjB/K4FOYzTFX/v/lb0qylL/MSnMAo43Q0S8hvCkzP2rBWBbierc3kWt7c38rK3HjNe7f@lists.infradead.org
X-Gm-Message-State: AOJu0YzsNnJioP5A+2+zt1mkQGUgegQ3TpWOQudAbqbC/LD9iheKzq+O
	hE1gDz90mfftXcqe68DXJ7N7GLCVbolHiiPCB3aYla+4Bbhk1nrs
X-Gm-Gg: ASbGnctF1zqHA5wdNc342CCELg/m5/fQTVs6m20C+TK6CJVX3+BILJ1XyHUqmXXCrUR
	SpfXFwuDHOg92Yk8+DmJHW1H/w9Mx82L9dbL6t9jSkZwuHPQYyjawnrQhruA4aKJ7LmvnqFHTF8
	2FF+66plHcCHVUZzEQyGWnf/jBJ5tn/oVtxJtUT6En9Hf1ysiNoKM65EoxgJaYDBFqMzkfxJKm+
	+JF+a8KmULIDqOmZ636YE2z6yK23PMaip5Yh+O/mSYeIDnsIQmKpDdF5r1igQZp1O8ixU4Ad/eL
	fdkjYOYTYu68s2wO1CHsA93EL/6ptNHKzA==
X-Google-Smtp-Source: AGHT+IGhUW+f1q1VNdCXhZBFgRFdmfv75hlIFEK2IxoeJXmnqDxRW8wtCa/CmOIyhQqKD2xosxaDyg==
X-Received: by 2002:a05:6000:1aca:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-397209627cbmr11722558f8f.35.1742097953204;
        Sat, 15 Mar 2025 21:05:53 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:5::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe60b91sm67304495e9.31.2025.03.15.21.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:52 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
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
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 08/25] rqspinlock: Hardcode cond_acquire loops for arm64
Date: Sat, 15 Mar 2025 21:05:24 -0700
Message-ID: <20250316040541.108729-9-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6176; h=from:subject; bh=lKBJ9aBAw973+or/w6UqktipL8hdcm3y+5hYOVP0ZOk=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3cMbmNKFvx4Ik3/qHmmldYWMH/I0PyXp8ZVeBa UGufzLyJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN3AAKCRBM4MiGSL8RynLiD/ 9hx5tU4NN3EbyQPx9n+eKNGaPXqNZPXxhQCFKmNLAzfKnq/pcezJXwAaBvF3MvIZVzVlUV27hYJOaT VPdqeyvrqyrQLXnxKw6ZyYJH2pYpdUil8/2N6BpCLOUHygH+NSQiJ34gEdnURzGDh3RFatKjQifwQj lDUDg2B3dBHy3a6sRr+8+0JMw9/DK+acuvbq6yAHzyfOVH7EAeE7PdjvyFOsJ6AfH1Ljn2Ef3zbnuU 4Kqfx0mCHSNEKwZ0r8BjSLhmMaDqE/5s0iAaMrUyXfyyyNVJOuJXT1uPjOdz+svu+4lrBlI5NJUzSw vc3EODS08XuQXKt5+uiNPa+moqvRfm9TtSz/S9Rm6uUPIqM4LPg45KROS4P27UjPZ8jACSk0pQRrk1 IQrUW4DQinLN6Jf2g6ub0hZHFhXkkBZp9VYetZWXYCyaDyoLnKM2lzdUeRof5bkUQac+W3mWbGSYhs 1ZNsPxQs2uHgi2xFAHk3Z5vYT46PZIa1+0Dv3eLErjz6D62AmpZar3lhqeQ7Ta7XuCzKvDvHNqyisy aDrHLSUt2eVz4sbmWW6daJ4kEbOdjsCeHybPzY3n20R7UPwcoiGQld4ZgBGXkP06x2uAvOfgJMIG0M 9QbNJoAG58//G++hEQlk7Pm0zJfn+jEgToyvLCWCL5AFtls4uNh/Ru6sTjkA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210554_699416_316DE120 
X-CRM114-Status: GOOD (  23.40  )
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

Currently, for rqspinlock usage, the implementation of
smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
susceptible to stalls on arm64, because they do not guarantee that the
conditional expression will be repeatedly invoked if the address being
loaded from is not written to by other CPUs. When support for
event-streams is absent (which unblocks stuck WFE-based loops every
~100us), we may end up being stuck forever.

This causes a problem for us, as we need to repeatedly invoke the
RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
expires.

Let us import the smp_cond_load_acquire_timewait implementation Ankur is
proposing in [0], and then fallback to it once it is merged.

While we rely on the implementation to amortize the cost of sampling
check_timeout for us, it will not happen when event stream support is
unavailable. This is not the common case, and it would be difficult to
fit our logic in the time_expr_ns >= time_limit_ns comparison, hence
just let it be.

  [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora@oracle.com

Cc: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 arch/arm64/include/asm/rqspinlock.h | 93 +++++++++++++++++++++++++++++
 kernel/bpf/rqspinlock.c             | 15 +++++
 2 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/include/asm/rqspinlock.h

diff --git a/arch/arm64/include/asm/rqspinlock.h b/arch/arm64/include/asm/rqspinlock.h
new file mode 100644
index 000000000000..5b80785324b6
--- /dev/null
+++ b/arch/arm64/include/asm/rqspinlock.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RQSPINLOCK_H
+#define _ASM_RQSPINLOCK_H
+
+#include <asm/barrier.h>
+
+/*
+ * Hardcode res_smp_cond_load_acquire implementations for arm64 to a custom
+ * version based on [0]. In rqspinlock code, our conditional expression involves
+ * checking the value _and_ additionally a timeout. However, on arm64, the
+ * WFE-based implementation may never spin again if no stores occur to the
+ * locked byte in the lock word. As such, we may be stuck forever if
+ * event-stream based unblocking is not available on the platform for WFE spin
+ * loops (arch_timer_evtstrm_available).
+ *
+ * Once support for smp_cond_load_acquire_timewait [0] lands, we can drop this
+ * copy-paste.
+ *
+ * While we rely on the implementation to amortize the cost of sampling
+ * cond_expr for us, it will not happen when event stream support is
+ * unavailable, time_expr check is amortized. This is not the common case, and
+ * it would be difficult to fit our logic in the time_expr_ns >= time_limit_ns
+ * comparison, hence just let it be. In case of event-stream, the loop is woken
+ * up at microsecond granularity.
+ *
+ * [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora@oracle.com
+ */
+
+#ifndef smp_cond_load_acquire_timewait
+
+#define smp_cond_time_check_count	200
+
+#define __smp_cond_load_relaxed_spinwait(ptr, cond_expr, time_expr_ns,	\
+					 time_limit_ns) ({		\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	unsigned int __count = 0;					\
+	for (;;) {							\
+		VAL = READ_ONCE(*__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		cpu_relax();						\
+		if (__count++ < smp_cond_time_check_count)		\
+			continue;					\
+		if ((time_expr_ns) >= (time_limit_ns))			\
+			break;						\
+		__count = 0;						\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
+#define __smp_cond_load_acquire_timewait(ptr, cond_expr,		\
+					 time_expr_ns, time_limit_ns)	\
+({									\
+	typeof(ptr) __PTR = (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	for (;;) {							\
+		VAL = smp_load_acquire(__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		__cmpwait_relaxed(__PTR, VAL);				\
+		if ((time_expr_ns) >= (time_limit_ns))			\
+			break;						\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
+#define smp_cond_load_acquire_timewait(ptr, cond_expr,			\
+				      time_expr_ns, time_limit_ns)	\
+({									\
+	__unqual_scalar_typeof(*ptr) _val;				\
+	int __wfe = arch_timer_evtstrm_available();			\
+									\
+	if (likely(__wfe)) {						\
+		_val = __smp_cond_load_acquire_timewait(ptr, cond_expr,	\
+							time_expr_ns,	\
+							time_limit_ns);	\
+	} else {							\
+		_val = __smp_cond_load_relaxed_spinwait(ptr, cond_expr,	\
+							time_expr_ns,	\
+							time_limit_ns);	\
+		smp_acquire__after_ctrl_dep();				\
+	}								\
+	(typeof(*ptr))_val;						\
+})
+
+#endif
+
+#define res_smp_cond_load_acquire_timewait(v, c) smp_cond_load_acquire_timewait(v, c, 0, 1)
+
+#include <asm-generic/rqspinlock.h>
+
+#endif /* _ASM_RQSPINLOCK_H */
diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 0d8964b4d44a..d429b923b58f 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -92,12 +92,21 @@ static noinline int check_timeout(struct rqspinlock_timeout *ts)
 	return 0;
 }
 
+/*
+ * Do not amortize with spins when res_smp_cond_load_acquire is defined,
+ * as the macro does internal amortization for us.
+ */
+#ifndef res_smp_cond_load_acquire
 #define RES_CHECK_TIMEOUT(ts, ret)                    \
 	({                                            \
 		if (!(ts).spin++)                     \
 			(ret) = check_timeout(&(ts)); \
 		(ret);                                \
 	})
+#else
+#define RES_CHECK_TIMEOUT(ts, ret, mask)	      \
+	({ (ret) = check_timeout(&(ts)); })
+#endif
 
 /*
  * Initialize the 'spin' member.
@@ -118,6 +127,12 @@ static noinline int check_timeout(struct rqspinlock_timeout *ts)
  */
 static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
 
+#ifndef res_smp_cond_load_acquire
+#define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire(v, c)
+#endif
+
+#define res_atomic_cond_read_acquire(v, c) res_smp_cond_load_acquire(&(v)->counter, (c))
+
 /**
  * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
  * @lock: Pointer to queued spinlock structure
-- 
2.47.1


