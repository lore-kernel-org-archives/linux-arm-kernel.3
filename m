Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1CD6E2D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I60R8WA4dxn2gytYZ6r7aYWz8herwWEhg7V+nluk9FU=; b=ZBh3xxrKXZVJrqxGcTjfvDBVR/
	ry/ZxTT+YTb1JdcytirR4ozMEC25GOy3sLWzr8TmujCSLpDubSphpKO/Z4ceQB7opXfOi5WJRxeqH
	9eKPMUU4Pfv9MbjUFabJMEg6DGZYox7eD6LSeBiq7e2GS/bjb1SizkTHRsexb33cfxeWhEV3rrsRE
	/xKIlYFWD8Be3j2D8TaIBB1sSSS3PcNGRES3qYMDFETldDaPUNuWdPgG6Mz8bROEJ+VvLpqOMWLwI
	+abrF9S4h0KVfaC0FBXAE0tmAJ6GaNkcw8HymDSNKPpLcWWfQORqCQEYDeWlQIKshgNyfM1j609Fo
	mK6Qe3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIEX-00000008xSs-3MOu;
	Thu, 18 Dec 2025 17:56:13 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWIET-00000008xSN-2Hbv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 17:56:11 +0000
Message-ID: <1728d4e1-ce5c-476e-b057-b8a9a7621e1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766080558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I60R8WA4dxn2gytYZ6r7aYWz8herwWEhg7V+nluk9FU=;
	b=Xy7U9H8qHL77Fx0fPNGKUC/QY21WS3RBSaAH2MUdMGV42LvbEDLbSK8AdrcvH6zE37nbFR
	bbJfYYpgSAxpZjP9D6ZdNRu07Z/3MP0etTvifnPuLjEOdgx6le0/VnD8kz8V21JJ5YTU1j
	Z5eOcH9AzxCtpMjndlEC3UQj50OiS2k=
Date: Thu, 18 Dec 2025 09:55:52 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/2] bpf: arm64: Optimize recursion detection
 by not using atomics
Content-Language: en-GB
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, kernel-team@meta.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20251217233608.2374187-1-puranjay@kernel.org>
 <20251217233608.2374187-3-puranjay@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20251217233608.2374187-3-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_095610_191310_37166020 
X-CRM114-Status: GOOD (  27.56  )
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



On 12/17/25 3:35 PM, Puranjay Mohan wrote:
> BPF programs detect recursion using a per-CPU 'active' flag in struct
> bpf_prog. The trampoline currently sets/clears this flag with atomic
> operations.
>
> On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
> operations are relatively slow. Unlike x86_64 - where per-CPU updates
> can avoid cross-core atomicity, arm64 LSE atomics are always atomic
> across all cores, which is unnecessary overhead for strictly per-CPU
> state.
>
> This patch removes atomics from the recursion detection path on arm64 by
> changing 'active' to a per-CPU array of four u8 counters, one per
> context: {NMI, hard-irq, soft-irq, normal}. The running context uses a
> non-atomic increment/decrement on its element.  After increment,
> recursion is detected by reading the array as a u32 and verifying that
> only the expected element changed; any change in another element
> indicates inter-context recursion, and a value > 1 in the same element
> indicates same-context recursion.
>
> For example, starting from {0,0,0,0}, a normal-context trigger changes
> the array to {0,0,0,1}.  If an NMI arrives on the same CPU and triggers
> the program, the array becomes {1,0,0,1}. When the NMI context checks
> the u32 against the expected mask for normal (0x00000001), it observes
> 0x01000001 and correctly reports recursion. Same-context recursion is
> detected analogously.
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

LGTM with a few nits below.

Acked-by: Yonghong Song <yonghong.song@linux.dev>

> ---
>   include/linux/bpf.h | 33 ++++++++++++++++++++++++++++++---
>   kernel/bpf/core.c   |  3 ++-
>   2 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 2da986136d26..5ca2a761d9a1 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -31,6 +31,7 @@
>   #include <linux/static_call.h>
>   #include <linux/memcontrol.h>
>   #include <linux/cfi.h>
> +#include <linux/unaligned.h>
>   #include <asm/rqspinlock.h>
>   
>   struct bpf_verifier_env;
> @@ -1746,6 +1747,8 @@ struct bpf_prog_aux {
>   	struct bpf_map __rcu *st_ops_assoc;
>   };
>   
> +#define BPF_NR_CONTEXTS        4       /* normal, softirq, hardirq, NMI */
> +
>   struct bpf_prog {
>   	u16			pages;		/* Number of allocated pages */
>   	u16			jited:1,	/* Is our filter JIT'ed? */
> @@ -1772,7 +1775,7 @@ struct bpf_prog {
>   		u8 tag[BPF_TAG_SIZE];
>   	};
>   	struct bpf_prog_stats __percpu *stats;
> -	int __percpu		*active;
> +	u8 __percpu		*active;	/* u8[BPF_NR_CONTEXTS] for rerecursion protection */
>   	unsigned int		(*bpf_func)(const void *ctx,
>   					    const struct bpf_insn *insn);
>   	struct bpf_prog_aux	*aux;		/* Auxiliary fields */
> @@ -2006,12 +2009,36 @@ struct bpf_struct_ops_common_value {
>   
>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
>   {
> -	return this_cpu_inc_return(*(prog->active)) == 1;
> +#ifdef CONFIG_ARM64
> +	u8 rctx = interrupt_context_level();
> +	u8 *active = this_cpu_ptr(prog->active);
> +	u32 val;
> +
> +	preempt_disable();
> +	active[rctx]++;
> +	val = get_unaligned_le32(active);

The 'active' already aligned with 8 (or 4 with my below suggestion).
The get_unaligned_le32() works, but maybe we could use le32_to_cpu()
instead. Maybe there is no performance difference between
get_unaligned_le32() and le32_to_cpu() so you pick get_unaligned_le32()?
It would be good to clarify in commit message if get_unaligned_le32()
is used.

> +	preempt_enable();
> +	if (val != BIT(rctx * 8))
> +		return false;
> +
> +	return true;
> +#else
> +	return this_cpu_inc_return(*(int __percpu *)(prog->active)) == 1;
> +#endif
>   }
>   
>   static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
>   {
> -	this_cpu_dec(*(prog->active));
> +#ifdef CONFIG_ARM64
> +	u8 rctx = interrupt_context_level();
> +	u8 *active = this_cpu_ptr(prog->active);
> +
> +	preempt_disable();
> +	active[rctx]--;
> +	preempt_enable();
> +#else
> +	this_cpu_dec(*(int __percpu *)(prog->active));
> +#endif
>   }
>   
>   #if defined(CONFIG_BPF_JIT) && defined(CONFIG_BPF_SYSCALL)
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index c66316e32563..b5063acfcf92 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -112,7 +112,8 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned int size, gfp_t gfp_extra_flag
>   		vfree(fp);
>   		return NULL;
>   	}
> -	fp->active = alloc_percpu_gfp(int, bpf_memcg_flags(GFP_KERNEL | gfp_extra_flags));
> +	fp->active = __alloc_percpu_gfp(sizeof(u8[BPF_NR_CONTEXTS]), 8,
> +					bpf_memcg_flags(GFP_KERNEL | gfp_extra_flags));

Here, the alignment is 8. Can it be 4 since the above reads a 32bit value?

>   	if (!fp->active) {
>   		vfree(fp);
>   		kfree(aux);


