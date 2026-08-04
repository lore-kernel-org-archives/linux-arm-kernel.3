Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2634FC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 22:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nckDj9uSVJQNTLpL7gMUG7fWxQkNwuDaAqk1qZvF4j4=; b=FuE1k6/eu4zU6mBJ/x/jDgkY76
	1aCwMnXg1gxY1Kqxk+0GN1P/Z3cSZCIHceDcAmwE3Xkfc36EI4syXMIKE7ED1z6lT0swG34TFtLlj
	g7Qg3c+gpY2rO8YI5FQk96N1sgoRoXNmn9Mu9Md/1zskIjKKtJrmAu2DI89B1zv+70MIWNqiNJtYX
	j4O9f84Y70BnN64+Y83IUt8ZtTOqMWYuGdK2GZbgqjyPR9COA8rz34KaL9g9AGw8tCiSiaWq2qWkq
	Uwwy4T/2qganxsQ6RImvgcy8cszPYoV9BNCl/TzFrV0M8VhJ6zPSctH2qzHee62ns9ajreK+kQ3Qj
	OZbGd1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNtj-00000002tMo-3LkD;
	Tue, 04 Aug 2026 22:46:11 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNti-00000002tMU-0JrU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 22:46:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E92987DA4F;
	Tue,  4 Aug 2026 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785883564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nckDj9uSVJQNTLpL7gMUG7fWxQkNwuDaAqk1qZvF4j4=;
	b=x0AosRIKSR9RQJ/0WQ8ntveBL1Mp+/B/0UoRn56gF2/BYDyddU3PG0aYZ5GbpHz8FfIsmw
	u5ZpsOIQOJCqi6b9ATauwZP6ZB4QuM+Noye5R6lNDN7OdW+cAZylwvFPyu8Wlzf831tJTk
	VfQx6h36EOQOpoxOe/cGwoJwsUMbLfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785883564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nckDj9uSVJQNTLpL7gMUG7fWxQkNwuDaAqk1qZvF4j4=;
	b=gfOipscDfoJOE7qgp6Ul1T7E44NulKU8Mijn1B+M0YL4iU76CzP9ikWD6Q7Ka3oyM9stF8
	aIQP/rRXZu36F2CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SzJl2brn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7UMEiAX6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785883560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nckDj9uSVJQNTLpL7gMUG7fWxQkNwuDaAqk1qZvF4j4=;
	b=SzJl2brnfYHL8nVC9+JgU5y+vut0ewd3a5y5YmW5xx35FyavHNG/zGpb6ZPo9dFbgxlrUA
	HzcE17ekovl1NeIpte6T5LvjbYP8EuuQ45kuivVQb2I+7c4xJ2m+aq/vKFcWudatw2gEoz
	2COdbdzrnbkUwHnmkSj0YrqiVp9YSeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785883560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nckDj9uSVJQNTLpL7gMUG7fWxQkNwuDaAqk1qZvF4j4=;
	b=7UMEiAX6oxmjch/6I2znAsZu/lx4lIOyU4WooZVlhDul1cz9dV/R+bo3bo6chwgtwR7vJI
	dCr4jJSEu9jbMIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEF59779BB;
	Tue,  4 Aug 2026 22:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GhelJaZrcmrvJgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 04 Aug 2026 22:45:58 +0000
