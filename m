Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E57BC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1K7nMbUzi/PBxssXxktE8rcuXI/mW+uKt+5ZI9cf20=; b=tMIfeTYGX0Rx9hzQf1I+Tr+AbK
	aKvgbfJR5nQp7KXzXtNplDDLt/pj6DukoHmnqd+3F2uraqC1GKm9Mn4HQ9/v3tVtBgqMHhKaHKsBt
	cM3JWdUf7f23BVTmUKCUiNIOGhyT4AHpt6CZ0g9Uxb3bc/81/Arbnj8kOb4VYsHSDk9w4U2IX3+kk
	GrxaX2QRTJXYnidE0F+/HojKNcf+l4mbPVw6PzzqDpRh28VaHQewYyplnHSYPxgQWQ4c/nHPxpMR7
	+8ibEP0wtM7/AICCqMhHA5ne4IEEasdWHSFCalaLuxUq+fOknbrACZ8F455T7hyWGSc465p29ciid
	3ocPjBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBoc-00000007LMG-16Qp;
	Wed, 12 Feb 2025 12:26:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAou-000000079Yk-0vCn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 11:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l1K7nMbUzi/PBxssXxktE8rcuXI/mW+uKt+5ZI9cf20=; b=oy1EPosj6Gw5aoUqX1WS7Oj1p9
	vGwULFPSIMjI/tXYeV2FIifUe8n0ofxw9u4PTBp1AGBL79Yp0+UJjkkMye5ViCVpyCyLiPGV7s2j+
	7uI80UvocUzaogEFMgK2srCqal9Y3h2IOTiDXNhLQvAN0lsIZZlnZ1qYM1jIpw1e02KUWq25uUOCe
	5+RBmqs216pgO0j7SPLktAU3TM79VP1zyjf1L5hi4OgcBiDBxjwZAL86fS1/+EKrcn61JcXtcDHDv
	zaHZ7UJqSs9L1P2V6Sw5Q2hC9FMtcd/erR7WicLxLRJMoi8Si1bjhz4PTxhCXKz/m30f+RArCvfSF
	3AXcCUPA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAor-00000000nj1-0PkZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:22:19 +0000
Date: Wed, 12 Feb 2025 12:21:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739359306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l1K7nMbUzi/PBxssXxktE8rcuXI/mW+uKt+5ZI9cf20=;
	b=ceDbVx9a2RdBxVvts79Y9Gu/Vc6V5J0JakVP5pAar2t8o7SYF6ep8YmxQi972w4iw8ktZS
	vV2u71gzCU3z9HnHr6lwdwBL9EL5n09HtBSe+UvCh9RQ9xKzhEF4ThiP6UOCOmRmTQlmhw
	ypC9G/dB0Tt5OHvR65sKcOgGpVYb02pl0tMyQ2WJTAmp570Oj182j1pklg89PNkVh3fa7n
	uCoND4zNtV3ejqmK0hX+z0C4fjIWHVz7kGs2X9fTC7q/gJNRT3X4bVppjmHDj0ZUOAEUp9
	HrKsDwgBmAksl+EzatchVRqx6xBgN1C1Hxdgq5g4npJpa+Lqp8smPMVDMfjXmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739359306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l1K7nMbUzi/PBxssXxktE8rcuXI/mW+uKt+5ZI9cf20=;
	b=0+RSrdlobtGST3Ru+CGHZnGHLgeRoFN6Vz2ndbWWeKkku0DmygER63VRVMNX1meUQCqR2z
	+1R4wD164XpXF3DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: BUG: debug_exception_enter() disables preemption and may call
 sleeping functions on aarch64 with RT
Message-ID: <20250212112145.BIE8_6T2@linutronix.de>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
 <20250210140657.UAsRw4k8@linutronix.de>
 <Z6vvyKZ5eoAS435b@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6vvyKZ5eoAS435b@uudg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_112217_297033_125C6829 
X-CRM114-Status: GOOD (  12.07  )
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

On 2025-02-11 21:48:08 [-0300], Luis Claudio R. Goncalves wrote:
> > Couldn't you delay sending signals until after the preempt-disable
> > section? 
> 
> Looking at do_debug_exception,
> 
> void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
> 			struct pt_regs *regs)
> {
> 	const struct fault_info *inf = esr_to_debug_fault_info(esr);
> 	unsigned long pc = instruction_pointer(regs);
> 
> 	debug_exception_enter(regs);
> 
> 	if (user_mode(regs) && !is_ttbr0_addr(pc))
> 		arm64_apply_bp_hardening();
> 
> 	if (inf->fn(addr_if_watchpoint, esr, regs)) {
> 		arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
> 	}
> 
> 	debug_exception_exit(regs);
> }
> NOKPROBE_SYMBOL(do_debug_exception);
> 
> 
> Do you mean executing the
> 
> 	arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
> 
> after re-enabling the preemption or do you mean something more
> sophisticated?

single_step_handler() and brk_handler() can both send signals. If
inf->fn returns != 0 (which seems to be only be possible for
brk_handler() out of the possible four callbacks) this this
arm64_notify_die() sends a signal.
So we have three potential signal delivers. It shouldn't matter if the
signal is sent within the preempt-disable section or outside because the
signal will be queued for current and delivered on the return to
userland. So would just need to save the details and do it outside. Now
that I actually looked at the code, this might lead to a bit of a mess
so splitting out the signal part and avoiding the preempt-off part might
better which would be the rework that Mark was talking about.

> Luis

Sebastian

