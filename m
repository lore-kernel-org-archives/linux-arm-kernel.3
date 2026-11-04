Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+AeXAA+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhQ25LS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eH9cP+eSCph2k6r+Y5Wz7HRU49O/httC0nGpICpjyGY=; b=3+AeXAA+LpN5usqhwsRZxRc7oO
	9K5/C0UpsfKenQLeOwyuobCpT1y/QXv+YhYBM594DF8DFy7Q2iCnq3nFi0f2Vb/TfUedPUx8oz+r4
	Tq26D8b/omixm5BVfjZ/bPg5eVONmmDuvBQTMQ1nJ69aqlNAgqj9DG8nK5ykOLkEjz17TchPVFYjD
	S5Lt/ZA1sZShO5w0ugW5yu4HJ6kIVdYo6R1NhaCj/5RoqKYEMeC5MwQCSxGd5EX9zGrYbLZ3qtDmL
	HxArSZHGkaW7oq837o7QzaG/3uoBiaxmbkl0g4+WhYh95+sXNAPhbRqX+eKei3at+4AzaGlb+cNF/
	+2pkaF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObc7-00000005YZr-1s2G;
	Wed, 04 Nov 2026 14:05:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObc5-00000005YZf-2wr0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6343243B9E;
	Wed,  4 Nov 2026 14:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1161F000C1;
	Wed,  4 Nov 2026 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801117;
	bh=eH9cP+eSCph2k6r+Y5Wz7HRU49O/httC0nGpICpjyGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFhQ25LS6X8qFxZw+3UIXhlc5l0jQ2ka1gGkAeCYFAa5lpRq2bVUcA1h0kqugd6Q2
	 OPPSDJv2HXSXByIRZvS0a4o8r+fm07mesoJdu2PMdDW11eANd4OdCxrhzXS8/aH9ne
	 yPBEoVek3oXs2suxt3CPsujAYluewP8XYd27E5FY+iTE6MUZajETjVBeiLUKa770ax
	 9R+Jp+mqLJzkyzJZgtDi3fUWxtdc+4H2MOKurlulaE6cnRie3B5wLL1ZQlYzF1H3A4
	 5KEBRVfqEcqbqJJYFq4ghyexetbZ32/JEEnzONhUuEeYcP6l0T4pvBoRDHPN3dHUCg
	 k2PgtJB//J+Zw==
Date: Wed, 4 Nov 2026 14:05:12 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <aus7mMS4tXAzPCSi@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <attf9KALBQyOGyco@redhat.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey Oleg,

On Fri, Oct 23, 2026 at 03:24:04PM +0200, Oleg Nesterov wrote:
> On 10/23, Zhao Gongyi wrote:
> >
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > -		return;
> > -
> >  	/*
> >  	 * For compat tasks, orig_r0 is provided directly through GPR index
> >  	 * 17.
> > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> >  	 * return value of the system call.
> >  	 */
> > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> >  		return;
> 
> LGTM, but I don't understand this arm-specific code.

Welcome to the club :)

The original rationale is described in e057b9477232 ("arm64: syscall:
Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
helps to set the scene. The crux of the problem is that the x0 register
on arm64 is used both for the first argument of a system call but also
for the return value, which causes difficulties for things like syscall
restarting, syscall skipping and syscall reporting in /proc/<pid>/syscall.

We handle that by keeping the original argument value in a shadow variable,
orig_x0, in the pt_regs and using that to implement the problematic
mechanisms above, including the accessors used by seccomp in asm/syscall.h.

The bug was (a) that we only copied x0 into orig_x0 early on the syscall
path (el0_svc_common()), which meant that tracer updates to x0 would not
be visible to seccomp filters and (b) that we passed x0 to the syscall,
which meant that the unchecked value was used as the first argument.

My initial fix (in e057b9477232) tried to copy x0 back into orig_x0
after tracer updates on the syscall entry path, however this didn't work
with some of the more complicated seccomp interactions (involving BPF
programs and SECCOMP_RET_TRACE) and so commit 88b839ce497c ("arm64: ptrace:
Keep 'orig_x0' in-sync with x0 on syscall entry") took a different
approach of updating orig_x0 at a lower-level, whenever x0 is written
by ptrace *and* we're on the syscall entry path. The latter check is
really a "we're not on the syscall exit path" so that we can handle the
seccomp case.

So that's the mess we're in and I'm all ears if there's a cleaner way to
sort it out without breaking anything that relies on the fragile semantics
we already have.

Cheers,

Will