Date: Tue, 4 Aug 2026 23:45:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 13/20] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <anJm-EDndC8H6xMi@pedro-suse.lan>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-14-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804170503.3513916-14-mark.rutland@arm.com>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,arm.com,kernel.org,gentwo.org,gmail.com,infradead.org,huawei.com,vger.kernel.org,os.amperecomputing.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: E92987DA4F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_154610_266203_C50D0AC5 
X-CRM114-Status: GOOD (  28.88  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2026 at 06:04:56PM +0100, Mark Rutland wrote:
> Currently arm64's this_cpu_*() ops transiently disable preemption in
> order to guarantee that the address generation and memory access(es)
> occur on the same CPU.
> 
> Transiently disabling preemption can be  expensive. When re-enabling
> preemption it is necessary to make a conditional function call to
> preempt_schedule[_notrace]() in order to handle the rare case that the
> task needs to be rescheduled. The potential function call has a number
> of negative effects on code generation (e.g. due to the need to create a
> stack frame and spill registers), and the conditionality can result in
> poor code generation and/or poor branch prediction.
> 
> This patch adds infrastructure for a scheme where this_cpu_*() ops do
> not need to transiently disable preemption, avoiding the negative
> impacts described above. Individual operations will be converted in
> subsequent patches.
> 
> Each operation registers a critical section during which the exception
> return code will adjust the offset and addresses if preemption occurs
> mid-sequence. The critical section is registered/unregistered with a
> small prologue and epilogue which encodes three distinct GPRRs (<pcp>,
> <off>, <addr>) into a new thread_info::pcp_gprs field:
> 
>          // Prologue. Enable fixups for <off> and <addr>.
>          mrs	<tsk>, sp_el0
>          mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
>          strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
>          // Generate cpu-specific address
>          mrs	<off>, TPIDR_ELx
>          add	<addr>, <pcp>, <off>
> 
>          // Perform access sequence
>          ldr	<val>, [<addr>]
> 
>          // Epilogue. Disable fixups
>          strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
> If an exception is taken from within the critical section, the exception
> return code will adjust <off> to be the current CPU's offset, and will
> adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
> <pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
> point during the critical section.
> 
> To ensure that this_cpu_*() operations within exception handlers work
> correctly and do not corrupt state, thread_info::pcpu_gprs is saved
> into a new pt_regs::pcpu_gprs field upon exception entry, and restored
> upon exception return.
> 
> Looking at a simple this_cpu_operation:
> 
> | void outline_this_cpu_add_u64(u64 __percpu *p, u64 v)
> | {
> | 	this_cpu_add(*p, v);
> | }
> 
> Atop v7.2-rc4, with GCC 15.2.0 and defconfig, this is compiled as:
> 
> | <outline_this_cpu_add_u64>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x2, sp_el0
> |        mov     x29, sp
> |        ldr     w3, [x2, #8]
> |        add     w3, w3, #0x1
> |        str     w3, [x2, #8]
> |        mrs     x3, tpidr_el1
> |        add     x0, x0, x3
> | 1:     ldxr    x5, [x0]
> |        add     x5, x5, x1
> |        stxr    w4, x5, [x0]
> |        cbnz    w4, 1b
> |        ldr     x0, [x2, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x2, #8]
> |        cbz     x0, 2f
> |        ldr     x0, [x2, #8]
> |        cbnz    x0, 3f
> | 2:     bl      preempt_schedule_notrace
> | 3:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> With the scheme added in this patch, this can be compiled as:
> 
> | <outline_this_cpu_add_u64>:
> |        mrs     x2, sp_el0
> |        mov     x4, #0xc80     // __VAL_PCPU_GPRS(x0, x4, x3)
> |        strh    w4, [x2, #20]
> |        mrs     x4, tpidr_el1
> |        add     x3, x0, x4
> | 1:     ldxr    x6, [x3]
> |        add     x6, x6, x1
> |        stxr    w5, x6, [x3]
> |        cbnz    w5, 1b
> |        strh    wzr, [x2, #20]
> |        ret

I think I had an Interesting Idea(tm) while reading the per-cpu discussion
in linux-mm. In case the 3 instruction preamble is too expensive:

1) Pass -ffixed-x18 (this natively conflicts with SHADOW_CALL_STACK.
SHADOW_CALL_STACK is already not-optimal codegen wise, so maybe not a big deal).
2) arm64 kernel bits will use x18 as a cheap task flags register
3) #define TASK_KRSEQ     (1 << 0)
4) Switching into the krseq mode is just a matter of toggling the bit in x18, so
	orr x18, x18, #TASK_KRSEQ
a single instruction.
5) Switching off is just a matter of clearing the bit in x18, so:
	and x18, x18, #~TASK_KRSEQ
6) On the preempt side we keep the krseq tables in memory, and do a sort of lookup
(binary search sounds easiest?) on them. But _only_ if x18 TASK_KRSEQ is set.
This penalises unlucky preempts but keeps fast paths maximally fast.
7) entry points of course get to clear it after saving it

The end result would look something like:
| <outline_this_cpu_add_u64>:
|	 orr x18, x18, #TASK_KRSEQ
|        mrs     x4, tpidr_el1
|        add     x3, x0, x4
| 1:     ldxr    x6, [x3]
|        add     x6, x6, x1
|        stxr    w5, x6, [x3]
|        cbnz    w5, 1b
| 2:
|	 and x18, x18, #~TASK_KRSEQ
|        ret
| .pushsection .data.krseq
| .word 1b
| .word 2b
| .word whateverelse
| .popsection

This of course precludes the use of x18 for the compiler, so it would
require careful benchmarking in case it negatively affects codegen too much.
But it avoids any sort of extraneous stores in the fast path.

Other architectures could do similar as long as they have interesting ways of
signaling this using solely the register set.

Anyway, just throwing it out there in case this can actually make a
difference & rings some bells on people smarter than me :)

-- 
Pedro

