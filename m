Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B31FF60D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRzQ001/0Pq8JokfofvbOrXrS0BTW6Otv5/ii6ct4x8=; b=2egugycGybI7drB7CD8W4owbzO
	66SXGLSVqf6egJpkhIWfon4ivMJKCPdELv0tEf7ntJUs5jpjpt6NBcFzLrEQSXmTFSmA220lwrQWD
	rM/jOXMa62d20kk3EEz+AWjUZMnO9ryStTYo2GSTDzRewQebWnieHGLCjK+SfKZ+jvrJFJR2su+Fn
	t/ZV/wTDX7oEbqqpno2o9A4tqd4Y3Cnz0xIZP0DvviFlatDrCf6eE9mBLIjaqZuO4dmrm12Qt4G3T
	aQpXLb/vu1vW42B7lrIYX7C4BxWwcXEJY0IUitnlpwotVlNjffQtB20xlkNQ7HWk+62Eknz3Al0p/
	X07SnWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sxq-0000000CPaS-2Rw6;
	Tue, 31 Mar 2026 06:52:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sxo-0000000CPZs-03aw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:52:37 +0000
Date: Tue, 31 Mar 2026 08:52:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774939951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRzQ001/0Pq8JokfofvbOrXrS0BTW6Otv5/ii6ct4x8=;
	b=zGE6Qx0t5BOuaQRBixJXmPd0DBbU8naeSDpdf7tTFjXhYQap+ieX/wG+1k2oN6haQPR+Hs
	4ZOMrLu83pXoh4wy5WYUVmt0ZJyvN5t2IFBsbBo1ZmACmzCx54ecT2nwqNthYp1uMxoXoy
	AESzHojwKHIRaOommS5ptvAc0annBgquVaX3XTO+JJ/NBndJ3sfVVqg2eGQLr/bsKuUbbh
	nURU48tF6tP5VewVSOpA82mU0QWj46LYSnz1LhOK/gzwVPS3418rjlyHwdEpnuRyjFaCPa
	Z7PWYrmDDnT03dknqKP9ht6Iw0KttUOjNkLkA+fIzFqEph8f4mQNtEtL87Fxog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774939951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WRzQ001/0Pq8JokfofvbOrXrS0BTW6Otv5/ii6ct4x8=;
	b=A/UUV+K/GMIh5FeKetNWjeJM4ncVqapfloWDDmVe6jFvEqEQS7lfa53Kh3X3wXTkd1Ycin
	pQm1MGa3S7FB33AQ==
From: "bigeasy@linutronix.de" <bigeasy@linutronix.de>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"keithpac@amazon.com" <keithpac@amazon.com>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [PATCH 1/1] arm: get task_stack reference before
 dump_backtrace
Message-ID: <20260331065230.9T3e_rt-@linutronix.de>
References: <aa4Lo30Nq_t7qDqK@shell.armlinux.org.uk>
 <20260305070527.719073-1-maninder1.s@samsung.com>
 <CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcms5p5>
 <20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309055328epcms5p56d16f6cb1e3a5295987c935f35be1d2e@epcms5p5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_235236_193939_F31D5357 
X-CRM114-Status: GOOD (  13.15  )
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

On 2026-03-09 11:23:28 [+0530], Maninder Singh wrote:
> Hi,
Hi,

> >"otherwise if someone calls show_stack() for task" ... and the stack
> >trace given stops at show_stack() and doesn't show the "someone".
> >
> >I'd like to know _how_ this happens, and why ARM64 and now 32-bit ARM
> >are different from x86.
> 
> I tried to simulate same thing on x86_64, it is also crashing.
> 
> Just a dummy code to save task_struct to reproduce the race:
> 
> +       rcu_read_lock();
> +       for_each_process(p) {
> +               if (!strcmp(p->comm, "sleep")) {
> +                       check_task = p;
> +                       get_task_struct(p);
> +                       pr_emerg("get done for %s %d\n", p->comm, p->pid);
> +               }
> +       }
> +       rcu_read_unlock();
> 
> // in mean time here sleep binary will be exited.
> 
> +       show_stack(check_task,  NULL, KERN_EMERG);

The task's stack is released on its final schedule() invocation.
Therefore holding task_struct does not hold the stack of the task if it
is separated out of task_struct and can be gone if the tasks quits.

Therefore holding a reference to the stack while accessing it, like
during a backtrace, makes sense and is required if the task is not
current.

Let me add this to my list and tackle it later today for x86. Then we
get probably Russell on board for ARM.

> //OOPs

Sebastian

