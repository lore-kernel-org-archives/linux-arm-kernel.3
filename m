Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHpr3kU2Kyzq+FWWd9Tmrgihr14sGrAkX0cDERGN3D0=; b=w80YJ1m9itsd0xB5M8yZI60574
	oDaSzBmWNFkcsZ/yn0YnPB57lZ86Xz2I6tScFcR8snXpQa3PiiXFTzkTXzY8y7ne7bT3mXjIYwMl1
	7ZQmQHp8sZOYgAz1Lsiz6xOLDZmezUbNwkdC5ojm4WR4ZQoZlHzGlDfrXhmoIiw3hFai7R6gsyusl
	K9vi9yoJSas0I4jUsVNZ5qEa9fTyWD8Dud3lpCZghOcB5lzvLB0HMZHSVuDe3kTmT1rr0epG7gN8a
	5aUBSII9fIryrUtaiK/FB1TASoq0X9bK2iNKVMOMsxHS7vXdA5M81XQlRTW3bC8bMugDGfIPI1KRA
	S2YRkFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Tf-0000000ECND-20gY;
	Mon, 29 Jun 2026 09:40:31 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Tc-0000000ECLu-42IU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:40:30 +0000
Date: Mon, 29 Jun 2026 11:40:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782726024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHpr3kU2Kyzq+FWWd9Tmrgihr14sGrAkX0cDERGN3D0=;
	b=ZcbHkU1odytBpHc0TNfSt5JjcWQoxaq4AldIzyovc3ZvVTRgLGqZdZxsCtEWde4QHjFMg2
	FlrYESVdTpz7ebD+owIdm6I04YN/KLYUpvSKSiEGvjBETSc8xo7hTM372wd3CYeFZFoRVQ
	ZUpN07Mj7NhArCkldYR+0M++cYdrojQ5JIDAnZvQWBgDPsV6tArHx8EWSGw833j/eatgmF
	p934dFpNVEm6l3ZUbboy9O4dM3Ml16mhPIgnEObqS7fFLZ1tpCzU3MfvHlo8QUB8B+YVuZ
	aCTDibd6VRJdUPyxH3sY+5UTCN783Z1X3BqR2xNmhJVx8ECxNp+T8Ynpb7minw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782726024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EHpr3kU2Kyzq+FWWd9Tmrgihr14sGrAkX0cDERGN3D0=;
	b=Ia2rmsFhD7py3Nm1QViSF9cbQaz1JUbUlmYxAFmBZkf+eZRFR5h/nNwFMBWUrQk1AHBnsN
	JmM7MHkqm7lEl5Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, arnd@arndb.de,
	clrkwllms@kernel.org, liaohua4@huawei.com, lilinjie8@huawei.com,
	linusw@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	rostedt@goodmis.org
Subject: Re: [PATCH] ARM: enable interrupts when arm_notify_die() is handling
 user mode errors
Message-ID: <20260629094022.Ml4PCqsB@linutronix.de>
References: <20260629075726.McX9yWi1@linutronix.de>
 <20260629083150.72460-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629083150.72460-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_024029_167037_B1E423C5 
X-CRM114-Status: UNSURE (   9.95  )
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

On 2026-06-29 16:31:50 [+0800], Xie Yuanbin wrote:
> Thanks. So, can I take it that you agree with the first one?
> 
> On Thu, 25 Jun 2026 20:26:12 +0800, Xie Yuanbin wrote:
> > ```c
> > 	if (!inf->fn(addr, ifsr | FSR_LNX_PF, regs))
> > 		return;
> >
> > 	if (likely(user_mode(regs)))
> > 		local_irq_enable();
> >
> > 	pr_alert("8<--- cut here ---\n");

Yes.
If this is moved to the callers of arm_notify_die() then I don't know
what to do about baddataabort(). It looks like it gets invoked with
disabled interrupts, too but I'm not sure. This looks like pre ARM v7.
Is it reasonable to add such a check there?

Sebastian

