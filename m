Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE296D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYAIzO114AdJxENXRYbIcdnqTl5GsOkrFEghwpJibR8=; b=HfuD+B1/JrIeK2jBQ4bpCdmCqA
	pw1N53/ozsCjo97EGsRA0JMoZYy5+JH59/5l0tV8xvk3MBmE2TVckG+U4NwLUmn32VZHsrqkQMoy6
	Xpd6YnEzLYGIxUFvOqrqpE2RsBrQYp5wT+WAyWJEiMxZEr4VRj9AIkdXzeJEL4Fsp9Uyy07+I2VY8
	wUczx9nitN+5Xhon8/2nUlwair+haktaZD7DLm3VMLIhk62qmfQ0twMvBlctBTfPwWKtzZ6UW/Jy5
	pyu85QWxESOrE9blF5z3vvNjKmulV7AApfuBrx+xDXqFDkQvxqMgZC1hARWuN+F1VEPSEDILZ4sGs
	H6OMeGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOZ-000000076sR-0Sdy;
	Wed, 17 Dec 2025 16:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOW-000000076ri-49iz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C40A60008;
	Wed, 17 Dec 2025 16:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD83C116B1;
	Wed, 17 Dec 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765988936;
	bh=HCLdkqos8jgOsZvqwhImnNfbte35GMxDvkafA1XfElo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=egI0M1AIrEBbMJetAc1UBEPFIajqxBKZbRxLmvkXxERiolgGty6gTq0EHqm9qHed9
	 uhr8NhZT4NCcwEN74RORq5QFMWd/eDiUI7Ple44y/RQaNiKm4oV7t2qpryk2HJlerW
	 8DLfHm5sNmJ0fnAk5TGmFVLRcbYbl8iAp+0MNd/NkTT9sgaQ0sgEAR8BIOqKYE3rjF
	 UeqTOjweNA4HJwLBkYinxyL2nPa+I+waoiHTyf7XBWTwyTfJ3efObKdXtryhAXU+kc
	 Or21X+YDQewACJMSBh6Nma8H+Bn/KHzj6pwl6QGZUnXxcefmUhgmNDeLH9qe8yaq9M
	 yoJ1l9vM2DmaQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	kernel-team@meta.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by not using atomics
Date: Wed, 17 Dec 2025 08:28:27 -0800
Message-ID: <20251217162830.2597286-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217162830.2597286-1-puranjay@kernel.org>
References: <20251217162830.2597286-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

BPF programs detect recursion using a per-CPU 'active' flag in struct
bpf_prog. The trampoline currently sets/clears this flag with atomic
operations.

On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
operations are relatively slow. Unlike x86_64 - where per-CPU updates
can avoid cross-core atomicity, arm64 LSE atomics are always atomic
across all cores, which is unnecessary overhead for strictly per-CPU
state.

This patch removes atomics from the recursion detection path on arm64 by
changing 'active' to a per-CPU array of four u8 counters, one per
context: {NMI, hard-irq, soft-irq, normal}. The running context uses a
non-atomic increment/decrement on its element.  After increment,
recursion is detected by reading the array as a u32 and verifying that
only the expected element changed; any change in another element
indicates inter-context recursion, and a value > 1 in the same element
indicates same-context recursion.

For example, starting from {0,0,0,0}, a normal-context trigger changes
the array to {0,0,0,1}.  If an NMI arrives on the same CPU and triggers
the program, the array becomes {1,0,0,1}. When the NMI context checks
the u32 against the expected mask for normal (0x00000001), it observes
0x01000001 and correctly reports recursion. Same-context recursion is
detected analogously.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 include/linux/bpf.h | 25 ++++++++++++++++++++++++-
 kernel/bpf/core.c   |  3 ++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 2da986136d26..654fb94bf60c 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -31,6 +31,7 @@
 #include <linux/static_call.h>
 #include <linux/memcontrol.h>
 #include <linux/cfi.h>
+#include <linux/unaligned.h>
 #include <asm/rqspinlock.h>
 
 struct bpf_verifier_env;
@@ -1746,6 +1747,8 @@ struct bpf_prog_aux {
 	struct bpf_map __rcu *st_ops_assoc;
 };
 
+#define BPF_NR_CONTEXTS        4       /* normal, softirq, hardirq, NMI */
+
 struct bpf_prog {
 	u16			pages;		/* Number of allocated pages */
 	u16			jited:1,	/* Is our filter JIT'ed? */
@@ -1772,7 +1775,7 @@ struct bpf_prog {
 		u8 tag[BPF_TAG_SIZE];
 	};
 	struct bpf_prog_stats __percpu *stats;
-	int __percpu		*active;
+	u8 __percpu		*active;	/* u8[BPF_NR_CONTEXTS] for rerecursion protection */
 	unsigned int		(*bpf_func)(const void *ctx,
 					    const struct bpf_insn *insn);
 	struct bpf_prog_aux	*aux;		/* Auxiliary fields */
@@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
 
 static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
 {
+#ifdef CONFIG_ARM64
+	u8 rctx = interrupt_context_level();
+	u8 *active = this_cpu_ptr(prog->active);
+
+	active[rctx]++;
+	barrier();
+	if (get_unaligned_le32(active) != BIT(rctx * 8))
+		return false;
+
+	return true;
+#else
 	return this_cpu_inc_return(*(prog->active)) == 1;
+#endif
 }
 
 static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
 {
+#ifdef CONFIG_ARM64
+	u8 rctx = interrupt_context_level();
+	u8 *active = this_cpu_ptr(prog->active);
+
+	barrier();
+	active[rctx]--;
+#else
 	this_cpu_dec(*(prog->active));
+#endif
 }
 
 #if defined(CONFIG_BPF_JIT) && defined(CONFIG_BPF_SYSCALL)
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index c66316e32563..b5063acfcf92 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -112,7 +112,8 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned int size, gfp_t gfp_extra_flag
 		vfree(fp);
 		return NULL;
 	}
-	fp->active = alloc_percpu_gfp(int, bpf_memcg_flags(GFP_KERNEL | gfp_extra_flags));
+	fp->active = __alloc_percpu_gfp(sizeof(u8[BPF_NR_CONTEXTS]), 8,
+					bpf_memcg_flags(GFP_KERNEL | gfp_extra_flags));
 	if (!fp->active) {
 		vfree(fp);
 		kfree(aux);
-- 
2.47.3


