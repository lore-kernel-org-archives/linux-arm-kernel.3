Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146B0CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Date:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=; b=IXg5nvVdDKMVkrRHaRJQwb2S7z
	POTCNc0rbiEhwqsQuMaFRDKd8UDMMD9IszM/Y6mX088LtuKjLYTWMgkIQE6IbrXRH23tXK4FvDkDF
	LQQyyA1aViSgIjNcdZDD7UoRZeHDRSAWVVZ28hxwgsLJfx/T9s1dWPtDanMv2tGuas/8T0IN6MzAV
	hGmQ81arU98RfQIY6Zlq55aST/a5QdIELI/G0N9zEHUPzWq7H+VGfXuh9jYjeezHK/4fMMS3fnXnB
	SmB/oMOCUMv9Hdptlc6QlTdmgDQM9rhiYeb3LLjGOkAhYM+HcIdpZCm5Jd1vz10Q7basF6p0kvcFc
	wNIP5dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZOK-0000000DLFH-2Uz3;
	Wed, 05 Nov 2025 09:01:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZOH-0000000DLEx-2N8k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:01:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso6439214a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762333277; x=1762938077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=OhUrffo6jp78OIIJCCaDkvX5S6taojlfb+ipXkkCajTZEjDe8uEYAau9gy/yYyP59H
         kNIkyQLQ1gw1Wtp0mYONoUxJ9iBB/8dSlCZsCMhNe2WQ7SCLi3/TrC870ed1NSlBayXq
         0+rIvLkD5pl4vX9YExn3YkZ8+uc3MYwtnZxsa6p97NvUv6YrPiUnKB9gtCu2aqr5nyMF
         FQtVH6eMWe2xCBDH2d49fHvEZ6lIzmKB5hb11nBoSxTyK1jwUfFwR34dGttdfBCBPY+r
         VbHc/hSIhHVTIPvv9D0OY0Kmajh1CXPWiig+9eV7hro8Na/JLvIU6Qlz1aFlHjaGyAab
         1uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333277; x=1762938077;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=XAkuogornb5xXZ9ZRzY8NZhyPP5lbU2tastoenEL2sMn60jMclDa7VbKmGDiEsP6Pq
         G4jagh5QSgHrLE13sL6n+5leVsYO7NmuwFSO3ZL4a3fJBJEMhRBsfxU+4NxJmRlaE2R5
         dw1ry2Uk8VOF8NFTWHvHanwlVLfGAedDuLA/rUIeNnVKOKHki44H6MDyqAWhvsPZqxCK
         Xv0mfmqrKOpAV32o2dZaohEwNFA8gzRJ7/Q8zf6JirO2cfcT5to2KQ0vCLh7ub8A5J7P
         WrMYhhGRtUoUs0teS0vXwVBdRs3YN6uh/wtvdbb/Ie+Hx/E+UgEXaUMZfigPWhgBrJRX
         gRhA==
X-Forwarded-Encrypted: i=1; AJvYcCX+0GUGShse7peaK9P4NpsBLTxI6hRf7rp02Bnjk6KoJfHpF2kzhWvIjzOjqWSjgyYsV30ER1cWxEf6xam37Zgu@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOvXlRTJX8TWkmNk/Yphq/asSzLHMKDf7SI+f4YadI6pX27Bi
	u0QpHhtAMu2hSGwJ01+8ej/xrPaVC/r/R4QoZOH9vbXT8CnuK4alDZ8V
X-Gm-Gg: ASbGncsfxKfD6XG6KvHxUeAhzdhbRVj/AqLOxdiUKg3rZphYBk+sUn3IoMcva0xTsYO
	69LkZfjNR8tS31jyBh2m6OcxT7IkugiwBAf16MiVSb3QiK4OF+mwJeJx5fjCY0eKwGflHpv+dcR
	UO2SOWpHUHdxvpA6FRMafq8T4BFKySPyxvqnCnaACn62XZeYjau+9fJb+kiu3RgnQStq57WYR5e
	ExKAnZGTC2FSQyyU3d3H+s4p8KC4/RHflY8QlcAv6fk5IsbZnzN9giSwTelsFc7I505oy6veP3j
	urTJSOSL5TK8ZS91E/t7ZvOsvKkeZXs5xcr3sESZbsU3B/ZwgRrsazpxMD1SgmMGsSC9bBmhq2h
	N11P9yRjupk5VlcF6arARvHugjKc1gXhm60OftkgolWJlunHpAUESEW9shRE4iQsfs216EPCwfi
	NoLPDP
X-Google-Smtp-Source: AGHT+IHHv+LyuTSVYYYzkbgRnz7hULJzgzWM0oNnTXqbUlny/y0AGDg1tLVk5Pgi5QjOwQ4eknTvSQ==
X-Received: by 2002:a17:90b:51c8:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-341a6dc8735mr2732523a91.21.1762333276313;
        Wed, 05 Nov 2025 01:01:16 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm2153637a91.8.2025.11.05.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:01:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <20251029100909.3381140-8-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 14:19:03 +0530
