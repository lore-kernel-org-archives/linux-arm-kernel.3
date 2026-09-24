Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE77C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=505orE5OpmF0rqgVrMUI2fkr4bM3eg+OhX8WPM6vgh0=; b=iFKC1WVA+Afq+ZiygwWNfvOvzb
	aRq0quj/ir6/ekNccu2n6OddRx5D007y7J7VeuIrTBdSUFX2D8KXcUEnqxjaC95Ozm0xompVEeu2o
	A1D9RldT3YIJEF0kAlLQyHKOpSMsdhaS9/aw+QRVSbW1T6hsBqwcaDj7PR814WFQN7XUbYQ4irrHQ
	YCd3tU9DGiuZpja46C/bYnLF3RepD2LnNCJoKVu+asWqnUZwX5VF3vjft23j2/xHqTrB9yt4ftW6e
	qqX4kHBszo/RcIFCd7JK341ZRGwV9rv8oYHTnhMDjAohJrS8RdgPLN7qJxr17KOYGGn4XyLDYiI8R
	lhcOjgCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iL2-0000000Ax2I-2Fc8;
	Thu, 24 Sep 2026 12:14:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iL1-0000000Ax2A-1rJG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:14:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBFBA43B81;
	Thu, 24 Sep 2026 12:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040451F000FF;
	Thu, 24 Sep 2026 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252046;
	bh=505orE5OpmF0rqgVrMUI2fkr4bM3eg+OhX8WPM6vgh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OnMD1tUMoY172Zuqhc6k4sQDczxnt/xSjWt5fb0mFNF8AFsCYlsRj9UVVsdG3ExB4
	 rCC0g+fh+YoPb3LIxF48kpXphBeotD+Yy13z0+TuNYbMG8fLz0Ap5odtNVNe7/5Yrx
	 icRT35m5mDtlzz8XcqONoajG5RjWIZ/drMfLHwgZKvQ9nDkLuXhjhoHs/3smj1ho5f
	 CPyPEm9i3q1GdTiffSaCZ2o0ukewZei7I/cj0ejUxAc3t7VQpaqbr/yBLc+J4BkM0w
	 xlM02lNJJY+duviRgIv/Ca8wLoyyvrgKZJyjfXpuyuSo8DXu2gs8maipQC2yqAg73E
	 dKRqj2RQc2FDg==
Date: Thu, 24 Sep 2026 13:14:00 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org,
	oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	steven.price@arm.com, qperret@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <arUUCFHamX1nOrB1@willie-the-truck>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com>
 <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck>
 <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 12:26:25PM +0100, Fuad Tabba wrote:
> On Thu, 24 Sep 2026 09:30:06 +0100, Will Deacon <will@kernel.org> wrote:
> [...]
> > Sorry, but I'm really confused by this and it appears to be different to
> > what we've got in Android as well. Why do we need release semantics for
> > the store to 'hyp_vcpu->power_state' in pvm_psci_vcpu_off()? What is it
> > that we are publishing here? The comment talks about pkvm_reset_vcpu(),
> > but how is that relevant to the vCPU _off_ path? You say the comment is
> > wrong, but what _should_ it say?
> >
> > I'm a bit baffled!
> 
> It's not publishing data, it's handing reset_state back.

What's the difference? The usual pattern for acquire/release is:

<write data>
<store-release flag>

on one CPU and then on another:

<load-acquire flag>	// If this reads from the release above...
<read data>		// ... then this is guaranteed to read the written data

That's a message-passing shape and you would normally say that the first
CPU (the producer) is publishing the data to the other CPU (the consumer).

Is this what is happening with the 'reset_state' (data) and the
'power_state' (flag)? If not, then what is the shape?

> The CPU_ON winner writes reset_state.{pc, r0, be}, then reset_state.reset
> with a release. The target reads them and clears reset in pkvm_reset_vcpu()
> on its next run

By 'next run' you mean, at EL2 on the entry path into the guest following
a successful CPU_ON operation?

> and its CPU_OFF hands reset_state on to the next
> CPU_ON. The release on OFF orders those reads and that clear before
> OFF, and an acquire on the winner's cmpxchg orders its writes after
> it: release on the way out, acquire on the way in, like a lock.

That doesn't make sense to me, sorry. You're saying that the release
store in the EL2 CPU_OFF hypercall handler is ordering stores that were
made during the initial CPU_ON handling on that vCPU? Since then, we've
been in and out of the guest. We really shouldn't need extra barriers to
create order there.

> Without the release, the target's clear of reset can become visible
> after the next winner's reset = true, and the target's next
> pkvm_reset_vcpu() then reads a clear flag and returns -ECANCELED,
> leaving the vCPU stuck at ON_PENDING.

This needs a litmus test because I can't see it myself. As above,
CPU_OFF does not clear the reset state, so it's bizarre to put the
release there.

> The comment described the flag ordering, which holds through the
> winner's release on reset even with a relaxed cmpxchg, and named the
> cmpxchg as its pair when the cmpxchg wasn't an acquire. The acquire is
> for the winner's plain writes of pc/r0/be: nothing else orders them
> after the target's reads. v4 has cmpxchg_acquire() and the two
> comments name what's ordered and each other:
> 
>         /*
>          * Orders pkvm_reset_vcpu()'s accesses to reset_state before OFF. Pairs
>          * with the acquire cmpxchg in pvm_psci_vcpu_on().
>          */
>         smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);
> 
> and in pvm_psci_vcpu_on():
> 
>         /*
>          * vCPUs race to power on the same target. The acquire pairs with the
>          * release of OFF in pvm_psci_vcpu_off(): the target's accesses to
>          * reset_state in pkvm_reset_vcpu() precede the writes below.
>          */
>         power_state = cmpxchg_acquire(&target->power_state,
>                                       PSCI_0_2_AFFINITY_LEVEL_OFF,
>                                       PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);

This confused me more :( Why are you talking about accesses preceding an
acquire? An acquire only orders later accesses.

I really think we need some litmus tests to understand the general ordering
problems we have here before adding the memory barriers.

Will

