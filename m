Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A5EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSNL2AXH/Dczo4xu2+JV7WgXX2jENwO9NH+lZ44ezFY=; b=UxrOsF8y0kQkWlI8HAavNFd/Ic
	rHxe/38nr3BTpznablh5CV/ZU90FG2N8umZcGReQMfdEJ3+s8RWr8fz2W/irvGueFnJ997nc1+4DU
	R256ORwcC8z7eqpwUQ+AIaLhS0XktPD8k/bwnJCw8zM+ZAtCq6NLs5KaV8ar05LtsUAhZSXgwKlBK
	ZHJrB+GEsY3sVpJk5YvCJPBSVNoq892EguEYa8HIgfLvSkqMEj1ixtBPuN4807WuWso6PG19jvHRk
	hK9Dq7OQpMzR89vE7tYnDcCLDOiVIgWP+33MSQfwq0dQfoT5dQ5SM6r+ThpIirwC4TOWZFQJIs+U8
	ojMMxw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaI8-0000000FUJj-0hAV;
	Thu, 29 May 2025 10:15:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaDz-0000000FU24-3p7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FE85A4F698;
	Thu, 29 May 2025 10:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977CCC4CEE7;
	Thu, 29 May 2025 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748513458;
	bh=ZCiTedGE/LXzKcDcwDN8asxFxHjp6L7tYc/sXa+Cf5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7P68F16+x2CiqG+0XdNC6Nl6BFoOZ4wU6fCypJz9okpufRbxl9Tbjh5duKAIWK20
	 qtVO7JNTqGl8Qj7hpjSP6sTwdu0EhhgQC2kh7DwDgvV5XJTy6QWq93048G275L+CH6
	 OqWhMRNtcqMuTDen0ctSJGQSrYbRJ5Be2I1ZjIIbBQrhEdup9Fg56I2N1YANKw6rJD
	 lvUr6VEqoZwzi62CGHqWG5Kg2JKasGzoQ0x9ZTXjDNzm5r7aHD3JESAqD2uJC2ETkc
	 TJHqP9tbvbwx/JLSGT3zWXE4ruW8eG+nA0RSdgf/0+hHcxgQStT4u/MLJN9wOLGrgo
	 NZqwQcxPG7ztA==
Date: Thu, 29 May 2025 11:10:54 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 07/11] arm64: debug: split single stepping exception
 entry
Message-ID: <20250529101053.GA29082@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-8-ada.coupriediaz@arm.com>
 <20250520162913.GA19155@willie-the-truck>
 <aDcqHaQx6favgsoK@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDcqHaQx6favgsoK@J2N7QTR9R3.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_031100_025680_CA2CA776 
X-CRM114-Status: GOOD (  17.97  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 28, 2025 at 04:22:05PM +0100, Mark Rutland wrote:
> On Tue, May 20, 2025 at 05:29:14PM +0100, Will Deacon wrote:
> > On Mon, May 12, 2025 at 06:43:22PM +0100, Ada Couprie Diaz wrote:
> > > +	enter_from_user_mode(regs);
> > > +	/*
> > > +	 * After handling a breakpoint, we suspend the breakpoint
> > > +	 * and use single-step to move to the next instruction.
> > > +	 * If we have a suspended breakpoint there's nothing more to do:
> > > +	 * complete the single-step.
> > > +	 */
> > > +	if (reinstall_suspended_bps(regs)) {
> > > +		local_daif_restore(DAIF_PROCCTX);
> > > +		do_softstep(esr, regs);
> > > +	}
> > > +	exit_to_user_mode(regs);
> > 
> > I quite like the look of this now, but perhaps we could rename
> > reinstall_suspended_bps() and change the return value to make things a
> > bit more readable? For example, 'if (!stepped_suspended_breakpt(regs))'
> > or something like that? What do you think?
> 
> How about:
> 
> 	if (!try_step_suspended_breakpoints(regs))
> 
> ... that'd match the naming in do_el0_undef() and do_el1_undef() in
> traps.c, where we have try_${HANDLE_POTENTIAL_CASE}() for a few cases,
> e.g.

That's even better, thanks.

Will