Message-ID: <87ms5050g0.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_010117_614833_1468031E 
X-CRM114-Status: GOOD (  45.52  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
>
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
>
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
>
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>   calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
>
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>   to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>   the assumption is that these callbacks are not relevant. However,
>   existing code may rely on a call to disable() to flush any batched
>   state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>   therefore called in that situation.
>
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
>
> Whether the mode is actually enabled or not at any point is tracked
> by a separate "active" field in task_struct; this makes it possible
> to check invariants in the generic API, and to expose a new
> in_lazy_mmu_mode() helper to replace the various ways arch's
> currently track whether the mode is enabled (this will be done in
> later patches).
>
> In summary (nesting/active represent the values *after* the call):
>
> lazy_mmu_mode_enable()		-> arch_enter()	    nesting=3D1 active=3D1
>     lazy_mmu_mode_enable()	-> =C3=B8		    nesting=3D2 active=3D1
> 	lazy_mmu_mode_pause()	-> arch_leave()     nesting=3D2 active=3D0
> 	lazy_mmu_mode_resume()	-> arch_enter()     nesting=3D2 active=3D1
>     lazy_mmu_mode_disable()	-> arch_flush()     nesting=3D1 active=3D1
> lazy_mmu_mode_disable()		-> arch_leave()     nesting=3D0 active=3D0
>
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ------
>  include/linux/mm_types_task.h    |  5 +++
>  include/linux/pgtable.h          | 67 ++++++++++++++++++++++++++++++--
>  include/linux/sched.h            | 16 ++++++++
>  4 files changed, 84 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 54f8d6bb6f22..535435248923 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
>=20=20
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
>=20=20
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a82aa80c0ba4..632d404f8191 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>  #endif
>  };
>=20=20
> +struct lazy_mmu_state {
> +	u8 nesting_level;
> +	bool active;
> +};
> +
>  #endif /* _LINUX_MM_TYPES_TASK_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b5fdf32c437f..e6064e00b22d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be=
 enabled
>   * and cpu migration is possible; it must take steps to be robust agains=
t this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s=
) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not pe=
rmitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode cannot b=
e used
> + * in interrupt context.
> + *
> + * The lazy MMU mode is enabled for a given block of code using:
> + *
> + *   lazy_mmu_mode_enable();
> + *   <code>
> + *   lazy_mmu_mode_disable();
> + *
> + * Nesting is permitted: <code> may itself use an enable()/disable() pai=
r.
> + * A nested call to enable() has no functional effect; however disable()=
 causes
> + * any batched architectural state to be flushed regardless of nesting. =
After a
> + * call to disable(), the caller can therefore rely on all previous page=
 table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy M=
MU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * This sequence must only be used if the lazy MMU mode is already enabl=
ed.
> + * pause() ensures that the mode is exited regardless of the nesting lev=
el;
> + * resume() re-enters the mode at the same nesting level. <code> must no=
t modify
> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
> + * helpers).
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.
>   */
>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void lazy_mmu_mode_enable(void)
>  {
> -	arch_enter_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
> +	/* enable() must not be called while paused */
> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> +
> +	if (state->nesting_level++ =3D=3D 0) {
> +		state->active =3D true;
> +		arch_enter_lazy_mmu_mode();
> +	}
>  }

Some architectures disables preemption in their
arch_enter_lazy_mmu_mode(). So shouldn't the state->active =3D true should
happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.

  static inline void lazy_mmu_mode_enable(void)
  {
 -	arch_enter_lazy_mmu_mode();
 +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
 +
 +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
 +	/* enable() must not be called while paused */
 +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
 +
 +	if (state->nesting_level++ =3D=3D 0) {
 +		arch_enter_lazy_mmu_mode();
 +		state->active =3D true;
 +	}
  }

... I think it make more sense to enable the state after the arch_**
call right.

>=20=20
>  static inline void lazy_mmu_mode_disable(void)
>  {
> -	arch_leave_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D 0);
> +	VM_WARN_ON(!state->active);
> +
> +	if (--state->nesting_level =3D=3D 0) {
> +		state->active =3D false;
> +		arch_leave_lazy_mmu_mode();
> +	} else {
> +		/* Exiting a nested section */
> +		arch_flush_lazy_mmu_mode();
> +	}
>  }

This looks ok though.

>=20=20
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || !state->active);
> +
> +	state->active =3D false;
>  	arch_leave_lazy_mmu_mode();
>  }
>=20=20
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || state->active);
> +
> +	state->active =3D true;
>  	arch_enter_lazy_mmu_mode();
>  }

Ditto.

-ritesh


>  #else
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cbb7340c5866..11566d973f42 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1441,6 +1441,10 @@ struct task_struct {
>=20=20
>  	struct page_frag		task_frag;
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +	struct lazy_mmu_state		lazy_mmu_state;
> +#endif
> +
>  #ifdef CONFIG_TASK_DELAY_ACCT
>  	struct task_delay_info		*delays;
>  #endif
> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_=
struct *tsk)
>  	return task_index_to_char(task_state_index(tsk));
>  }
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return current->lazy_mmu_state.active;
> +}
> +#else
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  extern struct pid *cad_pid;
>=20=20
>  /*
> --=20
> 2.47.0

