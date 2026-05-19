Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77847CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyyFJXnTPyRjLPMpk2XoDinyGMjPMCBx9diT0h2w3Cg=; b=HNK3e/1HNscNCs52OXkw4XwBgF
	JlU49/zMAqU1Wu810hoXl5u/0aA+1KWLqSWoleXgn2mB86SHOF+NscjPLqGGF0lHwaoOmKP7JM+25
	ey+1nyJturUHoAz27/iGoTXbER/rtD18XshwTPTX9bFy2pfTdQV7ll9WFSFAM6wtv3Npta8xxYjU1
	5xiOgezwogIPXBjJ8v+QmSTSIHNBUbhynlYCidLfeXC9xYZ7/0Bm4hYUj9kdnFTBPHYWM38Q1JOPN
	EyoD3rm+zyrf0Wj+AG2wWhG0ZHT1EGGoSlFtXlvX5PQOiPTMO55RCjkTxZaN55x5pIGJBApkRb5+o
	ZCg3Qdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIt2-00000001MxI-2dg8;
	Tue, 19 May 2026 11:45:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIt2-00000001Mx4-00x9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27C9B60126;
	Tue, 19 May 2026 11:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839C4C2BCB3;
	Tue, 19 May 2026 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191122;
	bh=kyQLCAJsP3dsEyrzP5zr+3cy9up6mU02JaglQGt7/go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAg/5FotQK1Nz/l1nxM5/9/paWeUlj724qXg9Mhs0peioghMcF3cgw3fMIuQBkzJk
	 BX36+sdaJ0EMh9nakds0uOtriG9q+XjZg1Jryq3KDvgPkNnoevcMRDUx0N6msopn9+
	 M7pFWF+tAUOoexBfqTVuOZNujwSRscuUqJOkmuA5JgXJYv7JGQvjxGugyukIigDbm5
	 ll0Z0yPoj41njBv+4C8BKq9z+VJqpi8CGgnkoQn0QgYOmD36HIPobFinRyYs0EpiBs
	 KV+TdkQLa9YNPAqJpSzbzayqJjthabaD7KCiFMaAQ0qCTKR/MaETF1h80kdnV0WLd2
	 g2mGDrTvKntMw==
Date: Tue, 19 May 2026 12:45:18 +0100
From: Will Deacon <will@kernel.org>
To: David Sauerwein <dssauerw@amazon.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nh-open-source@amazon.com
Subject: Re: [PATCH] arm64: Fix garbled logs caused by race between multiple
 stack traces
Message-ID: <agxNTkDn3U3b_7kK@willie-the-truck>
References: <afse5Ld52p7DmidK@arm.com>
 <20260507123846.35621-1-dssauerw@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507123846.35621-1-dssauerw@amazon.de>
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

On Thu, May 07, 2026 at 12:38:46PM +0000, David Sauerwein wrote:
> On Wed, May 06, 2026 at 11:58:44AM +0100, Catalin Marinas wrote:
> > While the above does solve the line splitting, the trace is still not
> > that readable as we get line interleaving.
> >
> > I wonder whether we could do something like dump_stack_lvl() at the
> > show_regs() level to synchronise the printing. If that works, we
> > wouldn't need the above change (which isn't incorrect but maybe we can
> > do better).
> 
> I think the change is still needed in either case. Other threads can log
> something unrelated to the stack traces which can still cause the
> register lines to be broken. After all, use of pr_cont is discouraged.
> checkpatch.pl warns saying "Avoid logging continuation uses where
> feasible" when adding new callers of pr_cont.
> 
> I agree though that forcing stack traces to be printed sequentially
> would help with readability. Maybe this can be added as a separate
> change.

Presumably it would replace this patch?

Will

