Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D30AD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMVdYA/3guCQa8Dbcxiyq1tWLucTmHSWlYOeBpszAjE=; b=2j++Rph9Jn2RWodcYwhSDryEU8
	4CgcfjRr/bX+YKvPPk1PkaMrolj4iQ+/PRP58HVaEzDDRQfrR3dmhiyJYhj1hexBgVuTZzx0ixX5q
	cxSPkZYFZgBU2v2RpNRf8qwPwIlURIgnD3LhCoj/wQfqDbM3xv3uVqJr3Y8QJj5Gh1AHAaQLpSRcS
	ERiOl28fbYqxmMV4CCLqJRrV4Um1/jqRGzDlV6SDLmwpdErEmQssY3kI26Ahrl8GlVru5TfEIOSO4
	8xfga1iL44UiO+Ey1nqbMbCNtd5ZqHg4FNu0uLI1twfzhKSW+EkYHJ2ZTToTiga1X/jHXnLdJqDCE
	b+TJw9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veyBR-00000004MZi-2njW;
	Sun, 11 Jan 2026 16:20:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veyBQ-00000004MZB-1SvV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 16:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 124196020E;
	Sun, 11 Jan 2026 16:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3493C4CEF7;
	Sun, 11 Jan 2026 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768148449;
	bh=XxASkA9n76GnwdXuy4myQ5dyLLeDuGEtOKbjql8OspE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WI7bynz5q61zhbhcxgLoZgd735Qm/pJNbIxIV6+NNY3x2kTRnlHiFMUbmLEayjxq1
	 yWVOHyHZjv8Pl4e1cwdFgcfFddfw6n0xvOnqJyleyW/500rO8uAUH+VyB5fmRpxmdV
	 HnPBZyNHF+UqiOUxFDj/g+N1rf+k9gVtH2Hg9R2tDrTM3aCTLcWrw+bi7JNU7SSgJz
	 2GZH9JGLIuf/5hkcm/BZuC+ipi+gXUp+1aOc58IE2dkklwrgTokLMwqBRuJmk7S9T/
	 IdwcvOrAMsz0eKBHbRt2xLQfMun//6P6432sG637lpF+oChtvkkrvioKSqTfEuG+xq
	 xypiuRQ1P3eww==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
In-Reply-To: <86v7h8l9ht.wl-maz@kernel.org>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
Date: Sun, 11 Jan 2026 17:20:45 +0100
Message-ID: <87pl7gglya.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, Jan 11 2026 at 10:38, Marc Zyngier wrote:
> On Sun, 11 Jan 2026 09:39:07 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> 
>> On Fri, Jan 09 2026 at 16:13, Marc Zyngier wrote:
>> > On Thu, 08 Jan 2026 22:11:33 +0000,
>> > Thomas Gleixner <tglx@kernel.org> wrote:
>> >> At the point where a CPU is brought up, the topology should be known
>> >> already, which means this can be allocated on the control CPU _before_
>> >> the new CPU comes up, no?
>> >
>> > No. Each CPU finds *itself* in the forest of redistributors, and from
>> > there tries to find whether it has some shared resource with a CPU
>> > that has booted before it. That's because firmware is absolutely awful
>> > and can't present a consistent view of the system.
>> 
>> Groan....
>>
>> > Anyway, I expect it could be solved by moving this part of the init to
>> > an ONLINE HP callback.
>> 
>> Which needs to be before CPUHP_AP_IRQ_AFFINITY_ONLINE, but even that
>> might be to late because there are callbacks in the STARTING section,
>> i.e. timer, perf, which might rely on interrupts being accessible.
>
> Nah. This stuff is only for direct injection of vLPIs into guests, so
> as long as this is done before we can schedule a vcpu on this physical
> CPU, we're good. No physical interrupt is concerned with this code.

That's fine then. vCPUs are considered "user-space" tasks and can't be
scheduled before CPUHP_AP_ACTIVE sets the CPU active for the scheduler.

Thanks,

        tglx

