Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0682C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/76Ws4ERHAARzCBmx64U4hnYZV3XD1o/uZgQrN85Wk=; b=lfF17OsGJfbzXB8OrnzB7lH/c/
	lWJ1tNA8jDptDZnHFRhnGgvn5fDeK3f2iLjGCtiI6Gax8HwnYrsZKKz7x7IN3nJYU+AOUQp4t3mXa
	j0Eh+h3kyz7XXs7aENf+X0oLLPSNoOv86pzKOwRn1JMOlxU/aYqgd3bEswozLe9RU7aCYwh45tzeH
	lBWLJLPF5M6pMCSCcdckkE3oAEA0ilMGfq7JA9OSoXnQB8NV6L42h3jtwyIKvUi9SFuss2Xa0Lykd
	ErC4qHw+v4KFUPOfxKOWOL7fE+0fdykSQc1vq9HI+BuwIDMY5wVjZnTgRipqAGJMyCUFUNnykKo08
	FBrJyEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjJ-0000000HMxK-3IQq;
	Mon, 10 Feb 2025 12:17:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSWg-0000000HL79-0xB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:04:35 +0000
Date: Mon, 10 Feb 2025 13:04:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739189070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/76Ws4ERHAARzCBmx64U4hnYZV3XD1o/uZgQrN85Wk=;
	b=eRxBpw6tTNK+3wdWCDDXRd/r/TMjr/nC/Cl5NEiPTnG6nse+s4Gq4CZoZjEzkUTv8OHZLq
	LWfx1iwUY5ZnLI0eMuSkzeCjoVXHUoDUTzNQYGR0IDW9YI3BpGsfaM0Issm8OV65TvOhiM
	KHni0YhZgZq4ulcElRNirluZ/Bf1JGBbf0N73fJWs+e4Bq1X5S1kGdEDa6tkunKvMPYSk6
	vTsI0/hRG46duY8L0hYUd6Sn9WbBFThQIEHXKVH7PXzeXGmfnf7ytOdNj0EGwiEpOiPnsa
	wDPBzZTluKowBHJt7OGMh63dIRkLtfyvUjQJIQ3M84zqix23mcz36+zHJLjNEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739189070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/76Ws4ERHAARzCBmx64U4hnYZV3XD1o/uZgQrN85Wk=;
	b=k9jYSm56kYwwgyUEJOl82G5qVa0iKZBIItuPJdvfx6wfac2vZ8L/6bQpq+SAEmKRrMJGm8
	Oxp7Ql/3EAcwPTCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>
Cc: Ben Segall <bsegall@google.com>,
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
Message-ID: <20250210120429.iFfBClW1@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-4-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203141632.440554-4-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_040434_407571_AFC3D7A3 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
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

On 2025-02-03 15:16:26 [+0100], To linux-kernel@vger.kernel.org wrote:
> __die() invokes later __show_regs() -> show_regs_print_info() which
> prints the current preemption model.
> Remove it from the initial line.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Is it okay, to route this via the sched tree?

Sebastian

