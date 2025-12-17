Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51118D66B81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7PSpSA3AEW13m1F0WS8TTB1RIj9oXuf1nRzuBrcnVw=; b=3LcSKdxZRNVRNanrVaWZyfsqvB
	0asBQZEScjDCz7fZONal8RsahxVXxsnL6CZD+hpoHJCdyzOowM4qLWZb8EbJ8PfHP96GT/brWFLJM
	L/lBrq7s+l0L/NlPIdmp2qOjJ3uhMuuCvKgxeAeYuRpx8asZPB5DMWTnUqzstNpj1sTyAlaKEI+iW
	JJ4mglYFapVP3Tzm9ZfFz1BFlWhcPeMP6BvMpbb257glRSXj+dog4GuyxcjBGL9b8PWjOZrn46ZVQ
	6fxEgUwHEjokHQNWv6UXiVvaFswjYiDSZO/enuPMYE/GLR6/cvH1Ce49Z/AI3plCoRdqVVIpe5GnO
	51xiw51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwVb-00000007Hek-0nQN;
	Wed, 17 Dec 2025 18:44:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwVY-00000007HeL-3eQ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D982443BF2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 18:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D5EC116D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765997059;
	bh=3rYIDYFHdXedEuS/ZuXKyvTmmCDGJpW1GVoD55c5fN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nHchwKZl5O3iz3jUuTqNnm2YVYdBXL4iAewe2jVC9gMf6rjR6+TdyUwHA6xa6XUAN
	 3t3ErjGgKsw/oC7lEpGF0mkUirjrpBlKBLoyq+1N0RmgRUeAP38WKGhif4zM6iYF/1
	 VuqlcZfrT3G3eeJr9J6kb9RzGL79MBAxC1UwWAodmosULccBCJ3ch04hErrrV5TAuf
	 H46NBIrnULsp0R5izBcn8ADgO8Sg5XpQVuSdoV5r00awUgMaYXMZLJOnaiVm0Y/Geu
	 gk2iZkDPMF3Ut0lO+hJWgVnFs+NxPQQAEs5m2zh9No5F1tnFAOZcn67TWuPpl+1k2Y
	 DGpa9cgbaTeWw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso9113511a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 10:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/F5L8jKO2nuV41aL955fwyBUHdl+upeB6tO084O57Aic+SWfSjyDu5PGoI+SXTpub6SHkbNb3rXwMJ5XLVhhB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ID8aM4pEELoEjdYPampBAmvcmuFQ/d9vCCO63WHIhZFGyUVB
	ho7zqk53Nj/yXCnLeyWEnqANAnu04Uay30IBGKbNrjl8/Cgvxr+DaQu3FPjvwsdwO9mJ7k9EmIc
	MoZt3JjNsFTl2KfdpPuXPXLANt4XGTLQ=
X-Google-Smtp-Source: AGHT+IGcJxf+wC4kKl38d/ObGhHN9ATqLnM291xtGzdG8ztJK68L1w7pPiyvzPfqUb+uEDkw7T8fItr1Dpsx9fpJK0M=
X-Received: by 2002:a17:907:9617:b0:b76:8163:f1f8 with SMTP id
 a640c23a62f3a-b7d23a7d742mr1899012966b.53.1765997058340; Wed, 17 Dec 2025
 10:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <51466fd3-c837-46a6-af50-28a8336fd8cd@linux.dev>
In-Reply-To: <51466fd3-c837-46a6-af50-28a8336fd8cd@linux.dev>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Wed, 17 Dec 2025 18:44:04 +0000
X-Gmail-Original-Message-ID: <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
X-Gm-Features: AQt7F2rj3bSMNLu8ufN8iIw42zX_ibMhxtoHDmKCykdihEmY6NNJdkyfVkghfX4
Message-ID: <CANk7y0irgYcHLH_e9ozjX3wTeDb3GH-PA+6UiLRSBFzpYs8eVQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: Yonghong Song <yonghong.song@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, ast@kernel.org, 
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, kernel-team@meta.com, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_104420_953592_C8862941 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, Dec 17, 2025 at 6:24=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 12/17/25 8:56 AM, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> >> index 2da986136d26..654fb94bf60c 100644
> >> --- a/include/linux/bpf.h
> >> +++ b/include/linux/bpf.h
> > [ ... ]
> >
> >> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> >>
> >>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog *p=
rog)
> >>   {
> >> +#ifdef CONFIG_ARM64
> >> +    u8 rctx =3D interrupt_context_level();
> >> +    u8 *active =3D this_cpu_ptr(prog->active);
> >> +
> >> +    active[rctx]++;
> >> +    barrier();
> >> +    if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> >> +            return false;
> >> +
> >> +    return true;
> >> +#else
> >>      return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> >> +#endif
> >>   }
> > Can preemption between the increment and check cause a counter leak on
> > CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> > rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> > (documented at include/linux/rcupdate.h:856).
> >
> > Consider this scenario on an ARM64 system with PREEMPT_RCU:
> >
> > 1. Thread A increments active[0] to 1
> > 2. Preemption occurs before Thread A reaches the check
> > 3. Thread B on same CPU increments active[0] to 2
> > 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> > 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> > 6. Both threads return false, neither runs BPF
> > 7. Neither calls bpf_prog_put_recursion_context() (see
> >     __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> > 8. Counter permanently stuck at 2, all future BPF on this CPU fails
> >
> > The old atomic code handled this correctly because this_cpu_inc_return(=
)
> > completes atomically, ensuring Thread A reads the value 1 before Thread=
 B
> > can interfere. With non-atomic operations, Thread A increments but hasn=
't
> > read the value yet, allowing Thread B to interfere and cause both threa=
ds
> > to see the modified value.
> >
> > Is there a guarantee that same-context preemption cannot occur in the B=
PF
> > execution path on ARM64, or does this need additional synchronization?
>
> AI is correct here. See below for another thread:
>    https://lore.kernel.org/bpf/20251217093326.1745307-1-chen.dylane@linux=
.dev/T/#m906fd4502fbbedd4609c586122a393363003312a
> where preempt_disable is necessary to prevent the above scenario.

See my other reply, the above scenario presented by AI is wrong
because step 7 is wrong.

> But adding preempt_disable may impact the overall system-level performanc=
e.
>
> Does this patch can improve performance for *all* ARM64 cpu versions?
> Do you have numbers to show how much performance improvement?

This should improve performance on all arm64 CPUs because atomics are
expensive because they are atomic across all cpus.

I see a 33% improvement in the fentry trigger benchmark, but I can do
more benchmarking.

> >
> >> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> >>
> >>   static inline void bpf_prog_put_recursion_context(struct bpf_prog *p=
rog)
> >>   {
> >> +#ifdef CONFIG_ARM64
> >> +    u8 rctx =3D interrupt_context_level();
> >> +    u8 *active =3D this_cpu_ptr(prog->active);
> >> +
> >> +    barrier();
> >> +    active[rctx]--;
> >> +#else
> >>      this_cpu_dec(*(prog->active));
> >> +#endif
> >>   }
> [...]

