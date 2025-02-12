Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AA8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Fqe4muRO3/Q9bWVR2MXSP0LzyWOW0eku7tRVpawwQs=; b=Ciz+4V2Y/8ETe9dSqXonGQxkFd
	irSmkEQfU1O4PJJs/htDCtwN7QuCy4fmGkMvuhhMrCnTKJ7Mb97Lq/wU5d8VNePNNSLpLcxiK68SG
	Pq1CwA7jdo7k7I7fCqfJtAjOgiNvB2D0AwdGcWlKSd75asgwrOjAW7OpOHwROHVYEM/5vHh0MrAZY
	A3VvseMKE2vvCNPEOVHH2ipS+bHeWRCVTZ0S+ZgkjZ1dfambpIjegYAivp4KCwQNzRhLVinpmsPPY
	3moH8L6VLY4K8s1Ai9IKQmmdXDFLpBhtVvoTtU5GHav5YKObNBuWLdmnrX7MZnNpSgDttsZtEfg54
	5IyDgBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0wo-00000005kmL-28DE;
	Wed, 12 Feb 2025 00:49:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0vN-00000005kS3-3bAZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739321301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Fqe4muRO3/Q9bWVR2MXSP0LzyWOW0eku7tRVpawwQs=;
	b=LQmSQGPgMYlLXeZ6xqPv45TFJSO1VzYR86gG5szHaIuVRWqdPIOm8O1nbpzT1YU9lYF+wC
	Lw943nIzQyBG95nTVcd8AEGoVfO0PavhfrpA+Atn0/Z1MjU3Kjl69cB0WEIWFQ2GnwSepQ
	KcfTDZARDmBW/uzDzFXKeNPQMYIUkh4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-436-HzPjE3uLMvWZ7aieG-qloQ-1; Tue,
 11 Feb 2025 19:48:15 -0500
X-MC-Unique: HzPjE3uLMvWZ7aieG-qloQ-1
X-Mimecast-MFC-AGG-ID: HzPjE3uLMvWZ7aieG-qloQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 179E41800873;
	Wed, 12 Feb 2025 00:48:11 +0000 (UTC)
Received: from localhost (unknown [10.22.89.254])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F272D1800877;
	Wed, 12 Feb 2025 00:48:09 +0000 (UTC)
Date: Tue, 11 Feb 2025 21:48:08 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Message-ID: <Z6vvyKZ5eoAS435b@uudg.org>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
 <20250210140657.UAsRw4k8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210140657.UAsRw4k8@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164821_968898_EEE8BC1F 
X-CRM114-Status: GOOD (  21.58  )
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

On Mon, Feb 10, 2025 at 03:06:57PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-10 12:49:45 [+0000], Mark Rutland wrote:
> > Hi,
> Hi,
> 
> > I don't have an immediate suggestion; I'll need to go think about this
> > for a bit. Unfortunatealy, there are several nested cans of worms here.
> > :/
> > 
> > In theory, we can go split out the EL0 "debug exceptions" into separate
> > handlers, and wouldn't generally need to disable preemption for things
> > like BRK or single-step.
> > 
> > However, it's not immediately clear to me how we could handle
> > watchpoints or breakpoints, since for those preemption/interruption
> > could change the HW state under our feet, and we rely on single-step to
> > skip past the watchpoint/breakpoint after it is handled.
> 
> Couldn't you delay sending signals until after the preempt-disable
> section? 

Looking at do_debug_exception,

void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
			struct pt_regs *regs)
{
	const struct fault_info *inf = esr_to_debug_fault_info(esr);
	unsigned long pc = instruction_pointer(regs);

	debug_exception_enter(regs);

	if (user_mode(regs) && !is_ttbr0_addr(pc))
		arm64_apply_bp_hardening();

	if (inf->fn(addr_if_watchpoint, esr, regs)) {
		arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
	}

	debug_exception_exit(regs);
}
NOKPROBE_SYMBOL(do_debug_exception);


Do you mean executing the

	arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);

after re-enabling the preemption or do you mean something more
sophisticated?

Luis


> > That, and last I looked reworking this we'd need to do a larger rework
> > to split out those "debug exceptions" because of that way that currently
> > bounces through the fault handling ligic in arch/arm64/mm/.
> >
> > Mark.
> 
> Sebastian
> 
---end quoted text---


