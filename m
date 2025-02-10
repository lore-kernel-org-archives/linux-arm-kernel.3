Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6837FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVUBiaoeWeksMfqaUXNGg5STI1bae+8Yqz5cnicePdE=; b=rDy9ZYXsaGm2oQtFd8EK4URp4y
	pRhV0LstzGKYxBNeEwfIpaJO/V09kJIGh1sCwiFK+xEych7+LA0wYnR4ivfQtdlxdnFat6zTH9Rxv
	rI/K69lv2Ph8Pl23LKpKRgGsZIoZoZ2wIEedfJ4e6DsIHKfXff0B/Qf18RL/TiXehkgyX0DXKbTL3
	UvD4NhC2mMJ1PSa/s8GSNYY4yMRvFrEZnm0MiRHl79ErXfARApI36k+v/Wn9G7iXYvzBmJh6EBiyz
	0GHbgk7kU4CShV8uj7OLFv98LbJSGJ88El3vf7OgP5MjAXN11vE6BE3CuVjZ8tQtXbqEv+3BMM0Ei
	qYIWkdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVwa-00000000MRE-38iG;
	Mon, 10 Feb 2025 15:43:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVsJ-00000000LWq-1r3R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:39:08 +0000
Date: Mon, 10 Feb 2025 16:39:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739201945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVUBiaoeWeksMfqaUXNGg5STI1bae+8Yqz5cnicePdE=;
	b=qPV+niytIhYOhSM7bRzAb3GXPXTNY9jj6pj718SCdZX+U5XVSAcgRr1JLZodYs/9TFUSQt
	jTYU6SV2RiLnrzyV2jZDlWgwA+0bquQFo03QwdnTXBDhwoYoe980wGtHj4QxOr06RT4DSt
	8ddXsI2fpEn0ubX+eaF5UTWuqud2TYsdIroRau2Wndbgs7his95TPoNyABloBlr/7Xw/8B
	bDKfEPenzMJSWoeKq9+icGVHgTD7Rkxg33pUjFZJJ/YkgFjPMFLrW73YmrnhMNCOtBBhkp
	QAgElWCt1siSQL7Evu4w9YM3as5CrBCeEYAFvv9c01I61W2gqIxxSA/IPmg7IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739201945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FVUBiaoeWeksMfqaUXNGg5STI1bae+8Yqz5cnicePdE=;
	b=JC0Ek3bSh7t7IktBNjUPgmVDll0jqwdgwkJ2nqdgT6WYgw2HTZbpzp2lOtqAK28AbE3d/0
	9HFPIP14YS4FHwAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] arm: Rely on generic printing of preemption model.
Message-ID: <20250210153902.06VTSS6d@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-4-bigeasy@linutronix.de>
 <20250210120429.iFfBClW1@linutronix.de>
 <Z6oYO5uKlEJ8C8Ne@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6oYO5uKlEJ8C8Ne@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_073907_639178_6A04D6DD 
X-CRM114-Status: GOOD (  11.38  )
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

On 2025-02-10 15:16:11 [+0000], Russell King (Oracle) wrote:
> On Mon, Feb 10, 2025 at 01:04:29PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2025-02-03 15:16:26 [+0100], To linux-kernel@vger.kernel.org wrote:
> > > __die() invokes later __show_regs() -> show_regs_print_info() which
> > > prints the current preemption model.
> > > Remove it from the initial line.
> > > 
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > 
> > Is it okay, to route this via the sched tree?
> 
> Sorry, its not obvious where show_regs_print_info() prints this.
> dump_stack_print_info() itself doesn't directly. print_worker_info()
> doesn't. print_stop_info() doesn't. Not sure whether print_scx_info()
> does.
> 
> Maybe showing example output would help?

Patch 2/9 adds this. [ https://lore.kernel.org/all/20250203141632.440554-3-bigeasy@linutronix.de/ ]

This this applied, die("test") on ARM ends as:

[    1.595106] Kernel panic - not syncing: test
[    1.596044] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.14.0-rc2-00009-gb80a798df08c-dirty #13 PREEMPT 
[    1.596768] Tainted: [W]=WARN
[    1.596946] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
[    1.597407] Call trace: 
[    1.598183]  unwind_backtrace from show_stack+0x10/0x14
[    1.599231]  show_stack from dump_stack_lvl+0x50/0x64
[    1.599492]  dump_stack_lvl from panic+0x114/0x358
[    1.599824]  panic from kernel_init+0x64/0x74
[    1.600048]  kernel_init from ret_from_fork+0x14/0x38
[    1.600349] Exception stack(0xdf829fb0 to 0xdf829ff8)
[    1.600730] 9fa0:                                     00000000 00000000 00000000 00000000
[    1.601102] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.601447] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.603163] ---[ end Kernel panic - not syncing: test ]---

Sebastian

