Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55801606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jTlmXmCD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmewaUMw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x66U5C/iSZTncRHHJDJAZlR5pyUwqAkX43Fg0MqJDS8=; b=jTlmXmCDDmz7y6sNFlTSpPusMQ
	W0Cx1QqMmzFRAYz3hkQRNUtB+H49ckHBeF9x5Q5wux/QKqTyeQwiZPDc04d2gl2LZDIL7NJi4ZRQx
	JOJyuOcoF2pBxqgnIvNHD3dd4m9Nb2OY6fFsB1fhn3F2ecwwHxedJyH3HORAoBDJG6eJs4KnhiAvU
	atbyxvy8ZBxKfR8ZGFkLjTcJrc+hFJFBznDdeihrZCX7uQSd++ingIwHr82hNwa7zT3f/XijzzGla
	l5wqgZ8aqJJnhlK+2thK3zFO8GTdtFr01eH+DBJrfhYAbQyPemj/0oM7kBX/lE6gGnir/8x62aaah
	JZZq4u7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlBL-0000000Bbqa-3TvQ;
	Fri, 30 Oct 2026 11:54:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlBK-0000000BbqC-0j8j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 646E040D92;
	Fri, 30 Oct 2026 11:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA4A1F000C1;
	Fri, 30 Oct 2026 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361241;
	bh=x66U5C/iSZTncRHHJDJAZlR5pyUwqAkX43Fg0MqJDS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YmewaUMwDzmy19jdhXhLRkKl+deMfF+KWQqzJ4T9zugHj///0cKWAp6XojHFKeKU7
	 0aL9VoOt1qRnZarJoO0h6AhKMddH4ZdWT8LD8yU/luTg1uDF3ApFVAJ7aZ/Rt2A3h1
	 oGRgNmnoNJkRcwMqjm3Pgbqg59LEIag8vSys1ZTJ9XNxls1vj3S5KXkzLjNR4Bxnf1
	 0VzL5OZihg2DA/8hHKzs2ufEycIAZpOQzM8qRdNmms3Q2YIq9eK207EhKXyZseq5Ow
	 /CS5axDrR4pztItYowByjTUdE36LcWofyLFqA25aKp7WxJ0pS+V8KGMYxuzu/So3ve
	 KNo7lfWDnZA3Q==
Date: Fri, 30 Oct 2026 11:53:56 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auSFVKVuGryqTgjG@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auR0kSCYyo31Inxf@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 03:46:03AM -0700, Breno Leitao wrote:
> Hello Will,
> 
> On Fri, Oct 30, 2026 at 10:28:04AM +0000, Will Deacon wrote:
> > On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> > > On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > > > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > > > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > > > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > > > extra alocation and possible performance penalties.
> > > > 
> > > > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > > > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > > > page kernels are unchanged.
> > > > 
> > > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > > ---
> > > > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > > > stack usage, and I found that this might be an small optimization!?
> > > > ---
> > > >  arch/arm64/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index 5f2db2cecf9772..b73371327d2a47 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -111,7 +111,7 @@ config ARM64
> > > >  	select CLONE_BACKWARDS
> > > >  	select COMMON_CLK
> > > >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > > > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > > > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> > > 
> > > Does this one sound sane?
> > 
> > It doesn't make an awful lot of sense to me, to be honest. The page size
> > and the number of CPUs are two independent variables, so tying them
> > together like this looks a little odd.
> 
> Sure, but with 64K pages the kernel stack is _huge_. Why do we still
> need to keep the cpumask off the stack frame in that case?

Because you might have thousands of CPUs? Because copying these things by
value could be expensive?

Will

